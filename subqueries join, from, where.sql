SELECT
    Sub_Region,
    SUM(land_area) AS TotalLandArea
FROM
    Geographic_Location
GROUP BY
    Sub_Region;
    
SELECT
    geoloc.Country_name,
    geoloc.Land_area,
    geoloc.sub_Region,
    (geoloc.Land_area / land_per_region.TotalLandArea) * 100 AS PctOfRegionLand
FROM
    Geographic_Location AS geoloc
JOIN
    (SELECT
    Sub_Region,
    SUM(land_area) AS TotalLandArea
FROM
    Geographic_Location
GROUP BY
    Sub_Region) AS land_per_region;
    
SELECT
    Country_name,
    AVG(Est_gdp_in_billions) AS Avg_GDP,
    AVG(Est_population_in_millions) AS Avg_Population
FROM 
		(SELECT
		Country_name,
		Est_gdp_in_billions,
		Est_population_in_millions
	FROM ECONOMIC_Indicators
	WHERE
		Pct_unemployment > 5
		AND Time_period = 2020) AS FilteredCountries
GROUP BY Country_name;



SELECT
    econ.Country_name,
    econ.Time_period,
    econ.Est_gdp_in_billions,
    service.Pct_managed_drinking_water_services
FROM
    Economic_Indicators AS econ
INNER JOIN
    Basic_Services AS service
ON
    econ.Country_name = service.Country_name
    AND econ.Time_period = service.Time_period
WHERE
    econ.Time_period = 2020
    AND service.Pct_managed_drinking_water_services < 90
    AND econ.Est_gdp_in_billions > (SELECT
										AVG(Est_gdp_in_billions)
									FROM
										Economic_Indicators
									WHERE
										Time_period = 2020);