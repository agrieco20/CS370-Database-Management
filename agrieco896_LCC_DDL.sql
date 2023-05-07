-- Anthony Grieco
-- CS 370 Database Management

use agrieco896;

show tables;

ALTER TABLE MinorEnrollment_tbl
DROP CONSTRAINT MinorID_FK;

ALTER TABLE MinorEnrollment_tbl
DROP CONSTRAINT PersonID_MinorEnrollment_FK;

ALTER TABLE MajorEnrollment_tbl
DROP CONSTRAINT MajorID_FK;

ALTER TABLE MajorEnrollment_tbl
DROP CONSTRAINT PersonID_MajorEnrollment_FK;

ALTER TABLE StudentEnrollment_tbl
DROP CONSTRAINT SectionID_FK;

ALTER TABLE StudentEnrollment_tbl
DROP CONSTRAINT PersonID_StudentEnrollment_FK;

ALTER TABLE Student_tbl
DROP CONSTRAINT PersonID_Student_FK;

ALTER TABLE CourseSection_tbl
DROP CONSTRAINT CourseID_FK;

ALTER TABLE CourseSection_tbl
DROP CONSTRAINT RoomID_CourseSection_FK;

ALTER TABLE CourseSection_tbl
DROP CONSTRAINT PersonID_CourseSection_FK;

ALTER TABLE CourseSection_tbl
DROP CONSTRAINT YearTerm_FK;

ALTER TABLE CourseSection_tbl
DROP CONSTRAINT SectionMeetingDayID_FK;

ALTER TABLE Faculty_tbl
DROP CONSTRAINT DepartmentID_FK;

ALTER TABLE Faculty_tbl
DROP CONSTRAINT PersonID_Faculty_FK;

ALTER TABLE Faculty_tbl
DROP CONSTRAINT RoomID_Faculty_FK;

ALTER TABLE Person_tbl
DROP CONSTRAINT CountryID_FK;

ALTER TABLE Person_tbl
DROP CONSTRAINT StateID_FK;

ALTER TABLE Room_tbl
DROP CONSTRAINT BuildingID_FK;

DROP INDEX  XPKMinorEnrollment ON MinorEnrollment_tbl;

DROP INDEX  XIF1MinorEnrollment ON MinorEnrollment_tbl;

DROP INDEX  XIF2MinorEnrollment ON MinorEnrollment_tbl;

DROP INDEX  XPKMinor ON Minor_tbl;

DROP INDEX  XPKMajorEnrollment ON MajorEnrollment_tbl;

DROP INDEX  XIF1MajorEnrollment ON MajorEnrollment_tbl;

DROP INDEX  XIF2MajorEnrollment ON MajorEnrollment_tbl;

DROP INDEX  XPKMajor ON Major_tbl;

DROP INDEX  XPKStudentEnrollment ON StudentEnrollment_tbl;

DROP INDEX  XIF1StudentEnrollment ON StudentEnrollment_tbl;

DROP INDEX  XIF2StudentEnrollment ON StudentEnrollment_tbl;

DROP INDEX  XPKStudent ON Student_tbl;

DROP INDEX  XIF1Student ON Student_tbl;

DROP INDEX  XPKCourseSection ON CourseSection_tbl;

DROP INDEX  XIF1CourseSection ON CourseSection_tbl;

DROP INDEX  XIF2CourseSection ON CourseSection_tbl;

DROP INDEX  XIF4CourseSection ON CourseSection_tbl;

DROP INDEX  XIF5CourseSection ON CourseSection_tbl;

DROP INDEX  XIF3CourseSection ON CourseSection_tbl;

DROP INDEX  XPKWeeklyClassSchedule ON WeeklyClassSchedule_tbl;

DROP INDEX  XPKAcademicCalendar ON AcademicCalendar_tbl;

DROP INDEX  XPKFaculty ON Faculty_tbl;

DROP INDEX  XIF1Faculty ON Faculty_tbl;

DROP INDEX  XIF2Faculty ON Faculty_tbl;

DROP INDEX  XIF3Faculty ON Faculty_tbl;

DROP INDEX  XPKPerson ON Person_tbl;

DROP INDEX  XIF1Person ON Person_tbl;

DROP INDEX  XIF2Person ON Person_tbl;

DROP INDEX  XPKState ON State_tbl;

DROP INDEX  XPKCountry ON Country_tbl;

DROP INDEX  XPKDepartment ON Department_tbl;

DROP INDEX  XPKRoom ON Room_tbl;

DROP INDEX  XIF1Room ON Room_tbl;

DROP INDEX  XPKBuilding ON Building_tbl;

DROP INDEX  XPKCourse ON Course_tbl;

DROP TABLE IF EXISTS MinorEnrollment_tbl;

DROP TABLE IF EXISTS Minor_tbl;

DROP TABLE IF EXISTS MajorEnrollment_tbl;

