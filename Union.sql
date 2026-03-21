select 
	loc.Country_name,
    eco.Time_period,
    IFNULL(eco.Pct_unemployment, 19.59) as pct_unemployment_imputed
from 
	geographic_location as loc
left join 
	economic_indicators as eco
    ON eco.Country_name = loc.Country_name
where region like "Central and Southern Asia"
union 
select 
	loc.Country_name,
    eco.Time_period,
    IFNULL(eco.Pct_unemployment, 19.59) as pct_unemployment_imputed
from 
	geographic_location as loc
left join 
	economic_indicators as eco
    ON eco.Country_name = loc.Country_name
where region like "%Eastern and Southeastern Asia%"

