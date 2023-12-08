CREATE TABLE Cashier (
    Cashier_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Salesperson (
    Salesperson_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Commission DECIMAL(5, 2)
);

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Company (
    Company_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Manager (
    Manager_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE GovernmentTaxAgencies (
    Tax_Agency_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE PaymentAuthorizationService (
    Service_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Sale (
    Sale_ID INT PRIMARY KEY,
    Timestamp DATETIME,
    Total DECIMAL(12, 2)
);

CREATE TABLE Item (
    Item_ID INT PRIMARY KEY,
    Description VARCHAR(100),
    Price DECIMAL(8, 2),
    Category VARCHAR(50)
);

CREATE TABLE SaleLineItem (
    Line_Item_ID INT PRIMARY KEY,
    Sale_ID INT,
    Item_ID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (Sale_ID) REFERENCES Sale(Sale_ID),
    FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);

CREATE TABLE PriceRules (
    Rule_ID INT PRIMARY KEY,
    Rule_Name VARCHAR(50),
    Calculation_Method VARCHAR(50)
);

CREATE TABLE Receipt (
    Receipt_ID INT PRIMARY KEY,
    Sale_ID INT,
    Customer_ID INT,
    Timestamp DATETIME,
    FOREIGN KEY (Sale_ID) REFERENCES Sale(Sale_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE InventorySystem (
    Inventory_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE AccountingSystem (
    Accounting_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE SaleAssCustomer (
	Sale_ID int,
	Customer_ID int,
	FOREIGN KEY (Sale_ID) REFERENCES Sale(Sale_ID),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE SaleAssSalesPerson (
	Sale_ID int,
	Salesperson_ID int,
	FOREIGN KEY (Sale_ID) REFERENCES Sale(Sale_ID),
	FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson(Salesperson_ID)
);

CREATE TABLE SaleInvolvePaymentAuthorizationService (
	Sale_ID int,
	Service_ID int,
	FOREIGN KEY (Sale_ID) REFERENCES Sale(Sale_ID),
	FOREIGN KEY (Service_ID) REFERENCES PaymentAuthorizationService(Service_ID)
);

CREATE TABLE SaleInvolveGovernmentTaxAgencies (
	Sale_ID int,
	Tax_Agency_ID int,
	FOREIGN KEY (Sale_ID) REFERENCES Sale(Sale_ID),
	FOREIGN KEY (Tax_Agency_ID) REFERENCES GovernmentTaxAgencies(Tax_Agency_ID)
);