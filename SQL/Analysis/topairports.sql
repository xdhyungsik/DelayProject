SELECT airport_code, airport_name, state_abbr,
       SUM(flights) AS flights,
       SUM(delayed_15p) AS delayed_15p,
       ROUND(100.0*SUM(delayed_15p)/NULLIF(SUM(flights),0),2) AS pct_delayed
FROM delays_master
GROUP BY airport_code, airport_name, state_abbr
HAVING SUM(flights) >= 5000   -- Avoiding airports with less traffic
ORDER BY pct_delayed DESC
LIMIT 10;
