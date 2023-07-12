select * from employee;
select * from employeedetail;
-- find the employee whose salary between 2l to 3l
select * from employee where salary between 200000  and 300000;
-- write a query to retrieve the list of employee from same city
select e1.* from employee e1
join employee e2
on e1.city=e2.city 
and e1.empid<>e2.empid;
--  write a query to find the null values in the employee table
select * from employee
where empid is null;
-- find the cumalitive sum of employee salary 
select empname,salary,sum(salary) over(order by empid) as cumalitive_sum 
from employee;
-- male and female employee ratio 
SELECT 
  sum(case when gender="m" then 1 else 0 end)*100/count(*) as male_percentage,
  sum(case when gender="f" then 1 else 0 end)* 100/count(*) as female_percentage
FROM employee;
-- write a query to fetch 50 % records of employee
select * from employee where empid <=(select count(*)/2 from employee);
-- query to fetch the employee salary but replace the last 2 digit with "XX" ie 12345 will be 123xx
select concat(substring(salary,1,length(salary)-2),"XX") as modified_salary
from employee;
-- query to fetch even and odd rows from employee table.
select * from employee;
select * from employee where mod(empid,2)=0 ;
select * from employee where mod(empid,2)!=0;
-- alter
select * from (select *,
		row_number() over() rn from employee)t
where empid%2=0;
select *,row_number() over () rn from employee
where empid%2<>0
-- : Write a query to find all the Employee names whose name:
-- • Begin with ‘A’
-- • Contains ‘A’ alphabet at second place
-- • Contains ‘Y’ alphabet at second last place
-- • Ends with ‘L’ and contains 4 alphabets
-- • Begins with ‘V’ and ends with ‘A’
select * from employee where left(empname,1) like "A%";
select * from employee where left(empname,2) like "_a%";
select * from employee where right(empname,2) like "%y_";
select * from employee where right(empname,1) like "____l";
select * from employee where left(empname,1) like "v%a";
-- Write a query to find the list of Employee names which is:
-- • starting with vowels (a, e, i, o, or u), without duplicates
-- • ending with vowels (a, e, i, o, or u), without duplicates
-- • starting & ending with vowels (a, e, i, o, or u), without duplicates
select distinct empname from employee where left(empname,1)like"[aeiou]%";
select distinct empname from employee where right(empname,1)like"%[aeiou]";
select distinct empname from employee where right(empname,1)like"%[aeiou]"and left(empname,1) like"[aeiou]%";
-- Find Nth highest salary from employee table with and without using the
-- TOP/LIMIT keywords.
select salary from employee e1
where n-1=(select count( distinct(e2.salary))
			from employee e2
		where e2.salary>e1.salary;
-- alternative
select salary from employee e1
where n=(select count(distinct(e2.salary)) from 
	employee e2 where e2.salary >=e1.salary;
--  query to find and remove duplicate records from a table. if there is any distinct
select * from (select *,
		row_number() over(partition by empname order by empid asc)rn from employee
order by empid asc) t
where rn = 2 ;
-- query to retrieve the list of employees working in same project;
select e.*,ms.project from employee e
join
(select ed.* from employeedetail ed
join employeedetail ed2
on ed.project=ed2.project and ed.empid<>ed2.empid
order by empid asc) ms
on e.empid=ms.empid
order by e.empid asc ;
-- Show the employee with the highest salary for each project
select distinct ed.project ,max(e.salary)as maxsal from 
employeedetail ed 
join employee e 
on ed.empid=e.empid
group by ed.project
order by maxsal desc;
-- Show the employee with the highest salary for each project
select * from employee ;
with mycte as(select e.empname,e.salary,ed.project,
				row_number() over(partition by ed.project order by e.salary desc) rn from employee e
                join employeedetail ed 
                on e.empid=ed.empid)
select empname,salary,project from mycte where rn =2 ;
-- Create 3 groups based on salary col, salary less than 1L is low, between 1 -
-- 2L is medium and above 2L is High

select empname,salary,
	case
		when salary <100000 then "Low"
        when salary >100000 and salary <200000 then "Medium"
        else  "High"
	end as salary_range
from employee ;

-- Query to find the total count of employees joined each year
select * from employee ;
select * from employeedetail;
select distinct year(doj) as joined_year,count(empid) as employee_joined from employeedetail
group by year(doj);


