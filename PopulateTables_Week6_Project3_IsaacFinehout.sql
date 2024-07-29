/* Isaac Finehout
Sunday, July 19, 2024
CMSC 320 6982
Professor Anthony Baird
PopulateTables_Week6_Project3_IsaacFinehout */

-- DELETE from all tables
DELETE FROM DirectorDetails;
DELETE FROM AcademyAwardDetails;
DELETE FROM ActorDetails;
DELETE FROM Directors;
DELETE FROM AcademyAwards;
DELETE FROM Actors;  
DELETE FROM Movies;     
DELETE FROM InventoryRecords;
DELETE FROM Rentals;
DELETE FROM Customers;
DELETE FROM Shipments;
DELETE FROM Distributors;
COMMIT;

-- DROP all sequences
DROP SEQUENCE seq_shipments;
DROP SEQUENCE seq_customers;
DROP SEQUENCE seq_rentals;
DROP SEQUENCE seq_movies;
DROP SEQUENCE seq_inventory_records;
DROP SEQUENCE seq_actors;
DROP SEQUENCE seq_directors;
DROP SEQUENCE seq_academy_awards;
COMMIT;

-- Insert ALL into Distributors
INSERT ALL
    INTO Distributors(DistributorName,PastBusiness)
    VALUES('MediaMasters Ltd.','Provided ACME Video Store with 300 DVDs and 200 VHS tapes last quarter. Delivers high-quality media products and excellent customer service.')
    INTO Distributors(DistributorName,PastBusiness)
    VALUES('CineSupply Co.','Supplied ACME Video Store with 500 DVDs and 100 VHS tapes for their classic film collection. Known for reliable shipments and a diverse catalog of titles.')
    INTO Distributors(DistributorName,PastBusiness)
    VALUES('RetroMedia Distributors','Partnered with ACME Video Store to provide 400 VHS tapes for a special retro movie night promotion. Praised for timely deliveries and competitive prices.')
    INTO Distributors(DistributorName,PastBusiness)
    VALUES('VideoHub Suppliers','Delivered 350 DVDs and 150 VHS tapes to ACME Video Store for their new arrivals section. Maintains a strong business relationship with prompt responses and flexible payment terms.')
    INTO Distributors(DistributorName,PastBusiness)
    VALUES('ClassicFilms Inc.','Provided ACME Video Store with a special order of 250 rare VHS tapes and 300 DVDs of classic films. Appreciated for their extensive inventory and exceptional service quality.')
SELECT * FROM DUAL;
COMMIT;

-- Insert using a sequence into Shipments
CREATE SEQUENCE seq_shipments
MINVALUE 100000
MAXVALUE 999999
START WITH 100000
INCREMENT BY 1
CACHE 10
CYCLE;
COMMIT;

INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'MediaMasters Ltd.',150,450.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'MediaMasters Ltd.',200,600.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'CineSupply Co.',100,300.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'CineSupply Co.',250,750.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'CineSupply Co.',175,525.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'RetroMedia Distributors',120,360.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'RetroMedia Distributors',180,540.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'RetroMedia Distributors',220,660.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'VideoHub Suppliers',140,420.00);
INSERT INTO Shipments(ShipmentID,DistributorName,Quantity,Price)
VALUES('SH' || TO_CHAR(seq_shipments.NEXTVAL),'ClassicFilms Inc.',160,480.00);

-- Insert using a sequence into Customers
CREATE SEQUENCE seq_customers
MINVALUE 100000
MAXVALUE 999999
START WITH 200000
INCREMENT BY 1
CACHE 10
CYCLE;
COMMIT;

INSERT INTO Customers(CustomerID,VideosRented,FirstName,LastName,Address,Email,Phone)
VALUES('CU' || TO_CHAR(seq_customers.NEXTVAL),4,'John','Doe','123 Elm St 20783','john.doe@example.com','301-123-4567');
INSERT INTO Customers(CustomerID,VideosRented,FirstName,LastName,Address,Email,Phone)
VALUES('CU' || TO_CHAR(seq_customers.NEXTVAL),2,'Jane','Smith','789 Pine Rd 20783','jane.smith@example.com','301-234-5678');
INSERT INTO Customers(CustomerID,VideosRented,FirstName,LastName,Address,Email,Phone)
VALUES('CU' || TO_CHAR(seq_customers.NEXTVAL),4,'Emily','Johnson','789 Pine Rd 20783','emily.johnson@example.com','301-345-6789');
INSERT INTO Customers(CustomerID,VideosRented,FirstName,LastName,Address,Email,Phone)
VALUES('CU' || TO_CHAR(seq_customers.NEXTVAL),3,'Michael','Brown','101 Maple Blvd 20783','michael.brown@example.com','301-456-7890');
INSERT INTO Customers(CustomerID,VideosRented,FirstName,LastName,Address,Email,Phone)
VALUES('CU' || TO_CHAR(seq_customers.NEXTVAL),2,'Sarah','Davis','202 Birch St 20783','sarah.davis@example.com','301-567-8901');

