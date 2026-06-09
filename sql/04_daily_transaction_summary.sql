/*
Business Request:
Daily transaction volume and revenue by payment channel
*/

SELECT
    payment_channel,
    COUNT(transaction_id) AS total_transactions,
    SUM(transaction_amount) AS total_revenue,
    ROUND(AVG(transaction_amount),2) AS average_transaction_amount
FROM transactions
GROUP BY payment_channel
ORDER BY total_revenue DESC;
