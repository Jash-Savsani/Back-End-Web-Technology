--Lab-3	Advanced Stored Procedure
--Part – A 
--1.	Create a stored procedure that accepts a date and returns all faculty members who joined on that date.
CREATE OR ALTER PROC PR_RTN_FACL_NAME
@DATE Date,
@FAC_NAME VARCHAR(50) OUT
AS 
BEGIN
	SELECT @FAC_NAME=FacultyName
	FROM FACULTY
	WHERE FacultyJoiningDate=@DATE;
END

DECLARE @Faculty_Name VARCHAR(50)
EXEC PR_RTN_FACL_NAME '2008-03-25',@Faculty_Name OUT
SELECT @Faculty_Name As Faculties
--2.	Create a stored procedure for ENROLLMENT table where user enters either StudentID or EnrollmentID and returns EnrollmentID, EnrollmentDate, Grade, and Status.
GO
CREATE OR ALTER PROC PR_ENROLL_DETAILS
@ST_ID INT =NULL,
@COURSE_ID VARCHAR(10) = NULL
AS
BEGIN 
	SELECT EnrollmentID,EnrollmentDate,Grade,EnrollmentStatus
	FROM ENROLLMENT
	WHERE StudentID=@ST_ID OR CourseID=@COURSE_ID
END

EXEC PR_ENROLL_DETAILS 2
EXEC PR_ENROLL_DETAILS 'CS101'--THIS GIVE ERROR
EXEC PR_ENROLL_DETAILS @COURSE_ID='CS101'
--3.	Create a stored procedure that accepts two integers (min and max credits) and returns all courses whose credits fall between these values.
GO
CREATE OR ALTER PROC PR_MIN_MAX_TWO_CREDITS
@MIN INT = NULL,
@MAX INT =NULL
AS 
BEGIN
	SELECT *
	FROM COURSE
	WHERE CourseCredits BETWEEN @MIN AND @MAX
END

EXEC PR_MIN_MAX_TWO_CREDITS 3,4
--4.	Create a stored procedure that accepts Course Name and returns the list of students enrolled in that course.
GO
CREATE OR ALTER PROC PR_LIST_OF_STU
@Course_Name VARCHAR(50) = NULL
AS
BEGIN
	SELECT S.StuName,C.CourseName
	FROM STUDENT S
	JOIN ENROLLMENT E
	ON E.StudentID = S.StudentID
	JOIN COURSE C
	ON C.CourseID = E.CourseID
	WHERE C.CourseName=@Course_Name
END

EXEC PR_LIST_OF_STU 'Software Engineering'
--5.	Create a stored procedure that accepts Faculty Name and returns all course assignments.
GO
CREATE OR ALTER PROC PR_ALL_COURSE
@FACL_NAME VARCHAR(50) = NULL
AS
BEGIN
	SELECT C.CourseID,C.CourseName,F.FacultyName
	FROM COURSE C
	JOIN COURSE_ASSIGNMENT C_A
	ON C_A.CourseID = C.CourseID
	JOIN FACULTY F
	ON F.FacultyID=C_A.FacultyID
	WHERE F.FacultyName = @FACL_NAME
END

EXEC PR_ALL_COURSE 'Dr. Iyer'
--6.	Create a stored procedure that accepts Semester number and Year, and returns all course assignments with faculty and classroom details.
GO
CREATE OR ALTER PROC PR_COURSE_FACUL_CLASSROOM
@Sem INT = NULL,
@Year INT = NULL
AS
BEGIN
	SELECT C_A.CourseID,C_A.FacultyID,F.FacultyName,C.CourseName
	FROM COURSE_ASSIGNMENT C_A
	JOIN COURSE C
	ON C.CourseID=C_A.CourseID
	JOIN FACULTY F
	ON F.FacultyID=C_A.FacultyID
	WHERE C_A.Semester=@Sem AND C_A.Year=@Year
END

