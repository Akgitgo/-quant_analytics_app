Real-Time Binance Futures Quant Analytics Dashboard
Overview

This project is a real-time quantitative analytics dashboard built to demonstrate an end-to-end trading analytics workflow — from live market data ingestion to sampling, statistical analysis, alerting, and interactive visualization.

The system is designed as a lightweight prototype of a trader-facing analytics tool used in market-making or statistical arbitrage environments, with a strong emphasis on clarity, correctness, and extensibility rather than production-scale complexity.

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

Binance Futures WebSocket
          ↓
Tick Ingestion Layer
          ↓
In-Memory Storage (Pandas)
          ↓
Sampling & Analytics Engine
          ↓
Streamlit Interactive Dashboard
          ↓
Alerts & Data Export

Design Principles

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

ChatGPT Usage Transparency

ChatGPT was used selectively to:

Validate architectural decisions

Review statistical method definitions

Improve documentation clarity

All core logic, design decisions, and implementation were authored and reviewed manually.