import pandas as pd
from statsmodels.regression.linear_model import OLS
from statsmodels.tools.tools import add_constant
from statsmodels.tsa.stattools import adfuller

def resample_ohlcv(df, rule):
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
    merged = px[["close"]].rename(columns={"close": "x"}).join(
        py[["close"]].rename(columns={"close": "y"}),
        how="inner"
    ).dropna()

    X = add_constant(merged["x"])
    model = OLS(merged["y"], X).fit()
    beta = model.params[1]

    spread = merged["y"] - beta * merged["x"]
    zscore = (spread - spread.rolling(window).mean()) / spread.rolling(window).std()
    corr = merged["x"].rolling(window).corr(merged["y"])

    return beta, spread, zscore, corr

def adf_pvalue(series):
    return adfuller(series.dropna())[1]
