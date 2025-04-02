Create Database db_Effortless_Car_Rental

Use db_Effortless_Car_Rental

-- Create the RENTAL_LOCATION table
CREATE TABLE RENTAL_LOCATION (
    Location_ID INT PRIMARY KEY,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    Postal_Code VARCHAR(10),
    State VARCHAR(50),
    Email VARCHAR(100)
);

-- Create the CAR_USER table
CREATE TABLE CAR_USER (
    License_No VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    DOB DATE,
    Phone_No VARCHAR(15),
    Email VARCHAR(100)
);

-- Create the CAR table
CREATE TABLE CAR (
    VIN VARCHAR(20) PRIMARY KEY,
    Status VARCHAR(50),
    Price_per_Day DECIMAL(10, 2),
    Seating_Capacity INT,  -- Moved here
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES RENTAL_LOCATION(Location_ID)
);

-- Create the VEHICLE_DETAILS table
CREATE TABLE VEHICLE_DETAILS (
    VIN VARCHAR(20) PRIMARY KEY,
    Car_Type VARCHAR(50),
    Year INT,
    Color VARCHAR(30),
    Model VARCHAR(50),
    Insurance DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES CAR(VIN)
);

-- Create the RESERVATION table
CREATE TABLE RESERVATION (
    Reservation_ID INT PRIMARY KEY,
    License_No VARCHAR(20),
    VIN VARCHAR(20),
    Start_Date DATE,
    End_Date DATE,
    Meter_Start INT,
    Meter_End INT,
    Rental_Amount DECIMAL(10, 2),
    Insurance_Amount DECIMAL(10, 2),
    Penalty_Amount DECIMAL(10, 2),
    Total_Amount DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (License_No) REFERENCES CAR_USER(License_No),
    FOREIGN KEY (VIN) REFERENCES CAR(VIN)
);

-- 6. PAYMENT Table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Reservation_ID INT,
    Due_Amount DECIMAL(10,2),
    Amount_Paid DECIMAL(10,2),
    Paid_By_Cash VARCHAR(3),   
    Paid_By_UPI VARCHAR(3),    
    Billing_Address VARCHAR(255),
    UPI_Reference VARCHAR(50),
    FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID)
);

-- Insert values into RENTAL_LOCATION table
INSERT INTO RENTAL_LOCATION (Location_ID, Phone, Address, Postal_Code, State, Email) VALUES
(1, '123-456-7890', '123 Main St', '12345', 'New York', 'location1@example.com'),
(2, '987-654-3210', '456 Elm St', '54321', 'California', 'location2@example.com'),
(3, '555-123-4567', '789 Oak St', '67890', 'Texas', 'location3@example.com'),
(4, '555-987-6543', '321 Maple St', '98765', 'Florida', 'location4@example.com'),
(5, '111-222-3333', '654 Pine St', '13579', 'Nevada', 'location5@example.com'),
(6, '444-555-6666', '876 Cedar St', '24680', 'Arizona', 'location6@example.com'),
(7, '777-888-9999', '543 Birch St', '11223', 'Illinois', 'location7@example.com'),
(8, '888-999-0000', '678 Spruce St', '33445', 'Georgia', 'location8@example.com'),
(9, '999-000-1111', '987 Willow St', '55667', 'Ohio', 'location9@example.com'),
(10, '000-111-2222', '432 Poplar St', '77889', 'Virginia', 'location10@example.com');

-- Insert values into CAR_USER table
INSERT INTO CAR_USER (License_No, Name, Address, DOB, Phone_No, Email) VALUES
('LIC001', 'John Doe', '123 Main St', '1980-05-15', '123-456-7890', 'john.doe@example.com'),
('LIC002', 'Jane Smith', '456 Elm St', '1992-08-22', '987-654-3210', 'jane.smith@example.com'),
('LIC003', 'Alice Johnson', '789 Oak St', '1985-11-30', '555-123-4567', 'alice.johnson@example.com'),
('LIC004', 'Bob Brown', '321 Maple St', '1975-04-10', '555-987-6543', 'bob.brown@example.com'),
('LIC005', 'Charlie Davis', '654 Pine St', '1990-07-25', '111-222-3333', 'charlie.davis@example.com'),
('LIC006', 'David Wilson', '876 Cedar St', '1988-02-17', '444-555-6666', 'david.wilson@example.com'),
('LIC007', 'Emma White', '543 Birch St', '1995-09-19', '777-888-9999', 'emma.white@example.com'),
('LIC008', 'Fiona Black', '678 Spruce St', '1983-03-07', '888-999-0000', 'fiona.black@example.com'),
('LIC009', 'George Green', '987 Willow St', '1978-10-12', '999-000-1111', 'george.green@example.com'),
('LIC010', 'Hannah Gray', '432 Poplar St', '1993-06-28', '000-111-2222', 'hannah.gray@example.com');

