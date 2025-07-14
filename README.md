# DSA-Documentation-SQL-
A collection of notes, examples, and projects showcasing my understanding of SQL concepts learned through the DSA Data Analysis Course.
## Structured Query Language (SQL)
1. Introduction to SQL
    - Definition of SQL
    - Importance of SQL
    - Types of SQL (e.g., MySQL, PostgreSQL, SQL Server)
    - types of SQL Commands (DDL, DML, DCL, TCL AND DQL)
    - Types, uses and importance of keys in SQL (Primary Key, Foreign Key)
    - Understanding Data types in SQL (Varchar, Date, NVarchar, etc.)

2. Creating Databases and Tables
    - How to create and name a database
    - How to create tables tables (data types, constraints, etc.)
    - How to import data from other sources into your table
    - Example database and table creation scripts
##  Example: 
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
    - Introduction to SQL queries (SELECT, DROP, TRUNCATE, DELETE, FROM, WHERE, etc.)
## Example: -- Simple SELECT query
            SELECT * FROM Employees;

    - Filtering and sorting data
## Example: -- Filtering data
            SELECT * FROM customers WHERE country='Nigeria';

    - Joining tables (LEFT JOIN, INNER JOIN, FULL OUTER JOIN, etc.)
    - How to union tables
## Example: select * from [dbo].[DSA_Mall_Ghana]
            union
            select * from [dbo].[DSA_Mall_Ikeja]
            union
            select * from [dbo].[DSA_Mall_Port_Harcourt]

    - Aggregating data (GROUP BY, HAVING, etc.)

4. SQL Clauses
    - WHERE clause
    - GROUP BY clause
    - HAVING clause
    - ORDER BY clause
    - Understanding and using Logical Operators in SQL (AND, OR)

5. SQL Views
    - What are SQL views?
    - Creating and managing views
    - Benefits and uses of views
  

