/*Average payment by every customer, number should be rounded*/

SELECT customer.first_name, customer.last_name, 
ROUND(AVG(payment.amount), 2) AS average_payment
FROM customer
LEFT JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER BY average_payment DESC;