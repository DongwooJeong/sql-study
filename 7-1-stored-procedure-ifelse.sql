DROP PROCEDURE IF EXISTS ifelse_proc;
DELIMITER $$
CREATE PROCEDURE ifelse_proc(
	IN memName VARCHAR(10)
)
BEGIN
	DECLARE debutYear INT;
	SELECT YEAR(debut_date) into debutYear FROM member
		where mem_name = memName;
	IF debutYear>=2015 THEN
		SELECT "rookie" AS 'message';
	ELSE
		SELECT "senior" AS 'message';
	END IF;
END $$
DELIMITER ;

CALL ifelse_proc('오마이걸');