------------------------------------------

-- Question_choice table:

-- 1- select Question_choice:

create Proc selectQuestionChoice @QuesNum int,@choiceNum int
as
	select *
	from question_answers
	where question_id = @QuesNum and Ans_id = @choiceNum
GO

selectQuestionChoice 61,1

GO

-- 2- insert into QuesChoice
create Proc insertQuestionChoice  @QuesNum int,@choiceNum int,@chiceBody nvarchar(150)
as
begin try
if not exists (select question_id,Ans_id from question_answers where question_id =@QuesNum and Ans_id =@QuesNum  )
	begin
	insert into question_answers
	values (@QuesNum,@choiceNum,@chiceBody)
	end
else
		select 'Duplicate Option Question Id'
end try
begin catch
	Select 'error'
end catch

GO

insertQuestionChoice 61,1,'Pie Chart'

GO
-- 3- update QuestionChoice

alter Proc updateQuestionChoice  @QuesNum int , @choiceNum int ,@NEWOptionBody nvarchar(150)
as
begin try
if   exists (select question_id , Ans_id from question_answers where question_id = @QuesNum and Ans_id = @choiceNum )
		begin

		update question_answers
		 set option_content = @NEWOptionBody
		 where question_id = @QuesNum and Ans_id = @choiceNum
		end
else
		select 'Question num or choice num not found'
end try
begin catch
	Select 'error'
end catch

GO

updateQuestionChoice 61 , 1 ,'Pie Chart'

GO

-- 4- delete from QuestionChoice
create Proc deleteQuesChoice @QuesNum int, @ChoiceNum int
as
begin try
if  exists (select question_id , Ans_id from question_answers where question_id =@QuesNum and Ans_id =@ChoiceNum )
	begin
		delete from question_answers
		where question_id =@QuesNum and Ans_id =@ChoiceNum
	end
	else
		select 'Question num or choice num not found'
end try
begin catch
	Select 'error'
end catch

GO

deleteQuesChoice 61,1
