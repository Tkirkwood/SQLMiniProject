use Northwind

--3.2 List all Suppliers with total sales over $10,000 in the Order Details table. 
--Include the Company Name from the Suppliers Table and present as a bar chart as below: (5 Marks)



SELECT s.CompanyName, ROUND(SUM(TotalSales),-3) AS "Total sales"
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID = p.SupplierID
INNER JOIN (SELECT od.ProductID, SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS TotalSales
FROM [order details] od
GROUP BY ProductID) od1 ON p.ProductID = od1.productID
WHERE TotalSales  >= 10000
GROUP BY CompanyName
ORDER BY SUM(TotalSales) DESC