/*Find all customers from Texas*/

SELECT customer.first_name, customer.last_name, address.district 
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id 
WHERE address.district = 'Texas';
