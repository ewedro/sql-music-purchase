WITH
    total_customer AS
    (   SELECT 
            invoice.customer_id customer_id, 
            customer.first_name || " " || customer.last_name customer_name,
            SUM(invoice.total) total_purchased,
            customer.country country
        FROM invoice
        JOIN customer ON invoice.customer_id = customer.customer_id
        GROUP BY invoice.customer_id
     )


SELECT
    country,
    customer_name,
    MAX(total_purchased) total_purchased
FROM total_customer
GROUP BY 1
