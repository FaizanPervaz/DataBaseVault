--Faizan Pervaz
--20I0565

--Query 1
select e1.ENAME,e1.HIREDATE,e2.HIREDATE
from EMP e1
INNER JOIN EMP e2 on e1.HIREDATE>e2.HIREDATE
where e2.ENAME='SMITH';

--Query 2
select E1.ENAME as 'EMPLOYEE',E1.EMPNO as 'EMP#',E1.HIREDATE, E2.ENAME as 'Manager Name', E1.MGR as 'Mgr#', E2.HIREDATE 
from EMP E1 
JOIN EMP E2 on E1.MGR=E2.EMPNO
where E1.HIREDATE>E2.HIREDATE;

--Query3
select E1.ENAME,E1.DEPTNO,D1.DNAME
from EMP E1
JOIN  DEPT D1 on E1.DEPTNO=D1.DEPTNO
ORDER BY D1.DEPTNO;

--Query 4
select E1.ENAME as 'EMPLOYEE',E1.EMPNO as 'EMP#',E2.ENAME as 'Manager', E1.MGR as 'Mgr#'
from EMP E1 
JOIN EMP E2 on E1.MGR=E2.EMPNO;

--QUery 5 with Manager as MGR# Not Manager Job
--select DISTINCT(E2.ENAME) as 'Manager', E1.MGR as 'Mgr#',E2.DEPTNO, D1.DNAME
--from EMP E1 
--JOIN EMP E2 on E1.MGR=E2.EMPNO 
--JOIN DEPT D1 on E1.DEPTNO=D1.DEPTNO;

--Query 5
select E1.ENAME,D1.DNAME
from EMP E1
JOIN  DEPT D1 on E1.DEPTNO=D1.DEPTNO
where E1.JOB='MANAGER';
