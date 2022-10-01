DROP DATABASE IF EXISTS naver_db;
CREATE DATABASE naver_db;

USE naver_db;
DROP TABLE IF EXISTS member;
CREATE TABLE member
( mem_id        CHAR(8) NOT NULL PRIMARY KEY,
  mem_name      VARCHAR(10) NOT NULL,
  mem_number    TINYINT NOT NULL,
  addr          VARCHAR(10) NOT NULL,
  phone1        CHAR(3) NULL,
  phone2        CHAR(8) NULL,
  height        TINYINT UNSIGNED NULL,
  debut_date    DATE NULL
);

DROP TABLE IF EXISTS BUY;
CREATE TABLE buy
( num           INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  mem_id        CHAR(8) NOT NULL,
  prod_name     CHAR(10) NOT NULL,
  group_name    CHAR(10) NULL,
  price         INT UNSIGNED NOT NULL,
  amount        SMALLINT UNSIGNED NOT NULL,
  FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', 'twice', '9', 'seoul', '02', '11111111', 167, '2015-10-19');
INSERT INTO member VALUES('BLK', 'blackpink', '4', 'gyeongnam', '055', '22222222', 163, '2016-8-8');
INSERT INTO member VALUES('WMN', 'girlfriend', '6', 'gyeonggi', '031', '33333333', 166, '2015-1-15');
                       
INSERT INTO buy VALUES(NULL, 'BLK', 'purse', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', 'macbookpro', 'digital', 1000, 1);