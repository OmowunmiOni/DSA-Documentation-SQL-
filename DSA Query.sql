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

select * from Employees

----create table salary-----
CREATE TABLE Salary (
salary_id int identity (1,1)not null,
Staffid varchar (255),
firstname varchar (255),
lastname varchar (255),
department nvarchar(max),
salary decimal (10, 3) ---(10: precision, 3:scale)
)
select * from Salary

insert into salary (staffid, firstname, lastname, department, salary)
values ( 'AB401', 'ayan', 'olakun', 'Information Tech.', 45000.45),
( 'AB212', 'okorie', 'mercy','Account',500000.99999),
( 'AB223', 'joshua', 'chukwuemeka', 'Human Resources',100560.9339999),
( 'AB234', 'sanni', 'ibrahim', 'Sales and Marketing',845688.99),
( 'AB254', 'mercy', 'olanipekun', 'Account',8889.999999),
( 'AB249', 'johnson', 'mercy', 'Information Tech.',234000.90909090),
( 'AB298', 'ayomide', 'halleluyah', 'Logistics', 678000.991999),
( 'AB260', 'deborah', 'justin', 'Logistics',900099.00697969),
( 'AB281', 'wale', 'olanipekun', 'Information Tech',873093.2344)

drop table Salary


-----create table payment

CREATE TABLE Payment (
paymentid int identity (1,1) primary key,
Account_No bigint not null,
staffid int,
Bank varchar (255) default 'Zenith Bank',
Payment_Method varchar (50) check (Payment_Method = 'Cash' or Payment_Method = 'Transfer')
)

select * from Payment

insert into Payment (account_no,staffid,payment_method )
values (2033030303, 'AB200', 'transfer'),
(2123459910, 'AB401',  'transfer'),
(2034562240, 'AB254',  'cash'),
(2234556303, 'AB212',  'transfer'),
(2033037703, 'AB249',  'cash'),
(2033030303, 'AB298',  'cash'),
(2455657503, 'AB260',  'transfer'),
(2045595953, 'AB281',  'cash'),
(2033030303, 'AB273',  'transfer'),
(2077778903, 'AB299',  'transfer'),
(2033030301, 'AB286', 'transfer'),
(2123459911, 'AB260',  'transfer'),
(2034562241, 'AB270',  'cash'),
(2234556302, 'AB104',  'transfer'),
(2033037705, 'AB268',  'cash'),
(2033030306, 'AB270',  'cash'),
(2455657509, 'AB300',  'transfer')

alter table payment
alter column staffid varchar (50)

drop table Payment

-----------15/05/2025---------

select * from Employees

select * from Salary

select * from Payment

-----USE OF SQL COMMAND-----

UPDATE Employees
set lastname = 'Abubakar'
where staffid = 'AB234'

UPDATE Salary
set department = 'Information Tech.'
where staffid = 'AB223'

-----CREATE STATE_OF_ORIGIN-----

alter table Employees
add [State of Origin] varchar (100)

select * from Employees

update Employees
set [state of origin] = 'Delta'
where staffid = 'AB299'


---------Analysis----

---total number of staff

select count(staffid) as TotalEmployee 
from Employees

----calculate total number of staff from each state

select [STATE OF ORIGIN], count(distinct staffid) as TotalEmployees 
from Employees
group by [STATE OF ORIGIN]
order by TotalEmployees asc

----calculate total number of staff from each department

select  DEPARTMENT, count(distinct staffid) as TotalEmployees 
from Salary
group by Department
order by TotalEmployees desc

select  DEPARTMENT, count(distinct staffid) as TotalEmployees 
from Salary
group by Department
order by TotalEmployees asc

select * from Salary

update salary
set department = 'Information Tech'
where Staffid IN ('AB401', 'AB249','AB223')

select * from Salary

---HAVING-

select  DEPARTMENT, count(distinct staffid) as TotalEmployees 
from salary
group by department
HAVING count(distinct staffid) >3

select  DEPARTMENT, count(distinct staffid) as TotalEmployees 
from salary
group by department
HAVING count(distinct staffid) >=3

select  DEPARTMENT, count(distinct staffid) as TotalEmployees 
from salary
group by department
HAVING count(distinct staffid) <3

-----RELATIONAL OPERATORS/COMPARISON OPERATORS
----LESS THAN <
---GREATER THAN >

