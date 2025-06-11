create database UniversityDb;
go

use UniversityDb;


-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY ,
    DepartmentName VARCHAR(100) UNIQUE NOT NULL,
    Building VARCHAR(100),
    HeadOfDepartmentID INT NULL
);

-- Table: Faculty
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Designation VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Update Departments table to reference Faculty
ALTER TABLE Departments ADD CONSTRAINT FK_HeadOfDepartment FOREIGN KEY (HeadOfDepartmentID) REFERENCES Faculty(FacultyID);

-- Table: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Gender VARCHAR(10),
    DOB DATE,
    DepartmentID INT,
    Address VARCHAR(255),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY,
    CourseName VARCHAR(100),
    CreditHours INT,
    DepartmentID INT,
    FacultyID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Table: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table: Exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY IDENTITY,
    CourseID INT,
    ExamType VARCHAR(50),
    ExamDate DATE,
    TotalMarks INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table: Results
CREATE TABLE Results (
    ResultID INT PRIMARY KEY IDENTITY,
    StudentID INT,
    CourseID INT,
    ExamID INT,
    Grade VARCHAR(5),
    Remarks VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

-- Table: Assignments
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY IDENTITY,
    CourseID INT,
    FacultyID INT,
    Title VARCHAR(100),
    Description TEXT,
    DueDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Table: Classrooms
CREATE TABLE Classrooms (
    ClassroomID INT PRIMARY KEY IDENTITY,
    RoomNumber VARCHAR(20),
    Capacity INT,
    Building VARCHAR(100)
);

-- Table: Schedules
CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY IDENTITY,
    CourseID INT,
    FacultyID INT,
    ClassroomID INT,
    Day VARCHAR(15),
    StartTime TIME,
    EndTime TIME,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID)
);

