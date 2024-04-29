USE [proect_sql_1]

-- Вставка даних до таблиці Members
INSERT INTO Members (FirstName, LastName, Gender, BirthDate, Email, PhoneNumber, JoinDate, Description)
VALUES 
('John', 'Doe', 'Male', '1990-01-01', 'john.doe@example.com', '+1234567890', '2024-01-01', 'Avid fitness enthusiast and marathon runner.'),
('Jane', 'Smith', 'Female', '1985-05-05', 'jane.smith@example.com', '+0987654321', '2024-02-01', 'Yoga instructor and personal trainer.'),
('Emily', 'Jones', 'Female', '1992-04-15', 'emily.jones@example.com', '+1123456789', '2024-03-01', 'Certified nutritionist and wellness coach.'),
('Michael', 'Brown', 'Male', '1988-02-20', 'michael.brown@example.com', '+1098765432', '2024-04-01', 'Professional bodybuilder and fitness model.');

-- Вставка даних до таблиці Subscriptions
INSERT INTO Subscriptions (Name, DurationMonths, Price)
VALUES 
('Basic', 1, 19.99),
('Premium', 6, 99.99),
('Annual', 12, 189.99),
('Student', 1, 14.99);

-- Вставка даних до таблиці Trainers
INSERT INTO Trainers (FirstName, LastName, Gender, Specialization, HireDate)
VALUES 
('Mike', 'Johnson', 'Male', 'Weightlifting', '2023-01-01'),
('Anna', 'Taylor', 'Female', 'Pilates', '2023-03-01'),
('David', 'Wilson', 'Male', 'CrossFit', '2023-05-01'),
('Laura', 'Moore', 'Female', 'Aerobics', '2023-07-01');

-- Вставка даних до таблиці Classes
INSERT INTO Classes (Name, Description, DurationMinutes)
VALUES 
('Spinning', 'High-intensity cycling class for endurance and strength.', 45),
('Zumba', 'Dance fitness class that keeps you in shape and feeling great.', 60),
('Yoga', 'Improve flexibility and reduce stress with this mind-body approach.', 75),
('HIIT', 'High-Intensity Interval Training for a fast-paced, intense workout.', 30);

-- Вставка даних до таблиці Equipment
INSERT INTO Equipment (Name, Description, PurchaseDate, MaintenanceDate)
VALUES 
('Treadmill', 'High-quality treadmill for cardio workouts.', '2023-01-15', '2024-01-15'),
('Dumbbells', 'Set of various weights for strength training.', '2023-02-20', '2024-02-20'),
('Elliptical', 'Low-impact cardio machine to simulate stair climbing.', '2023-04-10', '2024-04-10'),
('Stationary Bike', 'Indoor cycling bike for high-intensity cardio.', '2023-06-05', '2024-06-05');

-- Вставка даних до таблиці Facilities
INSERT INTO Facilities (Name, Description, OpeningHours)
VALUES 
('Gym Floor', 'Fully equipped gym floor with a wide range of machines and free weights.', '06:00-22:00'),
('Swimming Pool', 'Olympic-sized pool for laps and aquatic classes.', '08:00-20:00'),
('Sauna', 'Relax and detoxify in our state-of-the-art sauna.', '10:00-21:00'),
('Group Class Studio', 'Dedicated space for group fitness classes.', '07:00-19:00');

-- Вставка даних до таблиці Products
INSERT INTO Products (Name, Description, Price)
VALUES 
('Protein Shake', 'Delicious and nutritious protein shake available in various flavors.', 5.99),
('Yoga Mat', 'Non-slip yoga mat for all your yoga sessions.', 24.99),
('Water Bottle', 'Eco-friendly, reusable water bottle to stay hydrated.', 9.99),
('Gym Towel', 'Soft, absorbent towel for your workout needs.', 14.99);

-- Вставка даних до таблиці MemberSubscriptions
INSERT INTO MemberSubscriptions (MemberId, SubscriptionId, StartDate, EndDate)
VALUES 
(1, 1, '2024-01-01', '2024-02-01'),
(2, 2, '2024-02-01', '2024-08-01'),
(3, 3, '2024-03-01', '2025-03-01'),
(4, 4, '2024-04-01', '2024-05-01');

-- Вставка даних до таблиці MemberTrainers
INSERT INTO MemberTrainers (MemberId, TrainerId, AssignmentDate)
VALUES 
(1, 1, '2024-01-10'),
(2, 2, '2024-02-15'),
(3, 3, '2024-03-20'),
(4, 4, '2024-04-25');

-- Вставка даних до таблиці MemberClasses
INSERT INTO MemberClasses (MemberId, ClassId, ClassDate)
VALUES 
(1, 1, '2024-01-05'),
(2, 2, '2024-02-10'),
(3, 3, '2024-03-15'),
(4, 4, '2024-04-20');

-- Вставка даних до таблиці MemberEquipment
INSERT INTO MemberEquipment (MemberId, EquipmentId, UsageDate)
VALUES 
(1, 1, '2024-01-02'),
(2, 2, '2024-02-12'),
(3, 3, '2024-03-22'),
(4, 4, '2024-04-30');

-- Вставка даних до таблиці MemberFacilities
INSERT INTO MemberFacilities (MemberId, FacilityId, VisitDate)
VALUES 
(1, 1, '2024-01-07'),
(2, 2, '2024-02-14'),
(3, 3, '2024-03-21'),
(4, 4, '2024-04-28');

-- Вставка даних до таблиці MemberProducts
INSERT INTO MemberProducts (MemberId, ProductId, PurchaseDate)
VALUES 
(1, 1, '2024-01-03'),
(2, 2, '2024-02-13'),
(3, 3, '2024-03-23'),
(4, 4, '2024-04-29');