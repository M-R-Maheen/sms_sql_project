
/*							
							SQL Project Name : School Management Systems (SMS_DB)
							     Trainee Name: MD. Mamunur Roshid
								   Trainee ID: 1269760
								     Batch ID: ESAD-CS/PNTL-A/51/01
								      Project Submission Date: 07/06/2022
																												*/
---//////////////////////////////////////////////////////////////////////////////////////////////////////////
/*---DML:
					
					=> Data Select
					=> CASE
					=> CTE
					=> MERGE
					=> Grouping SETS
					=> ROLLUP
					=> CUBE
					=> JOIN Query
					=> SubQuery(Inner SubQuery, Co-related SubQuery)
					=> Aggregate Function
					=> Nullability Function
					=> Built-in Function
					=> UNIQUEIDENTIFIER
					=> Break IDENTITY
					=> USE NEWID
					=> Current Date Time
					=> CAST- CONVERT
					=> TRY....CATCH
					=> IF...ELSE
					=> LOOP(While LOOP)
					=> GOTO
					=> WAITFOR
					=> SELECT INTO
					=> Test Trigger
					=> Test View
					=> Test UDF
					=> Test SP
					=> Data Insert(Via SP)
					=> Data Update(Via SP)
					=> Data Delete(Via SP)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/
--=======================================     START OF DML SCRIPT     =========================================--

USE SMS_DB
GO

SELECT * FROM school
SELECT * FROM [status]
SELECT * FROM grades
SELECT * FROM city
SELECT * FROM parent
SELECT * FROM students
SELECT * FROM teachers
SELECT * FROM classRoom
SELECT * FROM classRoomDetails
SELECT * FROM classRoomStudent
SELECT * FROM department
SELECT * FROM humanity
SELECT * FROM commerce
SELECT * FROM science
SELECT * FROM attendance
SELECT * FROM examType
SELECT * FROM exam
SELECT * FROM examResult

SELECT * FROM employees
SELECT * FROM employeeSalary
SELECT * FROM cities
---================================
-- Data Insert In examType Table
---================================
INSERT INTO school VALUES
	('Sher-e-Bangla High school','Sher-e-Bangla Nagar',01707898989),
	('Dhanmondi Model High school','Dhanmondi',01707898988),
	('Kallyanpur High school','Kallyanpur',01707898980),
	('Monipuri High school','Monipur',01707898944),
	('Moni-Kanon High school','Mirpur-1',01707898911)
GO
select * from school
GO

---================================
--  Insert Data In [status] Table
---================================
INSERT INTO [status] VALUES
('Full Time'),
('Part Time'),
('Limited Time')
GO

---================================
--  Insert Data In grades Table
---================================
INSERT INTO grades VALUES
	('A+'),
	('A'),
	('A-'),
	('B'),
	('C'),
	('D'),
	('F')
GO

---================================
--  Insert Data In city Table
---================================
INSERT INTO city VALUES
						('Dhaka'),
						('Chittagong'),
						('Barisal'),
						('Rajshahi'),
						('Comilla'),
						('Rangpur'),
						('Mymenshing'),
						('Shylet')
GO						
select * from city 
GO

---================================
--  Insert Data In parent Table
---================================
INSERT INTO parent VALUES	
	('Mamunur Roshid','1980-01-01', 'mamunur@gmail.com',01707528448,'Mohammadpur',DEFAULT,DEFAULT,1234567890),
	('Ahmed Roshid','1984-05-05', 'ahmed@gmail.com',01707528478,'Kallyanpur',3,DEFAULT,1234567891),
	('Roshid Ahmed ','1984-05-05', 'ahmed@gmail.com',01707528478,'Panam Nagar',2,DEFAULT,1234567893),
	('Ahmed Khaja','1984-05-05', 'ahmed@gmail.com',01707528478,'Arsi Nagar',4,DEFAULT,1234567894),
	('Sahin Hasan','1984-05-05', 'ahmed@gmail.com',01707528478,'Panam Nagar',1,DEFAULT,1234567895)
GO

---================================
--  Insert Data In students Table
---================================
INSERT INTO students VALUES	
	('Khan','1980-01-01', 'mamunur@gmail.com',01707528448,'Mohammadpur',DEFAULT,DEFAULT,Default,1234567899,1),
	('Roshid','1980-01-01', 'mamunur@gmail.com',01707528448,'Mohammadpur',DEFAULT,DEFAULT,Default,1234567891,2),
	('Jamal','1980-01-01', 'mamunur@gmail.com',01707528448,'Mohammadpur',DEFAULT,DEFAULT,Default,1234567892,2),
	('Ali Hasan','1980-01-01', 'mamunur@gmail.com',01707528448,'Mohammadpur',DEFAULT,DEFAULT,Default,1234567893,3)
GO

---================================
--  Insert Data In teachers Table
---================================
INSERT INTO teachers VALUES	
	('Sadia Jahan','1980-01-01','Female',01407528440,'2021-05-07','ali@gmail.com',Default,2,DEFAULT,DEFAULT,1,1234567897),
	('khan','1980-01-01',DEFAULT,01407528441,'2022-05-02','khan@gmail.com','Shyamoli',1,1,DEFAULT,1,1234567896),
	('Ali hasan','1980-01-01',DEFAULT,01707528442,'2021-05-07','ali@gmail.com',Default,2,2,DEFAULT,1,1234567895),
	('Ali','1980-01-01',DEFAULT,01707528449,'2021-05-07','ali@gmail.com',Default,2,DEFAULT,DEFAULT,1,1234567894),
	(' Jahan','1980-01-01',DEFAULT,01707528444,'2022-05-02','khan@gmail.com','Shyamoli',1,1,DEFAULT,1,1234567893),
	('Solil Ahmed','1980-01-01',DEFAULT,01707528449,'2021-05-07','ali@gmail.com',Default,2,2,DEFAULT,1,1234567892)
GO

---================================
--  Insert Data In classRoom Table
---================================
INSERT INTO classRoom VALUES
	('Class 06'),
	('Class 07'),
	('Class 08'),
	('Class 09'),
	('Class 10')
GO

---========================================
--  Insert Data In ClassRoomDetails Table
---========================================
INSERT INTO ClassRoomDetails VALUES	
------- Class- 06
	(1,'2022-01-01','Section-A','Students Perfomences is very Good',1),
	(1,'2022-01-01','Section-A','Students Perfomences is very Good',1),
	(1,'2022-01-01','Section-A','Students Perfomences is very Good',1),
	(1,'2022-01-01','Section-A','Students Perfomences is very Good',1),
	(1,'2022-01-01','Section-A','Students Perfomences is very Good',1),
	------ Class 07
	(2,'2022-01-01','Section-B','Students Perfomences is very Good',2),
	(2,'2022-01-01','Section-B','Students Perfomences is very Good',2),
	(2,'2022-01-01','Section-B','Students Perfomences is very Good',2),
	(2,'2022-01-01','Section-B','Students Perfomences is very Good',2),
	(2,'2022-01-01','Section-B','Students Perfomences is very Good',2),
	------ Class- 08
	(3,'2022-01-01',DEFAULT,'Students Perfomences is very Good',3),
	(3,'2022-01-01',DEFAULT,'Students Perfomences is very Good',3),
	(3,'2022-01-01',DEFAULT,'Students Perfomences is very Good',3),
	(3,'2022-01-01',DEFAULT,'Students Perfomences is very Good',3),
	(3,'2022-01-01',DEFAULT,'Students Perfomences is very Good',3),
	------Class- 09
	(4,'2022-01-01','Section-B','Students Perfomences is very Good',4),
	(4,'2022-01-01','Section-B','Students Perfomences is very Good',4),
	(4,'2022-01-01','Section-B','Students Perfomences is very Good',4),
	(4,'2022-01-01','Section-B','Students Perfomences is very Good',4),
	(4,'2022-01-01','Section-B','Students Perfomences is very Good',4),
	------ Class- 10
	(5,'2022-01-01',DEFAULT,'Students Perfomences is very Good',5),
	(5,'2022-01-01',DEFAULT,'Students Perfomences is very Good',5),
	(5,'2022-01-01',DEFAULT,'Students Perfomences is very Good',5),
	(5,'2022-01-01',DEFAULT,'Students Perfomences is very Good',5),
	(5,'2022-01-01',DEFAULT,'Students Perfomences is very Good',5)
GO
select * from ClassRoomDetails 
GO
---======================================
--  Insert Data In ClassRoomStudent Table
---======================================
INSERT INTO ClassRoomStudent VALUES
	(1,7),
	(2,8),
	(3,9),
	(4,10)
GO

SELECT * FROM ClassRoomStudent
GO


---===================================
--  Insert Data In department Table
---===================================
INSERT INTO department VALUES
	('humanity'),
	('commerce'),
	('science')
GO

SELECT * FROM department
GO

---===================================
--  Insert Data In humanity Table
---===================================
INSERT INTO humanity VALUES
	('Bangla ',1),
	('English ',1),
	('General Math',1),
	('General Sciences',1),
	('Econmics',1),
	('Sociology',1),
	('Islamic Studies',1),
	('History',1),
	('Geography',1)
GO
SELECT * FROM humanity
SELECT * FROM department
GO

---===================================
--  Insert Data In commerce Table
---===================================
INSERT INTO commerce VALUES
	('Bangla',2),
	('English',2),
	('General Math',2),
	('Accounting',2),
	('Management',2),
	('Banking',2)
GO
SELECT * FROM commerce
GO

---===================================
--  Insert Data In science Table
---===================================
INSERT INTO science VALUES
	('Bangla',3),
	('English',3),
	('General Math',3),
	('Social Sciences',3),
	('Chemistry',3),
	('Biology',3),
	('Higher Maths',3),
	('Phisics',3)
GO
SELECT * FROM science
GO

---================================
--  Insert Data In attendance Table
---================================
INSERT INTO attendance VALUES
	('2022-01-01',1,'Full Time'),
	('2022-01-01',2,'Full Time'),
	('2022-01-01',3,'Full Time'),
	('2022-01-01',4,'Full Time')
GO
SELECT * FROM attendance
GO
INSERT INTO examType VALUES
	('Monthly ', 'Monthly Examination'),
	('Mid Term', 'Mid Term Or Half Yearly Examination'),
	('Final'   , 'Yearly Eaxamination')
GO
SELECT * FROM examType
GO
---================================
-- Data Insert In exam Table
---================================
INSERT INTO exam VALUES
	(1,'First ','2022-02-25'),
	(1,'Second','2022-02-26'),
	(1,'Third','2022-02-27'),
	(1,'Fourth','2022-02-28'),
	------ Mid term
	(2,'First','2022-06-15'),
	(2,'Second','2022-06-17'),
	(2,'Third','2022-06-18'),
	(2,'Fourth','2022-06-19'),
	(2,'Fifth','2022-06-20'),
	(2,'sixth','2022-06-25'),
	----- Final
	(3,'First','2022-11-25'),
	(3,'Second','2022-11-26'),
	(3,'Third','2022-11-27'),
	(3,'Fourth','2022-11-28'),
	(3,'Fifth','2022-12-29'),
	(3,'sixth','2022-12-30')
GO
SELECT * FROM exam
GO

---================================
-- Data Insert In examResult Table
---================================
INSERT INTO examResult VALUES 
	(1,1,5.00),
	(2,2,4.00),
	(3,3,3.50),
	(4,4,3.00)
GO
select * from examResult
GO

--- ===========================================================================================================
	    ---------------             EMPLOYEES SALARY MANAGEMENT           -----------------------------
--===========================================================================================================
INSERT INTO empDepartment
VALUES
    ('Adies Principal',1),
    ('Accounts',1),
    ('Teachers',15),
    ('Asst.Teacher',5),
    ('Nurse',3)
GO

select * from  empDepartment



INSERT INTO employees VALUES
	('Jarima Hasan', 'Female','1980-02-09',01909787898,'2013-09-09','karima@gmail.com','Chittagong',Default,Default,1234566548,2,1),
	('Karima','Female','1981-02-01',01909787898,'2013-09-09','karima@gmail.com','Chittagong',Default,Default,1234566543,2,1),
	('A.K. Khan', Default,'1989-02-06',01909787898,'2022-05-09','karima@gmail.com',Default,Default,Default,1234566599,1,1),
	('Mamunur', Default,'1988-02-09',01909787898,'2013-09-09','karima@gmail.com',Default,Default,Default,1234566581,1,1),
	('Hasan', Default,'1980-02-09',01909787898,'2013-09-09','karima@gmail.com',Default,Default,Default,1234566578,1,1)
GO
select * from employees
GO

---================================
-- Data Insert In employeeSalary Table  
---================================
INSERT INTO salary VALUES
						 (1,1,50000.00,'Sun'),
						 (2,2,97800.00,'Mon'),
						 (3,3,90000.00,'Tue'),
						 (4,4,80000.00,'Wed'),
						 (5,5,80000.00,'Thr')
GO
select * from salary
GO




---====================================
-- Data Insert In employeeSalary Table  
---====================================
INSERT INTO employeeSalary VALUES 
	(1,'Aides Principal',50000.00,25000.00),
	(2,'Accountant',25000.00,12500.00),
	(3,'Teacher',30000.00,15000.00),
	(4,'Nurses',10000.00,5000.00)
GO
SELECT * FROM employeeSalary
GO
----====================================================================================================

----------------------------------------
----  Data insert into cities table ---
----------------------------------------
INSERT INTO  cities VALUES
	('Dhaka'),
	('Abu Dhabi'),
	('Delhi'),
	('Tokio'),
	('New Work'),
	('Welington')
GO
SELECT * FROM cities
GO

---===============================
---inser data in watehouse table
---===============================
INSERT INTO warehouse VALUES('WH',1,'Shari',120)
INSERT INTO warehouse VALUES('WH',2,'Ties',1)
INSERT INTO warehouse VALUES('WH',3,'Shocks',33)
INSERT INTO warehouse VALUES('WH',4,'Jersey',17)
GO
SELECT * FROM warehouse
GO
---===============================
---inser data in shop table
---===============================
INSERT INTO shop VALUES('SP',1,'Shari',NULL,NULL)
INSERT INTO shop VALUES('SP',2,'Ties',NULL,NULL)
INSERT INTO shop VALUES('SP',4,'Jersey',NULL,NULL)
INSERT INTO shop VALUES('SP',7,'Belts',NULL,NULL)
GO
SELECT * FROM shop
GO
---**************************
--Inserting data using view
--***************************
INSERT INTO V_employees VALUES
		('Sanam Khan','Female','1990-09-09',01707528440,'2023-01-12','sanam@gmail.com',DEFAULT,DEFAULT,DEFAULT,3434343434,1,2)
GO
SELECT * FROM V_employees
GO
--****************************************
--inserting data through stored procedure
---***************************************
		EXEC sp_InsertEmployees 'Shakib',Default,'1980-09-09',01707898998,'shakib@gmail.com','Chittagong',Default,Default,'9876543211',2,1
		EXEC sp_InsertEmployees 'Atiqur',Default,'1980-09-09',01707898998,'atiq@gmail.com','Chittagong',Default,Default,9876543212,1,1
-----========================================================================================================================
SELECT * FROM employees
GO
--simple query
SELECT * FROM employeeSalary
GO

--JOIN QUARY TO FIND OUT EMPLOYEE DETAILS
SELECT * FROM employeeSalary as es
JOIN employees as emp  ON es.empID = emp.empID
WHERE  es.empID = 1 
 

/*========================================================== 
JOIN QUERY WITH AGGREGATE FEILD WITH GROUP BY,ORDERBY CLAUSE
           TO FIND OUT EMPLOYEE WISE BONUS WITH TOTAL SALARY        
============================================================*/
			
