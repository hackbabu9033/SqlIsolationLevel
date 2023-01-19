-- Transaction 1
-- case 1 : transaction isolatetion level - > read repteatable
-- case 2 : read committed
-- case 3 : read uncommitted
declare @testRowId uniqueidentifier = 'E1A2555E-0828-434B-A33B-6F38136A37DE';

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
begin TRANSACTION
select Title from Person.Person
where rowguid = @testRowId
WAITFOR DELAY '00:00:2'

update [Person].[Person]
set Title = 'test1' 
where rowguid = @testRowId

commit
