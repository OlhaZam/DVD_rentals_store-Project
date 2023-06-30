/*The number of all rentals for each store*/

SELECT staff.store_id, COUNT(rental.rental_id) AS rentals_number
FROM rental
LEFT JOIN staff ON rental.staff_id = staff.staff_id
LEFT JOIN store ON staff.store_id = store.store_id
GROUP BY staff.store_id
ORDER BY rentals_number DESC;