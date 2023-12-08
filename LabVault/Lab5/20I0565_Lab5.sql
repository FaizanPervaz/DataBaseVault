--20I0565 Faizan Pervaz Section A
--1
select CONCAT(lastName,' , ',designation) as 'Employee and Title' 
from Employees

--2
select lastName,salary 
from Employees
where salary>1500;

--3
select empid,firstName,mgr
from Employees
order by empid ASC, mgr DESC;

--4
select *
from Employees
where mgr is NULL;

--5
select lastName,designation,hireDate 
from Employees
where lastName='Potter' OR lastName='Ford'
order by hireDate ASC;

--6
select lastName,designation,deptNo
from Employees
where designation='CLERK'
order by lastName;

--7
select lastName, hireDate
from Employees
where Year(hireDate)=1981;

--8
select *
from Employees
where Year(hireDate) between 1980 and 1982
order by hireDate;



















