SELECT emp.empID,SUM(es.monthlySalary+es.bonus) 'Bonus With Total Salary' FROM employees emp
JOIN employeeSalary es ON es.empID = emp.empID
GROUP BY emp.empID
ORDER BY emp.empID DESC
GO


--Nullability Constraint

CREATE TABLE contact
(
	id INT NOT NULL,
	[name] VARCHAR(30)
)
GO
INSERT INTO contact(id,name) VALUES(1,'Zinat Ara')
GO
SELECT * FROM contact
GO
--IDENTITY

CREATE TABLE tblIdentityTest
(
	id INT IDENTITY NOT NULL,
	name VARCHAR(45) NULL
)
GO
INSERT INTO tblIdentityTest(name) VALUES('Zinat Khaa')
INSERT INTO tblIdentityTest(name)  VALUES('Atiqul Khan')
INSERT INTO tblIdentityTest(name)  VALUES('Zahir Ahmed')
GO
SELECT * FROM tblIdentityTest
GO

-----break IDENTITY
SET IDENTITY_INSERT tblIdentityTest ON
INSERT INTO tblIdentityTest(id, name) VALUES(924,'Yeasin')
SET IDENTITY_INSERT tblIdentityTest OFF
GO
INSERT INTO tblIdentityTest(name) VALUES('Kamal Hossain')
GO
select * from tblIdentityTest
GO
--UNIQUE IDENTIFIER
CREATE TABLE tblIdentityTest2
(
	id UNIQUEIDENTIFIER NOT NULL,
	name VARCHAR(30)
)
GO
INSERT INTO tblIdentityTest2(id,name) VALUES(NEWID(),'Mamunur Roshid')
INSERT INTO tblIdentityTest2(id,name) VALUES(NEWID(),'Shakib Al Hassan')
GO
SELECT * FROM tblIdentityTest2
GO
SELECT LEN(name) 'Length' FROM tblIdentityTest
SELECT GETDATE() as Today
GO
---=======================================================
--SUBQUERY TO FIND OUT THE STUDENTS WHO STYDY IN CLASS 06
---========================================================
SELECT * FROM students s
JOIN ClassRoomStudent crs ON s.studentName = crs.studentID
JOIN classRoom cr ON crs.classRoomID = cr.classRoomID
WHERE cr.classRoomID =(SELECT s.studentID FROM students WHERE s.studentID= 1)
GO

