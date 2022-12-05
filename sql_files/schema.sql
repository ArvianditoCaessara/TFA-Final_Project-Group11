
CREATE TABLE IF NOT EXISTS hourly_weather
(
    id INTEGER PRIMARY KEY,
    DATE DATETIME,
    LATITUDE FLOAT,
    LONGITUDE FLOAT,
    HourlyPrecipitation FLOAT,
    HourlyWindSpeed FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather
(
    id INTEGER PRIMARY KEY,
    DATE DATE,
    LATITUDE FLOAT,
    LONGITUDE FLOAT,
    DailyPrecipitation FLOAT,
    DailyAverageWindSpeed FLOAT,
    Sunrise FLOAT,
    Sunset FLOAT
);

CREATE TABLE IF NOT EXISTS taxi_trips
(
    id INTEGER PRIMARY KEY,
    date_time DATETIME,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    tip_amount FLOAT,
    calculated_distance FLOAT
);

CREATE TABLE IF NOT EXISTS uber_trips
(
    id INTEGER PRIMARY KEY,
    date_time DATETIME,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    calculated_distance FLOAT
);

CREATE TABLE IF NOT EXISTS daily_sunrise_sunset
(
    id INTEGER PRIMARY KEY,
    DATE DATE,
    Sunrise TIMESTAMP,
    Sunset TIMESTAMP,
    FOREIGN KEY(DATE) REFERENCES daily_weather(DATE)
);
