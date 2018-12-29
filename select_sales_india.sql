WITH
    india AS
    (   SELECT 
            customer_id,
            first_name || " " || last_name customer_name
        FROM customer
        WHERE country = "India"
     ),
     sum_total AS
     (  SELECT 
            customer_id, 
            SUM(total) total_purchases 
        FROM invoice
        GROUP BY customer_id
      )
      
SELECT india.customer_name, sum_total.total_purchases
FROM india
LEFT JOIN sum_total
ON india.customer_id = sum_total.customer_id
ORDER BY customer_name
