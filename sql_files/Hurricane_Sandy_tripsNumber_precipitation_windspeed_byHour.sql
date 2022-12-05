
WITH
weather AS (
SELECT
    strftime('%Y-%m-%d', DATE) AS date,
    strftime('%H', DATE) AS time,
    sum(HourlyPrecipitation) as Precipitation,
    avg(HourlyWindSpeed) as Wind_Speed
FROM
    hourly_weather
WHERE date between '2012-10-22' AND '2012-11-05'
GROUP BY date, time
),

trip AS (
SELECT
    date,
    time,
    COUNT (*) as no_of_trip
FROM(
    SELECT 
        date(date_time) AS date, 
        strftime('%H', date_time) AS time
    FROM taxi_trips
    WHERE date between '2012-10-22' AND '2012-11-05'
    UNION ALL
    SELECT 
        date(date_time) AS date, 
        strftime('%H', date_time) AS time
    FROM uber_trips
    WHERE date between '2012-10-22' AND '2012-11-05'
)
GROUP BY date, time
)


SELECT
    weather.date,
    weather.time,
    trip.no_of_trip,
    weather.Precipitation,
    weather.Wind_Speed
FROM
    weather
LEFT JOIN trip
ON weather.time = trip.time AND weather.date = trip.date
ORDER BY weather.date
