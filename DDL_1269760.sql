


/*
			    SQL Project : School Management System (SMS_DB)
				 Trainee Name : MD. Mamunur Roshid
				 Trainee ID : 1269760
				 Batch  ID  : ESAD-CS/PNTL-A/51/01
				 Project Submission Date: 07/06/2022
*/

/*
Table of Contents: DDL
    => SECTION 01: Created a Database Name [smsDB]
    => SECTION 02: Created Appropriate Tables For The Database
	------------------------------------------------------------------------
    => SECTION 03: Apply Some Modifying Statement (ALTER, ADD, DELETE, UPDATE)
    => SECTION 04: Created Some Clustered & Non-Clustered Index
    => SECTION 05: CREATING VIEWS
    => SECTION 06: STORE PROCEDURE (INSERT, DELETE, UPDATE)
    => SECTION 07: CREATING FUNCTION (Scalar Value, Table Value )
    => SECTION 08: CREATING TRIGGER (FOR / AFTER TRIGGER, INSTEAD OF TRIGGER )
    => SECTION 09: CREATING TRANSACTION
*/

---/////////////////////////////////////////  START MY PROJECT ///////////////////////////////////////////////

--===SECTION 01: CREATED A DATABASE NAME [smsDB]


USE MASTER
GO

DROP DATABASE IF EXISTS SMS_DB
GO

CREATE DATABASE SMS_DB
ON
(
    name = 'SMS_DB_Data',
    filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SMS_DB_Data.mdf',
    size = 50MB,
    maxsize = 100MB,
    filegrowth = 10%
)
LOG ON
(
    name = 'SMS_DB_Log',
    filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SMS_DB_Log.ldf',
    size = 25MB,
    maxsize = 50MB,
    filegrowth = 1MB
)
GO

USE SMS_DB
GO

--==========================
-- create table school 
--========================== 
CREATE TABLE school
(
	schoolID INT IDENTITY PRIMARY KEY,
	schoolName NVARCHAR(40) NOT NULL,
	schoolAddress NVARCHAR(40) NOT NULL,
	schoolPhoneNo CHAR(15) NOT NULL
)
GO

--==========================
-- create table [status] 
--========================== 
CREATE TABLE [status]
(
	statusID INT IDENTITY PRIMARY KEY,
	statusTitle NVARCHAR(40) NOT NULL
)
GO

--==========================
-- create table grades 
--========================== 
CREATE TABLE grades
(
	gradeID INT IDENTITY PRIMARY KEY,
	grade NVARCHAR(40) NOT NULL
)
GO

--==========================
-- create table City 
--========================== 
CREATE TABLE city 
(
	cityID INT IDENTITY PRIMARY KEY,
	cityName NVARCHAR(40) NOT NULL DEFAULT 'Dhaka',
)
GO

