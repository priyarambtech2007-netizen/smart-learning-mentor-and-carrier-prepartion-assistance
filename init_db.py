import sqlite3
import os

DATABASE = 'database/career.db'
SQL_FILE = 'database/career.sql'

def init_db():
    """Initialize database from SQL file"""
    if os.path.exists(DATABASE):
        os.remove(DATABASE)
    
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    
    with open(SQL_FILE, 'r') as f:
        sql_script = f.read()
    
    cursor.executescript(sql_script)
    conn.commit()
    conn.close()
    print("✅ Database initialized with new courses!")

if __name__ == '__main__':
    init_db()
