Real-Time Binance Futures Quant Analytics Dashboard
Overview

This project is a real-time quantitative analytics dashboard built to demonstrate an end-to-end trading analytics workflow — from live market data ingestion to sampling, statistical analysis, alerting, and interactive visualization.

The app is built with a modular design that keeps things clean and easy to maintain, even though it runs as a single local app for now.

Initially I tried storing everything in CSV files, but that got messy fast. SQLite was a much better fit for this prototype.

Key Capabilities

Live Binance Futures tick data ingestion

Support for external data ingestion (HTML WebSocket NDJSON output & OHLC CSV)

Time-based sampling (1s / 1m / 5m) with proper OHLCV aggregation

Core quantitative analytics:

OLS hedge ratio

Spread computation

Rolling z-score

Augmented Dickey-Fuller (ADF) stationarity test

Rolling correlation

Near real-time analytics updates

Rule-based alerting (z-score threshold)

Fully interactive Plotly visualizations

Data export for raw ticks and processed analytics

Architecture Overview
The application follows a clean, modular logical architecture, even though it runs as a single local app:

Binance Futures WebSocket -> Tick Ingestion Layer -> In-Memory Storage (Pandas) -> Sampling & Analytics Engine -> Streamlit Interactive Dashboard -> Alerts & Data Export

## Design Decisions & Trade-offs

### Storage: SQLite
**Rationale:** Zero-configuration, lightweight, perfect for single-user prototype.  
**Trade-off:** Not optimized for high-frequency concurrent writes.  
**Production Alternative:** PostgreSQL with TimescaleDB extension for time-series optimization, or InfluxDB for pure time-series workloads.

### Frontend: Streamlit
**Rationale:** Rapid prototyping (1-day constraint), built-in reactivity, Python-native.  
**Trade-off:** Less customization than FastAPI + React, limited styling control.  
**Production Alternative:** FastAPI backend + React frontend for better separation, WebSocket support, and UI control.

### In-Memory Processing
**Rationale:** Simple, fast for prototype scale (<100k ticks), no cache management.  
**Trade-off:** Limited by RAM, no persistence of computed analytics.  
**Production Alternative:** Redis for tick buffer + computed analytics cache, separate worker processes.

### Scaling Considerations

**Current System Bottlenecks:**
1. **Single WebSocket Connection:** Limited to ~100 symbols before message rate overwhelms parser
2. **Synchronous Analytics:** Heavy computations (large rolling windows) block main thread
3. **SQLite Write Lock:** Concurrent writes from multiple sources would cause contention
4. **No Horizontal Scaling:** Single process cannot distribute load

**Production Mitigation Strategies:**
1. **Multiple WebSocket Clients:** Deploy behind load balancer, shard symbols across connections
2. **Async Analytics Workers:** Use Celery/RQ with Redis queue for heavy computations
3. **Database Sharding:** Time-based partitioning (e.g., daily tables), read replicas
4. **Caching Layer:** Redis for frequently accessed analytics (latest z-scores, correlations)
5. **Monitoring:** Prometheus + Grafana for latency tracking, alert on degradation

## Design Principles

Separation of concerns: ingestion, storage, analytics, and visualization are clearly isolated

Clarity over complexity: no unnecessary frameworks or infrastructure

Extensibility: new data sources, analytics, or visual modules can be added with minimal refactoring

Trader-centric thinking: analytics chosen for practical trading relevance

Data Ingestion
1. Live Binance Futures WebSocket

Connects to Binance Futures trade streams

Parses tick-level data:

timestamp

symbol

price

quantity

Data is buffered continuously in memory using Pandas

2. HTML WebSocket Tool (Provided Reference)

The provided HTML file acts as a raw data producer.

This application explicitly supports ingestion of the HTML tool’s NDJSON output, using the same schema:

{
  "symbol": "btcusdt",
  "ts": "2024-01-01T10:00:00.000Z",
  "price": 42000.5,
  "size": 0.01
}


This ensures full compliance with the assignment requirement to “ingest this stream”.

3. OHLC CSV Upload

Users may upload OHLC data directly.
This allows analytics to run without any dummy data and supports offline or historical analysis.

Sampling & Data Handling

