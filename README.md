# Shipping Company Database System

A comprehensive Relational Database Management System (RDBMS) designed and implemented for a Shipment Company. This project encompasses the entire database development lifecycle, including requirements collection, conceptual design, logical design, and physical implementation using SQL.

## Project Overview
The database is built to maintain accurate and efficient records of the company's core operations, tracking:
- Departments and Locations
- Employees and Supervisors
- Shipments
- Customers
- Dependents (for insurance tracking purposes)

---

## Database Architecture

### 1. Conceptual Design (E-R Diagram Entities)
The system models the following key entities and attributes:
- Department: Tracks Department Name, unique Number, Manager, and multiple Locations.
- Shipment: Tracks Shipment Name, unique Number, and Location.
- Employee: Tracks Name, SSN (Unique), Address, Salary, Sex, Birth Date, and Supervisor ID.
- Dependent: Tracks First Name, Sex, Birth Date, and Relationship to Employee.
- Customer: Tracks Customer Name, unique ID, Address, Phone, and Email.

### 2. Relationship Cardinalities
- Department 1:N Employee (Assigned To)
- Department 1:1 Employee (Managed By)
- Department 1:N Shipment (Controls/Ships)
- Employee M:N Shipment (Participates In)
- Employee 1:N Employee (Supervision)
- Employee 1:N Dependent (Responsible For)
- Customer 1:N Shipment (Receives)

---

## SQL Implementation

The physical schema includes complete DDL and DML statements to set up and query the environment.

### Schema Script Example
The repository contains scripts to create tables with structured constraints and sample insertions:

```sql
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    ManagerID INT,
    ManagerStartDate DATE,
    Location VARCHAR(100)
);
