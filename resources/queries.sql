-- Determine Retirement Elegibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Determine How many employees will be ready for retiring
SELECT COUNT(*)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Query for employees born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT COUNT(*)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Query for employees born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT COUNT(*)
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- Query for employees born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT COUNT(*)
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- Narrow retirement elegibility criteria 
-- Hire date from 1985 to 1988
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT COUNT (*)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create retirement table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');