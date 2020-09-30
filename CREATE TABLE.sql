
CREATE DATABASE [Blau Jacke Jacket]

USE [Blau Jacke Jacket]

GO

--Create Table customer
CREATE TABLE Customer(
	CustomerId CHAR (5) PRIMARY KEY,
	CustomerName VARCHAR (50) NOT NULL,
	CustomerDOB date NOT NULL,
	CustomerGender VARCHAR (6) NOT NULL,
	CONSTRAINT cekId CHECK(CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT cekCuGender CHECK (CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female')
)

--Create Table Staff
CREATE TABLE Staff(
	StaffId CHAR (5) PRIMARY KEY,
	StaffName VARCHAR (50) NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffGender VARCHAR(6) NOT NULL,
	StaffSalary INT NOT NULL,
	CONSTRAINT cekStId CHECK (StaffId LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT cekVStName CHECK (LEN(StaffName)>=3),
	CONSTRAINT cekStGender CHECK (StaffGender LIKE 'Male' OR StaffGender LIKE 'Female'),
	CONSTRAINT cekStSalary CHECK (StaffSalary >1000000 OR StaffGender <20000000)
)

--CREATE Table Jacket
CREATE TABLE Jacket(
	JacketId CHAR (5) PRIMARY KEY,
	JacketName VARCHAR (50) NOT NULL,
	JacketPrice INT NOT NULL,
	JacketStock INT NOT NULL,
	CONSTRAINT cekJaId CHECK (JacketId LIKE 'JA[0-9][0-9][0-9]'),
	CONSTRAINT cekJaPrice CHECK (JacketPrice>=25000)
)

--CREATE Table Material
CREATE TABLE Material(
	MaterialId CHAR (5) PRIMARY KEY,
	MaterialName VARCHAR (50) NOT NULL,
	MaterialPrice INT NOT NULL,
	MaterialStock INT NOT NULL,
	CONSTRAINT cekMaId CHECK (MaterialId LIKE 'MA[0-9][0-9][0-9]')
)

--Create Table Vendor
CREATE TABLE Vendor(
	VendorId CHAR (5) PRIMARY KEY,
	VendorName VARCHAR (50) NOT NULL,
	VendorAddress VARCHAR (100) NOT NULL,
	VendorEmail VARCHAR (50) NOT NULL,
	CONSTRAINT cekVeId CHECK (VendorId LIKE 'VE[0-9][0-9][0-9]'),
	CONSTRAINT cekVeName CHECK (LEN(VendorName)>=3),
	CONSTRAINT cekVeAddress CHECK (VendorAddress LIKE '% Street'),
	CONSTRAINT cekVeEmail CHECK(VendorEmail LIKE '%@%')
)

--CREATE TABLE DetailJacketMaterial
CREATE TABLE DetailJacketMaterial(
	JacketId CHAR(5) NOT NULL,
	MaterialId CHAR(5) NOT NULL,
	PRIMARY KEY(JacketId, MaterialId),
	FOREIGN KEY (JacketId) REFERENCES Jacket ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (MaterialId) REFERENCES Material ON DELETE CASCADE ON UPDATE CASCADE
)

--CREATE Table Sales Transaction
CREATE TABLE HeaderSalesTransaction(
	SalesTransactionId CHAR (5) PRIMARY KEY,
	StaffId CHAR(5) NOT NULL,
	CustomerId CHAR (5) NOT NULL,
	SalesTransactionDate DATE NOT NULL,
	CONSTRAINT cekSaId CHECK (SalesTransactionId LIKE 'SA[0-9][0-9][0-9]'),
	CONSTRAINT cekStDate CHECK (YEAR(SalesTransactionDate) LIKE 2019),
	FOREIGN KEY (StaffId) REFERENCES Staff ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (CustomerId) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE
)

--CREATE DetailSalesTransaction
CREATE TABLE DetailSalesTransaction(
	SalesTransactionId CHAR (5) NOT NULL,
	JacketId CHAR (5) NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY(SalesTransactionId,JacketId),
	FOREIGN KEY (SalesTransactionId) REFERENCES HeaderSalesTransaction ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (JacketId) REFERENCES Jacket ON DELETE CASCADE ON UPDATE CASCADE
)

--CREATE Table Purchase Transaction
CREATE TABLE HeaderPurchaseTransaction(
	PurchaseTransactionId CHAR(5) PRIMARY KEY,
	StaffId CHAR(5) NOT NULL,
	VendorId CHAR(5) NOT NULL,
	PurchaseTransactionDate DATE NOT NULL, 
	CONSTRAINT cekPtId CHECK (PurchaseTransactionId LIKE 'PR[0-9][0-9][0-9]'),
	CONSTRAINT cekPtDate CHECK (YEAR(PurchaseTransactionDate) LIKE 2019),
	FOREIGN KEY (StaffId) REFERENCES Staff ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (VendorId) REFERENCES Vendor ON DELETE CASCADE ON UPDATE CASCADE, 
)

-- CREATE Table DetailPurchase
CREATE TABLE DetailPurchaseTransaction(
	PurchaseTransactionId CHAR(5) NOT NULL,
	MaterialId CHAR(5) NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY (PurchaseTRansactionId, MaterialId),
	FOREIGN KEY (PurchaseTransactionId) REFERENCES HeaderPurchaseTransaction ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (MaterialId) REFERENCES Material ON DELETE CASCADE ON UPDATE CASCADE
)

