--Drops the trigger if it exists to refresh
DROP TRIGGER tr_EnforcePrerequisitePolicy

--Creates a new trigger that checks if they have the prerequisit knowledge
CREATE TRIGGER tr_EnforcePrerequisitePolicy
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
		RAISERROR ('A student must have completed the prerequisite course', 9 ,1 ) --Triggers if the student doesn't have the prerequisit knowledge
		ROLLBACK TRANSACTION
	END
END


