SHOW DATABASES;

USE employe

CREATE TABLE Department (
    DepartmentID VARCHAR(5) PRIMARY KEY,
    DepartmentName VARCHAR(50)
);



CREATE TABLE emp (
    EmployeeID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(30),
    Salary DECIMAL(10,2),
    DepartmentID VARCHAR(5), 
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO emp(EmployeeID, Name, Position, Salary) VALUES ('E002', 'JOHN DOE', 'MANAGER', 456000), ('E005', 'JANE SMITH', 'ANALYST', 75000);

INSERT INTO Department(DepartmentID, DepartmentName) VALUES ('D001', "FINANCE"), ('D002', "HUMAN RESOURCE"), ('D003', "IT"), ('D004', 'HEALTH'), ('D005', 'FOOD')

ALTER TABLE emp ADD HireDate DATE

ALTER TABLE emp MODIFY Position VARCHAR(60)

ALTER TABLE emp CHANGE COLUMN Salary MonthlySalary DECIMAL(10, 2);

DELETE FROM emp WHERE EmployeeID = 'E002';

DELETE FROM Department WHERE DepartmentName = 'IT';

DELETE FROM emp;
ALTER TABLE emp
ADD CONSTRAINT FK_Department
FOREIGN KEY (DeparmentID) 
REFERENCES Department(DepartmentID);

CREATE TABLE eemp (
    EmployeeID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(30),
    Salary DECIMAL(10,2),
    DepartmentID VARCHAR(5), 
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO eemp(EmployeeID, Name, Position, Salary) 
VALUES ('E002', 'JOHN DOE', 'MANAGER', 456000), ('E005', 'JANE SMITH', 'ANALYST', 75000), ('EOO6', 'GRATEL BRIDGE', 'ANCHOR', 90430), ('E75','RACHEAL AMBER', 'CLEANER', 7000);

SELECT * FROM eemp 
WHERE Salary > 5000 AND DepartmentID = 'D001'

SELECT * FROM eemp 
WHERE Salary < 10000 OR Position = 'Manager';

SELECT * FROM eemp 
WHERE Position = 'Manager'
AND Salary BETWEEN 50000 AND 7000

SELECT * FROM eemp 
WHERE Salary <> 50000

SELECT * FROM eemp
WHERE Name LIKE 'J%' AND Position <> 'ANALYST';

SELECT * FROM eemp WHERE Salary IS NOT NULL AND Name LIKE "J%"


