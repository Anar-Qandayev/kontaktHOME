CREATE DATABASE KontaktHome
USE KontaktHome
CREATE TABLE Products
(
Id int identity(1,1) PRIMARY KEY,
Name nvarchar(255),
Type nvarchar(50),
Color nvarchar(50),
PurchasePrices float,
SellingPrices float,
CategoryId int references Categories(Id)
)
INSERT INTO Products(Name,Type,Color,PurchasePrices,SellingPrices,CategoryId)
VALUES ('Samsung','S10+','black',600.10,950,1),
       ('Xiaomi','Redmi Note 11Pro','Red',600.39,879.99,1),
       ('Headphones','Sony','Black',500.10,699.99,3),
       ('IPhone','SE GEN','Starry Blue',999.99,1699.99,1),
       ('Huawei','Nova 9 SE','Midnight',600.10,950,1),
	   ('Samsung','S9 ','Twilight',499.00,810,1),
	   ('Huawei','Nova 9 SE','Midnight',600.10,950,1),
       ('Huawei','Nova 9 SE','Midnight',600.10,950,2),
	   ('Huawei','Nova 9 SE','Midnight',600.10,950,2),
	   ('Akami Jam','Case','Violet',4.99,7.99,3)

SELECT*FROM Products

CREATE TABLE Categories
(
Id int identity(1,1) PRIMARY KEY,
Name nvarchar(255)
)
INSERT INTO Categories(Name)
VALUES ('Smartphones'),
       ('Tablets'),
       ('Accessories')

SELECT*FROM Categories

CREATE TABLE Carts
(
Id int identity(1,1) PRIMARY KEY,
Name nvarchar(255),
Type nvarchar(255),
Password int,
TotalPrices float,
ProductId int references Products(Id)
)
INSERT INTO Carts(Name,Type,Password,TotalPrices,ProductId)
VALUES ('Capital Bank','Master cards',1005,1500.99,9),
       ('ATB','Master cards',2045,199.99,10),
       ('Pasha Bank','Master cards',4524,2200.99,11)

SELECT*FROM Carts

CREATE PROCEDURE usp_GetCartsTotalPrices
AS
SELECT SUM(Products.SellingPrices) FROM Products
END
usp_GetCartsTotalPrices

CREATE PROCEDURE usp_GetCartsTotalPurchasePrices
AS
SELECT SUM(Products.PurchasePrices) FROM Products
END
usp_GetCartsTotalPurchasePrices

CREATE PROCEDURE cart_Totalprices
as
SELECT Products.Name,Products.Type,Products.SellingPrices
FROM Products
JOIN Carts
ON
Products.Id=Carts.Id
exec cart_Totalprices

SELECT*FROM Carts