DROP TABLE IF EXISTS Major_tbl;

DROP TABLE IF EXISTS StudentEnrollment_tbl;

DROP TABLE IF EXISTS Student_tbl;

DROP TABLE IF EXISTS CourseSection_tbl;

DROP TABLE IF EXISTS WeeklyClassSchedule_tbl;

DROP TABLE IF EXISTS AcademicCalendar_tbl;

DROP TABLE IF EXISTS Faculty_tbl;

DROP TABLE IF EXISTS Person_tbl;

DROP TABLE IF EXISTS State_tbl;

DROP TABLE IF EXISTS Country_tbl;

DROP TABLE IF EXISTS Department_tbl;

DROP TABLE IF EXISTS Room_tbl;

DROP TABLE IF EXISTS Building_tbl;

DROP TABLE IF EXISTS Course_tbl;

CREATE TABLE AcademicCalendar_tbl
(
	Term CHAR(2) NOT NULL ,
	Year INTEGER NOT NULL 
);

ALTER TABLE AcademicCalendar_tbl
	ADD  CONSTRAINT XPKAcademicCalendar PRIMARY KEY  ( Term ASC, Year ASC );

CREATE TABLE Building_tbl
(
	BuildingID VARCHAR(4) NOT NULL ,
	BuildingName VARCHAR(30) NULL ,
	IsOffline boolean NULL 
);

ALTER TABLE Building_tbl
	ADD  CONSTRAINT XPKBuilding PRIMARY KEY  ( BuildingID ASC );

CREATE TABLE Country_tbl
(
	CountryID CHAR(2) NOT NULL ,
	CountryName VARCHAR(50) NULL 
);

ALTER TABLE Country_tbl
	ADD  CONSTRAINT XPKCountry PRIMARY KEY  ( CountryID ASC );

CREATE TABLE Course_tbl
(
	CourseID CHAR(6) NOT NULL ,
	CourseTitle VARCHAR(30) NULL ,
	CreditHours INTEGER NULL ,
	ActiveDate DATE NULL ,
	InactiveDate DATE NULL 
);

ALTER TABLE Course_tbl
	ADD  CONSTRAINT XPKCourse PRIMARY KEY  ( CourseID ASC );

CREATE TABLE CourseSection_tbl
(
	SectionID CHAR(2) NOT NULL ,
	CourseID CHAR(6) NOT NULL ,
	Year INTEGER NOT NULL ,
	Term CHAR(2) NOT NULL ,
	PersonID INTEGER NOT NULL ,
	RoomID VARCHAR(6) NOT NULL ,
	SectionMeetingDayID INTEGER NOT NULL ,
	MeetingStartTime TIME NULL ,
	MaxEnrollementCapacity INTEGER NULL ,
	BuildingID VARCHAR(4) NOT NULL 
);

ALTER TABLE CourseSection_tbl
	ADD  CONSTRAINT XPKCourseSection PRIMARY KEY  ( SectionID ASC, CourseID ASC, Year ASC, Term ASC );

CREATE TABLE Department_tbl
(
	DepartmentID CHAR(2) NOT NULL ,
	DepartmentName VARCHAR(20) NULL ,
	ActiveDate DATE NULL ,
	InactiveDate DATE NULL 
);

ALTER TABLE Department_tbl
	ADD  CONSTRAINT XPKDepartment PRIMARY KEY  ( DepartmentID ASC );

CREATE TABLE Faculty_tbl
(
	PersonID INTEGER NOT NULL ,
	DepartmentID CHAR(2) NOT NULL ,
	Title VARCHAR(25) NULL ,
	OfficePhoneNumber CHAR(13) NULL ,
	RoomID VARCHAR(6) NOT NULL ,
	BuildingID VARCHAR(4) NOT NULL 
);

ALTER TABLE Faculty_tbl
	ADD  CONSTRAINT XPKFaculty PRIMARY KEY  ( PersonID ASC );

CREATE TABLE Major_tbl
(
	MajorID CHAR(2) NOT NULL ,
	MajorName VARCHAR(25) NULL ,
	ActiveDate DATE NULL ,
	InactiveDate DATE NULL 
);

ALTER TABLE Major_tbl
	ADD  CONSTRAINT XPKMajor PRIMARY KEY  ( MajorID ASC );

CREATE TABLE MajorEnrollment_tbl
(
	PersonID INTEGER NOT NULL ,
	MajorID CHAR(2) NOT NULL ,
	DateDeclared DATE NULL 
);

ALTER TABLE MajorEnrollment_tbl
	ADD  CONSTRAINT XPKMajorEnrollment PRIMARY KEY  ( PersonID ASC, MajorID ASC );

CREATE TABLE Minor_tbl
(
	MinorID CHAR(2) NOT NULL ,
	MinorName VARCHAR(25) NULL ,
	ActiveDate DATE NULL ,
	InactiveDate DATE NULL 
);

