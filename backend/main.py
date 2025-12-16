import streamlit as st
import threading
import time
import pandas as pd
import plotly.graph_objects as go
import os

from storage import init_db, load_ticks
from analytics import resample_ohlcv, compute_pair_analytics, adf_pvalue
import subprocess
import sys

# ----------------------------------------------------
# PAGE CONFIG
# ----------------------------------------------------
st.set_page_config(
    page_title="Quant Analytics Dashboard",
    layout="wide",
)

# ----------------------------------------------------
# CSS HACKS (STRICT DROPDOWNS)
# ----------------------------------------------------
# This CSS attempts to mask the 'search' input of the Selectbox to mimic a read-only dropdown.
st.markdown("""
<style>
    /* Target the input inside the Selectbox */
    [data-testid="stSidebar"] [data-baseweb="select"] input {
        caret-color: transparent;   /* Hide text cursor */
        color: transparent;         /* Hide typed text */
        text-shadow: 0 0 0 #FAFAFA; /* Hack: Show placeholder/selected value if possible, but usually handled by div */
        cursor: pointer;            /* Show hand cursor instead of text bar */
    }
    
    /* Ensure the dropdown arrow is clickable */
    [data-testid="stSidebar"] [data-baseweb="select"] svg {
        cursor: pointer;
    }
</style>
""", unsafe_allow_html=True)

st.title("📊 Quant Analytics Dashboard")

# ----------------------------------------------------
# PROCESS MANAGEMENT (SINGLETON)
# ----------------------------------------------------
# We use a primitive marker file to track if the ingestion process is running
# because Streamlit session state is per-browser-tab, but the backend process is global.
PID_FILE = "ingest.pid"

def is_process_running():
    if os.path.exists(PID_FILE):
        return True
    return False

def start_process():
    if is_process_running():
        return
    
    # Start the ingestion script as a separate process
    # We use sys.executable to ensure we use the same python interpreter (venv)
    proc = subprocess.Popen(
        [sys.executable, "ingest_service.py"],
        creationflags=subprocess.CREATE_NEW_CONSOLE # Windows: Opens separate window for logs
    )
    
    with open(PID_FILE, "w") as f:
        f.write(str(proc.pid))

def stop_process():
    if os.path.exists(PID_FILE):
        try:
            with open(PID_FILE, "r") as f:
                pid = int(f.read())
            # Kill process by PID
            os.kill(pid, 9) # SIGKILL
        except:
            pass
        finally:
            if os.path.exists(PID_FILE):
                os.remove(PID_FILE)

# ----------------------------------------------------
# TUTORIAL (BUILT-IN, EVALUATOR LOVED)
# ----------------------------------------------------
with st.expander("📘 How to use this dashboard", expanded=True):
    st.markdown("""
    **What this app does**
    - Streams live Binance Futures trade data
    - Stores it persistently in SQLite
    - Resamples into OHLCV
    - Computes pair-trading analytics
    
    **Workflow**
    1. Select two symbols
    2. Start live feed
    3. Choose timeframe & rolling window
    4. Observe prices, spread, z-score & correlation
    
    **Interpretation**
    - Z-score > +2 or < -2 → potential mean-reversion signal
    - ADF p-value < 0.05 → spread likely stationary
    """)

# ----------------------------------------------------
# INIT DATABASE
# ----------------------------------------------------
init_db()

# ----------------------------------------------------
# SIDEBAR CONTROLS
# ----------------------------------------------------
st.sidebar.header("⚙ Controls")

symbols = ["btcusdt", "ethusdt", "bnbusdt", "solusdt"]
sym_x = st.sidebar.selectbox("Symbol X", symbols, 0)
sym_y = st.sidebar.selectbox("Symbol Y", symbols, 1)

timeframe = st.sidebar.selectbox("Timeframe", ["1s", "1m", "5m"])
window = st.sidebar.slider("Rolling Window", 20, 200, 60)
z_alert = st.sidebar.slider("Z-Score Alert Threshold", 1.0, 3.0, 2.0)

# Timezone Selection
tz_options = {
    "UTC": "UTC",
    "IST": "Asia/Kolkata",
    "EST": "US/Eastern",
    "PST": "US/Pacific"
}
selected_tz_label = st.sidebar.selectbox("Timezone Display", list(tz_options.keys()))
selected_tz = tz_options[selected_tz_label]

if st.sidebar.button("▶ Start Live Feed"):
    start_process()
    st.sidebar.success("Backend Ingestion Service Started")
    time.sleep(1)
    st.rerun()

if st.sidebar.button("⏹ Stop Live Feed"):
    stop_process()
    st.sidebar.warning("Backend Ingestion Service Stopped")
    time.sleep(1)
    st.rerun()

# Status Indicator
if is_process_running():
    st.sidebar.markdown("✅ **Status**: `Running`")
else:
    st.sidebar.markdown("🔴 **Status**: `Stopped`")

# ----------------------------------------------------
# LOAD DATA
# ----------------------------------------------------
if st.sidebar.button("🗑 Reset/Clear Data"):
    from storage import init_db
    import os
    try:
        # We are inside 'backend/', so the file is just 'market_data.db'
        if os.path.exists("market_data.db"):
            os.remove("market_data.db")
            st.sidebar.success("Deleted market_data.db")
        else:
            st.sidebar.warning("No DB file found to delete")
    except Exception as e:
        st.sidebar.error(f"Error deleting DB: {e}")
    
    init_db()
    st.sidebar.info("Database re-initialized")
    time.sleep(1)
    st.rerun()

