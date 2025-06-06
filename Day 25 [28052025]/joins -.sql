CREATE DATABASE DB25;
USE DB25;

CREATE TABLE EMPDETAILS (
	ID INT PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    SALARY INT NOT NULL DEFAULT 0
);
INSERT INTO EMPDETAILS VALUES
(1,"JOHN",40000),
(2,"ALEX",25000),
(3,"SIMON",43000);
SELECT * FROM EMPDETAILS;


CREATE TABLE MARITIALSTATUS(
	ID INT PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    STATUS ENUM("MARRIED","UNMARRIED")
);
INSERT INTO MARITIALSTATUS VALUES
(1,"JOHN","MARRIED"),
(3,"SIMON","MARRIED"),
(4,"STELLA","UNMARRIED");
SELECT * FROM MARITIALSTATUS;

-- INNER JOIN

SELECT EMPDETAILS.ID,EMPDETAILS.NAME,SALARY,STATUS
FROM EMPDETAILS
INNER JOIN MARITIALSTATUS
ON EMPDETAILS.ID = MARITIALSTATUS.ID;

SELECT EMPDETAILS.ID,EMPDETAILS.NAME,SALARY,STATUS
FROM EMPDETAILS
JOIN MARITIALSTATUS
ON EMPDETAILS.ID = MARITIALSTATUS.ID;

-- LEFT JOIN 

SELECT EMPDETAILS.ID,EMPDETAILS.NAME,SALARY,STATUS
FROM EMPDETAILS
LEFT JOIN MARITIALSTATUS
ON EMPDETAILS.ID = MARITIALSTATUS.ID;

-- RIGHT JOIN

SELECT MARITIALSTATUS.ID,MARITIALSTATUS.NAME,SALARY,STATUS
FROM EMPDETAILS 
RIGHT JOIN MARITIALSTATUS
ON EMPDETAILS.ID = MARITIALSTATUS.ID;

-- FULL JOIN

SELECT EMPDETAILS.ID,EMPDETAILS.NAME,SALARY,STATUS
FROM EMPDETAILS
LEFT JOIN MARITIALSTATUS
ON EMPDETAILS.ID = MARITIALSTATUS.ID
UNION
SELECT EMPDETAILS.ID,EMPDETAILS.NAME,SALARY,STATUS
FROM EMPDETAILS
RIGHT JOIN MARITIALSTATUS 
ON EMPDETAILS.ID = MARITIALSTATUS.ID;

-- SELF JOIN

CREATE TABLE COLORS(
	C1 VARCHAR(20),
    NAME VARCHAR(20),
    C2 VARCHAR(20)
);
INSERT INTO COLORS VALUES
("BLUE","JOHN","RED"),
("GREEN","ALEX","BLUE"),
("RED","SIMON","GREEN");
SELECT * FROM COLORS;

SELECT COLORS1.NAME,COLORS2.NAME
FROM COLORS COLORS1 , COLORS COLORS2
WHERE COLORS1.C1 = COLORS2.C2;

-- PROBLEMS

CREATE TABLE EMPLOYEES(
	EMP_ID INT PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    DEPARTMENT_ID INT,
    SALARY INT NOT NULL
);
INSERT INTO employees (emp_id, name, department_id, salary) VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 2, 60000),
(103, 'Charlie', 2, 70000),
(104, 'David', 3, 45000),
(105, 'Eve', NULL, 40000),
(106, 'Frank', 4, 55000),
(107, 'Grace', 2, 62000);


CREATE TABLE DEPARTMENTS(
	DEPARTMENT_ID INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(20) NOT NULL
);
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Finance');

CREATE TABLE PROJECTS(
	PROJECT_ID INT PRIMARY KEY,
    PROJECT_NAME VARCHAR(20),
    EMP_ID INT
);
INSERT INTO projects (project_id, project_name, emp_id) VALUES
(201, 'Website Redesign', 102),
(202, 'Mobile App', 103),
(203, 'Ad Campaign', 104),
(204, 'Data Migration', 106),
(205, 'Backend Optimization', 107),
(206, 'Product Launch', NULL); 

SELECT NAME,DEPARTMENT_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

SELECT NAME,PROJECT_NAME
FROM EMPLOYEES
INNER JOIN PROJECTS
ON EMPLOYEES.EMP_ID = PROJECTS.EMP_ID;

SELECT NAME,DEPARTMENT_NAME
FROM EMPLOYEES
LEFT JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

SELECT NAME,PROJECT_NAME
FROM EMPLOYEES
LEFT JOIN PROJECTS
ON EMPLOYEES.EMP_ID = PROJECTS.EMP_ID;

SELECT DEPARTMENTS.DEPARTMENT_NAME,EMPLOYEES.NAME
FROM DEPARTMENTS
LEFT JOIN EMPLOYEES
ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID;

SELECT DEPARTMENTS.DEPARTMENT_NAME,EMPLOYEES.NAME
FROM DEPARTMENTS
RIGHT JOIN EMPLOYEES
ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID;

SELECT TABLE1.NAME,TABLE2.NAME
FROM EMPLOYEES TABLE1,EMPLOYEES TABLE2
WHERE TABLE1.DEPARTMENT_ID = TABLE2.DEPARTMENT_ID AND TABLE1.EMP_ID != TABLE2.EMP_ID;

SELECT TABLE1.NAME,TABLE2.NAME
FROM EMPLOYEES TABLE1,EMPLOYEES TABLE2
WHERE TABLE1.SALARY > TABLE2.SALARY;