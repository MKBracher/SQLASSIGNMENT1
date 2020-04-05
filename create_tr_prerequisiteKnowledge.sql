DROP TRIGGER tr_EnforceCourseRepetitionPolicy

CREATE TRIGGER tr_EnforceCourseRepetitionPolicy
ON enrolledIn
FOR UPDATE, INSERT
AS 
BEGIN
	IF (NOT EXISTS( SELECT *
		FROM inserted i,  enrolledIn e, course c, courseOffering O
		WHERE i.studentID = e.studentID and
		e.completionStatus = 'Completed' and
		e.offeringID = o.offeringID and
		o.courseID = c.assumedKnowledge 
		))

	BEGIN
		RAISERROR ('A student must have completed the prerequisite course', 9 ,1 )
		ROLLBACK TRANSACTION
	END
END



