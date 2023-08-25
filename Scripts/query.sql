select * from employee limit 5;

GO 

select * from model limit 5;

GO 

--to view the schema for a table! 
select sql
from sqlite_schema
where name = 'employee';

