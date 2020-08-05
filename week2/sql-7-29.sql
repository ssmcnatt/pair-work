-- In pgAdmin, select the productpurchases database and open the Query Tool.
-- * Write a query that returns the following information from the purchases table:
-- 		The date the purchase was made (created_at field).
-- * Add 30 days to the purchase date.
-- * Subtract 90 days from the purchase date.
-- * Convert the purchase date to a date string using the formatting of your choice.
-- * Truncate the purchase date to the hour.
-- * Extract from the purchase date the year, month, day, weekday name, and week number.
SELECT created_at
	   ,created_at + INTERVAL '30 days' AS plus_30
	   ,created_at - INTERVAL '90 days' AS minus_90
	   ,TO_CHAR(created_at, 'MM/DD/YYYY') AS mm_dd_yyyy
	   ,DATE_TRUNC('hour', created_at) AS trunc_hour
	   ,TO_CHAR(created_at, 'YYYY') AS year
	   ,TO_CHAR(created_at, 'MM') AS month
	   ,TO_CHAR(created_at, 'DD') AS day
	   ,TO_CHAR(created_at, 'Day') AS weekday
	   ,TO_CHAR(created_at, 'WW') AS week_number
FROM purchases;