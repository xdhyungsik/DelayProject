DROP TABLE IF EXISTS airports_clean;
CREATE TABLE airports_clean AS
SELECT
  UPPER(TRIM(iata_code)) AS airport_code,
  name AS 
  airport_name, municipality,iso_region,                      
  CASE WHEN iso_region LIKE 'US-%'
       THEN SUBSTR(iso_region, 4, 2) END AS 
       state_abbr, iso_country, latitude_deg, longitude_deg
FROM airports
WHERE iata_code IS NOT NULL
  AND TRIM(iata_code) <> ''
  AND iso_country = 'US';