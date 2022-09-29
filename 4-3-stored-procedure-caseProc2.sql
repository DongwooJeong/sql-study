USE market_db;
DROP PROCEDURE IF EXISTS caseProc2;
DELIMITER $$
CREATE PROCEDURE caseProc2()
	BEGIN		
        SELECT M.mem_id, M.mem_name, SUM(price*amount) "total purchase", 
			CASE
				WHEN sum(price*amount) >= 1500 THEN 'VIP'
				WHEN sum(price*amount) >= 1000 THEN 'GOLD'
				WHEN sum(price*amount) >= 1 THEN 'Regular'
				ELSE 'Inactive'
			END "membership"
		FROM buy B
			RIGHT OUTER JOIN member M
			ON B.mem_id = M.mem_id
		GROUP BY M.mem_id
		ORDER BY SUM(price*amount) DESC ;
	END $$
	DELIMITER ;
CALL caseProc2();