ALTER TABLE Minor_tbl
	ADD  CONSTRAINT XPKMinor PRIMARY KEY  ( MinorID ASC );

CREATE TABLE MinorEnrollment_tbl
(
	PersonID INTEGER NOT NULL ,
	MinorID CHAR(2) NOT NULL ,
	DateDeclared DATE NULL 
);

ALTER TABLE MinorEnrollment_tbl
	ADD  CONSTRAINT XPKMinorEnrollment PRIMARY KEY  ( PersonID ASC, MinorID ASC );

CREATE TABLE Person_tbl
(
	PersonID INTEGER NOT NULL ,
	FirstName VARCHAR(20) NULL ,
	LastName VARCHAR(40) NULL ,
	Age INTEGER NULL ,
	Gender CHAR(1) NULL ,
	Email VARCHAR(30) NULL ,
	PhoneNumber VARCHAR(13) NULL ,
	Street1 VARCHAR(40) NULL ,
	Street2 VARCHAR(40) NULL ,
	City VARCHAR(30) NULL ,
	StateID CHAR(2) NULL ,
	CountryID CHAR(2) NOT NULL ,
	ZipCode VARCHAR(12) NULL 
);

ALTER TABLE Person_tbl
	ADD  CONSTRAINT XPKPerson PRIMARY KEY  ( PersonID ASC );

CREATE TABLE Room_tbl
(
	RoomID VARCHAR(6) NOT NULL ,
	BuildingID VARCHAR(4) NOT NULL ,
	NumberAvaliableSeats INTEGER NULL ,
	HasProjectionEquipment boolean NULL ,
	HasAudio boolean NULL ,
	HasComputer boolean NULL 
);

ALTER TABLE Room_tbl
	ADD  CONSTRAINT XPKRoom PRIMARY KEY  ( RoomID ASC, BuildingID ASC );

CREATE TABLE State_tbl
(
	StateID CHAR(2) NOT NULL ,
	StateName VARCHAR(25) NULL 
);

ALTER TABLE State_tbl
	ADD  CONSTRAINT XPKState PRIMARY KEY  ( StateID ASC );

CREATE TABLE Student_tbl
(
	PersonID INTEGER NOT NULL ,
	YearOfGraduation INTEGER NULL ,
	GPA FLOAT NULL ,
	GPACalcDate DATE NULL 
);

ALTER TABLE Student_tbl
	ADD  CONSTRAINT XPKStudent PRIMARY KEY  ( PersonID ASC );

CREATE TABLE StudentEnrollment_tbl
(
	PersonID INTEGER NOT NULL ,
	SectionID CHAR(2) NOT NULL ,
	CourseID CHAR(6) NOT NULL ,
	Year INTEGER NOT NULL ,
	Term CHAR(2) NOT NULL ,
	CourseAddDate DATE NULL ,
	CourseDropDate DATE NULL ,
	CourseWithdrawalDate DATE NULL ,
	MidtermGrade VARCHAR(2) NULL ,
	FinalGrade VARCHAR(2) NULL 
);

ALTER TABLE StudentEnrollment_tbl
	ADD  CONSTRAINT XPKStudentEnrollment PRIMARY KEY  ( PersonID ASC, SectionID ASC, CourseID ASC, Year ASC, Term ASC );

CREATE TABLE WeeklyClassSchedule_tbl
(
	SectionMeetingDayID INTEGER NOT NULL ,
	MeetingDaySchedule VARCHAR(5) NULL 
);

ALTER TABLE WeeklyClassSchedule_tbl
	ADD  CONSTRAINT XPKWeeklyClassSchedule PRIMARY KEY  ( SectionMeetingDayID ASC );

ALTER TABLE CourseSection_tbl
	ADD  CONSTRAINT CourseID_FK FOREIGN KEY (CourseID) REFERENCES Course_tbl (CourseID);

ALTER TABLE CourseSection_tbl
	ADD  CONSTRAINT RoomID_CourseSection_FK FOREIGN KEY (RoomID, BuildingID) REFERENCES Room_tbl (RoomID, BuildingID);

ALTER TABLE CourseSection_tbl
	ADD  CONSTRAINT YearTerm_FK FOREIGN KEY (Term, Year) REFERENCES AcademicCalendar_tbl (Term, Year);

ALTER TABLE CourseSection_tbl
	ADD  CONSTRAINT SectionMeetingDayID_FK FOREIGN KEY (SectionMeetingDayID) REFERENCES WeeklyClassSchedule_tbl (SectionMeetingDayID);

ALTER TABLE CourseSection_tbl
	ADD  CONSTRAINT PersonID_CourseSection_FK FOREIGN KEY (PersonID) REFERENCES Faculty_tbl (PersonID);

