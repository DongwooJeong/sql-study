USE market_db;
DROP PROCEDURE IF EXISTS ifProc3;
        DELIMITER $$
        CREATE PROCEDURE ifProc3()
        BEGIN
            DECLARE debutDate DATE;
            DECLARE curDate DATE;
            DECLARE days INT;
            
            SELECT debut_date INTO debutDate
                FROM market_db.member
                WHERE mem_id = 'APN';
            
            SET curDATE = CURRENT_DATE();
            SET days = DATEDIFF(curDATE, debutDate);

            IF (days/365) >= 5 THEN
                SELECT CONCAT("It's been ", days, " days since debut. Congrats!");
            ELSE
                SELECT "It's been only", days, " days since debut. Cheer up!";
            END IF;       
        END $$
        DELIMITER ;
        CALL ifProc3();
        