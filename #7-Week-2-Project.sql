/*Month list from most profitable to least by payments*/

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