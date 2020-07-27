-- In pgAdmin, select the fueleconomy database and open the Query Tool.
-- Retrieve the make, model, year, and cty fields for all the records.
-- Alias the cty field to be city_mpg.
-- Filter the results to show vehicles where the year is between 1990 and 2000 and the make of the vehicle is Ford.
-- Add a new column called fuel_efficiency where if the value in the cty field is less than 18, it returns Below Average and if the value is greater than or equal to 18, it returns Above Average.
-- Limit the results of the query to the first 100 records.
SELECT make, model, year, cty
FROM vehicles;

SELECT make, model, year, cty AS city
FROM vehicles
WHERE year BETWEEN 1990 AND 2000;

SELECT make, model, year, cty AS city,
CASE
	WHEN cty < 18 THEN 'Below Average'
	WHEN cty > 18 THEN 'Above Average'
	ELSE 'Equals 18'
END AS fuel_efficiency
FROM vehicles;

SELECT make, model, year, cty AS city,
CASE
	WHEN cty < 18 THEN 'Below Average'
	WHEN cty > 18 THEN 'Above Average'
	ELSE 'Equals 18'
END AS fuel_efficiency
FROM vehicles
LIMIT 100;