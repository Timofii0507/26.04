USE [proect_sql_1]

-- ������ ��� ����� �����
SELECT * FROM Members;

-- ������ ��� ����������
SELECT * FROM Subscriptions;

-- ������ ��� �������
SELECT * FROM Trainers;

-- ������ ��� ������
SELECT * FROM Classes;

-- ������ ������ ����������
SELECT * FROM Equipment;

-- ������ ��� ���������� �����
SELECT * FROM Facilities;

-- ������ ��� ��������
SELECT * FROM Products;

-- ������ ����� ����� ����� � ����� ������������
SELECT m.*, s.Name AS SubscriptionName, s.Price AS SubscriptionPrice
FROM Members m
INNER JOIN MemberSubscriptions ms ON m.MemberId = ms.MemberId
INNER JOIN Subscriptions s ON ms.SubscriptionId = s.SubscriptionId;

-- ������ ����� ����� ����� � ����� ���������
SELECT m.*, t.FirstName + ' ' + t.LastName AS TrainerName, t.Specialization
FROM Members m
INNER JOIN MemberTrainers mt ON m.MemberId = mt.MemberId
INNER JOIN Trainers t ON mt.TrainerId = t.TrainerId;

-- ������ ����� ����� ����� � ����� ���������
SELECT m.*, c.Name AS ClassName, c.Description AS ClassDescription
FROM Members m
INNER JOIN MemberClasses mc ON m.MemberId = mc.MemberId
INNER JOIN Classes c ON mc.ClassId = c.ClassId;

-- ������ ����� �����, �� �������������� ����� ����������
SELECT m.*, e.Name AS EquipmentName, e.Description AS EquipmentDescription
FROM Members m
INNER JOIN MemberEquipment me ON m.MemberId = me.MemberId
INNER JOIN Equipment e ON me.EquipmentId = e.EquipmentId;

-- ������ ����� �����, �� �������� ���� ��������
SELECT m.*, f.Name AS FacilityName, f.Description AS FacilityDescription
FROM Members m
INNER JOIN MemberFacilities mf ON m.MemberId = mf.MemberId
INNER JOIN Facilities f ON mf.FacilityId = f.FacilityId;

-- ������ ����� �����, �� ������ ���� ��������
SELECT m.*, p.Name AS ProductName, p.Price AS ProductPrice
FROM Members m
INNER JOIN MemberProducts mp ON m.MemberId = mp.MemberId
INNER JOIN Products p ON mp.ProductId = p.ProductId;

-- ������ ����� ����� �� ������
SELECT * FROM Members WHERE Gender = 'Female';

-- ������ ����� �����, �� ���������� ���� ����� ����
SELECT * FROM Members WHERE JoinDate > '2023-01-01';