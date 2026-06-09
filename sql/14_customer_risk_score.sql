/*
Business Request:
Classify customers based on transaction risk behavior.
*/

SELECT
    customer_id,
    COUNT(transaction_id) AS total_transactions,
    ROUND(AVG(risk_score), 2) AS average_risk_score,
    MAX(risk_score) AS highest_risk_score,
    CASE
        WHEN AVG(risk_score) >= 80 THEN 'High Risk'
        WHEN AVG(risk_score) >= 50 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS customer_risk_category
FROM transactions
GROUP BY customer_id
ORDER BY average_risk_score DESC;
