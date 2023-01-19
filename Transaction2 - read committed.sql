-- Transaction 2
-- case 2 : read committed
declare @testRowId uniqueidentifier = 'E1A2555E-0828-434B-A33B-6F38136A37DE';
update [Person].[Person]
set Title = null
where rowguid = @testRowId

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin TRANSACTION
-- 先取得一次title
select Title from Person.Person
where rowguid = @testRowId
-- 故意設定一個delay比transaction1還久的時間，看看是否會影響到這邊的讀取結果
WAITFOR DELAY '00:00:5';
select Title from Person.Person
where rowguid = @testRowId

commit
