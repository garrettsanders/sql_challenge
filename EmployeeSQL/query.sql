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

