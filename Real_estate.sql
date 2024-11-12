-- Creating the Property table with
CREATE TABLE Property (
    PropertyID INT PRIMARY KEY, --DEFINING PROPERTYID AS THE PRIMARY KEY
    Address VARCHAR(255) NOT NULL,
    Type VARCHAR(100) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    MaintenanceSchedule DATE
);



-- Creating the Client table 
CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    SecondName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    ClientType VARCHAR(50) NOT NULL
);

ALTER TABLE Client ADD Phone INT;

-- Creating the Rental_Agreement table
CREATE TABLE Rental_Agreement (
    AgreementID INT PRIMARY KEY,
    PropertyID INT NOT NULL,
    ClientID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    RentAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
    
);



-- Creating the Payment table 
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    AgreementID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    AmountPaid DECIMAL(10, 2) NOT NULL,
    PaymentStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (AgreementID) REFERENCES Rental_Agreement(AgreementID)
);

ALTER TABLE rental_agreement ADD COLUMN PaymentID INT;
ALTER TABLE rental_agreement ADD FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);
-- Creating the Maintenance table 
CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY,
    PropertyID INT NOT NULL,
    ScheduledDate DATE NOT NULL,
    MaintenanceType VARCHAR(100) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- Inserting data into Property
INSERT INTO Property (PropertyID, Address, Type, Status, Price, MaintenanceSchedule) VALUES
(1,	'123 Main Street, Kyengera',	'Apartment',	'Available',	1200000.00,	'2024-01-15'),
(2,	'456 Kayunga',	'House',	'Occupied',	2500000.00,	'2024-02-20'),
(3,	'Plot 60 Ntinda',	'Land',	'Occupied',	15500000.00,	'2025-02-20'),
(4,	'Plot 84 Masaka Town',	'House',	'Available',	2500000.00,	'2024-02-20'),
(5,	'Plot 30 Nyeri',	'House',	'Available',	2500000.00,	'2024-02-20'),
(6,	'Plot 56 Mbarara, Ruti',	'House',	'Available',	2500000.00,	'2024-02-20');


-- Inserting data into Client
INSERT INTO Client (ClientID, FirstName, SecondName, Email, Phone, ClientType) VALUES
(1,	'JAMES', 'SSALONGO',	'ssalongojay@gmail.com', 0754567890,	'Tenant'),
(2,	'RUTH',	'AINEBYOONA',	'aineruth@gmail.com',	0759493210,	'Owner'),
(3,	'HILDA',	'BAHATI',	'bhilda@gmail.com',	0779498996,	'Tenant'),
(4,	'TRACY',	'MUGWANEEZA',	'mugwaneeza563@gmail.com',	0767949898,	'Tenant'),
(5,	'FAHAD',	'KATONGOLE',	'katongolenation@gmail.com',	0763949876,	'Tenant'),
(6,	'HILLARY',	'ECHONI',	'hillaryechoni@gmail.com',	0779400006,	'Tenant'),
(7,	'GOLD',	'LAMARO',	'goldenl@gmail.com',	0774448996,	'Tenant'),
(8,	'JULIET',	'KAMWIITE',	'jkammy@gmail.com',	0759488856,	'Owner');

-- Inserting data into Rental_Agreement
INSERT INTO Rental_Agreement (AgreementID, PropertyID, ClientID, StartDate, EndDate, RentAmount) VALUES
(111,	2,	1,	'2023-11-01',	'2024-11-01',	'120000.00'),
(113,	1,	3,	'2019-06-01',	'2025-06-01',	'250000.00'),
(114,	5,	4,	'2023-07-01',	'2025-06-01',	'250000.00'),
(115,	3,	7,	'2021-06-01',	'2025-06-01',	'250000.00'),
(116,	4,	6,	'2020-06-01',	'2025-06-01',	'250000.00'),
(117,	2,	5,	'2022-06-01',	'2025-06-01',	'250000.00');

-- Inserting data into Payment
INSERT INTO Payment (PaymentID, AgreementID, PaymentDate, AmountPaid, PaymentStatus) VALUES
(1,	111,	'2023-12-01',	120000.00,	'Paid'),
(2,	113,	'2023-07-01',	250000.00,	'Paid'),
(3,	115,	'2023-07-01',	0.00,	'Not_Paid'),
(4,	116,	'2023-07-01',	250000.00,	'Paid'),
(5,	117,	'2023-07-01',	250000.00,	'Paid');

-- Inserting data into Maintenance
INSERT INTO Maintenance (MaintenanceID, PropertyID, ScheduledDate, MaintenanceType, Cost) VALUES
(1,	1,	'2024-01-15',	'Plumbing',	15000.00),
(2,	2,	'2024-02-20',	'Electrical',	20000.00),
(3,	1,	'2024-03-15',	'GateRepair',	15000.00),
(4,	1,	'2024-04-15',	'RoofRepair',	225000.00),
(5,	1,	'2024-05-15',	'BuglarProofing',	15000.00);

--Altering table property to add column Destination
ALTER TABLE property ADD COLUMN DESTINATION VARCHAR(60);

----Altering table property to add column property
ALTER TABLE property ADD COLUMN PropertyName VARCHAR(50);


