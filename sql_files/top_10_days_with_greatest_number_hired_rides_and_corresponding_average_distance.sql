
SELECT
    date,
    COUNT (*) as no_of_trip,
    AVG (calculated_distance)
FROM (
    SELECT date(date_time) AS date, calculated_distance
    FROM taxi_trips
    UNION ALL
    SELECT date(date_time) AS date, calculated_distance
    FROM uber_trips
)
WHERE date between '2009-01-01' AND '2009-12-31'
GROUP BY date
ORDER BY no_of_trip DESC
LIMIT 10
