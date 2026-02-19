-- part c creating table & insert 

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT 
);

CREATE TABLE Order_Items (
    order_id INT REFERENCES Orders(order_id),
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0), 
    price_at_purchase NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO Customers (name, email) VALUES 
(101,'Seema Khan', 'seema.khan@gmail.com'), 

INSERT INTO Products (product_name, description) VALUES 
('Laptop', 'High performance'), ('Mouse', 'Wireless'), 
('Keyboard', NULL), ('Monitor', '4K Resolution'), -- NULL description
('USB Cable', NULL), ('Webcam', '1080p'),        -- NULL description
('Desk Lamp', 'LED'), ('Chair', 'Ergonomic');

INSERT INTO Orders (order_date, customer_id) VALUES 
('2026-01-01', 1), ('2026-01-02', 2), ('2026-01-03', 3), ('2026-01-04', 4),
('2026-01-05', 5), ('2026-01-06', 6), ('2026-01-07', 7), ('2026-01-08', 8);

INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase) VALUES 
(1, 1, 1, 1200.00), (1, 2, 2, 25.00), (2, 3, 1, 45.00), (2, 4, 1, 300.00),
(3, 5, 5, 10.00), (3, 1, 1, 1200.00), (4, 6, 1, 60.00), (4, 7, 2, 30.00),
(5, 8, 1, 150.00), (5, 2, 1, 25.00), (6, 3, 1, 45.00), (7, 4, 2, 300.00),
(8, 5, 10, 8.00), (8, 6, 1, 60.00), (1, 3, 1, 45.00);

-- part d 

-- two table join
SELECT o.order_id, o.order_date, c.name, c.email
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- three table join 
SELECT c.name, p.product_name, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- join & filter
SELECT o.order_id, p.product_name, oi.quantity
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE oi.quantity > 2;

-- join & projection search
SELECT p.product_name, oi.price_at_purchase
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
ORDER BY oi.price_at_purchase DESC;

-- null query 
SELECT product_id, product_name
FROM products
WHERE description IS NULL;

-- part e
--foreign key violation
INSERT INTO Order_items(order_id, product_id, quantity, price_at_purchase)VALUES
(2000, 501, 1, 1999)



