--Data Analysis

--1st List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name , e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

--2nd List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

--3rd List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
JOIN Departments d
  ON (d.dept_no = dm.dept_no)
JOIN employees e
ON (dm.emp_no = e.emp_no);

--4th List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_emp as de
JOIN employees e
ON (e.emp_no = de.emp_no)
 JOIN Departments d
  ON (d.dept_no = de.dept_no);

--5th List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT  first_name, last_name , sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6th List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
  SELECT emp_no
  FROM dept_emp
  WHERE dept_no IN
  (
    SELECT dept_no
    FROM Departments
    WHERE dept_no='d007'
	)
);

--7th List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp
ON (e.emp_no = dept_emp.emp_no)
	JOIN departments AS d
	ON (dept_emp.dept_no = d.dept_no) 
	WHERE dept_name IN ('Sales','Development');
  
--8th List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name,COUNT(last_name)
From Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;