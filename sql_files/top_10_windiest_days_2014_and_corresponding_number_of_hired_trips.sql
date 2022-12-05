
WITH
weather AS (
SELECT
    date(DATE) as date,
    DailyAverageWindSpeed
FROM
    daily_weather
WHERE date between '2014-01-01' AND '2014-12-31'
ORDER BY DailyAverageWindSpeed DESC
LIMIT 10),

trip AS (
SELECT
    date,
    COUNT (*) as no_of_trip
FROM (
    SELECT date(date_time) AS date
    FROM taxi_trips
    WHERE date between '2014-01-01' AND '2014-12-31'
    UNION ALL
    SELECT date(date_time) AS date
    FROM uber_trips
    WHERE date between '2014-01-01' AND '2014-12-31'
)
GROUP BY date
)


SELECT
    weather.*,
    trip.no_of_trip
FROM
    weather
LEFT JOIN trip
ON weather.date = trip.date
