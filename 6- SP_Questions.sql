-- Questions Table
-- 1- select Questions:

create Proc selectQuestion @question_id int
as
	select *
	from Questions
	where question_id = @question_id
GO

selectQuestion 3	

Go
-- 2- insert Questions:

create Proc insertQuestion @Qnum int,@QType nvarchar(20),
@Qhead nvarchar(250),@Model_Ans nvarchar(250),@fullmark_grade int,@Cid int
with encryption
as
begin try
	if not exists (select question_id from Questions where question_id = @Qnum )
		begin
		insert into Questions
		values (@Qnum,@Qhead,@Model_Ans,@QType,@fullmark_grade,@Cid)
		end
		else
			select 'Duplicate Question ID'
	end try
begin catch
	Select 'error'
end catch

GO

insertQuestion 162,'T F','The bool() function allows you to evaluate any value, and give you True or False in return.'
,'TRUE',10,3

GO
-- 3- Update Questions:

create Proc updateQuestion  @Qnum int,@QType nvarchar(20),
@Qhead nvarchar(250),@Model_Ans nvarchar(250),@fullmark_grade int,@Cid int
with encryption
as
	begin try
	if  exists (select question_id from Questions where question_id=@Qnum )
		begin
		update Questions
		set question_id=@Qnum, question_type=@QType,
		question_content=@Qhead, quest_model_Ans=@Model_Ans,
		quest_full_mark=@fullmark_grade, course_id=@Cid
		where question_id=@Qnum
		end
	else
		select 'Question ID Not Found'
	end try
	begin catch
		Select 'ERROR'
	end catch

GO

updateQuestion 161,'T F','You can display a string literal with the print() function.'
,'TRUE',10,3
GO


-- 4- Update Questions:

create Proc deleteQuestion @Qnum int
with encryption
as
	begin try
	if  exists (select question_id from Questions where question_id=@Qnum )
	begin
		delete from Questions
		where question_id=@Qnum
	end
	else
		select 'Question ID Not Found'
	end try
	begin catch
		Select 'error'
	end catch

GO

deleteQuestion 162
GO

-- sp_helptext 'deleteQuestion'