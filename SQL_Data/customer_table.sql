CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(150),
    industry_type VARCHAR(100),
    country VARCHAR(100),
    region VARCHAR(100),
    signup_date DATE,
    customer_type ENUM('Enterprise','SME','Individual'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO customers (
    customer_name,
    industry_type,
    country,
    region,
    signup_date,
    customer_type
)
SELECT 
    CONCAT('Customer_', n),
    ELT(FLOOR(1 + RAND()*4),'Manufacturing','Retail','E-commerce','Logistics'),
    ELT(FLOOR(1 + RAND()*5),'India','USA','UAE','Germany','Singapore'),
    ELT(FLOOR(1 + RAND()*4),'APAC','EMEA','North America','Middle East'),
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*1000) DAY),
    ELT(FLOOR(1 + RAND()*3),'Enterprise','SME','Individual')
FROM numbers
WHERE n <= 150;