/*select department*/

create proc selectDepartment @dept_id int
with encryption
as
		select * 
		from Departments
		where dept_id = @dept_id


GO

selectDepartment 2
GO
------------------------------------------------

/*insert department*/

create proc insertDepartment @dept_id int,@Dept_Name varchar(50)
with encryption
as
	begin try
		if not exists (select dept_id from Departments where dept_id=@dept_id)
		begin
			insert into Departments
			values (@dept_id,@Dept_Name)
		end
		else
			select 'Duplicate id'
	end try
	begin catch
		select 'ERROR'
	end catch
GO

insertDepartment 4,'informations technology'

GO

----------------------------------------------------

/*update department*/

create proc updateDepartment @dept_id int,@Dept_Name varchar(50) 
with encryption
as
	begin try
	if  exists (select dept_id from Departments where dept_id=@dept_id )
		begin
			update Departments
			set dept_name=@Dept_Name,dept_id=@dept_id
			where dept_id=@dept_id
		end
	else
		select 'Dpartment Id not found'
	end try
	begin catch
		Select 'Error'
	end catch
GO

updateDepartment 4,'informations technology'

GO

---------------------------------

/*delete department*/

create proc deleteDepartment @dept_id int
with encryption
as
	begin try
	if exists (select dept_id from Departments where dept_id=@dept_id)
		begin
			delete from Departments where 
			dept_id=@dept_id
		end
	else
		select 'Department num not found'
	end try
	begin catch
		select 'ERROR'
	end catch

GO

deleteDepartment 4

GO





