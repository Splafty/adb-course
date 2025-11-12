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

--https://github.com/Splafty/adb-course.git

-- =============================================
-- Zadanie 2
-- =============================================
ALTER TABLE [s230806].Customer
ADD 
    SysStartTime DATETIME2(0) GENERATED ALWAYS AS ROW START NOT NULL 
        DEFAULT SYSUTCDATETIME(),
    SysEndTime DATETIME2(0) GENERATED ALWAYS AS ROW END NOT NULL 
        DEFAULT CONVERT(datetime2(0), '9999-12-31 23:59:59'),
    PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime);
GO

ALTER TABLE [s230806].Customer
SET (SYSTEM_VERSIONING = ON);
GO

-- =============================================
-- Zadanie 3
-- =============================================
UPDATE [s230806].Customer
-- wyciagamy poczatek maila tzn do '@' i dodajemy '_updated@mail.com'
SET EmailAddress = CONCAT(LEFT(EmailAddress, CHARINDEX('@', EmailAddress)-1), '_updated@mail.com')
WHERE CustomerID BETWEEN 1 AND 15;
GO

UPDATE [s230806].Customer
SET 
    FirstName = 'Janusz',
    LastName = 'Nowy',
    Phone = '420-111-000'
WHERE CustomerID = 1;
GO

INSERT INTO [s230806].Customer (FirstName, LastName, EmailAddress, Phone, PasswordHash, PasswordSalt)
VALUES 
('Yaqub', 'Pibiazah', 'yaqub.pibiazah@mail.com', '420-111-001', 'qwerty', 'oppa'),
('Khaled', 'Pashmiri', 'khaled.pashmiri@mail.com', '420-111-002', 'qwerty', 'oppa'),
('Khidir', 'Parawita', 'khidir.parawita@mail.com', '420-111-003', 'qwerty', 'oppa'),
('Ismail', 'Panabawi', 'ismail.panabawi@mail.com', '420-111-004', 'qwerty', 'oppa'),
('Usman', 'Pisha', 'usman.pisha@mail.com', '420-111-005', 'qwerty', 'oppa'),
('Muhammad', 'Pumbul', 'muhammad.pumbul@mail.com', '420-111-006', 'qwerty', 'oppa');
GO

-- =============================================
-- Zadanie 4
-- =============================================
SELECT 
    CustomerID,
    FirstName,
    LastName,
    EmailAddress,
    Phone,
    SysStartTime,
    SysEndTime
FROM [s230806].Customer
FOR SYSTEM_TIME ALL
WHERE CustomerID = 1
ORDER BY SysStartTime;
GO

-- =============================================
-- Zadanie 5
-- =============================================
SELECT * 
FROM [s230806].Customer
FOR SYSTEM_TIME AS OF '2025-11-12 21:19:28'
ORDER BY CustomerID;
GO

-- =============================================
-- Zadanie 6
-- =============================================
CREATE TABLE [SalesLT].[ProductAttribute] (
    ProductAttributeID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    Attributes XML NOT NULL,
    CONSTRAINT FK_ProductAttribute_Product FOREIGN KEY (ProductID)
        REFERENCES [SalesLT].[Product](ProductID)
);

