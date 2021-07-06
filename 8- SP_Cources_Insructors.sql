-- Courses Instructors Table
-- 1- select  Course Instructor


create proc selectCoursesInstuctor @Ins_Id int
with encryption
as
		select inst_id, C.course_name
		from Instructor_courses CI inner Join Courses C
		on CI.course_id = C.course_id and inst_id = @Ins_Id
		
GO

selectCoursesInstuctor 2

GO
--------------------------------------------------------
-- 2- insert  Course and Instructor
Create proc InsertCoursesInstuctor @Ins_Id int , @CourseId int
with encryption
as
	begin try
	if exists (select course_id from Courses where course_id = @CourseId)
	begin
		if @CourseId not in (select course_id from Instructor_courses where inst_id =@Ins_Id )
		begin
			insert into Instructor_courses (inst_id, course_id)
			values(@Ins_Id, @CourseId)
		end
		else 
			select 'Course already set to this instructor'
	end
	else
		select 'the course id is not found'
	end try
	begin catch
		select 'ERROR'
	end catch
	
GO

InsertCoursesInstuctor 13,2

GO


--------------------------------------------------------
-- 3- Update Course and Instructor:

create proc updateCoursesInstuctor @Ins_Id int , @CourseId int ,@newCourceID int
with encryption
as
	begin try
	if exists (select course_id from Courses where course_id = @newCourceID)
	begin
		if @CourseId in (select course_id from Instructor_courses where inst_id =@Ins_Id )
		begin
			update  Instructor_courses
			set course_id =@newCourceID
			where inst_id =@Ins_Id and course_id=@CourseId
		end
		else 
			select 'Course already set to this instructor'
	end
	else
		select 'the course id is not found'
	end try
	begin catch
		select 'ERROR'
	end catch

GO	

updateCoursesInstuctor 13,2,8

GO
-----------------------------------------------------------
-- 4- Delete Course and Instructor:


create proc deleteCoursesInstuctor @Ins_Id int, @Cid int
with encryption
as
	begin try
	if exists (select inst_id from Instructor_courses where inst_id=@Ins_Id)
		begin
			delete from Instructor_courses where 
			inst_id = @Ins_Id and course_id = @Cid
		end
	else
		select 'Instructor id not found'
	end try
	begin catch
		select 'ERROR'
	end catch


GO

deleteCoursesInstuctor 13,8



		








