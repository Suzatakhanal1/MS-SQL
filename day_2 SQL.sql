--Inserting values in all tables--

--department table--
INSERT INTO departments(department_id, department_name) VALUES
(5, 'Marketing'),
(10, 'Health'),
(15, 'IT'),
(20,'Sales'),
(25, 'Finance');
begin tran
insert into departments Values(30, 'Education')
rollback
commit
select * from departments
--employees table--
Insert into employees(employee_id, first_name, last_name, department_id, salary, manager_id) VALUES
(1,'Alina','Ghimire','10',60000,1),
(2,'Binita','Sapkota','10',80000,2),
(3,'Rabin','Dharel','20',65000,2),   
(4,'David','Chettri','15',55000,4),   
(5,'Asmita','Patel','5',50000,5),
(6, 'Susma', 'KC', '25', '70000',3); 

INSERT into employees values
(7, 'Sita', 'KC', '30', '0',5),
(8, 'Shila', 'KC', '25', '0',3);

select * from employees
--customers table--
INSERT INTO customers (customer_id, first_name, last_name, email) VALUES
(101,'Lina','Basnet','lina.basnet@xyz.com'),
(102,'Mia','BK','mia.bk@abc.com');

insert into customers Values(103,'Maya','Kafle','maya.kafle@abc.com')
begin tran
select * from customers
commit
--orders table --

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1001,101,'2025-04-10',199.99),
(1002,102,'2025-05-10',79.50);

insert into orders Values(1003,103,'2025-05-11',150.20)
begin tran
select * from orders
commit
--- Sales table---

INSERT INTO sales (sale_id, product_id, region, sale_date, amount) VALUES
(201,1001,'East','2025-04-11',1200.00),
(202,1002,'West','2025-05-12',800.00);
insert into sales values
(203,1003,'north','2024-08-12',1800.00),
(204,1004,'south','2024-04-19',400.00);

select * from sales
--logs table--
INSERT INTO logs (log_id, log_date, status, message, log_year) VALUES
(1,'2025-04-14','INFO','loading',2025),
(2,'2025-05-15','ERROR','Demo error',2025);

INSERT INTO logs VALUES
(3,'2024-07-15','ERROR','Incomplete',2024);
begin tran
select * from logs
commit
--accounts table--
INSERT INTO accounts (account_id, account_holder, balance) VALUES
(301,'Laxmi Group',45000.00),
(302,'IME Grouyp',22500.50);



--Task 1: Retrieve All Records
--Description: Write a query to retrieve all columns and rows from the employees table. Table: employees (employee_id, first_name, last_name, department, salary)Expected Output: All columns and rows.



BEGIN TRAN;     
    SELECT * FROM employees;
ROLLBACK;    

select * from departments
select * from employees
select * from accounts
select * from sales
select * from orders
select * from customers
--Task 2: Filter Records by Condition
--Description: Write a query to find all employees in the employees table who work in the "IT" department. Table: employees (employee_id, first_name, last_name, department, salary)Expected Output: All columns for employees where department = 'IT'.



BEGIN TRAN;     
    SELECT * FROM employees e
	inner join departments d  ON d.department_id = e.department_id
	 WHERE d.department_name = 'IT';

ROLLBACK;    
Commit;


--Task 3: Sort Results
--Description: Write a query to retrieve all employees from the employees table, sorted by salary in descending order. Table: employees (employee_id, first_name, last_name, department, salary)Expected Output: All columns, sorted by salary DESC.

BEGIN TRAN;     
    SELECT * FROM employees
	ORDER by salary DESC;
Commit;


--Task 4: Aggregate Data
--Description: Write a query to calculate the average salary of employees in the employees table. Table: employees (employee_id, first_name, last_name, department, salary)Expected Output: A single value representing the average salary.

BEGIN TRAN;     
    SELECT AVG(salary) AS average_salary from employees;
RollBACK;

