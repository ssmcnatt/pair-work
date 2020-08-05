-- In pgAdmin, select the productpurchases database and open the Query Tool.
SELECT * 
FROM purchase_items;

SELECT * 
FROM products
WHERE title = 'Ruby Book';

-- Write a query that joins the purchase_items and product tables. The query should return the purchase ID, title, quantity, and price fields for all returned laptop computers.
SELECT purchase_id, title, quantity, pr.price AS product_price
FROM purchase_items AS pi
INNER JOIN products AS pr
ON pi.product_id = pr.id;

-- Write a query that joins all 4 tables in the database and returns all MP3 Player purchase line items that are in pending status and were ordered from the state of Florida (FL) by email address Derek.Knittel@gmail.com. The query should return the purchase ID, the order status, the customer name, the state, the product name, the order quantity, the order price, and the customer email.
SELECT pi.purchase_id, 
		pi.state, 
		purch.name, 
		purch.state, 
		prod.title AS product_name, 
		pi.quantity, 
		pi.price, 
		u.email
FROM products AS prod
INNER JOIN purchase_items AS pi ON pi.product_id = prod.id
INNER JOIN purchases AS purch ON purch.id = pi.product_id
INNER JOIN users AS u ON u.id = purch.user_id;