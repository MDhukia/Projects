
CREATE TABLE Company (
	Name VARCHAR(100) PRIMARY KEY,
    Contact VARCHAR(100),
    Location VARCHAR(100)
);
insert into Company values ('Reliable Electronics', 555-555-5555, 'Boston City');

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Skill VARCHAR(50),
    AssignedLocationID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (AssignedLocationID) REFERENCES Building(LocationID)
);

-- Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Building/Plant Table
CREATE TABLE Building (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address VARCHAR(255)
);

-- Equipment Table
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(100),
    EquipmentType VARCHAR(50),
    Value DECIMAL(10, 2),
    WarehouseID INT,
    Cond VARCHAR(50),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

-- EquipmentCheckout Table
CREATE TABLE EquipmentCheckout (
    CheckoutID INT PRIMARY KEY,
    EmployeeID INT,
    EquipmentID INT,
    CheckoutDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    ConditionOnReturn VARCHAR(50),
    IsReturned BOOLEAN,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- Warehouse Table
CREATE TABLE Warehouse (
    WarehouseID INT PRIMARY KEY,
    WarehouseName VARCHAR(100),
    LocationID INT,
    Capacity INT,
    FOREIGN KEY (LocationID) REFERENCES Building(LocationID)
);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    WarehouseID INT,
    EquipmentID INT,
    Quantity INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

CREATE TABLE Tools (
    ToolID INT PRIMARY KEY AUTO_INCREMENT,
    ToolName VARCHAR(100) NOT NULL,
    ToolType VARCHAR(50) NOT NULL,
    Value DECIMAL(10, 2) NOT NULL,
    Cond ENUM('New', 'Used', 'Damaged') NOT NULL,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY AUTO_INCREMENT,
    MaterialName VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    UnitOfMeasure VARCHAR(50) NOT NULL,
    QuantityInStock INT NOT NULL,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

CREATE TABLE MaintenanceRequest (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    RequestDate DATE NOT NULL,
    RequestedBy INT,
    LocationID INT,
    Description TEXT NOT NULL,
    Priority ENUM('Low', 'Medium', 'High') NOT NULL,
    Status ENUM('Open', 'In Progress', 'Completed') NOT NULL,
    FOREIGN KEY (RequestedBy) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (LocationID) REFERENCES Building(LocationID)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DepartmentID, Skill, AssignedLocationID) VALUES
(1, 'John', 'Smith', 1, 'Carpenter', 105),
(2, 'Jane', 'Doe', 1, 'Electrician', 102),
(3, 'Mike', 'Johnson', 1, 'Plumber', 103),
(4, 'Emily', 'Davis', 1, 'Painter', 104),
(5, 'Robert', 'Brown', 1, 'Welder', 105),
(6, 'Laura', 'Wilson', 1, 'Electrician', 101),
(7, 'Kevin', 'Moore', 1, 'Plumber', 102),
(8, 'Sarah', 'Taylor', 1, 'Carpenter', 103),
(9, 'David', 'Anderson', 1, 'HVAC Technician', 104),
(10, 'Lisa', 'White', 1, 'Maintenance Manager', 105);

INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'Maintenance'),
(2, 'Engineering'),
(3, 'Human Resources'),
(4, 'Sales'),
(5, 'Purchasing'),
(6, 'Quality Control'),
(7, 'IT Support'),
(8, 'Research and Development'),
(9, 'Production'),
(10, 'Customer Service');


INSERT INTO Building (LocationID, LocationName, Address) VALUES
(101, 'Main Plant', '123 Main St, Boston, MA 02110'),
(102, 'North Plant', '456 North Ave, Boston, MA 02111'),
(103, 'South Plant', '789 South Blvd, Boston, MA 02112'),
(104, 'Central Office', '101 Central Park, Boston, MA 02113'),
(105, 'Warehouse', '202 Warehouse Rd, Boston, MA 02114'),
(106, 'Engineering Lab', '303 Innovation Dr, Boston, MA 02115'),
(107, 'Quality Control', '404 Testing Ln, Boston, MA 02116'),
(108, 'R&D Facility', '505 Discovery Dr, Boston, MA 02117'),
(109, 'Customer Service Center', '606 Service Blvd, Boston, MA 02118'),
(110, 'IT Support Office', '707 Tech Way, Boston, MA 02119');

INSERT INTO Equipment (EquipmentID, EquipmentName, EquipmentType, Value, WarehouseID, Cond) VALUES
(1, 'Forklift', 'Heavy Machinery', 50000.00, 1, 'New'),
(2, 'Conveyor Belt', 'Production Equipment', 15000.00, 1, 'Used'),
(3, 'Laser Cutter', 'Fabrication Tool', 30000.00, 2, 'New'),
(4, 'Hydraulic Press', 'Pressing Tool', 25000.00, 2, 'Good'),
(5, 'Air Compressor', 'Tool', 5000.00, 1, 'New'),
(6, 'Drill Press', 'Drilling Tool', 8000.00, 1, 'Used'),
(7, 'Welding Machine', 'Welding Tool', 12000.00, 2, 'New'),
(8, 'CNC Machine', 'Precision Tool', 45000.00, 2, 'Refurbished'),
(9, 'Power Generator', 'Generator', 20000.00, 1, 'Good'),
(10, 'Bench Grinder', 'Grinding Tool', 3000.00, 1, 'Used');

INSERT INTO Warehouse (WarehouseID, WarehouseName, LocationID, Capacity) VALUES
(1, 'Main Warehouse', 105, 5000),  -- Assuming the Main Warehouse is located at Building 105
(2, 'Central Warehouse', 104, 2000); -- Assuming the Central Warehouse is located at Building 104

INSERT INTO Inventory (InventoryID, WarehouseID, EquipmentID, Quantity) VALUES
(1, 1, 1, 10),   -- Main Warehouse has 10 Forklifts
(2, 1, 2, 15),   -- Main Warehouse has 15 Conveyor Belts
(3, 1, 3, 5),    -- Main Warehouse has 5 Laser Cutters
(4, 1, 4, 8),    -- Main Warehouse has 8 Hydraulic Presses
(5, 1, 5, 20),   -- Main Warehouse has 20 Air Compressors
(6, 2, 6, 12),   -- Central Warehouse has 12 Drill Presses
(7, 2, 7, 7),    -- Central Warehouse has 7 Welding Machines
(8, 2, 8, 4),    -- Central Warehouse has 4 CNC Machines
(9, 2, 9, 10),   -- Central Warehouse has 10 Power Generators
(10, 2, 10, 6);  -- Central Warehouse has 6 Bench Grinders

INSERT INTO Tools (ToolID, ToolName, ToolType, Value, Cond, WarehouseID) VALUES
(1, 'Hammer', 'Hand Tool', 25.00, 'New', 1),      -- Main Warehouse
(2, 'Screwdriver Set', 'Hand Tool', 30.00, 'New', 1), -- Main Warehouse
(3, 'Tape Measure', 'Measuring Tool', 15.00, 'Used', 1), -- Main Warehouse
(4, 'Wrench Set', 'Hand Tool', 40.00, 'Used', 1),    -- Changed 'Good' to 'Used'
(5, 'Pliers', 'Hand Tool', 20.00, 'Damaged', 1),     -- Main Warehouse
(6, 'Drill', 'Power Tool', 120.00, 'New', 2),        -- Central Warehouse
(7, 'Circular Saw', 'Power Tool', 150.00, 'Used', 2), -- Central Warehouse
(8, 'Jigsaw', 'Power Tool', 100.00, 'Used', 2),      -- Changed 'Good' to 'Used'
(9, 'Router', 'Power Tool', 200.00, 'New', 2),       -- Central Warehouse
(10, 'Level', 'Measuring Tool', 25.00, 'Used', 2);    -- Changed 'Good' to 'Used'

INSERT INTO Materials (MaterialID, MaterialName, UnitPrice, UnitOfMeasure, QuantityInStock, WarehouseID) VALUES
(1, 'Screws', 0.10, 'Piece', 1000, 1),         -- Main Warehouse
(2, 'Nails', 0.05, 'Piece', 1500, 1),          -- Main Warehouse
(3, 'Plywood Sheets', 25.00, 'Sheet', 200, 1), -- Main Warehouse
(4, 'Drywall', 30.00, 'Sheet', 150, 1),        -- Main Warehouse
(5, 'Concrete', 100.00, 'Cubic Meter', 50, 1), -- Main Warehouse
(6, 'Paint', 15.00, 'Gallon', 300, 2),         -- Central Warehouse
(7, 'Brushes', 5.00, 'Pack', 100, 2),          -- Central Warehouse
(8, 'Caulk', 3.00, 'Tube', 200, 2),            -- Central Warehouse
(9, 'Insulation', 40.00, 'Roll', 80, 2),       -- Central Warehouse
(10, 'Sandpaper', 2.00, 'Sheet', 500, 2);      -- Central Warehouse

INSERT INTO MaintenanceRequest (RequestID, RequestDate, RequestedBy, LocationID, Description, Priority, Status) VALUES
(1, '2024-08-01', 1, 101, 'Fix broken conveyor belt in the main plant.', 'High', 'In Progress'),
(2, '2024-08-02', 2, 102, 'Replace damaged lights in the North Plant.', 'Medium', 'Open'),
(3, '2024-08-03', 3, 103, 'Repair leaking pipe in the South Plant.', 'High', 'Completed'),
(4, '2024-08-04', 4, 104, 'Paint walls in the Central Office.', 'Low', 'Open'),
(5, '2024-08-05', 5, 105, 'Inspect and service air compressors in the warehouse.', 'Medium', 'In Progress'),
(6, '2024-08-06', 6, 106, 'Calibrate testing equipment in the Engineering Lab.', 'High', 'Completed'),
(7, '2024-08-07', 7, 107, 'Replace damaged shelves in the Quality Control Storage.', 'Medium', 'Open'),
(8, '2024-08-08', 8, 108, 'Install new insulation in the R&D Facility.', 'Low', 'In Progress'),
(9, '2024-08-09', 9, 109, 'Repair broken HVAC system in the Customer Service Center.', 'High', 'Completed'),
(10, '2024-08-10', 10, 110, 'Update IT infrastructure in the IT Support Office.', 'Medium', 'Open');

INSERT INTO EquipmentCheckout (CheckoutID, EmployeeID, EquipmentID, CheckoutDate, DueDate, ReturnDate, ConditionOnReturn, IsReturned) VALUES
(1, 1, 1, '2024-08-01', '2024-08-15', '2024-08-10', 'Good', TRUE),
(2, 2, 2, '2024-08-02', '2024-08-16', NULL, NULL, FALSE),
(3, 3, 3, '2024-08-03', '2024-08-17', '2024-08-14', 'New', TRUE),
(4, 4, 4, '2024-08-04', '2024-08-18', '2024-08-16', 'Good', TRUE),
(5, 5, 5, '2024-08-05', '2024-08-19', NULL, NULL, FALSE),
(6, 6, 6, '2024-08-06', '2024-08-20', '2024-08-18', 'Used', TRUE),
(7, 7, 7, '2024-08-07', '2024-08-21', '2024-08-19', 'New', TRUE),
(8, 8, 8, '2024-08-08', '2024-08-22', NULL, NULL, FALSE),
(9, 9, 9, '2024-08-09', '2024-08-23', '2024-08-20', 'Good', TRUE),
(10, 10, 10, '2024-08-10', '2024-08-24', '2024-08-21', 'Used', TRUE);


CREATE TABLE Company (
	Name VARCHAR(100) PRIMARY KEY,
    Contact VARCHAR(100),
    Location VARCHAR(100)
);
insert into Company values ('Reliable Electronics', 555-555-5555, 'Boston City');

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Skill VARCHAR(50),
    AssignedLocationID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (AssignedLocationID) REFERENCES Building(LocationID)
);

-- Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Building/Plant Table
CREATE TABLE Building (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address VARCHAR(255)
);

-- Equipment Table
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(100),
    EquipmentType VARCHAR(50),
    Value DECIMAL(10, 2),
    WarehouseID INT,
    Cond VARCHAR(50),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

-- EquipmentCheckout Table
CREATE TABLE EquipmentCheckout (
    CheckoutID INT PRIMARY KEY,
    EmployeeID INT,
    EquipmentID INT,
    CheckoutDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    ConditionOnReturn VARCHAR(50),
    IsReturned BOOLEAN,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- Warehouse Table
CREATE TABLE Warehouse (
    WarehouseID INT PRIMARY KEY,
    WarehouseName VARCHAR(100),
    LocationID INT,
    Capacity INT,
    FOREIGN KEY (LocationID) REFERENCES Building(LocationID)
);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    WarehouseID INT,
    EquipmentID INT,
    Quantity INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

CREATE TABLE Tools (
    ToolID INT PRIMARY KEY AUTO_INCREMENT,
    ToolName VARCHAR(100) NOT NULL,
    ToolType VARCHAR(50) NOT NULL,
    Value DECIMAL(10, 2) NOT NULL,
    Cond ENUM('New', 'Used', 'Damaged') NOT NULL,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY AUTO_INCREMENT,
    MaterialName VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    UnitOfMeasure VARCHAR(50) NOT NULL,
    QuantityInStock INT NOT NULL,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

CREATE TABLE MaintenanceRequest (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    RequestDate DATE NOT NULL,
    RequestedBy INT,
    LocationID INT,
    Description TEXT NOT NULL,
    Priority ENUM('Low', 'Medium', 'High') NOT NULL,
    Status ENUM('Open', 'In Progress', 'Completed') NOT NULL,
    FOREIGN KEY (RequestedBy) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (LocationID) REFERENCES Building(LocationID)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DepartmentID, Skill, AssignedLocationID) VALUES
(1, 'John', 'Smith', 1, 'Carpenter', 105),
(2, 'Jane', 'Doe', 1, 'Electrician', 102),
(3, 'Mike', 'Johnson', 1, 'Plumber', 103),
(4, 'Emily', 'Davis', 1, 'Painter', 104),
(5, 'Robert', 'Brown', 1, 'Welder', 105),
(6, 'Laura', 'Wilson', 1, 'Electrician', 101),
(7, 'Kevin', 'Moore', 1, 'Plumber', 102),
(8, 'Sarah', 'Taylor', 1, 'Carpenter', 103),
(9, 'David', 'Anderson', 1, 'HVAC Technician', 104),
(10, 'Lisa', 'White', 1, 'Maintenance Manager', 105);

INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'Maintenance'),
(2, 'Engineering'),
(3, 'Human Resources'),
(4, 'Sales'),
(5, 'Purchasing'),
(6, 'Quality Control'),
(7, 'IT Support'),
(8, 'Research and Development'),
(9, 'Production'),
(10, 'Customer Service');


INSERT INTO Building (LocationID, LocationName, Address) VALUES
(101, 'Main Plant', '123 Main St, Boston, MA 02110'),
(102, 'North Plant', '456 North Ave, Boston, MA 02111'),
(103, 'South Plant', '789 South Blvd, Boston, MA 02112'),
(104, 'Central Office', '101 Central Park, Boston, MA 02113'),
(105, 'Warehouse', '202 Warehouse Rd, Boston, MA 02114'),
(106, 'Engineering Lab', '303 Innovation Dr, Boston, MA 02115'),
(107, 'Quality Control', '404 Testing Ln, Boston, MA 02116'),
(108, 'R&D Facility', '505 Discovery Dr, Boston, MA 02117'),
(109, 'Customer Service Center', '606 Service Blvd, Boston, MA 02118'),
(110, 'IT Support Office', '707 Tech Way, Boston, MA 02119');

INSERT INTO Equipment (EquipmentID, EquipmentName, EquipmentType, Value, WarehouseID, Cond) VALUES
(1, 'Forklift', 'Heavy Machinery', 50000.00, 1, 'New'),
(2, 'Conveyor Belt', 'Production Equipment', 15000.00, 1, 'Used'),
(3, 'Laser Cutter', 'Fabrication Tool', 30000.00, 2, 'New'),
(4, 'Hydraulic Press', 'Pressing Tool', 25000.00, 2, 'Good'),
(5, 'Air Compressor', 'Tool', 5000.00, 1, 'New'),
(6, 'Drill Press', 'Drilling Tool', 8000.00, 1, 'Used'),
(7, 'Welding Machine', 'Welding Tool', 12000.00, 2, 'New'),
(8, 'CNC Machine', 'Precision Tool', 45000.00, 2, 'Refurbished'),
(9, 'Power Generator', 'Generator', 20000.00, 1, 'Good'),
(10, 'Bench Grinder', 'Grinding Tool', 3000.00, 1, 'Used');

INSERT INTO Warehouse (WarehouseID, WarehouseName, LocationID, Capacity) VALUES
(1, 'Main Warehouse', 105, 5000),  -- Assuming the Main Warehouse is located at Building 105
(2, 'Central Warehouse', 104, 2000); -- Assuming the Central Warehouse is located at Building 104

INSERT INTO Inventory (InventoryID, WarehouseID, EquipmentID, Quantity) VALUES
(1, 1, 1, 10),   -- Main Warehouse has 10 Forklifts
(2, 1, 2, 15),   -- Main Warehouse has 15 Conveyor Belts
(3, 1, 3, 5),    -- Main Warehouse has 5 Laser Cutters
(4, 1, 4, 8),    -- Main Warehouse has 8 Hydraulic Presses
(5, 1, 5, 20),   -- Main Warehouse has 20 Air Compressors
(6, 2, 6, 12),   -- Central Warehouse has 12 Drill Presses
(7, 2, 7, 7),    -- Central Warehouse has 7 Welding Machines
(8, 2, 8, 4),    -- Central Warehouse has 4 CNC Machines
(9, 2, 9, 10),   -- Central Warehouse has 10 Power Generators
(10, 2, 10, 6);  -- Central Warehouse has 6 Bench Grinders

INSERT INTO Tools (ToolID, ToolName, ToolType, Value, Cond, WarehouseID) VALUES
(1, 'Hammer', 'Hand Tool', 25.00, 'New', 1),      -- Main Warehouse
(2, 'Screwdriver Set', 'Hand Tool', 30.00, 'New', 1), -- Main Warehouse
(3, 'Tape Measure', 'Measuring Tool', 15.00, 'Used', 1), -- Main Warehouse
(4, 'Wrench Set', 'Hand Tool', 40.00, 'Used', 1),    -- Changed 'Good' to 'Used'
(5, 'Pliers', 'Hand Tool', 20.00, 'Damaged', 1),     -- Main Warehouse
(6, 'Drill', 'Power Tool', 120.00, 'New', 2),        -- Central Warehouse
(7, 'Circular Saw', 'Power Tool', 150.00, 'Used', 2), -- Central Warehouse
(8, 'Jigsaw', 'Power Tool', 100.00, 'Used', 2),      -- Changed 'Good' to 'Used'
(9, 'Router', 'Power Tool', 200.00, 'New', 2),       -- Central Warehouse
(10, 'Level', 'Measuring Tool', 25.00, 'Used', 2);    -- Changed 'Good' to 'Used'

INSERT INTO Materials (MaterialID, MaterialName, UnitPrice, UnitOfMeasure, QuantityInStock, WarehouseID) VALUES
(1, 'Screws', 0.10, 'Piece', 1000, 1),         -- Main Warehouse
(2, 'Nails', 0.05, 'Piece', 1500, 1),          -- Main Warehouse
(3, 'Plywood Sheets', 25.00, 'Sheet', 200, 1), -- Main Warehouse
(4, 'Drywall', 30.00, 'Sheet', 150, 1),        -- Main Warehouse
(5, 'Concrete', 100.00, 'Cubic Meter', 50, 1), -- Main Warehouse
(6, 'Paint', 15.00, 'Gallon', 300, 2),         -- Central Warehouse
(7, 'Brushes', 5.00, 'Pack', 100, 2),          -- Central Warehouse
(8, 'Caulk', 3.00, 'Tube', 200, 2),            -- Central Warehouse
(9, 'Insulation', 40.00, 'Roll', 80, 2),       -- Central Warehouse
(10, 'Sandpaper', 2.00, 'Sheet', 500, 2);      -- Central Warehouse

INSERT INTO MaintenanceRequest (RequestID, RequestDate, RequestedBy, LocationID, Description, Priority, Status) VALUES
(1, '2024-08-01', 1, 101, 'Fix broken conveyor belt in the main plant.', 'High', 'In Progress'),
(2, '2024-08-02', 2, 102, 'Replace damaged lights in the North Plant.', 'Medium', 'Open'),
(3, '2024-08-03', 3, 103, 'Repair leaking pipe in the South Plant.', 'High', 'Completed'),
(4, '2024-08-04', 4, 104, 'Paint walls in the Central Office.', 'Low', 'Open'),
(5, '2024-08-05', 5, 105, 'Inspect and service air compressors in the warehouse.', 'Medium', 'In Progress'),
(6, '2024-08-06', 6, 106, 'Calibrate testing equipment in the Engineering Lab.', 'High', 'Completed'),
(7, '2024-08-07', 7, 107, 'Replace damaged shelves in the Quality Control Storage.', 'Medium', 'Open'),
(8, '2024-08-08', 8, 108, 'Install new insulation in the R&D Facility.', 'Low', 'In Progress'),
(9, '2024-08-09', 9, 109, 'Repair broken HVAC system in the Customer Service Center.', 'High', 'Completed'),
(10, '2024-08-10', 10, 110, 'Update IT infrastructure in the IT Support Office.', 'Medium', 'Open');

INSERT INTO EquipmentCheckout (CheckoutID, EmployeeID, EquipmentID, CheckoutDate, DueDate, ReturnDate, ConditionOnReturn, IsReturned) VALUES
(1, 1, 1, '2024-08-01', '2024-08-15', '2024-08-10', 'Good', TRUE),
(2, 2, 2, '2024-08-02', '2024-08-16', NULL, NULL, FALSE),
(3, 3, 3, '2024-08-03', '2024-08-17', '2024-08-14', 'New', TRUE),
(4, 4, 4, '2024-08-04', '2024-08-18', '2024-08-16', 'Good', TRUE),
(5, 5, 5, '2024-08-05', '2024-08-19', NULL, NULL, FALSE),
(6, 6, 6, '2024-08-06', '2024-08-20', '2024-08-18', 'Used', TRUE),
(7, 7, 7, '2024-08-07', '2024-08-21', '2024-08-19', 'New', TRUE),
(8, 8, 8, '2024-08-08', '2024-08-22', NULL, NULL, FALSE),
(9, 9, 9, '2024-08-09', '2024-08-23', '2024-08-20', 'Good', TRUE),
(10, 10, 10, '2024-08-10', '2024-08-24', '2024-08-21', 'Used', TRUE);


#Queries

-- Query 1: List equipment with a specific condition (e.g., 'New')

 SELECT * FROM Equipment WHERE Cond = 'New';

-- Query 2: Count the number of maintenance requests by location

SELECT LocationID, COUNT(*) AS NumberOfRequests FROM MaintenanceRequest GROUP BY LocationID;

-- Query 3: List all materials and their prices 

SELECT MaterialName, UnitPrice FROM Materials;

-- Query 4: Get tool details by ToolID (e.g., ToolID 1) 

SELECT * FROM Tools WHERE ToolID = 1;

-- Query 5: Count the number of different equipment types in inventory 

SELECT EquipmentID, COUNT(*) ASQuantityInInventory FROM Inventory GROUP BY EquipmentID;

-- Query 6: List inventory items with quantity in stock greater than a certain number (e.g., 10) 

SELECT * FROM Inventory WHERE Quantity > 10;

-- Query 7: Find a warehouse by name (e.g., 'Main Warehouse') 
SELECT * FROM Warehouse WHERE WarehouseName = 'Main Warehouse';

-- Query 8: Get checkouts that are not yet returned
 SELECT * FROM EquipmentCheckout WHERE IsReturned =FALSE;
 
 -- Query 9: Find a building by location name (e.g., 'Main Plant')
 SELECT * FROM Building WHERE LocationName ='Main Plant';

-- Query 10: List inventory items with quantity in stock greater than a certain number (e.g., 10) 
SELECT * FROM Inventory WHERE Quantity > 10;

# Query 11: List all employees who have checked out equipment but have not returned it yet, along with the equipment details.

SELECT e.FirstName, e.LastName, ec.CheckoutDate, ec.DueDate, eq.EquipmentName, eq.EquipmentType
FROM EquipmentCheckout ec
JOIN Employee e ON ec.EmployeeID = e.EmployeeID
JOIN Equipment eq ON ec.EquipmentID = eq.EquipmentID
WHERE ec.IsReturned = FALSE;

# Query 12: Find all maintenance requests that have a 'medium' priority and is 'In Progress'  that involve equipment located in a specific building (e.g., LocationID 105).

SELECT mr.RequestID, mr.RequestDate, mr.Description, mr.Priority, b.LocationName
FROM MaintenanceRequest mr
JOIN Building b ON mr.LocationID = b.LocationID
WHERE mr.Priority = 'medium' AND mr.Status IN ('In Progress') AND b.LocationID = 105;

#Query 13: Show the total value of all equipment by equipment type, including the number of items for each type, and sort by the total value in descending order.

SELECT eq.EquipmentType, COUNT(*) AS NumberOfItems, SUM(eq.Value) AS TotalValue
FROM Equipment eq
GROUP BY eq.EquipmentType
ORDER BY TotalValue DESC;

#  Query 14: List all tools in the 'Central Warehouse' that are 'used' and include their tool name, type, and value.
SELECT t.ToolName, t.ToolType, t.Value
FROM Tools t
JOIN Warehouse w ON t.WarehouseID = w.WarehouseID
WHERE w.WarehouseName = 'Central Warehouse' AND t.Cond = 'used';

# Query 15: Display materials that have a unit price greater than $20 and are available in both warehouses, including their quantity in stock.
SELECT m.MaterialName, m.UnitPrice, m.QuantityInStock, w.WarehouseName
FROM Materials m
JOIN Warehouse w ON m.WarehouseID = w.WarehouseID
WHERE m.UnitPrice > 20;








