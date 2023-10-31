CREATE DATABASE BB205
USE BB205

CREATE TABLE Students(
  Name varchar(20) Not null,
  Surname varchar(30) DEFAULT 'XXX',
  Age int CHECK (Age>=16),
  AvgPoint DECIMAL(10,2) CHECK (AvgPoint >= 0 AND AvgPoint <= 100)
);
  

INSERT INTO Students(Name,Surname,Age,AvgPoint) values('Ferid','Elizade',20,80),('Ayan','Cavadov',25,59),
('Vusal','Fecullayev',21,49),
('Aydin','Sadigov',17,76)


SELECT * FROM Students
WHERE(AvgPoint >51)

SELECT * FROM Students
WHERE(AvgPoint >51 AND AvgPoint<90)

SELECT * FROM Students WHERE Name LIKE 'A%n';

SELECT * FROM Students WHERE AvgPoint < 51 AND Age > 20;