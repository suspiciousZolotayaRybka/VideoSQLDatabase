/* Isaac Finehout
Sunday, July 19, 2024
CMSC 320 6982
Professor Anthony Baird
CreateTables_Week6_Project3_IsaacFinehout */

-- DROP all tables
DROP TABLE DirectorDetails      CASCADE CONSTRAINTS;
DROP TABLE AcademyAwardDetails  CASCADE CONSTRAINTS;
DROP TABLE ActorDetails         CASCADE CONSTRAINTS;
DROP TABLE Directors            CASCADE CONSTRAINTS;
DROP TABLE AcademyAwards        CASCADE CONSTRAINTS;
DROP TABLE Actors               CASCADE CONSTRAINTS;
DROP TABLE InventoryRecords     CASCADE CONSTRAINTS;
DROP TABLE Movies               CASCADE CONSTRAINTS;
DROP TABLE Rentals              CASCADE CONSTRAINTS;
DROP TABLE Customers            CASCADE CONSTRAINTS;
DROP TABLE Shipments            CASCADE CONSTRAINTS;
DROP TABLE Distributors         CASCADE CONSTRAINTS;


-- Create the Distributors table
CREATE TABLE Distributors (
    DistributorName                 VARCHAR2(1000)  NOT NULL,
    PastBusiness                    VARCHAR2(1000)  NOT NULL,
    CONSTRAINT DistributorName_PK PRIMARY KEY (DistributorName)
);
COMMIT;

-- Create the Shipments table
CREATE TABLE Shipments(
    ShipmentID                      VARCHAR2(8)     NOT NULL,
    DistributorName                 VARCHAR2(1000)  NOT NULL,
    Quantity                        NUMBER(4)       NOT NULL,
    Price                           NUMBER(6,2),
    CONSTRAINT ShipmentID_PK PRIMARY KEY (ShipmentID)
);
COMMIT;

-- Create the Customers table
CREATE TABLE Customers(
    CustomerID                      VARCHAR2(8)     NOT NULL,
    VideosRented                    NUMBER(4),
    FirstName                       VARCHAR2(30)    NOT NULL,
    LastName                        VARCHAR2(30)    NOT NULL,
    Address                         VARCHAR2(30),
    Email                           VARCHAR2(1000),
    Phone                           VARCHAR2(30)    NOT NULL,
    CONSTRAINT CustomerID_PK PRIMARY KEY (CustomerID)
);
COMMIT;

-- Create the Rentals table
CREATE TABLE Rentals(
    RentalID                        VARCHAR2(8)     NOT NULL,
    CustomerID                      VARCHAR2(8),
    DateRented                      DATE            NOT NULL,
    DueDate                         DATE            NOT NULL,
    DateReturned                    DATE,
    StandardPrice                   NUMBER(6,2)     NOT NULL,
    LateFee                         NUMBER(6,2)     NOT NULL,
    DamagedFee                      NUMBER(6,2)     NOT NULL,
    FailureToRewindFee              NUMBER(6,2)     NOT NULL,
    Taxes                           NUMBER(6,2)     NOT NULL,
    CONSTRAINT RentalID_PK PRIMARY KEY (RentalID),
    CONSTRAINT Customer_FK FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE
);
COMMIT;

-- Create the Movies table
CREATE TABLE Movies(
    MovieID                         VARCHAR2(8)     NOT NULL,
    Title                           VARCHAR2(1000)  NOT NULL,
    RunningLength                   VARCHAR2(30)    NOT NULL,
    YearReleased                    DATE            NOT NULL,
    Discount                        NUMBER(6,2),
    Inventory                       NUMBER(4)       NOT NULL,
    Genre                           VARCHAR2(1000)  NOT NULL,
    ElectronicCatalogInformation    VARCHAR2(30)    NOT NULL,
    CONSTRAINT MovieID_PK PRIMARY KEY (MovieID)
);
COMMIT;

-- Create the InventoryRecords table
CREATE TABLE InventoryRecords(
    InventoryRecordID               VARCHAR2(8)     NOT NULL,
    DistributorName                 VARCHAR2(30)     NOT NULL,
    RentalID                        VARCHAR2(8),
    MovieID                         VARCHAR2(8)     NOT NULL,
    MediaType                       VARCHAR2(8)     NOT NULL,
    Condition                       VARCHAR2(30)    NOT NULL,
    DistributorSerialNumberForItem  VARCHAR2(8)     NOT NULL,
    CONSTRAINT InventoryRecordID_PK PRIMARY KEY (InventoryRecordID),
    CONSTRAINT DistributorName_FK1 FOREIGN KEY (DistributorName) REFERENCES Distributors(DistributorName) ON DELETE CASCADE,
    CONSTRAINT RentalID_FK2 FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID) ON DELETE CASCADE,
    CONSTRAINT MovieID_FK3 FOREIGN KEY (MovieID) REFERENCES Movies(MovieID) ON DELETE CASCADE,
    CONSTRAINT chk_condition CHECK (Condition IN ('Poor','Fair','New'))
);
COMMIT;

