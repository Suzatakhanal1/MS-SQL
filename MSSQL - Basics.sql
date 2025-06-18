--SELECT * FROM EmployeeDemographics
--Basics of MSSQL
--SELECT TOP 5 *
--FROM EmployeeDemographics

--SELECT DISTINCT(GENDER) FROM EmployeeDemographics

--SELECT Count(LastName) 
--FROM EmployeeDemographics

--SELECT * FROM EmployeeDemographics
--WHERE Age <= 32 AND Gender = 'Male'

--SELECT * FROM EmployeeDemographics
--WHERE Age <= 32 OR Gender = 'Male'

--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE 'S%'
--WHERE LastName LIKE '%S%'
--WHERE LastName LIKE 'S%c%ott%'

--SELECT * FROM EmployeeDemographics
----WHERE FirstName is NULL
--WHERE FirstName is  NOT NULL

--SELECT * FROM EmployeeDemographics
----WHERE FirstName = 'Jim'
--WHERE FirstName IN('Jim', 'Michael')

g
--SELECT Gender
--FROM EmployeeDemographics
--Group BY Gender

--SELECT * FROM EmployeeDemographics

--SELECT Gender, Age, COUNT(Gender)
--FROM EmployeeDemographics
--Group BY Gender, Age

--SELECT Gender, COUNT(Gender) 
--FROM EmployeeDemographics
--WHERE Age > 31
--Group BY Gender


--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age > 31
--Group BY Gender
--ORDER BY CountGender DESC

--SELECT * FROM EmployeeDemographics
--ORDER BY Age, Gender DESC


--SELECT * FROM EmployeeDemographics
--ORDER BY 3 DESC, 5 DESC




SELECT * FROM EmployeeDemographics
SELECT * FROM EmployeeSalary