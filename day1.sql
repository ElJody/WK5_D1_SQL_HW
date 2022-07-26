-- Get all records from a query
SELECT *
FROM actor;
SELECT *
FROM film; 

-- Limit out Results
SELECT *
FROM film
LIMIT 10;

-- Omits results and LIMIT
SELECT *
FROM film
LIMIT 10 OFFSET 5;

SELECT *
FROM actor;

SELECT first_name, last_name FROM actor;

--- Finds actors first name is Nick
SELECT first_name, last_name
from actor
WHERE first_name = 'Nick';

--- Finds actors Last name is Wahlberg

SELECT first_name, last_name FROM actor
WHERE last_name = 'Wahlberg';

-- Look at film with IDENTITY
SELECT * 
FROM film 
WHERE film_id = 85;

-- --- Finds actors first name is Nick
SELECT first_name, last_name
from actor
WHERE first_name LIKE 'Nick';

-- "_" any 1 character and "%" any number of CHARACTERs
-- Where the name starts with a J
SELECT first_name, last_name
from actor
WHERE first_name LIKE 'J%';

-- Query names containing a "Y"
SELECT first_name, last_name
from actor
WHERE first_name LIKE '%y%';

-- K name that are 2 letters long
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- First Name that starts with a K 
-- ends with th and have at least 2 char between th K and TH
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%th';

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Kenneth' AND last_name ='Torn';

SELECT * FROM payment;

-- Comparison Operators
-- > < >= <= <>[Not Equals in SQL]
SELECT customer_id, amount
FROM payment
WHERE 2.00 < amount and amount < 4.99;

SELECT customer_id, amount
FROM payment
WHERE 3.00 > amount and amount <> 2.99;

-- Order by a columns ascending is default
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER by amount;

-- Order by a columns descending
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER by amount DESC;

-- Between 2 values
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- SQL Aggregators SUM, AVG, COUNT, MIN, MAX
-- SUM of all amounts paid
SELECT SUM(amount)
FROM payment;

SELECT SUM(amount)
FROM payment
Where amount > 5.99;

SELECT SUM(amount)
FROM payment
Where amount > 5.99;

-- COUNT -- How Many Records
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- GET Unique First Names
SELECT DISTINCT first_name
FROM actor;

-- GET Unique Payment Amounts
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Average payment amount
SELECT AVG(amount)
FROM payment;

-- MIN amount in payments
SELECT MIN(amount)
FROM payment
WHERE amount <> 0;

-- Alias (Rename Columns)
SELECT MIN(amount) as Min_Payment
FROM payment
WHERE amount <> 0;

-- MAX amount in payments
SELECT MAX(amount)
FROM payment
WHERE amount <> 0;

-- MIN amount in payments
SELECT amount,COUNT(amount)
FROM payment
GROUP BY amount;

-- Query to display different customer_ids with the 
-- summed amounts for each customer_id
SELECT customer_id, SUM(amount) as soa
FROM payment
GROUP BY customer_id
ORDER by soa DESC;

-- Query to display customer_ids with the amounts for each customer
SELECT customer_id, amount
FROM payment
GROUP BY customer_id, amount
ORDER by amount DESC;

SELECT customer_id, SUM(amount) as soa
FROM payment
GROUP BY customer_id
ORDER by soa DESC;

SELECT customer_id, SUM(amount) as soa
FROM payment
GROUP BY customer_id
HAVING SUM(amount)>71
ORDER by soa DESC;

SELECT customer_id, SUM(amount) as soa
FROM payment
WHERE customer_id >187
GROUP BY customer_id
HAVING SUM(amount)>71
ORDER by soa DESC;

SELECT customer_id, SUM(amount) as soa
FROM payment
WHERE customer_id >187
GROUP BY customer_id
HAVING SUM(amount)>71
ORDER by soa DESC
LIMIT 20 OFFSET 5;

-- Query to Display customer emails that show up more than 5 times
-- Grouping by the customer email
-- and the email contains 'bishop'
-- MY Code
SELECT email
FROM customer
WHERE COUNT(email) > 5
GROUP BY email
HAVING email = 'bishop';

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE '%bishop%'
GROUP BY email
HAVING COUNT(customer_id) > 5
ORDER BY email LIMIT 1;
