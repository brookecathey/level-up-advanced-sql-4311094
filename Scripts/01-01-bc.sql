select 
  e.firstName AS [Employee FN],
  e.lastName AS [Employee LN],
  e.title AS [Employee Title],
  m.firstName AS [Manager FN],
  m.lastName AS [Manager LN]
from employee e 
left join employee m 
on e.managerId = m.employeeId;