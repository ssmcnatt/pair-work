-- Now in pgAdmin, select the houseprices database and open the Query Tool.
select * from houseprices;
select * from normal_sales
where saleprice > 300000;

-- Create a permanent table called normal that contains all property sales where the sale condition was Normal.
CREATE TABLE IF NOT EXISTS normal AS
	SELECT *
	FROM houseprices
	WHERE salecondition = 'Normal';

-- Drop the normal table you just created and then recreate it again using the name normal_sales.
DROP TABLE normal;

CREATE TABLE IF NOT EXISTS normal_sales AS
	SELECT *
	FROM houseprices
	WHERE salecondition = 'Normal';

-- From the newly-created normal_sales table, delete all the records where the neighborhood is Veenker.
DELETE FROM normal_sales
WHERE neighborhood = 'Veenker';

-- Re-insert the Veenker neighborhood normal sale condition records.
INSERT into normal_sales
select * from houseprices
WHERE neighborhood = 'Veenker';

-- For all properties where the sale price was greater than $300,000, update the overall condition to be equal to the overall quality
update normal_sales
set overallcond = overallqual
where saleprice > 300000;

-- Using your choice of subquery, temp table, or CTE, calculate average sale prices by neighborhood and then compute what percentage more or less every property sold for compared to the average for their neighborhood.
WITH avg_sales AS (SELECT neighborhood,
				   		  ROUND(AVG(saleprice), 2) AS avg_sale
				  FROM houseprices
				  GROUP BY neighborhood)
SELECT h.neighborhood, saleprice, avg_sale,
	   ROUND(1 - (avg_sale / saleprice), 2) AS percent_more
FROM houseprices h
INNER JOIN avg_sales avg ON avg.neighborhood = h.neighborhood;