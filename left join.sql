select *
from 
	geographic_location as geo
left join 
	economic_indicators as econ
	ON geo.Country_name = econ.Country_name
left join
	basic_services as svc
    ON geo.Country_name = svc.Country_name
    AND econ.TIme_period = svc.Time_period;
