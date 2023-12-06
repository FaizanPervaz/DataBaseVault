--20I0565 20I0879
--1
-- Weekly View
SELECT DISTINCT S.SName, E.CourseId
FROM STUDENT S
JOIN ENROLLS E ON S.Rollno = E.Rollno
JOIN COURSE C ON E.CourseId = C.CourseId
JOIN COLLEGE COL ON C.CollegeId = COL.CollegeId
WHERE COL.CName = 'College Edwrd'
AND DATEPART(WEEK, E.DateEnrolled) = DATEPART(WEEK, GETDATE());

-- Monthly View
SELECT DISTINCT S.SName, E.CourseId
FROM STUDENT S
JOIN ENROLLS E ON S.Rollno = E.Rollno
JOIN COURSE C ON E.CourseId = C.CourseId
JOIN COLLEGE COL ON C.CollegeId = COL.CollegeId
WHERE COL.CName = 'College Edwrd'
AND MONTH(E.DateEnrolled) = MONTH(GETDATE());

-- Daily View
SELECT DISTINCT S.SName, E.CourseId
FROM STUDENT S
JOIN ENROLLS E ON S.Rollno = E.Rollno
JOIN COURSE C ON E.CourseId = C.CourseId
JOIN COLLEGE COL ON C.CollegeId = COL.CollegeId
WHERE COL.CName = 'College Edwrd'
AND CAST(E.DateEnrolled AS DATE) = CAST(GETDATE() AS DATE);

--2 
-- Weekly View
SELECT DISTINCT C.CName AS CourseName, COL.CName AS CollegeName
FROM COURSE C
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
JOIN COLLEGE COL ON C.CollegeId = COL.CollegeId
WHERE D.DName = 'Social Sciences'
AND DATEPART(WEEK, C.DateOffered) = DATEPART(WEEK, GETDATE());

-- Monthly View
SELECT DISTINCT C.CName AS CourseName, COL.CName AS CollegeName
FROM COURSE C
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
JOIN COLLEGE COL ON C.CollegeId = COL.CollegeId
WHERE D.DName = 'Social Sciences'
AND MONTH(C.DateOffered) = MONTH(GETDATE());

-- Daily View
SELECT DISTINCT C.CName AS CourseName, COL.CName AS CollegeName
FROM COURSE C
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
JOIN COLLEGE COL ON C.CollegeId = COL.CollegeId
WHERE D.DName = 'Social Sciences'
AND CAST(C.DateOffered AS DATE) = CAST(GETDATE() AS DATE);

--3
-- Weekly View
SELECT DISTINCT S.SName AS StudentName, E.CourseId
FROM STUDENT S
JOIN ENROLLS E ON S.Rollno = E.Rollno
JOIN COURSE C ON E.CourseId = C.CourseId
WHERE C.CName = 'Course5'
AND DATEPART(WEEK, E.DateEnrolled) = DATEPART(WEEK, GETDATE());

-- Monthly View
SELECT DISTINCT S.SName AS StudentName, E.CourseId
FROM STUDENT S
JOIN ENROLLS E ON S.Rollno = E.Rollno
JOIN COURSE C ON E.CourseId = C.CourseId
WHERE C.CName = 'Course1'
AND MONTH(E.DateEnrolled) = MONTH(GETDATE());

-- Daily View
SELECT DISTINCT S.SName AS StudentName, E.CourseId
FROM STUDENT S
JOIN ENROLLS E ON S.Rollno = E.Rollno
JOIN COURSE C ON E.CourseId = C.CourseId
WHERE C.CName = 'Course1'
AND CAST(E.DateEnrolled AS DATE) = CAST(GETDATE() AS DATE);

--4
-- For Courses
SELECT DISTINCT C.CName AS CourseName, COL.CName AS CollegeName
FROM COURSE C
JOIN COLLEGE COL ON C.CollegeId = COL.CollegeId
WHERE C.DateOffered BETWEEN '2023-11-01' AND '2023-11-30';

-- For Faculty Assignments
SELECT DISTINCT F.FName AS FacultyName, D.DName AS DepartmentName, COL.CName AS CollegeName
FROM FACULTY F
JOIN ASSIGNED A ON F.FacultyId = A.FacultyId
JOIN COURSE C ON A.CourseId = C.CourseId
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
JOIN COLLEGE COL ON C.CollegeId = COL.CollegeId
WHERE A.DateAssigned BETWEEN '2023-11-01' AND '2023-11-30'; 

