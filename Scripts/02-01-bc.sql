--need employeeid, first and last names, and sum of cars sold

select 
  e.employeeId,
  e.firstName,
  e.lastName,
  COUNT(DISTINCT s.salesId) as [Sales Count]
from employee e
left join sales s 
on e.employeeId = s.employeeId 
where e.title = 'Sales Person'
group by e.employeeId, e.firstName, e.lastName
order by [Sales Count] desc 