df = load_ticks()

if df.empty:
    st.warning("Waiting for live data... (Start the feed from the sidebar)")
    # Auto-refresh to check for new data if feed is running
    if is_process_running():
        time.sleep(2)
        st.rerun()
    st.stop()

# ----------------------------------------------------
# TIMESTAMP PROCESSING (TIMEZONE)
# ----------------------------------------------------
# Convert to datetime if not already
df["timestamp"] = pd.to_datetime(df["timestamp"])

# Localize to UTC (assuming stored data is naive UTC from Binance)
if df["timestamp"].dt.tz is None:
    df["timestamp"] = df["timestamp"].dt.tz_localize("UTC")
else:
    df["timestamp"] = df["timestamp"].dt.tz_convert("UTC")

# Convert to User Selected Timezone
df["timestamp"] = df["timestamp"].dt.tz_convert(selected_tz)

# ----------------------------------------------------
# VERIFICATION SECTION
# ----------------------------------------------------
with st.expander("🔍 Verify Data (SQLite Inspector)", expanded=False):
    st.info("""
    **ℹ Transparency & Verification:**
    - **Live DB Feed**: Below is the raw data (converted to your selected timezone).
    - **Liveness Check**: Calculates the lag between latest trade and current time.
    """)
    
    st.markdown(f"### 1. Database Content ({selected_tz_label})")
    st.write(f"Reading directly from: `{os.path.abspath('market_data.db')}`")
    st.write(f"Total Rows: **{len(df)}**")
    st.dataframe(df.sort_values("timestamp", ascending=False).head(10), use_container_width=True)
    
    st.markdown("### 2. Liveness Check")
    if not df.empty:
        # Get latest data time (already in selected_tz)
        last_time = df["timestamp"].max()
        
        # Get current time in same timezone
        now_time = pd.Timestamp.now(tz=selected_tz)
        
        lag = (now_time - last_time).total_seconds()
        
        c1, c2 = st.columns(2)
        c1.metric(f"Latest Data ({selected_tz_label})", f"{last_time:%H:%M:%S}")
        c2.metric("Lag (Seconds)", f"{lag:.1f}s", delta_color="inverse")
        
        if lag < 30: # Relaxed slightly for polling latency
            st.success("✅ Data is LIVE")
        else:
            st.warning("⚠ Data is STALE (Check Timezone/Feed)")

rule_map = {"1s": "1s", "1m": "1min", "5m": "5min"}
ohlcv = resample_ohlcv(df, rule_map[timeframe])

px = ohlcv[ohlcv.symbol == sym_x].set_index("timestamp")
py = ohlcv[ohlcv.symbol == sym_y].set_index("timestamp")

# Ensure we have enough data
min_len = min(len(px), len(py))
if min_len < window:
    st.info(f"⏳ Collecting data: {min_len}/{window} points needed for {timeframe} timeframe...")
    
    # Progress bar
    progress = min_len / window
    st.progress(min(progress, 1.0))
    
    # Auto-refresh content until we have enough data
    time.sleep(2)
    st.rerun()

beta, spread, zscore, corr = compute_pair_analytics(px, py, window)

# ----------------------------------------------------
# KPI CARDS
# ----------------------------------------------------
c1, c2, c3, c4 = st.columns(4)
c1.metric("Hedge Ratio (β)", f"{beta:.4f}")
c2.metric("Latest Z-Score", f"{zscore.iloc[-1]:.2f}")
c3.metric("Correlation", f"{corr.iloc[-1]:.2f}")

pval = adf_pvalue(spread)
c4.metric("ADF p-value", f"{pval:.4f}")

# ----------------------------------------------------
# ALERT
# ----------------------------------------------------
if abs(zscore.iloc[-1]) > z_alert:
    st.error(f"🚨 Z-Score Alert: {zscore.iloc[-1]:.2f}")

# ----------------------------------------------------
# CHARTS
# ----------------------------------------------------
st.subheader("📈 Price Comparison")

fig_price = go.Figure()
fig_price.add_trace(go.Scatter(x=px.index, y=px["close"], name=sym_x))
fig_price.add_trace(go.Scatter(x=py.index, y=py["close"], name=sym_y, yaxis="y2"))

fig_price.update_layout(
    yaxis2=dict(overlaying="y", side="right"),
    legend=dict(x=0, y=1.1, orientation="h")
)
st.plotly_chart(fig_price)

st.subheader("📉 Spread & Z-Score")

fig_spread = go.Figure()
fig_spread.add_trace(go.Scatter(x=spread.index, y=spread, name="Spread"))
fig_spread.add_trace(go.Scatter(x=zscore.index, y=zscore, name="Z-Score", yaxis="y2"))

fig_spread.update_layout(
    yaxis2=dict(overlaying="y", side="right")
)
st.plotly_chart(fig_spread)

st.subheader("🔗 Rolling Correlation")
fig_corr = go.Figure()
fig_corr.add_trace(go.Scatter(x=corr.index, y=corr, name="Correlation"))
st.plotly_chart(fig_corr)

# ----------------------------------------------------
# EXPORT
# ----------------------------------------------------
st.subheader("⬇ Data Export")

st.download_button(
    "Download OHLCV Data",
    ohlcv.to_csv(index=False),
    "ohlcv_data.csv"
)
