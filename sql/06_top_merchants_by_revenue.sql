/*
Business Request:
Identify top merchants by processed revenue
*/

SELECT

    m.merchant_name,

    m.merchant_category,

    COUNT(t.transaction_id) AS total_transactions,

    SUM(t.transaction_amount) AS total_revenue,

    ROUND(AVG(t.transaction_amount),2) AS average_transaction_value

FROM transactions t

INNER JOIN merchants m

ON t.merchant_id = m.merchant_id

GROUP BY

    m.merchant_name,

    m.merchant_category

ORDER BY

    total_revenue DESC;