INSERT INTO [SalesLT].[ProductAttribute] (ProductID, Attributes)
VALUES
(717, 
 '<Attributes>
     <Waga>1.2</Waga>
     <Wysokosc>10</Wysokosc>
     <Szerokosc>5</Szerokosc>
     <Kolor>Czerwony</Kolor>
     <Material>Plastik</Material>
     <Pojemnosc>1.5</Pojemnosc>
  </Attributes>'),
(718,
 '<Attributes>
     <Waga>0.5</Waga>
     <Wysokosc>8</Wysokosc>
     <Szerokosc>4</Szerokosc>
     <Kolor>Niebieski</Kolor>
     <Material>Metal</Material>
     <Pojemnosc>0.8</Pojemnosc>
  </Attributes>'),
(719, 
 '<Attributes>
     <Waga>1</Waga>
     <Wysokosc>3</Wysokosc>
     <Szerokosc>2</Szerokosc>
     <Kolor>Zielony</Kolor>
     <Material>Drewno</Material>
     <Pojemnosc>0.5</Pojemnosc>
  </Attributes>'),
(720,
 '<Attributes>
     <Waga>0.8</Waga>
     <Wysokosc>10</Wysokosc>
     <Szerokosc>5</Szerokosc>
     <Kolor>Czarny</Kolor>
     <Material>Szklo</Material>
     <Pojemnosc>1.0</Pojemnosc>
  </Attributes>'),
(721,
 '<Attributes>
     <Waga>1.5</Waga>
     <Wysokosc>12</Wysokosc>
     <Szerokosc>6</Szerokosc>
     <Kolor>Czerwony</Kolor>
     <Material>Metal</Material>
     <Pojemnosc>2.0</Pojemnosc>
  </Attributes>');
  GO

-- =============================================
-- Zadanie 7
-- =============================================
INSERT INTO [SalesLT].[ProductAttribute] (ProductID, Attributes)
VALUES
(722, 
 '<Attributes>
     <Waga>2.1</Waga>
     <Wysokosc>15</Wysokosc>
     <Szerokosc>7</Szerokosc>
     <Kolor>Srebrny</Kolor>
     <Material>Aluminium</Material>
     <Pojemnosc>2.5</Pojemnosc>
  </Attributes>'),
(723,
 '<Attributes>
     <Waga>0.9</Waga>
     <Wysokosc>9</Wysokosc>
     <Szerokosc>4</Szerokosc>
     <Kolor>Bialy</Kolor>
     <Material>Tworzywo</Material>
     <Pojemnosc>1.2</Pojemnosc>
  </Attributes>'),
(724,
 '<Attributes>
     <Waga>3.0</Waga>
     <Wysokosc>20</Wysokosc>
     <Szerokosc>10</Szerokosc>
     <Kolor>Szary</Kolor>
     <Material>Stal</Material>
     <Pojemnosc>3.0</Pojemnosc>
  </Attributes>'),
(725,
 '<Attributes>
     <Waga>1.8</Waga>
     <Wysokosc>11</Wysokosc>
     <Szerokosc>6</Szerokosc>
     <Kolor>Zloty</Kolor>
     <Material>Mosiadz</Material>
     <Pojemnosc>1.8</Pojemnosc>
  </Attributes>'),
(726,
 '<Attributes>
     <Waga>0.7</Waga>
     <Wysokosc>7</Wysokosc>
     <Szerokosc>3</Szerokosc>
     <Kolor>Pomaranczowy</Kolor>
     <Material>Plastik</Material>
     <Pojemnosc>0.9</Pojemnosc>
  </Attributes>');
GO

-- =============================================
-- Zadanie 8
-- =============================================
-- aktualizacja koloru
UPDATE [SalesLT].[ProductAttribute]
SET Attributes.modify('replace value of (/Attributes/Kolor/text())[1]
                      with concat("P", (/Attributes/Kolor/text())[1])');
GO

-- aktualizacja materialu
UPDATE [SalesLT].[ProductAttribute]
SET Attributes.modify('replace value of (/Attributes/Material/text())[1]
                      with concat("P", (/Attributes/Material/text())[1])');
GO

-- =============================================
-- Zadanie 9
-- =============================================
DECLARE @ProductJson NVARCHAR(MAX) = N'{
    "ProductID": 717,
    "Name": "Rower",
    "Color": "Czerwony",
    "Material": "Metal",
    "Available": "N"
}';

-- przed zmiana
SELECT @ProductJson AS [JSON_Pierwotny];

SET @ProductJson = JSON_MODIFY(@ProductJson, '$.Name', '230806');

-- po zmianie
SELECT @ProductJson AS [JSON_Po_Zmianie];