-- Insert using a sequence into Rentals
CREATE SEQUENCE seq_rentals
MINVALUE 100000
MAXVALUE 999999
START WITH 300000
INCREMENT BY 1
CACHE 10
CYCLE;
COMMIT;

INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200000','14-Jun-2024','21-Jun-2024','20-Jun-2024',4.49,0.00,0.00,0.00,0.45);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200001','15-Jun-2024','22-Jun-2024',NULL,6.99,1.00,0.00,0.00,0.70);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200002','16-Jun-2024','23-Jun-2024','22-Jun-2024',5.49,0.00,2.00,0.00,0.55);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200004','17-Jun-2024','24-Jun-2024',NULL,3.99,0.00,0.00,0.00,0.40);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200000','18-Jun-2024','25-Jun-2024','24-Jun-2024',4.99,0.00,1.00,0.00,0.50);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200001','19-Jun-2024','26-Jun-2024',NULL,5.49,1.00,0.00,0.00,0.55);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200000','01-Jul-2024','08-Jul-2024','07-Jul-2024',4.99,0.00,0.00,0.00,0.50);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200000','03-Jul-2024','10-Jul-2024',NULL,5.99,0.00,2.00,1.00,0.60);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200001','05-Jul-2024','12-Jul-2024','11-Jul-2024',3.99,0.00,0.00,0.00,0.40);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200002','06-Jul-2024','13-Jul-2024',NULL,6.99,1.00,0.00,0.00,0.70);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200002','08-Jul-2024','15-Jul-2024','14-Jul-2024',4.49,0.00,0.00,0.00,0.45);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200002','09-Jul-2024','16-Jul-2024',NULL,5.49,2.00,0.00,0.00,0.55);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200003','10-Jul-2024','17-Jul-2024','16-Jul-2024',4.99,0.00,0.00,0.00,0.50);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200003','11-Jul-2024','18-Jul-2024',NULL,6.49,1.00,1.00,0.00,0.65);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200004','12-Jul-2024','19-Jul-2024','17-Jul-2024',3.99,0.00,0.00,1.00,0.40);
INSERT INTO Rentals(RentalID,CustomerID,DateRented,DueDate,DateReturned,StandardPrice,LateFee,DamagedFee,FailureToRewindFee,Taxes)
VALUES('RE' || TO_CHAR(seq_rentals.NEXTVAL),'CU200003','13-Jul-2024','20-Jul-2024',NULL,5.99,2.00,0.00,0.00,0.60);

-- Insert using a sequence into Movies
CREATE SEQUENCE seq_movies
MINVALUE 100000
MAXVALUE 999999
START WITH 400000
INCREMENT BY 1
CACHE 10
CYCLE;
COMMIT;

/*
Many more movies should exist, as can be seen in the Shipments table.
However, for purpose of simplicity, the number in the Movies table is limited to 23.
That means there will also be 23 InventoryRecords.
*/
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'The Great Escape','172','01-Jan-1963',2,'Adventure','EC123456: A1234567890');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'Casablanca','102','01-Jan-1942',1,'Drama','EC234567: B2345678901');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Discount,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'Inception','148','01-Jan-2010',1.99,2,'Sci-Fi','EC345678: C3456789012');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'The Matrix','136','01-Jan-1999',1,'Sci-Fi','EC456789: D4567890123');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'The Shawshank Redemption','142','01-Jan-1994',1,'Drama','EC567890: E5678901234');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Discount,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'Titanic','195','01-Jan-1997',2.99,1,'Romance','EC678901: F6789012345');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'The Godfather','175','01-Jan-1972',2,'Crime','EC789012: G7890123456');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'The Dark Knight','152','01-Jan-2008',1,'Action','EC890123: H8901234567');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Discount,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'Pulp Fiction','154','01-Jan-1994',1.49,1,'Crime','EC901234: I9012345678');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'Fight Club','139','01-Jan-1999',2,'Drama','EC012345: J0123456789');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'Forrest Gump','142','01-Jan-1994',2,'Drama','EC123450: K1234507890');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Discount,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'The Lord of the Rings','178','01-Jan-2001',2.49,1,'Fantasy','EC234561: L2345618901');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'The Silence of the Lambs','118','01-Jan-1991',2,'Thriller','EC345672: M3456729012');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Discount,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'Jaws','124','01-Jan-1975',1.99,1,'Thriller','EC456783: N4567830123');
INSERT INTO Movies(MovieID,Title,RunningLength,YearReleased,Inventory,Genre,ElectronicCatalogInformation)
VALUES('MV' || TO_CHAR(seq_movies.NEXTVAL),'Jurassic Park','127','01-Jan-1993',3,'Sci-Fi','EC567894: O5678941234');

