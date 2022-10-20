use market_db;

show index from member;
show table status like 'member';

CREATE INDEX idx_member_addr
	ON member (addr);
            
Analyze table member;
show table status like 'member';

CREATE UNIQUE INDEX idx_member_mem_name
	ON member (mem_name);
    
SELECT * FROM member;
SELECT mem_id,mem_name,addr FROM member where mem_name = '에이핑크';

DROP INDEX idx_member_mem_name ON member;
DROP INDEX idx_member_addr ON member;

SELECT table_name, constraint_name
	FROM information_schema.referential_constraints
    WHERE constraint_schema = 'market_db';
    
ALTER TABLE buy
	DROP FOREIGN KEY buy_ibfk_1;
ALTER TABLE member
	DROP PRIMARY KEY;
    
    