-- Table: Fees
CREATE TABLE Fees (
    FeeID INT PRIMARY KEY IDENTITY,
    StudentID INT,
    Amount DECIMAL(10,2),
    DueDate DATE,
    PaidDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Table: Attendance
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY,
    StudentID INT,
    CourseID INT,
    Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table: Admins
CREATE TABLE Admins (
    AdminID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255),
    Role VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO Departments (DepartmentName, Building, HeadOfDepartmentID) VALUES
('Computer Science', 'Block A', NULL),
('Mathematics', 'Block B', NULL),
('Physics', 'Block C', NULL),
('Chemistry', 'Block D', NULL),
('English', 'Block E', NULL),
('Economics', 'Block F', NULL),
('Biology', 'Block G', NULL),
('Psychology', 'Block H', NULL),
('History', 'Block I', NULL),
('Islamic Studies', 'Block J', NULL);

INSERT INTO Faculty ( FirstName, LastName, Email, Phone, Designation, DepartmentID) VALUES
( 'Ahmed', 'Khan', 'ahmed.khan@univ.edu', '03001234567', 'Professor', 1),
( 'Sara', 'Ali', 'sara.ali@univ.edu', '03111234567', 'Associate Professor', 2),
( 'Imran', 'Malik', 'imran.malik@univ.edu', '03221234567', 'Lecturer', 3),
( 'Zara', 'Hassan', 'zara.hassan@univ.edu', '03331234567', 'Assistant Professor', 4),
( 'Nadia', 'Iqbal', 'nadia.iqbal@univ.edu', '03441234567', 'Professor', 5),
( 'Bilal', 'Shaikh', 'bilal.shaikh@univ.edu', '03551234567', 'Lecturer', 6),
( 'Usman', 'Raza', 'usman.raza@univ.edu', '03661234567', 'Assistant Professor', 7),
( 'Maryam', 'Aziz', 'maryam.aziz@univ.edu', '03771234567', 'Professor', 8),
( 'Ahsan', 'Yousuf', 'ahsan.yousuf@univ.edu', '03881234567', 'Associate Professor', 9),
( 'Hira', 'Naseer', 'hira.naseer@univ.edu', '03991234567', 'Lecturer', 10);

INSERT INTO Students ( FirstName, LastName, Email, Phone, Gender, DOB, DepartmentID, Address) VALUES
( 'Ali', 'Raza', 'ali.raza@student.edu', '03001230000', 'Male', '2002-05-10', 1, 'Islamabad'),
( 'Fatima', 'Noor', 'fatima.noor@student.edu', '03001230001', 'Female', '2003-02-14', 2, 'Lahore'),
( 'Omar', 'Shahid', 'omar.shahid@student.edu', '03001230002', 'Male', '2001-09-20', 1, 'Karachi'),
( 'Ayesha', 'Kamal', 'ayesha.kamal@student.edu', '03001230003', 'Female', '2002-12-12', 3, 'Peshawar'),
( 'Danish', 'Iqbal', 'danish.iqbal@student.edu', '03001230004', 'Male', '2000-11-11', 4, 'Quetta'),
( 'Zainab', 'Aslam', 'zainab.aslam@student.edu', '03001230005', 'Female', '2003-03-03', 5, 'Faisalabad'),
( 'Hassan', 'Ali', 'hassan.ali@student.edu', '03001230006', 'Male', '2002-06-06', 6, 'Sialkot'),
( 'Mariam', 'Farooq', 'mariam.farooq@student.edu', '03001230007', 'Female', '2001-07-07', 7, 'Multan'),
( 'Noman', 'Zafar', 'noman.zafar@student.edu', '03001230008', 'Male', '2002-01-01', 8, 'Rawalpindi'),
( 'Sana', 'Ahmed', 'sana.ahmed@student.edu', '03001230009', 'Female', '2003-04-04', 9, 'Bahawalpur');

-- Update HeadOfDepartmentID in Departments table
UPDATE Departments SET HeadOfDepartmentID = 1 WHERE DepartmentID = 1; -- Ahmed Khan is Head of Computer Science
UPDATE Departments SET HeadOfDepartmentID = 2 WHERE DepartmentID = 2; -- Sara Ali is Head of Mathematics
UPDATE Departments SET HeadOfDepartmentID = 3 WHERE DepartmentID = 3; -- Imran Malik is Head of Physics
UPDATE Departments SET HeadOfDepartmentID = 4 WHERE DepartmentID = 4; -- Zara Hassan is Head of Chemistry
UPDATE Departments SET HeadOfDepartmentID = 5 WHERE DepartmentID = 5; -- Nadia Iqbal is Head of English
UPDATE Departments SET HeadOfDepartmentID = 6 WHERE DepartmentID = 6; -- Bilal Shaikh is Head of Economics
UPDATE Departments SET HeadOfDepartmentID = 7 WHERE DepartmentID = 7; -- Usman Raza is Head of Biology
UPDATE Departments SET HeadOfDepartmentID = 8 WHERE DepartmentID = 8; -- Maryam Aziz is Head of Psychology
UPDATE Departments SET HeadOfDepartmentID = 9 WHERE DepartmentID = 9; -- Ahsan Yousuf is Head of History
UPDATE Departments SET HeadOfDepartmentID = 10 WHERE DepartmentID = 10; -- Hira Naseer is Head of Islamic Studies


-- Sample data for Courses
INSERT INTO Courses (CourseName, CreditHours, DepartmentID, FacultyID) VALUES
('Introduction to Programming', 3, 1, 1),
('Calculus I', 3, 2, 2),
('Classical Mechanics', 3, 3, 3),
('Organic Chemistry', 4, 4, 4),
('English Literature I', 3, 5, 5),
('Microeconomics', 3, 6, 6),
('Cell Biology', 4, 7, 7),
('General Psychology', 3, 8, 8),
('World History', 3, 9, 9),
('Fiqh & Usul-e-Fiqh', 3, 10, 10),
('Data Structures', 3, 1, 1),
('Linear Algebra', 3, 2, 2),
('Electromagnetism', 3, 3, 3),
('Physical Chemistry', 4, 4, 4),
('Creative Writing', 3, 5, 5),
('Macroeconomics', 3, 6, 6),
('Genetics', 4, 7, 7),
('Cognitive Psychology', 3, 8, 8),
('Islamic History', 3, 9, 9),
('Quranic Studies', 3, 10, 10);


-- Sample data for Enrollments
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, '2024-09-01'),
(2, 2, '2024-09-01'),
(3, 1, '2024-09-01'),
(4, 3, '2024-09-02'),
(5, 4, '2024-09-02'),
(6, 5, '2024-09-03'),
(7, 6, '2024-09-03'),
(8, 7, '2024-09-04'),
(9, 8, '2024-09-04'),
(10, 9, '2024-09-05'),
(1, 11, '2024-09-05'),
(2, 12, '2024-09-06'),
(3, 13, '2024-09-06'),
(4, 14, '2024-09-07'),
(5, 15, '2024-09-07');


