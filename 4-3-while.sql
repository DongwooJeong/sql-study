DROP PROCEDURE IF EXISTS whileProc;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
	DECLARE i INT;
	DECLARE hap INT;
	SET i = 1;
	SET hap = 0;

	WHILE (i <= 100) DO
		SET hap = hap + i;
		SET i = i + 1;
	END WHILE;
	SELECT 'sum from 1 to 100 ==>', hap; 
END $$
DELIMITER ;
CALL whileProc();
        