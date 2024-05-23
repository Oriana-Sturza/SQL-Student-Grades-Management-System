


-- Drop the database if it already exists
DROP DATABASE IF EXISTS StudentGradesDB;

-- Create the database
CREATE DATABASE StudentGradesDB;

-- Switch to the new database
USE StudentGradesDB;

-- Table for students
CREATE TABLE Students (
    StudentID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    PRIMARY KEY (StudentID)
);

-- Table for grades
CREATE TABLE Grades (
    GradeID INT NOT NULL,
    StudentID INT,
    Subject VARCHAR(50),
    Grade CHAR(1),
    PRIMARY KEY (GradeID)
);

-- Insert students
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Alice Johnson', 20);
INSERT INTO Students (StudentID, Name, Age) VALUES (2, 'Bob Smith', 22);
INSERT INTO Students (StudentID, Name, Age) VALUES (3, 'Charlie Brown', 21);

-- Insert grades
INSERT INTO Grades (GradeID, StudentID, Subject, Grade) VALUES (1, 1, 'Math', 'A');
INSERT INTO Grades (GradeID, StudentID, Subject, Grade) VALUES (2, 1, 'English', 'B');
INSERT INTO Grades (GradeID, StudentID, Subject, Grade) VALUES (3, 2, 'Math', 'C');
INSERT INTO Grades (GradeID, StudentID, Subject, Grade) VALUES (4, 2, 'English', 'A');
INSERT INTO Grades (GradeID, StudentID, Subject, Grade) VALUES (5, 3, 'Math', 'B');
INSERT INTO Grades (GradeID, StudentID, Subject, Grade) VALUES (6, 3, 'English', 'B');

-- List all students
SELECT * FROM Students;

-- List all grades
SELECT * FROM Grades;

-- Find all grades for a specific student
SELECT g.Subject, g.Grade
FROM Grades g
JOIN Students s ON g.StudentID = s.StudentID
WHERE s.Name = 'Alice Johnson';

-- Count the number of students in each grade for Math
SELECT Grade, COUNT(*) AS NumberOfStudents
FROM Grades
WHERE Subject = 'Math'
GROUP BY Grade;

-- Update a grade
UPDATE Grades
SET Grade = 'A'
WHERE GradeID = 3;

-- Delete a grade
DELETE FROM Grades
WHERE GradeID = 6;
