/* Isaac Finehout
Sunday, July 19, 2024
CMSC 320 6982
Professor Anthony Baird
QueryTables_Week6_Project3_IsaacFinehout */

-- Retrieve all of the customers' names, account numbers, and addresses (street and zip code only), sorted by account number.
SELECT FirstName,LastName,CustomerID,Address
FROM CUSTOMERS
ORDER BY CustomerID;

-- Retrieve all of the videos rented in the last 30 days and sort in chronological rental date order.
SELECT RentalID,DateRented
FROM Rentals
WHERE DateRented > SYSDATE - 30
ORDER BY DateRented;

-- Produce a list of all the distributors and all their information sorted in order by company name.
SELECT *
FROM Distributors
ORDER BY DistributorName;

-- Update a customer name to change their maiden name to a married name. You can choose which row to update.
-- Make sure that you use the primary key column in your WHERE clause to affect only a specific row.
-- You may want to include a ROLLBACK statement to undo your data update.
UPDATE Customers
SET LastName = 'Doe'
WHERE CustomerID = 'CU200002';
ROLLBACK;


-- Delete a customer from the database. You can choose which row to delete.
-- Make sure that you use the primary key column in your WHERE clause to affect only a specific row.
-- You may want to include a ROLLBACK statement to undo your data deletion.
DELETE FROM Customers
WHERE CustomerID = 'CU200002';
ROLLBACK;