--=================================================================================================================
--USING ROLLUP IN QUERY WITH HAVING CLAUSE TO FIND OUT THE EMPLOYEE  SALARY SALARY & BONUS WHO HAVE LESS THAN 30000 THOUSAND
---=================================================================================================================

SELECT top 5 PERCENT emp.empID,COALESCE(emp.empName,'Hasan') as empName, SUM(monthlySalary + Bonus) AS [Bonus With Monthly Salary]
FROM employeeSalary es
JOIN employees emp ON es.empID=emp.empId
GROUP BY ROLLUP (emp.empID,emp.empName)
HAVING SUM(monthlySalary + Bonus) <=50000
GO
Select * from employeeSalary
GO

-- USING  " SEARCHED CASE FUNCTION " TO FIND OUT THE SSTUDENTS WHO HAVE PASSED OR FAIL IN THE EXAMINATION
SELECT gradeID, grade,
	CASE
		WHEN grade = 'A+'
			THEN 'Congratulation !! "You Got GPA 5"'
		WHEN grade = 'A'
			THEN 'Congratulation !! "You Got 4.00 " '
		WHEN grade = 'A-'
			THEN 'Congratulation !! "You Got 3.50"'
		WHEN grade = 'B'
			THEN 'Congratulation !! "You Got GPA 3.00"'
		WHEN grade = 'C'
			THEN 'Congratulation !! "You Got GPA 2.50"'
		WHEN grade = 'D'
			THEN 'Congratulation !! "You Got GPA 2.00"'
		ELSE 'Sorry !! You are Fail'
	END AS 'Result'
