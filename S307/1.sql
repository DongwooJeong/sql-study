-- DDL
DROP TABLE Order_Line_T;
DROP TABLE Order_T;
DROP TABLE Customer_T;
DROP TABLE Product_T;

CREATE TABLE Customer_T
(
Customer_ID number(11,0)    not null, 
Name    varchar2(25)    not null,
CONSTRAINT Customer_PK Primary Key (Customer_ID)
);

CREATE TABLE Order_T
(
Order_ID number(11,0)    not null, 
Customer_ID number(11,0)    not null, 
Order_Date    DATE DEFAULT SYSDATE    not null,
CONSTRAINT Order_PK Primary Key (Order_ID),
CONSTRAINT Order_FK Foreign Key (Customer_ID) REFERENCES Customer_T (Customer_ID)
);

CREATE TABLE Product_T
(
Product_ID number(11,0)    not null,  
Prod_Price    number(5,2)    not null,
CONSTRAINT Product_PK Primary Key (Product_ID)
);

CREATE TABLE Order_Line_T
(
Order_ID number(11,0)    not null, 
Product_ID number(11,0)    not null, 
Qty    number(5),
CONSTRAINT Order_Line_PK Primary Key (Order_ID,Product_ID),
CONSTRAINT Order_Line_FK1 Foreign Key (Order_ID) REFERENCES Order_T (Order_ID),
CONSTRAINT Order_Line_FK2 Foreign Key (Product_ID) REFERENCES Product_T (Product_ID)
);

--DML

INSERT INTO Customer_T Values (1,"Bob");
SELECT *
FROM Customer_T