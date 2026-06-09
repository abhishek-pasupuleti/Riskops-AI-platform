/*
Business Request:
Identify merchants with high failed transaction volume.
*/

SELECT
    merchant_id,
    COUNT(transaction_id) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END)
        / COUNT(transaction_id),
        2
    ) AS failure_rate_percentage
FROM transactions
GROUP BY merchant_id
HAVING SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) > 0
ORDER BY failure_rate_percentage DESC;
