use united_nations; 
select *
from 
access_to_basic_services;

select *
from 
access_to_basic_services
limit 10;

select distinct
	country_name 
from 
	access_to_basic_services;

-- saving the query into a table 
create table 
	Country_list(
		country_name varchar(225)
	);
    insert into country_list(
		country_name
	)
    select distinct
		country_name
	from 
		access_to_basic_services;
	
-- country that has the lowest pct of people with access to managed drinking water services
select 
		country_name, 
        time_period, 
        pct_managed_drinking_water_services AS pct_access_water 
	from access_to_basic_services
    where time_period = 2020; 

