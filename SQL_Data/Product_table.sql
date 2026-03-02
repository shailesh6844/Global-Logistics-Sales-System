CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    hazardous_flag BOOLEAN,
    base_price DECIMAL(12,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO products (
    product_name,
    category,
    sub_category,
    hazardous_flag,
    base_price
)
SELECT 
    CONCAT('Product_', n),
    ELT(FLOOR(1 + RAND()*4),'Electronics','Metals','Chemicals','Consumer Goods'),
    CONCAT('SubCat_', FLOOR(1 + RAND()*10)),
    IF(RAND()>0.8, TRUE, FALSE),
    ROUND(1000 + RAND()*50000,2)
FROM numbers
WHERE n <= 120;