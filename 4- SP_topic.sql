-- topic Table
-- 1- selelct topic:
create Proc selectTopic @TopicId int
as
	select *
	from Topic
	where Topic_id = @TopicId

GO

selectTopic 2	

Go

-- 2- insert topic:

create Proc insertTopic @TopicId int, @TopicName varchar(50)
as
begin try
if not exists (select Topic_id from Topic where Topic_id=@TopicId )
	begin
	insert into Topic
	values (@TopicId, @TopicName)
	end
	else
		select 'Duplicate Topic Id'
end try
begin catch
	Select 'error'
end catch

GO

insertTopic 11,'Design'

GO

-- 3- Update topic:


create Proc updateTopic @TopicId int,@TopicName varchar(50)
as
begin try
if  exists (select topic_id from Topic where topic_id=@TopicId )
	begin
	update Topic
	 set Topic_name=@TopicName
	 where Topic_id=@TopicId
	end
	else
		select 'Topic Id not found'
end try
begin catch
	Select 'error'
end catch

GO

updateTopic 11,'Video Editor'

GO

-- 4- Delete topic:

create Proc deleteTopic @TopicId int
as
begin try
if  exists (select Topic_id from Topic where Topic_id=@TopicId )
	begin
		delete from Topic
		where Topic_id=@TopicId
	end
	else
		select 'Topic Id not found'
end try
begin catch
	Select 'error'
end catch

Go

deleteTopic 11



