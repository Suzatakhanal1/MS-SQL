--copy of all table--
begin tran
select * INTO employeescopy  from employees;
Rollback

begin tran
select * INTO departmentscopy  from departments;
commit


begin tran
select * INTO salescopy  from sales;
commit


begin tran
select * INTO customerscopy  from customers;

Rollback
commit



begin tran
select customer_id,first_name INTO customerscopytwest  from customers;

Rollback
commit

Select * from customerscopy
Select * from customers
Select * from customerscopytwest

begin tran
select * INTO orderscopy  from orders;
rollback;


begin tran
select * INTO logscopy  from logs;
commit






--for optimization--
-- use each column name instead of *
-- use Group BY instead of distinct
-- use TOP/LIMIT   
select TOP 3 * from employees
-- USE Primary key while creating table
-- adding index is always better
--store procedure start with usp not with sp