--Task 5: Group By with Count
--Description: Write a query to count the number of employees in each department. Table: employees (employee_id, first_name, last_name, department, salary)Expected Output: Columns department and employee_count.
select  * from departments
BEGIN TRAN;                 
    SELECT d.department_name AS department,
	COUNT(*) AS employee_count
	FROM employees e
	inner join departments d  ON d.department_id = e.department_id
	GROUP BY
	d.department_name
ROLLBACK; 
commit

--Task 6: Join Two Tables
--Description: Write a query to join the employees and departments tables to display employee names and their department names. Tables:
--employees (employee_id, first_name, last_name, department_id, salary)
--departments (department_id, department_name)Expected Output: Columns first_name, last_name, department_name.

BEGIN TRAN
	Select first_name, last_name, department_name
	from employees e 
	join departments d ON d.department_id = e.department_id

ROLLBACK;
commit
--Task 7: Left Join with Null Handling
--Description: Write a query to list all departments and their employees, including departments with no employees. Tables:
--employees (employee_id, first_name, last_name, department_id, salary)
--departments (department_id, department_name)Expected Output: Columns department_name, first_name, last_name (with NULLs for departments without employees).


BEGIN TRAN
	Select department_name, first_name, last_name
	from departments d
	left join employees e ON d.department_id = e.department_id
	
--ROLLBACK;

Select * from employees
Select * from departments
--Task 8: Conditional Aggregation
--Description: Write a query to find the total salary for each department, but only for departments where the average salary is greater than 50000. Table: employees (employee_id, first_name, last_name, department_id, salary)Expected Output: Columns department_id, total_salary.
begin tran
select department_id, SUM(salary) AS total_salary 
from employees
GROUP BY department_id
Having AVG(salary) > 50000       
ORDER BY department_id;  
rollback
commit;

--Task 9: Subquery to Find Top Earners# group by department
--Description: Write a query to find employees whose salary is greater than the average salary of their department. Table: employees (employee_id, first_name, last_name, department_id, salary)Expected Output: Columns employee_id, first_name, last_name, salary, department_id.
select * from employees
begin tran
select employee_id, first_name, last_name, salary, department_id
from employees e
where salary > (Select AVG(salary) from employees gro)
Rollback;


--Task 10: Date Manipulation #sysdate
--Description: Write a query to find all orders placed in the last 30 days from the orders table. Table: orders (order_id, customer_id, order_date, total_amount)Expected Output: All columns where order_date is within the last 30 days from today (May 19, 2025).
select * From orders

BEGIN TRAN;
SELECT order_date, customer_id, order_date, total_amount
FROM orders
WHERE order_date >= DATEADD(DAY, -30, GETDATE())
  AND order_date < GETDATE();

ROLLBACK;



--Task 11: Window Function for Ranking # good correct
--Description: Write a query to rank employees within each department based on their salary (highest salary gets rank 1). Table: employees (employee_id, first_name, last_name, department_id, salary)Expected Output: Columns first_name, last_name, department_id, salary, rank.


BEGIN TRAN
select first_name, last_name, department_id, salary,
DENSE_RANK() over(
	Partition by department_id
	Order by salary DESC) AS [rank]

from employees

ROLLBACK;

--Task 12: Pivot Table #no idea
--Description: Write a query to pivot the sales table to show total sales amount by product for each quarter of 2024. Table: sales (sale_id, product_id, sale_date, amount)Expected Output: Columns product_id, Q1_2024, Q2_2024, Q3_2024, Q4_2024 (with total amounts per quarter).
begin tran
SELECT 
product_id,
[1] AS Q1_2024,
[2] AS Q2_2024, 
[3] AS Q3_2024, 
[4] AS Q4_2024
FROM
(SELECT
	product_id,
	DATEPART(QUARTER, sale_date) AS quarter,
	amount
from sales
where year(sale_date) = 2024) AS SourceTable
PIVOT
(
    SUM(amount)
    FOR quarter IN ([1], [2], [3], [4])
) AS PivotTable
ORDER BY product_id
rollback;
select * from sales



--Task 13: Handle Duplicates
--Description: Write a query to identify and list duplicate records in the customers table based on email. Table: customers (customer_id, first_name, last_name, email)Expected Output: Columns email, count (number of occurrences).
--list duplicates
INSERT INTO customers VALUES
(104,'Ritu','Basnet','lina.basnet@xyz.com')
select * FROM customers;