SELECT * FROM  salary
WHERE salary > 500000

SELECT * FROM  salary
WHERE salary >=500000

SELECT * FROM  salary
WHERE salary < 500000

SELECT * FROM  salary
WHERE salary <=500000


----RANGE OPERATORS
----BETWEEN
----NOT BETWEEN

SELECT * FROM  salary
WHERE Salary BETWEEN 50000 AND 200000

SELECT * FROM  salary
WHERE salary NOT BETWEEN 100000 AND 500000

----19/05/2025
----LIST OPERATORS
-----1. IN
-----2. NOT IN

SELECT * FROM Employees
WHERE STAFFID IN ('AB270', 'AB286', 'AB401')

SELECT * FROM Employees
WHERE STAFFID  NOT IN ('AB270', 'AB286', 'AB401')


SELECT * FROM Employees
WHERE FIRSTNAME IN ('johnson', 'mercy', 'okorie')


SELECT * FROM Employees
WHERE FIRSTNAME NOT IN ('johnson', 'mercy', 'okorie')


----LOGICAL OPERATOR
----AND
----OR

SELECT * FROM Employees
WHERE FIRSTNAME = 'ADEBOWALE' AND GENDER = 'FEMALE'

SELECT * FROM Employees
WHERE FIRSTNAME = 'ADEBOWALE' AND GENDER = 'MALE'

-------OR

SELECT * FROM Employees
WHERE FIRSTNAME = 'ADEBOWALE' OR GENDER = 'FEMALE'

SELECT * FROM Employees
WHERE FIRSTNAME = 'ADEBOWALE' OR GENDER = 'BOY'

SELECT * FROM SALARY
WHERE FIRSTNAME = 'JOHNSON' AND department = 'ACCOUNT'

SELECT * FROM SALARY
WHERE FIRSTNAME = 'JOHNSON' OR department = 'ACCOUNT'

SELECT * FROM SALARY
WHERE FIRSTNAME = 'JOHNSON' OR department = 'INFORMATION TECH'

SELECT * FROM SALARY
WHERE FIRSTNAME = 'JOHNSON' AND department = 'INFORMATION TECH'

SELECT * FROM Employees
WHERE GENDER = 'MALE' AND DATE_OF_BIRTH = '1982-10-09' 
AND [STATE OF ORIGIN] = 'Delta'

-----UPDATE--
UPDATE salary
SET Staffid = 'AB350'
WHERE Staffid = 'AB401'

----5% OR 0.05

---UPDATE salary
--SET salary  = salary * 0.05

UPDATE salary
SET salary  = salary * 1.05

UPDATE Salary
SET salary  = salary + (salary * 0.05)

SELECT * FROM SALARY

----SQL JOIN
SELECT * FROM Employees

SELECT * FROM salary

SELECT * FROM PAYMENT

----JOIN----

SELECT Employees.staffid,
       Employees.firstname,
	   Employees.gender,
	   Employees.hiredate,
	   salary.salary_id,
	   salary.department,
	   salary.salary
from employees
join salary
on salary.Staffid = Employees.staffid

SELECT Employees.staffid,
       Employees.firstname,
	   Employees.gender,
	   Employees.hiredate,
	   salary.salary_id,
	   salary.department,
	   salary.salary
from employees
full outer join salary
on salary.Staffid = Employees.staffid

employees e
salary s

SELECT Employees.staffid,
       Employees.firstname,
	   Employees.gender,
	   Employees.hiredate,
	   salary.salary_id,
	   salary.department,
	   salary.salary
from employees
inner join salary
on salary.Staffid = Employees.staffid

SELECT Employees.staffid,
       Employees.firstname,
	   Employees.gender,
	   Employees.hiredate,
	   salary.salary_id,
	   salary.department,
	   salary.salary
from employees
left join salary
on salary.Staffid = Employees.staffid

SELECT Employees.staffid,
       Employees.firstname,
	   Employees.gender,
	   Employees.hiredate,
	   salary.salary_id,
	   salary.department,
	   salary.salary
from employees
right join salary
on salary.Staffid = Employees.staffid

---sql query optimization
SELECT e.staffid,
       e.firstname,
	   e.gender,
	   e.hiredate,
	   s.salary_id,
	   s.department,
	   s.salary
from Employees e
join salary s
on s.Staffid = e.staffid    

-----3 tables

