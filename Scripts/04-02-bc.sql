--select * from sales

select 
  strftime('%Y-%m',soldDate) as YearMonth,
  sum(salesAmount) as [Monthly Total],
  sum(sum(salesAmount)) over 
    (partition by strftime('%Y',soldDate)
      order by soldDate) as [Running Total]
from sales
group by 1
order by 1; 




with salesPerMonth as (
select 
  strftime('%Y',soldDate) as year,
  strftime('%m',soldDate) as month,
  sum(salesAmount) as monthlySales
from sales
group by 1,2
order by 1,2
)
select 
  year,
  month,
  monthlySales,
  sum(monthlySales) over (partition by year order by year,month) as runningTotal
from salesPerMonth
order by 1,2;

