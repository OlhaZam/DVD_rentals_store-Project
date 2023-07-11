/*Customers who has payments in February*/

WITH customer AS (SELECT customer_id, first_name, last_name FROM customer),
	p_month AS (SELECT DISTINCT EXTRACT(MONTH FROM payment_date) AS payment_month FROM payment
	WHERE EXTRACT(MONTH FROM payment_date)=2)
SELECT * FROM customer
NATURAL JOIN p_month;