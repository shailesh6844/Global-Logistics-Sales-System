CREATE TABLE shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    origin_port_id INT,
    destination_port_id INT,
    carrier_id INT,
    shipment_date DATETIME,
    delivery_date DATETIME,
    shipment_status ENUM('In Transit','Delivered','Delayed'),
    weight DECIMAL(10,2),
    volume DECIMAL(10,2),
    FOREIGN KEY (origin_port_id) REFERENCES ports(port_id),
    FOREIGN KEY (destination_port_id) REFERENCES ports(port_id),
    FOREIGN KEY (carrier_id) REFERENCES carriers(carrier_id)
);

WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n+1 FROM seq WHERE n < 200
)
INSERT INTO shipments (
    origin_port_id,
    destination_port_id,
    carrier_id,
    shipment_date,
    delivery_date,
    shipment_status,
    weight,
    volume
)
SELECT 
    FLOOR(1 + RAND()*10),
    FLOOR(1 + RAND()*10),
    FLOOR(1 + RAND()*20),
    NOW() - INTERVAL FLOOR(RAND()*60) DAY,
    NOW() - INTERVAL FLOOR(RAND()*30) DAY,
    ELT(FLOOR(1 + RAND()*3),'Delivered','In Transit','Delayed'),
    ROUND(1000 + RAND()*10000,2),
    ROUND(100 + RAND()*500,2)
FROM seq;