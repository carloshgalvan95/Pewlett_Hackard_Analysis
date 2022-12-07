-- Deliverable 1
-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp.emp_no,
	   emp.first_name,
	   emp.last_name,
-- Retrieve the title, from_date, and to_date columns from the Titles table.
	   tl.title,
	   tl.from_date,
	   tl.to_date
-- Create a new table using the INTO clause.
INTO retiring_emp
-- Join both tables on the primary key.
FROM employees as emp
INNER JOIN titles as tl ON emp.emp_no = tl.emp_no
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no;
-- Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no) 
					emp_no,
					first_name,
					last_name,
					title
-- Create a Unique Titles table using the INTO clause.
INTO unique_titles
FROM retiring_emp
-- Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
WHERE (to_date = '9999-01-01')
-- Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
ORDER BY emp_no, to_date DESC;
-- Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

-- retrieve the number of employees by their most recent job title who are about to retire.
-- First, retrieve the number of titles from the Unique Titles table.
SELECT COUNT(title), 
			 title
-- create a Retiring Titles table to hold the required information.
INTO retiring_titles
FROM unique_titles
-- Group the table by title, then sort the count column in descending order.
GROUP BY title
ORDER BY COUNT DESC;
-- Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

-- Deliverable 2
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp.emp_no)
	   				emp.emp_no,
	   				emp.first_name,
	   				emp.last_name,
	   				emp.birth_date,
-- Retrieve the from_date and to_date columns from the Department Employee table.
       				de.from_date,
	   				de.to_date,
-- Retrieve the title column from the Titles table.
       				tl.title
-- Create a new table using the INTO clause.
INTO mentorship_program
FROM employees as emp
-- Join the Employees and the Department Employee tables on the primary key.
INNER JOIN dept_emp AS de ON (emp.emp_no = de.emp_no)
-- Join the Employees and the Titles tables on the primary key.
INNER JOIN titles AS tl ON (emp.emp_no = tl.emp_no)
-- Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
WHERE (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = ('9999-01-01')
-- Order the table by the employee number.
ORDER BY emp.emp_no;
-- Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
