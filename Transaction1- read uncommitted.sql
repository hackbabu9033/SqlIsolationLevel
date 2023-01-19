-- Transaction 1
-- case 3 : read uncommitted
declare @testRowId uniqueidentifier = 'E1A2555E-0828-434B-A33B-6F38136A37DE';

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
begin TRANSACTION
select Title from Person.Person
where rowguid = @testRowId
WAITFOR DELAY '00:00:2'

update [Person].[Person]
set Title = 'test1' 
where rowguid = @testRowId

-- 故意等一個較長的時間，看看transaction2在
-- isolation為read uncommitted時會讀到修改後的資料
-- 在repeatable read / read commited時會讀到修改前的資料
WAITFOR DELAY '00:00:5'
rollback