-- Sample data for Exams
INSERT INTO Exams (CourseID, ExamType, ExamDate, TotalMarks) VALUES
(1, 'Midterm', '2024-11-15', 100),
(2, 'Final', '2024-12-20', 100),
(3, 'Midterm', '2024-11-10', 100),
(4, 'Final', '2024-12-18', 100),
(5, 'Midterm', '2024-11-20', 100),
(6, 'Final', '2024-12-22', 100),
(7, 'Midterm', '2024-11-25', 100),
(8, 'Final', '2024-12-24', 100),
(9, 'Midterm', '2024-11-12', 100),
(10, 'Final', '2024-12-15', 100),
(1, 'Final', '2024-12-19', 100),
(2, 'Midterm', '2024-11-14', 100);


-- Sample data for Results
INSERT INTO Results (StudentID, CourseID, ExamID, Grade, Remarks) VALUES
(1, 1, 1, 'A', 'Excellent performance'),
(2, 2, 2, 'B+', 'Good understanding'),
(3, 1, 1, 'B', 'Satisfactory'),
(4, 3, 3, 'A-', 'Very good'),
(5, 4, 4, 'C+', 'Needs improvement'),
(6, 5, 5, 'A', 'Outstanding'),
(7, 6, 6, 'B-', 'Fair'),
(8, 7, 7, 'A+', 'Exceptional'),
(9, 8, 8, 'C', 'Passed'),
(10, 9, 9, 'B', 'Good'),
(1, 1, 11, 'A', 'Consistent performance'),
(2, 2, 12, 'B', 'Solid effort');


-- Sample data for Assignments
INSERT INTO Assignments (CourseID, FacultyID, Title, Description, DueDate) VALUES
(1, 1, 'Programming Assignment 1', 'Implement a basic calculator', '2024-10-15'),
(2, 2, 'Calculus Homework 1', 'Solve differential equations', '2024-10-20'),
(3, 3, 'Physics Lab Report', 'Experiment on projectile motion', '2024-10-25'),
(4, 4, 'Chemistry Problem Set', 'Organic reactions and mechanisms', '2024-10-30'),
(5, 5, 'Literary Analysis Essay', 'Analyze a chosen poem', '2024-11-05'),
(6, 6, 'Economics Case Study', 'Analysis of market trends', '2024-11-10'),
(7, 7, 'Biology Research Paper', 'Cellular respiration processes', '2024-11-15'),
(8, 8, 'Psychology Experiment Design', 'Design a basic psychological experiment', '2024-11-20'),
(9, 9, 'History Research Project', 'Research on a historical event', '2024-11-25'),
(10, 10, 'Islamic Studies Reflection', 'Reflection on a selected Hadith', '2024-11-30'),
(1, 1, 'Programming Assignment 2', 'Develop a simple game', '2024-12-05'),
(2, 2, 'Calculus Homework 2', 'Integration techniques', '2024-12-10');