-- Insert values into CAR table
INSERT INTO CAR (VIN, Status, Price_per_Day, Seating_Capacity, Location_ID) VALUES
('VIN001', 'Available', 50.00, 5, 1),
('VIN002', 'Rented', 60.00, 4, 2),
('VIN003', 'Available', 70.00, 7, 3),
('VIN004', 'Maintenance', 55.00, 5, 4),
('VIN005', 'Rented', 65.00, 6, 5),
('VIN006', 'Available', 40.00, 4, 6),
('VIN007', 'Available', 80.00, 8, 7),
('VIN008', 'Rented', 75.00, 5, 8),
('VIN009', 'Maintenance', 90.00, 9, 9),
('VIN010', 'Available', 100.00, 5, 10);

-- Insert values into VEHICLE_DETAILS table
INSERT INTO VEHICLE_DETAILS (VIN, Car_Type, Year, Color, Model, Insurance) VALUES
('VIN001', 'SUV', 2018, 'Red', 'Toyota Highlander', 500.00),
('VIN002', 'Sedan', 2020, 'Blue', 'Honda Accord', 400.00),
('VIN003', 'Van', 2017, 'Black', 'Chrysler Pacifica', 600.00),
('VIN004', 'SUV', 2019, 'White', 'Ford Explorer', 550.00),
('VIN005', 'Sedan', 2021, 'Gray', 'Tesla Model 3', 700.00),
('VIN006', 'Hatchback', 2016, 'Green', 'Honda Fit', 300.00),
('VIN007', 'SUV', 2020, 'Silver', 'Jeep Grand Cherokee', 800.00),
('VIN008', 'Pickup', 2019, 'Black', 'Ford F-150', 750.00),
('VIN009', 'Sedan', 2018, 'Red', 'BMW 3 Series', 600.00),
('VIN010', 'SUV', 2021, 'Blue', 'Audi Q5', 1000.00);

-- Insert values into RESERVATION table
INSERT INTO RESERVATION (Reservation_ID, License_No, VIN, Start_Date, End_Date, Meter_Start, Meter_End, Rental_Amount, Insurance_Amount, Penalty_Amount, Total_Amount, Status) VALUES
(1, 'LIC001', 'VIN001', '2024-01-01', '2024-01-05', 10000, 10500, 200.00, 50.00, 0.00, 250.00, 'Completed'),
(2, 'LIC002', 'VIN002', '2024-02-01', '2024-02-03', 20000, 20200, 180.00, 40.00, 10.00, 230.00, 'Completed'),
(3, 'LIC003', 'VIN003', '2024-03-01', '2024-03-07', 30000, 30800, 350.00, 60.00, 0.00, 410.00, 'Completed'),
(4, 'LIC004', 'VIN004', '2024-04-01', '2024-04-02', 40000, 40150, 100.00, 50.00, 0.00, 150.00, 'Completed'),
(5, 'LIC005', 'VIN005', '2024-05-01', '2024-05-05', 50000, 50500, 260.00, 70.00, 20.00, 350.00, 'Completed'),
(6, 'LIC006', 'VIN006', '2024-06-01', '2024-06-03', 60000, 60200, 180.00, 40.00, 0.00, 220.00, 'Completed'),
(7, 'LIC007', 'VIN007', '2024-07-01', '2024-07-05', 70000, 70500, 320.00, 60.00, 0.00, 380.00, 'Completed'),
(8, 'LIC008', 'VIN008', '2024-08-01', '2024-08-04', 80000, 80400, 240.00, 70.00, 0.00, 310.00, 'Completed'),
(9, 'LIC009', 'VIN009', '2024-09-01', '2024-09-02', 90000, 90100, 100.00, 50.00, 0.00, 150.00, 'Completed'),
(10, 'LIC010', 'VIN010', '2024-10-01', '2024-10-05', 100000, 100500, 400.00, 80.00, 0.00, 480.00, 'Completed');

