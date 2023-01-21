-- Transaction 1
-- NOTE：當另一邊在insert資料時，會將整個table鎖住
-- 此時無論哪種隔離等級，都必須要等另一個執行完commit後才能讀取資料
-- 因此執行總時間是Transaction 2 + Transaction 1

SET TRANSACTION ISOLATION LEVEL READ Uncommitted
begin TRANSACTION

DECLARE  
@TotalNum INT, 
@Num INT     

set @TotalNum = 5
set @Num = 1

while @Num <= @TotalNum 
BEGIN 
    
	select * from ErrorLog

	SET @Num = @NUM + 1
	WAITFOR DELAY '00:00:2';
END


COMMIT
