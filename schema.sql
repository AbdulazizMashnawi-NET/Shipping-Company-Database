-----------------------------------------------------------
-- PHASE 1: CREATE TABLES (DDL)
-----------------------------------------------------------

-- 1. Creating Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    ManagerID INT,
    ManagerStartDate DATE,
    Location VARCHAR(100)
);

-- 2. Creating Shipment Table
CREATE TABLE Shipment (
    ShipmentID INT PRIMARY KEY, 
    ShipmentName VARCHAR(100),
    ShipmentLocation VARCHAR(100),
    DepartmentID INT
);

-- 3. Creating Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY, 
    Name VARCHAR(100),
    Address VARCHAR(100),
    Salary INT,
    Gender VARCHAR(10),
    BirthDate DATE,
    DepartmentID INT,
    SupervisorID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
    FOREIGN KEY (SupervisorID) REFERENCES Employee (EmployeeID) 
);

-- 4. Creating Dependent Table
CREATE TABLE Dependent (
    DependentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    BirthDate DATE,
    Relationship VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
);

-- 5. Creating Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-----------------------------------------------------------
-- PHASE 2: INSERTING DATA (DML)
-----------------------------------------------------------

-- Inserting Into Department
INSERT INTO Department (DepartmentID, Name, ManagerID, ManagerStartDate, Location)
VALUES (1, 'Research', 101, TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'Building A');
INSERT INTO Department (DepartmentID, Name, ManagerID, ManagerStartDate, Location)
VALUES (2, 'Sales', 102, TO_DATE('2020-06-25', 'YYYY-MM-DD'), 'Building B');
INSERT INTO Department (DepartmentID, Name, ManagerID, ManagerStartDate, Location)
VALUES (3, 'IT', 103, TO_DATE('2019-03-10', 'YYYY-MM-DD'), 'Building C');
INSERT INTO Department (DepartmentID, Name, ManagerID, ManagerStartDate, Location)
VALUES (4, 'HR', 104, TO_DATE('2022-11-05', 'YYYY-MM-DD'), 'Building D');

-- Inserting Into Shipment
INSERT INTO Shipment (ShipmentID, ShipmentName, ShipmentLocation, DepartmentID)
VALUES (1, 'Shipment A', 'Jazan', 1);
INSERT INTO Shipment (ShipmentID, ShipmentName, ShipmentLocation, DepartmentID)
VALUES (2, 'Shipment B', 'Jeddah', 2);
INSERT INTO Shipment (ShipmentID, ShipmentName, ShipmentLocation, DepartmentID)
VALUES (3, 'Shipment C', 'Dammam', 3);
INSERT INTO Shipment (ShipmentID, ShipmentName, ShipmentLocation, DepartmentID)
VALUES (4, 'Shipment D', 'Khobar', 4);

-- Inserting Into Employee
INSERT INTO Employee (EmployeeID, Name, Address, Salary, Gender, BirthDate, DepartmentID, SupervisorID)
VALUES (101, 'Abdulaziz Mashnawi', '123 H St', 60000, 'Male', TO_DATE('2004-10-12', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO Employee (EmployeeID, Name, Address, Salary, Gender, BirthDate, DepartmentID, SupervisorID)
VALUES (102, 'Sara Alrajhi', '456 G St', 75000, 'Female', TO_DATE('2004-05-05', 'YYYY-MM-DD'), 2, 101);
INSERT INTO Employee (EmployeeID, Name, Address, Salary, Gender, BirthDate, DepartmentID, SupervisorID)
VALUES (103, 'Nora Alshammari', '321 V St', 55000, 'Female', TO_DATE('2003-04-02', 'YYYY-MM-DD'), 3, 102);
INSERT INTO Employee (EmployeeID, Name, Address, Salary, Gender, BirthDate, DepartmentID, SupervisorID)
VALUES (104, 'Eyas Zakri', '654 B St', 65000, 'Male', TO_DATE('1999-09-15', 'YYYY-MM-DD'), 4, 103);

-- Inserting Into Dependent
INSERT INTO Dependent (DependentID, Name, Gender, BirthDate, Relationship, EmployeeID)
VALUES (1, 'Omar', 'Male', TO_DATE('2015-07-12', 'YYYY-MM-DD'), 'Son', 101);
INSERT INTO Dependent (DependentID, Name, Gender, BirthDate, Relationship, EmployeeID)
VALUES (2, 'Maryam', 'Female', TO_DATE('2017-12-05', 'YYYY-MM-DD'), 'Daughter', 101);
INSERT INTO Dependent (DependentID, Name, Gender, BirthDate, Relationship, EmployeeID)
VALUES (3, 'Mohammed', 'Male', TO_DATE('2012-03-20', 'YYYY-MM-DD'), 'Son', 102);
INSERT INTO Dependent (DependentID, Name, Gender, BirthDate, Relationship, EmployeeID)
VALUES (4, 'Dalal', 'Female', TO_DATE('2014-08-10', 'YYYY-MM-DD'), 'Daughter', 102);

-- Inserting Into Customer
INSERT INTO Customer (CustomerID, Name, Address, Phone, Email)
VALUES (1, 'Mohammed Salman', '789 King Abdulaziz St', '05345678912', 'mohsal@example.com');
INSERT INTO Customer (CustomerID, Name, Address, Phone, Email) 
VALUES (2, 'Khaled AlFaisal', '456 Abo Baker St', '0523456789', 'khafai@example.com');
INSERT INTO Customer (CustomerID, Name, Address, Phone, Email) 
VALUES (3, 'Fahd Abdulaziz', '321 Khaled AlWaled St', '0512345678', 'Fahd@example.com');

-----------------------------------------------------------
-- PHASE 3: TESTING QUERIES
-----------------------------------------------------------

-- 1. Display shipment details where the shipment is located in 'Jazan'
SELECT * FROM Shipment WHERE ShipmentLocation = 'Jazan';

-- 2. Fetch all dependents of a specific employee (e.g., employee with ID 101)
SELECT * FROM Dependent WHERE EmployeeID = 101;

-- 3. Select employees with a salary greater than 60,000
SELECT * FROM Employee WHERE Salary > 60000;

-- 4. Display employees and their corresponding department names
SELECT Employee.Name AS EmployeeName, Department.Name AS DepartmentName 
FROM Employee
JOIN Department ON Employee.DepartmentID = Department.DepartmentID;

-- 5. Show all shipments with their corresponding department names
SELECT Shipment.ShipmentName, Shipment.ShipmentLocation, Department.Name AS DepartmentName
FROM Shipment
JOIN Department ON Shipment.DepartmentID = Department.DepartmentID;
