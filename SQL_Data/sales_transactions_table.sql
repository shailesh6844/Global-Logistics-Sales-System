CREATE TABLE sales_transactions (
    transaction_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    shipment_id INT,
    customer_id INT,
    product_id INT,
    transaction_date DATETIME,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    total_amount DECIMAL(12,2),
    payment_status ENUM('Pending','Completed'),
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO sales_transactions (
    shipment_id,
    customer_id,
    product_id,
    transaction_date,
    quantity,
    unit_price,
    discount,
    tax_amount,
    total_amount,
    payment_status
)
SELECT 
    s.shipment_id,
    c.customer_id,
    p.product_id,

    DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*90) DAY),

    FLOOR(1 + RAND()*20),

    ROUND(100 + RAND()*1000, 2),

    ROUND(RAND()*50, 2),

    ROUND(RAND()*100, 2),

    ROUND(
        (100 + RAND()*1000) * (1 + RAND()*20)
        - (RAND()*50)
        + (RAND()*100),
    2),

    CASE (n % 3)
        WHEN 0 THEN 'Pending'
        WHEN 1 THEN 'Completed'
        ELSE 'Failed'
    END

FROM numbers n
JOIN shipments s ON s.shipment_id IS NOT NULL
JOIN customers c ON c.customer_id IS NOT NULL
JOIN products p ON p.product_id IS NOT NULL
LIMIT 200;