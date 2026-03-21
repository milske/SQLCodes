select 
	country_name,
    time_period, 
    pct_managed_drinking_water_services,
    pct_managed_sanitation_services,
    est_population_in_millions,
    est_gdp_in_billions
from 
	access_to_basic_services
where
    time_period = 2020
    AND  pct_managed_sanitation_services <=50
    AND  pct_managed_drinking_water_services <=50;

select 
	country_name,
    time_period, 
    pct_managed_drinking_water_services,
    pct_managed_sanitation_services,
    est_population_in_millions,
    est_gdp_in_billions
from 
	access_to_basic_services
where 
	( country_name = "Nigeria"
    OR country_name = "Ethiopia"
    OR country_name = "Congo"
    OR country_name = "Egypt"
    OR country_name = "Tanzania"
    OR country_name = "Kenya"
    OR country_name = "South Africa")
    AND time_period BETWEEN 2019 AND 2020; 

SELECT 
	country_name,
    time_period, 
    pct_managed_drinking_water_services,
    pct_managed_sanitation_services,
    est_population_in_millions,
    est_gdp_in_billions, 
    region
FROM 
	access_to_basic_services
WHERE 
	region = "Sub-Saharan Africa"
AND
    time_period = 2020
AND
	Est_gdp_in_billions IS NOT NULL
AND 
	country_name NOT IN ("Nigeria", "South Africa", "Ethiopia", "Kenya", "Ghana");
    
select 
	country_name, 
    Time_period, 
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services
from 
	access_to_basic_services
where 
	country_name LIKE "Iran%"
    OR country_name LIKE "%_Republic of Korea"