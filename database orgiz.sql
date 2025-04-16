go

create table [Admin]
(
AdminID char(5) primary key,	
[Password] varchar (20) NOT NULL
)

INSERT INTO [Admin] (AdminID, [Password])
VALUES ('ILM-1', 12345);

select * from [Admin] where AdminID = 'ILM-1' AND [Password] = '12345'

go

create table Teacher
(
FName varchar(40) NOT NULL,	
TeacherID char(9) primary key,
[Password] varchar (20) NOT NULL,
Email varchar(30) UNIQUE NOT NULL
)

create procedure insert_teacher
(
@FName varchar(40),
@TeachcerID char(9),
@Password varchar(20),
@Email varchar(30)
)
as 
begin
insert into Teacher
values(
@FName,
@TeachcerID,
@Password,
@Email
)
end

select * from Teacher

INSERT INTO Teacher (FName, TeacherID, [Password], Email)
VALUES ('M. Arsalan', 'ILMT-0001', '1122', 'arsalan123@gmail.com');

go

CREATE TABLE Student
(
FName varchar(40) NOT NULL,	
StudentID char(9) primary key,
[Password] varchar (20) NOT NULL,
Phoneno char(11) NOT NULL,
Email varchar(30) UNIQUE NOT NULL,	
[Address] varchar(100) NOT NULL
)

create procedure check_student
(
@StudentID char(9)
)
AS
BEGIN
SELECT @StudentID from Student
WHERE
@StudentID = StudentID
END

execute check_student 'ILMS-0001'

create procedure insert_student
(

@FName varchar(40),
@StudentID char(9),
@Password varchar(20),
@Phoneno char(11),
@Email varchar(30),
@Address varchar(100)
)
as 
begin
insert into Student
values(
@FName,
@StudentID,
@Password,
@Phoneno,
@Email,
@Address
)
end



create procedure update_student
(

@FName varchar(40),
@StudentID char(9),
@Password varchar(20),
@Phoneno char(11),
@Email varchar(30),
@Address varchar(100)
)
as 
begin
UPDATE Student SET
FName = @FName,
[Password] = @Password,
Phoneno = @Phoneno,
Email = @Email,
[Address] = @Address

where StudentID = @StudentID 

end

create procedure delete_student
(
@StudentID char(9)
)
as 
begin
DELETE FROM Student
WHERE StudentID = @StudentID
END

select * from Student

go


create table Courses
(
CourseID char(8) primary key,
CourseName varchar(50) NOT NULL
)

create procedure insert_Course
(
@CourseID char(8),
@CourseName varchar(50)
)
as 
begin
insert into Courses
values(
@CourseID,
@CourseName
)
end

create procedure update_course
(
@CourseID char(8),
@CourseName varchar(50)
)
as 
begin
UPDATE Courses SET
CourseName = @CourseName

where CourseID = @CourseID

end



create procedure check_course
(
@CourseID char(9)
)
AS
BEGIN
SELECT @CourseID from Courses
WHERE
@CourseID = CourseID
END



select * from Courses



go

create table TeacherCourse
(
TeacherID char(9) foreign key references Teacher(TeacherID)
ON UPDATE CASCADE ON DELETE CASCADE,
CourseID char(8) foreign key references Courses(CourseID)
ON UPDATE CASCADE ON DELETE CASCADE,
primary key (TeacherID,CourseID)
)
INSERT INTO TeacherCourse(TeacherID, CourseID)
VALUES ('BCS123', 'BCS-2002');

DELETE FROM TeacherCourse WHERE TeacherID = '123-ABC' AND CourseID = 'BCS-2002';

select * from TeacherCourse

go

create table Attendance
(
StudentID char(9) foreign key references Student(StudentID)
ON UPDATE CASCADE ON DELETE CASCADE,
CourseID char(8) foreign key references Courses(CourseID)
ON UPDATE CASCADE ON DELETE CASCADE,
LectureNo int NOT NULL,
[Status] char(1)  NOT NULL
primary key (LectureNo,CourseID)
)

Insert Into Attendance(StudentID, CourseID,LectureNo, [Status])
VALUES
('ILMS-01', 'FSC-01', 1, 'P')

select * from Attendance
go

select * from Attendance

create procedure update_attendance
(
@StudentID char(9),
@LectureNo int,
@Status char(1)
)
as 
begin
UPDATE Attendance SET
LectureNo = @LectureNo,
[Status] = @Status


where StudentID = @StudentID 

end

create table StudentCourse
(
StudentID char(9) foreign key references Student(StudentID)
ON UPDATE CASCADE ON DELETE CASCADE,
CourseID char(8) foreign key references Courses(CourseID)
ON UPDATE CASCADE ON DELETE CASCADE,
Marks int CHECK (Marks <= 100),
primary key (StudentID,CourseID)
)

create procedure update_marks
(
@StudentID char(9),
@CourseID char(8),
@Marks int
)
as 
begin
UPDATE StudentCourse SET
Marks = @Marks

where StudentID = @StudentID AND CourseID = @CourseID

end






select * from StudentCourse

create procedure student_allotcourse
(
@StudentID char (9), 
@CourseID char(8) 

)
AS
BEGIN
INSERT INTO StudentCourse
VALUES
(
@StudentID,
@CourseID,
0
)
end

create procedure teacher_session
(
@TeacherID char(9)
)
AS
BEGIN
select * from Teacher 
Where
TeacherID = @TeacherID
end


drop procedure student_allotcourse

create procedure delete_studentcourse
(
@StudentID char(9),
@CourseID char(8)
)
as 
begin
DELETE FROM StudentCourse
WHERE StudentID = @StudentID AND CourseID = @CourseID

END

go

create table Marks
(
StudentID char(9) foreign key references Student(StudentID)
ON UPDATE CASCADE ON DELETE CASCADE,
CourseID char(8) foreign key references Courses(CourseID)
ON UPDATE CASCADE ON DELETE CASCADE,
Marks int NOT NULL
)

go


create table Leave
(
 [message] varchar(150),
 primary key ([message])
)

create procedure insert_student_leave
(
@message varchar(150)

)
as 
begin
insert into teacherleave
values(
@message

)
end

go

create table teacherleave
(
[message] varchar(150),
primary key ([message])
)

create table feedback
(
[message] varchar(150),
primary key ([message])
)

create procedure insert_feedback
(
@message varchar(150)
)
as 
begin
insert into feedback
values(
@message
)
end

drop procedure insert_feedback

create procedure insert_teacher_leave
(
@message varchar(150)

)
as 
begin
insert into teacherleave
values(
@message

)
end

create table LostandFound
(
 [message] varchar(150),
 primary key ([message])
)

create procedure insert_lostandfound
(
@message varchar(150)

)
as 
begin
insert into LostandFound
values(
@message

)
end

select * from Courses