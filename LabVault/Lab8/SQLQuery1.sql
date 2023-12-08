CREATE TABLE COLLEGE(
	CName varchar(255) Primary Key,
	CPhone varchar(255),
	DOffice int,

);

CREATE TABLE DEPT(
	DName varchar(255) Primary Key,
	DCode int,
	DOffice int,
	CStartDate date,
	DPhone varchar(255),
	CName varchar(255),
	Hod varchar(255) Check (Hod = 'Professor'),
    Dean varchar(255) Check (Dean = 'Professor'),

	Foreign Key (CName) References COLLEGE(CName)
);


CREATE TABLE INSTRUCTOR(
	id int Primary Key,
	irank varchar(255),
	iname varchar(255),
	academic_dept varchar(255),
	ioffice int,
	iphone varchar(255),
	DName varchar(255),
	CName varchar(255),


	Foreign Key (DName) References DEPT(DName),
	Foreign Key (CName) References COLLEGE(CName)
);

CREATE TABLE COURSE(
	CoName varchar(255) Primary Key,
	CCode int,
	course_level int,
	co_description varchar(255),
	credits varchar(255),
	DName varchar(255),

	Foreign Key (DName) References DEPT(DName)

);


CREATE TABLE SECTION(
	SecID int Primary key,
	instructor varchar(255),
	course varchar(255),
	secno int,
	sem int,
	year_ int,
	croom int,
	bldg int,
	RoomNo int,
	days_time varchar(255),
	CoName varchar(255),

	Foreign Key (CoName) References COURSE(CoName)
);

CREATE TABLE STUDENT(
	s_id int Primary key,
	sname varchar(255),
	fname varchar(255),
	mname varchar(255),
	lname varchar(255),
	phone varchar(255),
	addr varchar(255),
	dob date,
	major varchar(255),
	grade varchar(255) Check (grade in ('A', 'B', 'C', 'D', 'F')),
	DName varchar(255),

	Foreign Key (DName) References DEPT(DName)
);

CREATE TABLE ISIN(
	SecId int,
	s_id int,

	Foreign Key (SecId) references SECTION(SecId),
	Foreign Key (s_id) references STUDENT(s_id)
);

CREATE TABLE TEACHES(
	id int,
	SecID int,

	Foreign Key (id) references INSTRUCTOR(id),
	Foreign Key (SecID) references SECTION(SecID)
);