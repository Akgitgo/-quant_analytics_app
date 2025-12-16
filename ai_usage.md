# AI Usage Transparency Report

This project utilized Large Language Models (LLMs), specifically ChatGPT, as a productivity tool and technical reference throughout the development lifecycle. Below is a detailed breakdown of exactly how AI was leveraged to accelerate development.

## 1. Boilerplate & UI Scaffolding
AI was used to generate the initial code structure and standard UI components to save implementation time:
*   **Streamlit Layout:** Generated the initial code for the sidebar configuration, page layout, and column structures.
*   **CSS Injection:** Provided the specific CSS hacks required to style the Streamlit sidebar drop-downs (forcing "strict" behavior by hiding the text cursor), which is not a native feature of the framework.

## 2. Library Syntax & API Reference
Instead of manually browsing documentation, AI was used to quickly retrieve correct syntax for specific libraries:
*   **Binance Connector:** fetched the correct initialization parameters for the `Client` and `get_recent_trades` endpoints in the `python-binance` library.
*   **Plotly Charts:** Generated the code snippets for creating dual-axis charts (overlaying Price vs Spread) and formatting the layout legends.
*   **Pandas Operations:** Assisted in writing efficient syntax for complex DataFrame operations, such as joining two time-series on timestamps and handling `NaN` values in rolling window calculations.

## 3. Mathematical Formula Implementation
AI was used to verify the implementation details of quantitative financial formulas:
*   **OLS Regression:** Provided the `statsmodels` syntax for calculating the Hedge Ratio (Beta) between two assets.
*   **ADF Test:** Verified the correct usage of `adfuller` to extract p-values for stationarity testing.
*   **Z-Score:** Drafted the initial Pandas rolling window function to calculate the Z-Score of the spread.

## 4. Error Analysis & Debugging
When errors occurred during development, error logs were pasted into ChatGPT to identify root causes:
*   **Windows Subprocess Error:** Helped identify that `creationflags=subprocess.CREATE_NEW_CONSOLE` is a Windows-specific argument that causes crashes on Linux/Cloud environments.
*   **WebSocket Stability:** Analyzed the "Read loop has been closed" error logs, suggesting that the issue was related to the underlying `asyncio` loop conflict in the Streamlit environment.

## 5. Documentation Drafting
*   **Diagrams:** Generated the text description of the architecture flow, which was then used to create the visual diagram.
*   **Checklists:** Helped brainstorm the "Final Verification Checklist" to ensure all assignment constraints were met.
