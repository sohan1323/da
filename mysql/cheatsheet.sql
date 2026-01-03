--to create database
CREATE DATABASE myDB;  

-- to use the database
USE myDB;

--to delete database
DROP DATABASE myDB;

--make database readonly
ALTER DATABASE myDB READ ONLY = 1;  -- 0 to disable reaonly

--------------------------------------------------------------------------------------------------------------------------

-- create table
CREATE TABLE employees (
    employee_id INT,            -- datatype int
    first_name VARCHAR(50),     -- datatype varchar(50 char limit)
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2),    -- datatype decimal (5 digits with precision of 2 places)
    hire_date DATE
);

-- select table
SELECT * FROM employees;        --  * means all

-- rename table
RENAME TABLE old_name TO new_name;

-- delete table
DROP TABLE employees;           -- delete the table

-- add columns
ALTER TABLE employees
ADD phone_number VARCHAR(15);   -- adds new column to table

-- rename column
ALTER TABLE employees
RENAME COLUMN phone_number TO email;    -- renames the column

-- modify the column
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(60);

-- to move column position
ALTER TABLE employees               -- email column will be placed after last_name column
MODIFY email VARCHAR(100)
AFTER last_name;

-- to move column first position
ALTER TABLE employees               -- email column will be placed at first position
MODIFY email VARCHAR(100)
FIRST;

-- delete column
ALTER TABLE employees           -- deletes the email column
DROP COLUMN email;

-------------------------------------------------------------------------------------------------------------------------------------

-- insert values in the table
INSERT INTO employees(employee_id, first_name, last_name, hourly_pay, hire_date)
VALUES (1,"sheldon","plankton",2300,"2023-01-06"),
(2,"spongebob","squarepants",6700,"2023-09-13");

-- select specific columns
SELECT first_name, last_name 
FROM employees;

-- select using specific condition
SELECT * 
FROM employees 
WHERE employee_id = 1;

SELECT *                        -- selects whos hire_date is NULL (for oppo. use NOT NULL)
FROM employees 
WHERE hire_date IS NULL;

------------------------------------------------------------------------------------------

-- update records
UPDATE employees                -- if where clause is not used it will update all rows records
SET hourly_pay = 10.25,
    hire_date = "2023-04-02"
WHERE employee_id = 6;

-- delete records
DELETE FROM employees           -- if where clause is not use it will delete all records
WHERE employee_id = 6;

----------------------------------------------------------------------------------------------------------

SET AUTOCOMMIT = OFF;           -- turn off auto save need manual save

COMMIT;                         -- like a manual save

ROLLBACK;                       -- undo changes to last safepoint (commit)

------------------------------------------------------------------------------------------------------------

-- to get current date time

-- create a table to store values
CREATE TABLE test(
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

-- insert values
INSERT INTO test
VALUES(CURRENT_DATE(), CURRENT_TIME(), NOW());

-- print
SELECT * FROM test;

--------------------------------------------------------------------------------------------------------

-- to ensure unique values
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25) UNIQUE,    -- no duplicate name will be inserted
    price DECIMAL(4, 2)
);

-- if forget to add constariant while table creation
ALTER TABLE products
ADD CONSTRAINT
UNIQUE(product_name);

-- to ensure column must not be null
ALTER TABLE products                        -- you can add NOT NULL while creating table
MODIFY price DECIMAL(4, 2) NOT NULL;

-- check constraint (to control updation, insertion) 
CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2) CHECK (Price > 0), -- Column-level constraint
    Quantity INT,
    CONSTRAINT chk_quantity_positive CHECK (Quantity >= 0) -- Table-level constraint (optional name)
);

-- to add check constarint later
ALTER TABLE products
ADD CONSTRAINT chk_quantity_positive CHECK(quantity >= 10.00);

---------------------------------------------------------------------------------------------------------------------

-- to set default constraint
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(4,2) DEFAULT 0        -- sets default value to 0 if not provided
);

ALTER TABLE products
ALTER price SET DEFAULT 0;

-- useful when datetime is required
CREATE TABLE transactions(
    transaction_id INT,
    amount DECIMAL(5,2),
    transaction_date DATETIME DEFAULT NOW()
);

