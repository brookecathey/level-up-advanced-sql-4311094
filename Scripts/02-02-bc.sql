--least and most expensive car per employee

select 
  e.employeeId,
  e.firstName,
  e.lastName,
  MIN(s.salesAmount) AS [Least Expensive],
  MAX(s.salesAmount) AS [Most Expensive] 
from employee e 
left join sales s 
on e.employeeId = s.employeeId 
and s.soldDate >= date('now','start of year')
where e.title = 'Sales Person'
group by e.employeeId, e.firstName, e.lastName
order by [Least Expensive]

-- Approaching differently from course. 
-- Pulling all sales people whether they sold a car during the period of interest or not