# DSA-Documentation-SQL-
A collection of notes, examples, and projects showcasing my understanding of SQL concepts learned through the DSA Data Analysis Course.
## Structured Query Language (SQL)
1. Introduction to SQL
    - Definition of SQL
    - Importance of SQL
    - Types of SQL (e.g., MySQL, PostgreSQL, SQL Server)
    - Types, uses and importance of keys in SQL (Primary Key, Foreign Key)

2. Creating Databases and Tables
    - How to create and name a database
    - How to create tables tables (data types, constraints, etc.)
    - How to import data from other sources into your table
    - Example database and table creation scripts
###  Examples: 
create database DSA_db

create Table Employee (
Staff_id varchar (10),
First_Name varchar (255),
Last_Name varchar (255),
Gender varchar (10),
Date_of_Birth date,
Hire_Date datetime,
primary key (Staff_id)
)

-----import CSV FILES INTO DB-----
---EMPLOYEE.CSV
---SALARY.CSV
---PAYMENT.CSV

3. SQL Queries
    - Introduction to SQL queries (SELECT, FROM, WHERE, etc.)
    - Filtering and sorting data
    - Joining tables (LEFT JOIN, INNER JOIN, FULL OUTER JOIN, etc.)
    - How to union tables
    - Aggregating data (GROUP BY, HAVING, etc.)

4. SQL Clauses
    - WHERE clause
    - GROUP BY clause
    - HAVING clause
    - ORDER BY clause
      Using BETWEEN, AND, OR in SQL

5. SQL Views
    - What are SQL views?
    - Creating and managing views
    - Benefits and uses of views
  

