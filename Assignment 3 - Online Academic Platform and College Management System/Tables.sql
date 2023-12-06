CREATE TABLE COLLEGE (
    CollegeId INT PRIMARY KEY,
    CName VARCHAR(255),
    CLocation VARCHAR(255)
);

CREATE TABLE DEPARTMENT (
    DepartmentId INT PRIMARY KEY,
    DName VARCHAR(255),
    CollegeId INT,
    FOREIGN KEY (CollegeId) REFERENCES COLLEGE(CollegeId)
);

CREATE TABLE FACULTY (
    FacultyId INT PRIMARY KEY,
    FName VARCHAR(255),
    DepartmentId INT,
    FOREIGN KEY (DepartmentId) REFERENCES DEPARTMENT(DepartmentId)
);

CREATE TABLE ADMINISTRATOR (
    AdminId INT PRIMARY KEY,
    AName VARCHAR(255),
    CollegeId INT,
    FOREIGN KEY (CollegeId) REFERENCES COLLEGE(CollegeId)
);

CREATE TABLE TIMESLOT (
    TimeslotId INT PRIMARY KEY, 
    StartTime TIME,
    EndTime TIME
);

CREATE TABLE COURSE (
    CourseId INT PRIMARY KEY,
    CName VARCHAR(255),
    Code INT,
    DateOffered DATE,
    CollegeId INT,
    FacultyId INT,
    TimeslotId INT,
    DepartmentId INT,
    FOREIGN KEY (DepartmentId) REFERENCES DEPARTMENT(DepartmentId),
    FOREIGN KEY (FacultyId) REFERENCES FACULTY(FacultyId),
    FOREIGN KEY (CollegeId) REFERENCES COLLEGE(CollegeId),
    FOREIGN KEY (TimeslotId) REFERENCES Timeslot(TimeslotId)
);

CREATE TABLE PROGRAM (
    ProgramId INT PRIMARY KEY,
    PName VARCHAR(255),
    DepartmentId INT,
    FOREIGN KEY (DepartmentId) REFERENCES DEPARTMENT(DepartmentId)
);

CREATE TABLE HAS (
    ProgramId INT,
    CourseId INT,
    FOREIGN KEY (ProgramId) REFERENCES PROGRAM(ProgramId),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);

CREATE TABLE STAFF (
    StaffId INT PRIMARY KEY,
    SName VARCHAR(255),
    SRole VARCHAR(255),
    ProgramId INT,
    FOREIGN KEY (ProgramId) REFERENCES PROGRAM(ProgramId)
);

CREATE TABLE STUDENT (
    Rollno INT PRIMARY KEY,
    SName VARCHAR(255),
    DepartmentId INT,
    FOREIGN KEY (DepartmentId) REFERENCES DEPARTMENT(DepartmentId)
);

CREATE TABLE ENROLLS (
    Rollno INT,
    CourseId INT,
    DateEnrolled DATE,
    FOREIGN KEY (Rollno) REFERENCES STUDENT(Rollno),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);

CREATE TABLE ASSIGNED (
    FacultyId INT,
    CourseId INT,
    DateAssigned DATE,
    FOREIGN KEY (FacultyId) REFERENCES FACULTY(FacultyId),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);

CREATE TABLE ENROLLMENT (
    EnrollmentId INT PRIMARY KEY,
	EName varchar(255),
    Rollno INT,
    CourseId INT,
    ProgramId INT,
    FOREIGN KEY (Rollno) REFERENCES STUDENT(Rollno),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId),
    FOREIGN KEY (ProgramId) REFERENCES PROGRAM(ProgramId)
);