ALTER TABLE Faculty_tbl
	ADD  CONSTRAINT DepartmentID_FK FOREIGN KEY (DepartmentID) REFERENCES Department_tbl (DepartmentID);

ALTER TABLE Faculty_tbl
	ADD  CONSTRAINT PersonID_Faculty_FK FOREIGN KEY (PersonID) REFERENCES Person_tbl (PersonID);

ALTER TABLE Faculty_tbl
	ADD  CONSTRAINT RoomID_Faculty_FK FOREIGN KEY (RoomID, BuildingID) REFERENCES Room_tbl (RoomID, BuildingID);

ALTER TABLE MajorEnrollment_tbl
	ADD  CONSTRAINT MajorID_FK FOREIGN KEY (MajorID) REFERENCES Major_tbl (MajorID);

ALTER TABLE MajorEnrollment_tbl
	ADD  CONSTRAINT PersonID_MajorEnrollment_FK FOREIGN KEY (PersonID) REFERENCES Student_tbl (PersonID);

ALTER TABLE MinorEnrollment_tbl
	ADD  CONSTRAINT MinorID_FK FOREIGN KEY (MinorID) REFERENCES Minor_tbl (MinorID);

ALTER TABLE MinorEnrollment_tbl
	ADD  CONSTRAINT PersonID_MinorEnrollment_FK FOREIGN KEY (PersonID) REFERENCES Student_tbl (PersonID);

ALTER TABLE Person_tbl
	ADD  CONSTRAINT CountryID_FK FOREIGN KEY (CountryID) REFERENCES Country_tbl (CountryID);

ALTER TABLE Person_tbl
	ADD  CONSTRAINT StateID_FK FOREIGN KEY (StateID) REFERENCES State_tbl (StateID);

ALTER TABLE Room_tbl
	ADD  CONSTRAINT BuildingID_FK FOREIGN KEY (BuildingID) REFERENCES Building_tbl (BuildingID);

ALTER TABLE Student_tbl
	ADD  CONSTRAINT PersonID_Student_FK FOREIGN KEY (PersonID) REFERENCES Person_tbl (PersonID);

ALTER TABLE StudentEnrollment_tbl
	ADD  CONSTRAINT SectionID_FK FOREIGN KEY (SectionID, CourseID, Year, Term) REFERENCES CourseSection_tbl (SectionID, CourseID, Year, Term);

ALTER TABLE StudentEnrollment_tbl
	ADD  CONSTRAINT PersonID_StudentEnrollment_FK FOREIGN KEY (PersonID) REFERENCES Student_tbl (PersonID);
    
-- DDL From Dr. Albina to Insert "Country" and "State" data from His Country and State Data Script:
INSERT INTO agrieco896.Country_tbl SELECT * FROM aalbina.country_tbl;
INSERT INTO agrieco896.State_tbl SELECT * FROM aalbina.st_tbl;

-- Inserting Data into the Tables:
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(1, 'Anthony', 'Grieco', 21, 'M', 'agrieco896@anselm.edu', '16030010001', '1 Zelda Ave', 'Hyrule City', 'NH', 'US', '01010');
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(2, 'Zach', 'Phillips', 21, 'M', 'zphillips080@anselm.edu', '19780020002', '2 Patriots Way', 'Framingham', 'MA', 'US', '01701');
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(3, 'Caroline', 'Codner', 20, 'F', 'ccodner619@anselm.edu', '12030030003', '3 Cross Country Ln', 'Burlington', 'CT', 'US', '06013');
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(4, 'Bob', 'Stone', 51, 'M', 'bstone@gmail.com', '15300040004', '4 Enforcer Dr', 'Irvine', 'CA', 'US', '92602');
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(5, 'Emily', 'Dickey', 22, 'F', 'edickey177@anselm.edu', '15380050005', '5 Drones Circuit', 'Amherst', 'MA', 'US', '01002');
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(6, 'Adam', 'Albina', 59, 'M', 'aalbina@anselm.edu', '16030060006', '6 Systems Dr', 'Milford', 'NH', 'US', '03055');
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(7, 'Michael', 'Huelsman', 29, 'M', 'mhuelsman@anselm.edu', '18590070007', '7 AI Way', 'Manchester', 'NH', 'US', '03102');
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(8, 'Bernard', 'Disco', 37, 'M', 'bdisco@anselm.edu', '16030080008', '8 Theology Street', 'Manchester', 'NH', 'US', '03102');
INSERT INTO Person_tbl (PersonID, FirstName, LastName, Age, Gender, Email, PhoneNumber, Street1, City, StateID, CountryID, ZipCode) VALUES(9, 'Steve', 'Biz', 43, 'M', 'sbiz@gmail.com', '17160090009', '9 Wall Street', 'Buffalo', 'NY', 'US', '14201');

