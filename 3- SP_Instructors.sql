/*Instructors Table*/
-- 1- Select Instructors:

create proc selectInstructor  @ins_id int
with encryption
as
		select * 
		from Instructors
		where inst_id  = @ins_id 
GO

selectInstructor 5

Go

-- 2- Insert Instructors:

create proc insertInstructor @ins_id int, @ins_name varchar(50) , @dept_id int 
with encryption
as
	begin try
		if not exists (select inst_id from Instructors where inst_id=@ins_id)
		begin
			insert into Instructors
			values (@ins_id,@ins_name , @dept_id)
		end
		else
			select 'Duplicate id'
	end try
	begin catch
		select 'ERROR'
	end catch

GO

insertInstructor  13 ,'aya mustafa' , 1

GO

-- 3- Update Instructors:


create proc updateInstructor @ins_id int, @ins_name varchar(50) , @dept_id int 
with encryption
as
	begin try
	if  exists (select inst_id from Instructors where inst_id=@ins_id )
		begin
			update Instructors
			set inst_name = @ins_name,dept_id = @dept_id
			where inst_id=@ins_id
		end
	else
		select 'Instrcture Id not found'
	end try
	begin catch
		Select 'Error'
	end catch

GO

updateInstructor 13,'Aya Mousafa' ,3

GO


-- 4- Delete Instructors:

create proc deleteInstructor @ins_id int
with encryption
as
	begin try
	if exists (select inst_id from Instructors where inst_id=@ins_id)
		begin
			delete from Instructors where 
			inst_id=@ins_id
		end
	else
		select 'Instructor id not found'
	end try
	begin catch
		select 'ERROR'
	end catch

Go

deleteInstructor 5

GO