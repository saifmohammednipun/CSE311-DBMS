-- 1. Subquery -1
-- Write a SQL query to find id, name, cgpa, city of all students who has same city as the city of the student with name 'Dipto'.
SELECT id, name, cgpa, city
FROM student
WHERE city = (SELECT city FROM student WHERE name = 'Dipto')

-- 2. Subquery -2
-- Find id, courseid and year for all students who have taken any course taken by id 1002 in semester 2.
SELECT id, courseid, year
FROM takes
WHERE courseid IN (SELECT courseid FROM takes WHERE id = 1002 AND semester = 2)

-- 3. Subquery -3
-- Find id, name and courseid for all students who have taken any course taken by id 904 in year 2012.
Select s.id, s.name, t.courseid
From student s join on takes t
Where t.courseid IN (Select courseid From takes Where id = 904 and year = 2012)

-- 4. Subquery -4
-- Find id, name, street and city of all students who have paid the same fee as paid by id 4525.
SELECT id, name, street, city
FROM student
WHERE feepaid = (SELECT feepaid FROM student WHERE id = 4525)

-- 5. Subquery -5
-- Write a SQL query to find first_name, last_name, phone_number, salary for all employees whose salary is more than the salary of employees with first name 'Nancy' or 'Daniel'
SELECT first_name, last_name, phone_number, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Nancy' or 'Daniel')

-- 6. Subquery -6
-- Write a SQL statement to show the first_name, last_name, email, salary and department_id whose department_id is the same department_id of employees with first_name 'David' and last_name 'Fripp'. Sort the result in descending order of department_id.
SELECT first_name, last_name, email, salary, department_id
FROM employees
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         WHERE first_name = 'David' OR last_name = 'Fripp')
ORDER BY department_id DESC

-- 8. Subquery -8
-- Find employee id, job id, job title and salary of all employees who have the same job id as first name 'David'
SELECT e.employee_id, e.job_id, j.job_title, e.salary
FROM employees e Natural JOIN jobs j
WHERE e.job_id IN ( SELECT job_id
                    FROM employees
                    WHERE first_name = 'David')
  
-- 7. Subquery -7
-- Write a SQL statement to show the first name, last name, department_name, street_address of all employees whose department_id is the same department_id of employees with first_name 'David'.
SELECT e.first_name, e.last_name, d.department_name, l.street_address
FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
WHERE e.department_id IN ( SELECT department_id
                           FROM employees
                           WHERE first_name = 'David')

-- 9. Subquery -9
-- Find employee id, department id, department name and salary of all employees who have the same department name as the department name of first name 'Neena'
SELECT e.employee_id, e.department_id, d.department_name, e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = ( 
    SELECT department_name
    FROM employees
    WHERE first_name = 'Neena'
)

-- 10. Subquery -10
-- Find location id, street address and postal codes of all locations that have the same region id as the region id of region 'Asia'
SELECT location_id, street_address, postal_code
FROM locations
WHERE country_id IN ( SELECT country_id
                      FROM countries
                      WHERE region_id = ( SELECT region_id
                                          FROM regions
                                          WHERE region_name = 'Asia'))