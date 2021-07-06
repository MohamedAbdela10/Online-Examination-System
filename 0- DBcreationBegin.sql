-- 2- Departments Table Creation:
create TABLE Departments
(
  dept_id INT PRIMARY KEY,
  dept_name NVARCHAR(50) NOT NULL,
);

GO

alter TABLE Departments
Add Constraint c1 Unique(dept_name),
Default 1 for dept_id

GO
-- 1- Students Table Creation:
create TABLE Students
(
  student_id INT IDENTITY(1,1) PRIMARY KEY,
  student_name NVARCHAR(50) NOT NULL,
  student_soical NVARCHAR(250),
  student_mail NVARCHAR(100) NOT NULL,
  student_password NVARCHAR(50) NOT NULL,
  dept_id INT,
  CONSTRAINT c2 FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
  ON DELETE set default ON UPDATE CASCADE
);

Go

alter TABLE Students
Add Constraint c3 Unique(student_mail),
Constraint c4 Unique(student_soical),
CONSTRAINT c5  CHECK(student_mail LIKE '%_@_%.__%'),
CONSTRAINT c6  CHECK( len(student_password) >= 8)

GO

-- 3- instructors
CREATE TABLE Instructors
(
  inst_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  inst_name NVARCHAR(50) NOT NULL,
  dept_id INT,
  CONSTRAINT c7 FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
  ON DELETE set default ON UPDATE CASCADE
);

GO
-- 5- topic
CREATE TABLE topic
(
  topic_id INT PRIMARY KEY,
  topic_name NVARCHAR(50) NOT NULL,
);

-- 4- Courses
CREATE TABLE Courses
(
  course_id INT PRIMARY KEY,
  course_name NVARCHAR(50) NOT NULL,
  topic_id INT,
  CONSTRAINT c8 FOREIGN KEY (topic_id) REFERENCES topic(topic_id)
  ON DELETE set default ON UPDATE CASCADE
);

-- 6- Exam
CREATE TABLE Exam
(
  Exam_code INT IDENTITY(100,1) PRIMARY KEY,
  No_MCQ INT NOT NULL,
  No_TF INT NOT NULL,
  exam_model_ans text NOT NULL,
  exam_grade as ((isnull(No_MCQ,0)+ isnull(No_TF,0) ) * 10) persisted,
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES Courses (course_id)
  ON DELETE No ACTION ON UPDATE CASCADE
);
GO

alter TABLE Exam
add CONSTRAINT c9  CHECK( No_MCQ + No_TF = 10)
-- , CONSTRAINT c10 CHECK(exam_model_ans LIKE ('a','b','c','d'))
-- exam_model_ans computed by a function
GO

-- 7- Questions
CREATE TABLE Questions
(
  question_id INT IDENTITY(1,1) PRIMARY KEY,
  question_content text NOT NULL,
  quest_model_Ans text NOT NULL,
  question_type NVARCHAR(20) NOT NULL,
  quest_full_mark INT NOT NULL DEFAULT 10,
  course_id int,
  FOREIGN KEY (course_id) REFERENCES Courses (course_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

GO 

ALTER TABLE Questions
add CONSTRAINT c11 CHECK(question_type in ('MCQ', 'T F'))

-- 8- Options
CREATE TABLE options
(
  Ans_id int PRIMARY KEY
);
GO
-- 9- Instructor_courses
CREATE TABLE Instructor_courses
(
  inst_id INT,
  course_id INT,
  PRIMARY KEY (inst_id, course_id),
  evaluation INT,
  FOREIGN KEY (inst_id) REFERENCES Instructors(inst_id)
  ON DELETE No ACTION ON UPDATE CASCADE,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
  ON DELETE No ACTION ON UPDATE CASCADE
);
GO

ALTER TABLE Instructor_courses
ADD CONSTRAINT c13 CHECK (evaluation IN (Null,1,2,3,4,5))

GO
-- 10- student_courses
CREATE TABLE student_courses
(
  course_id INT,
  student_id INT,
  PRIMARY KEY (course_id, student_id),
  Crs_grade INT,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
  ON DELETE No ACTION ON UPDATE CASCADE,
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
  ON DELETE No ACTION ON UPDATE CASCADE
);

GO
ALTER TABLE student_courses
ADD CONSTRAINT c14 CHECK (Crs_grade <= 100)
Go
-- 11- student_exam_ans
CREATE TABLE student_exam_ans
(
  Exam_code INT,
  student_id INT,
  PRIMARY KEY (Exam_code, student_id),
  student_grade INT NOT NULL,
  student_answer NVARCHAR(50) NOT NULL,
  FOREIGN KEY (Exam_code) REFERENCES Exam(Exam_code)
  ON DELETE No ACTION ON UPDATE CASCADE,
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
  ON DELETE No ACTION ON UPDATE CASCADE
);

GO

ALTER TABLE student_exam_ans
ADD CONSTRAINT c15 CHECK (student_grade <= 100)
-- check a,b,c,d

GO

-- 12- Exam questions
CREATE TABLE Exam_questions
(
  Exam_code INT,
  question_id INT,
  PRIMARY KEY (Exam_code, question_id),
  CONSTRAINT c16 FOREIGN KEY (Exam_code) REFERENCES Exam(Exam_code),
  CONSTRAINT c17 FOREIGN KEY (question_id) REFERENCES Questions(question_id)
);

-- 13- question_answers
CREATE TABLE question_answers
(
  question_id INT,
  Ans_id int,
  Option_content NVARCHAR(150),
  PRIMARY KEY (question_id, Ans_id),
  FOREIGN KEY (question_id) REFERENCES Questions(question_id)
  ON DELETE No ACTION ON UPDATE CASCADE,
  FOREIGN KEY (Ans_id) REFERENCES options(Ans_id)
  ON DELETE No ACTION ON UPDATE CASCADE
);

GO
Alter Table question_answers
add Constraint C50 FOREIGN KEY (question_id) REFERENCES Questions(question_id)
  ON DELETE No ACTION ON UPDATE CASCADE,
Constraint C51 FOREIGN KEY (Ans_id) REFERENCES options(Ans_id)
  ON DELETE No ACTION ON UPDATE CASCADE

-- 14- answer_options 
CREATE TABLE answer_options
(
  ans_option nvarchar(250),
  Ans_id char,
  PRIMARY KEY (ans_option, Ans_id),
  FOREIGN KEY (Ans_id) REFERENCES options(Ans_id)
  ON DELETE No ACTION ON UPDATE CASCADE
);
