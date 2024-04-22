1.  SELECT employee_id, last_name, phone_number
    FROM  employess;

2.  SELECT employee_id, first_name, last_name, (salary/12) * 1.05
    FROM employees;

3.  SELECT employee_id, first_name, last_name, (salary/12) * 1.05 AS 'monthly salary'
    FROM employees;

4.  SELECT employee_id, CONCAT(first_name,' ',last_name)
    FROM employees;

5.  SELECT first_name, last_name AS LAST_NAME, hire_date
    FROM employees
    WHERE hire_date < '2001-01-01';

6.  SELECT employee_id, last_name, job_id
    FROM employees
    WHERE department_id = 50 AND salary > 5000
    ORDER BY salary DESC;

7.  SELECT employee_id, first_name, last_name
    FROM employess
    WHERE first_name LIKE '%st' OR last_name LIKE '%t';

8.  SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE salary > 5000 AND salary < 10000;

9.  SELECT employee_id, salary, comission_pct, manager_id
    FROM employees 
    WHERE comission_pct IS NOT NULL OR manger_id IS NOT NULL
    ORDER BY salry DESC, first_name ASC;


10. SELECT CONCAT(first_name,' ',last_name), phone_number, job_id
    FROM employees
    WHERE INSTR(upper(job_id), 'CLERK') > 0;
   <-- WHERE job_id LIKE '%CLERK%' -->

11. SELECT CONCAT(first_name,' ',last_name) AS name, LENGTH(first_name), email, hire_date, job_id
    FROM employees
    WHERE INSTR(UPPER(job_id), 'CLERK') > 0 AND LENGTH(first_name) >=3 AND hire_date < '2004-01-01';

12. SELECT DISTINCT job_id, salary
    FROM employees
    ORDER BY job_id ASC;
    