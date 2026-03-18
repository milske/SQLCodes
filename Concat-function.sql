select 
	distinct Country_name,
    Time_period,
    Est_population_in_millions,
    CONCAT(
    SUBSTRING(UPPER(IFNULL(Country_name,"Unknown")),1,4),
    SUBSTRING(IFNULL(Time_period,"Unknown"),1,4),
    SUBSTRING(IFNULL(Est_population_in_millions,"Unknown"),-7)
    ) as Country_id
		
from access_to_basic_services; 