
-- Finding unmatching sets between delays and airports
SELECT DISTINCT adc.airport_code
FROM airline_delay_cause_clean adc
LEFT JOIN airports_clean ap ON ap.airport_code = adc.airport_code
WHERE ap.airport_code IS NULL
ORDER BY 1;

-- Counting the mismatches
SELECT COUNT(DISTINCT adc.airport_code) AS unmatched_count
FROM airline_delay_cause_clean adc
LEFT JOIN airports_clean ap ON ap.airport_code = adc.airport_code
WHERE ap.airport_code IS NULL;
