CREATE TABLE united_nations.Geographic_Location (
Country_name VARCHAR(37) PRIMARY KEY,
Sub_region VARCHAR(25),
Region VARCHAR(32),
Land_area NUMERIC(10,2)
);

INSERT INTO united_nations.Geographic_Location (Country_name, Sub_region, Region, Land_area)
SELECT Country_name,
       Sub_region,
       Region,
       AVG(Land_area)
FROM united_nations.Access_to_Basic_Services;

CREATE TABLE united_nations.Basic_Services (
    Country_name VARCHAR(37),
    Time_period INTEGER,
    Pct_managed_drinking_water_services NUMERIC(5,2),
    Pct_managed_sanitation_services NUMERIC(5,2),
    PRIMARY KEY (Country_name, Time_period),
    FOREIGN KEY (Country_name) REFERENCES Geographic_Location (Country_name)
);

INSERT INTO Basic_Services (Country_name, Time_period, Pct_managed_drinking_water_services, Pct_managed_sanitation_services)
SELECT Country_name,
       Time_period,
       Pct_managed_drinking_water_services,
       Pct_managed_sanitation_services
FROM united_nations.Access_to_Basic_Services;

CREATE TABLE united_nations.Economic_indicators (
    Country_name VARCHAR(37),
    Time_period INTEGER,
    Est_gdp_in_billions NUMERIC(10,2),
    Est_population_in_millions NUMERIC(11,2),
    Pct_unemployment NUMERIC(5,2),
    PRIMARY KEY (Country_name, Time_period),
    FOREIGN KEY (Country_name) REFERENCES Geographic_Location(Country_name)
);

INSERT INTO Economic_Indicators (
    Country_name, 
    Time_period, 
    Est_gdp_in_billions, 
    Est_population_in_millions, 
    Pct_unemployment
)
SELECT 
    Country_name,
    Time_period,
    Est_gdp_in_billions,
    Est_population_in_millions,
    Pct_unemployment
FROM 
    united_nations.Access_to_Basic_Services;




GROUP BY Country_name,
	Sub_region,
    Region;