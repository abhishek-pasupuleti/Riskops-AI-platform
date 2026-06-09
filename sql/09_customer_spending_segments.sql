/*
Business Request:
Classify customers based on total transaction amount.
*/

SELECT

    customer_id,

    SUM(amount) AS total_spent,

    CASE

        WHEN SUM(amount) >= 5000 THEN 'High Value'

        WHEN SUM(amount) >= 2000 THEN 'Medium Value'

        ELSE 'Low Value'

    END AS customer_segment

FROM transactions

GROUP BY customer_id

ORDER BY total_spent DESC;
