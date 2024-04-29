USE [proect_sql_1]

-- Видалення даних з таблиць пов'язаних з членами клубу
DELETE FROM MemberProducts;
DELETE FROM MemberFacilities;
DELETE FROM MemberEquipment;
DELETE FROM MemberClasses;
DELETE FROM MemberTrainers;
DELETE FROM MemberSubscriptions;
DELETE FROM Members;

-- Видалення даних з інших таблиць
DELETE FROM Products;
DELETE FROM Facilities;
DELETE FROM Equipment;
DELETE FROM Classes;
DELETE FROM Trainers;
DELETE FROM Subscriptions;