SELECT * FROM Person_tbl; -- Shows all data currently being stored in "Person_tbl"
DELETE FROM Person_tbl WHERE PersonID = 1; -- Deletes all the row data in "Person_tbl" where the given PersonID = 1

INSERT INTO Student_tbl (PersonID, YearOfGraduation, GPA, GPACalcDate) VALUES (1, 2024, 3.85, '2023-05-04');
INSERT INTO Student_tbl (PersonID, YearOfGraduation, GPA, GPACalcDate) VALUES (2, 2024, 3.75, '2023-05-04');
INSERT INTO Student_tbl (PersonID, YearOfGraduation, GPA, GPACalcDate) VALUES (3, 2024, 3.82, '2023-05-04');
INSERT INTO Student_tbl (PersonID, YearOfGraduation, GPA, GPACalcDate) VALUES (4, 2027, 3.40, '2023-05-04');
INSERT INTO Student_tbl (PersonID, YearOfGraduation, GPA, GPACalcDate) VALUES (5, 2023, 3.60, '2023-05-04');

SELECT * FROM Student_tbl;
DELETE FROM Student_tbl WHERE PersonID = 1; -- Deletes all the row data in "Student_tbl" where the given PersonID = 1

INSERT INTO Department_tbl (DepartmentID, DepartmentName, ActiveDate) VALUES ('CS', 'Computer Science', '2000-01-01');
INSERT INTO Department_tbl (DepartmentID, DepartmentName, ActiveDate) VALUES ('TH', 'Theology', '1972-01-01');
INSERT INTO Department_tbl (DepartmentID, DepartmentName, ActiveDate) VALUES ('MA', 'Math', '1982-01-01');
INSERT INTO Department_tbl (DepartmentID, DepartmentName, ActiveDate) VALUES ('BU', 'Business', '1984-01-01');

SELECT * FROM Department_tbl;

INSERT INTO Building_tbl (BuildingID, BuildingName, IsOffline) VALUES ('POIS', 'Poisson', False);
INSERT INTO Building_tbl (BuildingID, BuildingName, IsOffline) VALUES ('ALUM', 'Alumni Hall', False);
INSERT INTO Building_tbl (BuildingID, BuildingName, IsOffline) VALUES ('GOUL', 'Goulet', False);

SELECT * FROM Building_tbl;

-- Classrooms:
INSERT INTO Room_tbl (RoomID, BuildingID, NumberAvaliableSeats, HasProjectionEquipment, HasAudio, HasComputer) VALUES ('Lab A', 'POIS', 20, True, True, True);
INSERT INTO Room_tbl (RoomID, BuildingID, NumberAvaliableSeats, HasProjectionEquipment, HasAudio, HasComputer) VALUES ('108', 'POIS', 18, True, True, True);
INSERT INTO Room_tbl (RoomID, BuildingID, NumberAvaliableSeats, HasProjectionEquipment, HasAudio, HasComputer) VALUES ('3304', 'GOUL', 30, True, True, True);
INSERT INTO Room_tbl (RoomID, BuildingID, NumberAvaliableSeats, HasProjectionEquipment, HasAudio, HasComputer) VALUES ('LL5', 'ALUM', 25, True, True, True);

-- Professor's Offices:
INSERT INTO Room_tbl (RoomID, BuildingID, NumberAvaliableSeats, HasProjectionEquipment, HasAudio, HasComputer) VALUES ('110', 'POIS', 2, False, True, True);
INSERT INTO Room_tbl (RoomID, BuildingID, NumberAvaliableSeats, HasProjectionEquipment, HasAudio, HasComputer) VALUES ('210', 'POIS', 2, False, True, True);
INSERT INTO Room_tbl (RoomID, BuildingID, NumberAvaliableSeats, HasProjectionEquipment, HasAudio, HasComputer) VALUES ('1', 'ALUM', 25, False, True, True);
INSERT INTO Room_tbl (RoomID, BuildingID, NumberAvaliableSeats, HasProjectionEquipment, HasAudio, HasComputer) VALUES ('3012', 'GOUL', 25, False, True, True);

SELECT * FROM Room_tbl;

INSERT INTO Faculty_tbl (PersonID, DepartmentID, Title, OfficePhoneNumber, BuildingID, RoomID) VALUES (6, 'CS', 'Assistant Professor', '16036417574', 'POIS', '110');
INSERT INTO Faculty_tbl (PersonID, DepartmentID, Title, OfficePhoneNumber, BuildingID, RoomID) VALUES (7, 'CS', 'Assistant Professor', '16036417065', 'POIS', '210');
INSERT INTO Faculty_tbl (PersonID, DepartmentID, Title, OfficePhoneNumber, BuildingID, RoomID) VALUES (8, 'TH', 'Assistant Professor', '16036417026', 'ALUM', '1');
INSERT INTO Faculty_tbl (PersonID, DepartmentID, Title, OfficePhoneNumber, BuildingID, RoomID) VALUES (9, 'BU', 'Associate Professor', '16036417032', 'GOUL', '3012');