Tick data is resampled using true OHLCV aggregation:

Open – first trade price in interval

High – max trade price

Low – min trade price

Close – last trade price

Volume – sum of quantities

Supported sampling intervals:

1 second

1 minute

5 minutes

This aligns with industry-standard market data handling practices.

Quantitative Analytics
1. Hedge Ratio (OLS Regression)

An Ordinary Least Squares regression is used to estimate the hedge ratio between two assets:

𝑌
=
𝛽
𝑋
+
𝜖
Y=βX+ϵ

The slope coefficient (β) represents the hedge ratio.

2. Spread
Spread
=
𝑌
−
𝛽
𝑋
Spread=Y−βX

Used as the base signal for mean-reversion analysis.

3. Rolling Z-Score
𝑍
=
𝑆
𝑝
𝑟
𝑒
𝑎
𝑑
−
𝜇
𝜎
Z=
σ
Spread−μ
	​


Computed using a rolling window, allowing normalization of the spread and real-time signal generation.

4. Augmented Dickey-Fuller (ADF) Test

The ADF test checks whether the spread is stationary:

p < 0.05 → likely mean-reverting

p ≥ 0.05 → non-stationary

Triggered manually from the UI to avoid misuse on insufficient data.

5. Rolling Correlation

A rolling Pearson correlation is computed to monitor co-movement stability between the selected assets.

Live Analytics & Update Strategy

Tick-level data updates continuously

Resampled analytics update at their respective frequencies

Z-score and alerts update near real-time

Designed to reflect how real trading dashboards prioritize latency-sensitive signals

Alerting

A simple, transparent alerting mechanism is implemented:

User-defined z-score threshold

Visual alert triggered when threshold is breached

Keeps alert logic explainable and auditable

Visualization & UI

Built using Streamlit + Plotly:

Interactive charts (zoom, pan, hover)

Price comparison

Spread & z-score overlay

Rolling correlation plot

Summary statistics table

Clean widget-based layout for trader usability

Data Export

Users can download:

Raw tick data

Processed OHLCV + analytics

This enables further offline research or strategy testing.

How to Run
pip install -r requirements.txt
streamlit run app.py


The application runs locally with a single command.

Limitations

In-memory storage (intentional for simplicity)

Single-machine execution

Designed as a prototype, not a production trading system

Future Extensions

Kalman Filter-based dynamic hedge ratio

Mean-reversion backtesting engine

Liquidity filters

Multi-asset correlation heatmaps

Persistent storage (SQLite / DuckDB)

## Challenges Faced & Solutions

### 1. Real-Time Update Performance
**Challenge:** Streamlit reruns entire script on every update, causing noticeable lag with heavy analytics.  
**Solution:** Implemented `st.cache_data` for expensive computations, used `st.empty()` containers for selective updates.

### 2. WebSocket Disconnection Handling
**Challenge:** Connection drops not handled gracefully, causing app to freeze.  
**Solution:** Added try-catch with exponential backoff reconnection (max 5 retries), connection state tracking in session state.

### 3. Edge Case: Insufficient Data for Analytics
**Challenge:** Analytics functions threw errors when data points < rolling window size.  
**Solution:** Added minimum threshold checks (`if len(data) < window`), display "Calculating..." during warmup period.

### 4. Z-Score Calculation Accuracy
**Challenge:** Edge cases at interval boundaries caused incorrect z-scores (NaN or infinity).  
**Solution:** Used pandas `.rolling()` with `min_periods=window` parameter, added NaN filtering before display.

### 5. OHLCV Aggregation Precision
**Challenge:** Time-based resampling gave incorrect Open prices at interval boundaries.  
**Solution:** Switched from `resample().first()` to `resample().agg({'price': 'first'})` with explicit label='right'.

## What I Learned

- Streamlit's caching is powerful but tricky - had to read the docs 3 times.
- WebSocket reconnection is harder than I thought (learned about exponential backoff).
- Rolling window calculations need careful handling at boundaries.
- Real-time dashboards need careful state management.

## ChatGPT Usage Transparency

ChatGPT was used selectively to:

Validate architectural decisions

Review statistical method definitions

Improve documentation clarity

All core logic, design decisions, and implementation were authored and reviewed manually.