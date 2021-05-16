
USE Northwind

-- exercise 1.1
SELECT CustomerID, CompanyName, Address, City, PostalCode,Country FROM Customers
    WHERE City IN('london','paris')


-- exercise 1.2
SELECT ProductID, ProductName,QuantityPerUnit FROM Products
    WHERE QuantityPerUnit LIKE '%bottle%'


-- exercise 1.3
SELECT p.productID, p.ProductName,p.QuantityPerUnit,
s.CompanyName, s.Country
FROM Products p 
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE  p.QuantityPerUnit like '%bottle%'


--exercise 1.4	Write an SQL Statement that shows how many products there are in each category. 
--Include Category Name in result set and list the highest number first.
SELECT c.CategoryName, COUNT(c.CategoryID) AS "Number of products in each Category"
FROM Categories c
INNER JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY 2 DESC




--exercise 1.5 1.5	List all UK employees using concatenation to join their title of courtesy, first name and last name together.
-- Also include their city of residence.

SELECT CONCAT(e.TitleOfCourtesy,e.FirstName, ' ', e.LastName) AS "Employee", e.City
FROM Employees e
WHERE e.Country = 'UK'



--Exercise 1.6 1.6	List Sales Totals for all Sales Regions (via the Territories table using 4 joins) with a Sales Total greater than 1,000,000.
-- Use rounding or FORMAT to present the numbers.

SELECT r.RegionDescription , ROUND(SUM(Totalsales),-2) AS "Total Sales"
FROM region r
INNER JOIN Territories t ON r.RegionID = t.RegionID
INNER JOIN EmployeeTerritories et ON t.TerritoryID = et.TerritoryID
INNER JOIN Employees e ON et.EmployeeID = e.EmployeeID
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
INNER JOIN 
(SELECT od.orderID, SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS TotalSales
FROM [order details] od
GROUP BY orderID) od ON o.orderid = od.orderID
GROUP BY RegionDescription
HAVING SUM(TotalSales) > 1000000





--exercise 1.7	Count how many Orders have a Freight amount greater than 100.00 and either USA or UK as Ship Country.

SELECT COUNT(o.Freight) AS "Number of orders with frieght over 100 and either USA or UK as ship country"
FROM Orders o
WHERE o.Freight > 100 AND o.ShipCountry IN ('USA','UK')






-- exercise 1.8 write an SQL Statement to identify the Order Number of the Order with the highest amount(value) of discount applied to that order.

SELECT TOP 1 o.OrderID, SUM(od.Discount*od.UnitPrice*od.Quantity) AS DiscountValue
 FROM Orders o
 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
ORDER BY DiscountValue DESC
