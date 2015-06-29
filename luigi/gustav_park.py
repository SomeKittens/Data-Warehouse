# -*- coding: utf-8 -*-
# above line is purely cargo cult

import luigi
import luigi.postgres

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

class GetCustomers(luigi.Task):
  def output(self):
    return luigi.LocalTarget('data/customers.tsv')

  def run(self):
    cur = conn.cursor()

    cur.execute("""SELECT
      c.id,
      c.paymentId,
      c.hasNewsletter,
      pc.productId = 9 AS is_child
      FROM customers AS c
      LEFT OUTER JOIN purchases AS pc ON c.id = pc.customerId
      WHERE pc.productId = 7 OR pc.productId = 9
    """)

    rows = cur.fetchall()

    with self.output().open('w') as out_file:
      for row in rows:
        # print row
        # id, has_app, has_newsletter, is_child
        out_file.write('{}\t{}\t{}\t{}\n'.format(
          row[0],
          int(row[1]) > 2,
          row[2],
          row[3]
        ))

class GetStores(luigi.Task):
  def output(self):
    return luigi.LocalTarget('data/shops.tsv')

  def run(self):
    cur = conn.cursor()

    cur.execute("""SELECT id, storeName FROM stores""")

    rows = cur.fetchall()

    with self.output().open('w') as out_file:
      for row in rows:
        # print row
        out_file.write('{}\t{}\n'.format(
          row[0],
          row[1]
        ))

class GetProducts(luigi.Task):
  def output(self):
    return luigi.LocalTarget('data/products.tsv')

  def run(self):
    cur = conn.cursor()

    cur.execute("""SELECT
      p.id,
      p.productName,
      p.price
      FROM products AS p
      WHERE p.id < 7
    """)

    rows = cur.fetchall()

    with self.output().open('w') as out_file:
      for row in rows:
        # print row
        out_file.write('{}\t{}\t{}\n'.format(
          row[0],
          row[1],
          row[2]
        ))

class GetPurchases(luigi.Task):
  def requires(self):
    yield InsertCustomers()
    yield InsertProducts()
    yield InsertStores()

  def output(self):
    return luigi.LocalTarget('data/purchases.tsv')

  def run(self):
    cur = conn.cursor()

    cur.execute("""SELECT
      p.id,
      p.customerId,
      pmt.pmtType,
      p.productId,
      p.storeId,
      p.timeOfPurchase,
      pro.price - (o.price / o.size) AS profit
      FROM purchases AS p
      LEFT OUTER JOIN orders AS o ON p.productId = o.productId
      LEFT OUTER JOIN products AS pro ON pro.id = p.productId
      LEFT OUTER JOIN paymentTypes AS pmt ON pmt.id = p.paymentId
      WHERE p.productId < 7
    """)

    rows = cur.fetchall()

    with self.output().open('w') as out_file:
      for row in rows:
        # print row
        out_file.write('{}\t{}\t{}\t{}\t{}\t{}\t{}\n'.format(
          row[0],
          row[1],
          row[2],
          row[3],
          row[4],
          row[5],
          row[6]
        ))

class GetEntrances(luigi.Task):
  def requires(self):
    return InsertCustomers()

  def output(self):
    return luigi.LocalTarget('data/entrances.tsv')

  def run(self):
    cur = conn.cursor()

    cur.execute("""SELECT
      id,
      timeOfPurchase,
      customerId
      FROM purchases
      WHERE productId = 7 OR productId = 9
    """)

    rows = cur.fetchall()

    with self.output().open('w') as out_file:
      for row in rows:
        # print row
        out_file.write('{}\t{}\t{}\n'.format(
          row[0],
          row[1],
          row[2]
        ))

class InsertCustomers(luigi.postgres.CopyToTable):
  host = "localhost"
  database = "gustav_park"
  user = os.environ.get("PG_USER")
  password = os.environ.get("PG_PASSWORD")
  table = "D_customers"

  columns = [("id", "SERIAL PRIMARY KEY"),
             ("has_app", "bool"),
             ("has_newsletter", "bool"),
             ("is_child", "bool")]

  def requires(self):
    return GetCustomers()

class InsertStores(luigi.postgres.CopyToTable):
  host = "localhost"
  database = "gustav_park"
  user = os.environ.get("PG_USER")
  password = os.environ.get("PG_PASSWORD")
  table = "D_stores"

  columns = [("id", "SERIAL PRIMARY KEY"),
             ("storename", "VARCHAR(100)")]

  def requires(self):
    return GetStores()

class InsertProducts(luigi.postgres.CopyToTable):
  host = "localhost"
  database = "gustav_park"
  user = os.environ.get("PG_USER")
  password = os.environ.get("PG_PASSWORD")
  table = "D_products"

  columns = [("id", "SERIAL PRIMARY KEY"),
             ("productName", "VARCHAR(100)"),
             ("price", "int")]

  def requires(self):
    return GetProducts()

class InsertPurchases(luigi.postgres.CopyToTable):
  host = 'localhost'
  database = 'gustav_park'
  user = os.environ.get('PG_USER')
  password = os.environ.get('PG_PASSWORD')
  table = 'F_purchases'

  columns = [('id', 'SERIAL PRIMARY KEY'),
             ('customerId', 'int REFERENCES D_customers'),
             ('paymentType', 'VARCHAR(100)'),
             ('productId', 'int REFERENCES D_products'),
             ('storeId', 'int REFERENCES D_stores'),
             ('timeOfPurchase', 'time'),
             ('profit', 'int')]

  def requires(self):
    return GetPurchases()

class InsertEntrances(luigi.postgres.CopyToTable):
  host = "localhost"
  database = "gustav_park"
  user = os.environ.get("PG_USER")
  password = os.environ.get("PG_PASSWORD")
  table = "F_entrances"

  columns = [("id", "SERIAL PRIMARY KEY"),
             ("timeOfEntrance", "time"),
             ("customerId", "int REFERENCES D_customers")]

  def requires(self):
    return GetEntrances()

class AllData(luigi.Task):
  def requires(self):
    yield InsertCustomers()
    yield InsertStores()
    yield InsertProducts()
    yield InsertPurchases()
    yield InsertEntrances()

if __name__ == "__main__":
  luigi.run()