DROP PROCEDURE IF EXISTS while_proc;
DELIMITER $$
CREATE PROCEDURE while_proc()
BEGIN
	DECLARE hap INT;
    DECLARE num INT;
    SET hap = 0;
    SET num = 1;
	WHILE (num<=100)	DO 
		SET hap = hap + num;
	SET num= num + 1;
    END WHILE;
    SELECT hap AS 'Sum of 1 to 100';
END $$
DELIMITER ;
            
CALL while_proc();