INSERT INTO COLLEGE (CName, CPhone, DOffice) VALUES
('College A', '123-456-7890', 101),
('College B', '987-654-3210', 102),
('College C', '555-555-5555', 103),
('College D', '777-777-7777', 104),
('College E', '999-999-9999', 105);

INSERT INTO DEPT (DName, DCode, DOffice, CStartDate, DPhone, CName, Hod, Dean) VALUES
('Department of Math', 101, 1, '2023-01-15', '111-111-1111', 'College A', 'Professor', 'Professor'),
('Department of Physics', 102, 2, '2023-02-20', '222-222-2222', 'College B', 'Professor', 'Professor'),
('Department of History', 103, 3, '2023-03-25', '333-333-3333', 'College C', 'Professor', 'Professor'),
('Department of Computer Science', 104, 4, '2023-04-30', '444-444-4444', 'College D', 'Professor', 'Professor'),
('Department of Chemistry', 105, 5, '2023-05-05', '555-555-5555', 'College E', 'Professor', 'Professor');

INSERT INTO INSTRUCTOR (id, irank, iname, academic_dept, ioffice, iphone, DName, CName) VALUES
(1, 'Professor', 'John Doe', 'Department of Math', 101, '111-111-1111', 'Department of Math', 'College A'),
(2, 'Associate Professor', 'Jane Smith', 'Department of Physics', 102, '222-222-2222', 'Department of Physics', 'College B'),
(3, 'Professor', 'Mike Johnson', 'Department of History', 103, '333-333-3333', 'Department of History', 'College C'),
(4, 'Assistant Professor', 'Sarah Brown', 'Department of Computer Science', 104, '444-444-4444', 'Department of Computer Science', 'College D'),
(5, 'Professor', 'David Wilson', 'Department of Chemistry', 105, '555-555-5555', 'Department of Chemistry', 'College E');

INSERT INTO COURSE (CoName, CCode, course_level, co_description, credits, DName) VALUES
('Math 101', 10101, 1, 'Introduction to Algebra', '3 credits', 'Department of Math'),
('Physics 101', 10201, 1, 'Introduction to Physics', '4 credits', 'Department of Physics'),
('History 101', 10301, 1, 'World History', '3 credits', 'Department of History'),
('Computer Science 101', 10401, 1, 'Introduction to Programming', '3 credits', 'Department of Computer Science'),
('Chemistry 101', 10501, 1, 'General Chemistry', '4 credits', 'Department of Chemistry');

INSERT INTO SECTION (SecID, instructor, course, secno, sem, year_, croom, bldg, RoomNo, days_time, CoName) VALUES
(1, 'John Doe', 'Math 101', 1, 1, 2023, 101, 1, 101, 'MWF 9:00 AM - 10:00 AM', 'Math 101'),
(2, 'Jane Smith', 'Physics 101', 1, 1, 2023, 102, 2, 102, 'TTh 10:00 AM - 11:30 AM', 'Physics 101'),
(3, 'Mike Johnson', 'History 101', 1, 1, 2023, 103, 3, 103, 'MWF 11:00 AM - 12:00 PM', 'History 101'),
(4, 'Sarah Brown', 'Computer Science 101', 1, 1, 2023, 104, 4, 104, 'TTh 1:00 PM - 2:30 PM', 'Computer Science 101'),
(5, 'David Wilson', 'Chemistry 101', 1, 1, 2023, 105, 5, 105, 'MWF 2:00 PM - 3:30 PM', 'Chemistry 101');

INSERT INTO STUDENT (s_id, sname, fname, mname, lname, phone, addr, dob, major, grade, DName) VALUES
(1, 'Alice Johnson', 'Alice', 'Marie', 'Johnson', '111-111-1111', '123 Main St', '2000-05-10', 'Math', 'A', 'Department of Math'),
(2, 'Bob Smith', 'Bob', 'William', 'Smith', '222-222-2222', '456 Elm St', '2001-08-15', 'Physics', 'B', 'Department of Physics'),
(3, 'Carol Davis', 'Carol', 'Ann', 'Davis', '333-333-3333', '789 Oak St', '1999-03-20', 'History', 'A', 'Department of History'),
(4, 'David Wilson', 'David', 'Michael', 'Wilson', '444-444-4444', '567 Pine St', '2002-01-05', 'Computer Science', 'B', 'Department of Computer Science'),
(5, 'Eve Brown', 'Eve', 'Elizabeth', 'Brown', '555-555-5555', '890 Cedar St', '2003-12-30', 'Chemistry', 'C', 'Department of Chemistry');

INSERT INTO ISIN (SecId, s_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO TEACHES (id, SecID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
