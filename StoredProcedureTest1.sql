

CREATE TYPE courseEnrollmentTableType AS TABLE
(
	studentID char(8),
	courseID char(8),
	grade char(2),
	completionStatus varchar(20)
	)
GO
	
DROP TYPE courseEnrollmentTableType


CREATE PROCEDURE usp_RegisterForCourses
@courseID courseEnrollmentTableType READONLY
AS
BEGIN
	INSERT INTO courseEnrollment
	SELECT * FROM @courseID
	if @courseID 
END

DROP PROCEDURE usp_RegisterForCourses



DECLARE @courseEnrollmentTableType courseEnrollmentTableType

INSERT INTO @courseEnrollmentTableType VALUES ('C0000002', 'COMP1140', NULL, 'FAILED')
INSERT INTO @courseEnrollmentTableType VALUES ('C0000003', 'COMP1140', '55', 'COMPLETED')


EXECUTE usp_RegisterForCourses @courseEnrollmentTableType

SELECT * FROM courseEnrollment
WHERE studentID = 'C0000001' AND
courseID = 'MATH1002'




CREATE PROCEDURE usp_deleteRegister
@courseID courseEnrollmentTableType READONLY
AS
BEGIN
	DELETE courseEnrollment
	SELECT * FROM @courseID
END

DROP PROCEDURE usp_RegisterForCourses