-- Insert into Payment 
INSERT INTO Payment (Payment_ID, Reservation_ID, Due_Amount, Amount_Paid, Paid_By_Cash, Paid_By_UPI, Billing_Address, UPI_Reference)
VALUES 
(1, 1, 400.00, 400.00, 'YES', 'NO', '123 Maple St', NULL),
(2, 2, 350.00, 350.00, 'NO', 'YES', '456 Oak St', 'UPI12345'),
(3, 3, 420.00, 420.00, 'YES', 'NO', '789 Pine St', NULL),
(4, 4, 300.00, 300.00, 'NO', 'YES', '101 Birch St', 'UPI67890'),
(5, 5, 550.00, 550.00, 'YES', 'NO', '202 Palm St', NULL),
(6, 6, 650.00, 650.00, 'NO', 'YES', '303 Cedar St', 'UPI54321'),
(7, 7, 500.00, 500.00, 'YES', 'NO', '404 Willow St', NULL),
(8, 8, 600.00, 600.00, 'NO', 'YES', '505 Poplar St', 'UPI98765'),
(9, 9, 530.00, 530.00, 'YES', 'NO', '606 Fir St', NULL),
(10, 10, 750.00, 750.00, 'NO', 'YES', '707 Elm St', 'UPI11223');

select * from CAR
select * from CAR_USER
select * from Payment
select * from RENTAL_LOCATION
select * from RESERVATION
select * from VEHICLE_DETAILS

--select distinct(Status), avg(Price_per_Day) as Average_Price
--from CAR
--group by Status

--select RESERVATION.License_No , CAR_USER.Name
--from CAR_USER left join RESERVATION
--on CAR_USER.License_No = RESERVATION.License_No

--select * from CAR_USER
--where Name like '%c%' and Name like '%d%'

--use db_Effortless_Car_Rental
--select * from Payment
--create function dbo.NetAmount (@Net_Pay_remain float)
--returns table
--as
--return
--(
--select Due_Amount, Amount_Paid
--from Payment
--where Due_Amount - Amount_Paid = @Net_Pay_remain
--);
--------------------Start of Stored Procedure ,Cursor & Functions---------------------------------------------



--1Get All Cars 
CREATE PROCEDURE GetAllCars
AS
BEGIN
    SELECT * FROM CAR;
END
EXEC GetAllCars;
----------------------------------------
--2Get Cars by Location
CREATE PROCEDURE GetCarsByLocation
@LocationID INT
AS
BEGIN
    SELECT * FROM CAR WHERE Location_ID = @LocationID;
END
EXEC GetCarsByLocation @LocationID = 1;
-------------------------------------------
--3Update Car Daily Rate
CREATE PROCEDURE UpdateCarDailyRate
@ID VARCHAR,
@NewDailyRate DECIMAL(18, 2)
AS
BEGIN
BEGIN TRY
    UPDATE CAR
    SET Price_per_Day = @NewDailyRate
    WHERE VIN = @ID;
    PRINT 'Daily rate updated successfully';
END TRY
BEGIN CATCH
    PRINT 'An error occurred while updating the daily rate';
END CATCH
END
EXEC UpdateCarDailyRate @ID = VIN001, @NewDailyRate = 75.00;
---------------------------------------
--4Insert New Reservation
CREATE PROCEDURE InsertReservation
@UserID INT,
@CarID INT,
@StartDate DATETIME,
@EndDate DATETIME,
@RentalAmount DECIMAL(18, 2)
AS
BEGIN
BEGIN TRY
    INSERT INTO RESERVATION (User_ID, Car_ID, Start_Date, End_Date, Rental_Amount)
    VALUES (@UserID, @CarID, @StartDate, @EndDate, @RentalAmount);
    PRINT 'Reservation inserted successfully';
END TRY
BEGIN CATCH
    PRINT 'Error occurred while inserting the reservation';
END CATCH
END
EXEC InsertReservation @UserID = 1, @CarID = 2, @StartDate = '2024-11-21', @EndDate = '2024-11-25', @RentalAmount = 300.00;
---------------------------------------
--5Delete Reservation
CREATE PROCEDURE DeleteReservation
@ReservationID INT
AS
BEGIN
BEGIN TRY
    DELETE FROM RESERVATION WHERE Reservation_ID = @ReservationID;
    PRINT 'Reservation deleted successfully';
END TRY
BEGIN CATCH
    PRINT 'Error occurred while deleting the reservation';
END CATCH
END
EXEC DeleteReservation @ReservationID = 1;
---------------------------End of Stored Procedures--------------------------------



--1Iterate Over Cars Get all car details :--
DECLARE CarCursor CURSOR FOR
SELECT VIN, Car_Type, Year, Color, Model, Insurance
FROM VEHICLE_DETAILS;
OPEN CarCursor;
FETCH NEXT FROM CarCursor INTO @VIN, @Car_Type, @Year, @Color,@Model, @Insurance;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Car ID: ' + CAST(@VIN AS NVARCHAR(10)) + ', Make: ' + @Car_Type + ',Year: ' +@Year + ', Color: ' + @Color + ', Model: ' + @Model + ', Daily Rate: ' + CAST(@Insurance AS NVARCHAR(10));
    FETCH NEXT FROM CarCursor INTO @VIN, @Car_Type, @Year, @Color,@Model, @Insurance;