--5
-- Weekly View
SELECT DISTINCT F.FName AS FacultyName, D1.DName AS Department1, D2.DName AS Department2
FROM FACULTY F
JOIN ASSIGNED A1 ON F.FacultyId = A1.FacultyId
JOIN COURSE C1 ON A1.CourseId = C1.CourseId
JOIN DEPARTMENT D1 ON C1.DepartmentId = D1.DepartmentId

JOIN ASSIGNED A2 ON F.FacultyId = A2.FacultyId
JOIN COURSE C2 ON A2.CourseId = C2.CourseId
JOIN DEPARTMENT D2 ON C2.DepartmentId = D2.DepartmentId

WHERE D1.DepartmentId <> D2.DepartmentId
AND (
    A1.DateAssigned <= DATEADD(WEEK, 1, A2.DateAssigned) 
    AND A2.DateAssigned <= DATEADD(WEEK, 1, A1.DateAssigned)
);

-- Monthly View
SELECT DISTINCT
    F.FName AS FacultyName,
    D1.DName AS Department1,
    D2.DName AS Department2
FROM FACULTY F
JOIN ASSIGNED A1 ON F.FacultyId = A1.FacultyId
JOIN COURSE C1 ON A1.CourseId = C1.CourseId
JOIN DEPARTMENT D1 ON C1.DepartmentId = D1.DepartmentId

JOIN ASSIGNED A2 ON F.FacultyId = A2.FacultyId
JOIN COURSE C2 ON A2.CourseId = C2.CourseId
JOIN DEPARTMENT D2 ON C2.DepartmentId = D2.DepartmentId

WHERE D1.DepartmentId <> D2.DepartmentId
AND (
    A1.DateAssigned <= DATEADD(MONTH, 1, A2.DateAssigned) 
    AND A2.DateAssigned <= DATEADD(MONTH, 1, A1.DateAssigned)
);


-- Daily View
SELECT DISTINCT
    F.FName AS FacultyName,
    D1.DName AS Department1,
    D2.DName AS Department2
FROM FACULTY F
JOIN ASSIGNED A1 ON F.FacultyId = A1.FacultyId
JOIN COURSE C1 ON A1.CourseId = C1.CourseId
JOIN DEPARTMENT D1 ON C1.DepartmentId = D1.DepartmentId

JOIN ASSIGNED A2 ON F.FacultyId = A2.FacultyId
JOIN COURSE C2 ON A2.CourseId = C2.CourseId
JOIN DEPARTMENT D2 ON C2.DepartmentId = D2.DepartmentId

WHERE D1.DepartmentId <> D2.DepartmentId
AND (
    A1.DateAssigned <= DATEADD(DAY, 1, A2.DateAssigned) 
    AND A2.DateAssigned <= DATEADD(DAY, 1, A1.DateAssigned)
);

--6
SELECT
    F.FacultyId,
    F.FName AS FacultyName,
    D.DName AS DepartmentName,
    COUNT(A.CourseId) AS AssignmentCount
FROM FACULTY F
JOIN ASSIGNED A ON F.FacultyId = A.FacultyId
JOIN COURSE C ON A.CourseId = C.CourseId
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
WHERE C.DateOffered >= DATEADD(WEEK, -1, GETDATE()) 
GROUP BY F.FacultyId, F.FName, D.DName;

-- Query for monthly assignments
SELECT
    F.FacultyId,
    F.FName AS FacultyName,
    D.DName AS DepartmentName,
    COUNT(A.CourseId) AS AssignmentCount
FROM FACULTY F
JOIN ASSIGNED A ON F.FacultyId = A.FacultyId
JOIN COURSE C ON A.CourseId = C.CourseId
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
WHERE C.DateOffered >= DATEADD(MONTH, -1, GETDATE()) 
GROUP BY F.FacultyId, F.FName, D.DName;

-- Query for daily assignments
SELECT
    F.FacultyId,
    F.FName AS FacultyName,
    D.DName AS DepartmentName,
    COUNT(A.CourseId) AS AssignmentCount
FROM FACULTY F
JOIN ASSIGNED A ON F.FacultyId = A.FacultyId
JOIN COURSE C ON A.CourseId = C.CourseId
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
WHERE C.DateOffered >= DATEADD(DAY, -1, GETDATE())
GROUP BY F.FacultyId, F.FName, D.DName;


--7
-- Query for faculty members with the most weekly assignments in specific departments
SELECT TOP 1 WITH TIES
    F.FacultyId,
    F.FName AS FacultyName,
    D.DName AS DepartmentName,
    COUNT(A.CourseId) AS AssignmentCount
