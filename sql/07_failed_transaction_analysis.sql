/*
Business Request:
Analyze failed transactions by payment channel
*/

SELECT

    payment_channel,

    COUNT(transaction_id) AS failed_transactions,

    SUM(transaction_amount) AS failed_amount,

    ROUND(AVG(transaction_amount),2) AS average_failed_amount

FROM transactions

WHERE transaction_status = 'Failed'

GROUP BY payment_channel

ORDER BY failed_transactions DESC,
         failed_amount DESC;
