/*How much revenue is coming from different countries*/

SELECT co.country, SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON ci.city_id = a.city_id
JOIN country co ON co.country_id = ci.country_id
GROUP BY co.country;