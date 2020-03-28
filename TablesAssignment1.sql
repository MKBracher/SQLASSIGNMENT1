DROP TABLE IF EXISTS majorMinor
DROP TABLE IF EXISTS  staff
DROP TABLE IF EXISTS academicStaff
DROP TABLE IF EXISTS administrationStaff
DROP TABLE IF EXISTS orgUnit
DROP TABLE IF EXISTS subUnit
DROP TABLE IF EXISTS Contain
DROP TABLE IF EXISTS certification
DROP TABLE IF EXISTS Programme
DROP TABLE IF EXISTS enrollment
DROP TABLE IF EXISTS student
DROP TABLE IF EXISTS course
DROP TABLE IF EXISTS assumedKnowledge
DROP TABLE IF EXISTS campus
DROP TABLE IF EXISTS physicalCampus
DROP TABLE IF EXISTS term  
DROP TABLE IF EXISTS courseOffering
DROP TABLE IF EXISTS facility
DROP TABLE IF EXISTS possesses
DROP TABLE IF EXISTS Has



CREATE TABLE majorMinor (
mCode char(8) PRIMARY KEY NOT NULL,
name varchar(255), 
credits smallint,
conditions varChar(255));

CREATE TABLE staff (
staffID char(8) PRIMARY KEY NOT NULL,
name varchar(255),
address varchar(255),
contactNo varchar(20));

CREATE TABLE academicStaff (
staffID char(8) PRIMARY KEY NOT NULL
foreign key references staff(staffID),
academicPrivileges varchar(255));

CREATE TABLE administrationStaff (
staffID char(8) PRIMARY KEY NOT NULL
foreign key references staff(staffID),
adminPrivileges varchar(255));

CREATE TABLE orgUnit (
unitID char(8) PRIMARY KEY NOT NULL,
name varchar(255),
description varchar(255),
contactNo varchar(20));

CREATE TABLE subUnit (
unitID char(8) PRIMARY KEY NOT NULL
foreign key references orgUnit(unitID),
subUnitID char(8) UNIQUE,
subUnitName varchar(50));

CREATE TABLE Contain (
staffID char(8) foreign key references staff(staffID),
unitID char(8) foreign key references orgUnit(unitID),
startDate date,
endDate date,
role varchar(50));

CREATE TABLE certification(
certAchieved varchar(20) PRIMARY KEY NOT NULL,
level char(4));

CREATE TABLE Programme ( 
programmeCode char(8) PRIMARY KEY NOT NULL,
name varchar(255) NOT NULL,
creditsToComplete smallint,
level char(4),
certAchieved varchar(20) foreign key references certification(certAchieved),
unitID char(8) foreign key references orgUnit(unitID),
convenorStartDate date,
convenorEndDate date, 
mCode char(8) foreign key references majorMinor(mCode));

CREATE TABLE enrollment(
enrollmentID char(8) PRIMARY KEY NOT NULL,
enrollDate date,
completionDate date,
status varchar(20),
programmeCode char(8)
foreign key references Programme(programmeCode));

CREATE TABLE student (
studentID char(8) PRIMARY KEY NOT NULL,
name varchar(255),
address varchar(255),
contactNumber varchar(20),
enrollmentID char(8) 
foreign key references enrollment(enrollmentID));

CREATE TABLE course(
courseID char(8) PRIMARY KEY NOT NULL,
name varchar(255),
credits smallint,
description varchar(255));

CREATE TABLE assumedKnowledge(
courseID char(8) PRIMARY KEY foreign key references course(courseID),
assumedID char(8) foreign key references course(courseID));

CREATE TABLE campus(
campusID char(8) PRIMARY KEY NOT NULL,
name varchar(20));

CREATE TABLE physicalCampus(
campusID char(8) PRIMARY KEY 
foreign key references campus(campusID),
suburb varchar(50),
country varchar(50));

CREATE TABLE term(
termID char(8) PRIMARY KEY NOT NULL,
name varchar(20),
year char(4));

CREATE TABLE courseOffering(
offeringID char(8) PRIMARY KEY NOT NULL,
courseID char(8) foreign key references course(courseID),
staffID char(8) foreign key references staff(staffID),
termID char(8) foreign key references term(termID),
campusID char(8) foreign key references campus(campusID));

CREATE TABLE facility(
facilityID char(8) Primary Key NOT NULL,
roomNo smallint,
buildingName varchar(50),
capacity smallint,
type varchar(20),
campusID char(8) foreign key references campus(campusID));


CREATE TABLE possesses(
facilityID char(8) foreign key references facility(facilityID),
offeringID char(8) foreign key references courseOffering(offeringID),
time time,
day date);

CREATE TABLE Has(
courseID char(8) foreign key references course(courseID),
programmeCode char(8) foreign key references programme(programmeCode),
type varchar (20));








