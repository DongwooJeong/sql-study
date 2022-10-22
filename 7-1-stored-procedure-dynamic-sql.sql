
DROP PROCEDURE IF EXISTS dynamic_proc;
DELIMITER $$
CREATE PROCEDURE dynamic_proc(
	IN tableName VARCHAR(20)
)
BEGIN
	SET @sqlQuery = CONCAT('SELECT * FROM ', tableName);
	PREPARE myQuery FROM @sqlQuery;
	EXECUTE myQuery;
	DEALLOCATE PREPARE myQuery;
END $$
DELIMITER ;

CALL dynamic_proc('member');