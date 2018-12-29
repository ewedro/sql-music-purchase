WITH customer_union AS
    (
        SELECT * FROM customer_usa
        INTERSECT
        SELECT * FROM customer_gt_90_dollars
    )
    
SELECT 
    employee.first_name || " " || employee.last_name employee_name,
    COUNT(customer_union.customer_id) customers_usa_gt_90
FROM employee 
LEFT JOIN customer_union
ON customer_union.support_rep_id = employee.employee_id
WHERE employee.title = "Sales Support Agent"
GROUP BY employee_name
ORDER BY 1
