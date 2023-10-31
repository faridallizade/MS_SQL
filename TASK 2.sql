CREATE DATABASE Department

USE Department


CREATE TABLE Employees (
	[Id] int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50) CHECK (LEN(Name) >= 3),
    [Surname] NVARCHAR(50) CHECK (LEN(Surname) >= 3),
    [Salary] DECIMAL(10,2) CHECK (Salary >= 200),
    [Degree] NVARCHAR(20) CHECK (Degree IN ('junior', 'middle', 'senior'))
)

INSERT INTO Employees([Name],Surname,Salary,Degree) values('Ferid','Alizade',650,'junior'),
('Tural','Vuqarli',890,'senior'),('Cavid','Fatehli',730,'middle'),
('Babek','Veliyev',800,'senior'),('Zahir','Cavadov',1200,'senior'),
('Vuqar','Hesenli',400,'junior'),('Hesen','Vuqarli',240,'junior')

SELECT * FROM Employees
WHERE(Salary > 400)

SELECT CONCAT(Name, ' ', Surname) Fullname FROM Employees

SELECT Id, CONCAT(Name, ' ', Surname) Fullname , Salary FROM Employees

SELECT * FROM Employees
WHERE(Degree = 'junior')

SELECT TOP 1 * FROM Employees ORDER BY Salary DESC

SELECT TOP 1 * FROM Employees ORDER BY Salary ASC

SELECT AVG(Salary) AverageSalary FROM Employees

SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) AverageSalary FROM Employees);