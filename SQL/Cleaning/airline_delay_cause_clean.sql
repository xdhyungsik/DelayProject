DROP TABLE IF EXISTS airline_delay_cause_clean;
CREATE TABLE airline_delay_cause_clean AS
SELECT 
    year,
    month,
    carrier,
    carrier_name,
    UPPER(TRIM(airport)) AS airport_code,
    arr_flights,
    arr_del15,
    arr_delay,
    carrier_delay,
    weather_delay,
    nas_delay,
    security_delay,
    late_aircraft_delay
FROM Airline_Delay_Cause
WHERE airport IS NOT NULL;


