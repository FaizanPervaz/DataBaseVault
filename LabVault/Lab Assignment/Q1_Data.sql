INSERT INTO Cashier (Cashier_ID, Name, Salary)
VALUES
    (1, 'John Doe', 30000.00),
    (2, 'Jane Smith', 35000.00),
    (3, 'Bob Johnson', 32000.00),
    (4, 'Alice Brown', 38000.00);

INSERT INTO Salesperson (Salesperson_ID, Name, Commission)
VALUES
    (1, 'Sara Green', 0.05),
    (2, 'Mike Wilson', 0.03),
    (3, 'Emily Davis', 0.04),
    (4, 'Daniel Lee', 0.06);

INSERT INTO Customer (Customer_ID, Name)
VALUES
    (1, 'Customer 1'),
    (2, 'Customer 2'),
    (3, 'Customer 3'),
    (4, 'Customer 4');

INSERT INTO Company (Company_ID, Name)
VALUES
    (1, 'Company A'),
    (2, 'Company B'),
    (3, 'Company C'),
    (4, 'Company D');

INSERT INTO Manager (Manager_ID, Name)
VALUES
    (1, 'Manager 1'),
    (2, 'Manager 2'),
    (3, 'Manager 3'),
    (4, 'Manager 4');

INSERT INTO GovernmentTaxAgencies (Tax_Agency_ID, Name)
VALUES
    (1, 'Tax Agency 1');

INSERT INTO PaymentAuthorizationService (Service_ID, Name)
VALUES
    (1, 'Authorization Service 1');

-- Insert data into the Sale table
INSERT INTO Sale (Sale_ID, Timestamp, Total)
VALUES
    (1, '2023-11-05 10:30:00', 150.00),
    (2, '2023-11-05 11:15:00', 220.50),
    (3, '2023-11-05 14:45:00', 95.25),
    (4, '2023-11-05 16:20:00', 175.75);

INSERT INTO Item (Item_ID, Description, Price, Category)
VALUES
    (1, 'Item 1', 10.50, 'Category A'),
    (2, 'Item 2', 15.25, 'Category B'),
    (3, 'Item 3', 8.75, 'Category A'),
    (4, 'Item 4', 12.00, 'Category B');

INSERT INTO SaleLineItem (Line_Item_ID, Sale_ID, Item_ID, Quantity, Subtotal)
VALUES
    (1, 1, 1, 5, 52.50),
    (2, 1, 2, 2, 30.50),
    (3, 2, 3, 4, 35.00),
    (4, 3, 4, 3, 36.00);

INSERT INTO PriceRules (Rule_ID, Rule_Name, Calculation_Method)
VALUES
    (1, 'Rule 1', 'Method A'),
    (2, 'Rule 2', 'Method B'),
    (3, 'Rule 3', 'Method A'),
    (4, 'Rule 4', 'Method B');

INSERT INTO Receipt (Receipt_ID, Sale_ID, Customer_ID, Timestamp)
VALUES
    (1, 1, 1, '2023-11-05 10:45:00'),
    (2, 2, 2, '2023-11-05 11:30:00'),
    (3, 3, 3, '2023-11-05 15:00:00'),
    (4, 4, 4, '2023-11-05 16:45:00');

INSERT INTO InventorySystem (Inventory_ID, Name)
VALUES
    (1, 'Inventory System 1'),
    (2, 'Inventory System 2'),
    (3, 'Inventory System 3'),
    (4, 'Inventory System 4');

INSERT INTO AccountingSystem (Accounting_ID, Name)
VALUES
    (1, 'Accounting System 1'),
    (2, 'Accounting System 2'),
    (3, 'Accounting System 3'),
    (4, 'Accounting System 4');

INSERT INTO SaleAssCustomer (Sale_ID, Customer_ID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO SaleAssSalesPerson (Sale_ID, Salesperson_ID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO SaleInvolvePaymentAuthorizationService (Sale_ID, Service_ID)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1);

INSERT INTO SaleInvolveGovernmentTaxAgencies (Sale_ID, Tax_Agency_ID)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1);
