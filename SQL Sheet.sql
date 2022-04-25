drop database railway_reservation_system;
create database railway_reservation_system;
use railway_reservation_system;
CREATE TABLE User (
    User_id INT ,
    Name VARCHAR(20) NOT NULL,
    Current_Email VARCHAR(20),
    City VARCHAR(20),
    State VARCHAR(20),
    Pincode INT,
    Gender CHAR(1),
    PRIMARY KEY (User_id)
);
INSERT INTO User(User_id,Name,Current_Email,City,State,Pincode,Gender)
VALUES
(10,"Shiv","Shiv@gmail.com","Hisar","Haryana",110059,"M"),
(11,"Aryan","Aryan@gmail.com","Noida","UP",110059,"M"),
(13,"Shubham","Shu@gmail.com","Delhi","Delhi",110044,"M"),
(12,"Tina","tina@gmail.com","Rohtak","Delhi",110036,"F"),
(14,"Riya","riya@gmail.com","Rohini","Delhi",110025,"F"),
(15,"Gargi","gargi@gmail.com","Noida","Delhi",110059,"F"),
(16,"Krash","krash@gmail.com","Jaipur","Rajasthan",110785,"M");




CREATE TABLE Passenger (
    pid INT,
    Name VARCHAR(20),
    Gender CHAR(1),
    Age INT,
    PRIMARY KEY (pid)
);
INSERT INTO Passenger(pid,Name,Gender,Age)
VALUES
(1000,"Shubham","M",46),
(1100,"Shiv","M",21),
(1200,"Aryan","M",48),
(1300,"Tina","F",20),
(1400,"Riya","F",21),
(1500,"Krash","M",22);





CREATE TABLE Station (
    Station_id INT,
    Station_name VARCHAR(20),
    PRIMARY KEY (Station_id)
);
INSERT INTO Station(Station_id,Station_name)
VALUES
(1,"Hisar"),
(2,"Noida"),
(3,"Delhi");


CREATE TABLE Train (
    Train_no INT PRIMARY KEY,
    Name VARCHAR(20),
    Source_id INT,
    Dest_id INT,
    Arr_time TIME,
    Dept_time TIME
);

INSERT INTO Train (Train_no,Name,Source_id,Dest_id,Arr_time,Dept_time)
VALUES
(100,"TrainA",501,805,"12:05:00","12:15:00"),
(102,"TrainB",501,805,"12:05:00","12:10:00"),
(101,"TrainC",501,805,"14:05:00","14:15:00"),
(110,"TrainB",501,805,"17:05:00","17:10:00"),
(103,"TrainA",501,805,"23:05:00","23:15:00");

CREATE TABLE Ticket (
    Pnr INT,
    Class CHAR(10),
    Status varchar(30),
    Book_date DATE,
    Train_no INT,
    User_id INT,
    pid INT,
    FOREIGN KEY (pid)
        REFERENCES Passenger (pid),
    FOREIGN KEY (User_id)
        REFERENCES User (User_id),
    FOREIGN KEY (Train_no)
        REFERENCES Train (Train_no)
);

INSERT INTO Ticket (pnr,Class,Status,Book_date,Train_no,User_id,pid)
VALUES
(1,"AC","Confirmed","2022-04-15",100,11,1200),
(3,"NAC","Cancelled","2022-04-18",102,12,1300),
(4,"AC","Waiting","2022-04-15",100,14,1400),
(5,"AC","Cancelled","2021-04-15",101,13,1000),
(6,"NAC","Waiting","2022-04-18",102,10,1100),
(7,"SL","Confirmed","2021-04-17",100,16,1500),
(8,"SL","Waiting","2021-04-15",100,13,1500);



CREATE TABLE Train_status (
    Train_no INT,
    Starting_date DATE,
    Class CHAR(2),
    Total_seat INT,
    Total_fare DECIMAL(6 , 2 )
);

INSERT INTO Train_status (Train_no,Starting_date,Class,Total_seat,Total_fare)
VALUES
(100,"1990-05-20","A",500,500.00),
(101,"1992-07-21","B",900,700.50),
(102,"1990-08-14","C",600,600.50),
(103,"1999-04-11","A",400,1000.00),
(104,"1899-02-10","B",1000,1500.00);








