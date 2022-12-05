
SELECT  case cast (strftime('%w', date_time) as integer)
  when 0 then 'Sunday'
  when 1 then 'Monday'
  when 2 then 'Tuesday'
  when 3 then 'Wednesday'
  when 4 then 'Thursday'
  when 5 then 'Friday'
  else 'Saturday' end as day,
  COUNT(*) as no_of_trip
FROM uber_trips
WHERE date_time between '2009-01-01' AND '2015-06-30'
GROUP BY day
ORDER BY no_of_trip DESC