SELECT Employees.staffid,salary.salary_id,payment.paymentid,
       Employees.firstname,Employees.gender,Employees.hiredate,
	   salary.department,salary.salary,payment.account_no,
	   payment.bank, payment.payment_method
from Employees
join salary
on salary.Staffid = Employees.staffid
join payment
on payment.staffid = Employees.staffid


-------21/05/2025


-----3 tables
SELECT Employees.staffid,
       salary.salary_id,
	   payment.paymentid,
       Employees.firstname,
	   Employees.gender,
	   Employees.hiredate,
	   salary.department,
	   salary.salary,
	   payment.account_no,
	   payment.bank, 
	   payment.payment_method
from Employees
join salary
on salary.Staffid = Employees.staffid
join payment
on payment.staffid = salary.staffid


----sub-queries : queries inside queries

select * from Employees
select * from salary
---------
select * from (
    select staffid, firstname, lastname, gender, hiredate, 
	[state of origin] 
	       from Employees) As Emp
join (
    select staffid, salary_id, department, salary
	    from salary) as Sal
on emp.staffid = sal.Staffid


--analysis

select * from salary

--- top 3 highest paid employee 

select top 3 * from (
       select staffid, firstname, lastname, salary
	          from salary) AS Sal
order by salary desc

select top 5 * from (
       select staffid, firstname, lastname, salary
	          from salary) AS Sal
order by salary desc

--- top 3 lowest paid employee


---- 3 lowest paid employee 
select top 3
     staffid, firstname, lastname, salary
from salary
order by salary asc


---average salary by department
select department, AVG(salary) AS AverageSalary
    from (
	     select department, salary
		     from salary ) AS DeptSalary
group by  department

-------
select department, AVG(salary) as averagesalary
from salary
group by department


------sql view------
create view vw_emplysalary_tbl
as
SELECT Employees.staffid,
       Employees.firstname,
	   Employees.gender,
	   Employees.hiredate,
	   salary.salary_id,
	   salary.department,
	   salary.salary
from Employees
join salary
on salary.Staffid = Employees.staffid
 

 select * from vw_emplysalary_tbl


 DROP vw_emplysalary_tbl

 -----UNION & UNION ALL

create table  DSA_Mall_Ghana (
CustomerID INT not null,
FirstName varchar (max),
LastName  varchar (max),
Customer_gender nvarchar(max),
TransactionDate DATE DEFAULT GETDATE(),
[Address] varchar (max),
Transaction_Amount decimal (18, 4)
)

select * from DSA_Mall_Ghana 

drop table DSA_Mall_Ghana

select * from DSA_Mall_Ghana 

create table  DSA_Mall_Ikeja (
CustomerID INT not null,
FirstName varchar (max),
LastName  varchar (max),
Customer_gender nvarchar(max),
TransactionDate DATE DEFAULT GETDATE(),
[Address] varchar (max),
Transaction_Amount decimal (18, 4)
)

SELECT * FROM DSA_Mall_Ikeja

insert into DSA_Mall_Ikeja ( customerID,FirstName, lastname, Customer_gender,address, transaction_amount)
values ( 200,'Femk', 'abdukl',  'male', '9 old road', 88000.00),
   (201, 'isaiah', 'john','male',  '22 alaly stree, okun', 1590.33),
    ( 206,'emma', 'abu','male',  '7 ababa street, makunn', 6788.33),
	 (210, 'kara', 'ogun','female' , '10 hahroh road, ottawa', 3400.33),
	  ( 211,'sunkanmi', 'osagie', 'female' , '9 agric butstop street, okun', 89875.00),
	   (209,'oge', 'kunle', 'male', '10 iwo street, liverpool', 7860.33),
	    (204, 'igbayin', 'elizabeth', 'female', '100 kukuma street, epe', 89100.69)

drop table DSA_Mall_Ikeja

select * from DSA_Mall_Ikeja 

create table  DSA_Mall_Port_Harcourt (
CustomerID INT not null,
FirstName varchar (max),
LastName  varchar (max),
Customer_gender nvarchar(max),
TransactionDate DATE DEFAULT GETDATE(),
[Address] varchar (max),
Transaction_Amount decimal (18, 4)
)
drop table [dbo].[DSA_.Mall_Ikeja]

drop table DSA_Mall_Port_Harcourt

select * from DSA_Mall_Port_Harcourt

