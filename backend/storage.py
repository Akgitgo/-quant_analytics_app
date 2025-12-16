import sqlite3
import pandas as pd

import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_NAME = os.path.join(BASE_DIR, "market_data.db")

def get_connection():
    return sqlite3.connect(DB_NAME, check_same_thread=False)

def init_db():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("""
        CREATE TABLE IF NOT EXISTS ticks (
            timestamp TEXT,
            symbol TEXT,
            price REAL,
            qty REAL
        )
    """)
    conn.commit()
    conn.close()

def insert_tick(row):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        "INSERT INTO ticks VALUES (?, ?, ?, ?)",
        (row["timestamp"], row["symbol"], row["price"], row["qty"])
    )
    conn.commit()
    conn.close()

def load_ticks():
    conn = get_connection()
    df = pd.read_sql("SELECT * FROM ticks", conn, parse_dates=["timestamp"])
    conn.close()
    return df
