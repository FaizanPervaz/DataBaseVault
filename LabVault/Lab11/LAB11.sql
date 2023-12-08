--1st 
Create or alter Procedure MinAvgSal
as 
begin 
	SELECT top 1 DEPTNAME, avg(sal) as avgsal FROM emp 
	Group by DEPTNAME Order by avgsal asc;
end

exec MinAvgSal;

select * from emp;
--2nd
Create or alter Procedure SalaryFind @DEPTNAME varchar(50), @SAL int
as 
begin 
	SELECT DEPTNAME,DeptNo,EMPNO,EName,SAL
	from emp e1
	where sal < @SAL AND e1.DEPTNAME = @DEPTNAME;
end

exec SalaryFind @DEPTNAME = 'SALES', @SAL = 2000;

--3rd
CREATE OR ALTER TRIGGER Create_Table_Trigger
ON DATABASE
FOR CREATE_TABLE
AS 
BEGIN
    PRINT 'Table has been created successfully.';
END;

create table dummy(sample varchar(30));
create table ashraf(sample varchar(30));


--4th 

create table LogTable(Activity varchar(30),LogDate DATETIME);
create table DUMDAT(id int);

CREATE or ALTER TRIGGER LogInserts
ON DUMDAT
AFTER INSERT
AS
BEGIN
    INSERT INTO LogTable (Activity, LogDate)
    VALUES ('DATA IS INSERTED', getDATE());
END;

Insert into DUMDAT Values (1);

SELECT * from LogTable;

--5th
CREATE or ALTER FUNCTION SALSUM (@DEPTNAME varchar(50))
returns int
AS
BEGIN
	RETURN (SELECT SUM(SAL)
    FROM EMP as e
    WHERE DEPTNAME = @DEPTNAME);

END;

select dbo.SALSUM ('SALES');
