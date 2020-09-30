USE [Blau Jacke Jacket]

--No.1
SELECT CustomerName, CONVERT(VARCHAR, SalesTransactionDate,106) AS [Transaction Date], SUM(Quantity) AS [Transaction Quantity]
FROM Customer c
JOIN HeaderSalesTransaction st ON c.CustomerId = st.CustomerId
JOIN DetailSalesTransaction dst ON dst.SalesTransactionId = st.SalesTransactionId
WHERE (MONTH(st.SalesTransactionDate) LIKE '11') AND JacketId LIKE 'JA002'
GROUP BY CustomerName, st.SalesTransactionDate

--No.2
SELECT VendorName, CONVERT(VARCHAR, PurchaseTransactionDate,103) AS [Transaction Date], MAX(Quantity) AS [Maximum Quantity]
FROM Vendor v 
JOIN HeaderPurchaseTransaction pt ON v.VendorId = pt.VendorId
JOIN DetailPurchaseTransaction dp ON pt.PurchaseTransactionId = dp.PurchaseTransactionId
WHERE (Right(DAY(PurchaseTransactionDate),1)%2) = 0 AND MaterialId LIKE 'MA001'
GROUP BY VendorName,PurchaseTransactionDate

--No.3
SELECT VendorName, REPLACE(VendorAddress,'Street','St.') AS [Vendor Address], SUM(Quantity) AS [Total Item], COUNT(pt.PurchaseTransactionId) AS [Total Transaction]
FROM Vendor v 
JOIN HeaderPurchaseTransaction pt ON v.VendorId = pt.VendorId
JOIN DetailPurchaseTransaction dp ON pt.PurchaseTransactionId = dp.PurchaseTransactionId
WHERE VendorName LIKE 'PT.%' AND (MONTH(PurchaseTransactionDate) LIKE '10')
GROUP BY VendorName,VendorAddress

--No.4 
SELECT StaffName,(LEFT(StaffGender, 1)) AS StaffGender,CustomerName, COUNT(st.SalesTransactionId) AS [Total Sales Transaction]
FROM Staff s
JOIN HeaderSalesTransaction st  ON s.StaffId = st.StaffId
JOIN Customer c ON st.CustomerId =c.CustomerId
JOIN DetailSalesTransaction dst ON st.SalesTransactionId = dst.SalesTransactionId
WHERE (Right(DAY(SalesTransactionDate),1)%2) = 0
GROUP BY StaffName, StaffGender,CustomerName
HAVING SUM(Quantity)>=4

--No.5
SELECT UPPER(CustomerName) AS CustomerName, LEFT(CustomerGender, 1) AS CustomerGender
FROM HeaderSalesTransaction hst
JOIN Customer c ON c.CustomerId = hst.CustomerId
JOIN DetailSalesTransaction dst ON dst.SalesTransactionId = hst.SalesTransactionId,
(
	SELECT AVG(Quantity) AS Rata2
	FROM DetailSalesTransaction
) AS S
WHERE DAY(SalesTransactionDate) = 1 AND Quantity>S.Rata2

--No.6
SELECT VendorName, CONVERT(VARCHAR, PurchaseTransactionDate,107) AS PurchaseDate, LOWER(MaterialName) AS MaterialName
FROM Vendor v 
JOIN HeaderPurchaseTransaction hpt ON v.VendorId=hpt.VendorId
JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseTransactionId=dpt.PurchaseTransactionId
JOIN Material m ON dpt.MaterialId = m.MaterialId,
(
	SELECT AVG(MaterialPrice) AS Rata2MPrice
	FROM Material
) AS S
WHERE MaterialPrice>S.Rata2MPrice AND VendorName LIKE '%Inc'


--No.7
SELECT CustomerName, DAY(SalesTransactionDate) AS [Transaction Day], CAST(Quantity AS VARCHAR) + +' piece(s)' AS Quantity, (SUM(Quantity)*JacketPrice) AS [Total Price]
FROM Customer c
JOIN HeaderSalesTransaction hst ON c.CustomerId=hst.CustomerId
JOIN DetailSalesTransaction dst ON hst.SalesTransactionId =dst.SalesTransactionId
JOIN Jacket j ON j.JacketId = dst.JacketId,
(
	SELECT AVG(Quantity) AS Rata2St FROM DetailSalesTransaction
) AS S
WHERE Quantity > S.Rata2St
GROUP BY CustomerName, SalesTransactionDate, Quantity, JacketPrice
HAVING (SUM(Quantity) * JacketPrice)> 10000000
ORDER BY CustomerName DESC

--No.8
SELECT VendorName, CONVERT(VARCHAR, PurchaseTransactionDate, 106) AS [Transaction Date], MaterialName, RIGHT(m.MaterialID, 3) AS [Material Number]
FROM Vendor v
JOIN HeaderPurchaseTransaction hpt ON v.VendorId = hpt.VendorId
JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseTransactionId = dpt.PurchaseTransactionId
JOIN Material m ON dpt.MaterialId= m.MaterialId, 
(
	SELECT AVG(MaterialStock) AS Rata2S FROM Material
) AS S
WHERE MaterialStock > S.Rata2S
GROUP BY VendorName, PurchaseTransactionDate, MaterialName,m.MaterialID
HAVING  SUM(Quantity * MaterialPrice) > 20000
ORDER BY VendorName ASC

--No.9
BEGIN TRAN
CREATE VIEW ViewPurchaseTransaction 
AS
SELECT VendorName, SUM(Quantity) AS [Total Purchase Quantity], COUNT(hpt.PurchaseTransactionId) AS [Total Purchase Transaction]
FROM Vendor v 
JOIN HeaderPurchaseTransaction hpt ON v.VendorId=hpt.VendorId
JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseTransactionId= dpt.PurchaseTransactionId
WHERE VendorName LIKE 'PT.%'
GROUP BY VendorName
HAVING COUNT(hpt.PurchaseTransactionId) > 2

SELECT * FROM ViewPurchaseTransaction

--No.10
CREATE VIEW ViewSalesTransaction
AS
SELECT StaffName, CustomerName, COUNT(hst.SalesTransactionId) AS [Total Sales Transaction], MAX(Quantity) AS [Maximum Sales] 
FROM Staff s
JOIN HeaderSalesTransaction hst ON s.StaffId=hst.StaffId
JOIN Customer c ON c.CustomerId =hst.CustomerId
JOIN DetailSalesTransaction dst ON dst.SalesTransactionId=hst.SalesTransactionId
WHERE CustomerName LIKE 'R%'
GROUP BY StaffName, CustomerName
HAVING COUNT(hst.SalesTransactionId) > 1
--Buat liat
SELECT * FROM ViewSalesTransaction



