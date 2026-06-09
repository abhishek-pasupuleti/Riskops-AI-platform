/*
Business Request:
Use a CTE to summarize customer transaction behavior.
*/

WITH customer_summary AS (
    SELECT
        customer_id,
        COUNT(transaction_id) AS total_transactions,
        SUM(transaction_amount) AS total_spent,
        ROUND(AVG(transaction_amount), 2) AS average_transaction_amount,
        ROUND(AVG(risk_score), 2) AS average_risk_score
    FROM transactions
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_transactions,
    total_spent,
    average_transaction_amount,
    average_risk_score,
    CASE
        WHEN total_spent >= 5000 AND average_risk_score >= 70 THEN 'High Value - High Risk'
        WHEN total_spent >= 5000 THEN 'High Value'
        WHEN average_risk_score >= 70 THEN 'High Risk'
        ELSE 'Standard'
    END AS customer_profile
FROM customer_summary
ORDER BY total_spent DESC;
