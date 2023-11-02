CREATE DATABASE REL_JOIN

USE REL_JOIN


CREATE TABLE Roles(
[Id] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) not null
);

CREATE TABLE Users(
[Id] INT PRIMARY KEY IDENTITY,
[Username] NVARCHAR(50) not null,
[Password] NVARCHAR(20) not null,
[RolesID] INT FOREIGN KEY REFERENCES Roles(Id)
);

INSERT INTO Roles([Name]) values('Admin'),('Moderator'),('Coordinator'),('Coach'),('Volunteer')

INSERT INTO Users(Username,[Password],RolesID) 
values('John','john123',5),
('Robert','5564834A',4),
('David','dav3942id',3),
('Richard','richman002',2),
('Steven','gh1998vustv',1)


SELECT U.Username , R.Name AS [Roles] FROM Users AS U
INNER JOIN Roles AS R
ON U.RolesID = R.Id