EXEC PR_COURSE_FACUL_CLASSROOM 3,2024
--Part – B 
--7.	Create a stored procedure that accepts the first letter of Status ('A', 'C', 'D') and returns enrollment details.
GO
CREATE OR ALTER PROC PR_ENROLL_DETAILS
@Status VARCHAR(1) = NULL
AS
BEGIN
	SELECT *
	FROM ENROLLMENT
	WHERE EnrollmentStatus LIKE @Status+'%';
END

EXEC PR_ENROLL_DETAILS 'D'
--8.	Create a stored procedure that accepts either Student Name OR Department Name and returns student data accordingly.
GO
CREATE OR ALTER PROC PR_STU_DATA
@NAME VARCHAR(50) = NULL
AS
BEGIN
	SELECT *
	FROM STUDENT
	WHERE StuName=@NAME OR StuDepartment=@NAME
END

EXEC PR_STU_DATA 'Priya Shah'
EXEC PR_STU_DATA 'ECE'
--9.	Create a stored procedure that accepts CourseID and returns all students enrolled grouped by enrollment status with counts.
GO
CREATE OR ALTER PROC PR_ALL_ENROLL_STU
@Course_Id VARCHAR(10) = NULL
AS
BEGIN 
	SELECT E.EnrollmentStatus ,COUNT(S.StudentID) AS TOTAL_STUDENTS_PER_STATUS
	FROM ENROLLMENT E
	JOIN STUDENT S
	ON S.StudentID = E.StudentID
	WHERE E.CourseID = @Course_Id
	GROUP BY E.EnrollmentStatus
END

EXEC PR_ALL_ENROLL_STU 'CS201'
--Part – C 
--10.	Create a stored procedure that accepts a year as input and returns all courses assigned to faculty in that year with classroom details.
GO
CREATE OR ALTER PROC PR_ALL_COURSE_DETAILS
@Year INT = NULL
AS
BEGIN
	SELECT C_A.Year, C_A.ClassRoom,F.FacultyName
	FROM COURSE_ASSIGNMENT C_A
	JOIN FACULTY F
	ON F.FacultyID = C_A.FacultyID
	WHERE C_A.Year = @Year
END

EXEC PR_ALL_COURSE_DETAILS 2024
--11.	Create a stored procedure that accepts From Date and To Date and returns all enrollments within that range with student and course details.
GO
CREATE OR ALTER PROC PR_DATE_BASE_STU_COURSE_DETAILS
@FROM DATE,
@TO DATE
AS
BEGIN
	SELECT S.StuName,E.EnrollmentDate,C.CourseName
	FROM STUDENT S
	JOIN ENROLLMENT E
	ON S.StudentID = E.StudentID
	JOIN COURSE C
	ON C.CourseID=E.CourseID
	WHERE E.EnrollmentDate BETWEEN @FROM AND @TO;
END

EXEC PR_DATE_BASE_STU_COURSE_DETAILS '2020-07-01','2021-07-01';
--12.	Create a stored procedure that accepts FacultyID and calculates their total teaching load (sum of credits of all courses assigned).
GO
CREATE OR ALTER PROC PR_TEACH_LOAD
@FACL_ID INT = NULL
AS
BEGIN
	SELECT F.FacultyName,SUM(C.CourseCredits) AS TOTAL_WORKLOAD
	FROM FACULTY F
	JOIN COURSE_ASSIGNMENT C_A
	ON C_A.FacultyID = F.FacultyID
	JOIN COURSE C
	ON C.CourseID = C_A.CourseID
	WHERE F.FacultyID=@FACL_ID
	GROUP BY F.FacultyName
END

EXEC PR_TEACH_LOAD 101


--SP TO FIND NUMBER OF COURSE OFFERED BY GIVEN DEPARTMENT (USING OUT PARAMETER)
GO
CREATE OR ALTER PROC PR_COUNT_COURSE
@DEPT_NAME VARCHAR(50) = NULL,
@COUNT INT OUT
AS
BEGIN 
	SELECT @COUNT = COUNT(CourseID)
	FROM COURSE
	WHERE CourseDepartment = @DEPT_NAME
	GROUP BY CourseDepartment
END

DECLARE @ANS INT 
EXEC PR_COUNT_COURSE 'IT',@ANS OUT
SELECT @ANS AS TOTAL_NUMBER_OF_COURSE