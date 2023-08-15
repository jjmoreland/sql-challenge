DROP TABLE titles
DROP TABLE departments
DROP TABLE employees
DROP TABLE salaries
DROP TABLE dept_emp
DROP TABLE dept_manager

CREATE TABLE titles (
title_id VARCHAR (5) PRIMARY KEY,
title VARCHAR (25) NOT NULL
);
--Max length of title_id is 5.
--Max length of title is 18.
--New titles might be used in future and therefore used 25 as max characters

CREATE TABLE departments (
  dept_no VARCHAR (5) PRIMARY KEY,
  dept_name VARCHAR (25) NOT NULL
);


CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR (25) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(5) NOT NULL,
  hire_date DATE NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);


CREATE TABLE salaries (
  emp_no INT PRIMARY KEY,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
	dept_no VARCHAR (5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR (5) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);
	
