select 
  strftime('%Y',soldDate) as Year,
  '$' || round(sum(salesAmount),2) as [Total Sales], --brooke approach
  format("$%.2f",sum(salesAmount)) as [TS Alt] --course approach
from sales 
group by Year 
order by Year;

--course advised used a CTE, but seems unnecessary. 
--CTE version below

WITH all_sales AS (
select 
  strftime('%Y',soldDate) AS Year,
  salesAmount
from sales
)
select 
  Year,
  format("$%.2f",sum(salesAmount)) as Total
from all_sales 
group by year 
order by year;


--course points out that while a CTE isn't necessary here, for more complex queries a CTE can make troubleshooting easier