FROM grades

---************************** COMMON TABLE EXPRESSION  (CTE)  **********************************************
WITH myCTE AS
(
		SELECT emp.empID,SUM(es.monthlySalary+es.bonus) 'Bonus With Total Salary' FROM employees emp
		JOIN employeeSalary es ON es.empID = emp.empID
		GROUP BY emp.empID
		ORDER BY emp.empID DESC
		GO
)
SELECT * FROM myCTE
GO

--------- Merge --------------------

--------------------------------------- USE AGGRIGATE FUNCTION WITH JOIN QUERY ------------------------------------

SELECT es.empID, 
(
	SELECT MIN(es.monthlySalary) FROM employees e
	WHERE es.empID=e.empID
)
AS OrderDate
FROM employeeSalary es
INNER JOIN employees e ON es.empID = e.empID
GO

---MIN 
SELECT DISTINCT e.empID, e.empName,  MIN(monthlySalary) 'Minimum Monthly Salary' FROM employeeSalary es
INNER JOIN employees e ON es.empID = e.empID
GROUP BY e.empID, e.empName
HAVING e.empID >=1


---AVG
SELECT DISTINCT empID,  AVG(monthlySalary) AS 'AVG Monthly Salary' FROM employeeSalary es
GROUP BY empID

---COUNT
SELECT DISTINCT empID,  COUNT(monthlySalary) AS 'COUNT Monthly Salary' FROM employeeSalary es
GROUP BY empID

