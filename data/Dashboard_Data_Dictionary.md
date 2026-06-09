# Dashboard Data Dictionary

## Transaction Table

| Column | Description |
|-----------------|--------------------------------|
| transaction_id | Unique transaction identifier |
| customer_id | Customer identifier |
| merchant_id | Merchant identifier |
| card_id | Payment card identifier |
| transaction_amount | Transaction value |
| transaction_status | Success or Failed |
| risk_score | AI risk score |
| payment_channel | Web / POS / Mobile |
| transaction_time | Timestamp |

---

## Customer Table

| Column | Description |
|----------------|----------------------------|
| customer_id | Unique customer |
| customer_name | Customer name |
| segment | Retail / Premium / Business |
| city | Customer city |

---

## Merchant Table

| Column | Description |
|----------------|-----------------------------|
| merchant_id | Merchant identifier |
| merchant_name | Merchant name |
| merchant_category | Business category |

---

## Dashboard KPIs

- Total Transactions
- Total Revenue
- Transaction Success Rate
- Failed Transactions
- High Risk Transactions
- Top Revenue Merchants
- Customer Spending Segments

---

## Data Refresh

Daily

---

## Dashboard Owner

Risk Operations Analytics Team
