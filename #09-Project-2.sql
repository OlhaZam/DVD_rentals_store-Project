/*Group customers emails by stores for mailing lists*/

WITH customers_email AS (
    SELECT * FROM customer)
SELECT store_id, STRING_AGG(email, '; ')
FROM customers_email
GROUP BY store_id;