-- Insert using a sequence into InventoryRecords
/*
Pseudocode for InventoryRecords located at the very bottom of Script
*/
CREATE SEQUENCE seq_inventory_records
MINVALUE 100000
MAXVALUE 999999
START WITH 500000
INCREMENT BY 1
CACHE 10
CYCLE;
COMMIT;

INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'MediaMasters Ltd.','RE300000','MV400000','VHS','Fair','EC123456');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'MediaMasters Ltd.','RE300001','MV400000','DVD','Poor','EC123456');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'CineSupply Co.','RE300002','MV400001','VHS','New','EC234567');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'RetroMedia Distributors','RE300003','MV400002','DVD','Fair','EC345678');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'RetroMedia Distributors','RE300004','MV400002','VHS','Poor','EC345678');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'VideoHub Suppliers','RE300005','MV400003','DVD','New','EC456789');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'ClassicFilms Inc.','RE300006','MV400004','VHS','Fair','EC567890');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'MediaMasters Ltd.','RE300007','MV400005','DVD','Poor','EC678901');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'CineSupply Co.','RE300008','MV400006','VHS','Fair','EC789012');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'CineSupply Co.','RE300009','MV400006','DVD','New','EC789012');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'RetroMedia Distributors','RE300010','MV400007','VHS','Poor','EC890123');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'VideoHub Suppliers','RE300011','MV400008','DVD','Fair','EC901234');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'ClassicFilms Inc.','RE300012','MV400009','VHS','New','EC012345');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'ClassicFilms Inc.','RE300013','MV400009','DVD','Poor','EC012345');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'MediaMasters Ltd.','RE300014','MV400010','VHS','Fair','EC123450');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,RentalID,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'MediaMasters Ltd.','RE300015','MV400010','DVD','New','EC123450');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'CineSupply Co.','MV400011','VHS','Poor','EC234561');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'RetroMedia Distributors','MV400012','DVD','Fair','EC345672');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'RetroMedia Distributors','MV400012','VHS','New','EC345672');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'VideoHub Suppliers','MV400013','DVD','Poor','EC456783');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'ClassicFilms Inc.','MV400014','VHS','Fair','EC345672');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'ClassicFilms Inc.','MV400014','DVD','New','EC345672');
INSERT INTO InventoryRecords(InventoryRecordID,DistributorName,MovieID,MediaType,Condition,DistributorSerialNumberForItem)
VALUES('IR' || TO_CHAR(seq_inventory_records.NEXTVAL),'ClassicFilms Inc.','MV400014','VHS','Poor','EC345672');

-- Insert using a sequence into Actors
CREATE SEQUENCE seq_actors
MINVALUE 100000
MAXVALUE 999999
START WITH 600000
INCREMENT BY 1
CACHE 10
CYCLE;
COMMIT;

INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Steve', 'McQueen');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'James', 'Garner');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Humphrey', 'Bogart');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Ingrid', 'Bergman');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Leonardo', 'DiCaprio');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Joseph', 'Gordon-Levitt');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Keanu', 'Reeves');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Laurence', 'Fishburne');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Tim', 'Robbins');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Morgan', 'Freeman');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Kate', 'Winslet');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Marlon', 'Brando');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Al', 'Pacino');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Christian', 'Bale');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Heath', 'Ledger');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'John', 'Travolta');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Uma', 'Thurman');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Brad', 'Pitt');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Edward', 'Norton');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Tom', 'Hanks');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Robin', 'Wright');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Elijah', 'Wood');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Ian', 'McKellen');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Jodie', 'Foster');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Anthony', 'Hopkins');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Roy', 'Scheider');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Robert', 'Shaw');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Sam', 'Neill');
INSERT INTO Actors(ActorID, FirstName, LastName)
VALUES('AC' || TO_CHAR(seq_actors.NEXTVAL), 'Laura', 'Dern');

