use practice;

select * from employees;

create procedure ALLRecords
AS
select * from employees
GO;

exec ALLRecords;

--stored procedure with single parameter
create procedure ALLRecords1 @salary  varchar(150)
as
select * from employees where salary = @salary;

exec ALLRecords1 @salary = 80000


--stored procedure with multiple parameter
create procedure ALLRecords2 @salary  varchar(150), @first_name varchar(150)
as
select * from employees where salary= @salary AND first_name = @first_name;

exec ALLRecords2 @salary = 80000, @first_name  = 'Binita';

drop procedure ALLRecords2
drop procedure ALLRecords1
drop procedure ALLRecords