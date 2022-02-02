drop table if exists departments

create table departments(
	dept_no varchar(4) not null,
	dept_name varchar(40) not null,
	primary key (dept_no),
	unique (dept_name)
);
	
create table employee(
	emp_no int not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null,
	primary key (emp_no)
);