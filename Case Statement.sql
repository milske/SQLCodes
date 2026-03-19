/* 
Regional Economic Communities (RECs)
    Arab Maghreb Union (UMA)
    Common Market for Eastern and Southern Africa (COMESA)
    Community of Sahel-Saharan States (CEN-SAD)
    East African Community (EAC)
    Economic Community of Central African States (ECCAS)
    Economic Community of West African States (ECOWAS)
    Intergovernmental Authority on Development (IGAD)
    Southern African Development Community (SADC)
*/


SELECT 
    CASE
        WHEN Country_name IN ("Angola", "Botswana", "Comoros", "Democratic Republic of Congo", "Eswatini",
        "Lesotho", "Madagascar", "Malawi", "Mauritius", "Mozambique", "Namibia",
        "Seychelles", "South Africa", "United Republic Tanzania", "Zambia", "Zimbabwe")
        THEN "SADC"
        when Country_name IN ("Algeria", "Libya", "Mauritania",  "Morocco", "Tunisia")
        THEN "UMA"
        
        WHEN Country_name IN ("Condo", "Burkina Faso", "Cabo Verde", "Cote d'Ivoire", "Gambia", "Ghana", "Guinea",
            "Guinea-Bissau", "Liberia", "Mali", "Niger", "Nigeria", "Senegal", "Sierra Leone", "Togo")
        THEN "ECOMAS"
        
        ELSE "Not Classified"
    END AS Regional_economic_community,
    MIN(Pct_managed_drinking_water_services) AS Min_pct_managed_drinking_water_services,
    AVG(Pct_managed_drinking_water_services) AS Avg_pct_managed_drinking_water_services,
    MAX(Pct_managed_drinking_water_services) AS Max_pct_managed_drinking_water_services
FROM united_nations.Access_to_Basic_Services
WHERE Region like "%Africa%"
GROUP BY
    CASE
        WHEN Country_name IN ('Angola', 'Botswana', 'Comoros', 'Democratic Republic of Congo', 'Eswatini',
                              'Lesotho', 'Madagascar', 'Malawi', 'Mauritius', 'Mozambique', 'Namibia',
                              'Seychelles', 'South Africa', 'United Republic Tanzania', 'Zambia', 'Zimbabwe')
        THEN 'SADC'

        WHEN Country_name IN ("Algeria", "Libya", "Mauritania", "Morocco", "Tunisia")
        THEN "UMA"

        WHEN Country_name IN ("Condo", "Burkina Faso", "Cabo Verde", "Cote d'Ivoire", "Gambia", "Ghana", "Guinea",
            "Guinea-Bissau", "Liberia", "Mali", "Niger", "Nigeria", "Senegal", "Sierra Leone", "Togo")
        THEN "ECOMAS"
        
        ELSE 'Not Classified'
    END;