---MAX
SELECT DISTINCT empID,  MAX(monthlySalary) AS 'MAXIMUM Monthly Salary' FROM employeeSalary
GROUP BY empID

---SUM
SELECT empID,  SUM(bonusWithMonthlySalary) AS 'SUM Monthly Salary' FROM employeeSalary 
GROUP BY empID

---================================= ISNULL, CAST   ===============================================

SELECT es.empID,es.empType,es.monthlySalary,es.bonus, 
ISNULL(CAST((SELECT COUNT(bonusWithMonthlySalary) as 'Count bonusWithMonthlySalary' FROM employees e
	WHERE es.empID =e.empID) AS VARCHAR),'Never Bonus') AS bonusWithMonthlySalary
FROM employeeSalary es
GROUP BY es.empID,es.empType,es.monthlySalary,es.bonus,es.bonusWithMonthlySalary,eS.empID
GO
--===========================================================================
-- Count Row number
SELECT teacherID,teacherName,
ROW_NUMBER() OVER (ORDER BY teacherName) as [ROW_NUMBER]
FROM teachers
GO

-- Rank & Dencse_Rank
SELECT e.empID,e.empName,monthlySalary, 
RANK() OVER(ORDER BY e.empName) as [RANK],
DENSE_RANK() OVER(ORDER BY e.empName) as [DENSE_RANK]
FROM employeeSalary es
JOIN employees e ON es.empID = e.empID

