SELECT year, month, flights, delayed_15p,
       ROUND(100.0*delayed_15p/NULLIF(flights,0),2) AS pct_delayed
FROM delays_master
WHERE airport_code = 'CLE'
ORDER BY year, month;
