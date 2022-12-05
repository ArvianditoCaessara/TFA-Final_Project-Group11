
WITH 
base 
AS (
    SELECT
        date,
        calculated_distance,
        ROW_NUMBER() OVER(ORDER BY calculated_distance ASC) AS row_num
    FROM (
        SELECT date(date_time) as date, calculated_distance
        FROM taxi_trips
        WHERE date between '2013-07-01' AND '2013-07-31'
        UNION ALL
        SELECT date(date_time) as date, calculated_distance
        FROM uber_trips
        WHERE date between '2013-07-01' AND '2013-07-31'
    )
    WHERE date between '2013-07-01' AND '2013-07-31'
    ),
    
quantile
AS (
    SELECT
        round(0.95 * COUNT(calculated_distance)) AS n_quantile
    FROM
        base
    )
    
select 
base.calculated_distance 
from base
join quantile
on base.row_num = quantile.n_quantile
