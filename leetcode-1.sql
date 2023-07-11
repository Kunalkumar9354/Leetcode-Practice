-- question - 1 leetcode  
-- select p.firstname,p.lastname,a.city,a.state
-- from person p 
-- left join address a
-- on p.personid = a.personid;

-- question 2 leetocode 
-- output 
-- secondhigestsalary  200 if not then null
-- select salary as secondhighestsalary  from employee limit 1 offset 1  ;

-- select * from employee;
-- select max(salary) as secondhighestsalary from employee where salary !=
-- (select max(salary)  from employee) ;

-- question 3 leetcode 
-- CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
-- BEGIN
-- SET N=N-1;

--   RETURN (
--       SELECT DISTINCT salary FROM Employee ORDER BY salary DESC 
--       LIMIT 1 OFFSET N      
--   );
-- END

-- question 4 leetcode
-- select * from logs;
-- with my_cte as(select num,
-- lead(num,1) over() as num1,
-- lead(num,2) over() as num2
-- from  logs)
-- select distinct num as consecutiveNums from my_cte where num= num1 and num =num2

-- question 5 leetcode 

select * from customers ;
select * from  orders;
select name from (select c.id,c.name,o.customerid from customers c
left join orders o
on c.id = o.customerid)t
where customerid is null;

select * from person2;
with my_cte as (select id,email, row_number() over(partition by email order by id) rn
from person2 
order by id asc) 
delete from my_cte where rn=2;
select * from activity ;
-- select player who have logged in first 
select distinct(player_id), min(event_date) as first_login from activity
group by player_id ;
-- Write an SQL query to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, 
-- you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.








