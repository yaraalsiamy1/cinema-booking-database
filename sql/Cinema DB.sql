CREATE DATABASE Cinema_Booking;
USE Cinema_Booking;

-- Movie
Create table Movie (
Movie_ID INT PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Duration_min INT NOT NULL,
Age_rating VARCHAR(10)  NOT NULL,
CHECK (Duration_min > 0)
);
DESCRIBE Movie;

-- Screening
CREATE TABLE Screening (
  Screening_ID INT PRIMARY KEY,
  Movie_ID INT NOT NULL,
  Start_time DATETIME NOT NULL,
  Price DECIMAL(6,2) NOT NULL,
  FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
  );
DESCRIBE Screening;

-- Customer
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Full_Name VARCHAR(50) NOT NULL,
    Phone VARCHAR(10) UNIQUE NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL
);
DESCRIBE Customer;

-- Ticket
CREATE TABLE Ticket (
  ticket_id    INT PRIMARY KEY,
  screening_id INT NOT NULL,
  customer_id  INT NOT NULL,
  CONSTRAINT fk_ticket_screening
    FOREIGN KEY (screening_id) REFERENCES Screening(screening_id),
  CONSTRAINT fk_ticket_customer
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
DESCRIBE Ticket;

-- Insert data into Movie
INSERT INTO Movie (Movie_ID, Title, Duration_min, Age_Rating) VALUES
(1, 'Beauty and the Beast', 84, 'G'),
(2, 'Coco', 105, 'PG'),
(3, 'Cars', 117, 'G'),
(4, 'Lilo & Stitch', 85, 'PG'),
(5, 'The Lion King', 89, 'G');
SELECT * FROM Movie;

-- Insert data into Screening
INSERT INTO Screening (Screening_ID, Movie_ID, Start_time, Price) VALUES
(101, 1, '2025-01-10 18:00:00', 45.00),
(102, 2, '2025-01-10 21:00:00', 50.00),
(103, 3, '2025-01-11 17:30:00', 40.00),
(104, 4, '2025-01-11 19:45:00', 35.00),
(105, 5, '2025-01-12 20:15:00', 42.00);
SELECT * FROM Screening;


-- Insert data into Customer
INSERT INTO Customer (Customer_ID, Full_Name, Phone, Email) VALUES
(1, 'Ruba Ahmed Aljmal', '0505971048', 'ruba.ahmed@gmail.com'),
(2, 'Sara Akram Bashawri', '0504838877', 'sara.akram@gmail.com'),
(3, 'Lamar Ashraf Andragiri', '0508264075', 'lamar.ashraf@gmail.com'),
(4, 'Yara Ismail Alsaimy', '0502753335', 'yara.ismail@gmail.com'),
(5, 'Farah Abdullah Alhazmi', '0507654889', 'farah.abdullah@gmail.com');
SELECT * FROM Customer; 


-- Insert data into Ticket
INSERT INTO Ticket (ticket_id, screening_id, customer_id) VALUES
(201, 101, 2),
(202, 102, 3),
(203, 103, 4),
(204, 104, 5),
(205, 105, 1);
SELECT * FROM Ticket;

-- phase 3

SELECT Title, Age_rating 
FROM Movie
WHERE Age_rating = 'PG';

SELECT Screening_ID, Movie_ID, Start_time, Price
FROM Screening
WHERE Price < 45;

SELECT AVG(Price) AS Average_Price
FROM Screening;

SELECT MIN(Price) AS Lowest_Price, 
MAX(Price) AS Highest_Price
FROM Screening;


SELECT 
    t.ticket_id,
    c.Full_Name,
    m.Title
FROM Ticket t
JOIN Customer c ON t.customer_id = c.Customer_ID
JOIN Screening s ON t.screening_id = s.Screening_ID
JOIN Movie m ON s.Movie_ID = m.Movie_ID;


SELECT Full_Name
FROM Customer
WHERE Customer_ID IN (
    SELECT customer_id
    FROM Ticket
    WHERE screening_id = (
        SELECT Screening_ID
        FROM Screening
        WHERE Price = (SELECT MAX(Price) FROM Screening)
    )
);


DROP VIEW IF EXISTS v_ticket_report;
CREATE VIEW v_ticket_report AS
SELECT 
    t.ticket_id,
    c.Full_Name      AS customer_name,
    m.Title          AS movie_title,
    s.Start_time,
    s.Price
FROM Ticket t
JOIN Customer  c ON t.customer_id  = c.Customer_ID
JOIN Screening s ON t.screening_id = s.Screening_ID
JOIN Movie m ON s.Movie_ID = m.Movie_ID;


SELECT * 
FROM v_ticket_report
ORDER BY Start_time, ticket_id;