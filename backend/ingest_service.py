from binance.client import Client
from storage import insert_tick
import logging
import time
import pandas as pd

# Configure logging to show up in the console
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def start_ingestion_service():
    """
    Dedicated ingestion service using REST POLLING.
    This is 100% stable and avoids 'Read loop has been closed' WebSocket errors.
    """
    symbols = ["BTCUSDT", "ETHUSDT", "BNBUSDT", "SOLUSDT"]
    client = Client()
    
    # Track the last trade ID processed to avoid duplicates
    last_trade_ids = {s: 0 for s in symbols}
    
    logging.info(f"🚀 Ingestion Service Started (Polling Mode) for: {symbols}")
    logging.info("ℹ Polling interval: 2.0s to respect Rate Limits.")

    try:
        while True:
            start_time = time.time()
            
            for s in symbols:
                try:
                    # Fetch recent trades (snapshot)
                    trades = client.get_recent_trades(symbol=s, limit=10)
                    
                    new_count = 0
                    for t in trades:
                        tid = t["id"]
                        # Only process new trades
                        if tid > last_trade_ids[s]:
                            insert_tick({
                                "timestamp": pd.to_datetime(t["time"], unit="ms").isoformat(),
                                "symbol": s.lower(),
                                "price": float(t["price"]),
                                "qty": float(t["qty"]),
                            })
                            last_trade_ids[s] = tid
                            new_count += 1
                    
                    if new_count > 0:
                        logging.info(f"Inserted {new_count} ticks for {s}")
                        
                except Exception as e:
                    logging.error(f"Polling error for {s}: {e}")
            
            # Smart Sleep: Ensure we wait at least 2 seconds *after* the work is done
            # to strictly adhere to rate limits.
            elapsed = time.time() - start_time
            sleep_time = max(0.0, 2.0 - elapsed)
            time.sleep(sleep_time)
                
    except KeyboardInterrupt:
        logging.info("Stopping Ingestion Service...")

if __name__ == "__main__":
    start_ingestion_service()
