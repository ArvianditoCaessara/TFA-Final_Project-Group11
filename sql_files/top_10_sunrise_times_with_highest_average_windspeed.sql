
SELECT
    strftime('%H:%M', x.Sunrise) AS time,
    avg(y.DailyAverageWindSpeed) AS average_windspeed
FROM
    daily_sunrise_sunset AS x
JOIN daily_weather AS Y
ON x.id = Y.id
GROUP BY time
ORDER BY average_windspeed DESC
LIMIT 10
