-- ======================================================
-- Airports Table
-- ======================================================

CREATE TABLE Airports (
    AirportID NUMBER GENERATED ALWAYS AS IDENTITY START WITH 101 INCREMENT BY 1 PRIMARY KEY,
    AirportName VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50))

INSERT INTO Airports (AirportID,AirportName, City, Country) VALUES
('Kempegowda International Airport', 'Bangalore', 'India'),
('Chhatrapati Shivaji Airport', 'Mumbai', 'India'),
('Indira Gandhi International Airport', 'Delhi', 'India'),
('Heathrow Airport', 'London', 'UK'),
('John F. Kennedy Airport', 'New York', 'USA');

commit;

select * from airports;

-- ======================================================
-- Flights Table
-- ======================================================

  CREATE TABLE Flights (
    FlightID NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1001 INCREMENT BY 1 PRIMARY KEY,
    FlightNumber VARCHAR2(10),
    AirlineName VARCHAR2(100),
    OriginAirportID NUMBER,
    DestinationAirportID NUMBER,
    DepartureTime DATE,
    ArrivalTime DATE,
    BaseFare NUMBER(10,2),
    CONSTRAINT fk_origin_airport FOREIGN KEY (OriginAirportID)
        REFERENCES Airports(AirportID),
    CONSTRAINT fk_destination_airport FOREIGN KEY (DestinationAirportID)
        REFERENCES Airports(AirportID)
);


INSERT INTO Flights (FlightNumber, AirlineName, OriginAirportID, DestinationAirportID, DepartureTime, ArrivalTime, BaseFare)VALUES 
('AI101', 'Air India', 101, 103, TO_DATE('2023-10-15 08:00','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-15 10:30','YYYY-MM-DD HH24:MI'), 7500),
('6E220', 'IndiGo', 102, 101, TO_DATE('2023-10-16 09:30','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-16 11:00','YYYY-MM-DD HH24:MI'), 5500),
('BA150', 'British Airways', 103, 104, TO_DATE('2023-10-17 22:00','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-18 05:00','YYYY-MM-DD HH24:MI'), 45000),
('AI222', 'Air India', 104, 105, TO_DATE('2023-10-18 10:00','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-18 18:30','YYYY-MM-DD HH24:MI'), 52000),
('DL560', 'Delta Airlines', 105, 103, TO_DATE('2023-10-19 14:00','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-20 02:00','YYYY-MM-DD HH24:MI'), 48000);

commit;

select * from flights

-- ======================================================
-- Passengers Table
-- ======================================================
CREATE TABLE Passengers (
    PassengerID NUMBER GENERATED ALWAYS AS IDENTITY START WITH 501 INCREMENT BY 1 PRIMARY KEY,
    FullName VARCHAR(100),
    Gender CHAR(1),
    Age INT,
    Email VARCHAR(100)
);

INSERT INTO Passengers (FullName, Gender, Age, Email) VALUES
('Ravi Kumar', 'M', 34, 'ravi.kumar@gmail.com'),
('Sneha Patel', 'F', 28, 'sneha.patel@yahoo.com'),
('John Smith', 'M', 45, 'john.smith@gmail.com'),
('Priya Sharma', 'F', 31, 'priya.sharma@outlook.com'),
('David Johnson', 'M', 50, 'david.johnson@gmail.com');

commit;

select * from passengers

-- ======================================================
-- Bookings Table
-- ======================================================
CREATE TABLE Bookings (
    BookingID    NUMBER GENERATED ALWAYS AS IDENTITY START WITH 2001 INCREMENT BY 1 PRIMARY KEY,
    PassengerID  NUMBER,                           
    BookingDate  DATE DEFAULT SYSDATE,            
    TotalAmount  NUMBER(10,2),                    
    PaymentStatus VARCHAR2(20),
    CONSTRAINT fk_passenger FOREIGN KEY (PassengerID)
        REFERENCES Passengers(PassengerID))

INSERT INTO Bookings (PassengerID, BookingDate, TotalAmount, PaymentStatus) VALUES
(501, TO_DATE('2023-10-10','YYYY-MM-DD'), 8000, 'Paid'),
(502, TO_DATE('2023-10-12','YYYY-MM-DD'), 5500, 'Paid'),
(503, TO_DATE('2023-10-13','YYYY-MM-DD'), 46000, 'Paid'),
(504, TO_DATE('2023-10-14','YYYY-MM-DD'), 52000, 'Pending'),
(505, TO_DATE('2023-10-15','YYYY-MM-DD'), 48000, 'Paid');

commit;

select * from bookings

-- ======================================================
-- BookingDetails Table
-- ======================================================
CREATE TABLE BookingDetails (
    BookingDetailID NUMBER GENERATED ALWAYS AS IDENTITY START WITH 3001 INCREMENT BY 1 PRIMARY KEY,
    BookingID       NUMBER,
    FlightID   NUMBER,
    SeatNumber VARCHAR2(10),
    Class      VARCHAR2(20),
    Fare       NUMBER(10,2),
    CONSTRAINT fk_flight FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    CONSTRAINT fk_booking FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Booking Details
INSERT INTO BookingDetails (BookingID, FlightID, SeatNumber, Class, Fare) VALUES
(2001, 1012, '12A', 'Economy', 8000),
(2002, 1013, '14B', 'Economy', 5500),
(2003, 1014, '2C', 'Business', 46000),
(2004, 1015, '3D', 'Business', 52000),
(2005, 1016, '5A', 'Premium', 48000);


SELECT * FROM bookingdetails;