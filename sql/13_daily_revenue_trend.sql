/*
Business Request:
Track daily processed revenue trend.
*/

SELECT
    CAST(transaction_timestamp AS DATE) AS transaction_date,
    COUNT(transaction_id) AS total_transactions,
    SUM(transaction_amount) AS total_revenue,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_amount
FROM transactions
WHERE transaction_status = 'Success'
GROUP BY CAST(transaction_timestamp AS DATE)
ORDER BY transaction_date;
