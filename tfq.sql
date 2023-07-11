-- fetch the duplicate item
with my_cte as(select *, row_number() over(partition by user_name) rn from users
order by user_id asc) 
select * from my_cte where rn>1;

-- fetch the records of doctors who work in same hospital but different 
-- designation
select d1.* from doctors d1
join doctors d2
on d1.hospital=d2.hospital and d1.id<>d2.id
and d1.speciality<>d2.speciality;
-- from login details fetch the users who logged in 3 consecitive days
-- or more
select * from login_details;
-- output 
select distinct customers from (select *,
	case 
		when user_name=lead(user_name) over(order by login_id asc) and
		user_name=lead(user_name,2) over(order by login_id asc)
		then user_name
        else null
	end as customers
from login_details) t
where customers is not null; 
-- from the weather table , fetch all the records when london had extremely cold temperature for 3
-- consective days
select * from weather;
select * from (select *,
	case
		when temperature<0 and lead(temperature) over(order by id) < 0
							and lead(temperature,2) over (order by id) <0
		then "yes"
        when  temperature<0 and lead(temperature) over(order by id) <0
							and lead(temperature) over(order by id)<0
		then "yes"
        when temperature <0 and lag(temperature) over(order by id) <0
							and lag(temperature,2) over(order by id) <0
		then "yes"
		else null
	end as cold_days
from  weather) t
where cold_days is not null ;

select * from patient_logs;
-- find top 2 accounts with maximum number of unique patients on the monthly basis 

-- logic
-- acoount_id    no_of_patients 	no_ofunique_patients
	-- 	1				3					3
	--     2				4					3
	--     3				2					1
-- answer

select * from (select *, rank() over(order by patient_count desc, account_id asc) rn from (select account_id, month, count(patient_id)as patient_count from (select account_id ,monthname(date)as month,patient_id from 
patient_logs
group by account_id,patient_id , month) t
group by account_id, month) t)p
where rn < 3
order by patient_count desc

