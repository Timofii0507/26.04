USE [proect_sql_1]

-- Вибірка всіх членів клубу
SELECT * FROM Members;

-- Вибірка всіх абонементів
SELECT * FROM Subscriptions;

-- Вибірка всіх тренерів
SELECT * FROM Trainers;

-- Вибірка всіх занять
SELECT * FROM Classes;

-- Вибірка всього обладнання
SELECT * FROM Equipment;

-- Вибірка всіх зручностей клубу
SELECT * FROM Facilities;

-- Вибірка всіх продуктів
SELECT * FROM Products;

-- Вибірка членів клубу разом з їхніми абонементами
SELECT m.*, s.Name AS SubscriptionName, s.Price AS SubscriptionPrice
FROM Members m
INNER JOIN MemberSubscriptions ms ON m.MemberId = ms.MemberId
INNER JOIN Subscriptions s ON ms.SubscriptionId = s.SubscriptionId;

-- Вибірка членів клубу разом з їхніми тренерами
SELECT m.*, t.FirstName + ' ' + t.LastName AS TrainerName, t.Specialization
FROM Members m
INNER JOIN MemberTrainers mt ON m.MemberId = mt.MemberId
INNER JOIN Trainers t ON mt.TrainerId = t.TrainerId;

-- Вибірка членів клубу разом з їхніми заняттями
SELECT m.*, c.Name AS ClassName, c.Description AS ClassDescription
FROM Members m
INNER JOIN MemberClasses mc ON m.MemberId = mc.MemberId
INNER JOIN Classes c ON mc.ClassId = c.ClassId;

-- Вибірка членів клубу, які використовують певне обладнання
SELECT m.*, e.Name AS EquipmentName, e.Description AS EquipmentDescription
FROM Members m
INNER JOIN MemberEquipment me ON m.MemberId = me.MemberId
INNER JOIN Equipment e ON me.EquipmentId = e.EquipmentId;

-- Вибірка членів клубу, які відвідують певні зручності
SELECT m.*, f.Name AS FacilityName, f.Description AS FacilityDescription
FROM Members m
INNER JOIN MemberFacilities mf ON m.MemberId = mf.MemberId
INNER JOIN Facilities f ON mf.FacilityId = f.FacilityId;

-- Вибірка членів клубу, які купили певні продукти
SELECT m.*, p.Name AS ProductName, p.Price AS ProductPrice
FROM Members m
INNER JOIN MemberProducts mp ON m.MemberId = mp.MemberId
INNER JOIN Products p ON mp.ProductId = p.ProductId;

-- Вибірка членів клубу за статтю
SELECT * FROM Members WHERE Gender = 'Female';

-- Вибірка членів клубу, які приєдналися після певної дати
SELECT * FROM Members WHERE JoinDate > '2023-01-01';