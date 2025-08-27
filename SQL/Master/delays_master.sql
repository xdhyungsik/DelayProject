DROP TABLE IF EXISTS delays_master;
CREATE TABLE delays_master AS
WITH summed AS (
  SELECT
    airport_code, year, month,
    SUM(arr_flights) AS flights,
    SUM(arr_del15) AS delayed_15p,
    SUM(arr_delay) AS total_delay_min,
    SUM(carrier_delay) AS carrier_delay_min,
    SUM(weather_delay) AS weather_delay_min,
    SUM(nas_delay) AS nas_delay_min,
    SUM(security_delay) AS security_delay_min,
    SUM(late_aircraft_delay) AS late_aircraft_delay_min
  FROM airline_delay_cause_clean
  GROUP BY airport_code, year, month
)
SELECT
  s.airport_code,
  s.year,
  s.month,
  ap.airport_name,
  ap.municipality,
  ap.state_abbr,
  ap.latitude_deg,
  ap.longitude_deg,

  -- Traffic 
  en.enplanements_2024,
  en.enplanements_2023,
  en.pct_change,

  -- Flight and delay totals
  s.flights,
  s.delayed_15p,
  s.total_delay_min,
  s.carrier_delay_min,
  s.weather_delay_min,
  s.nas_delay_min,
  s.security_delay_min,
  s.late_aircraft_delay_min,

  -- Rates, shares
  CASE WHEN s.flights > 0 THEN 1.0*s.delayed_15p/s.flights END    AS delay_rate_15p,
  CASE WHEN s.flights > 0 THEN 1.0*(s.flights - s.delayed_15p)/s.flights END AS on_time_rate,
  CASE WHEN s.total_delay_min > 0 THEN 1.0*s.carrier_delay_min/s.total_delay_min END AS share_carrier,
  CASE WHEN s.total_delay_min > 0 THEN 1.0*s.weather_delay_min/s.total_delay_min END AS share_weather,
  CASE WHEN s.total_delay_min > 0 THEN 1.0*s.nas_delay_min/s.total_delay_min END AS share_nas,
  CASE WHEN s.total_delay_min > 0 THEN 1.0*s.security_delay_min/s.total_delay_min END AS share_security,
  CASE WHEN s.total_delay_min > 0 THEN 1.0*s.late_aircraft_delay_min/s.total_delay_min END AS share_late_ac
FROM summed s
LEFT JOIN airports_clean ap ON ap.airport_code = s.airport_code
LEFT JOIN enplanements_clean en ON en.airport_code = s.airport_code;