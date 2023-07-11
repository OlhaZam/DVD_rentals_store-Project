/*Display all customers and managers that belongs to store #1*/

WITH RECURSIVE clients AS (
	SELECT
		customer_id,
		first_name,
		last_name,
		customer.store_id,
		store.manager_staff_id
	FROM
		customer
	LEFT JOIN store ON store.store_id = customer.store_id
	WHERE
		customer.store_id < 2	
	UNION
	SELECT
		customer.customer_id,
		customer.first_name,
		customer.last_name,
		clients.store_id,
		store.manager_staff_id
	FROM
		clients
	LEFT JOIN store ON store.store_id = clients.store_id
	INNER JOIN customer ON customer.store_id = store.store_id
)
SELECT * FROM clients;