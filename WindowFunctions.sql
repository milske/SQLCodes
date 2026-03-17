select
	Sub_region,
    Country_name,
    Land_area,
    ROUND (Land_area / SUM(Land_area) OVER (
		partition by Sub_region
        ) * 100 )AS pct_sub_region_land_area

from access_to_basic_services
where 
	Time_period = 2020
    AND Land_area IS NOT NULL; 

select
	Sub_region,
    Country_name,
    Time_period,
    Est_population_in_millions,
    ROUND(Avg(Est_population_in_millions) OVER (
		partition by Sub_region order by Time_period), 4 ) as running_avg_population
from access_to_basic_services
where 
	Est_population_in_millions IS NOT NULL; 

select
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    RANK() OVER (partition by Time_period
    ORDER BY Pct_managed_drinking_water_services asc) as Rank_of_water_services
from access_to_basic_services;

select
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    LAG(Pct_managed_drinking_water_services) OVER(partition by Country_name order by Time_period asc) as prev_year_managed_drinking_water_services,
    Pct_managed_drinking_water_services - LAG(Pct_managed_drinking_water_services) OVER(partition by Country_name order by Time_period asc) as growth_rate
from access_to_basic_services;