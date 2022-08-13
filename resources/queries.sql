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

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     m.emp_no,
     m.from_date,
     m.to_date
FROM departments d
INNER JOIN dept_manager m
ON d.dept_no = m.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT  r.emp_no,
		r.first_name,
		r.last_name,
    	d.to_date
FROM retirement_info r
LEFT JOIN dept_emp d ON r.emp_no = d.emp_no;

SELECT ri.emp_no, ri.first_name, ri.last_name, de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de 
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO retirement_bydept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- List 1 Employee Information
SELECT * FROM salaries
ORDER BY to_date DESC;
	
-- Create new temp table including genre
SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Use an inner join to get info on salaries and to_date
-- from the salaries table
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
-- INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
		AND (de.to_date = '9999-01-01');

-- List 2 Management
SELECT dm.dept_no, d.dept_name, dm.emp_no, ce.last_name, ce.first_name,
		dm.from_date, dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
ON (dm.emp_no = ce.emp_no);

SELECT *
FROM manager_info

-- List 3 Department Retirees
SELECT ce.emp_no, ce.first_name, ce.last_name, d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- List of emp_no, first_name, last_name, dept_name for the sales dept
SELECT rf.emp_no, rf.first_name, rf.last_name, d.dept_name
INTO sales_retirement_info
FROM departments AS d
INNER JOIN dept_emp AS de
ON (d.dept_no = de.dept_no)
INNER JOIN retirement_info AS rf
ON (de.emp_no = rf.emp_no)
WHERE d.dept_name = 'Sales';