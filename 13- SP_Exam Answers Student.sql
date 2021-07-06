alter proc ExamAnswers @std_Id int , @examId int , @Qnum int , @Answer int
as					
	
	if exists(select student_id from Students where student_id = @std_Id)
	begin
		if exists(select Exam_code from Exam where Exam_code = @examId)
		begin
			if exists(select question_id from Questions where question_id = @Qnum)
			begin

			execute getexam_question @examId

			insert into student_exam_ans (Exam_code, student_id, question_id, student_answer) 
			values( @examId , @std_Id, @Qnum , @Answer)
			end
		
	else
	select 'Question num not found'
	end
		else
		select 'Exam id not found'
		end
			else
			select 'student id not found'
Go
ExamAnswers 10 , 1008 , 121, 1
GO
ExamAnswers 10 , 1008 , 122, 1
GO
ExamAnswers 10 , 1008 , 123, 1
GO
ExamAnswers 10 , 1008 , 124, 2
GO
ExamAnswers 10 , 1008 , 129, 1
GO
ExamAnswers 10 , 1008 , 131, 1
GO
ExamAnswers 10 , 1008 , 136, 1
GO
ExamAnswers 10 , 1008 , 137, 2
GO
ExamAnswers 10 , 1008 , 139, 2
GO
ExamAnswers 10 , 1008 , 140, 2























