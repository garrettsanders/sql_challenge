DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE employees(
emp_no INT,
birth_date DATE,
first_name VARCHAR(30),
last_name VARCHAR(30),
gender VARCHAR(30),
hire_date DATE,
PRIMARY KEY (emp_no)
);

CREATE TABLE departments(
dept_no VARCHAR(30),
dept_name VARCHAR(30),
PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp(
emp_no INT,
dept_no VARCHAR(30),
from_date DATE,
to_date DATE,
PRIMARY KEY (dept_no)
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager(
dept_no VARCHAR(30),
emp_no INT,
from_date DATE,
to_date DATE,
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
									

CREATE TABLE salaries(
emp_no INT,
salary INT,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE titles(
emp_no INT,
title VARCHAR(30),
from_date DATE,
to_date DATE,
PRIMARY KEY (title),
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
--Inner join to on employees and salaries tables

SELECT * FROM employees
SELECT * FROM salaries

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--Find all employees hired in 1986
SELECT hire_date
FROM employees
WHERE date_part('year', hire_date)=1986;

--Manager of each department
--Need emp_no, last_name, first_name, department name
SELECT * FROM dept_manager
SELECT * FROM departments
SELECT * FROM employees

SELECT dept_manager.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_manager 
INNER JOIN employees ON dept_manager.emp_no=employees.emp_no
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no


--Department of each employee
--Need emp_no, last_name, first_name, department_name
SELECT * FROM dept_emp

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees

SELECT first_name, last_name
FROM employees
WHERE first_name='Hercules' AND last_name LIKE'B%';


--List all employees in the Sales department
--Need emp_no, last_name, first_name, department name
SELECT * FROM departments
SELECT * FROM employees
SELECT * FROM dept_emp

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales';


--List all employees in the Sales and Development departments
--Need emp_no, last_name, first_name, department name

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales' OR departments.dept_name='Development'


--In descending order, list the frequency count of employee last names
SELECT * FROM employees

SELECT last_name, COUNT(last_name) AS frequency 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
