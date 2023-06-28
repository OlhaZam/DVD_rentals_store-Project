/*Show the list of all films by the actor Penelope Guiness*/

SELECT actor.first_name, actor.last_name, film.title
FROM actor
LEFT JOIN film_actor
ON actor.actor_id = film_actor.actor_id
LEFT JOIN film
ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Penelope' AND actor.last_name = 'Guiness';
