/*
Business Request:
Analyze transaction volume by hour of day.
Used for operational monitoring and staffing decisions.
*/

SELECT

    EXTRACT(HOUR FROM transaction_timestamp) AS transaction_hour,

    COUNT(transaction_id) AS total_transactions,

    SUM(amount) AS total_amount

FROM transactions

GROUP BY EXTRACT(HOUR FROM transaction_timestamp)

ORDER BY transaction_hour;
