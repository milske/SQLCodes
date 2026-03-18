select 
	distinct Country_name,
    LENGTH(Country_name) as string_lenght,
    POSITION("(" IN Country_name) as position_opening_bracket,
    RTRIM(LEFT(Country_name, POSITION("(" IN Country_name)-1)) as new_country_name,
    LENGTH( RTRIM(LEFT(Country_name, POSITION("(" IN Country_name)-1))) as new_country_name_length
from 
	access_to_basic_services
where 
	Country_name LIKE "%(%)%"