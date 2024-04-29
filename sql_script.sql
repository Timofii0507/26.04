USE [proect_sql_1]

-- Вставка даних до таблиці Members
INSERT INTO Members (FirstName, LastName, Gender, BirthDate, Email, PhoneNumber, JoinDate, Description)
VALUES 
('John', 'Doe', 'Male', '1990-01-01', 'john.doe@example.com', '+1234567890', '2024-01-01', 'Avid fitness enthusiast and marathon runner.'),
('Jane', 'Smith', 'Female', '1985-05-05', 'jane.smith@example.com', '+0987654321', '2024-02-01', 'Yoga instructor and personal trainer.');

-- Вставка даних до таблиці Subscriptions
INSERT INTO Subscriptions (Name, DurationMonths, Price)
VALUES 
('Basic', 1, 19.99),
('Premium', 6, 99.99);

-- Вставка даних до таблиці Trainers
INSERT INTO Trainers (FirstName, LastName, Gender, Specialization, HireDate)
VALUES 
('Mike', 'Johnson', 'Male', 'Weightlifting', '2023-01-01'),
('Anna', 'Taylor', 'Female', 'Pilates', '2023-03-01');

-- Вставка даних до таблиці Classes
INSERT INTO Classes (Name, Description, DurationMinutes)
VALUES 
('Spinning', 'High-intensity cycling class for endurance and strength.', 45),
('Zumba', 'Dance fitness class that keeps you in shape and feeling great.', 60);

-- Вставка даних до таблиці Equipment
INSERT INTO Equipment (Name, Description, PurchaseDate, MaintenanceDate)
VALUES 
('Treadmill', 'High-quality treadmill for cardio workouts.', '2023-01-15', '2024-01-15'),
('Dumbbells', 'Set of various weights for strength training.', '2023-02-20', '2024-02-20');

-- Вставка даних до таблиці Facilities
INSERT INTO Facilities (Name, Description, OpeningHours)
VALUES 
('Gym Floor', 'Fully equipped gym floor with a wide range of machines and free weights.', '06:00-22:00'),
('Swimming Pool', 'Olympic-sized pool for laps and aquatic classes.', '08:00-20:00');

-- Вставка даних до таблиці Products
INSERT INTO Products (Name, Description, Price)
VALUES 
('Protein Shake', 'Delicious and nutritious protein shake available in various flavors.', 5.99),
('Yoga Mat', 'Non-slip yoga mat for all your yoga sessions.', 24.99);