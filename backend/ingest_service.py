from binance import ThreadedWebsocketManager
from storage import insert_tick
import logging
import time
import pandas as pd
import threading

# Configure logging
from datetime import datetime
logging.basicConfig(
    level=logging.INFO,
    format='[%(asctime)s] [%(levelname)s] [%(name)s] %(message)s',
    handlers=[
        logging.FileHandler(f'analytics_ingest_{datetime.now().strftime("%Y%m%d")}.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

# Global stop event for graceful shutdown
stop_event = threading.Event()

def start_ingestion_service():
    """
    Dedicated ingestion service using WebSocket Streams.
    This avoids rate limits and IP bans from REST API polling.
    Now supports graceful shutdown via stop_event.
    """
    symbols = ["btcusdt", "ethusdt", "bnbusdt", "solusdt"]
    
    logging.info(f"🚀 Ingestion Service Started (WebSocket Mode) for: {symbols}")

    def handle_trade_message(msg):
        """Callback for trade messages"""
        try:
            if msg['e'] == 'trade':
                insert_tick({
                    "timestamp": pd.to_datetime(msg['T'], unit="ms").isoformat(),
                    "symbol": msg['s'].lower(),
                    "price": float(msg['p']),
                    "qty": float(msg['q']),
                })
                logging.debug(f"Inserted tick for {msg['s']}")
        except Exception as e:
            logging.error(f"Error processing trade message: {e}")

    try:
        # Create WebSocket manager
        twm = ThreadedWebsocketManager()
        twm.start()
        
        # Subscribe to trade streams for all symbols
        for symbol in symbols:
            twm.start_trade_socket(callback=handle_trade_message, symbol=symbol)
            logging.info(f"Subscribed to {symbol} trade stream")
        
        # Keep running until stop event is set
        while not stop_event.is_set():
            time.sleep(1)
        
        # Cleanup
        logging.info("Stopping WebSocket streams...")
        twm.stop()
        
    except KeyboardInterrupt:
        logging.info("Stopping Ingestion Service...")
    except Exception as e:
        logging.error(f"WebSocket error: {e}")
    finally:
        logging.info("Ingestion Service Stopped")

if __name__ == "__main__":
    start_ingestion_service()

