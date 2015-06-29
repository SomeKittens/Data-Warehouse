DROP TABLE orders;
DROP TABLE purchases;
DROP TABLE products;
DROP TABLE stores;
DROP TABLE customers;
DROP TABLE paymentTypes;

CREATE TABLE paymentTypes (
  id SERIAL PRIMARY KEY,
  pmtType VARCHAR(100)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  paymentId int REFERENCES paymentTypes,
  customerName VARCHAR(100),
  hasNewsletter bool
);

CREATE TABLE stores (
  id SERIAL PRIMARY KEY,
  storeName VARCHAR(100)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  productName VARCHAR(300),
  price int
);

CREATE TABLE purchases (
  id SERIAL PRIMARY KEY,
  customerId int REFERENCES customers,
  paymentId int REFERENCES paymentTypes,
  productId int REFERENCES products,
  storeId int REFERENCES stores,
  timeOfPurchase time NOT NULL default CURRENT_TIME
);

-- Behind the scenes!
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  productId int REFERENCES products,
  price int,
  size int
);

INSERT INTO paymentTypes (pmtType) VALUES ('Credit Card'); -- 1
INSERT INTO paymentTypes (pmtType) VALUES ('Debit Card'); -- 2
INSERT INTO paymentTypes (pmtType) VALUES ('iOS app'); -- 3
INSERT INTO paymentTypes (pmtType) VALUES ('Android app'); -- 4


INSERT INTO stores (storeName) VALUES ('Valentina''s Wacky Funhaus'); -- 1
INSERT INTO stores (storeName) VALUES ('Jeb''s Cantina'); -- 2
INSERT INTO stores (storeName) VALUES ('Bill''s iShop'); -- 3
INSERT INTO stores (storeName) VALUES ('Bob''s Gift Store'); -- 4
INSERT INTO stores (storeName) VALUES ('Front Gate'); -- 5

-- Foodstuffs
INSERT INTO products (productName, price) VALUES ('Cotton Candy', 300); -- 1
INSERT INTO products (productName, price) VALUES ('Soft Pretzel', 300); -- 2
INSERT INTO products (productName, price) VALUES ('SUPERMEGA SODA CUP', 450); -- 3

-- Souvenirs
INSERT INTO products (productName, price) VALUES ('Prank-o-rama funbag', 1000); -- 4
INSERT INTO products (productName, price) VALUES ('Postcard 5-pak', 700); -- 5
INSERT INTO products (productName, price) VALUES ('T-shirt', 1500); -- 6

-- Tickets
INSERT INTO products (productName, price) VALUES ('Day ticket', 7500); -- 7
INSERT INTO products (productName, price) VALUES ('Season Pass', 30000); -- 8
INSERT INTO products (productName, price) VALUES ('Day ticket (child)', 65000); -- 9


-- Bulk orders from suppliers
INSERT INTO orders (productId, price, size) VALUES (1, 25000, 500);
INSERT INTO orders (productId, price, size) VALUES (2, 44000, 500);
INSERT INTO orders (productId, price, size) VALUES (3, 5000, 500);
INSERT INTO orders (productId, price, size) VALUES (4, 275000, 500);
INSERT INTO orders (productId, price, size) VALUES (5, 87500, 500);
INSERT INTO orders (productId, price, size) VALUES (6, 375000, 500);
