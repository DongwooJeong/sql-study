USE market_db;
DROP PROCEDURE IF EXISTS user_proc3;
DELIMITER $$
CREATE PROCEDURE user_proc3(
	IN txtValue CHAR(10),
	OUT outValue INT    )
BEGIN
	INSERT INTO noTable VALUES(NULL,txtValue);
	SELECT MAX(id) INTO outValue FROM noTable;
END $$
DELIMITER ;

-- create noTable
CREATE TABLE IF NOT EXISTS noTable(
	id INT AUTO_INCREMENT PRIMARY KEY,
	txt CHAR(10)
);
                
-- call procedure
CALL user_proc3 ('test1', @myValue);
SELECT CONCAT('Entered ID value ==>', @myValue);
Select * from noTable;