-- COLLEGE Table
INSERT INTO COLLEGE (CollegeId, CName, CLocation) VALUES
(1, 'College Edwrd', 'Location1'),
(2, 'College2', 'Location2'),
(3, 'College3', 'Location3'),
(4, 'College4', 'Location4'),
(5, 'College5', 'Location5'),
(6, 'College6', 'Location6'),
(7, 'College7', 'Location7'),
(8, 'College8', 'Location8');

-- DEPARTMENT Table
INSERT INTO DEPARTMENT (DepartmentId, DName, CollegeId) VALUES
(1, 'Engineering', 1),
(2, 'Business', 1),
(3, 'Arts', 2),
(4, 'Science', 2),
(5, 'Social Sciences', 3),
(6, 'History', 4),
(7, 'Chemistry', 5),
(8, 'Economics', 6),
(9, 'Political Science', 7),
(10, 'Psychology', 8);


-- FACULTY Table
INSERT INTO FACULTY (FacultyId, FName, DepartmentId) VALUES
(1, 'Faculty1', 1),
(2, 'Faculty2', 2),
(3, 'Faculty3', 3),
(4, 'Faculty4', 4),
(5, 'Faculty5', 5),
(6, 'Faculty6', 6),
(7, 'Faculty7', 7),
(8, 'Faculty8', 8),
(9, 'Faculty9', 9),
(10, 'Faculty10', 10);

-- ADMINISTRATOR Table
INSERT INTO ADMINISTRATOR (AdminId, AName, CollegeId) VALUES
(1, 'Admin1', 1),
(2, 'Admin2', 2),
(3, 'Admin3', 3),
(4, 'Admin4', 4),
(5, 'Admin5', 5),
(6, 'Admin6', 6),
(7, 'Admin7', 7),
(8, 'Admin8', 8);

-- TIMESLOT Table
INSERT INTO TIMESLOT (TimeslotId, StartTime, EndTime) VALUES
(1, '08:00:00', '10:00:00'),
(2, '10:00:00', '12:00:00'),
(3, '13:00:00', '15:00:00'),
(4, '15:00:00', '17:00:00'),
(5, '17:30:00', '19:00:00'),
(6, '19:30:00', '21:00:00'),
(7, '21:30:00', '23:00:00'),
(8, '23:30:00', '00:00:00');


-- COURSE Table 
INSERT INTO COURSE (CourseId, CName, Code, DateOffered, CollegeId, FacultyId, TimeslotId, DepartmentId) VALUES
(1, 'Course1', 101, '2023-11-01', 1, 1, 1, 1),
(2, 'Course2', 102, '2023-11-15', 1, 2, 2, 2),
(3, 'Course3', 103, '2023-11-11', 2, 3, 3, 3),
(4, 'Course4', 104, '2023-11-12', 2, 4, 4, 4),
(5, 'Course5', 105, '2023-11-15', 3, 5, 1, 5),
(6, 'Course6', 106, '2023-11-20', 4, 6, 5, 6),
(7, 'Course7', 107, '2023-11-22', 5, 7, 6, 7),
(8, 'Course8', 108, '2023-11-25', 6, 8, 7, 8),
(9, 'Course9', 109, '2023-11-28', 7, 9, 8, 9),
(10, 'Course10', 110, '2023-11-30', 8, 10, 1, 10);

-- PROGRAM Table
INSERT INTO PROGRAM (ProgramId, PName, DepartmentId) VALUES
(1, 'Program1', 1),
(2, 'Program2', 2),
(3, 'Program3', 3),
(4, 'Program4', 4),
(5, 'Program5', 5),
(6, 'Program6', 6),
(7, 'Program7', 7),
(8, 'Program8', 8),
(9, 'Program9', 9),
(10, 'Program10', 10);


-- HAS Table
INSERT INTO HAS (ProgramId, CourseId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- STAFF Table
INSERT INTO STAFF (StaffId, SName, SRole, ProgramId) VALUES
(1, 'Staff1', 'Role1', 1),
(2, 'Staff2', 'Role2', 2),
(3, 'Staff3', 'Role3', 3),
(4, 'Staff4', 'Role4', 4),
(5, 'Staff5', 'Role5', 5),
(6, 'Staff6', 'Role6', 6),
(7, 'Staff7', 'Role7', 7),
(8, 'Staff8', 'Role8', 8),
(9, 'Staff9', 'Role9', 9),
(10, 'Staff10', 'Role10', 10);

-- STUDENT Table
INSERT INTO STUDENT (Rollno, SName, DepartmentId) VALUES
(101, 'Student1', 1),
(102, 'Student2', 2),
(103, 'Student3', 3),
(104, 'Student4', 4),
(105, 'Student5', 5),
(106, 'Student6', 6),
(107, 'Student7', 7),
(108, 'Student8', 8),
(109, 'Student9', 9),
(110, 'Student10', 10);

-- ENROLLS Table
INSERT INTO ENROLLS (Rollno, CourseId, DateEnrolled) VALUES
(101, 6, '2023-11-02'),
(101, 7, '2023-11-03'),
(102, 8, '2023-11-15'),
(102, 9, '2023-11-16'),
(103, 10, '2023-11-11'),
(103, 6, '2023-11-12'),
(104, 7, '2023-11-12'),
(104, 8, '2023-11-13'),
(105, 9, '2023-11-15'),
(105, 10, '2023-11-16'),
(101, 1, '2023-11-02'),
(101, 1, '2023-11-03'),
(102, 2, '2023-11-15'),
(102, 2, '2023-11-16'),
(103, 3, '2023-11-11'),
(103, 3, '2023-11-12'),
(104, 4, '2023-11-12'),
(104, 4, '2023-11-13'),
(105, 5, '2023-11-15'),
(105, 5, '2023-11-16');



INSERT INTO ASSIGNED (FacultyId, CourseId, DateAssigned) VALUES
(1, 1, '2023-11-01'),
(2, 2, '2023-11-02'),
(3, 3, '2023-11-11'),
(4, 4, '2023-11-12'),
(5, 5, '2023-11-15'),
(6, 6, '2023-11-20'),
(7, 7, '2023-11-22'),
(8, 8, '2023-11-25'),
(9, 9, '2023-11-28'),
(10, 10, '2023-11-30'),
(1, 6, '2023-11-01'),
(2, 7, '2023-11-02'),
(3, 8, '2023-11-11'),
(4, 9, '2023-11-12'),
(5, 10, '2023-11-15');

-- ENROLLMENT Table
INSERT INTO ENROLLMENT (EnrollmentId, EName, Rollno, CourseId, ProgramId) VALUES
(1, 'Enrollment1',101, 1, 1),
(2, 'Enrollment2',102, 2, 2),
(3, 'Enrollment3',103, 3, 3),
(4, 'Enrollment4',104, 4, 4),
(5, 'Enrollment5',105, 5, 5),
(6, 'Enrollment6', 106, 6, 6),
(7, 'Enrollment7', 107, 7, 7),
(8, 'Enrollment8', 108, 8, 8),
(9, 'Enrollment9', 109, 9, 9),
(10, 'Enrollment10', 110, 10, 10);