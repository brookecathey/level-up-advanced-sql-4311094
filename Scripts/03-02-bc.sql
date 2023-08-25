--use case statements to show sales by month for 2021

select 
  e.firstName,
  e.lastName,
  sum(case 
    when strftime('%m',soldDate) = '01' 
    then salesAmount end) as [January],
  sum(case 
    when strftime('%m',soldDate) = '02' 
    then salesAmount end) as [February],
  sum(case 
    when strftime('%m',soldDate) = '03' 
    then salesAmount end) as [March],
  sum(case 
    when strftime('%m',soldDate) = '04' 
    then salesAmount end) as [April],
  sum(case 
    when strftime('%m',soldDate) = '05' 
    then salesAmount end) as [May],
  sum(case 
    when strftime('%m',soldDate) = '06' 
    then salesAmount end) as [June],
  sum(case 
    when strftime('%m',soldDate) = '07' 
    then salesAmount end) as [July],
  sum(case 
    when strftime('%m',soldDate) = '08' 
    then salesAmount end) as [August],
  sum(case 
    when strftime('%m',soldDate) = '09' 
    then salesAmount end) as [September],
  sum(case 
    when strftime('%m',soldDate) = '10' 
    then salesAmount end) as [October],
  sum(case 
    when strftime('%m',soldDate) = '11' 
    then salesAmount end) as [November],
  sum(case 
    when strftime('%m',soldDate) = '12' 
    then salesAmount end) as [December]
from employee e 
left join sales s 
on e.employeeId = s.employeeId 
where s.soldDate >= '2021-01-01' and s.soldDate < '2022-01-01'
group by e.firstName, e.lastName
order by e.lastName, e.firstName