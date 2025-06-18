
WITH cte as(
    Select *,rOW_nUMBER() OVER(ORDER BY NAME) AS checkcol from student 
)

dELETE FROM cte WHERE checkcol =3

WITH cte as(
    Select *,rOW_nUMBER() OVER(ORDER BY NAME) AS checkcol from student 
)
Select * from cte