-- Insert using a sequence into Directors
CREATE SEQUENCE seq_directors
MINVALUE 100000
MAXVALUE 999999
START WITH 700000
INCREMENT BY 1
CACHE 10
CYCLE;
COMMIT;

INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'John','Sturges');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Michael','Curtiz');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Christopher','Nolan');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Lana','Wachowski');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Lilly','Wachowski');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Frank','Darabont');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'James','Cameron');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Francis Ford','Coppola');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Quentin','Tarantino');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'David','Fincher');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Robert','Zemeckis');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Peter','Jackson');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Jonathan','Demme');
INSERT INTO Directors(DirectorID,FirstName,LastName)
VALUES('DR' || TO_CHAR(seq_directors.NEXTVAL),'Steven','Spielberg');

-- Insert using a sequence into AcademyAwards
CREATE SEQUENCE seq_academy_awards
MINVALUE 100000
MAXVALUE 999999
START WITH 800000
INCREMENT BY 1
CACHE 10
CYCLE;
COMMIT;

-- Insert statements for Academy Awards (Oscars)
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'12-Mar-1964','Best Director - John Sturges for The Great Escape');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'07-Mar-1944','Best Director - Michael Curtiz for Casablanca');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'27-Feb-2011','Best Director - Christopher Nolan for Inception');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'26-Mar-2000','Best Director - Lana Wachowski for The Matrix');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'26-Mar-2000','Best Director - Lilly Wachowski for The Matrix');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'27-Feb-1995','Best Actor - Tim Robbins for The Shawshank Redemption');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'23-Mar-1998','Best Actor - Leonardo DiCaprio for Titanic');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'27-Mar-1973','Best Actor - Marlon Brando for The Godfather');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'22-Feb-2009','Best Actor - Heath Ledger for The Dark Knight');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'24-Mar-1995','Best Actor - Tom Hanks for Forrest Gump');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'28-Feb-1994','Best Movie - Forest Gump');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'26-Feb-2004','Best Movie - The Lord of the Rings');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'24-Mar-1991','Best Movie - The Silence of the Lambs');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'25-Mar-1987','Best Movie - Jaws');
INSERT INTO AcademyAwards(AcademyAwardID,AwardDate,AwardSummary)
VALUES('AA' || TO_CHAR(seq_academy_awards.NEXTVAL),'26-Mar-2002','Best Movie - Jurassic Park');

-- Insert statements for ActorDetails
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600000','MV400000'); -- Steve McQueen in The Great Escape
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600001','MV400000'); -- James Garner in The Great Escape
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600002','MV400001'); -- Humphrey Bogart in Casablanca
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600003','MV400001'); -- Ingrid Bergman in Casablanca
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600004','MV400002'); -- Leonardo DiCaprio in Inception
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600005','MV400002'); -- Joseph Gordon-Levitt in Inception
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600006','MV400003'); -- Keanu Reeves in The Matrix
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600007','MV400003'); -- Laurence Fishburne in The Matrix
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600008','MV400004'); -- Tim Robbins in The Shawshank Redemption
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600009','MV400004'); -- Morgan Freeman in The Shawshank Redemption
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600004','MV400005'); -- Leonardo DiCaprio in Titanic
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600010','MV400005'); -- Kate Winslet in Titanic
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600011','MV400006'); -- Marlon Brando in The Godfather
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600012','MV400006'); -- Al Pacino in The Godfather
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600013','MV400007'); -- Christian Bale in The Dark Knight
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600014','MV400007'); -- Heath Ledger in The Dark Knight
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600015','MV400008'); -- John Travolta in Pulp Fiction
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600016','MV400008'); -- Uma Thurman in Pulp Fiction
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600017','MV400009'); -- Brad Pitt in Fight Club
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600018','MV400009'); -- Edward Norton in Fight Club
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600019','MV400010'); -- Tom Hanks in Forrest Gump
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600020','MV400010'); -- Robin Wright in Forrest Gump
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600021','MV400011'); -- Elijah Wood in The Lord of the Rings
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600022','MV400011'); -- Ian McKellen in The Lord of the Rings
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600023','MV400012'); -- Jodie Foster in The Silence of the Lambs
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600024','MV400012'); -- Anthony Hopkins in The Silence of the Lambs
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600025','MV400013'); -- Roy Scheider in Jaws
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600026','MV400013'); -- Robert Shaw in Jaws
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600027','MV400014'); -- Sam Neill in Jurassic Park
INSERT INTO ActorDetails(ActorID,MovieID) VALUES ('AC600028','MV400014'); -- Laura Dern in Jurassic Park

