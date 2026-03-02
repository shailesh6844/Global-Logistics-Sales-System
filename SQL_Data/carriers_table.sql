CREATE TABLE carriers (
    carrier_id INT AUTO_INCREMENT PRIMARY KEY,
    carrier_name VARCHAR(150),
    carrier_type ENUM('Air','Sea','Land')
);


INSERT INTO carriers (carrier_name, carrier_type)
SELECT CONCAT('Carrier_', n),
       ELT(FLOOR(1 + RAND()*3), 'Air','Sea','Land')
FROM (
    WITH RECURSIVE seq AS (
        SELECT 1 AS n
        UNION ALL
        SELECT n+1 FROM seq WHERE n < 20
    )
    SELECT n FROM seq
) t;