FROM FACULTY F
JOIN ASSIGNED A ON F.FacultyId = A.FacultyId
JOIN COURSE C ON A.CourseId = C.CourseId
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
WHERE C.DateOffered >= DATEADD(WEEK, -1, GETDATE()) 
GROUP BY F.FacultyId, F.FName, D.DName
ORDER BY AssignmentCount DESC;

-- Query for faculty members with the most monthly assignments in specific departments
SELECT TOP 1 WITH TIES
    F.FacultyId,
    F.FName AS FacultyName,
    D.DName AS DepartmentName,
    COUNT(A.CourseId) AS AssignmentCount
FROM FACULTY F
JOIN ASSIGNED A ON F.FacultyId = A.FacultyId
JOIN COURSE C ON A.CourseId = C.CourseId
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
WHERE C.DateOffered >= DATEADD(MONTH, -1, GETDATE()) 
GROUP BY F.FacultyId, F.FName, D.DName
ORDER BY AssignmentCount DESC;

-- Query for faculty members with the most daily assignments in specific departments
SELECT TOP 1 WITH TIES
    F.FacultyId,
    F.FName AS FacultyName,
    D.DName AS DepartmentName,
    COUNT(A.CourseId) AS AssignmentCount
FROM FACULTY F
JOIN ASSIGNED A ON F.FacultyId = A.FacultyId
JOIN COURSE C ON A.CourseId = C.CourseId
JOIN DEPARTMENT D ON C.DepartmentId = D.DepartmentId
WHERE C.DateOffered >= DATEADD(DAY, -1, GETDATE()) 
GROUP BY F.FacultyId, F.FName, D.DName
ORDER BY AssignmentCount DESC;


--8
SELECT S.SName AS StudentName, C.CName AS CourseName, COUNT(E.CourseId) AS EnrollmentCount
FROM STUDENT S
JOIN ENROLLS E ON S.Rollno = E.Rollno
JOIN COURSE C ON E.CourseId = C.CourseId
GROUP BY S.SName, C.CName
HAVING COUNT(E.CourseId) > 1;

--9
SELECT S.SName AS StudentName, COUNT(DISTINCT E.CourseId) AS DifferentCourseCount
FROM STUDENT S
JOIN ENROLLS E ON S.Rollno = E.Rollno
GROUP BY S.SName
HAVING COUNT(DISTINCT E.CourseId) > 1;

--Some Additional Queries 

------------------------ADMINISTRATOR
-- Add an Administrator
INSERT INTO ADMINISTRATOR (AdminId, AName, CollegeId)
VALUES (11, 'NewAdmin', 4); -- Here we will replace college id

-- Update Administrator College
UPDATE ADMINISTRATOR
SET CollegeId = 3 -- Replace with the desired college
WHERE AdminId = 11; -- Replace with the desired Administrator's ID

-- Delete Administrator
DELETE FROM ADMINISTRATOR
WHERE AdminId = 11; -- Replace with the desired Administrator's ID

------------------------FACULTY MEMBER
-- Add a Faculty Member
INSERT INTO FACULTY (FacultyId, FName, DepartmentId)
VALUES (11, 'NewFaculty', 6); --  Here we will replace department id 

-- Update Faculty Member Department
UPDATE FACULTY
SET DepartmentId = 4 -- Replace with the desired department
WHERE FacultyId = 11; -- Replace with the desired Faculty Member's ID

-- Delete Faculty Member
DELETE FROM FACULTY
WHERE FacultyId = 11; -- Replace with the desired Faculty Member's ID

------------------------STUDENT
-- Add a Student
INSERT INTO STUDENT (Rollno, SName, DepartmentId)
VALUES (106, 'NewStudent', 5);  --Here we will replace department id

-- Update Student Department
UPDATE STUDENT
SET DepartmentId = 3 -- Replace with the desired department
WHERE Rollno = 106; -- Replace with the desired Student's Rollno

-- Delete Student
DELETE FROM STUDENT
WHERE Rollno = 106; -- Replace with the desired Student's Rollno

------------------------STAFF
-- Add College Staff
INSERT INTO STAFF (StaffId, SName, SRole, ProgramId)
VALUES (11, 'NewStaff', 'Role6', 4); -- Here we will replace program id

-- Update College Staff's Program
UPDATE STAFF
SET ProgramId = 5 -- Replace with the desired program
WHERE StaffId = 11; -- Replace with the desired Staff's ID

-- Delete College Staff
DELETE FROM STAFF
WHERE StaffId = 11; -- Replace with the desired Staff's ID









