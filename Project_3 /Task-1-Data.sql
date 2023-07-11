/*Daily total revenue for three different countries*/

SELECT * FROM payment; /*payment_date, amount, customer_id*/

SELECT * FROM customer; /*customer_id, address_id*/

SELECT * FROM address; /*address_id, city_id*/

SELECT * FROM city; /*city_id, country_id*/

SELECT * FROM country; /*country_id, country*/


SELECT DATE(p.payment_date) AS payment_date, co.country, SUM(p.amount) AS daily_total_revenue
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON ci.city_id = a.city_id
JOIN country co ON co.country_id = ci.country_id
WHERE co.country IN ('Netherlands', 'Mexico', 'Canada')
GROUP BY DATE(p.payment_date), co.country
ORDER BY co.country DESC;