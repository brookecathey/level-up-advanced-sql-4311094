--employees with more than 5 sales

select
  e.employeeId,
  e.firstName,
  e.lastName,
  COUNT(DISTINCT s.salesID) AS [Sales Count],
  MIN(s.salesAmount) AS [Least Expensive],
  MAX(s.salesAmount) AS [Most Expensive]
FROM employee e 
LEFT JOIN sales s 
on e.employeeID = s.employeeID 
and s.soldDate >= date('now','start of year')
where e.title = 'Sales Person'
group by e.employeeId, e.firstName, e.lastName 
having [Sales Count] >= 5
order by [Sales Count] desc 
