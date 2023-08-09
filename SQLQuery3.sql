create database salesdb;

--craete a customer table

CREATE TABLE customer (
customer_id INT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(50),
phone_number VARCHAR(50)
);

SELECT *
FROM customer;


--Create order table
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(6,2),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

SELECT *
FROM orders;

--create products table
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
categories VARCHAR(20),
price DECIMAL(6,2)
);

SELECT *
FROM products;

--Inserting values into the customers table
INSERT INTO customer(customer_id, first_name, last_name, email, phone_number)
VALUES ('1', 'John', 'Smith', 'john.smith@example.com', '123-456-7890'),
('2', 'Jane', 'Doe', 'jane.doe@example.com', '987-654-3210'),
('3', 'Michael', 'Splendor', 'michael.splendor@example.com', '555-123-4567');

SELECT *
FROM customer;

--Inserting values into the order table
INSERT INTO orders(order_id, customer_id, order_date, total_amount)
VALUES ('101', '1', '2023-01-05', '150.00'),
('102', '2', '2023-02-10', '200.00'),
('103', '1', '2023-02-15', '100.00'),
('104', '3', '2023-03-20', '300.00'),
('105', '2', '2023-04-05', '50.00');

SELECT *
FROM orders;

--inserting values into products table
INSERT INTO products(product_id, product_name, categories, price)
VALUES ('501', 'Laptop', 'Electronics', '800.00'),
('502', 'Smartphones', 'Electronics', '500.00'),
('503', 'T-shirt', 'Clothings', '20.00'),
('504', 'Headphones', 'Electronics', '80.00'),
('505', 'Jeans', 'Clothings', '60.00');

SELECT *
FROM products;

--1 Retrieving the first and last name of all the customer
SELECT first_name, last_name
from customer;

--2 Searching for the customer with the last name Smith
SELECT *
FROM customer
WHERE last_name = 'Smith';

--3 Retrieve orders id and total amounts for orders placed on or after january 1, 2023
SELECT order_id, total_amount
FROM orders
WHERE order_date >= '2023-01-01';

--4 Retrieving the product names, categories, and prices of products in Electronics categories sorted by price
SELECT product_name, categories, price
FROM products 
WHERE categories = 'Electronics'
ORDER BY price DESC;

--5 Find the first name and the last name of customers that placed order
SELECT customer.customer_id, customer.first_name, customer.last_name, orders.total_amount
FROM customer
JOIN orders
ON customer.customer_id = orders.customer_id
ORDER BY customer_id;

--6 Find the products name and categories for products between $50 and $100
SELECT product_name, categories
FROM products
WHERE price BETWEEN '50.00' AND '100.00';

--7 Retrieve the first name, last name, email and phone number of customer who had not placed any order

INSERT INTO customer(customer_id, first_name, last_name, email, phone_number)
VALUES ('4', 'Davido', 'Adeleke', 'davido.adeleke@example.com', '234-567-8909')
SELECT*
FROM customer;

SELECT first_name, last_name, email, phone_number
FROM customer
WHERE NOT customer_id IN(SELECT customer_id
FROM orders);