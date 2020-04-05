--Drops type to refresh
DROP TYPE IF EXISTS courseOfferingListTableType


--Creates the type 'courseOfferingListTableType'
CREATE TYPE courseOfferingListTableType AS TABLE
(
	offeringID char(8)
	)
GO


--Enrols a student in a course
CREATE PROCEDURE usp_RegisterForCourses
@studentNumber char(8),
@courseOfferingList courseOfferingListTableType READONLY 

AS
BEGIN
	INSERT INTO enrolledIn(studentID, offeringID)
	SELECT @studentNumber AS studentID,
	offeringID FROM @courseOfferingList

END

--Drops procedure to refresh
DROP PROCEDURE IF EXISTS usp_RegisterForCourses
	