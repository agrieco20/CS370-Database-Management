-- Anthony Grieco
-- CS 370 Database Management

use agrieco896;

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