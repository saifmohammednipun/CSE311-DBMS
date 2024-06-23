SELECT *
FROM countries;

SELECT first_name, salary+1000
FROM employees
WHERE department_id = 100;

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5
OFFSET 4

