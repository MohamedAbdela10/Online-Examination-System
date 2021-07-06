
CREATE PROC Exam_Correction @stud_id int, @exam_id int
AS
DECLARE @total_questions int
SELECT  @total_questions = count (question_id) FROM student_exam_ans
WHERE  student_id = @stud_id AND Exam_code = @exam_id

DECLARE @total_right_questions float
SELECT  @total_right_questions = count(SE.question_id) 
FROM student_exam_ans SE JOIN Questions Q ON SE.question_id = Q.question_id
WHERE  student_id = @stud_id AND Exam_code = @exam_id AND SE.student_answer = Q.Model_Ans_id

DECLARE @Grade float
SELECT  @Grade =  (@total_right_questions/@total_questions)*100

UPDATE student_courses
SET	   Crs_grade = @Grade
WHERE  student_id = @stud_id and course_id = (Select course_id from Exam where Exam_code = @exam_id)

SELECT 'student degree percentage' + str(@Grade) + '%'

Go
Exam_Correction 2 , 1006
GO
Exam_Correction 3 , 1006
GO
Exam_Correction 5 , 1006
GO
Exam_Correction 9 , 1006
GO
Exam_Correction 10 , 1006
GO
Exam_Correction 3 , 1007
GO
Exam_Correction 5 , 1007
GO
Exam_Correction 6 , 1007
GO
Exam_Correction 7 , 1007
GO
Exam_Correction 3 , 1008
GO
Exam_Correction 5 , 1008
GO
Exam_Correction 7 , 1008
GO
Exam_Correction 10 , 1008

