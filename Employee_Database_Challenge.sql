-- Use Dictinct with Orderby to remove duplicate rows
-- SELECT * FROM titles;
-- SELECT * FROM retirement_titles

DROP TABLE IF EXISTS retirement_titles;
SELECT DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date

INTO retirement_titles
FROM employee as em
	LEFT JOIN titles as ti
		ON em.emp_no = ti.emp_no
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no, to_date DESC;

-- Get titles of employees who are still working here
DROP TABLE IF EXISTS unique_titles;
SELECT emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Get the count of all the different titles
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles;

-- Get employees who can mentor next gen
DROP TABLE IF EXISTS mentorship_eligibility;
SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date,
	de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employee as em
	JOIN dept_emp as de
		ON em.emp_no = de.emp_no
	JOIN titles as ti
		ON em.emp_no = ti.emp_no
WHERE (ti.to_date = '9999-01-01')
	AND (em.birth_date BETWEEN '1965-01-01' AND
		'1965-12-31')
ORDER BY em.emp_no, de.to_date DESC;

SELECT * FROM mentorship_eligibility;