-------------------------------------------------------------------------------------------------------

-- primary key (unique key)
CREATE TABLE transactions(
    t_id INT PRIMARY KEY,           --only one column will have primary key per table
    amount DECIMAL(5,2)
);

-- to add later
ALTER TABLE transactions
ADD CONSTRAINT 
PRIMARY KEY(t_id);

-- to auto increment key
CREATE TABLE transactions(
    t_id INT PRIMARY KEY AUTO_INCREMENT,    -- primary key will be auto increment start from 1
    amount DECIMAL(5, 2)
);

INSERT INTO transactions(amount)
VALUES(2.89),(4.55),(1.55);

-- to start from custom number
ALTER TABLE transactions                    -- key starts from 1000
AUTO_INCREMENT = 1000;

----------------------------------------------------------------------------------------------------------------------

-- foriegn keys -> primary key in one table found in another table
-- establishes link between tables

--table 1
CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

--table 2
CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

-- to drop foreign key
ALTER TABLE transactions
DROP FOREIGN KEY forign_key_name;       -- name is found in left pane of mysql, its not the column name 

-- to give foreign key a unique name
ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

----------------------------------------------------------------------------------------------------------------------------------------

-- joins

-- create two tables
--table 1
CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

--table 2
CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

-- inner join
SELECT transaction_id, amount, first_name, last_name        -- returns all values from both tables
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

-- left join
SELECT *                                                    -- return all from left table and matching values from right table
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

-- right join
SELECT *                                                    -- return all from right table and matching values from left table
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;

-----------------------------------------------------------------------------------------------------------------------------------------------

-- functions

-- count
SELECT COUNT(amount) AS "today's collection"               -- number of rows in given column
FROM transactions;

-- max
SELECT MAX(amount) AS maximum                              -- max value
FROM transactions;

-- min
SELECT MIN(amount) AS minimum                              -- min value
FROM transactions;

-- average
SELECT AVG(amount) AS average                              -- average value
FROM transactions;

-- sum
SELECT SUM(amount) AS sum                                  -- sum of value
FROM transactions;

-- concat
SELECT CONCAT(first_name," ",last_name) AS full_name       -- concat the values from columns
FROM transactions;

--------------------------------------------------------------------------------------------------------------------

-- and
SELECT * 
FROM employees
WHERE hire_date < "2023-01-05" AND job = "cook";

-- or
SELECT * 
FROM employees
WHERE job = "cook" OR job = "cashier";

-- not
SELECT *
FROM employees
WHERE NOT job = "manager";

SELECT *
FROM employees
WHERE NOT job = "manager" AND NOT job = "assi. manager";

-- between
SELECT *
FROM employees
WHERE hire_date BETWEEN "2023-01-04" AND "2023-01-07";

-- in
SELECT *
FROM employees
WHERE job IN ("cook", "cashier", "janitor");

---------------------------------------------------------------------------------------------------------------------------------

-- wildcard characters (% -> any no. of charcter and _ -> single character)

SELECT * FROM employees
WHERE first_name LIKE "s%";         -- return names starting with s

SELECT * FROM employees
WHERE job LIKE "_ook";              -- one random letter and rest are ook

--------------------------------------------------------------------------------------------------------

-- orderby clause (sorting)
SELECT * FROM employess             -- in ascending order (ASC)
ORDER BY last_name;

SELECT * FROM employees             -- in descending order
ORDER BY last_name DESC;

SELECT * FROM transactions          -- if multiple same values in first column, then compare using second
ORDER BY amount, customer_id;

--------------------------------------------------------------------------------------------------------------------

-- LIMIT clause  -  to limit number of records
SELECT * FROM customers             -- return first two records
LIMIT 2;

SELECT * FROM customers             -- return first record after ignoring first two (i.e will return 3rd record)
LIMIT 2, 1;

-----------------------------------------------------------------------------------------------------------------------------------

-- UNION -  combine result of two or more SELECT statements

SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM customers;        -- combine result of two table columns (by default doesnt support duplicate)

SELECT first_name, last_name FROM employees
UNION ALL
SELECT first_name, last_name FROM customers;        -- support duplicates

