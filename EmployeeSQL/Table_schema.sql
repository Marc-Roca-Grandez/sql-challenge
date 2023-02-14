DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE Departments (
    dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30)NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(5)NOT NULL PRIMARY KEY,
    title VARCHAR(30)
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title VARCHAR(5) ,
	birth_date DATE, 
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date DATE,
	--FOREIGN KEY (emp_no) REFERENCES salaries(emp_no) OR REFERENCES dept_manager(emp_no) OR  REFERENCES dept_empt(emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);