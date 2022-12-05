
SELECT 
    DISTINCT strftime('%H', date_time) AS time,
    COUNT (*) as trip
FROM taxi_trips
WHERE date_time between '2009-01-01' AND '2015-06-30'
GROUP BY time
ORDER BY trip DESC