--------------------------------------------------------------------------------------------------------------------------------------------

-- SELF JOIN - join another copy of table to itself
SELECT a.customer_id, a.first_name, a.last_name,
    CONCAT(b.first_name," ",b.last_name) AS "referred_by"
FROM customers AS a
INNER JOIN customers AS b
ON a.referral_id = b.customer_id;                   

-----------------------------------------------------------------------------------------------------------------------------------------

-- views    - virtual table based on result-set of an SQL statement
            -- fields in a view are fields from one or more real tables in the database

CREATE VIEW employee_attendance AS
SELECT first_name, last_name
FROM employees;                         -- to create view

SELECT * FROM employee_attendance
ORDER BY last_name ASC;                 -- can perform ops on views

DROP VIEW employee_attendance;          -- to drop view

------------------------------------------------------------------------------------------------------------------------------

-- INDEX - BTree data structure
--       - Used to find values within a specific column more quickly
--       - MySQL normally searches sequentially through a column
--       - the longer the column, more expensive operation
--       - UPDATE takes more time, SELECT takes less time

SHOW INDEXES FROM customers;        -- display available indexes

CREATE INDEX last_name_idx          -- creates index for specified column (now speed ups searching)
ON customers(last_name);

CREATE INDEX last_name_first_name_idx
ON customers(last_name, first_name);        -- multicolumn index (search by last name if there is first name include it also)

ALTER TABLE customers
DROP INDEX last_name_idx;           -- drop the index

---------------------------------------------------------------------------------------------------------------------------------------------

-- SubQuery    - query within another query  

SELECT first_name, last_name, hourly_pay,
    (SELECT AVG(hourly_pay) FROM employees) AS avg_pay
FROM employees;

-----------------------------------------------------------------------------------------------

-- GROUP BY clause - aggregate all rows by specific column used with aggregate function

SELECT SUM(amount), order_date
FROM transactions
GROUP BY order_date;                   -- total money made on each date

-- can replace SUM() with MAX MIN AVG COUNT for more insight

SELECT COUNT(amount), customer_id
FROM transactions
GROUP BY customer_id
HAVING COUNT(amount) > 1 AND customer_id IS NOT NULL;   -- instead of WHERE use HAVING when using GROUP BY clause

----------------------------------------------------------------------------------------------------------------------------

-- ROLLUP - extension of group by, produces another row and shows grand total

SELECT SUM(amount), order_date
FROM transactions
GROUP BY order_date WITH ROLLUP;                   -- like genearte total sum at the end

-------------------------------------------------------------------------------------------------------------------------------------

-- ON DELETE SET NULL - when FK is deleted, replace FK with NULL
-- ON DELETE CASCADE  - when FK is deleted, delete row

CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
    ON DELETE SET NULL  -- or  ON DELETE CASCADE 
);

-----------------------------------------------------------------------------------------------------------------

-- Stored Procedure - prepared sql code that we can save

DELIMITER $$
CREATE PROCEDURE get_customers()
BEGIN
    SELECT * FROM customers;
END $$
DELIMETER ;

CALL get_customers();       -- to call procedure

DROP PROCEDURE get_customers();     -- to drop the procedure

-- with parameteres
DELIMITER $$
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
    SELECT *
    FROM customers
    WHERE customer_id = id;
END $$
DELIMITER ;

CALL find_customer(1);      -- find by id 1


DELIMITER $$
CREATE PROCEDURE find_customer(IN f_name VARCHAR(50),
                                IN l_name VARCHAR(50))
BEGIN
    SELECT *
    FROM customers
    WHERE first_name = f_name AND last_name = l_name;
END $$
DELIMITER ;

CALL find_customer("Larry","Lobster"); 

-----------------------------------------------------------------------------------------------

-- Trigger - When event happens, do something
--         - checks data, handle errors, audit tables

CREATE TRIGGER before_hourly_pay_update         -- before/after
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);

SHOW TRIGGERS;              -- to view triggers

-- on updating query trigger will work
UPDATE employees
SET hourly_pay = 50
WHERE employee_id = 1;
SELECT * FROM employees;

CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total - OLD.salary
WHERE expense_name = "salaries";