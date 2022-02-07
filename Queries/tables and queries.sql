-- Drop retirement_info table if it exists
DROP TABLE IF EXISTS retirement_info;

SELECT emp_no, first_name, last_name
FROM employee
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Create retirement_info table with emp_no included

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employee
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
SELECT *
FROM retirement_info;

DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
	dept_no varchar(4) not null,
	emp_no int not null,
	from_date DATE,
	to_date DATE,
	primary key (emp_no)
);

-- SELECT *
-- FROM dept_manager

