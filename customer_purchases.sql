SELECT
    customer.first_name || " " || customer.last_name customer_name,
    COUNT(invoice.invoice_id) number_of_purchases,
    SUM(invoice.total) total_spent,
    CASE
        WHEN SUM(invoice.total) < 40 THEN "small spender"
        WHEN SUM(invoice.total) > 100 THEN "big spender"
        ELSE "regular"
        END
        AS customer_category
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY 1
ORDER BY 1
