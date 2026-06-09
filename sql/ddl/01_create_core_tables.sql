CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    phone_number VARCHAR(25),
    customer_segment VARCHAR(50),
    created_date DATE,
    status VARCHAR(25)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    account_open_date DATE,
    account_status VARCHAR(25),
    region VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE cards (
    card_id INT PRIMARY KEY,
    account_id INT,
    card_type VARCHAR(50),
    card_network VARCHAR(50),
    card_status VARCHAR(25),
    issued_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE merchants (
    merchant_id INT PRIMARY KEY,
    merchant_name VARCHAR(150),
    merchant_category VARCHAR(75),
    merchant_region VARCHAR(50),
    onboarding_date DATE,
    risk_tier VARCHAR(25)
);
