DROP DATABASE IF EXISTS interview_commands_practice;
CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(60) NOT NULL,
    department VARCHAR(30) NOT NULL,
    city VARCHAR(40),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    employment_status ENUM('Active', 'Inactive') DEFAULT 'Active',
    phone VARCHAR(15) UNIQUE
) ENGINE = InnoDB;
INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
    (2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
    (3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
    (4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
    (5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
    (6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
    (7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
    (8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
    (9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
    (10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
select * from employees ;
select * from staff;

-- question no 1 .
INSERT INTO employees (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES (11, 'Karan Malhotra', 'IT', 'Noida', 41000.00, 'Active', 9000000011);

-- question no 2.
INSERT INTO employees (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES 
(12, 'Simran Kaur', 'HR', 'Delhi', 35000.00, 'Active', 9000000012),
(13, 'Rohan Das', 'Sales', 'Pune', 33000.00, 'Inactive', 9000000013);

-- question no 3.
UPDATE employees
SET city = 'Gurgaon', salary = 46000.00
WHERE employee_id = 11;

-- question no 4.
UPDATE employees
SET salary = salary * 1.10
WHERE employee_id IN (1, 4, 7);

-- question no 5.
DELETE FROM employees
WHERE employee_id IN (3, 8, 13);

-- question no 6.
ALTER TABLE employees
ADD COLUMN email VARCHAR(100) NULL;

-- question no 7.
ALTER TABLE employees
MODIFY COLUMN phone VARCHAR(20) NULL;

-- question no 8.
ALTER TABLE employees
RENAME COLUMN city TO work_city;

-- question no 9.
ALTER TABLE employees
DROP COLUMN email;

-- question no 10.
RENAME TABLE employees TO staff;

-- question no 11.
START TRANSACTION;
INSERT INTO staff
(employee_id, employee_name, department, work_city, salary, employment_status, phone)
VALUES
(14, 'Nisha Rao', 'IT', 'Noida', 44000.00, 'Active', '9000000014');
UPDATE staff
SET salary = 45000.00
WHERE employee_id = 2;
COMMIT;
ROLLBACK;
SELECT * FROM staff
WHERE employee_id IN (2, 14);

-- question no 12.
START TRANSACTION;
UPDATE staff
SET salary = 60000.00
WHERE employee_id = 5;
DELETE FROM staff
WHERE employee_id = 6;
ROLLBACK;
SELECT * FROM staff
WHERE employee_id IN (5, 6);

-- question no 13.
-- (A)
START TRANSACTION;
UPDATE staff
SET salary = 47000.00
WHERE employee_id = 14;
SAVEPOINT salary_saved;

-- (b)
UPDATE staff
SET salary = 47000.00
WHERE employee_id = 14;
SAVEPOINT salary_saved;

-- (c)
DELETE FROM staff
WHERE employee_id = 14;
ROLLBACK TO city_saved;

-- (d)
COMMIT;
SELECT employee_id, employee_name, salary, work_city
FROM staff
WHERE employee_id = 14;

-- question no 14.
START TRANSACTION;
TRUNCATE TABLE staff;
ROLLBACK;
SELECT * FROM staff;

-- question no 15.
DROP TABLE staff;
DROP DATABASE interview_commands_practice;
SHOW DATABASES;