SELECT * FROM Faculty_tbl;

INSERT INTO AcademicCalendar_tbl (Term, Year) VALUES ('FA', 2023);
INSERT INTO AcademicCalendar_tbl (Term, Year) VALUES ('SP', 2023);
INSERT INTO AcademicCalendar_tbl (Term, Year) VALUES ('FA', 2022);
INSERT INTO AcademicCalendar_tbl (Term, Year) VALUES ('SP', 2022);

SELECT * FROM AcademicCalendar_tbl;

INSERT INTO WeeklyClassSchedule_tbl (SectionMeetingDayID, MeetingDaySchedule) VALUES (1, 'M-W-F');
INSERT INTO WeeklyClassSchedule_tbl (SectionMeetingDayID, MeetingDaySchedule) VALUES (2, 'T-Th');
INSERT INTO WeeklyClassSchedule_tbl (SectionMeetingDayID, MeetingDaySchedule) VALUES (3, 'M-W');
INSERT INTO WeeklyClassSchedule_tbl (SectionMeetingDayID, MeetingDaySchedule) VALUES (4, 'M');
INSERT INTO WeeklyClassSchedule_tbl (SectionMeetingDayID, MeetingDaySchedule) VALUES (5, 'T');
INSERT INTO WeeklyClassSchedule_tbl (SectionMeetingDayID, MeetingDaySchedule) VALUES (6, 'W');
INSERT INTO WeeklyClassSchedule_tbl (SectionMeetingDayID, MeetingDaySchedule) VALUES (7, 'Th');
INSERT INTO WeeklyClassSchedule_tbl (SectionMeetingDayID, MeetingDaySchedule) VALUES (8, 'F');

SELECT * FROM WeeklyClassSchedule_tbl;

INSERT INTO Course_tbl (CourseID, CourseTitle, CreditHours, ActiveDate) VALUES ('CS 370', 'Database Management', 4, '2021-01-01');
INSERT INTO Course_tbl (CourseID, CourseTitle, CreditHours, ActiveDate) VALUES ('TH 100', 'Biblical Theology', 4, '1972-01-01');
INSERT INTO Course_tbl (CourseID, CourseTitle, CreditHours, ActiveDate) VALUES ('CS 330', 'Information Security', 4, '2023-01-01');
INSERT INTO Course_tbl (CourseID, CourseTitle, CreditHours, ActiveDate) VALUES ('BU 121', 'Business Statistics', 4, '1984-09-01');

SELECT * FROM Course_tbl;

INSERT INTO CourseSection_tbl (SectionID, CourseID, Year, Term, PersonID, BuildingID, RoomID, SectionMeetingDayID, MeetingStartTime, MaxEnrollementCapacity) VALUES ('A', 'CS 370', 2023, 'SP', 6, 'POIS', 'Lab A', 2, '08:30', 20);
INSERT INTO CourseSection_tbl (SectionID, CourseID, Year, Term, PersonID, BuildingID, RoomID, SectionMeetingDayID, MeetingStartTime, MaxEnrollementCapacity) VALUES ('A', 'CS 330', 2023, 'SP', 7, 'POIS', '108', 1, '10:00', 12);
INSERT INTO CourseSection_tbl (SectionID, CourseID, Year, Term, PersonID, BuildingID, RoomID, SectionMeetingDayID, MeetingStartTime, MaxEnrollementCapacity) VALUES ('A', 'TH 100', 2023, 'SP', 8, 'GOUL', '3304', 6, '12:30', 20);
INSERT INTO CourseSection_tbl (SectionID, CourseID, Year, Term, PersonID, BuildingID, RoomID, SectionMeetingDayID, MeetingStartTime, MaxEnrollementCapacity) VALUES ('B', 'TH 100', 2023, 'SP', 8, 'GOUL', '3304', 5, '11:30', 20);
INSERT INTO CourseSection_tbl (SectionID, CourseID, Year, Term, PersonID, BuildingID, RoomID, SectionMeetingDayID, MeetingStartTime, MaxEnrollementCapacity) VALUES ('A', 'BU 121', 2023, 'SP', 9, 'ALUM', 'LL5', 2, '9:30', 20);
INSERT INTO CourseSection_tbl (SectionID, CourseID, Year, Term, PersonID, BuildingID, RoomID, SectionMeetingDayID, MeetingStartTime, MaxEnrollementCapacity) VALUES ('B', 'BU 121', 2023, 'FA', 9, 'GOUL', '3304', 3, '14:30', 20);
INSERT INTO CourseSection_tbl (SectionID, CourseID, Year, Term, PersonID, BuildingID, RoomID, SectionMeetingDayID, MeetingStartTime, MaxEnrollementCapacity) VALUES ('C', 'BU 121', 2022, 'SP', 9, 'ALUM', 'LL5', 4, '15:30', 20);
INSERT INTO CourseSection_tbl (SectionID, CourseID, Year, Term, PersonID, BuildingID, RoomID, SectionMeetingDayID, MeetingStartTime, MaxEnrollementCapacity) VALUES ('A', 'BU 121', 2022, 'FA', 9, 'GOUL', '3304', 1, '10:00', 20);

