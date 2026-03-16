use united_nations;

select 
	count(*) as number_of_entry,
    min(Time_period) as min_time_period,
	max(Time_period) as max_time_period,
    avg (Pct_managed_drinking_water_services) as pct_cccess_water_services,
    count(distinct country_name) as country_name
from access_to_basic_services;

select 
	country_name, 
    time_period,
    round (Est_gdp_in_billions) as rounded_gdp_billions,
    log (Est_gdp_in_billions) as log_gdp_billios
from access_to_basic_services;
	
select 
	Region,
    Sub_region,
    min(Pct_managed_drinking_water_services) as min_pct_managed_drinking_water_services,
    max(Pct_managed_drinking_water_services) as max_pct_managed_drinking_water_services,
    avg(Pct_managed_drinking_water_services) as avg_pct_managed_drinking_water_services,
    count(DISTINCT Country_name) as number_of_countries,
    sum(Est_gdp_in_billions) as gdp_in_billions
from 
	access_to_basic_services
where 
	Time_period = 2020
    AND Pct_managed_drinking_water_services < 60
group by 
	Region, Sub_region
having 
	count(DISTINCT Country_name) < 4
order by 
	gdp_in_billions
	