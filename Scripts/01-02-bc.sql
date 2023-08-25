select 
  e.firstName,
  e.lastName,
  e.startDate
from employee e 
left join sales s 
on e.employeeId = s.employeeId
where e.employeeId NOT IN (select distinct employeeId from sales)
and e.title = 'Sales Person';

GO 

--Alternative way (from answer)

select 
  e.firstName,
  e.lastName,
  e.startDate,
  s.salesId
from employee e 
left join sales s 
on e.employeeId = s.employeeId 
where s.salesID IS NULL 
and e.title = 'Sales Person'

