--#1
--List the employee number, last name, first name, sex, and salary of each employee (2 points)
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees AS e
JOIN salaries AS s on e.emp_no = s.emp_no
LIMIT 100;

--#2
--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
select e.first_name, e.last_name, e.hire_date
from employees AS e
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31'
LIMIT 10000;

--#3
--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name (2 points)

select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
JOIN employees AS e ON e.emp_no = dm.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE e.emp_title_id LIKE 'm%'
ORDER BY dm.dept_no
LIMIT 100;

--#4
--List the department number for each employee along with that employee’s employee number, last name, first name, 
--and department name (2 points)
select de.dept_no,de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
LIMIT 100;

--#5
--List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B (2 points)
select e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules'
and e.last_name like 'B%'
LIMIT 100;

--#6
--List each employee in the Sales department, including their employee number, 
--last name, and first name (2 points)
select e.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d on d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
LIMIT 1000;

--#7
--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select e.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d on d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
LIMIT 1000;

--#8
--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
select last_name, COUNT(last_name) AS Count
FROM employees
GROUP BY last_name
ORDER BY Count DESC
LIMIT 20000;
