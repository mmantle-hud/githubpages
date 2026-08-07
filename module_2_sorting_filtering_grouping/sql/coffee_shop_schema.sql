DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch VARCHAR(50) NOT NULL,
    product VARCHAR(50) NOT NULL,
    product_category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO sales (branch, product, product_category, price) VALUES
    ('Central', 'Latte', 'Drinks', 3.00),
    ('Central', 'Espresso', 'Drinks', 2.50),
    ('Central', 'Carrot Cake', 'Food',   3.50),
    ('New Street', 'Blueberry Muffin','Food', 2.75),
    ('New Street', 'Espresso',  'Drinks', 2.50),
    ('New Street', 'Americano',  'Drinks',  2.70);