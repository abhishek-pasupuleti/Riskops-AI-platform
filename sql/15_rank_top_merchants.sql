/*
Business Request:
Rank merchants by total processed revenue.
*/

SELECT
    merchant_id,
    COUNT(transaction_id) AS total_transactions,
    SUM(transaction_amount) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(transaction_amount) DESC
    ) AS revenue_rank
FROM transactions
WHERE transaction_status = 'Success'
GROUP BY merchant_id
ORDER BY revenue_rank;
