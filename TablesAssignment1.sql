--Dropping the tables to resfresh
DROP TABLE IF EXISTS has
DROP TABLE IF EXISTS possesses
DROP TABLE IF EXISTS facility
DROP TABLE IF EXISTS courseOffering
DROP TABLE IF EXISTS term  
DROP TABLE IF EXISTS physicalCampus
DROP TABLE IF EXISTS campus
DROP TABLE IF EXISTS assumedKnowledge
DROP TABLE IF EXISTS completed
DROP TABLE IF EXISTS course
DROP TABLE IF EXISTS student
DROP TABLE IF EXISTS enrolledIn
DROP TABLE IF EXISTS enrollment
DROP TABLE IF EXISTS staffConvenor
DROP TABLE IF EXISTS programme
DROP TABLE IF EXISTS certification
DROP TABLE IF EXISTS contain
DROP TABLE IF EXISTS subUnit
DROP TABLE IF EXISTS orgUnit
DROP TABLE IF EXISTS administrationStaff
DROP TABLE IF EXISTS academicStaff
DROP TABLE IF EXISTS staff
DROP TABLE IF EXISTS majorMinor




--majorMinor stores data concerning major and minor offerings

CREATE TABLE majorMinor (
mCode char(8) PRIMARY KEY NOT NULL,
name varchar(255), 
mEither char(5) NOT NULL, 
credits smallint,
conditions varChar(255),
CHECK (mEither = 'Major' OR mEither = 'Minor'));

--staff stores staff personal details
CREATE TABLE staff (
staffID char(8) PRIMARY KEY NOT NULL,
role char(255) NOT NULL,
firstName varchar(255),
lastName varchar(255),
address varchar(255),
contactNo varchar(20));

--orgUnit stores information about the various organisations (e.g. The School of Engineering)
CREATE TABLE orgUnit (
unitID char(8) PRIMARY KEY NOT NULL,
name varchar(255),
description varchar(255),
contactNo varchar(20));

--subUnit stores information about departments that exist inside orgUnits
CREATE TABLE subUnit (
unitID char(8) PRIMARY KEY NOT NULL
foreign key references orgUnit(unitID)
ON UPDATE CASCADE,
subUnitID char(8) UNIQUE,
subUnitName varchar(50));

--Organisations contan staff
CREATE TABLE contain (
staffID char(8) foreign key references staff(staffID) NOT NULL,
unitID char(8) foreign key references orgUnit(unitID) NOT NULL,
startDate date,
endDate date,
role varchar(50));

--certification stores information about the different levels of degrees
CREATE TABLE certification(
level char(4) PRIMARY KEY NOT NULL,
certAchieved varchar(50));

--programmes offered by the university
CREATE TABLE programme ( 
programmeCode char(8) PRIMARY KEY NOT NULL,
name varchar(255) NOT NULL,
creditsToComplete smallint,
level char(4) foreign key references certification(level)
ON UPDATE CASCADE,
unitID char(8) foreign key references orgUnit(unitID)
ON UPDATE CASCADE,
mCode char(8) foreign key references majorMinor(mCode)
ON UPDATE CASCADE);

--each programme has a staff member who convenes it
CREATE TABLE staffConvenor (
    staffID char(8) PRIMARY KEY NOT NULL
    foreign key references staff(staffID), 
    programmeCode char(8) foreign key references programme(programmeCode)
	ON UPDATE CASCADE,
    startDate date,
    endDate date);

--Stores students enrollment data
CREATE TABLE enrollment(
enrollmentID char(8) PRIMARY KEY NOT NULL,
enrollDate date,
completionDate date,
status varchar(20),
programmeCode char(8)
foreign key references Programme(programmeCode)
ON UPDATE CASCADE);

--student stores students personal information
CREATE TABLE student (
studentID char(8) PRIMARY KEY NOT NULL,
firstName varchar(255),
lastName varchar(255),
address varchar(255),
contactNumber varchar(20),
enrollmentID char(8) 
foreign key references enrollment(enrollmentID)
ON UPDATE CASCADE);

--course holds data concerning each individual course
CREATE TABLE course(
courseID char(8) PRIMARY KEY NOT NULL,
name varchar(255),
credits smallint,
description varchar(255),
assumedKnowledge char(8) foreign key references course(courseID));


--courseEnrollment stores courses that students have enrolled in
CREATE TABLE enrolledIn(
    studentID char(8) foreign key references student(studentID) NOT NULL,
    offeringID char(8) foreign key references course(courseID) NOT NULL,
    grade char(2),
    completionStatus varchar(20));



--campus concerns both physical and online campuses
CREATE TABLE campus(
campusID char(8) PRIMARY KEY NOT NULL,
name varchar(20));

--extendeds the table to hold more information specific to physical campuses
CREATE TABLE physicalCampus(
campusID char(8) PRIMARY KEY NOT NULL
foreign key references campus(campusID)
ON UPDATE CASCADE,
suburb varchar(50),
country varchar(50));

--term stores the different semesters
CREATE TABLE term(
termID char(8) PRIMARY KEY NOT NULL,
semester smallint,
year char(4));

--courseOffering stores data about when a course is offered in a semester
CREATE TABLE courseOffering(
offeringID char(8) PRIMARY KEY NOT NULL,
courseID char(8) foreign key references course(courseID)
ON UPDATE CASCADE,
staffID char(8) foreign key references staff(staffID)
ON UPDATE CASCADE,
termID char(8) foreign key references term(termID)
ON UPDATE CASCADE,
campusID char(8) foreign key references campus(campusID)
ON UPDATE CASCADE);

--Courses offered on physical campuses have facilities within them
CREATE TABLE facility(
facilityID char(8) Primary Key NOT NULL,
roomNo smallint,
buildingName varchar(50),
capacity smallint,
type varchar(20),
campusID char(8) foreign key references campus(campusID)
ON UPDATE CASCADE);

--Physically offered courses have facilities they are taught in
CREATE TABLE possesses(
facilityID char(8) foreign key references facility(facilityID) NOT NULL,
offeringID char(8) foreign key references courseOffering(offeringID) NOT NULL,
time time,
day date);

--Stores the courses that are a part of a programme
CREATE TABLE has(
courseID char(8) foreign key references course(courseID)
ON UPDATE CASCADE,
programmeCode char(8) foreign key references programme(programmeCode)
ON UPDATE CASCADE,
type varchar (20));








