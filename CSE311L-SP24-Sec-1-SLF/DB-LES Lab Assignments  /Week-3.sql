1.  SELECT max(salary), min(salary), sum(salary), avg(salary)
    FROM employees;

2.  SELECT count(*)
    FROM employees
    WHERE salary > 5000;

3.  SELECT count(DISTINCT salary)
    FROM employees
    WHERE salary > 5000;

4.  SELECT department_id, count(*)
    FROM employees
    GROUP BY department_id
    ORDER BY count(*) DESC;

5.  SELECT department_id, job_id, count(*) AS num_emp, sum(salary) AS tot_sal
    FROM employees
    GROUP BY department_id, job_id;

6.  SELECT department_id, max(salary), min(salary), avg(salary)
    FROM employees
    GROUP BY department_id;

7.  SELECT job_id, salarry
    FROM employees
    ORDER BY job_id ASC;

8.  SELECT job_id, max(salary), min(salary), avg(salary)
    FROM employees
    ORDER BY job_id ASC


9.  SELECT job_id, max(salary), min(salary), avg(salay)
    FROM employees
    WHERE salary < 10000
    GROUP BY job_id;

10. SELECT job_id, max(salary), min(salary), avg(salary)
    FROM employees
    WHERE salary < 10000
    GROUP BY job_id
    HAVING avg(salary) > 5000
    ORDER BY job_id ASC;

11. SELECT department_id, job_id, sum(salary)
    FROM employees
    WHERE department_id > 50
    GROUP BY job_id, department_id
    HAVING salary > 20000
    ORDER BY sum(salary) DESC;

