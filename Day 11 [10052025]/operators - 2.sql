CREATE DATABASE SAMPLE12;
USE SAMPLE12;

CREATE TABLE PROJECTS(
	ID INT,
    NAME VARCHAR(20),
    ASSIGNEDTO VARCHAR(20),
    START DATE,
    END DATE
);
INSERT INTO Projects VALUES
(1, 'Website Revamp', 'Alice', '2024-01-15', '2024-03-01'),
(2, 'Mobile App', 'Bob', '2024-02-01', NULL),
(3, 'Data Migration', NULL, NULL, NULL),
(4, 'SEO Optimization', 'Eve', '2024-03-10', '2024-04-20'),
(5, 'Cloud Migration', NULL, '2024-03-15', NULL);
TRUNCATE PROJECTS;
SELECT * FROM PROJECTS;

-- NULL OPERATOR

SELECT * FROM PROJECTS WHERE ASSIGNEDTO IS NULL;
SELECT * FROM PROJECTS WHERE START IS NULL;
SELECT * FROM PROJECTS WHERE END IS NOT NULL;
SELECT * FROM PROJECTS WHERE ASSIGNEDTO IS NOT NULL;

SELECT * FROM PROJECTS;
SET SQL_SAFE_UPDATES = 0;
UPDATE PROJECTS SET ASSIGNEDTO = "FRANK" 
WHERE ASSIGNEDTO IS NULL;
SELECT * FROM PROJECTS;

UPDATE PROJECTS SET START = CURDATE()
WHERE START IS NULL;
SELECT * FROM PROJECTS;

UPDATE PROJECTS SET NAME = "COMPLETED"
WHERE END IS NOT NULL;
SELECT * FROM PROJECTS; 

DELETE FROM PROJECTS
WHERE ASSIGNEDTO IS NULL;

DELETE FROM PROJECTS
WHERE END IS NOT NULL;
 
DELETE FROM PROJECTS
WHERE START IS NULL;
SELECT * FROM PROJECTS;


-- SPECIAL OPERATORS


CREATE TABLE ORDERS(
	ID INT,
    CUSTOMER_NAME VARCHAR(20),
    ORDER_DATE DATE,
    TOTAL_AMOUNT INT
);
INSERT INTO Orders VALUES
(1, 'Alice', '2024-03-01', 1500.00),
(2, 'Bob', '2024-03-05', 450.00),
(3, 'Charlie', '2024-03-10', 2500.00),
(4, 'Diana', '2024-03-15', 800.00),
(5, 'Eve', '2024-03-20', 1200.00),
(6, 'Frank', '2024-03-25', 3000.00);
SELECT * FROM ORDERS;

SELECT * FROM ORDERS 
WHERE ORDER_DATE BETWEEN "2024-3-3" AND "2024-3-10";
UPDATE ORDERS SET TOTAL_AMOUNT = TOTAL_AMOUNT + 1000
WHERE ORDER_DATE BETWEEN "2024-3-4" AND "2024-3-10";
SELECT * FROM ORDERS;
DELETE FROM ORDERS
WHERE ORDER_DATE BETWEEN "2024-3-10" AND "2024-3-20";
SELECT * FROM ORDERS;

CREATE TABLE EMP(
	ID INT,
    NAME VARCHAR(20),
    DEPT VARCHAR(10),
    SALARY INT
);
INSERT INTO Emp VALUES
(1, 'Alice', 'HR', 35000),
(2, 'Bob', 'IT', 50000),
(3, 'Charlie', 'Finance', 45000),
(4, 'Diana', 'Marketing', 40000),
(5, 'Eve', 'IT', 55000),
(6, 'Frank', 'Finance', 48000);
SELECT * FROM EMP;

SELECT * FROM EMP 
WHERE DEPT IN ("IT","FINANCE");

UPDATE EMP SET SALARY = SALARY + 2000
WHERE DEPT IN ("HR","MARKETING");
SELECT * FROM EMP;

DELETE FROM EMP
WHERE DEPT IN ("FINANCE","MARKETING");
SELECT * FROM EMP; 

CREATE TABLE STUDENTGRADES(
	ID INT,
    NAME VARCHAR(20),
    MARKS INT
);
INSERT INTO StudentGrades VALUES
(1, 'Alice', 92),
(2, 'Bob', 76),
(3, 'Charlie', 58),
(4, 'Diana', 83),
(5, 'Eve', 45),
(6, 'Frank', 67);
SELECT * FROM STUDENTGRADES;

SELECT *,
	CASE
		WHEN MARKS >= 90 THEN "A"
        WHEN MARKS >= 80 THEN "B"
        WHEN MARKS >= 70 THEN "C"
        WHEN MARKS >= 60 THEN "D"
        ELSE "F"
    END AS GRADE 
FROM STUDENTGRADES;

ALTER TABLE STUDENTGRADES ADD GRADES VARCHAR(20);
SELECT * FROM STUDENTGRADES;

UPDATE STUDENTGRADES SET GRADES = 
	CASE
		WHEN MARKS >= 90 THEN "A"
        WHEN MARKS >= 80 THEN "B"
        WHEN MARKS >= 70 THEN "C"
        WHEN MARKS >= 60 THEN "D"
        ELSE "F"
    END ;
SELECT * FROM STUDENTGRADES; 