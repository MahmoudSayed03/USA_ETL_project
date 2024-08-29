--Create the DWH
CREATE DATABASE HousePricing;

--USING DWH
USE Housepricing;

-- Create Dimension Tables
CREATE TABLE Dim_Date (
    DATE_ID INT PRIMARY KEY,
    DATE DATE,
    Year INT,
    Month INT,
    Quarter INT,
	Day INT,
	Day_of_week NVARCHAR(30)
);

CREATE TABLE Dim_Property (
    PROPERTY_ID INT PRIMARY KEY,
    STREET nvarchar(225),
    CITY nvarchar(100),
    STATEZIP nvarchar(20),
    COUNTRY nvarchar(50),
    YR_BUILT FLOAT,
    YR_RENOVATED INT
);

CREATE TABLE Dim_View (
    VIEW_ID INT PRIMARY KEY,
    View_Discrition nvarchar(100),
    [VIEW] INT
);

CREATE TABLE Dim_Condition (
    CONDITION_ID INT PRIMARY KEY,
    Condition_Discrition nvarchar(10),
    CONDITION INT
);

-- Create Fact Table
CREATE TABLE Fact_House_Price (
    SALE_ID INT PRIMARY KEY,
    DATE_ID INT REFERENCES Dim_Date(DATE_ID),
    PROPERTY_ID INT REFERENCES Dim_Property(PROPERTY_ID),
    PRICE DECIMAL(18,2),
    BEDROOMS INT,
    BATHROOMS INT,
    SQFT_LIVING INT,
    SQFT_LOT INT,
    FLOORS INT,
    WATERFRONT BIT,
	WaterFrontDes nvarchar(12),
    VIEW_ID INT REFERENCES Dim_View(VIEW_ID),
    CONDITION_ID INT REFERENCES Dim_Condition(CONDITION_ID),
    SQFT_ABOVE FLOAT,
    SQFT_BASEMENT INT

);

SELECT * FROM Dim_Condition;
SELECT * FROM Fact_House_Price;
SELECT * FROM Dim_View;
SELECT * FROM Dim_Date;
SELECT * FROM Dim_Property;
Drop Table Fact_House_Price;
Drop Table Dim_View;



USE s;
CreAtE tABlE samples(
ID INT PRIMAry KEY,
FullName NVARCHAR(40)
);


INSERT INTO samples  ValueS (1, 'MahmoudSayed');

SELECT * FROM samples;