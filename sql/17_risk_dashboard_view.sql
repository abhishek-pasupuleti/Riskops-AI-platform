/*
Business Request:
Create reusable SQL view for RiskOps dashboard.
*/

CREATE VIEW risk_dashboard_view AS

SELECT
    payment_channel,
    COUNT(transaction_id) AS total_transactions,
    SUM(transaction_amount) AS total_amount,
    SUM(CASE WHEN transaction_status = 'Success' THEN 1 ELSE 0 END) AS successful_transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    SUM(CASE WHEN transaction_status = 'Chargeback' THEN 1 ELSE 0 END) AS chargeback_transactions,
    ROUND(AVG(risk_score), 2) AS average_risk_score
FROM transactions
GROUP BY payment_channel;
