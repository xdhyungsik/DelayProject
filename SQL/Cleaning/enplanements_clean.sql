DROP TABLE IF EXISTS enplanements_clean;
CREATE TABLE enplanements_clean AS
SELECT
  UPPER(TRIM(Locid)) AS airport_code,
  [Airport Name] AS 
  enpl_airport_name, City,
  [CY 24 Enplanements] AS enplanements_2024,
  [CY 23 Enplanements]AS enplanements_2023,
  [% Change]AS pct_change
FROM "arp-cy2024-commercial-service-enplanements-prelim"
WHERE Locid IS NOT NULL AND TRIM(Locid) <> '';