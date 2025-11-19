create table Faculties(
FacultyID int Primary key identity(1,1),
FacultyName nvarchar(100)not null,
DeanName nvarchar(100)
)
create table Students(
StudentID int Primary Key identity(1,1),
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
FacultyId int Foreign key references Faculties(FacultyID),
EnrollmentYear int

)
create table Courses(
CourseID  int Primary Key identity(1,1),
CourseName  nvarchar(100) NOT NULL,
Credits  INT,
FacultyID  INT Foreign Key references Faculties(FacultyID)
)
Create table Grade(
GradeId int primary key identity(1,1),
StudentID int Foreign key references Students(StudentID) ,
CourseID int foreign key references Courses(CourseID),
Grade decimal(4,2),
Semester nvarchar(20)

)
select * from Courses
select * from Faculties
select * from Grade
select * from Students

SELECT S.FirstName, S.LastName, C.CourseName, G.Grade
FROM Grade G
JOIN Students S ON G.StudentID = S.StudentID
JOIN Courses C ON G.CourseID = C.CourseID
WHERE G.Grade > 80
ORDER BY G.Grade DESC;

select * from Students 
where EnrollmentYear=2022 and
 FacultyId=1


 SELECT S.FirstName, S.LastName, C.CourseName, G.Grade,F.FacultyName 
FROM Grade G
JOIN Students S ON G.StudentID = S.StudentID
JOIN Courses C ON G.CourseID = C.CourseID
JOIN Faculties F ON S.FacultyID = F.FacultyID;

 SELECT S.FirstName, S.LastName, C.CourseName, G.Grade,F.FacultyName 
FROM Students S
 Left JOIN Grade G  ON G.StudentID = S.StudentID
LEft JOIN Courses C ON G.CourseID = C.CourseID
 Left JOIN Faculties F ON S.FacultyID = F.FacultyID;


 select C.CourseName,G.Grade,S.FirstName from Courses C
 Left Join Grade G on  C.CourseID=G.CourseID
 Left Join Students S on G.StudentID= S.StudentID
  
 SELECT 
    C.CourseName,
    S.FirstName,
    S.LastName,
    G.Grade
FROM Courses C
LEFT JOIN Grade G ON C.CourseID = G.CourseID
LEFT JOIN Students S ON G.StudentID = S.StudentID;
