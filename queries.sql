1. Top Products Query

query =""" 
SELECT 
p.ProductName,
SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN "Order Details" od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC
LIMIT 10;
"""

2. Top Customers Query

query =""" 
SELECT 
c.CompanyName,
ROUND(SUM(od.UnitPrice * od.Quantity), 2)AS Revenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY Revenue DESC 
LIMIT 10;
"""

3. Monthly Sales Query

query =""" 
SELECT 
strftime('%Y-%m', o.OrderDate) AS Month,
ROUND(SUM(od.UnitPrice * od.Quantity), 2) AS Sales
FROM Orders o
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY Month
ORDER BY Month;
"""

4. Categories  Query

query =""" 
SELECT 
c.CategoryName, 
ROUND(SUM(od.UnitPrice * od.Quantity) , 2) Revenue
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN "Order Details" od ON p.ProductID = od.ProductID
Group BY c.CategoryName
ORDER BY Revenue DESC;
"""

5. Customer Purchase Query

query = """ 
SELECT
c.CompanyName,COUNT(o.OrderID) AS OrdersPlaced
FROM Customers c
JOIN Orders o
ON c.CustomerId = o.CustomerId
GROUP BY c.CompanyName
ORDER BY OrdersPlaced DESC;
"""