-- student_coursers Table
-- 1- select student_coursers:

create Proc select_std_crs @course_id int, @student_id int , @Crs_grade int = 100
as
	select *
	from student_courses
	where student_id = @student_id and course_id = @course_id

GO

select_std_crs 1,1

GO

------------------------------------

-- 2- insert student_coursers:


Create proc insert_std_crs @course_id int,@student_id int
as
begin try
	if not exists (select student_id, course_id from student_courses where student_id =@student_id and course_id = @course_id)
			begin
			insert into student_courses (course_id, student_id)
				values (@course_id , @student_id )
			end
	else
		select 'Duplicate Student Id'
end try
begin catch
	Select 'error'
end catch

GO

insert_std_crs 7, 7

GO

------------------------------------

-- 3- Update student_coursers:

create Proc update_std_crs @course_id int,@student_id int, @newcourse_id int,@newstudent_id int
as
		begin try
		if  exists (select student_id, course_id from student_courses where student_id =@student_id and course_id = @course_id)
			begin
			update student_courses
			 set course_id =@newcourse_id , student_id=@newstudent_id
			 where course_id =@course_id and student_id=@student_id
			end
		else
		select 'Student Id is not found'
	end try
	begin catch
		Select 'error'
	end catch

Go

update_std_crs 1,4, 1,9

GO
------------------------------------

-- 4- Delete student_coursers:

create Proc delete_std_crs @course_id int, @student_id int 
as
begin try
if  exists (select course_id ,student_id from student_courses where student_id =@student_id and course_id =@course_id)

	begin
		delete from student_courses
		where  course_id = @course_id and student_id = @student_id

	end
	else
		select 'Student Id is not found'
end try
begin catch
	Select 'error'
end catch

Go

delete_std_crs 1,10

