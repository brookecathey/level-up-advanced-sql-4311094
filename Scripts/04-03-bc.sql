select 
  strftime('%Y-%m',soldDate) as yearMonth,
  count(*) as thisMonth,
  lag(count(*),1,0) over (order by strftime('%Y-%m',soldDate)) as lastMonth 
from sales 
group by strftime('%Y-%m',soldDate)
order by strftime('%Y-%m',soldDate);


-- course solution below

SELECT strftime('%Y-%m', soldDate) AS MonthSold,
  COUNT(*) AS NumberCarsSold,
  LAG (COUNT(*), 1, 0 ) OVER calMonth AS LastMonthCarsSold
FROM sales
GROUP BY strftime('%Y-%m', soldDate)
WINDOW calMonth AS (ORDER BY strftime('%Y-%m', soldDate))
ORDER BY strftime('%Y-%m', soldDate);
