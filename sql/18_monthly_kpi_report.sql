/*
Business Request:
Generate monthly executive KPI report.
*/

SELECT
    EXTRACT(YEAR FROM transaction_timestamp) AS transaction_year,
    EXTRACT(MONTH FROM transaction_timestamp) AS transaction_month,
    COUNT(transaction_id) AS total_transactions,
    SUM(transaction_amount) AS total_revenue,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_amount,
    SUM(CASE WHEN transaction_status = 'Success' THEN 1 ELSE 0 END) AS successful_transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    SUM(CASE WHEN transaction_status = 'Chargeback' THEN 1 ELSE 0 END) AS chargeback_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN transaction_status = 'Success' THEN 1 ELSE 0 END)
        / COUNT(transaction_id),
        2
    ) AS success_rate_percentage,
    ROUND(AVG(risk_score), 2) AS average_risk_score
FROM transactions
GROUP BY
    EXTRACT(YEAR FROM transaction_timestamp),
    EXTRACT(MONTH FROM transaction_timestamp)
ORDER BY
    transaction_year,
    transaction_month;
