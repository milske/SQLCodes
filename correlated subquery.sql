SELECT
  country_name,
  ROUND(land_area / (SELECT 
						SUM(land_area) 
					FROM 
						Geographic_Location 
					WHERE 
						Sub_region = "Middle Africa") * 100) as pct_regional_land
FROM Geographic_location
WHERE Sub_region = 'Middle Africa';

SELECT
  country_name,
  ROUND(land_area / (SELECT 
						SUM(land_area) 
					FROM 
						Geographic_Location 
					WHERE 
						Sub_region = "Polynesia") * 100) as pct_regional_land
FROM Geographic_location
WHERE Sub_region = 'Polynesia';

SELECT
  country_name,
  ROUND(land_area / (SELECT 
						SUM(land_area) 
					FROM 
						Geographic_Location 
					WHERE 
						Sub_region = g.Sub_region) * 100) as pct_regional_land
FROM Geographic_location as g
