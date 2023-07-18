-- >> Problem Statement:
-- Write a query to fetch the record of brand whose amount is increasing every year.
select * from brands ;
select * from src_dest_distance;

with mycte as(select*, (
	case
		when amount < lead(amount,1,amount+1) over(partition by brand order by year asc) then 1 else 0
        end )as rn
from brands)
select * from brands where brand not in (select brand from mycte where rn = 0);
-- >> Problem Statement:
-- Write a SQL query to convert the given input into the expected output as shown below:
WITH mycte AS (
  SELECT *,
         ROW_NUMBER() OVER () AS row_num
  FROM src_dest_distance
)
select m1.source ,m1.destination , m1.distance  from mycte m1
join mycte m2 on
m1.row_num<m2.row_num and m1.source = m2.destination;


