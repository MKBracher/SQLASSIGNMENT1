DROP TYPE IF EXISTS courseOfferingListTableType



CREATE TYPE courseOfferingListTableType AS TABLE
(
	offeringID char(8)
	)
GO



CREATE PROCEDURE usp_RegisterForCourses
@studentNumber char(8),
@courseOfferingList courseOfferingListTableType READONLY 

AS
BEGIN
	INSERT INTO enrolledIn(studentID, offeringID)
	SELECT @studentNumber AS studentID,
	offeringID FROM @courseOfferingList

END

DROP PROCEDURE IF EXISTS usp_RegisterForCourses



DECLARE @courseOfferingListTableType courseOfferingListTableType

INSERT INTO @courseOfferingListTableType VALUES ('CO000001')
INSERT INTO @courseOfferingListTableType VALUES ('CO000002')
INSERT INTO @courseOfferingListTableType VALUES ('CO000004')


EXECUTE usp_RegisterForCourses 'C0000001', @courseOfferingListTableType


SELECT * FROM enrolledIn


DELETE FROM enrolledIn
	
	