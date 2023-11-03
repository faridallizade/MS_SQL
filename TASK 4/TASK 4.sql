CREATE DATABASE CINEMA 
USE CINEMA

CREATE TABLE Movies(
ID INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL,
Rate INT NOT NULL CHECK (Rate <=10 AND Rate >=0),
DirectorId INT FOREIGN KEY REFERENCES Directors(ID),
GenreID INT FOREIGN KEY REFERENCES Genres(ID));

CREATE TABLE Directors(
ID INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
Age INT NOT NULL CHECK (Age >= 18));

CREATE TABLE Genres(
ID INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL);

CREATE TABLE Actors(
ID INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
Age INT NOT NULL CHECK (Age >= 18),
MovieID INT FOREIGN KEY REFERENCES Movies(ID));


INSERT INTO Genres(Name) values('Horror'),('Action'),('Drama'),('Comedy'),('Crime');

INSERT INTO Directors(Name,Surname,Age) values('Christopher','Nolan',53),
('Frank','Darabont',64),('Quentin','Tarantino',60);

INSERT INTO Movies(Name,Rate,DirectorId,GenreID) 
values('The Dark Knight',9,1,2),
('Memento',7,1,3),('The Green Mile',9,2,3),
('The Mist',6,2,5),('Reservoir Dogs',8,3,2),
('Kill Bill',9,3,1);

INSERT INTO Actors(Name,Surname,Age,MovieID) 
values('Christian','Bale',45,1),
('Cillian','Murphy',40,1),
('Guy','Pearce',65,2),
('Michael','Clarke',62,3),
('Tom','Hanks',72,3),
('Thomas','Jane',35,4),
('Quentin','Tarantino',60,5),
('Michael','Madsen',64,5),
('Michael','Madsen',64,6),
('Uma','Thurman',34,6);

--rate deyeri 8-den yuxari olan movies
SELECT * FROM Movies
WHERE(Rate>8);

--Kinonun adini ve rate deyerini ekrana cixaran query
SELECT Name,Rate FROM Movies

--Yasi 40-dan yuxari butun aktyor ve rejissorlarin Fullname Age-leri
SELECT Name + ' ' + Surname AS Fullname,Age 
FROM Actors
WHERE(Age > 40)

UNION ALL 

SELECT Name + ' ' + Surname AS Fullname,Age
FROM Directors
WHERE(Age > 40);

--Kinonun adini, Rate deyerini ve Rejissorunun fullname deyerlerini  ekrana yazan bir View
CREATE VIEW MovieDatas AS
SELECT M.[Name] AS MovieName, M.Rate,D.[Name] AS DirectorName
FROM Movies AS M
JOIN Directors AS D 
ON DirectorId = D.ID

SELECT * FROM MovieDatas

--Rejissorun adi, soyadi ve nece dene kinosu oldugunu ekrana cixaran query
SELECT DR.Name,DR.Surname, COUNT(M.ID) AS DirectedMovies FROM  Directors AS DR
LEFT JOIN Movies AS M
ON DR.ID =  M.DirectorId
GROUP BY DR.Name,DR.Surname	

--Kino adi, Rate, Rejissorunun fullname ve aktyorlarin fullname deyerlerini ekrana cixaran view
CREATE VIEW MovieCast AS
SELECT M.Name AS MovieName,M.Rate,DR.Name + ' ' +DR.Surname AS DirectorName ,A.Name + ' ' + A.Surname AS ActorName
FROM Movies AS M
JOIN Directors AS DR
ON M.DirectorId = DR.ID
JOIN Actors AS A
ON M.ID = MovieID

SELECT * FROM MovieCast

--Actor fullname, Rol aldigi kino,Kinonun janri, Kinonun rejissorunun fullname, Kino rate deyerlerini ekrana cixaran query

SELECT A.Name + ' ' + A.Surname AS Actor , M.Name AS MovieName, G.Name AS Genre, DR.Name + ' ' + DR.Surname AS Director, M.Rate
FROM Actors AS A
JOIN Movies AS M ON A.MovieID = M.ID
JOIN Genres AS G ON M.GenreID = G.ID
JOIN Directors AS DR ON M.DirectorId = DR.ID
