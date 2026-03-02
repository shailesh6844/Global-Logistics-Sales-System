CREATE TABLE ports (
    port_id INT AUTO_INCREMENT PRIMARY KEY,
    port_name VARCHAR(150),
    country VARCHAR(100),
    daily_capacity INT,
    dock_count INT
);


INSERT INTO ports (port_name, country, daily_capacity, dock_count) VALUES
('Nhava Sheva','India',10000,12),
('Jebel Ali','UAE',15000,20),
('Los Angeles','USA',20000,25),
('Rotterdam','Netherlands',18000,22),
('Singapore Port','Singapore',22000,30),
('Hamburg','Germany',16000,18),
('Shanghai','China',30000,35),
('Busan','South Korea',17000,19),
('Sydney Port','Australia',14000,15),
('Durban','South Africa',12000,14);