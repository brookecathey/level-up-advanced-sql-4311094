select 
  e.firstName,
  e.lastName,
  m.model,
  count(s.salesId) as salesCount,
  rank() over (partition by s.employeeId
               order by count(s.salesId) desc)
       as rank
from sales s 
join inventory i 
on s.inventoryId = i.inventoryId
join employee e 
on e.employeeId = s.employeeId
join model m 
on m.modelId = i.modelId
group by 1,2,3
