WITH
    total_customer AS
    (   SELECT 
            customer_id, 
            SUM(total) total_purchased
        FROM invoice
        GROUP BY customer_id
     )
     
SELECT 
    customer.country,
    customer.first_name || " " || customer.last_name customer_name,
    total_customer.total_purchased,
    MAX(total_customer.total_purchased) maximum
FROM customer
JOIN total_customer
ON customer.customer_id = total_customer.customer_id

ORDER BY country
