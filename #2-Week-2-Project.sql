/*Top 10 valuable customers by number of the most rentals. Display: name and email */


SELECT customer.customer_id, customer.first_name, customer.last_name, customer.email, COUNT(customer.customer_id) AS rentals_number
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name, customer.email
ORDER BY rentals_number DESC
LIMIT 10;

