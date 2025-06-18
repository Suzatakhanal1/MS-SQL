
CREATE table employee1
(
employee_id INT primary key,
first_name varchar (50),
last_name varchar (50),
hire_date varchar(10),
department_id INT foreign key references deparment(deparment_id) ,
salary INT 
);
insert into employee1 values
(1, 'sujata', 'khanal', '2021-05-04',101,'50000'),
(2, 'susma', 'kc', '2024-07-12', 102, '55000'),
(3, 'susma', 'BK', '2023-07-12', 103, '60000');
select * from employee1

insert into employee1 values 
(4, 'alina', 'kc', '2024-03-12', 102, '65000'),
(5, 'saroj', 'kumar', '2021-03-02', 103, '75000');

create table deparment
(deparment_id INT primary key,
deparment_name varchar (50)
);


drop  table employee1

insert into deparment values 
(101, 'IT'),
(102, 'Marketing'),
(103, 'Health');

select * from deparment
select * from employee1

--qn>1
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM employee1
WHERE HIRE_DATE >='2021-05-04'

 SELECT department_id ,SUM(salary) as total_salary,AVG(salary) as average_salary
 --join employee1 e on d.deparment_id = e.department_id
 from employee1
 group by department_id;

 select * from employee1 e
 inner join deparment d on e.department_id = d.deparment_id

 select first_name, last_name from  employee1
 where salary > (select (avg(salary)) from employee1)

 select e.first_name,e.last_name, d.deparment_name from employee1 e
 inner join deparment d on e.department_id = d.deparment_id
 where e.salary =  (select MAX(salary) as highest_salary from  employee1 e);

 

 

select first_name, last_name, department_id, salary,
row_number()
	over(PARTITION BY department_id
	order by salary DESC) AS rank
from employee1;

