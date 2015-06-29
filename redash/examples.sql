-- Entrance times, in 24hr format

SELECT to_char(extract(hour FROM timeofentrance), 'fm00')
       || ':' ||
       to_char(extract(MINUTE FROM timeofentrance), 'fm00')
  AS entrytime,
 count(*)
FROM f_entrances
GROUP BY entrytime;

-- Profit per store

SELECT s.id,
       s.storeName,
       SUM(pur.profit) / 100 AS profit -- profit is stored as pennies
FROM d_stores AS s
LEFT OUTER JOIN f_purchases AS pur ON s.id = pur.storeid
WHERE s.id <> 5; -- Not worried about front gate ticket sales

GROUP BY s.id
ORDER BY profit DESC

-- Most used payment types

SELECT count(*),
       paymenttype
FROM f_purchases
GROUP BY paymenttype
ORDER BY paymenttype;

-- Profit by Payment Method

SELECT paymenttype AS payment_type,
       AVG(profit/ 100) AS profit
FROM f_purchases AS pur
GROUP BY paymenttype
ORDER BY profit DESC;

-- Product sales by age

SELECT COUNT(*) AS nums,
       c.is_child AS is_child,
       pro.productname AS product_name
FROM f_purchases AS pur
LEFT JOIN d_customers AS c ON c.id = pur.customerid
LEFT JOIN d_products AS pro ON pro.id = pur.productid
GROUP BY is_child,
         product_name;