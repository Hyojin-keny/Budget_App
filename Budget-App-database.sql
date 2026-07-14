DROP DATABASE IF EXISTS budget_app;

CREATE DATABASE budget_app
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE budget_app;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    phone VARCHAR(50),
    address VARCHAR(500),
    avatar VARCHAR(500),
    birthday DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transactions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_email VARCHAR(255) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    amount DECIMAL(14,2) NOT NULL,
    type ENUM('income', 'expense') NOT NULL,
    date DATETIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_user_email (user_email),

    CONSTRAINT fk_transactions_user
    FOREIGN KEY (user_email)
    REFERENCES users(email)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);