-- Sample data for Classrooms
INSERT INTO Classrooms (RoomNumber, Capacity, Building) VALUES
('A101', 50, 'Block A'),
('A102', 30, 'Block A'),
('B201', 40, 'Block B'),
('B202', 60, 'Block B'),
('C301', 35, 'Block C'),
('C302', 55, 'Block C'),
('D101', 45, 'Block D'),
('D102', 25, 'Block D'),
('E401', 70, 'Block E'),
('E402', 30, 'Block E'),
('F101', 50, 'Block F'),
('G201', 40, 'Block G');


-- Sample data for Schedules
INSERT INTO Schedules (CourseID, FacultyID, ClassroomID, Day, StartTime, EndTime) VALUES
(1, 1, 1, 'Monday', '09:00:00', '10:30:00'),
(2, 2, 3, 'Tuesday', '10:00:00', '11:30:00'),
(3, 3, 5, 'Wednesday', '11:00:00', '12:30:00'),
(4, 4, 7, 'Thursday', '13:00:00', '14:30:00'),
(5, 5, 9, 'Friday', '14:00:00', '15:30:00'),
(6, 6, 11, 'Monday', '10:30:00', '12:00:00'),
(7, 7, 12, 'Tuesday', '11:30:00', '13:00:00'),
(8, 8, 2, 'Wednesday', '09:00:00', '10:30:00'),
(9, 9, 4, 'Thursday', '10:00:00', '11:30:00'),
(10, 10, 6, 'Friday', '11:00:00', '12:30:00'),
(11, 1, 1, 'Wednesday', '09:00:00', '10:30:00'),
(12, 2, 3, 'Thursday', '10:00:00', '11:30:00');


-- Sample data for Fees
INSERT INTO Fees (StudentID, Amount, DueDate, PaidDate, Status) VALUES
(1, 1500.00, '2024-09-15', '2024-09-10', 'Paid'),
(2, 1500.00, '2024-09-15', NULL, 'Pending'),
(3, 1500.00, '2024-09-15', '2024-09-12', 'Paid'),
(4, 1600.00, '2024-09-15', '2024-09-11', 'Paid'),
(5, 1600.00, '2024-09-15', NULL, 'Pending'),
(6, 1500.00, '2024-09-15', '2024-09-09', 'Paid'),
(7, 1500.00, '2024-09-15', NULL, 'Pending'),
(8, 1600.00, '2024-09-15', '2024-09-13', 'Paid'),
(9, 1500.00, '2024-09-15', NULL, 'Pending'),
(10, 1500.00, '2024-09-15', '2024-09-14', 'Paid'),
(1, 1500.00, '2025-01-15', NULL, 'Pending'),
(3, 1500.00, '2025-01-15', '2025-01-05', 'Paid');


-- Sample data for Attendance
INSERT INTO Attendance (StudentID, CourseID, Date, Status) VALUES
(1, 1, '2024-09-01', 'Present'),
(2, 2, '2024-09-01', 'Present'),
(3, 1, '2024-09-01', 'Absent'),
(4, 3, '2024-09-02', 'Present'),
(5, 4, '2024-09-02', 'Present'),
(6, 5, '2024-09-03', 'Present'),
(7, 6, '2024-09-03', 'Absent'),
(8, 7, '2024-09-04', 'Present'),
(9, 8, '2024-09-04', 'Present'),
(10, 9, '2024-09-05', 'Present'),
(1, 1, '2024-09-08', 'Present'),
(2, 2, '2024-09-08', 'Present');


