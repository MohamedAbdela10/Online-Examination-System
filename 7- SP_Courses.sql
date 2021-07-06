-- Courses Table
-- 1- Select Courses:

create proc selectcourse  @course_id int  
with encryption
as
		select * 
		from Courses
		where course_id = @course_id 

GO

selectcourse  22

Go
-- 2- Insert Courses:

create proc insertcourse @course_id  int, @course_name nvarchar(50), @topic_id int
with encryption
as
	begin try
		if not exists (select course_id  from Courses where course_id  =@course_id  )
		begin
			insert into Courses
			values (@course_id  ,@course_name , @topic_id )
		end
		else
			select 'Duplicate id'
	end try
	begin catch
		select 'ERROR'
	end catch

GO

insertcourse 22,'testcourse',1

Go
-- 3- Upate Courses:

create proc updatecourse @course_id   int, @course_name  nvarchar(50) , @topic_id int
with encryption
as
	begin try
	if  exists (select course_id   from Courses where course_id  =@course_id )
		begin
			update Courses
			set course_name = @course_name  ,course_id = @course_id  , topic_id = @topic_id 
			where course_id = @course_id   
		end
	else
		select 'Course ID not found'
	end try
	begin catch
		Select 'Error'
	end catch

Go

updatecourse 4 , 'Excel' , 1

GO


-- 4- Delete Courses:

create proc deletecourse @course_id  int
with encryption
as
	begin try
	if exists (select course_id from Courses where course_id=@course_id)
		begin
			delete from Courses where 
			course_id=@course_id   
		end
	else
		select 'course id not found'
	end try
	begin catch
		select 'ERROR'
	end catch

Go

deletecourse 22

GO
