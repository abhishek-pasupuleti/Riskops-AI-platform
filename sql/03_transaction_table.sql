CREATE TABLE transactions (

    transaction_id BIGINT PRIMARY KEY,

    customer_id INT,

    account_id INT,

    card_id INT,

    merchant_id INT,

    transaction_timestamp TIMESTAMP,

    transaction_amount DECIMAL(12,2),

    currency VARCHAR(10),

    transaction_status VARCHAR(20),

    payment_channel VARCHAR(50),

    city VARCHAR(100),

    country VARCHAR(100),

    risk_score DECIMAL(5,2),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

    FOREIGN KEY (account_id) REFERENCES accounts(account_id),

    FOREIGN KEY (card_id) REFERENCES cards(card_id),

    FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id)

);
