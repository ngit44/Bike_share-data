Select * from bike_share_yr_0

-- Bring two tables bike_share_yr_0 and bike_share_yr_1 together
Select * from bike_share_yr_0
Union all
Select * from bike_share_yr_1

Select * from cost_table

-- Bring all three tables together
-- Common Table Expression (CTE):
With cte as(
Select * from bike_share_yr_0
Union all
Select * from bike_share_yr_1)

Select * from cte
left join cost_table
on cte.yr=cost_table.yr

--Select some features from table and add aggregated columns:
With cte as(
Select * from bike_share_yr_0
Union all
Select * from bike_share_yr_1)

Select dteday, season, cost_table.yr, weekday, hr, rider_type, riders,price, COGS,
riders * price as revenue,
riders * price - COGS as profit
from cte
left join cost_table
on cte.yr=cost_table.yr