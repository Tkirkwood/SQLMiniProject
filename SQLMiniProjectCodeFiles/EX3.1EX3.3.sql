USE Northwind


--3.1 List all Employees from the Employees table and who they report to. No Excel required.
-- Please mention the Employee Names and the ReportTo names. (5 Marks)

SELECT CONCAT(e1.FirstName,' ',e1.LastName) AS "Employee", CONCAT (e2.FirstName,' ',e2.LastName) AS 'Reports to'
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID






--3.3 List the Top 10 Customers YTD for the latest year in the Orders file.
-- Based on total value of orders shipped. No Excel required. (10 Marks)

SELECT TOP 10 c.CompanyName, ROUND(SUM(TotalSales),0) AS "Total sales"
FROM Orders o
INNER JOIN Customers c ON o.CustomerID =c.CustomerID
INNER JOIN ((SELECT od.OrderID, SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS TotalSales
FROM [order details] od
GROUP BY OrderID)) od1 ON o.OrderID = od1.OrderID
WHERE  YEAR(ShippedDate) = (SELECT MAX(YEAR(Shippeddate)) from orders)
GROUP BY CompanyName
ORDER BY ROUND(SUM(TotalSales),0) DESC