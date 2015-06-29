-- for easy pasting into pgcli
DROP TABLE table_updates, F_entrances, F_purchases, D_products, D_stores, D_customers;

-- This .sql file is never used, as it's all created by Luigi

CREATE TABLE D_customers (
  id SERIAL PRIMARY KEY,
  has_app bool,
  has_newsletter bool,
  is_child bool
);

CREATE TABLE D_stores (
  id SERIAL PRIMARY KEY,
  storeName VARCHAR(100)
);

CREATE TABLE D_products (
  id SERIAL PRIMARY KEY,
  productName VARCHAR(300),
  price int
);

CREATE TABLE F_purchases (
  id SERIAL PRIMARY KEY,
  customerId int REFERENCES D_customers,
  productId int REFERENCES D_products,
  storeId int REFERENCES D_stores,
  paymentType VARCHAR(100),
  timeOfPurchase time,
  profit int
);

CREATE TABLE F_entrances (
  id SERIAL PRIMARY KEY,
  timeOfEntrance time,
  customerId int REFERENCES D_customers
);