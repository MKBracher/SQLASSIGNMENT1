--Declaring the prcedure
DECLARE @courseOfferingListTableType courseOfferingListTableType

--Registering students for courses
INSERT INTO @courseOfferingListTableType VALUES ('CO000001')
INSERT INTO @courseOfferingListTableType VALUES ('CO000002')
INSERT INTO @courseOfferingListTableType VALUES ('CO000004')

--Executes the stored procedure
EXECUTE usp_RegisterForCourses 'C0000001', @courseOfferingListTableType

--Selects all data from enrolledIn table
SELECT * FROM enrolledIn