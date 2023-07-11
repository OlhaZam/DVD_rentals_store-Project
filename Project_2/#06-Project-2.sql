/*The most rented film genres by store customers*/

SELECT category.name, COUNT(category.name) AS total
FROM rental
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN film ON film.film_id = inventory.film_id
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY total DESC;