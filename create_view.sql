CREATE VIEW chinook.customer_gt_90_dollars AS
    SELECT customer.*
    FROM chinook.customer
    JOIN chinook.invoice ON customer.customer_id = invoice.customer_id
    GROUP BY 1
    HAVING SUM(invoice.total) > 90;
    
SELECT * FROM chinook.customer_gt_90_dollars;