select * from employeeSalary
GO



-- & Partition,Rank & Dencse_Rank 
SELECT e.empID,e.empName,e.gender, 
RANK() OVER(PARTITION BY e.gender ORDER BY e.empName) as  [Partition],
DENSE_RANK() OVER(ORDER BY e.empName) as DENSE_RANK
FROM employeeSalary es
JOIN employees e ON es.empID = e.empID

-- NTILE
SELECT e.empID,e.empName,es.monthlySalary,
NTILE(2) OVER(ORDER BY e.empName) as 'NTILE'
FROM employeeSalary es
JOIN employees e ON es.empID = e.empID
GO
--******************* IF *********************
DECLARE @site_value INT
SET @site_value=20

IF @site_value<18
	PRINT 'You are bellow 18'
ELSE
BEGIN
	IF @site_value>=30
		PRINT 'You are adult'
	ELSE
		PRINT 'Your age is not valid'

END
GO

--*******************  NESTED IF  *********************
DECLARE @totalMarks INT
SET @totalMarks=650

IF @totalMarks>=900
	BEGIN
		PRINT 'Congratulations!!'
		PRINT 'You are eligible for full scholarship!!'
	END
ELSE IF @totalMarks>=800
	BEGIN
		PRINT 'Congratulations!!'
		PRINT 'You are eligible for 50% scholarship!!'
	END
ELSE IF @totalMarks>=750
	BEGIN
		PRINT 'Congratulations!!'
		PRINT 'You are eligible for 30% scholarship!!'
	END
ELSE IF @totalMarks>=650
	BEGIN
		PRINT 'Congratulations!!'
		PRINT 'You are eligible for 10% scholarship!!'
	END
ELSE
	BEGIN
		PRINT 'You are not eligible for scholarship!!'
		PRINT 'We are really sorry for you!!!'
		PRINT 'Please try to better!!'
	END
GO

-- ============================  
-- WHILE LOOP DESC  (1 TO 10 ) 
--=============================
DECLARE @val INT
SET @val =10

WHILE @val > 0 
	BEGIN
		PRINT  @val
		SET @val=@val -1
	END
GO

-- ===========================  
-- WHILE LOOP ASC (1 TO 10 ) 
=============================
DECLARE @val INT
SET @val =1

WHILE @val <=10 
	BEGIN
		PRINT  @val
		SET @val=@val +1
	END
GO

