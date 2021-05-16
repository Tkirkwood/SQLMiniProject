use Northwind

--3.4 Plot the Average Ship Time by month for all data in the Orders Table using a line chart as below. (10 Marks)



SELECT  AVG(CAST(DATEDIFF(dd,o.OrderDate, o.ShippedDate) AS FLOAT)) AS "Average time to ship" ,CONCAT(MONTH(o.OrderDate),'/',YEAR(o.OrderDate)) AS "Date Orderd"
FROM Orders o
GROUP BY MONTH(o.OrderDate),YEAR(o.OrderDate)




