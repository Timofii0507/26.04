CREATE DATABASE [proect_sql_1]
GO
USE [proect_sql_1]
GO
-- Таблиці
CREATE TABLE Members(
    MemberId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female', 'Non-Binary')),
    BirthDate DATE,
    Email NVARCHAR(255) UNIQUE,
    PhoneNumber NVARCHAR(20),
    JoinDate DATE NOT NULL,
    Description NVARCHAR(MAX)
);

CREATE TABLE Subscriptions(
    SubscriptionId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    DurationMonths INT NOT NULL CHECK (DurationMonths > 0),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0)
);

CREATE TABLE MemberSubscriptions(
    MemberId INT,
    SubscriptionId INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    FOREIGN KEY (SubscriptionId) REFERENCES Subscriptions(SubscriptionId),
    PRIMARY KEY (MemberId, SubscriptionId)
);

CREATE TABLE Trainers(
    TrainerId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female', 'Non-Binary')),
    Specialization NVARCHAR(255) NOT NULL,
    HireDate DATE NOT NULL
);

CREATE TABLE MemberTrainers(
    MemberId INT,
    TrainerId INT,
    AssignmentDate DATE NOT NULL,
    FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    FOREIGN KEY (TrainerId) REFERENCES Trainers(TrainerId),
    PRIMARY KEY (MemberId, TrainerId)
);

CREATE TABLE Classes(
    ClassId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(MAX),
    DurationMinutes INT NOT NULL CHECK (DurationMinutes > 0)
);

CREATE TABLE MemberClasses(
    MemberId INT,
    ClassId INT,
    ClassDate DATE NOT NULL,
    FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    FOREIGN KEY (ClassId) REFERENCES Classes(ClassId),
    PRIMARY KEY (MemberId, ClassId, ClassDate)
);

CREATE TABLE Equipment(
    EquipmentId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(MAX),
    PurchaseDate DATE,
    MaintenanceDate DATE
);

CREATE TABLE MemberEquipment(
    MemberId INT,
    EquipmentId INT,
    UsageDate DATE NOT NULL,
    FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    FOREIGN KEY (EquipmentId) REFERENCES Equipment(EquipmentId),
    PRIMARY KEY (MemberId, EquipmentId, UsageDate)
);

CREATE TABLE Facilities(
    FacilityId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(MAX),
    OpeningHours NVARCHAR(50)
);

CREATE TABLE MemberFacilities(
    MemberId INT,
    FacilityId INT,
    VisitDate DATE NOT NULL,
    FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    FOREIGN KEY (FacilityId) REFERENCES Facilities(FacilityId),
    PRIMARY KEY (MemberId, FacilityId, VisitDate)
);

CREATE TABLE Products(
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(MAX),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0)
);

CREATE TABLE MemberProducts(
    MemberId INT,
    ProductId INT,
    PurchaseDate DATE NOT NULL,
    FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    PRIMARY KEY (MemberId, ProductId, PurchaseDate)
);

GO

-- Тригери
CREATE TRIGGER check_member_email
ON Members
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Email NOT LIKE '%@%') BEGIN
        RAISERROR('Invalid email format', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO

CREATE TRIGGER check_subscription_price
ON Subscriptions
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Price < 0) BEGIN
        RAISERROR('Subscription price cannot be negative', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO

CREATE TRIGGER check_trainer_gender
ON Trainers
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Gender NOT IN ('Male', 'Female', 'Non-Binary')) BEGIN
        RAISERROR('Invalid gender', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO

CREATE TRIGGER check_class_duration
ON Classes
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE DurationMinutes <= 0) BEGIN
        RAISERROR('Class duration must be positive', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO

CREATE TRIGGER check_equipment_name
ON Equipment
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE LEN(Name) > 100) BEGIN
        RAISERROR('Equipment name exceeds maximum length', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO

CREATE TRIGGER check_facility_hours
ON Facilities
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE LEN(OpeningHours) > 50) BEGIN
        RAISERROR('Facility opening hours exceeds maximum length', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO

CREATE TRIGGER check_product_price
ON Products
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Price < 0) BEGIN
        RAISERROR('Product price cannot be negative', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO