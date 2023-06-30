/*Which films every category has*/

SELECT category.name AS film_category, STRING_AGG(film.title, ', ') AS films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film.film_id = film_category.film_id
GROUP BY category.name
ORDER BY category.name;