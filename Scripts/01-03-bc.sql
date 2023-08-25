--brooke method (full outer join)
--needs distinct to remove duplicate information

select 
  DISTINCT
  c.firstName,
  c.lastName,
  s.salesAmount,
  s.soldDate
from sales s
full outer join customer c 
on s.customerId = c.customerId
order by c.lastName;

GO

--course method
--does not need distinct to remove duplicates 
--union all DOES NOT remove duplicates

--return rows where both tables have data
select 
  c.firstName,
  c.lastName,
  s.salesAmount,
  s.soldDate
from customer c 
join sales s 
on c.customerId = s.customerId

union
--return rows where there is customer data but no sales data
select 
  c.firstName,
  c.lastName,
  s.salesAmount,
  s.soldDate
from customer c 
left join sales s 
on c.customerId = s.customerId
where s.salesId IS NULL

union
--return rows where there is sales data but no customer data
select 
  c.firstName,
  c.lastName,
  s.salesAmount,
  s.soldDate
from sales s
left join customer c 
on c.customerId = s.customerId
where c.customerId IS NULL
order by lastName;



