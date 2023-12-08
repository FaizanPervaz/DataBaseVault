CREATE TABLE TestTable (
    id INT,
    name VARCHAR(50),
    age INT
);

--Insertion Procedure
CREATE or ALTER PROCEDURE InsertData
	@id int,
	@name varchar(50),
	@age int
as 
begin 
Insert into TestTable Values (@ID,@name,@age);
end

exec InsertData @id = 3, @name = 'Shahnawaz', @age = 27;

--Display Procedure
Create Procedure DisplayData
as 
begin 
Select * from TestTable;
end

exec DisplayData;

--Function
Create or Alter Function getName(@id int)
returns varchar(20)
as 
begin 
Return (Select top 1 name from TestTable where id=@id)
end 

select dbo.getName(4);

--Triggers
Create or Alter Trigger Inserted 
on TestTable
after insert,update
as 
begin 
	if (select count(*) from TestTable as t inner join inserted i on t.id = i.id)>1
	rollback
	else
	print 'Success'
end	