--==========================
-- create table parent 
--========================== 
CREATE TABLE parent
(
	parentID INT IDENTITY PRIMARY KEY,
	parentName VARCHAR(40) NOT NULL,
	dob DATE NOT NULL,
	email NVARCHAR(40) CHECK(email LIKE '%@%'),
	phoneNo CHAR(15),
	[address] NVARCHAR(200)  DEFAULT 'Dhaka', 
	cityID INT REFERENCES city(cityID) DEFAULT 1,
	country VARCHAR(40) DEFAULT 'Bangladesh',
	NID CHAR(10) NOT NULL UNIQUE CHECK(NID LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
GO
 
--==========================
-- create table students 
--========================== 

CREATE TABLE students
(
	studentID INT IDENTITY PRIMARY KEY,
	studentName VARCHAR(40) NOT NULL,
	dob DATE NOT NULL,
	email NVARCHAR(40) CHECK(email LIKE '%@%'),
	phoneNo CHAR(15),
	[address] NVARCHAR(200)  DEFAULT 'Dhaka', 
	cityID INT REFERENCES city(cityID) DEFAULT 1,
	country VARCHAR(40) DEFAULT 'Bangladesh',
	[image]  VARCHAR(MAX) DEFAULT 'N/A',
	NID CHAR(10) NOT NULL UNIQUE CHECK(NID LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	parentID INT REFERENCES parent(parentID)
)
GO

--==========================
-- create table teachers 
--==========================
CREATE TABLE teachers
(
	teacherID INT IDENTITY PRIMARY KEY,
	teacherName VARCHAR(40) NOT NULL,
	dob DATE NOT NULL,
	gender VARCHAR(40) DEFAULT 'Male',
	phone VARCHAR(15),
	joinDate DATE NOT NULL,
	email VARCHAR(40),
	[address] NVARCHAR(200) DEFAULT ('Dhaka'), 
	cityID INT REFERENCES city(cityID) DEFAULT 1,
	[country] VARCHAR(40) DEFAULT ('Bangladesh'),
	[image] VARCHAR(MAX) DEFAULT 'N/A',
	statusID INT REFERENCES [status](statusID),
	NID CHAR(10) NOT NULL UNIQUE CHECK(NID LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
GO
----=========================== Class Room Manage  Table ===============================================			
--================================
-- create table ClassRoom 
--================================
CREATE TABLE classRoom
(	
	classRoomID INT IDENTITY PRIMARY KEY,
	className VARCHAR(10) NOT NULL, 
)
GO

--================================
-- create table ClassRoomDetails
--================================
CREATE TABLE ClassRoomDetails
(	
	classRoomID INT REFERENCES ClassRoom(classRoomID),
	[year] DATE NOT NULL,
	section VARCHAR(10)  DEFAULT 'Section-A', 
	remarks VARCHAR(40) NULL,
	teacherID INT REFERENCES teachers(teacherID)
)
GO

SELECT * FROM ClassRoomDetails
GO
--================================
-- create table ClassroomStudent
--================================
CREATE TABLE ClassRoomStudent
(	
		classRoomID INT REFERENCES ClassRoom(classRoomID),
		studentID INT REFERENCES students(studentID)
)
GO

--================================
-- create table attendance 
--================================
CREATE TABLE attendance
(	
	[date] DATE NOT NULL,
	studentID INT REFERENCES students(studentID),
	[status] VARCHAR(20) NOT NULL,
)
GO
----============================== Departments Manage  Table  ============================================

--================================
-- create table Department 
--================================
CREATE TABLE department
(	
	departmentID INT IDENTITY PRIMARY KEY,
	departmentName VARCHAR(40) NOT NULL,
)
GO


--================================
-- create table humanity 
--================================
CREATE TABLE humanity
(	
	humanitySubID INT IDENTITY PRIMARY KEY,
	humanitySubName VARCHAR(40) NOT NULL,
	departmentID INT REFERENCES department(departmentID)
)
GO


--================================
-- create table Commerce 
--================================
CREATE TABLE commerce
(	
	commercSubID INT IDENTITY PRIMARY KEY,
	commerceSubName VARCHAR(40) NOT NULL,
	departmentID INT REFERENCES department(departmentID)
)
GO

--================================
-- create table Science 
--================================
CREATE TABLE science
(	
	scienceSubID INT IDENTITY PRIMARY KEY,
	scienceSubName VARCHAR(40) NOT NULL,
	departmentID INT REFERENCES department(departmentID),
)
GO
		
----==========================      Exam Manage Table   ==================================================	

--================================
-- create table examType 
--================================
CREATE TABLE examType
(	
	examTypeID INT IDENTITY PRIMARY KEY,
	examTypeName NVARCHAR(40) NOT NULL,
	[description] NVARCHAR(100)
)
GO

--================================
-- create table exam 
--================================
CREATE TABLE exam
(	
	examID INT IDENTITY PRIMARY KEY,
	examTypeID INT REFERENCES examType(examTypeID),
	examName NVARCHAR(40),
	startDate DATE
)
GO

--================================
-- create table examResult
--================================
CREATE TABLE examResult
(	
	examID INT REFERENCES exam(examID),
	studentID INT REFERENCES students(studentID),
	GPA DECIMAL(5,2) NOT NULL
)
GO

--=============================== Employee Manage Table ==========================================

--===========================================
-- Table Created Name (empDepartment)]
---==========================================
CREATE TABLE empDepartment
(
    empDepartment_ID INT IDENTITY PRIMARY KEY,
    empDepartment_Name NVARCHAR (40) NOT NULL,
	numOfEmployee CHAR(10) NOT NULL
)
GO

--================================
-- create table employees
--================================
CREATE TABLE employees
(
	empID INT IDENTITY PRIMARY KEY,
	empName VARCHAR(40) NOT NULL,
	gender VARCHAR(40) DEFAULT ' Male',
	dob DATE NOT NULL,
	phone VARCHAR(15),
	joinDate DATE NOT NULL,
	email VARCHAR(40),
	[address] NVARCHAR(200) DEFAULT ('Dhaka'), 
	[country] VARCHAR(40) DEFAULT ('Bangladesh'),
	[image] VARCHAR(MAX) DEFAULT 'N/A',
	NID CHAR(10) NOT NULL UNIQUE CHECK(NID LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	cityID INT REFERENCES city(cityID) DEFAULT 1,
	statusID INT REFERENCES [status](statusID),
)
GO

----===========================================================
-- Table Created Name salary
---===========================================================
CREATE TABLE salary
(
    salaryID INT IDENTITY PRIMARY KEY,
    empID INT REFERENCES employees(empID),
	empDepartment_ID INT REFERENCES empDepartment(empDepartment_ID),
	salary MONEY DEFAULT 0.00,
    [day] NVARCHAR (10) NOT NULL CHECK ([day] IN ('SUN', 'MON', 'TUE', 'WED', 'THR'))
)
GO

----===========================================================
-- Table Created Name [tblEmpDailyTask (Employee Daily Task)]
---===========================================================
CREATE TABLE empDailyTask

(
    taskID INT PRIMARY KEY NOT NULL,
    empID INT REFERENCES employees(empID),
    [day] NVARCHAR (10) NOT NULL CHECK ([day] IN ('SUN', 'MON', 'TUE', 'WED', 'THR'))
)
GO

select * from empDailyTask
GO
--==============================
-- create table employeeSalary
--==============================
CREATE TABLE employeeSalary
(		
	empID INT REFERENCES employees(empID),
	empType VARCHAR(40) NOT NULL,
	monthlySalary MONEY DEFAULT 0.00,
	bonus MONEY DEFAULT 0.00,
	bonusWithMonthlySalary AS (monthlySalary + bonus )
)
GO

---===================================
 --------CREATE TABLE cities (Extra)---------
--====================================
CREATE TABLE cities
(
	cityID INT IDENTITY(1,1),	
	cityName VARCHAR(20) NOT NULL
)
GO

SELECT * FROM cities
GO

CREATE TABLE warehouse
(
	location VARCHAR(50),
	productId INT,
	name VARCHAR(50),
	qty INT
)
GO
SELECT * FROM warehouse
GO

CREATE TABLE shop
(
	location VARCHAR(50),
	productId INT,
	productName VARCHAR(50),
	updateTime DATETIME,
	comments VARCHAR(75) NULL
)
GO
SELECT * FROM shop
GO


--============     ALTER TABLE (ADD, DELETE COLUMN, DROP COLUMN)   ===============--

-- ADD COLUMN ZIPCODE  TO A EXISTING IN CITY TABLE 
ALTER TABLE cities
ADD Zipcode VARCHAR(10) 
GO

--DELETE COLUMN FROM A EXISTING TABLE POSTALCODE
ALTER TABLE cities
DROP COLUMN Zipcode
GO

--DROP A TABLE
IF OBJECT_ID('cities') IS NOT NULL
DROP TABLE cities
GO

--============================================================================================ 
-- CREATING INDEX, VIEW, STORED PROCEDURE, FUNTIONS, TRIGGERS ON THE TABLE CREATE BEFORE --  ==============================================================================================

--CREATING A NON-CLUSTERED INDEX FOR CUSTOMER TABLE
CREATE UNIQUE NONCLUSTERED INDEX NCIX_employees
ON employees(empID)
GO

select * from employees
GO

----------------------------------------------------------------------------------------------------------------
----AS CLUSTERED INDEX AUTOMETICALLY CREATED FOR PRIMARY KEY COLUMN, I CAN'T CREATED IT. BECAUSE ALL TABLE HOLD --A PRIMARY KEY COLUMN ("AUTOMATICALLY CTEATE INDEX") . "SO I AM USING CLUSTERED INDEX IN EXTRA TABLE CITIES"
----------------------------------------------------------------------------------------------------------------
CREATE UNIQUE CLUSTERED INDEX IX_cities
ON cities(cityID)
GO

--================================================== 
--------------           02. VIEW  
---=================================================
-- Create a view for update, insert and delete data from base table
CREATE VIEW V_employees
AS
SELECT * FROM employees
GO

--Inserting data using view
INSERT INTO V_employees VALUES
		('Sanam Khan','Female','1990-09-09',01707528440,'2023-01-12','sanam@gmail.com',DEFAULT,DEFAULT,DEFAULT,3434343434,1,2)
GO

-- as empID is referenced to others table, we can not delete it using view. but I can write the syntax of deleting data using view
DELETE FROM V_employees
WHERE empID = 10
GO

--========================================================================================
--Creating a view to find out the employee who have Salary more than 20000.00 (Thousand tk ).
--========================================================================================
	CREATE VIEW V_employeeSalary
	WITH ENCRYPTION
	AS
		SELECT TOP 50 PERCENT emp.empID,emp.empName,emp.address, es.empType,es.monthlySalary,es.bonusWithMonthlySalary
		FROM employeeSalary es
		JOIN employees emp ON es.empID=emp.empId
		WHERE monthlySalary >=20000.00
	WITH CHECK OPTION
	GO

Select * from employeeSalary
GO

-- View Created Name [V_examResultDetails]
CREATE VIEW V_examResultDetails
AS
SELECT 
	er.studentID,
	er.examID,
	er.GPA,
	e.examName,
	e.examTypeID,
	e.startDate

FROM examResult as er
JOIN exam as e ON er.examID = e.examID
GO
Select * from examResult
GO




--==============================================================================
							---    03 STORED PROCEDURE    -----
--==============================================================================
--A STORED PROCEDURE FOR QUERY  DATA

CREATE PROC sp_employees
WITH ENCRYPTION
AS
SELECT * FROM employees
WHERE address='Dhaka'
GO

--A Stored Procedure for inserting DATA
CREATE PROC sp_InsertEmployees
							@empID INT,
							@empName VARCHAR(40),
							@gender VARCHAR(40),
							@dob DATE,
							@phone VARCHAR(15),
							@joinDate DATE,
							@email VARCHAR(40),
							@address NVARCHAR(200),
							@country VARCHAR(40),
							@image VARCHAR(MAX),
							@NID CHAR(10),
							@cityID INT,
							@statusID INT												
AS
BEGIN
	INSERT INTO employees(empID,empName,gender,dob,phone,joinDate,email,[address],[country],[image],NID,cityID,statusID)
	VALUES(@empID,@empName,@gender,@dob,@phone,@joinDate,@email,@address,@country,@image,@NID,@cityID,@statusID)
END
GO

--**********************************
--A Stored Procedure data deleting
--**********************************
CREATE PROC sp_deleteEmployees
						@image VARCHAR(MAX)
AS 
	DELETE FROM employees WHERE [image] = @image
GO

--A Stored procedure for inserting data with return values
CREATE PROC sp_InsertEmployeesWithReturn
										@empID INT,
										@empName VARCHAR(40),
										@gender VARCHAR(40),
										@dob DATE,
										@phone VARCHAR(15),
										@joinDate DATE,
										@email VARCHAR(40),
										@address NVARCHAR(200),
										@country VARCHAR(40),
										@image VARCHAR(MAX),
										@NID CHAR(10),
										@cityID INT,
										@statusID INT	
AS
DECLARE @ID INT 
INSERT INTO employees VALUES(@empID,@empName,@gender,@dob,@phone,@joinDate,@email,@address,@country,@image,@NID,@cityID,@statusID)
SELECT @ID=IDENT_CURRENT('employees')
RETURN @ID
GO

--**********************************
----  test with data insert
--**********************************

DECLARE @ID INT
EXEC @ID= sp_InsertEmployeesWithReturn 
									'Jarima Hasan', 'Female','1980-02-09',01909787898,'2013-09-09','karima@gmail.com','Chittagong',Default,Default,1234566123,1,1
PRINT 'New Employee With Id : '+STR(@ID)
GO

--************************************************************
--A Stored procedure for inserting data with output parameter
---***********************************************************
CREATE PROC sp_InsertEmployeesWithOutPutParameter
										@empID INT OUTPUT,
										@empName VARCHAR(40),
										@gender VARCHAR(40),
										@dob DATE,
										@phone VARCHAR(15),
										@joinDate DATE,
										@email VARCHAR(40),
										@address NVARCHAR(200),
										@country VARCHAR(40),
										@image VARCHAR(MAX),
										@NID CHAR(10),
										@cityID INT,
										@statusID INT 
AS
INSERT INTO employees VALUES(@empID,@empName,@gender,@dob,@phone,@joinDate,@email,@address,@country,@image,@NID,@cityID,@statusID)
SELECT @empID=IDENT_CURRENT('employees')
GO




--============================================= 04.FUNCTIONS ============================================
=========================================================================================================
--==========
--FUNCTIONS =>
--==========
/*
There are three types of user defined functions in the sql language.
				1.Scalar valued function
				2.Single-Statement table valued function
				3.Multi-Statement table valued function

I have used all function in my project
*/


-----====================================================================
-- 1. Scalar valued function for calculating the bonus with monthlySalary
----=====================================================================
CREATE FUNCTION fn_EmployeeSalary
					(@month int,@year int)
RETURNS INT
AS
	BEGIN
		DECLARE @monthlySalary MONEY
			SELECT @monthlySalary=SUM(monthlySalary+bonus) FROM employeeSalary 
			JOIN employees ON employeeSalary.empID=employees.empID
			WHERE YEAR(joinDate)=@year AND MONTH(joinDate)=@month
		RETURN @monthlySalary
	END	
GO
SELECT * FROM employeeSalary
SELECT * FROM employees
GO

--2. Scalar valued function for calculating the total  amount according to PRODUCT
CREATE FUNCTION fn_monthlySalaryEveryEmployee
											(@empID INT)
RETURNS MONEY
AS
	BEGIN
		DECLARE @monthlySalary MONEY
		SELECT @monthlySalary= SUM(monthlySalary+bonus) FROM employeeSalary WHERE empID=@empID
		RETURN @monthlySalary
	END
GO



select * from school
GO

--========================================   05 TRIGGERS  ==============================================--
/*
				Used Two types of TRIGGERS 
				---------------------------
				1. AFTER/ FOR TRIGGERS
				2. INSTEAD OF TRIGGERS

*/

--AFTER TRIGGER FOR NOT DELETING ANY DATA FROM ORDERS DATA
CREATE TRIGGER tr_employees
ON employees
FOR DELETE
AS
	BEGIN
			PRINT'YOU CAN NOT DELETE AN EMPLOYEE DATA'
			ROLLBACK TRANSACTION
	END
GO


-- AFTER TRIGGER FOR INSERT DATA INTO INVENTORY TABLE --
CREATE TRIGGER tr_employeeSalaryInsert
ON employeeSalary
FOR INSERT
AS
	BEGIN
			DECLARE @empID INT, @b INT
			SELECT @empID=@empID , @b=bonus FROM inserted

			UPDATE salary
			SET salary=salary+@b
			WHERE salaryID=@empID
	END
GO

select * from employeeSalary
select * from employees

-- AFTER TRIGGER FOR INSERT DATA INTO INVENTORY TABLE --
CREATE TRIGGER tr_employeeSalaryDelete 
ON employeeSalary
FOR DELETE
AS
	BEGIN
			DECLARE @empID INT, @b INT
			SELECT @empID=@empID , @b=bonus FROM inserted

			UPDATE salary
			SET salary=salary+@b
			WHERE salaryID=@empID
	END
GO


/*
Procedure Created By Using
(TRY CATCH, Error Message and RAISERROR) 
For the Table [tblCustomeer]
*/


/* =======================================
	SECTION 09: CREATING TRANSACTION
==========================================
*/

-- Created A Transaction Name [transferBalance]

-- It will Automatically Update Bank Account Balance when a transaction occur
-- Also It will check avaiable balance of the specific account before commit     transaction if account balance does not full fill the minumum balance then it will Rollback the transaction. 

CREATE PROC transferBalance @from INT,
                            @to INT,
                            @bonus MONEY
AS
BEGIN TRY
        BEGIN TRANSACTION
        UPDATE employeeSalary
        SET monthlySalary = monthlySalary + @bonus
        WHERE empID= @to
        
        UPDATE employeeSalary
        SET monthlySalary = monthlySalary - @bonus
        WHERE empID= @from
        COMMIT TRANSACTION
END TRY

BEGIN CATCH
        ROLLBACK TRANSACTION
END CATCH
GO
---*************************************************************************************************************
--======================================== END OF THE SCRIPT ===================================================
--**************************************************************************************************************