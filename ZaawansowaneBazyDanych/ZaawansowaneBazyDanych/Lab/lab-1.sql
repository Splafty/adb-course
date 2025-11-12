-- =============================================
-- Piotr
-- Henzolt
-- 230806
-- =============================================

-- =============================================
-- Zadanie 1
-- =============================================
SELECT * 
FROM SalesLT.Customer
WHERE LastName LIKE 'P%';
GO

-- =============================================
-- Zadanie 2
-- =============================================
SELECT FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE CustomerID LIKE '%6';
GO

-- =============================================
-- Zadanie 3
-- =============================================
SELECT Name, ListPrice, ProductNumber
FROM SalesLT.Product
WHERE Name LIKE '%P%'
ORDER BY ListPrice DESC;
GO

-- =============================================
-- Zadanie 4
-- =============================================
SELECT AVG(ListPrice) AS AvaragePrice
FROM SalesLT.Product
WHERE ProductCategoryID % 10 = 6;
GO

-- =============================================
-- Zadanie 5
-- =============================================
SELECT DISTINCT a.City
FROM SalesLT.CustomerAddress ca
JOIN SalesLT.Address a
ON ca.AddressID = a.AddressID
WHERE a.City LIKE 'P%';
GO

-- =============================================
-- Zadanie 6
-- =============================================
INSERT INTO SalesLT.Customer 
    (NameStyle, FirstName, LastName, CompanyName, EmailAddress, Phone, PasswordHash, PasswordSalt, rowguid, ModifiedDate)
VALUES
    (0, 'Piotr', 'Henzolt', 'Lab6', 'Piotr.Henzolt@lab6.com', '123-456-7890', 'HASHEDPASSWORD', 'SALT', NEWID(), GETDATE());
GO

SELECT *
FROM SalesLT.Customer
WHERE EmailAddress = 'Piotr.Henzolt@lab7.com';
GO

-- =============================================
-- Zadanie 7
-- =============================================
INSERT INTO SalesLT.ProductCategory (Name)
VALUES
    ('Special-P'),
    ('Extra-6');
GO

-- =============================================
-- Zadanie 8
-- =============================================
SELECT 
    p.Name AS ProductName,
    p.ProductNumber,
    pc.Name AS CategoryName,
    '230806' AS OwnerId
INTO ProductsCategories230806
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory AS pc
    ON p.ProductCategoryID = pc.ProductCategoryID
WHERE (p.Name LIKE 'P%P') OR (pc.Name LIKE '%P%');
GO

-- =============================================
-- Zadanie 9
-- =============================================
SELECT CategoryName, COUNT(*) AS ProductCount
FROM ProductsCategories230806
GROUP BY CategoryName
ORDER BY ProductCount DESC;
GO