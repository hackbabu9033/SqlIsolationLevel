-- Transaction 2
-- case 2 : read committed
-- keep inserting data

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin TRANSACTION

DECLARE  
@TotalNum INT, 
@Num INT     

set @TotalNum = 5
set @Num = 1
TRUNCATE TABLE ErrorLog
while @Num <= @TotalNum 
BEGIN 
     
	insert into ErrorLog(ErrorTime,UserName,ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
	values(GETDATE(),'test',@Num,@Num,1,'test',1,'for test')

	SET @Num = @NUM + 1
	WAITFOR DELAY '00:00:3';
END

COMMIT
