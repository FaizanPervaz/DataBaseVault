select * from emp;
select * from dept;

--1
SELECT top(1) DeptNo, avg(sal) as avgsal FROM emp 
Group by DeptNo Order by avgsal desc

--2
SELECT DeptNo,Count(EmpNo) as TotalEmp from emp 
Group by DEPTNO having Count(EmpNo)>2

--3
SELECT DeptNo,ename
from emp e1
where sal = (SELECT max(sal)
			from emp e2
			where e2.DeptNo = e1.DeptNo)
order by DeptNo asc;

--4
SELECT DeptNo,EMPNO,EName
from emp e1
where sal > (SELECT avg(sal)
			from emp e2
			where e2.DeptNo = e1.DeptNo);

--5
Select e1.* 
from emp e1 
join (select job from emp where sal in 
		(select max(sal) from emp group by deptno)) e2 on e1.job=e2.job
order by deptNo;

--6
SELECT D1.DName, avg(E1.sal), COUNT(E1.EmpNo) as NoEmp
from emp E1
join DEPT D1 on E1.DeptNo = D1.DeptNo
group by D1.DName;

