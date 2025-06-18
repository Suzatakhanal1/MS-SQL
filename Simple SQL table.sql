--CREATE TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50))
--DROP TABLE EmployeeDemographics


INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

----CREATE TABLE EmployeeSalary
----(EmployeeID int,
--JobTitle varchar(50),
----Salary int)



Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

CREATE TABLE EmployeeDemographicstest2
(EmployeeID int IDENTITY(1,2) PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)


--INSERT INTO EmployeeDemographicstest2 VALUES
--('Jim', 'Halpert', 30, 'Male'),
--('Pam','Beasley', 30, 'Female'),
--('Dwight', 'Schrute', 29, 'Male'),
--('Angela', 'Martin', 31, 'Female'),
--('Stanley', 'Hudson', 38, 'Male'),
--('Kevin', 'Malone', 31, 'Male')

--SELECT * FROM EmployeeDemographicstest2

--CREATE TABLE EmployeeDemographicstest3
--(EmployeeID int IDENTITY(1,1) PRIMARY KEY,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--INSERT INTO EmployeeDemographicstest3 VALUES
--('Jim', 'Halpert', 30, 'Male'),
--('Pam','Beasley', 30, 'Female'),
--('Dwight', 'Schrute', 29, 'Male'),
--('Angela', 'Martin', 31, 'Female'),
--('Stanley', 'Hudson', 38, 'Male'),
--('Kevin', 'Malone', 31, 'Male')
--SELECT * FROM EmployeeDemographicstest3




CREATE TABLE EmployeeDemographicstest1
(EmployeeID int IDENTITY(1,3) PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

--INSERT INTO EmployeeDemographicstest1 VALUES
--('Jim', 'Halpert', 30, 'Male'),
--('Pam','Beasley', 30, 'Female'),
--('Dwight', 'Schrute', 29, 'Male'),
--('Angela', 'Martin', 31, 'Female'),
--('Stanley', 'Hudson', 38, 'Male'),
--('Kevin', 'Malone', 31, 'Male'),
--('Toby', 'Flenderson', 32, 'Male')

--SELECT * FROM EmployeeDemographicstest1


Delete t from (
Select checkcol,* from
(
Select *,rOW_nUMBER() OVER(ORDER BY NAME) AS checkcol from student 

) as t

where t.checkcol = 1

Delete  from
(
Select *,rOW_nUMBER() OVER(ORDER BY NAME) AS checkcol from student 

) 
where checkcol = 1

