-- Students Table
/*select Students*/
--select :

create Proc GetStudent @st_id int
as
	select *
	from Students
	where student_id = @st_id

Go

GetStudent 1	

GO
-----------------------------------
/*insert Students*/
--insert :


create proc insertStudent @st_id int,@st_name varchar(50),
@student_social nvarchar(250), @st_Email varchar(100),
@student_password varchar(50), @dept_id int
as
begin try
	if not exists (select student_id from Students where student_id=@st_id )
begin
	insert into Students
		values (@st_id, @st_name, @student_social, @st_Email, @student_password, @dept_id)
	end
	else
		select 'Duplicate Student Id'
end try
begin catch
	Select 'error'
end catch

GO

insertStudent 5,'Ahmed Negm', 'https://www.linkedin.com/in/ahmednegm/','ahmed.negm@gmail.com','ahmed12345678',3

GO

-----------------------------------
/*Update Students*/
--Update :

create Proc Student_update @st_id int,@st_name varchar(50),
@student_social nvarchar(250), @st_Email varchar(100),
@student_password varchar(50), @dept_id int
as
begin try
if  exists (select student_id from Students where student_id=@st_id )
	begin
	update Students
	 set student_name=@st_name, student_mail=@st_Email
	 , student_password=@student_password, dept_id=@dept_id
	 where student_id=@st_id
	end
	else
		select 'Student Id is not found'
end try
begin catch
	Select 'error'
end catch


Go

Student_update 13,'Eman Negm', 'https://www.linkedin.com/in/emannegm/','eman.negm@gmail.com','eman12345678',2

GO

-----------------------------------
/*Delete Students*/
-- Delete:

create Proc Student_Delete @st_id int
as
begin try
if  exists (select student_id from Students where student_id=@st_id )
	begin
		delete from Students
		where student_id=@st_id
	end
	else
		select 'Student Id is not found'
end try
begin catch
	Select 'error'
end catch

Go

Student_Delete 5
