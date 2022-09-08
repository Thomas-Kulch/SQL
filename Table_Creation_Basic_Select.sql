CREATE TABLE Student (
	Student_ID nvarchar(10),
	FirstName nvarchar(25),
	LastName nvarchar(25),
	Phone nvarchar(15),
	Email nvarchar(40),
	PRIMARY KEY (Student_ID)
);

INSERT INTO Student (Student_ID, FirstName, LastName, Phone, Email)
VALUES ('1234', 'Jim', 'Bob', '505.123.1234', 'jimbob@gmail.com');

SELECT * FROM Student;

SELECT FirstName, LastName, Email
FROM Student;

SELECT FirstName, LastName, Email
FROM Student
WHERE LastName = 'Bob'
