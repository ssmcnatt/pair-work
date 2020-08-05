-- In pgAdmin, select the fueleconomy database and open the Query Tool.
-- Write a select query where you perform the following string operations:
-- Concatenate the fuel and cyl fields together (with a space in between).
-- Replace any occurrences of the word “Small” in the class field with an empty string.
-- Create a field that parses out whether the vehicle is Automatic or Manual from the trans field 
-- (without the additional speed info).
-- Filter for records where the drive train info (ex. 2WD, 4WD, AWD, etc.) is listed at the end of the model field.
SELECT model, trans,
	   fuel || ' ' || cyl AS fuel_cyl,
	   REPLACE(class, '%Small%', ''),
	   SPLIT_PART(trans, ' ', 1) AS no_trans
FROM vehicles
WHERE model LIKE '%_WD';
