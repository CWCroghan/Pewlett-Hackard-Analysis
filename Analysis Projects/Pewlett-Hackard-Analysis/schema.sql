-- Creating tables for the Database
Create table departments(
	dept_no varchar(4) not null,
	dept_name varchar(40) NOT NULL,
	primary key (dept_no),
	unique (dept_name)
);

Create Table employees (
	emp_no int Not Null,
	birth_date date Not Null,
	first_name varchar Not Null,
	last_name varchar Not Null,
	gender varchar Not Null,	
	hire_date date Not Null,
	Primary Key (emp_no)
);

Create Table dept_manager (
	dept_no varchar(4) Not Null,
	emp_no int Not Null,
	from_date date Not Null,
	to_date date Not Null,
Foreign Key (dept_no) References Departments (dept_no),
Foreign Key (emp_no) References Employees (emp_no),
	Primary Key (emp_no, dept_no)	
);

Create Table salaries (
	emp_no int  Not Null, 
	salary int Not Null,
	from_date date  Not Null,
	to_date date Not Null,
Foreign Key (emp_no) References Employees (emp_no),
	Primary Key (emp_no)
);


-- Retirement eligibility

select first_name, last_name
From employees
where (birth_date Between '1952-01-01' AND '1955-12-31') and
(hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of Elig Retires
select count(first_name) 
From employees
where (birth_date Between '1952-01-01' AND '1955-12-31') and
(hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select emp_no, first_name, last_name
into retimement_info
From employees
where (birth_date Between '1952-01-01' AND '1955-12-31') and
(hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select * from retimement_info

Create Table titles (
	emp_no int Not Null,  
	title varchar(25) Not Null, 
	from_date date Not Null, 
	to_date date Not Null, 
Foreign Key (emp_no) References Employees (emp_no),
	Primary Key (emp_no, from_date)
);


Create Table dept_emp (
	emp_no int Not Null,  
	dept_no varchar(4) Not Null,
	from_date date Not Null, 
	to_date date Not Null, 
Foreign Key (emp_no) References Employees (emp_no),
Foreign Key (dept_no) References Departments (dept_no),
	Primary Key (emp_no, dept_no)
);
select * from departments;