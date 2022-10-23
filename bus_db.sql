-- CREATE DATABASE bus_db;
-- DROP DATABASE bus_db;
-- USE bus_db;

-- -------Admin---------------------------
CREATE TABLE IF NOT EXISTS Admin
(
Id VARCHAR(4) NOT NULL PRIMARY KEY,
EmailId VARCHAR(35),
Password VARCHAR(10)
);

INSERT INTO Admin VALUES("A1","admin@gmail.com","admin");

-- ---------Driver------------------------

CREATE TABLE IF NOT EXISTS Driver
(
DriverId INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(30),
EmailId VARCHAR(35),
MobileNumber VARCHAR(12),
PRIMARY KEY(DriverId)
);

INSERT INTO Driver VALUES("Shiva","shiva@gmail.com","9098979695");
INSERT INTO Driver VALUES("Hari","hari@gmail.com","9000011119");
INSERT INTO Driver VALUES("Mega","mega@gmail.com","9111122229");
INSERT INTO Driver VALUES("Ayyappa","ayyappa@gmail.com","9222233339");
-- ----Passenger Related Tables-------------
CREATE TABLE IF NOT EXISTS Passenger
(
PassengerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(30),
EmailId VARCHAR(35),
Password VARCHAR(10),
MobileNumber VARCHAR(12)
);

INSERT INTO Passenger VALUES("Murugan","murugan@gmail.com","Murugan1","8787878787");
INSERT INTO Passenger VALUES("Deepa","deepa@gmail.com","Deepa1","8686868686");
INSERT INTO Passenger VALUES("Durga","durga@gmail.com","Durga1","8585858585");
INSERT INTO Passenger VALUES("Anbu","anbu@gmail.com","Anbu1","8484848484");
INSERT INTO Passenger VALUES("Suba","suba@gmail.com","Suba1","8383838383");
-- --------------------------------------------------
-- -----------Bus Details----------------------------

CREATE TABLE IF NOT EXISTS Bus
(
BusId INT NOT NULL AUTO_INCREMENT,
BusNumber VARCHAR(10),
BusType VARCHAR(6),
SeatTypeId INT,
SeatingFare DOUBLE,
Seats INT,
PRIMARY KEY(BusId)
);

INSERT INTO Bus VALUES("TN74 TIN 4000","AC",2,100.00,15);
INSERT INTO Bus VALUES("TN33 CBE 3333","AC",2,100.0,15);
INSERT INTO Bus VALUES("TN74 TIN 7000","NON AC",1,200.00,24);
INSERT INTO Bus VALUES("TN33 CBE 3000","NON AC",1,200.00,24);
INSERT INTO Bus VALUES("TN74 TIN 4477","NON AC",1,200.00,24);
INSERT INTO Bus VALUES("TN33 CBE 3300","NON AC",1,200.00,24);

CREATE TABLE IF NOT EXISTS SeatType
(
SeatTypeId INT NOT NULL AUTO_INCREMENT,
SeatType VARCHAR(30),
PRIMARY KEY(SeatTypeId)
);

INSERT INTO SeatType VALUES
(1,"Sleeper"),
(2,"SemiSleeper");
   
   
CREATE TABLE IF NOT EXISTS TravelSchedule
(
BusId INT NOT NULL,
RouteId INT NOT NULL AUTO_INCREMENT,
DriverId INT NOT NULL,
StartPlace VARCHAR(20),
EndPlace VARCHAR(20),
TravelStartDate DATE,
TravelEndDate DATE,
TravelStartTime TIME,
TravelEndTime TIME, 
PRIMARY KEY(BusId,RouteId),
CONSTRAINT Bus_fk FOREIGN KEY(BusId) REFERENCES Bus(BusId),
CONSTRAINT driver_fk FOREIGN KEY(DriverId) REFERENCES Driver(DriverId)                      
);                                                                                                                                                                                         

			

