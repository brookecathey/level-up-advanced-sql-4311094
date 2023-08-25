select 
  salesId,
  inventoryId,
  salesAmount,
  soldDate
from sales 
where inventoryId in 
  (select inventoryID
  from inventory i
  left join model m 
  on i.modelID = m.modelID
  where m.EngineType = 'Electric');

  -- alt way (courses way) below

  select 
    s.soldDate,
    s.salesAmount,
    i.colour,
    i.year
  from sales s 
  join inventory i 
  on s.inventoryId = i.inventoryId 
  where i.modelId IN (select modelID from model where EngineType = 'Electric');
