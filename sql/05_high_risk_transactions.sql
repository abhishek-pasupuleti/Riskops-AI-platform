/*
Business Request:
Identify high-risk transactions requiring analyst review
*/

SELECT
    transaction_id,
    customer_id,
    transaction_amount,
    payment_channel,
    city,
    country,
    risk_score,
    transaction_status
FROM transactions
WHERE
    risk_score >= 80
    AND transaction_amount >= 1000
ORDER BY risk_score DESC,
         transaction_amount DESC;