INSERT INTO TravelSchedules VALUES(1,1,1,"Chennai","Tenkasi",'2022-10-24','2022-10-25','18:00','04:00');
INSERT INTO TravelSchedules VALUES(2,2,2,"Chennai","Coimbatore",'2022-10-24','2022-10-25','20:00','06:00');
INSERT INTO TravelSchedules VALUES(3,3,3,"Chennai","Tenkasi",'2022-10-24','2022-10-25','22:30','06:30');
INSERT INTO TravelSchedules VALUES(4,4,4,"Chennai","Coimbatore",'2022-10-26','2022-10-27','22:30','06:30');


CREATE TABLE IF NOT EXISTS RouteMapping
(
RouteId INT NOT NULL,
RouteOrder INT,
StopName VARCHAR(20),
TravelFare DOUBLE,
TimeToReach DOUBLE,
PRIMARY KEY(RouteId),
CONSTRAINT TS_fk FOREIGN KEY(RouteId) REFERENCES TravelSchedule(RouteId)
);

INSERT INTO RouteMapping VALUES(1,1,"Ariyalur",325.00,5);
INSERT INTO RouteMapping VALUES(1,2,"Trichy",500.00,5);
INSERT INTO RouteMapping VALUES(1,3,"Madurai",700.00,7.25);
INSERT INTO RouteMapping VALUES(1,4,"Virudhunagar",800.00,8.30);
INSERT INTO RouteMapping VALUES(1,5,"Sivakasi",900.0,9);
INSERT INTO RouteMapping VALUES(1,6,"Tenkasi",1100.00,10);

INSERT INTO RouteMapping VALUES(2,1,"Vellore",400.00,2);
INSERT INTO RouteMapping VALUES(2,2,"Salem",800.00,5.20);
INSERT INTO RouteMapping VALUES(2,3,"Erode",900.00,6);
INSERT INTO RouteMapping VALUES(2,4,"Tiruppur",1000.00,7);
INSERT INTO RouteMapping VALUES(2,5,"Coimbatore",1400.00,8);

INSERT INTO RouteMapping VALUES(3,1,"Perambalur",275.00,4.30);
INSERT INTO RouteMapping VALUES(3,2,"Trichy",560.00,5);
INSERT INTO RouteMapping VALUES(3,3,"Madurai",750.00,7.25);
INSERT INTO RouteMapping VALUES(3,4,"Tenkasi",1300.00,10);

INSERT INTO RouteMapping VALUES(4,1,"Vellore",250.00,2);
INSERT INTO RouteMapping VALUES(4,2,"Salem",600.00,5.20);
INSERT INTO RouteMapping VALUES(4,3,"Erode",700.00,6);
INSERT INTO RouteMapping VALUES(4,4,"Tiruppur",900.00,7);
INSERT INTO RouteMapping VALUES(4,5,"Coimbatore",1200.00,8);

CREATE TABLE IF NOT EXISTS BoardingPoints
(
BoardingOrder INT NOT NULL,
BoardingPlace VARCHAR(30)
);

INSERT INTO BoardingPoints VALUES
(1,"Tambaram"),
(2,"Perungalathur"),
(3,"SRM college"),
(4,"Mahindhra City"),
(5,"Chengalpattu");

-- ------------Booked Details--------------------------
CREATE TABLE IF NOT EXISTS BookingDetails
(
TicketId INT NOT NULL PRIMARY KEY,
BusId INT NOT NULL,
RouteId INT NOT NULL,
PassengerId VARCHAR(5) NOT NULL,
BoardingPoint VARCHAR(30),
DroppingPoint VARCHAR(30),
TicketCount INT,
GST DOUBLE,
Fare DOUBLE,
CONSTRAINT p_fk FOREIGN KEY(PassengerId) REFERENCES Passenger(PassengerId)
);

INSERT INTO BookingDetails VALUES(1,1,1,1,"Perungalathur","Tenkasi",2,0.05,1800.00);

CREATE TABLE IF NOT EXISTS BookedPassengers
(
TicketId VARCHAR(5),
SeatNumber INT,
PassengerName VARCHAR(30)
);

INSERT INTO BookedPassengers VALUES
(1,1,"Shruthi"),
(1,2,"Hemanth");
