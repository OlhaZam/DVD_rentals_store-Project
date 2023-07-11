# Week-2-Project


### Customer research and analysis (Preferences, Loyability, Insights) for DVD Store



This is a repository dedicated to data analysis of the DVD Store from customer research perspective. 
The goal is to provide valuable information that can help enhance the store's offerings and improve customer satisfaction.

#### Key Features of the Customer Research Repository:

#### Case #1

Preferences: Exploring the list of films featuring the talented actor Penelope Guiness. 
This curated recommendation list is tailored to meet the specific tastes and interests of customers.

```sql
SELECT actor.first_name, actor.last_name, film.title
FROM actor
LEFT JOIN film_actor
ON actor.actor_id = film_actor.actor_id
LEFT JOIN film
ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Penelope' AND actor.last_name = 'Guiness';
```


#### Case #2

Loyalty: Discovering the top 10 most valuable customers based on the number of rentals. 
Their names and email addresses will establish effective communication channels and provide personalized service.

```sql
SELECT customer.customer_id, customer.first_name, customer.last_name, customer.email, COUNT(customer.customer_id) AS rentals_number
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name, customer.email
ORDER BY rentals_number DESC
LIMIT 10;
```


#### Case #3

Customer Insights: Identifying all customers hailing from the vibrant state of Texas. 
This information allows us to understand the demographics and preferences of this particular customer segment.

```sql
SELECT customer.first_name, customer.last_name, address.district 
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id 
WHERE address.district = 'Texas';
```


#### Case #4

Payment Analysis: Gaining insights into customer spending patterns by calculating the average payment made by each customer, rounded to the nearest decimal. 
This analysis helps us understand the financial behaviors of our customers.

```sql
SELECT customer.first_name, customer.last_name, 
ROUND(AVG(payment.amount), 2) AS average_payment
FROM customer
LEFT JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER BY average_payment DESC;
```


#### Case #5

February Payments: Identifying customers who made payments in the month of February. 
This analysis allows us to understand the seasonal payment trends and adapt our strategies accordingly.

```sql
WITH customer AS (SELECT customer_id, first_name, last_name FROM customer),
	p_month AS (SELECT DISTINCT EXTRACT(MONTH FROM payment_date) AS payment_month FROM payment
	WHERE EXTRACT(MONTH FROM payment_date)=2)
SELECT * FROM customer
NATURAL JOIN p_month;
```


#### Case #6

Film Genres: Determining the most rented film genres among our store customers. 
This information assists in optimizing inventory and curating a diverse selection of films that cater to our customer’s interests.

```sql
SELECT category.name, COUNT(category.name) AS total
FROM rental
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN film ON film.film_id = inventory.film_id
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY total DESC;
```


#### Case #7

Profitability: Generating a month-by-month list of payment revenues, ranked from most profitable to least. 
This analysis provides valuable insights into revenue trends and allows for informed decision-making.

```sql
SELECT 
CASE WHEN EXTRACT(MONTH FROM payment_date) = '2' THEN 'February'
	 WHEN EXTRACT(MONTH FROM payment_date) = '3' THEN 'March'
	 WHEN EXTRACT(MONTH FROM payment_date) = '4' THEN 'April'
	 WHEN EXTRACT(MONTH FROM payment_date) = '5' THEN 'May'
    END AS month, 
	COUNT(EXTRACT(MONTH FROM payment_date)) AS month_count 
FROM payment
GROUP BY EXTRACT(MONTH FROM payment_date)
ORDER BY month_count DESC;
```


#### Case #8

Store Rentals: Obtaining the number of rentals for each store location. 
This data helps in evaluating the performance of individual stores and identifying areas for improvement.

```sql
SELECT staff.store_id, COUNT(rental.rental_id) AS rentals_number
FROM rental
LEFT JOIN staff ON rental.staff_id = staff.staff_id
LEFT JOIN store ON staff.store_id = store.store_id
GROUP BY staff.store_id
ORDER BY rentals_number DESC;
```


#### Case #9

Mailing Lists: Grouping customer emails by store, facilitating the creation of mailing lists for targeted marketing campaigns. 
This enables us to communicate store promotions and relevant updates to customers effectively.

```sql
WITH customers_email AS (
    SELECT * FROM customer)
SELECT store_id, STRING_AGG(email, '; ')
FROM customers_email
GROUP BY store_id;
```


#### Case #10

Film Categories: Exploring the films available in each category. 
This information helps customers navigate the store's collection and discover movies that align with their preferences.

```sql
SELECT category.name AS film_category, STRING_AGG(film.title, ', ') AS films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film.film_id = film_category.film_id
GROUP BY category.name
ORDER BY category.name;
```



#### Conclusion

In summary, the DVD Store greatly benefits from the customer research and analysis , which can empower  to make decisions based on data and prioritize the needs of our customers. 
By leveraging the valuable insights derived from this data analysis, the primary objective is to deliver an outstanding and personalized experience to every individual who interacts with DVD store.
