alter proc GenerateExam @ExamId int ,@courseName nvarchar(50),@NoOfMCQ int ,@NoOfTF int 
as
	if exists (select Exam_code from Exam where Exam_code = @ExamId)
	select 'there is already this ID '
	else
	begin
	if @NoOfTF + @NoOfMCQ = 10
		begin
	
		if exists(select course_id from Courses where course_name = @courseName)
			begin
			declare @Cid int
			select @Cid= course_id 
			from Courses
			where course_name = @courseName

			insert into Exam (Exam_code,No_MCQ,No_TF,course_id)
			values(@ExamId,@NoOfMCQ,@NoOfTF,@Cid)
	
	
	
			insert into Exam_questions (question_id,Exam_code)
			select top (@NoOfMCQ)question_id , @ExamId
			from Questions
			where question_type = 'MCQ' and course_id = @Cid
			order by newid()

			insert into Exam_questions (question_id,Exam_code)
			select top(@NoOfTF)question_id , @ExamId
			from Questions
			where question_type='T F' and course_id = @Cid
			order by newid()

			end
			else
					select 'This course is not found'
			end
	else
			select 'No of questions must be 10'
	end

GO

GenerateExam 1008,'ML',5,5 

GO