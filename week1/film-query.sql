--Get the name and data type from every field in the 
--"film" table
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'film';

SELECT *
FROM film
LIMIT 100;