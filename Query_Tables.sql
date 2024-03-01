/*
Pete Coutros
CMSC 320 6380
Feb 17, 2024

SQL script to Query the Database
*/

SELECT CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerZIP
FROM Customers 
ORDER BY CustomerID;

SELECT *
FROM Rental_Agreement
WHERE RentalDate >= SYSDATE - 30
ORDER BY RentalDate;

SELECT *
FROM Distributor
ORDER BY CompanyName;

--Show Customers prior to update
SELECT * FROM Customers;

--Update customer with ID 2
UPDATE Customers
SET CustomerLastName = 'Rockburry'
WHERE CustomerID = '2';

--Show Customers after update
SELECT * FROM Customers;

ROLLBACK;

--Show Customers prior to delete
SELECT * FROM Customers;

--Delete customer with ID 4
DELETE Customers
WHERE CustomerID = '4';

--Show Customers after deletion
SELECT * FROM Customers;

ROLLBACK;