SELECT * FROM CourseSection_tbl;
DELETE FROM CourseSection_tbl WHERE SectionID = 'A' AND CourseID = 'CS 330' AND Year = '2022'; -- Deletes all the row data in "CourseSection_tbl" where the given SectionID = A AND CourseID = 'CS 330'

INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (1, 'A', 'CS 370', 2023, 'SP', '2023-11-01');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (1, 'A', 'CS 330', 2023, 'SP', '2023-11-01');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (2, 'A', 'CS 370', 2023, 'SP', '2023-11-03');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (2, 'A', 'TH 100', 2023, 'SP', '2023-11-03');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (3, 'A', 'CS 370', 2023, 'SP', '2023-11-01');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (4, 'B', 'BU 121', 2023, 'FA', '2023-03-03');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (4, 'B', 'TH 100', 2023, 'SP', '2023-11-03');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (5, 'A', 'CS 370', 2023, 'SP', '2023-11-03');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (5, 'A', 'BU 121', 2023, 'SP', '2023-11-03');
INSERT INTO StudentEnrollment_tbl (PersonID, SectionID, CourseID, Year, Term, CourseAddDate) VALUES (1, 'C', 'BU 121', 2022, 'SP', '2022-11-17');

SELECT * FROM StudentEnrollment_tbl;
DELETE FROM StudentEnrollment_tbl WHERE PersonID = 4;

INSERT INTO Minor_tbl (MinorID, MinorName, ActiveDate) VALUES ('DA', 'Data Analytics', '2017-10-31');
INSERT INTO Minor_tbl (MinorID, MinorName, ActiveDate, InactiveDate) VALUES ('EC', 'Economics', '2003-2-23', '2023-05-04');
INSERT INTO Minor_tbl (MinorID, MinorName, ActiveDate) VALUES ('CC', 'Cyber Criminology', '2003-2-23');

SELECT * FROM Minor_tbl;
DELETE FROM Minor_tbl WHERE MinorID = 'EC';

INSERT INTO MinorEnrollment_tbl (PersonID, MinorID, DateDeclared) VALUES (1, 'DA', '2022-09-01');
INSERT INTO MinorEnrollment_tbl (PersonID, MinorID, DateDeclared) VALUES (1, 'CC', '2022-09-01');
INSERT INTO MinorEnrollment_tbl (PersonID, MinorID, DateDeclared) VALUES (2, 'DA', '2021-11-01');
INSERT INTO MinorEnrollment_tbl (PersonID, MinorID, DateDeclared) VALUES (3, 'DA', '2022-10-17');
INSERT INTO MinorEnrollment_tbl (PersonID, MinorID, DateDeclared) VALUES (4, 'EC', '2023-05-03');

SELECT * FROM MinorEnrollment_tbl;
DELETE FROM MinorEnrollment_tbl WHERE PersonID = 4;

INSERT INTO Major_tbl (MajorID, MajorName, ActiveDate) VALUES ('CS', 'Computer Science', '2000-01-01');
INSERT INTO Major_tbl (MajorID, MajorName, ActiveDate) VALUES ('MA', 'Math', '1982-01-01');
INSERT INTO Major_tbl (MajorID, MajorName, ActiveDate) VALUES ('BU', 'Business', '1984-01-01');

SELECT * FROM Major_tbl;
DELETE FROM Major_tbl WHERE MajorID = 'CS';

INSERT INTO MajorEnrollment_tbl (PersonID, MajorID, DateDeclared) VALUES (1, 'CS', '2020-05-01');
INSERT INTO MajorEnrollment_tbl (PersonID, MajorID, DateDeclared) VALUES (2, 'CS', '2020-05-07');
INSERT INTO MajorEnrollment_tbl (PersonID, MajorID, DateDeclared) VALUES (3, 'MA', '2020-05-03');
INSERT INTO MajorEnrollment_tbl (PersonID, MajorID, DateDeclared) VALUES (4, 'BU', '2022-04-12');
INSERT INTO MajorEnrollment_tbl (PersonID, MajorID, DateDeclared) VALUES (5, 'CS', '2019-04-30');
INSERT INTO MajorEnrollment_tbl (PersonID, MajorID, DateDeclared) VALUES (5, 'BU', '2021-04-30');

SELECT * FROM MajorEnrollment_tbl;
DELETE FROM MajorEnrollment_tbl WHERE PersonID = 4;

