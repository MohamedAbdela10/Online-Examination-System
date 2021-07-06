create proc getexam_question @examcode int
as
	select Exam_code , q.question_id , question_content , ap.Ans_id , qa.Option_content
	from Exam_questions eq, Questions q , question_answers qa , options ap
	where eq.question_id = q.question_id and q.question_id = qa.question_id 
	and qa.ans_Id = ap.ans_id and Exam_code = @examcode


Go
getexam_question 1001
