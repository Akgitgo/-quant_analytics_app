from binance.client import Client
from storage import insert_tick
import pandas as pd
import time

def start_binance_feed(symbols):
    """
    Robust data ingestion using REST Polling (HTTP).
    This avoids WebSocket instability/reactor issues in Streamlit threads.
    """
    client = Client()
    print("✅ Feed started (Polling Mode)")

    # Keep track of the last trade ID processed to avoid duplicates
    last_trade_ids = {s: 0 for s in symbols}

    while True:
        try:
            for s in symbols:
                # Fetch recent trades (snapshot)
                trades = client.get_recent_trades(symbol=s.upper(), limit=10)
                
                for t in trades:
                    tid = t["id"]
                    if tid > last_trade_ids[s]:
                        # New trade found
                        insert_tick({
                            "timestamp": pd.to_datetime(t["time"], unit="ms").isoformat(),
                            "symbol": s.lower(),
                            "price": float(t["price"]),
                            "qty": float(t["qty"]),
                        })
                        last_trade_ids[s] = tid
            
            # Rate limit compliance (polled every 1s approx)
            time.sleep(1)

        except Exception as e:
            print(f"❌ Polling error: {e}")
            time.sleep(2)

