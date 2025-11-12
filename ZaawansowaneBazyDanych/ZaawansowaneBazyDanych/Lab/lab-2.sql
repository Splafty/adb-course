-- =============================================
-- Piotr
-- Henzolt
-- 230806
-- =============================================
-- X - P
-- Y - 230806
-- N - 6
-- =============================================

-- =============================================
-- Zadanie 1
-- =============================================
INSERT INTO SalesLT.Customer 
    (NameStyle, FirstName, LastName, CompanyName, EmailAddress, Phone, PasswordHash, PasswordSalt, rowguid, ModifiedDate)
VALUES
    (0, 'Gato', 'Pedro', 'TechWorld', 'gato.pedro@techworld.com', '555-222-4567',
     'HASHEDPASSWORD2', 'SALT2', NEWID(), GETDATE());
GO

-- =============================================
-- Zadanie 2
-- =============================================
DECLARE @Litera CHAR(1) = 'P'
DECLARE @Cyfra INT = 6

SELECT CustomerID, FirstName, LastName
FROM SalesLT.Customer
WHERE LastName LIKE @Litera + '%'
    AND CustomerID % 10 = @Cyfra;
GO

-- =============================================
-- Zadanie 3
-- =============================================
DECLARE @Litera CHAR(1) = 'P'

DECLARE @Produkty TABLE (
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(50),
    ListPrice MONEY
);

INSERT INTO @Produkty (ProductID, Name, ListPrice)
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product as p
WHERE p.Name LIKE '%' + @Litera + '%';

SELECT *
FROM @Produkty;
GO

-- =============================================
-- Zadanie 4
-- =============================================
DECLARE @Litera CHAR(1) = 'P'

CREATE TABLE #KlienciMiasta
(
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    City NVARCHAR(50)
);

INSERT INTO #KlienciMiasta (CustomerID, FirstName, LastName, City)
SELECT c.CustomerID, c.FirstName, c.LastName, a.City
FROM SalesLT.Customer as c
INNER JOIN SalesLT.CustomerAddress as  ca
    ON c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address as a
    ON ca.AddressID = a.AddressID
WHERE a.City LIKE @Litera + '%';
GO

SELECT * FROM #KlienciMiasta;
GO

DROP TABLE #KlienciMiasta;
GO

-- =============================================
-- Zadanie 5
-- =============================================
CREATE SCHEMA Student_806 AUTHORIZATION dbo;
GO

CREATE TABLE Student_806.ProduktyP
(
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Category NVARCHAR(100),
    ListPrice MONEY
);
GO

DECLARE @Litera CHAR(1) = 'P'

INSERT INTO Student_806.ProduktyP (ProductID, Name, Category, ListPrice)
SELECT p.ProductID, p.Name, pc.Name, p.ListPrice
FROM SalesLT.Product as p
INNER JOIN SalesLT.ProductCategory pc
    ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name LIKE '%' + @Litera + '%';
GO

SELECT * FROM Student_806.ProduktyP;
GO

-- =============================================
-- Zadanie 6
-- =============================================
DECLARE @Cyfra INT = 6

DECLARE @Podsumowanie TABLE
(
    Category NVARCHAR(100) PRIMARY KEY,
    SredniaCena Money
);

INSERT INTO @Podsumowanie
SELECT pc.Name as Category, AVG(p.ListPrice) as SredniaCena
FROM SalesLT.ProductCategory as pc
INNER JOIN SalesLT.Product as p
    ON pc.ProductCategoryID = p.ProductCategoryID
WHERE pc.ProductCategoryID % 10 = @Cyfra
GROUP BY pc.Name

SELECT * FROM @Podsumowanie
GO

-- =============================================
-- Zadanie 7
-- =============================================
CREATE SCHEMA s230806 AUTHORIZATION dbo;
GO

ALTER SCHEMA s230806 TRANSFER SalesLT.Customer 
GO

ALTER SCHEMA s230806 TRANSFER SalesLT.CustomerAddress 
GO
