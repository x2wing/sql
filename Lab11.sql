GO 
CREATE DATABASE Student_Olimpieva
ON 
(NAME=Student_Olimpieva_dat,
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\myfirstatabase.mdf',
SIZE=10,
MAXSIZE=50,
FILEGROWTH=5)
LOG ON
(NAME=Student_Olimpieva_log,
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\myfirstdatabase.ldf',
SIZE=5MB,
MAXSIZE=25MB,
FILEGROWTH=5MB)
GO