END
CLOSE CarCursor;
DEALLOCATE CarCursor;
------------------------------
--2Iterate Over Users :--prints basic user details 
DECLARE UserCursor CURSOR FOR
SELECT License_No, Name, Email FROM CAR_USER;
OPEN UserCursor;
FETCH NEXT FROM UserCursor INTO @License_No, @Name, @Email;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'User ID: ' + CAST(@License_No AS NVARCHAR(10)) + ', Name: ' + @Name + ', Email: ' + @Email;
    FETCH NEXT FROM UserCursor INTO @License_No, @Name, @Email;
END
CLOSE UserCursor;
DEALLOCATE UserCursor;
------------------------------------
--3Iterate Over Payments don't use it fro now :work needed
DECLARE PaymentCursor CURSOR FOR
SELECT Payment_ID, Amount, Status FROM PAYMENT;
OPEN PaymentCursor;
FETCH NEXT FROM PaymentCursor INTO @TransactionID, @Amount, @Status;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Transaction ID: ' + CAST(@TransactionID AS NVARCHAR(10)) + ', Amount: ' + CAST(@Amount AS NVARCHAR(10)) + ', Status: ' + @Status;
    FETCH NEXT FROM PaymentCursor INTO @TransactionID, @Amount, @Status;
END
CLOSE PaymentCursor;
DEALLOCATE PaymentCursor;
----------------------------------
--4Iterate Over Rental Locations
DECLARE LocationCursor CURSOR FOR
SELECT Location_ID, State FROM RENTAL_LOCATION;
OPEN LocationCursor;
FETCH NEXT FROM LocationCursor INTO @LocationID, @State;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Location ID: ' + CAST(@LocationID AS NVARCHAR(10)) + ', City: ' + @State;
    FETCH NEXT FROM LocationCursor INTO @LocationID, @State;
END
CLOSE LocationCursor;
DEALLOCATE LocationCursor;
----------------------------
--5Iterate Over Reservations
DECLARE ReservationCursor CURSOR FOR
SELECT Reservation_ID, User_ID, Car_ID FROM RESERVATION;
OPEN ReservationCursor;
FETCH NEXT FROM ReservationCursor INTO @ReservationID, @UserID, @CarID;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Reservation ID: ' + CAST(@ReservationID AS NVARCHAR(10)) + ', User ID: ' + CAST(@UserID AS NVARCHAR(10)) + ', Car ID: ' + CAST(@CarID AS NVARCHAR(10));
    FETCH NEXT FROM ReservationCursor INTO @ReservationID, @UserID, @CarID;
END
CLOSE ReservationCursor;
DEALLOCATE ReservationCursor;
-----------------------------End of Cursors---------------------------------------



--1Calculate Total Rental Amount
CREATE FUNCTION CalculateTotalRentalAmount(@StartDate DATE, @EndDate DATE, @Total_Amount DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @NetAmount DECIMAL(10, 2);
    SET @NetAmount = DATEDIFF(DAY, @StartDate, @EndDate) * @Total_Amount;
    RETURN @NetAmount;
END
---------------------
--2Get Car Availability by VIN
CREATE FUNCTION IsCarAvailable(@ID VARCHAR)
RETURNS BIT
AS
BEGIN
    DECLARE @Available BIT;
    IF EXISTS (SELECT 1 FROM CAR WHERE VIN = @ID)
        SET @Available = 0;
    ELSE
        SET @Available = 1;
    RETURN @Available;
END
------------------------
--3Get User Full Name
CREATE FUNCTION GetUserFullName(@UserID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @FullName NVARCHAR(100);
    SELECT @FullName = Name FROM CAR_USER WHERE User_ID = @UserID;
    RETURN @FullName;
END
---------------------------------
--4Get Payment Status
CREATE FUNCTION GetPaymentStatus(@TransactionID INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @Status NVARCHAR(50);
    SELECT @Status = Status FROM PAYMENT WHERE Transaction_ID = @TransactionID;
    RETURN @Status;
END
----------------------------------
--5Get Location Address
CREATE FUNCTION GetLocationAddress(@LocationID INT)
RETURNS NVARCHAR(200)
AS
BEGIN
    DECLARE @Address NVARCHAR(200);
    SELECT @Address = Address + ', ' + State + ', ' + Postal_Code FROM RENTAL_LOCATION WHERE Location_ID = @LocationID;
    RETURN @Address;
END
--------------------------------End OF Functions------------------------------

