/*Show all customers who has payments in February*/

WITH customer AS (
	SELECT customer.customer_id, customer.first_name, last_name FROM customer),
	month AS (SELECT DISTINCT EXTRACT(MONTH FROM payment.payment_date) AS payment_month FROM payment
			 WHERE EXTRACT(MONTH FROM payment.payment_date)=2)
SELECT * FROM customer
NATURAL JOIN month;