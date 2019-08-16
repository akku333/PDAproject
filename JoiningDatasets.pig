journey = LOAD 'Users/hduser/Downloads/london-bike-sharing-system-data/journey.csv' using PigStorage(',') AS (Journey Duration:chararray, Journey ID:chararray, End Date:chararray,End Month:chararray, End Hour:int, End Station ID:int, Start Month:INT, Station ID:chararray, Station Name:chararray, Start station ID:chararray, End station ID:chararray);

weather = LOAD 'Users/hduser/Downloads/london-bike-sharing-system-data/weather.csv' using PigStorage(',') AS (WeatherCondition:INT, Humidity:INT, Temperature:chararray,Date:chararray, Day:chararray, Month:int);

Final= join weather by WeatherCondition, Temperature by Date;
STORE FinalINTO '/home/hduser/Downloads/combined_data' USING PigStorage (',');
