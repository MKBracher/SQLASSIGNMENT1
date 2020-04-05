
CREATE TRIGGER tr_fuckrightoff ON enrolledIN
FOR UPDATE, INSERT
AS


@requiredCourse = SELECT assumedID FROM assumedKnowledge 
				WHERE inserted.courseID = assumedID

IF EXISTS (SELECT *
	FROM enrolledIn.offeringID o
	IF student.studentID = courseOffering.studentID and
	courseOffering.OfferingID = course.courseID and
	student.course





	
		