begin tran
select email,COUNT(*) AS [count] from customers
GROUP BY email
Having count(*) >1
ROLLBACK;

select email from customers GROUP BY email
Having count(*) >1


delete email from student GROUP BY email
Having count(*) >1


delete customer_id from customers 
where email in (select email from customers GROUP BY email
Having count(*) >1 )




--Task 14: Optimize a Slow Query
--Description: Given the following slow query, suggest optimizations (e.g., indexing, rewriting) and rewrite it for better performance:
--SELECT e.first_name, e.last_name, d.department_name
--FROM employees e, departments d
--WHERE e.department_id = d.department_id
--AND e.salary > (SELECT AVG(salary) FROM employees);
--Tables:
--employees (employee_id, first_name, last_name, department_id, salary)
--departments (department_id, department_name)Expected Output: Optimized query and explanation of changes.


SELECT e.first_name, e.last_name, d.department_name
FROM employees e join departments d
on e.department_id = d.department_id
where e.salary > (SELECT AVG(salary) FROM employees);



SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.salary > (SELECT AVG(salary) FROM employees);

CREATE INDEX E1 ON employees(department_id, salary);
CREATE INDEX E2 ON departments (department_id, department_name);



permission

--Task 15: Production-Level Data Integrity
--Description: Design a trigger to prevent inserting or updating negative salaries in the employees table. Provide the SQL to create the trigger and a test query to demonstrate it. Table: employees (employee_id, first_name, last_name, department_id, salary)Expected Output: Trigger definition and test query with expected error for negative salary.
SELECT * FROM employees

