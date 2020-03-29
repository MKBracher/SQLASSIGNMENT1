DROP TABLE IF EXISTS has
DROP TABLE IF EXISTS possesses
DROP TABLE IF EXISTS facility
DROP TABLE IF EXISTS courseOffering
DROP TABLE IF EXISTS term  
DROP TABLE IF EXISTS physicalCampus
DROP TABLE IF EXISTS campus
DROP TABLE IF EXISTS assumedKnowledge
DROP TABLE IF EXISTS course
DROP TABLE IF EXISTS student
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





CREATE TABLE majorMinor (
mCode char(8) PRIMARY KEY NOT NULL,
name varchar(255), 
mEither char(5) NOT NULL, 
credits smallint,
conditions varChar(255),
CHECK (mEither = 'Major' OR mEither = 'Minor'));

CREATE TABLE staff (
staffID char(8) PRIMARY KEY NOT NULL,
role char(255) NOT NULL,
firstName varchar(255),
lastName varchar(255),
address varchar(255),
contactNo varchar(20));



CREATE TABLE orgUnit (
unitID char(8) PRIMARY KEY NOT NULL,
name varchar(255),
description varchar(255),
contactNo varchar(20));

CREATE TABLE subUnit (
unitID char(8) PRIMARY KEY NOT NULL
foreign key references orgUnit(unitID)
ON UPDATE CASCADE,
subUnitID char(8) UNIQUE,
subUnitName varchar(50));

CREATE TABLE contain (
staffID char(8) foreign key references staff(staffID) NOT NULL,
unitID char(8) foreign key references orgUnit(unitID) NOT NULL,
startDate date,
endDate date,
role varchar(50));

CREATE TABLE certification(
level char(4) PRIMARY KEY NOT NULL,
certAchieved varchar(50));

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

CREATE TABLE staffConvenor (
    staffID char(8) PRIMARY KEY NOT NULL
    foreign key references staff(staffID), 
    programmeCode char(8) foreign key references programme(programmeCode)
	ON UPDATE CASCADE,
    startDate date,
    endDate date);

CREATE TABLE enrollment(
enrollmentID char(8) PRIMARY KEY NOT NULL,
enrollDate date,
completionDate date,
status varchar(20),
programmeCode char(8)
foreign key references Programme(programmeCode)
ON UPDATE CASCADE);

CREATE TABLE student (
studentID char(8) PRIMARY KEY NOT NULL,
firstName varchar(255),
lastName varchar(255),
address varchar(255),
contactNumber varchar(20),
enrollmentID char(8) 
foreign key references enrollment(enrollmentID)
ON UPDATE CASCADE);

CREATE TABLE course(
courseID char(8) PRIMARY KEY NOT NULL,
name varchar(255),
credits smallint,
description varchar(255));

CREATE TABLE assumedKnowledge(
courseID char(8) PRIMARY KEY foreign key references course(courseID),
assumedID char(8) foreign key references course(courseID)
ON UPDATE CASCADE);

CREATE TABLE campus(
campusID char(8) PRIMARY KEY NOT NULL,
name varchar(20));

CREATE TABLE physicalCampus(
campusID char(8) PRIMARY KEY NOT NULL
foreign key references campus(campusID)
ON UPDATE CASCADE,
suburb varchar(50),
country varchar(50));

CREATE TABLE term(
termID char(8) PRIMARY KEY NOT NULL,
semester smallint,
year char(4));

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

CREATE TABLE facility(
facilityID char(8) Primary Key NOT NULL,
roomNo smallint,
buildingName varchar(50),
capacity smallint,
type varchar(20),
campusID char(8) foreign key references campus(campusID)
ON UPDATE CASCADE);


CREATE TABLE possesses(
facilityID char(8) foreign key references facility(facilityID) NOT NULL,
offeringID char(8) foreign key references courseOffering(offeringID) NOT NULL,
time time,
day date);

CREATE TABLE has(
courseID char(8) foreign key references course(courseID)
ON UPDATE CASCADE,
programmeCode char(8) foreign key references programme(programmeCode)
ON UPDATE CASCADE,
type varchar (20));








