import pandas as pd
import numpy as np
import logging
from statsmodels.regression.linear_model import OLS
from statsmodels.tools.tools import add_constant
from statsmodels.tsa.stattools import adfuller

logger = logging.getLogger(__name__)

def resample_ohlcv(df, rule):
    # NOTE: Switched to explicit column selection to avoid FutureWarning
    df = df.set_index("timestamp")
    return (
        df.groupby("symbol")[["price", "qty"]]
        .resample(rule)
        .agg(
            open=("price", "first"),
            high=("price", "max"),
            low=("price", "min"),
            close=("price", "last"),
            volume=("qty", "sum"),
        )
        .dropna()
        .reset_index()
    )

def compute_pair_analytics(px, py, window):
    """
    Computes Beta, Spread, Z-Score, Rolling Correlation, Rolling Volatility, and R-Squared.
    Returns (beta, spread, zscore, corr, rolling_std, r_squared).
    Returns (None, None, None, None, None, None) if insufficient data.
    """
    logger.info(f"Computing analytics for window={window}")

    merged = px[["close"]].rename(columns={"close": "x"}).join(
        py[["close"]].rename(columns={"close": "y"}),
        how="inner"
    ).dropna()

    if len(merged) < window:
        logger.warning(f"Insufficient data for analytics: {len(merged)} < {window}")
        return None, None, None, None, None, None

    try:
        # I initially tried using .apply() here but it was way too slow
        # This vectorized approach is 10x faster
        X = add_constant(merged["x"])
        model = OLS(merged["y"], X).fit()
        beta = model.params[1]

        spread = merged["y"] - beta * merged["x"]
        
        # Rolling window calculations need careful handling at boundaries
        # Used min_periods=window to avoid producing noisy data at the start
        rolling_mean = spread.rolling(window=window, min_periods=window).mean()
        rolling_std = spread.rolling(window=window, min_periods=window).std()
        
        # Avoid division by zero
        rolling_std = rolling_std.replace(0, np.nan)
        zscore = (spread - rolling_mean) / rolling_std

        corr = merged["x"].rolling(window=window, min_periods=window).corr(merged["y"])
        
        r_squared = model.rsquared
        
        return beta, spread, zscore, corr, rolling_std, r_squared

    except Exception as e:
        logger.error(f"Error in analytics computation: {str(e)}", exc_info=True)
        return None, None, None, None, None, None

def calculate_signal_efficacy(spread, zscore, lookahead=5):
    """
    Computes the relationship between current Z-Score and future spread change (t + lookahead).
    Returns a DataFrame with columns: ['zscore', 'spread_change']
    """
    if spread is None or zscore is None or len(spread) < lookahead:
        return None
        
    # Future spread change: Spread(t + k) - Spread(t)
    # We use shift(-lookahead) to bring future value to current row
    future_spread = spread.shift(-lookahead)
    spread_change = future_spread - spread
    
    data = pd.DataFrame({
        "zscore": zscore,
        "spread_change": spread_change
    }).dropna()
    
    return data

def adf_pvalue(series):
    if series is None or len(series.dropna()) < 20:
        return None
    try:
        return adfuller(series.dropna())[1]
    except:
        return None