-- Insert statements for DirectorDetails
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700000','MV400000'); -- John Sturges "The Great Escape"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700001','MV400001'); -- Michael Curtiz "Casablanca"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700002','MV400002'); -- Christopher Nolan "Inception"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700002','MV400007'); -- Christopher Nolan and "The Dark Knight"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700003','MV400003'); -- Lana Wachowski "The Matrix"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700004','MV400003'); -- Lilly Wachowski "The Matrix"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700005','MV400004'); -- Frank Darabont "The Shawshank Redemption"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700006','MV400005'); -- James Cameron "Titanic"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700007','MV400006'); -- Francis Ford Coppola "The Godfather"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700008','MV400008'); -- Quentin Tarantino "Pulp Fiction"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700009','MV400009'); -- David Fincher "Fight Club"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700010','MV400010'); -- Robert Zemeckis "Forrest Gump"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700011','MV400011'); -- Peter Jackson "The Lord of the Rings"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700012','MV400012'); -- Jonathan Demme "The Silence of the Lambs"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700013','MV400013'); -- Steven Spielberg "Jaws"
INSERT INTO DirectorDetails(DirectorID,MovieID) VALUES ('DR700013','MV400014'); -- Steven Spielberg"Jurassic Park"

-- Insert statements for AcademyAwardDetails
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400000', 'AA800000'); -- Best Director - John Sturges for The Great Escape
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400001', 'AA800001'); -- Best Director - Michael Curtiz for Casablanca
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400002', 'AA800002'); -- Best Director - Christopher Nolan for Inception
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400003', 'AA800003'); -- Best Director - Lana Wachowski for The Matrix
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400003', 'AA800004'); -- Best Director - Lilly Wachowski for The Matrix
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400004', 'AA800005'); -- Best Actor - Tim Robbins for The Shawshank Redemption
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400005', 'AA800006'); -- Best Actor - Leonardo DiCaprio for Titanic
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400006', 'AA800007'); -- Best Actor - Marlon Brando for The Godfather
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400007', 'AA800008'); -- Best Actor - Heath Ledger for The Dark Knight
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400010', 'AA800009'); -- Best Actor - Tom Hanks for Forrest Gump
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400010', 'AA800010'); -- Best Movie - Forest Gump
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400011', 'AA800011'); -- Best Movie - The Lord of the Rings
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400012', 'AA800012'); -- Best Movie - The Silence of the Lambs
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400013', 'AA800013'); -- Best Movie - Jaws
INSERT INTO AcademyAwardDetails(MovieID, AcademyAwardID) VALUES ('MV400014', 'AA800014'); -- Best Movie - Jurassic Park

-- AcademyAwards (15)
/*
/*
AA800000 -- 'Best Director - John Sturges for The Great Escape', '12-Mar-1964'
AA800001 -- 'Best Director - Michael Curtiz for Casablanca', '07-Mar-1944'
AA800002 -- 'Best Director - Christopher Nolan for Inception', '27-Feb-2011'
AA800003 -- 'Best Director - Lana Wachowski for The Matrix', '26-Mar-2000'
AA800004 -- 'Best Director - Lilly Wachowski for The Matrix', '26-Mar-2000'
AA800005 -- 'Best Actor - Tim Robbins for The Shawshank Redemption', '27-Feb-1995'
AA800006 -- 'Best Actor - Leonardo DiCaprio for Titanic', '23-Mar-1998'
AA800007 -- 'Best Actor - Marlon Brando for The Godfather', '27-Mar-1973'
AA800008 -- 'Best Actor - Heath Ledger for The Dark Knight', '22-Feb-2009'
AA800009 -- 'Best Actor - Tom Hanks for Forrest Gump', '24-Mar-1995'
AA800010 -- 'Best Movie - Forest Gump', '28-Feb-1994'
AA800011 -- 'Best Movie - The Lord of the Rings', '26-Feb-2004'
AA800012 -- 'Best Movie - The Silence of the Lambs', '24-Mar-1991'
AA800013 -- 'Best Movie - Jaws', '25-Mar-1987'
AA800014 -- 'Best Movie - Jurassic Park', '26-Mar-2002'
*/

