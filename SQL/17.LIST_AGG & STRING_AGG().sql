--LISTAGG function 

-- Oracle Supports supports the LISTAGG() function that transforms data from multiple rows into
-- a single string (or list), with a specified delimiter. (eg:, & %$ #:)

-- simpler terms, denormalize multiple rows into single value.

-- SYNTAX: 
-- LISTAGG(column_name, 'delimiter') WITHIN GROUP (ORDER BY column_name)



CREATE TABLE customer(
    customer_id INT,
    customer_name varchar(50),
    PRIMARY KEY(customer_id)
);

DESC customer;

CREATE TABLE orders(
    order_id INT,
    customer_id INT,
    product_name varchar(100),
    PRIMARY KEY(order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

DESC orders;

INSERT ALL
  INTO customer (customer_id, customer_name) VALUES (1, 'Alice')
  INTO customer (customer_id, customer_name) VALUES (2, 'Bob')
  INTO customer (customer_id, customer_name) VALUES (3, 'Charlie')
  INTO customer (customer_id, customer_name) VALUES (4, 'David')
SELECT * FROM dual;

SELECT * FROM customer;

INSERT ALL
  INTO orders (order_id, customer_id, product_name) VALUES (1,1,'Laptop')
  INTO orders (order_id, customer_id, product_name) VALUES (2,1,'Smartphone') 
  INTO orders (order_id, customer_id, product_name) VALUES (3,2,'Tablet') 
  INTO orders (order_id, customer_id, product_name) VALUES (4,2,'Headphones') 
  INTO orders (order_id, customer_id, product_name) VALUES (5,3,'Laptop') 
  INTO orders (order_id, customer_id, product_name) VALUES (6,4,'Smartphone') 
SELECT * FROM dual;

SELECT * FROM orders;


-- Query to get what products are ordered by each customer.
SELECT 
    c.customer_name,
    LISTAGG(o.product_name, ',') WITHIN GROUP (ORDER BY c.customer_id) AS ordered_products
FROM
    customer c
RIGHT JOIN
    orders o ON o.customer_id = c.customer_id
GROUP BY
    c.customer_name;








--STRING_AGG():

--the same can be implemented in other database using STRING_AGG() function.
--STRING_AGG() is supported in some other databases like PostgreSQL and SQL Server (starting from SQL Server 2017), but it is not supported in Oracle.


--SYNTAX:
--SELECT STRING_AGG(column_name, 'delimiter') AS aggregated_values FROM table_name GROUP BY some_column;

    
SELECT 
    c.customer_name,
    STRING_AGG(o.product_name, ',') AS ordered_products
FROM
    customer c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name;