CREATE TRIGGER trg_prevent_negative_salary
ON employees
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE salary <= 0
    )
    BEGIN
        RAISERROR('Salary cannot be negative.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary)
VALUES (20, 'Jammy', 'Smith', 1004, 0);

Insert into employees(employee_id, first_name, last_name, salary) VALUES
(119,'Ami','Ghimire',0)

UPDATE employees
SET salary = -2000
WHERE employee_id = 5;

--Task 16: Complex Joins with Aggregation #good
--Description: Write a query to find the top 3 customers by total order amount, including their most recent order date and total number of orders. Tables:
--customers (customer_id, first_name, last_name)
--orders (order_id, customer_id, order_date, total_amount)Expected Output: Columns first_name, last_name, total_order_amount, most_recent_order, order_count.

select*from customers
select * from orders
BEGIN TRAN

select TOP 3 
c.first_name, 
c.last_name,
SUM(o.total_amount) AS total_order_amount,
MAX(o.order_date) AS most_recent_order,
COUNT (o.order_id) as order_count
from customers AS c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_order_amount DESC
ROLLBACK;

select * from logs;



--Task 17: Partitioned Table Query #tochar
--Description: Assume the logs table is partitioned by year (log_year). Write a query to retrieve all logs from 2024 where the status is 'ERROR'. Table: logs (log_id, log_date, status, message, log_year)Expected Output: All columns for matching logs.

BEGIN TRAN

SELECT * FROM logs
WHERE log_year = 2025
AND status = 'ERROR'
ROLLBACK;

--Task 18: Recursive CTE for Hierarchy#erorrrrr
--Description: Write a query to display the employee hierarchy (employee and their manager) using a recursive CTE. Table: employees (employee_id, first_name, last_name, manager_id)Expected Output: Columns employee_id, first_name, last_name, manager_name.

select  * from employees

Create table manager(
manager_id int identity(1,1) primary key,
mname varchar(50)
)

Select * from manager

Begin tran
Insert into manager
values('ram')
Insert into manager
values('sam')
Insert into manager
values('ronny')

commit

--begin tran
WITH EmployeeHierarchy AS (
    SELECT 
        e.employee_id, 
        e.first_name, 
        e.last_name, 
        m.mname
    FROM employees e
	join manager m on e.manager_id = m.manager_id
    WHERE e.manager_id IS not NULL
	)

Select * from EmployeeHierarchy

--ROLLBACK;

--Task 19: Dynamic SQL for Flexible Reporting#need susmita JII
--Description: Write a dynamic SQL query to generate a report of total sales by a user-specified column (e.g., product_id or region) from the sales table. Table: sales (sale_id, product_id, region, amount)Expected Output: Dynamic query template and example for product_id

DECLARE @group_by_column NVARCHAR(50) = 'region';
DECLARE @sql NVARCHAR(MAX);

SET @sql = N'
SELECT 
    ' + @group_by_column + ',
    SUM(amount) AS total_sales,
    COUNT(*) AS number_of_sales
FROM 
    sales
GROUP BY 
    ' + @group_by_column + '
ORDER BY 
    total_sales DESC;';

PRINT @sql; 
EXEC sp_executesql @sql; 

--Task 20: Transaction Management
--Description: Write a transaction block to transfer $1000 from one account to another in the accounts table, ensuring data consistency. Include error handling for insufficient funds. Table: accounts (account_id, account_holder, balance)Expected Output: Transaction SQL with error handling and a test query.
select * from accounts

-- Variables to define transfer details
DECLARE @FromAccount INT = 1;
DECLARE @ToAccount INT = 2;
DECLARE @Amount DECIMAL(10,2) = 1000.00;

BEGIN TRY
    BEGIN TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM accounts WHERE account_id = @FromAccount)
    BEGIN
        RAISERROR('Source account does not exist.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM accounts WHERE account_id = @ToAccount)
    BEGIN
        RAISERROR('Destination account does not exist.', 120000, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF (SELECT balance FROM accounts WHERE account_id = @FromAccount) < @Amount
    BEGIN
        RAISERROR('Insufficient funds in the source account.', 10006, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- 2. Deduct from sender
    UPDATE accounts
    SET balance = balance - @Amount
    WHERE account_id = @FromAccount;

    -- 3. Add to receiver
    UPDATE accounts
    SET balance = balance + @Amount
    WHERE account_id = @ToAccount;

    -- 4. Commit the transaction
    COMMIT TRANSACTION;
    PRINT 'Transfer successful.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transaction failed: ' + ERROR_MESSAGE();
END CATCH;

-- 5. Verify balances
SELECT account_id, account_holder, balance
FROM accounts
WHERE account_id IN (@FromAccount, @ToAccount);
;


--Task 21: Create and Use a Stored Procedure
--Description: Write a stored procedure named UpdateEmployeeSalary that updates the salary of an employee in the employees table based on their employee_id and a percentage increase provided as input. The procedure should:
--Check if the employee exists.
--Ensure the percentage increase is non-negative.
--Update the salary by multiplying it with (1 + percentage/100).
--Return a message indicating success or failure (e.g., "Employee not found" or "Salary updated successfully").
--Include error handling for invalid inputs.
--Table:
--employees (employee_id, first_name, last_name, department_id, salary)
--Expected Output:
--SQL code to create the stored procedure.
--A test query to call the stored procedure with sample inputs (e.g., employee_id = 1, percentage_increase = 10).

select * from employees

Alter PROCEDURE SPUpdateEmployeeSalary2

@employee_id INT,
@PercentageIncrease DECIMAL(10,2)

AS
--Ensure the percentage increase is non-negative.
BEGIN
	if @PercentageIncrease < 0
	begin
		PRINT 'ERROR: Percentage increase must be non-negative.'
		return;
	end
	--Check if the employee exists.
	if not exists (select 1 from employees where employee_id= @employee_id)
	BEGIN
		PRINT 'Error: Employee not found';
		return;
	END
--Update the salary by multiplying it with (1 + percentage/100).
	UPDATE employees
	SET salary = salary * (1 + @PercentageIncrease/100)
	where employee_id = @employee_id;
	print 'salary updated successfully.';
END;

begin tran
EXEC SPUpdateEmployeeSalary2
@employee_id =3,
@PercentageIncrease  = 10
;
ROLLBACK;
commit;
select * from employees
