 
1.  SELECT * 
    FROM regions;

2.  SELECT *
    FROM departments;

3.  SELECT *
    FROM employees;


4.  SELECT DISTINCT job_id
    FROM employees;

5.  SELECT DISTINCT city
    FROM location;


6.  SLECET country_name, region_id
    FROM country
    WHERE region_id = 1;


7.  SELECT job_title, max_salary, min_salary
    FROM employees;


8.  SELECT ob_title, max_salary, min_salary
    FROM employeesWHERE job_title LIKE 'P%';


9.  SELECT first_name, last_name, job_id, salary 
    ROM employees
    WHERE first_name LIKE '%en';


10. SELECT job_title, (max_salary-min_salary) AS salary_difference
    FROM jobs;

11. SELECT first_name, last_name, (0.05 * salary) AS incentive_salary
    FROM employees;


12. SELECT job_id, (100 * ((maximum_salary - minimum_salary) / minimum_sa;lary)) AS 'Salary Gap'
    FROM jobs;

13. SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE employee_id > 100 and employee_id =< 196 and firs_name LIKE 'A%'
    ORDER BY salary ASC;