-- AvailableMovieIDs (15 unique movies, 23 total records)
/*
MV400000 -- The Great Escape
MV400001 -- Casablanca
MV400002 -- Inception
MV400003 -- The Matrix
MV400004 -- The Shawshank Redemption
MV400005 -- Titanic
MV400006 -- The Godfather
MV400007 -- The Dark Knight
MV400008 -- Pulp Fiction
MV400009 -- Fight Club
MV400010 -- Forrest Gump
MV400011 -- The Lord of the Rings
MV400012 -- The Silence of the Lambs
MV400013 -- Jaws
MV400014 -- Jurassic Park
*/




-- 15 total Academy Awards
/*
AA800000 - Best Director - John Sturges for The Great Escape
AA800001 - Best Director - Michael Curtiz for Casablanca
AA800002 - Best Director - Christopher Nolan for Inception
AA800003 - Best Director - Lana Wachowski for The Matrix
AA800004 - Best Director - Lilly Wachowski for The Matrix
AA800005 - Best Actor - Tim Robbins for The Shawshank Redemption
AA800006 - Best Actor - Leonardo DiCaprio for Titanic
AA800007 - Best Actor - Marlon Brando for The Godfather
AA800008 - Best Actor - Heath Ledger for The Dark Knight
AA800009 - Best Actor - Tom Hanks for Forrest Gump
AA800010 - Best Movie - Schindler’s List
AA800011 - Best Movie - The Lord of the Rings: The Return of the King
AA800012 - Best Movie - Dances with Wolves
AA800013 - Best Movie - Platoon
AA800014 - Best Movie - A Beautiful Mind
*/

-- 14 total directors
/*
DR700000 -- John Sturges
DR700001 -- Michael Curtiz
DR700002 -- Christopher Nolan
DR700003 -- Lana Wachowski
DR700004 -- Lilly Wachowski
DR700005 -- Frank Darabont
DR700006 -- James Cameron
DR700007 -- Francis Ford Coppola
DR700008 -- Quentin Tarantino
DR700009 -- David Fincher
DR700010 -- Robert Zemeckis
DR700011 -- Peter Jackson
DR700012 -- Jonathan Demme
DR700013 -- Steven Spielberg
*/

-- 29 total actors
/*
AC600000 -- Steve McQueen
AC600001 -- James Garner
AC600002 -- Humphrey Bogart
AC600003 -- Ingrid Bergman
AC600004 -- Leonardo DiCaprio
AC600005 -- Joseph Gordon-Levitt
AC600006 -- Keanu Reeves
AC600007 -- Laurence Fishburne
AC600008 -- Tim Robbins
AC600009 -- Morgan Freeman
AC600010 -- Kate Winslet
AC600011 -- Marlon Brando
AC600012 -- Al Pacino
AC600013 -- Christian Bale
AC600014 -- Heath Ledger
AC600015 -- John Travolta
AC600016 -- Uma Thurman
AC600017 -- Brad Pitt
AC600018 -- Edward Norton
AC600019 -- Tom Hanks
AC600020 -- Robin Wright
AC600021 -- Elijah Wood
AC600022 -- Ian McKellen
AC600023 -- Jodie Foster
AC600024 -- Anthony Hopkins
AC600025 -- Roy Scheider
AC600026 -- Robert Shaw
AC600027 -- Sam Neill
AC600028 -- Laura Dern
*/


-- InventoryRecord is one movie, so there will be 23 total
-- Available DistributorNames (5 total)
/*
'MediaMasters Ltd.'
'CineSupply Co.'
'RetroMedia Distributors'
'VideoHub Suppliers'
'ClassicFilms Inc.'
*/

--Available RentalIDs (16 total)
/*
RE300000
RE300001
RE300002
RE300003
RE300004
RE300005
RE300006
RE300007
RE300008
RE300009
RE300010
RE300011
RE300012
RE300013
RE300014
RE300015
*/

-- AvailableMovieIDs (15 unique movies, 23 total records)
/*
MV400000
MV400000
MV400001
MV400002
MV400002
MV400003
MV400004
MV400005
MV400006
MV400006
MV400007
MV400008
MV400009
MV400009
MV400010
MV400010
MV400011
MV400012
MV400012
MV400013
MV400014
MV400014
MV400014
*/