-- Sample data for Admins
INSERT INTO Admins (Username, PasswordHash, Role, Email) VALUES
('admin_main', 'hash123abc', 'Super Admin', 'admin@univ.edu'),
('john.doe', 'johnpass123', 'Registrar', 'john.doe@univ.edu'),
('jane.smith', 'janepass123', 'Admissions Officer', 'jane.smith@univ.edu'),
('mike.jones', 'mikepass123', 'Financial Officer', 'mike.jones@univ.edu'),
('susan.white', 'susanpass123', 'Academic Advisor', 'susan.white@univ.edu'),
('peter.brown', 'peterpass123', 'IT Support', 'peter.brown@univ.edu'),
('emily.green', 'emilypass123', 'Librarian', 'emily.green@univ.edu'),
('david.black', 'davidpass123', 'HR Manager', 'david.black@univ.edu'),
('lisa.grey', 'lisapass123', 'Dean Assistant', 'lisa.grey@univ.edu'),
('chris.blue', 'chrispass123', 'Campus Security', 'chris.blue@univ.edu');
--all students and their departments
SELECT s.FirstName, s.LastName, s.Email, d.DepartmentName
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID;

--all courses taught by a specific faculty member
SELECT c.CourseName, c.CreditHours, f.FirstName, f.LastName
FROM Courses c
JOIN Faculty f ON c.FacultyID = f.FacultyID
WHERE f.FirstName = 'Ahmed' AND f.LastName = 'Khan';
--all enrollments with student and course details
SELECT e.EnrollmentID, s.FirstName AS StudentFirstName, s.LastName AS StudentLastName, c.CourseName, e.EnrollmentDate
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

--all exams for a particular course
SELECT ex.ExamType, ex.ExamDate, ex.TotalMarks, c.CourseName
FROM Exams ex
JOIN Courses c ON ex.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to Programming';

--grades for a specific student in all their courses

SELECT s.FirstName, s.LastName, c.CourseName, r.Grade, r.Remarks
FROM Results r
JOIN Students s ON r.StudentID = s.StudentID
JOIN Courses c ON r.CourseID = c.CourseID
WHERE s.FirstName = 'Ali' AND s.LastName = 'Raza';

--all assignments for a given course
SELECT a.Title, a.DueDate, f.FirstName AS FacultyFirstName, f.LastName AS FacultyLastName
FROM Assignments a
JOIN Courses c ON a.CourseID = c.CourseID
JOIN Faculty f ON a.FacultyID = f.FacultyID
WHERE c.CourseName = 'Introduction to Programming';

--all schedules in a specific classroom 
SELECT sch.Day, sch.StartTime, sch.EndTime, c.CourseName, f.FirstName AS FacultyFirstName, f.LastName AS FacultyLastName
FROM Schedules sch
JOIN Classrooms cl ON sch.ClassroomID = cl.ClassroomID
JOIN Courses c ON sch.CourseID = c.CourseID
JOIN Faculty f ON sch.FacultyID = f.FacultyID
WHERE cl.RoomNumber = 'A101';

-- fee status for all students:
SELECT s.FirstName, s.LastName, f.Amount, f.DueDate, f.PaidDate, f.Status
FROM Fees f
JOIN Students s ON f.StudentID = s.StudentID;

--attendance records for a student in a specific course:
SELECT s.FirstName, s.LastName, c.CourseName, a.Date, a.Status
FROM Attendance a
JOIN Students s ON a.StudentID = s.StudentID
JOIN Courses c ON a.CourseID = c.CourseID
WHERE s.FirstName = 'Ali' AND s.LastName = 'Raza' AND c.CourseName = 'Introduction to Programming';

--all faculty members and their departments:
SELECT f.FirstName, f.LastName, f.Designation, d.DepartmentName
FROM Faculty f
JOIN Departments d ON f.DepartmentID = d.DepartmentID;

UPDATE Students
SET Email = 'ali.raza.new@student.edu'
WHERE StudentID = 1;

UPDATE Faculty
SET Designation = 'Senior Professor'
WHERE FacultyID = 1; -- Ahmed Khan

DELETE FROM Fees
WHERE StudentID = 5 AND Status = 'Pending';
