CREATE DATABASE HELLO9;
USE HELLO9;

CREATE TABLE EMPLOYEES(
	EMP_ID INT,
    EMP_NAME VARCHAR(50),
    SALARY DECIMAL(10,2),
    JOINING_DATE DATE
);

CREATE TABLE PRODUCTS(
	PRODUCT_ID INT,
    PRODUCT_NAME VARCHAR(100),
    PRICE FLOAT,
    MANFACTURING_DATE TIMESTAMP
);

CREATE TABLE STUDENTS(
	STUDENT_ID SMALLINT,
    STUDENT_NAME VARCHAR(50),
    AGE TINYINT,
    HEIGHT FLOAT
);

CREATE TABLE ARTICLES(
	ARTICLE_ID INT,
    TITLE VARCHAR(200),
    CONTENT TEXT
);

CREATE TABLE EMPLOYEES1(
	EMP_ID INT,
    EMP_NAME VARCHAR(50),
    GENDER ENUM("MALE","FEMALE","OTHERS"),
    JOB_ROLE ENUM("Developer","Manager","Tester")
);


create table students1(
	student_id int,
    student_name varchar(50),
    hobbies set("reading","music","sports","travelling")
);

CREATE TABLE PRODUCTS1(
	PRODUCT_ID INT,
    PRODUCT_NAME VARCHAR(50),
    COLOUR ENUM("RED","BLUE","GREEN")
);