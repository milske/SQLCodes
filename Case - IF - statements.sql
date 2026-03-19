SELECT 
    Region,
    Pct_unemployment,
    IF( (Region = "Central and Southern Asia") AND (Pct_unemployment IS NULL), 19.59,
        IF( (Region = "Eastern and South-Eastern Asia") AND (Pct_unemployment IS NULL), 22.64,
            IF( (Region = "Europe and Northern America") AND (Pct_unemployment IS NULL), 24.43,
                IF( (Region = "Latin America and the Caribbean") AND (Pct_unemployment IS NULL), 24.23,
                    IF( (Region = "Northern Africa and Western Asia") AND (Pct_unemployment IS NULL), 17.84,
                        IF( (Region = "Oceania") AND (Pct_unemployment IS NULL), 4.98,
                            IF( (Region = "Sub-Saharan Africa") AND (Pct_unemployment IS NULL), 33.65,
                            Pct_unemployment )
                        )
                    )
                )
            )
        )
    ) AS New_pct_unemployment
FROM united_nations.Access_to_Basic_Services;


SELECT
	Country_name,
    (Est_gdp_in_billions / Est_population_in_millions) * 1000 AS GDP_per_capita,
    (Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25) AS GDP_per_capita_per_day,
    IF(Time_period < 2017, 1.90, 2.50) AS Poverty_line,
    CASE
        WHEN ((Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25)) < IF(Time_period < 2017, 1.90, 2.50)
        THEN 'Low'
        WHEN ((Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25)) > IF(Time_period < 2017, 1.90, 2.50)
        THEN 'High'
        ELSE 'Medium'
    END AS Income_group
FROM united_nations.Access_to_Basic_Services
WHERE Est_gdp_in_billions IS NOT NULL;