-- Retrieve emp_no, First_name and Last_name from the employees table 

SELECT emp_no, first_name, last_name
FROM employees; 

-- Retrieve title, from_date, to_date from the titles table 
SELECT title, from_date, to_date
FROM titles; 

-- create a new table using the INTO clause - joined on the primary key 

SELECT e.emp_no, e.first_name, e.last_name, ts.title, ts.from_date, ts.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ts 
ON (e.emp_no = ts.emp_no) 
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no; 

--D1 - Query to create a retirement titles table for employees born between 1952 and 1955 
--D1 - Table is exported as retirement_titles CSV 

--Retrieve the employee number, first and last name and title columsn from the retirement titles table 
SELECT emp_no, first_name, last_name, title
FROM retirement_titles; 

--Use DISTINCT_ON to retrieve the first occurrence of the employee number for each set of rows
--info on SELECT DISTINCT from here - https://www.postgresql.org/docs/9.5/sql-select.html
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, to_date
FROM retirement_titles; 

--Filter on To date to keep only those dates equal to 9999-01-01
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, to_date
FROM retirement_titles; 
WHERE to_date = '9999-01-01'; 

--Create a unique titles table using the INTO clause 
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles 
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC; 

--D1 - Query is written and executed to create a unique titles table that contains employee number, first and last name, and most recent title 
--D1 - Table is exported as unique_titles.csv 

--Retrieve the number of employees by their most recent job title 
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC; 

--D1 - Query is written and executed to create a retiring titles table that contains the number of titles filled by employees retirinig
--D1 - Table is exported as retiring_titles.csv 

--DELIVERABLE TWO 
-- retrieve the emp_no, first name, last_name and birth_date columns from the employee table 
SELECT emp_no, first_name, last_name, birth_date 
FROM employees; 

--retrieve the from_date, to_date columns from the department employee table 
SELECT emp_no, from_date, to_date
FROM dept_emp; 

--retrieve the title column from the titles table 
select emp_no, title
FROM titles; 

--use a DISTINCT on statement to retrieve the first ocurrence of the employee number for each set of rows defined by the on() clause 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, t.from_date, t.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as t
	ON  e.emp_no = t.emp_no
INNER JOIN dept_emp as d
	ON e.emp_no = d.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND t.to_date = '9999-01-01'
ORDER BY e.emp_no;

--D2 - Query is written and executed to create a Mentorship eligiblity table for current employees who were born between 1/1/65 and 12/31/65
--D2 - Table is exported as mentorship_eligiblity

--D3 - Queries used in summary discussion
--determine total amount of salary savings if all employees eligible retire: 
SELECT e.emp_no, e.first_name, e.last_name, ts.title, ts.from_date, ts.to_date, s.salary
INTO retirement_salaries
FROM employees as e
INNER JOIN titles as ts 
ON (e.emp_no = ts.emp_no)
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND ts.to_date = '9999-01-01'
ORDER BY e.emp_no; 

--determine avg salaries by title 
SELECT title, AVG(salary)
FROM retirement_salaries
GROUP BY title; 

--determine overall average salary
SELECT AVG(salary)
FROM retirement_salaries; 

--determine total number of employees that are above targeted retirement age range 
SELECT e.emp_no, e.first_name, e.last_name, ts.title, ts.from_date, ts.to_date
--INTO retirement_titles
FROM employees as e
INNER JOIN titles as ts 
ON (e.emp_no = ts.emp_no) 
WHERE e.birth_date <'1952-01-01' 
ORDER BY e.emp_no; 

--determine list of employees who qualify for an expanded mentorship program 

--Mentorship eligibility determined on hiring date rather than birth date 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, e.hire_date,  t.from_date, t.to_date, t.title
FROM employees as e
INNER JOIN titles as t
	ON  e.emp_no = t.emp_no
INNER JOIN dept_emp as d
	ON e.emp_no = d.emp_no
WHERE (e.hire_date BETWEEN '1985-01-01' AND '1995-12-31') AND (e.birth_date NOT BETWEEN '1952-01-01' AND '1955-12-31') and t.to_date = '9999-01-01'
ORDER BY e.emp_no;

--Expanded birth date range for potential retirement candidates
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, e.hire_date,  t.from_date, t.to_date, t.title
FROM employees as e
INNER JOIN titles as t
	ON  e.emp_no = t.emp_no
INNER JOIN dept_emp as d
	ON e.emp_no = d.emp_no
WHERE (e.hire_date BETWEEN '1985-01-01' AND '1995-12-31') AND (e.birth_date NOT BETWEEN '1952-01-01' AND '1955-12-31') and t.to_date = '9999-01-01'
ORDER BY e.emp_no;

 