-- Create the Actors table
CREATE TABLE Actors(
    ActorID                         VARCHAR2(8)      NOT NULL,
    ActorDetailID                   VARCHAR2(8),
    FirstName                       VARCHAR2(30)     NOT NULL,
    LastName                        VARCHAR2(30)     NOT NULL,
    CONSTRAINT ActorID_PK PRIMARY KEY (ActorID)
);
COMMIT;

-- Create the AcademyAwards table
CREATE TABLE AcademyAwards(
    AcademyAwardID                  VARCHAR2(8)      NOT NULL,
    AcademyAwardDetailID            VARCHAR2(8),
    AwardDate                       DATE             NOT NULL,
    AwardSummary                    VARCHAR2(1000)   NOT NULL,
    CONSTRAINT AcademyAwardID_PK PRIMARY KEY (AcademyAwardID)
);
COMMIT;

-- Create the Directors table
CREATE TABLE Directors(
    DirectorID                      VARCHAR2(8)      NOT NULL,
    DirectorDetailID                VARCHAR2(8),
    FirstName                       VARCHAR2(30)     NOT NULL,
    LastName                        VARCHAR2(30)     NOT NULL,
    CONSTRAINT DirectorID_PK PRIMARY KEY (DirectorID)
);
COMMIT;

-- Create the ActorDetails table
CREATE TABLE ActorDetails(
    ActorID                         VARCHAR2(8)      NOT NULL,
    MovieID                         VARCHAR2(8)      NOT NULL,
    CONSTRAINT ActorDetailID_PK PRIMARY KEY (ActorID,MovieID),
    CONSTRAINT ActorMovie_FK1 FOREIGN KEY (MovieID) REFERENCES Movies (MovieID) ON DELETE CASCADE
);
COMMIT;

-- Create the AcademyAwardDetails table
CREATE TABLE AcademyAwardDetails(
    AcademyAwardID                  VARCHAR2(8)      NOT NULL,
    MovieID                         VARCHAR2(8)      NOT NULL,
    CONSTRAINT AcademyAwardDetailID_PK PRIMARY KEY (AcademyAwardID,MovieID),
    CONSTRAINT AcademyAwardMovie_FK1 FOREIGN KEY (MovieID) REFERENCES Movies (MovieID) ON DELETE CASCADE
);
COMMIT;

-- Create the DirectorDetails table
CREATE TABLE DirectorDetails(
    DirectorID                      VARCHAR2(8)      NOT NULL,
    MovieID                         VARCHAR2(8)      NOT NULL,
    CONSTRAINT DirectorDetailID_PK PRIMARY KEY (DirectorID,MovieID),
    CONSTRAINT DirectorMovie_FK1 FOREIGN KEY (MovieID) REFERENCES Movies (MovieID) ON DELETE CASCADE
);
COMMIT;

/*
The Actors, AcademyAwards, and Directors Tables do not need to reference their details.
However, as per assignment instructions, there must be at least one ALTER TABLE statement.
*/
-- Modify the Actors table to reference the ActorDetails FK
ALTER TABLE Actors
    ADD CONSTRAINT ActorDetail_FK2 FOREIGN KEY (ActorID,ActorDetailID)
    REFERENCES ActorDetails(ActorID,MovieID) ON DELETE CASCADE;
COMMIT;

-- Modify the AcademyAwards table to reference the AcademyAwardDetails FK
ALTER TABLE AcademyAwards
    ADD CONSTRAINT AcademyAwardDetail_FK2 FOREIGN KEY (AcademyAwardID,AcademyAwardDetailID)
    REFERENCES AcademyAwardDetails(AcademyAwardID,MovieID) ON DELETE CASCADE;
COMMIT;

-- Modify the Directors table to reference the DirectorDetails FK
ALTER TABLE Directors
    ADD CONSTRAINT DirectorDetail_FK2 FOREIGN KEY (DirectorID,DirectorDetailID)
    REFERENCES DirectorDetails(DirectorID,MovieID) ON DELETE CASCADE;
COMMIT;