--*******************   WHILE LOOP  & BREAK LOOPING AFTER 5TH *********************
DECLARE @val INT
SET @val=1

WHILE @val<=100 
	BEGIN
		PRINT @val
		IF(@val=15)
			BREAK
		SET @val=@val+1
	END
GO

--*****************************************  GOTO
DECLARE @Marks INT
SET @Marks= 50

IF @Marks>= 60
	GOTO Pass
IF @Marks < 60
	GOTO Fail
Pass:
	PRINT 'Congratulation'
	PRINT 'You passed in the examination of IsDB-BISEW Programme. You got more than 60 % Marks'
	RETURN
Fail:
	PRINT 'You Failed'
	PRINT 'You Failed in the examination of IsDB-BISEW Programme.You got less than 60 % Marks'
	PRINT 'Better luck next time'
	RETURN
GO
--************************************* WAITFOR OR DELAY
SELECT GETDATE() CurrentTime
WAITFOR DELAY '00:00:05'
---************************************  CURRENT DATE & TIME
SELECT GETDATE() CurrentTime
GO
--************************************* TRY CATCH
BEGIN TRY
	SELECT 10/0
END TRY
BEGIN CATCH
	PRINT 'Error Occured!!'
END CATCH
GO

BEGIN TRY
	DECLARE @val INT
	SET @val=1

	WHILE @val<=10
		BEGIN
			PRINT @val
			IF(@val=5)
				BREAK
			SET @val=@val/0
		END
END TRY
BEGIN CATCH
	PRINT 'Error'
END CATCH
---++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--Marge
SELECT * FROM warehouse
SELECT * FROM shop
GO

MERGE shop as tgt
USING warehouse as src
--Run matching logic
ON tgt.productId=src.productId
WHEN MATCHED 
--Product is in warehouse and on shop 
THEN
	UPDATE SET updateTime=GETDATE(),comments='Product in stock warehouse and shop'
WHEN NOT MATCHED
THEN
	INSERT (location,productId,productName,updateTime,comments)
	VALUES ('WH_to_SH',src.productId,src.name,GETDATE(),'Move product from warehouse to shop')
WHEN NOT MATCHED BY SOURCE
THEN
	UPDATE SET updateTime=GETDATE(),comments='Last unit available in shop';

GO

--Check for view
SELECT * FROM V_employees
GO

--Check for stored procedure
EXEC sp_employees
GO

DECLARE @ID INT
EXEC @ID= sp_InsertEmployeesWithReturn 'Jarima Hasan', 'Female','1980-02-09',01909787898,'2013-09-09','karima@gmail.com','Chittagong',Default,Default,1234566002,2,1
PRINT 'New Employee With Id : '+STR(@ID)
GO

--==================================================   04 FUNCTIONS   =========================================================--
--===============================================================================================================================
--TEST FOR SCALAR VALUED FUNCTION for calculating MONTHLY SALARY & BONUS 
		SELECT dbo.fn_EmployeeSalary(2018,09) AS [bonus with monthlySalary]
		GO

--TEST FOR SCALAR VALUED FUNCTION TO CALCULATING BONUS WITH MONTHLY SALARY
		SELECT DBO.fn_monthlySalaryEveryEmployee(1) AS 'bonus with monthly salary'
		GO

--TEST FOR "AFTER TRIGGER" THAT DOES NOT LET TO DELETE ANY DATA FROM ORDERS TABLE
		DELETE FROM employees
		WHERE empID=1
		GO

--TEST FOR AFTER TRIGGER TO INSERT DATA--

INSERT INTO employees VALUES('New Hasan', Default,'1980-02-09',01909787898,'2013-09-09','karima@gmail.com',Default,Default,Default,9934566578,1,1)
INSERT INTO employees VALUES('Hasan', Default,'1980-02-09',01909787898,'2013-09-09','karima@gmail.com',Default,Default,Default,1234566999,1,1)
GO


--TEST TRIGGERS FOR DELETE DATA
DELETE FROM employees 
WHERE empID =7
GO

--TEST TRIGGERS FOR UPDATE DATA
UPDATE employeeSalary
SET bonus= 12500.00
WHERE empID=4
GO

--TEST DELETE DATA 
DELETE FROM employeeSalary
WHERE empID=3
GO


