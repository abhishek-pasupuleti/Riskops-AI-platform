/*
Business Request:
Calculate chargeback rate by payment channel.
*/

SELECT
    payment_channel,
    COUNT(transaction_id) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Chargeback' THEN 1 ELSE 0 END) AS chargeback_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN transaction_status = 'Chargeback' THEN 1 ELSE 0 END)
        / COUNT(transaction_id),
        2
    ) AS chargeback_rate_percentage
FROM transactions
GROUP BY payment_channel
ORDER BY chargeback_rate_percentage DESC;
