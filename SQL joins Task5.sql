
USE ECommerceDB;

Create Customers table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Country VARCHAR(50)
);

Create Orders table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product VARCHAR(100),
    Order_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

Sample data for Customers
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Country) VALUES
(1, 'Amit', 'Sharma', 'India'),
(2, 'John', 'Doe', 'USA'),
(3, 'Priya', 'Mehta', 'India'),
(4, 'Emily', 'Clark', 'UK');

Sample data for Orders
INSERT INTO Orders (Order_ID, Customer_ID, Product, Order_Date) VALUES
(101, 1, 'Laptop', '2025-09-01'),
(102, 2, 'Phone', '2025-09-05'),
(103, 1, 'Mouse', '2025-09-10'),
(104, 5, 'Tablet', '2025-09-15'); -- Note: Customer_ID 5 doesn't exist in Customers

1. INNER JOIN: Customers who placed orders
SELECT Customers.First_Name, Orders.Product, Orders.Order_Date
FROM Customers
INNER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;

2. LEFT JOIN: All customers, with their orders if any
SELECT Customers.First_Name, Orders.Product, Orders.Order_Date
FROM Customers
LEFT JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;

 3. RIGHT JOIN: All orders, with customer info if available
 Note: RIGHT JOIN may not be supported in SQLite
SELECT Customers.First_Name, Orders.Product, Orders.Order_Date
FROM Customers
RIGHT JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;

4. FULL JOIN: All customers and all orders, matched where possible
Note: FULL JOIN may not be supported in SQLite; use UNION workaround
SELECT Customers.Customer_ID, Customers.First_Name, Orders.Product, Orders.Order_Date
FROM Customers
LEFT JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID

UNION

SELECT Customers.Customer_ID, Customers.First_Name, Orders.Product, Orders.Order_Date
FROM Customers
RIGHT JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;
