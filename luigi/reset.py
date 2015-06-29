import psycopg2
import os

from os.path import join, dirname
from dotenv import load_dotenv
from shutil import rmtree

dotenv_path = join(dirname(__file__), '.env')
load_dotenv(dotenv_path)

try:
  conn = psycopg2.connect(
    dbname='gustav_park',
    user=os.environ.get("PG_USER"),
    host='localhost',
    password=os.environ.get("PG_PASSWORD")
  )
except:
  print 'Could not connect to database'

# Reset all the things
# Kept outside of Luigi so we can avoid table locks
try:
  rmtree('./data')
except:
  print 'Data dir not found'
try:
  cur = conn.cursor()
  cur.execute("""TRUNCATE table_updates, F_entrances, F_purchases, D_products, D_stores, D_customers""")
  conn.commit()
  print 'truncated'
except:
  print 'TRUNCATE failed'