-- Query #1: Query that shows course code concatenated with section code, course name, year and term for all course sections that are offered for a sample year and term.
SELECT CONCAT(courseSec.CourseID, ' ', SectionID) AS 'Course and Section', course.CourseTitle AS 'Course Name', Year, Term FROM CourseSection_tbl courseSec, Course_tbl course WHERE Year = '2023' AND Term = 'SP' AND courseSec.CourseID = course.CourseID;

-- Query #2: Query that shows student id, student first and last name, course, section, year and term for all students enrolled in a given course and section for a sample year and term.
SELECT person.PersonID AS 'StudentID', FirstName AS 'First Name', LastName AS 'Last Name', course.CourseTitle AS 'Course Name', stuEnroll.CourseID, SectionID, Year, Term FROM Person_tbl person, StudentEnrollment_tbl stuEnroll, Course_tbl course WHERE person.PersonID = stuEnroll.PersonID AND stuEnroll.CourseID = 'CS 370' AND SectionID = 'A' AND Year = '2023' AND Term = 'SP' AND stuEnroll.CourseID = course.CourseID;

-- Query #3: Query that shows the professor name, department, course and section for a professor who is teaching a section for a sample course, section, year and term.
SELECT FirstName AS 'First Name', LastName AS 'Last Name', DepartmentName AS 'Department', course.CourseTitle AS 'Course Name', courseSec.CourseID, courseSec.SectionID, Year, Term FROM Person_tbl person, Faculty_tbl faculty, CourseSection_tbl courseSec, Course_tbl course, Department_tbl dept WHERE faculty.PersonID = courseSec.PersonID AND courseSec.PersonID = person.PersonID AND faculty.DepartmentID = dept.DepartmentID AND courseSec.CourseID = 'CS 370' AND SectionID = 'A' AND Year = '2023' AND Term = 'SP' AND courseSec.CourseID = course.CourseID;

-- Query #4: Query that shows student first name, last name, address, city, state, zip code, country code for all students who are in a sample major.
SELECT FirstName AS 'First Name', LastName AS 'Last Name', Street1 AS 'Street 1', Street2 AS 'Street 2', City, StateID AS 'State', ZipCode AS 'Zip Code', CountryID AS 'Country Code', major.MajorName AS 'Major' FROM Person_tbl person, Student_tbl stu, MajorEnrollment_tbl majorEnroll, Major_tbl major WHERE person.PersonID = stu.PersonID AND stu.PersonID = majorEnroll.PersonID AND majorEnroll.majorID = major.MajorID AND majorEnroll.MajorID = 'CS';

-- Query #5: Query that shows student first name, last name, address, city, state, zip code, country code for all students who are in a sample minor.
SELECT FirstName AS 'First Name', LastName AS 'Last Name', Street1 AS 'Street 1', Street2 AS 'Street 2', City, StateID AS 'State', ZipCode AS 'Zip Code', CountryID AS 'Country Code', minor.MinorName AS 'Minor' FROM Person_tbl person, Student_tbl stu, MinorEnrollment_tbl minorEnroll, Minor_tbl minor WHERE person.PersonID = stu.PersonID AND stu.PersonID = minorEnroll.PersonID AND minorEnroll.MinorID = minor.MinorID AND minorEnroll.MinorID = 'DA';

-- Query #6: A list of Course and section names, Building Names, Room numbers, and meeting scheme (M-W-F, T-Th) for all the courses being offered in a sample year and term regardless of enrollments.
SELECT course.CourseTitle AS 'Course Name', courseSec.CourseID, courseSec.SectionID, BuildingName AS 'Building', room.RoomID AS 'Room', MeetingDaySchedule AS 'Meeting Scheme', Year, Term FROM CourseSection_tbl courseSec, Course_tbl course, Building_tbl building, Room_tbl room, WeeklyClassSchedule_tbl weekSchedule WHERE course.courseID = courseSec.courseID AND courseSec.RoomID = room.RoomID AND room.BuildingID = building.BuildingID AND courseSec.SectionMeetingDayID = weekSchedule.SectionMeetingDayID AND Year = '2023' AND Term = 'SP' /* AND (weekSchedule.SectionMeetingDayID = 1 OR weekSchedule.SectionMeetingDayID = 2) */;

-- Query #7: A list of faculty first and last name, address, city, state, zip code, country for all faculty in a sample department.
SELECT FirstName AS 'First Name', LastName AS 'Last Name', Street1 AS 'Street 1', Street2 AS 'Street 2', City, StateID AS 'State', ZipCode AS 'Zip Code', CountryName AS 'Country' FROM Person_tbl person, Country_tbl country, Faculty_tbl faculty, Department_tbl dept WHERE person.CountryID = country.CountryID AND person.PersonID = faculty.PersonID AND faculty.DepartmentID = dept.DepartmentID AND dept.DepartmentID = 'CS';