select * from [dbo].[DSA_Mall_Ghana]


------highest salary----

SELECT TOP 1 staffid, firstname, lastname, salary AS second_highest_salary
FROM salary
WHERE salary = (SELECT MAX(salary) FROM salary)
ORDER BY salary DESC;

----22/05/2025

 

select * from [dbo].[DSA_Mall_Ikeja]

select * from [dbo].[DSA_Mall_Port_Harcourt]

---union---

select * from [dbo].[DSA_Mall_Ghana]
union
select * from [dbo].[DSA_Mall_Ikeja]
union
select * from [dbo].[DSA_Mall_Port_Harcourt]

---union all----

select * from [dbo].[DSA_Mall_Ghana]
union all
select * from [dbo].[DSA_Mall_Ikeja]
union all
select * from [dbo].[DSA_Mall_Port_Harcourt]


----create column (Branch)
CREATE VIEW vw_DSA_Mall_Transaction
as
select 
    'DSA MALL GHANA' AS BRANCH, customerid as [CUSTOMER ID],
	firstname as [FIRST NAME], lastname as [LAST NAME],
	customer_gender as GENDER, TRANSACTIONDATE AS [DATE],
	[ADDRESS], transaction_amount AS [TRANSACTION AMOUNT]
FROM [dbo].[DSA_Mall_Ghana]

UNION
select 
    'DSA MALL PORT_HARCOURT' AS BRANCH, customerid as [CUSTOMER ID],
	firstname as [FIRST NAME], lastname as [LAST NAME],
	customer_gender as GENDER, TRANSACTIONDATE AS [DATE],
	[ADDRESS], transaction_amount AS [TRANSACTION AMOUNT]
FROM [dbo].[DSA_Mall_Port_Harcourt]
UNION
select 
    'DSA MALL IKEJA' AS BRANCH, customerid as [CUSTOMER ID],
	firstname as [FIRST NAME], lastname as [LAST NAME],
	customer_gender as GENDER, TRANSACTIONDATE AS [DATE],
	[ADDRESS], transaction_amount AS [TRANSACTION AMOUNT]
FROM [dbo].[DSA_Mall_Ikeja]

select * from [dbo].[vw_DSA_Mall_Transaction]

----total sales per branch

select branch, sum([transaction amount]) as [Total sales]
from  [dbo].[vw_DSA_Mall_Transaction]
group by BRANCH
order by [Total sales] desc


select branch, AVG([transaction amount]) as [Average sales]
from  [dbo].[vw_DSA_Mall_Transaction]
group by BRANCH
order by [Average sales] desc

-----total sales by gender

select GENDER, sum([transaction amount]) as [Total sales]
from  [dbo].[vw_DSA_Mall_Transaction]
group by GENDER
order by [Total sales] desc

----date analysis

select * from [dbo].[vw_DSA_Mall_Transaction]

select gender, sum ([transaction amount])
from [dbo].[vw_DSA_Mall_Transaction]
where [date] = '2025-05-21'
group by GENDER

---analysis base branch (ghana)

select branch, sum([transaction amount]) as Revenue
from [dbo].[vw_DSA_Mall_Transaction]
where BRANCH = 'DSA MALL GHANA'
group by BRANCH

select branch, sum([transaction amount]) as Revenue
from [dbo].[vw_DSA_Mall_Transaction]
where BRANCH = 'DSA MALL IKEJA'
group by BRANCH

select branch, sum([transaction amount]) as Revenue
from [dbo].[vw_DSA_Mall_Transaction]
where BRANCH = 'DSA MALL PORT_HARCOURT'
group by BRANCH

----add gender--

select gender, branch, sum([transaction amount]) as Revenue
from [dbo].[vw_DSA_Mall_Transaction]
where BRANCH = 'DSA MALL GHANA'
group by BRANCH, GENDER

select gender, branch, sum([transaction amount]) as Revenue
from [dbo].[vw_DSA_Mall_Transaction]
where BRANCH = 'DSA MALL GHANA' and [DATE] = '2025-05-21'
group by BRANCH, GENDER

select gender, branch, sum([transaction amount]) as Revenue
from [dbo].[vw_DSA_Mall_Transaction]
where BRANCH = 'DSA MALL PORT_HARCOURT' and [DATE] = '2025-05-21'
group by BRANCH, GENDER













































