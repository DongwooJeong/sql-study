Sql Study
==========
This study is referred to the book, [SQL for Studying Alone](http://www.yes24.com/Product/Goods/104661489).
***
# Table of Contents
1. [Database and SQL](#database-and-sql)
2. [Preview of SQL for Real Use](#preview-of-sql-for-real-use)
3. [SQL Basic Grammar](#sql-basic-grammar)
4. [SQL Advanced Grammar](#sql-advanced-grammar)
4. [Table and View](#table-and-view)
4. [Index](#index)
4. [Stored Procedure](#stored-procedure)
4. [SQL and Python](#sql-and-python)
***
Database and SQL
---
### 1-1. Learning Database
* Database: a set of data
* **Database Management System (DBMS)**: a software that manages and operates the database
    - A database should be shared and allow access to several users or application programs simultaneously, so Microsoft Excel is not a DBMS for this reason.
    <br><br>
* *Examples of DBMS*: MySQL, Oracle, SQL server, MariaDB, and etc.
<br><br>
* *History of DBMS*
    - Before DBMS, people used a **file** to document and manage their data. However, with vast amount of data managed by different people, there could be an inconsistency in data management. That's why **DBMS** came out in 1973 by E.F. Codd, to manage and operate database more efficiently. DBMS uses **SQL** (Structured Query Language).
    <br><br>
* *Types of DBMS*
    - *Hierarchical DBMS*: Each hierarchy is in a **tree** structure. Hierarchical DBMS is difficult to change after the configuration is completed and connect each data, so it is no longer used because of this inefficiency.
    - *Network DBMS*: Network DBMS solved the problem of Hierarchical DBMS by connecting each subdata so that one subdata does not have to move all the way to the root of the tree to get to another subdata, but it is also no longer used because it is too complicated for the programmer to understand the whole structure of the database to use it.
    - **Relational DBMS**: Relational DBMS, or RDBMS, uses a **table**, a two-dimensional structure using rows and columns. RDBMS use tables as its smallest unit to manage each data set. Most of the DBMSs today use this type of DBMS.
    <br><br>
* **SQL**
    - SQL is a language used in RDBMS. **Standard SQL** created by ISO, but each company creating a DBMS uses a slightly differentiated SQL that reflects the characteristics of each product, although it complies with standard SQL. For example, Oracle uses PL/SQL, SQL server uses T-SQL, and MySQL uses SQL.
    <br><br>
### 1-2. Install MySQL
<br><br>
***
Preview of SQL for Real Use
---
### 2-1. Database Modeling
* *Project*: The process of transferring real-world tasks to computer systems or the entire process of creating large-scale software
* Software(~program): a product of a programming language
    - As software is getting more complicated, there needs to be a detailed plan with procedures in order to make a software (project). Software engineering studies these procedures.
    - *Waterfall model*: one of the basic software development procedures in software engineering.
        > Requirements - Analysis - Design - Development - Testing - (Deployment) - Maintenance
    - Database Modeling is *Analysis* and *Design* stage of the project.
<br><br>
* **Database Modeling**: The process of transferring real objects or tasks to database objects of DBMS
    - how to transfer: Extract features representing objects in the real world and convert them into tables in the database
<br><br>
* Database terminology
    - **Data**: each piece of information
    - **Table**: table for entering data
    - **Database**: storage that stores tables
    - **DBMS**: database management system or software (MySQL)
    - **Column (or Field)**: vertical part on the table
    - **Column Name**: name to distinguish each column
    - **Data Type**: format of data to be stored in a column
    - **Row (or Record)**: the actual data, also called *row data*
    - **Primary key**: the only column that separates each row, should never be duplicated or empty
    - **SQL**: *Structured Query Language*, a language for people and DBMS to communicate
### 2-2. From the Beginning to the End of the Database
* Procedure for building a database
    > *Create a database - Create tables - Enter / Modify / Delete data - Look up / Utilize the data*

1. Creating a *Schema*
    - Schema = Database
    - Creating a schema named 'shop_db'
        ```SQL
        CREATE SCHEMA 'shop_db' ;
        ```
    
2. Creating tables
    - Design a table first, specifying the column name and data type
        - Data type examples: CHAR (Character), INT (Integer), DATE
        - Not Null: Data must be entered
        - Having a space between each word is not recommended, so "_ (underscore)" can replace it
    - Creating a 'member' table
        ``` SQL  
        CREATE TABLE `shop_db`.`member` (
         `member_id` CHAR(8) NOT NULL,
         `member_name` CHAR(5) NOT NULL,
         `member_addr` CHAR(20) NULL,
         PRIMARY KEY (`member_id`));
        ```
    - Creating a 'product' table 
        ```SQL
        CREATE TABLE `shop_db`.`product` (
         `product_name` CHAR(4) NOT NULL,
         `cost` INT NOT NULL,
         `make_date` DATE NULL,
         `company` CHAR(5) NULL,
         `amount` INT NOT NULL,
         PRIMARY KEY (`product_name`));
        ```

3. Enter/Add/Modify/Delete data
    - Entering data into the 'member' table
        ```SQL
        INSERT INTO `shop_db`.`member` (`member_id`, `member_name`, `member_addr`) VALUES ('tess', 'Hoona', 'Bucheon');
        INSERT INTO `shop_db`.`member` (`member_id`, `member_name`, `member_addr`) VALUES ('hero', 'Young', 'Seoul');
        INSERT INTO `shop_db`.`member` (`member_id`, `member_name`, `member_addr`) VALUES ('iyou', 'IU', 'Incheon');
        INSERT INTO `shop_db`.`member` (`member_id`, `member_name`, `member_addr`) VALUES ('jyp', 'JinY', 'Goyang');
        ```
    - Entering data into the 'product' table
        ```SQL
        INSERT INTO `shop_db`.`product` (`product_name`, `cost`, `make_date`, `company`, `amount`) VALUES ('bana', '1500', '2021-07-01', 'delmo', '17');
        INSERT INTO `shop_db`.`product` (`product_name`, `cost`, `make_date`, `company`, `amount`) VALUES ('samk', '800', '2023-09-01', 'CJ', '22');
        INSERT INTO `shop_db`.`product` (`product_name`, `cost`, `make_date`, `company`, `amount`) VALUES ('cass', '2500', '2022-03-01', 'OB', '3');
        ```
        - Be careful to enter the data according to the datatype

    - Adding data to the 'member' table
        ```SQL
        INSERT INTO `shop_db`.`member` (`member_id`, `member_name`, `member_addr`) VALUES ('carry', 'Maria', 'Texas');
        ```
    - Modifying data in the 'member' table
        ```SQL
        UPDATE `shop_db`.`member` SET `member_addr` = 'London' WHERE (`member_id` = 'carry');
        ```
    - Deleting data from the 'member' table
        ```SQL
        DELETE FROM `shop_db`.`member` WHERE (`member_id` = 'carry');
        ```
4. Utilizing data
    * In SQL, SELECT statements are mainly used to utilize database.
        - *Reserved Words*: Previously defined SQLs, such as SELCECT or WHERE.
        <br><br>
    * Procedures to execute queries
        1) Click on "Create a new SQL tab for executing queries" icon from the toolbar or [File] - [New Query Tab].
        2) Double click on the schema that you want to utilize and make sure that the name of the schema is bolded.

        3) Look up data in the table
        > SELECT column_name FROM table_name [WHERE condition] 
        * Looking up all the rows in the table
            ```SQL
            SELECT * FROM member;
            ```
            * \* means every column
            <br><br>
        4) Click on "Execute the selected portion of the script or everything" icon to see the result on the [Result Grid], and result, duration, and fetch on the [Output] panel.
            -  Can also use [Query] - [Execute (All or Selection)] or Ctrl+Shift+Enter
    <br><br>
        * Only looking up 'member_name' and 'member_addr' column from the 'member' table
            ```SQL
            SELECT member_name, member_addr From member;
            ```

        * Only looking up the member's data whose member_name is 'IU'
            ```SQL
            SELECT * FROM member WHERE member_name = 'IU';
            ```
        * When there are two different SQLs, DBMS performs both of them. Therefore, you can drag and select the SQL you want to execute so that DBMS can only execute the specified SQL.
### 2-3. Database Object
* There are several **database objects** that are mutually related to the table, a key object in the database, such as *index, view, or stored procedure*.
    <br><br>
    1. **Index**
        - Indexes help to find data easily when inquiring from a table, especially when there is a lot of data, which is an efficient function that greatly reduces time.
        <br><br>
        - Full Table Scan
            ```SQL
            select * from member where member_name ='IU';
            ```
        - Create an Index
            ```SQL
            create index idx_member_name ON member(member_name);
            ```
        - This creates an index named 'idx_member_name' in the 'member_name' column of the 'member' table.
        - When we use the same SQL above, which is to look up the member whose name is 'IU,' now the database use *Non-Unique Key Lookup*, which is an **Index Scan**.
        <br><br>
    2. **View**
        - View can be defined as a *virtual table*, which is linked to the actual table.
        <br><br>
        - Create a view for 'member' table
            ```SQL
            create view member_view
            As
		        select * from member;
            ```
            - SQL does not need an indent to execute the code, but indents are often used for legibility.
        - Accessing 'member_view' 
            ```SQL
            Select * from member_view;
            ```
            - This view will show the same result as the table, as a shortcut.
            <br><br>
        - There are two reasons to use View.
            1) Security
            2) Can make a long SQL statement simple
    <br><br>
    3. **Stored Procedure**
        - Stored Procedure is a *programming function* provided by MySQL that can be conveniently used by grouping multiple SQL statements together.
        - With this, computational expressions, conditional statements, and repetitive statements used in other programming languages may be used in MySQL as well.
        <br><br>
        - Create a stored procedure
            ```SQL
            Delimiter //
            Create procedure myProc()
            Begin
	                Select * from member where member_name='hoona';
	                Select * from product where product_name='samk';
            End //
            Delimiter ;
            ```
            - This SQL combines two different SQL between Begin and End into one stored procedure.
        - Call the newly created stored procedure
            ```SQL
            Call myProc();
            ```
            - The result will show the same as executing the two different SQL to look up the data.
        
        - Delete the procedure
            ```SQL
            Drop procedure myProc ;
            ```


***
SQL Basic Grammar
---
### 3-1. Select ~ From ~ Where
* Select: Retrieve data from the table
    - Basic format: SELECT (Row name) FROM (Table name) WHERE (Condition)
<br><br>
* Creating a database called market_db
    ```SQL
    DROP DATABASE IF EXISTS market_db;
    CREATE DATABASE market_db;
    ```
    - DROP DATABASE: Deleting the database named market_db
    - CREATE DATABASE: Creating a new database
<br><br>
* Creating a Member table
    ```SQL
    USE market_db;
    CREATE TABLE member
    (   mem_id  	CHAR(8) NOT NULL PRIMARY KEY,
        mem_name    VARCHAR(10) NOT NULL, 
        mem_number  INT NOT NULL,  
        addr	  	CHAR(2) NOT NULL, 
        phone1		CHAR(3), 
        phone2		CHAR(8), 
        height    	SMALLINT,  
        debut_date	DATE  
    );        
    ```    
    - USE: Selecting a database to use
        * All subsequent queries are executed in this db
    - CREATE TABLE: Creating a new table
        <br> &ensp; *Two hyphens(--) in SQL represents comment*
<br><br>
* Creating a Buy table
    ```SQL
    CREATE TABLE buy
    (   num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
        mem_id  	CHAR(8) NOT NULL,
        prod_name 	CHAR(6) NOT NULL,
        group_name 	CHAR(4), 
        price     	INT  NOT NULL,
        amount    	SMALLINT  NOT NULL,
        FOREIGN KEY (mem_id) REFERENCES member(mem_id)
    );
    ```
    - AUTO_INCREMENT: Automatically entering numbers
<br><br>
* Inserting data into a table
    ```SQL
    INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
    INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
    ```
    - CHAR, VARCHAR, and DATe types need quotation marks, while INT type doesn't
    - Since Num are automatically entered, we input NULL
<br><br>
* Retrieving data
    ```SQL
    SELECT * FROM member;
    SELECT * FROM buy;
    ```
* Structure of SELECT statement
    ```SQL
    SELECT select_expr
    [FROM table_references]
    [WHERE where_condition]
    [GROUP BY {col_name | expr | position}]
    [HAVING where_condition]
    [ORDER BY {col_name | expr | position}]
    [LIMIT {[offset,] row_count | row_count OFFSET offset}]
    ```
* SELECT and FROM
     ```SQL
    USE market_db;
    SELECT * FROM member; --SELECT * FROM market_db.member;
    ```
    * \* means everything
    * You can specify the db name in front of the table name using a dot(.)
<br><br>
* Selecting specific columns from the table
    ```SQL
    SELECT addr, debut_date, mem_name FROM member;
    SELECT addr address, debut_date "debut date", mem_name FROM member; -- using alias to change how the column name is printed in the result
    -- column_name alias, column_name2 "alias with spaces"
    ```
* SELECT FROM WHERE
    - Using WHERE to query specific records that matches the condition 
    ```SQL
    SELECT * FROM member WHERE mem_name = '블랙핑크';
    SELECT * FROM member WHERE mem_number = 4;
    ```
* Using comparison operator and logical operating in WHERE
    ```SQL
    SELECT mem_id, mem_name FROM member WHERE height <= 162;
    SELECT mem_name, height, mem_number FROM member WHERE height >= 165 AND mem_number >6;
    SELECT mem_name, height, mem_number FROM member WHERE height >= 165 OR mem_number >6;
    ```
* BETWEEN ~ AND
    ```SQL
    SELECT mem_name, height FROM member WHERE height >= 163 AND height <= 165;
    SELECT mem_name, height FROM member WHERE height BETWEEN 163 AND 165;
    ```
* IN()
    ```SQL
    SELECT mem_name, addr FROM member WHERE addr = '경기' OR addr = '전남' OR addr = '경남';
    SELECT mem_name, addr FROM member WHERE addr IN('경기', '전남', '경남');
    ```
* LIKE
    ```SQL
    SELECT * FROM member WHERE mem_name LIKE '우%';
    SELECT * FROM member WHERE mem_name LIKE '__핑크';
    ```
    - Selecting a part of a string using LIKE and %(whatever comes before or after) or _(matching just one letter)
<br><br>
* Subquery: Having SELECT inside SELECT
    ```SQL
    SELECT mem_name, height FROM member
        WHERE height > (SELECT height FROM member WHERE mem_name = '에이핑크);

### 3-2. More about SELECT
* ORDER BY: Controls the sequence of the outcome
    ```SQL
    SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date;
    SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date ASC;
    SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date DESC;
    ```
    - ASC: Ascending order
    - DESC: Descending order
    <br><br>
    ```SQL
    SELECT mem_id, mem_name, debut_date height FROM member ORDER BY height DESC WHERE height>= 164; -- error
    SELECT mem_id, mem_name, debut_date height FROM member WHERE height>= 164 ORDER BY height DESC;
    ```
    - ORDER BY can be used with WHERE, but it should be used after WHERE
    <br><br>
    ```SQL
    SELECT mem_id, mem_name, debut_date, height FROM member WHERE height >= 164 ORDER BY height DESC, debut_date ASC;
    ```
    - Having multiple orders
<br><br>
* Limit: limits the number of output printed
    ```SQL
    SELECT * FROM member LIMIT 3;
    SELECT * FROM member LIMIT 0,3;
    SELECT * FROM member LIMIT 3 OFFSET 0;
    ```
    - Retrieving first 3 records from the output
    - Limit starting_number, number_of_records
        * LIMIT 0,3 is same as LIMIT 3
        * LIMIT number_of_records OFFSET starting_number
    <br><br>
    ```SQL
    SELECT mem_name, debut_date FROM member ORDER BY debut_date LIMIT 3;
    SELECT mem_name, height FROM member ORDER BY height DESC LIMIT 3,2;
    ```
    - Usually used with ORDER BY
<br><br>
* DISTINCT: removes duplicate
    ```SQL
    SELECT addr FROM member;
    SELECT addr FROM member ORDER BY addr;
    SELECT DISTINCT addr FROM member;
    ```
* GROUP BY: grouping records
    ```SQL
    SELECT mem_id, amount FROM buy ORDER BY mem_id;
    SELECT mem_id, SUM(amount) FROM buy GROUP BY mem_id;
    ```
    - SUM(), AVG(), MIN(), MAX(), COUNT(), COUNT(DISTINCT)
    <br><br>
    ```SQL
    SELECT mem_id "member id", SUM(amount) "total purchase" FROM buy GROUP BY mem_id;
    ```
    * Using alias to organize output table
    <br><br>
    ```SQL
    SELECT mem_id "member id", SUM(price*amount) "total purchase" FROM buy GROUP BY mem_id;
    SELECT AVG(amount) "average purchase" FROM buy;
    SELECT mem_id, AVG(amount) "average purchase" FROM buy GROUP BY mem_id;
    ```
    - Can do the calculation within the parenthesis
    - Can be used with GROUP BY
    <br><br>
    ```SQL
    SELECT COUNT(*) FROM member;
    SELECT COUNT(phone1) "members with contact" FROM member;
    ```
    - Counting the number of members  
    - Count(row_name) counts the number of records not null
    <br><br>
    ```SQL
    SELECT mem_id "member id", SUM(price*amount) "total purchase"
    FROM buy GROUP BY mem_id;
    SELECT mem_id "member id", SUM(price*amount) "total amount" FROM buy WHERE SUM(price*amount) > 1000;
    GROUP BY mem_id; -- error
    SELECT mem_id "member id", SUM(price*amount) "total amount" FROM buy GROUP BY mem_id HAVING SUM(price*amount) > 1000;
    ```
    - HAVING is used with GROUP BY, similarly functions as where
    <br><br>
    ```SQL
    SELECT mem_id "member id", SUM(price*amount) "total purchase" FROM buy GROUP BY mem_id HAVING SUM(price*amount) > 1000 ORDER BY SUM(price*amount) DESC;
    ```
### 3-3. SQL for data manipulation
* INSERT: enter row data into the table
    - INSERT INTO table[(row1, row2, ...)] VALUES (value1, value2, ...)
    ```SQL
    USE market_db;
    CREATE TABLE hongong1 (toy_id INT, toy_name CHAR(4), age INT);
    INSERT INTO hongong1 VALUES (1, 'woody', 25);
    INSERT INTO hongong1 (toy_id, toy_name) VALUES (2, 'Buzz');
    ``` 
    - Specifies column names if you don't want to enter data for all columns
        + Null value for Unspecified columns
    ```SQL
    INSERT INTO hongong1 (toy_name, age, toy_id) VALUES ('Jessie', 20, 3);
    ```
    - Can change the order of the column
    <br><br>
    AUTO_INCREMENT: enters the value increasing from 1, should be a primary key
    ```SQL
    CREATE TABLE hongong2 ( toy_id INT AUTO INCREMENT PRIMARY KEY, toy_name CHAR(4) age INT);
    INSERT INTO hongong2 VALUES(NULL, 'Bo peep', 25);
    INSERT INTO hongong2 VALUES(NULL, 'Slinky', 22);
    INSERT INTO hongong2 VALUES(NULL, 'Rex', 21);
    SELECT * FROM hongong2;
    ```
    - Enter NULL for AUTO_INCREMENT
    <br><br>
    ```SQL
    SELECT LAST_INSERT_ID();
    ```
    - The result is 3, which means that with AUTO_INCREMENT, entered up to 3
    <br><br>
    ```SQL
    ALTER TABLE hongong2 AUTO_INCREMENT=100;
    INSERT INTO honghong2 VALUES (NULL, 'jenam' 35);
    SELECT * FROM hongong2;
    ```
    - Change the beginning AUTO_INCREMENT value to 100
    <br><br>
    ```SQL
    CREATE TABLE hongong3 (
        toy_id INT AUTO_INCREMENT PRIMARY KEY,
        toy_name CHAR(4),
        age INT);
    ALTER TABLE hongong3 AUTO_INCREMENT=1000;
    SET @@auto_increment_increment=3;
    ```
    - AUTO_INCREMENT value increases from 1000 by 3
    <br><br>
    ```SQL
    INSERT INTO hongong3 VALUES (NULL, 'thomas', 20);
    INSERT INTO hongong3 VALUES (NULL, 'james', 23);
    INSERT INTO hongong3 VALUES (NULL, 'gordon', 25);
    SELECT * FROM hongong3;
    ```
    - toy_id goes like "1000, 1003, 1006, ..."
    <br><br>
    ```SQL
    INSERT INTO hongong3 VALUES (NULL, 'thomas', 20), (NULL, 'james', 23), (NULL, 'gordon', 25)
    ```
    - Same as the previous code
    <br><br>
    - INSERT INTO ~ SELECT: retrieve data from other table to insert data
    - INSERT INTO table_name (row_name1, row_name2, ...) SELECT ;
    - Number of columns in SELECT should match that in the table to be inserted
    - Using world.city table, sue INSERT INTO ~ SELECT
    ```SQL
    SELECT COUNT(*) FROM world.city;
    DESC world.city;
    SELECT * FROM world.city LIMIT 5; 
    ```
    - Checking some info about world.city table
    ```SQL
    CREATE TABLE city_popul (city_name CHAR(35), population INT);
    INSERT INTO city_popul SELECT Name, Population FROM world.city;
    ```
* UPDATE: Modifying data in the table
    - UPDATE table_name SET row1=value1, row2=value2, ... WHERE condition ;
    ```SQL
    USE market_db;
    UPDATE city_popul SET city_name = '서울'
    WHERE city_name = 'Seoul';
    Select * FROM city_pupul WHERE city_name = '서울';
    ```
    - Updating 'Seoul' into '서울'
    <br><br>
    ```SQL
    UPDATE city_popul SET city_name = '뉴욕', population = 0 WHERE city_name = 'New York';
    SELECT * FROM city popul WHERE city_name = '뉴욕'
    ```
    - Updating several column values at once
    <br><br>
    ```SQL
    UPDATE city_popul SET city_name = '서울';
    ```
    - Not recommended, changes every row value when skipping WHERE
    <br><br>
    ```SQL
    UPDATE city_popul
    SET population = population / 1000;
    SELECT * FROM city_popul LIMIT 5;
    ```
    - Dividing all values in population column by 1000
<br><br>
* DELETE: deletes the data
    - DELETE FROM table_name WHERE condition ;
    ```SQL
    DELETE FROM city_popul WHERE city_name Like 'New%';
    ```
    - Deleting records that contains the city name beginning 'New...'
    <br><br>
    ```SQL
    DELETE FROM city_popul
    WHERE city_name LIKE 'New%'
    Limit 5;
    ```
    - Deleting top 5 records matching the condition
    <br><br>
    - Deleting a large table
    ```SQL
    DELETE FROM big_table1;
    Drop TABLE big_table2;
    TRUNCATE TABLE big_table3;
    ```
    - DELETE deletes every record, so it takes long time, leaving an empty table
    - DROP deletes the table itself
    - TRUNCATE is similar to DELETE, but faster, leaving an empty table, but cannot use WHERE like DELETE

***
SQL Advanced Grammar
---
### 4-1. Data type in MySQL
* Why use a data type?
    - To efficiently store data in the db <br><br>
* Data Types
    - Exact Numeric Data Type 
        |data type|byte|range   |
        |---------|----|--------|
        |TINYINT|1|-128~127|
        |SMALLINT|2|-32,768~32,767|
        |INT|4|-2.1B~2.1B|
        |BIGINT|8| -9Q~9Q|
    
        * Exact Numeric Data Type Example
            ```SQL
            USE market_db;
            CREATE TABLE hongong4 (
                tinyint_col TINYINT,
                smallint_col SMALLINT,
                int_col INT
                bigint_col BIGINT );
            ```
            ```SQL
            INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 9000000000000000000);
            ```
            ```SQL
            INSERT INTO hongong4 VALUES(128, 32768, 2147483648, 90000000000000000000); -- Out of range error
            ```
            ```SQL
            CREATE TABLE member
            ( mem_id CHAR(8) NOT NULL PRIMARY KEY,
              mem_name VARCHAR(10) NOT NULL,
              mem_number INT NOT NULL,
              addr CHAR(2) NOT NULL,
              phone1 CHAR(3),
              phone2 CHAR(8),
              height SMALLINT,
              debut_date DATE
            );
            ```
            - Inefficient use of exact numeric data types
            - Can use UNSIGNED to only store positive numbers
                + TINYINT UNSIGNED is 0 ~ 255
                <br><br>
            - Correction
            ```SQL
            CREATE TABLE member
            ( mem_id CHAR(8) NOT NULL PRIMARY KEY,
              mem_name VARCHAR(10) NOT NULL,
              mem_number TINYINT NOT NULL, -- member number cannot be over 127
              addr CHAR(2) NOT NULL,
              phone1 CHAR(3),
              phone2 CHAR(8),
              height TINYINT UNSIGNED, -- height cannot be over 256
              debut_date DATE
            );
            ```
    - String Data Type

        |data type| byte|
        |---------|-----|
        |CHAR(num)|1~255|
        |VARCHAR(num)|1~16383|
        + CHAR: fixed length
        + VARCHAR: variable length
            * VARCHAR can use space efficiently, but CHAR has a faster speed in terms of performance in MySQL <br><br>
        + CHAR and Numeric String
            ```SQL
            CREATE TABLE member
            ( mem_id CHAR(8) NOT NULL PRIMARY KEY,
              mem_name VARCHAR(10) NOT NULL,
              mem_number TINYINT NOT NULL,
              addr CHAR(2) NOT NULL,
              phone1 CHAR(3),
              phone2 CHAR(8),
              height TINYINT UNSIGNED,
              debut_date DATE
            );
            ```
            * mem_id can be CHAR(3)/VARCHAR(3)/CHAR(8)/VARCHAR(8)
                - but CHAR(8) is most efficient
            * phone1 and phone2 can be numeric data type
                - but it has no meaning as an integer
                    + arithmetic operation
                    + size comparison
                - 0 in front of the string disappears <br><br>
        + Large amount of string data
            ```SQL
            CREATE TABLE big_table (
                data1 CHAR(256), --column length too big error
                data2 VARCHAR(16384) ); --column length too big error
            ```
            |data type||byte|
            |---|---|---|
            |TEXT|TEXT|1~65535|
            ||LONGTEXT|1~4294967295|
            |BLOB|BLOB|1~65535|
            ||LONGBLOB|1~4294967295|
            * TEXT and LONGTEXT are for long script.
            * BLOB means Binary Long Object, like images and videos (binary data)
            * example
                ```SQL
                CREATE DATABASE netflix_db;
                USE netflix_db;
                CREATE TABLE movie
                   (movie_id       INT,
                    movie_title    VARCHAR(30),
                    movie_director VARCHAR(20),
                    movie_star     VARCHAR(20),
                    movie_script   LONGTEXT,
                    movie_film     LONGBLOB
                )
    - Approximate Numeric Data Type
        |data type|byte|description|
        |-|-|-|
        |FLOAT|4|7 decimal places|
        |DOUBLE|8|15 decimal places|
    
    - Data and Time data type
        |data type|byte|description|
        |-|-|-|
        |DATE|3|YYYY-MM-DD|
        |TIME|3|HH:MM:SS|
        |DATETIME|8|YYYY-MM-DD HH:MM:SS|
    
    - Using Variables
        * SQL can declare variable and set value, but closing MySQL will delete the variables
        * how to use variables
            - SET @variablename = value ;
            - SELECT @variablename ;
                ```SQL
                USE market_db;
                SET @myVar1 = 5 ;
                SET @myVar2 = 4.25 ;

                SELECT @myVar1 ;
                SELECT @myVar1 + @myVar2 ;

                SET @txt = 'singer name==> ' ;
                SET @height = 166 ;
                SELECT @txt , mem_name FROM member WHERE height > @height ;
                ```
                + Using variable and retrieving data from the table
                <br>
                + Using LIMIT with variables
                    ```SQL
                    SET @count =3;
                    SELECT mem_name, height FROM member ORDER BY height LIMIT @count; -- error, LIMIT cannot have variables
                    ```
                <br>
                + Solution using PREPARE and EXECUTE.

                ```SQL
                SET @count = 3;
                PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
                EXECUTE mySQL USING @count;
                ```
                * PREPARE doesn't execute but prepare the SQL statement and EXECUTE executes it
                * ? takes value from what comes after USING
                <br><br>
    * Data Type Conversion
        - Explicit conversion using functions
            + CAST(), CONVERT()
            + Format
                * CAST ( value AS data_type [ (length) ])
                * CONVERT ( value, data_type [ (length) ])
            + Example
                ```SQL
                SELECT AVG(price) AS 'average price' FROM buy;
                ```
                ```SQL
                142.9167
                ```
                ```SQL
                 SELECT CAST(AVG(price) AS SIGNED) 'average price' FROM buy ; -- SIGNED is SIGNED INTEGER and UNSIGNED is UNSIGNED INTEGER
                 SELECT CONVERT(AVG(price) , SIGNED) 'average price' FROM buy ;
                ```
                ```SQL
                143
                ```
                ```SQL
                SEELCT CAST('2022$12$12' AS DATE);
                SEELCT CAST('2022/12/12' AS DATE);
                SEELCT CAST('2022%12%12' AS DATE);
                SEELCT CAST('2022@12@12' AS DATE);
                ```
                ```SQL
                2020-12-12
                ```
                ```SQL
                SELECT num, CONCAT(CAST(price AS CHAR), 'X', CAST(amount AS CHAR), '=' ) 'priceXamount', price*amount 'purchase amount'
                FROM buy;
                ```
                * CONCAT() concatenates strings
                <br>
        - Implicit Conversion
            ```SQL
            SELECT '100' + '200' ; -- Automatically convert string to numeric
            SELECT CONCAT('100','200'); -- how to concatenate strings
            SELECT CONCAT(100,'200'); -- Automatically convert numeric to string
            SELECT 100 + '200'; -- Automatically convert string to numeric
            ```
### 4-2. Join
* Join: combine rows from two or more tables, based on a related column between them
    - Inner Join
        + In order to Join, table should be connected as one to many relationship
            * One to many relationship: one record(PK) in a table can be associated with one or more records(FK) in another table
        + most common type of join
        + join can be done with 3 or more tables, but mostly 2
        + format
            * SELECT <row list>
              FROM <first table>
                INNER JOIN <second table>
                ON (Join condition)
                [WHERE search condition]
            ```SQL
            USE market_db;
            SELECT *
                FROM buy
                    INNER JOIN member
                    ON buy.mem_id = member.mem_id
                WHERE buy.mem_id = 'GRL';
            ```
            <br><br>
            * need to specify from which table we use the common row_name
                - table_name.row_name
            <br><br>
            * use alias to simplify the code
            ```SQL
            SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(M.phone, M.phone2) 'contact'
                FROM buy B
                    INNER JOIN member M
                    ON B.mem_id = M.mem_id;
            ```
            <br><br>
            * Inner join only shows the record that has a content in both tables.
                - If you want to see the record that has has a content in at least one of the tables, use OUTER JOIN
            * use DISTINCT to remove duplicates in the result
            ```SQL
            SELECT DISTINCT M.mem_id, M.mem_name, M.addr
                FROM buy B
                    INNER JOIN member M
                    ON B.mem_id = M.mem_id
                    ORDER BY M.mem_id;
    - Outer Join
        + Outer Join: return matched values and unmatched values from either or both tables
        + format
            * SELECT <row list>
              FROM <first(LEFT) table>
                <LEFT|RIGHT|FULL> OUTER JOIN <second(RIGHT) table>
                ON (Join condition)
                [WHERE search condition]
            ```SQL
            SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
                FROM member M
                    LEFT OUTER JOIN buy B
                    ON M.mem_id = B.mem_id
                ORDER BY M.mem_id;
            ```
            * LEFT OUTER JOIN = LEFT JOIN: contents from the left table should all be printed
            <br><br>
            * Same result using RIGHT JOIN
            ```SQL
            SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
                FROM buy B
                    RIGHT OUTER JOIN member M
                    ON M.mem_id = B.mem_id
                    ORDER BY M.mem_id;
            ```
            <br><br>
            * utilizing Outer Join
            ```SQL
            SELECT DISTINCT M.mem_id, B.prod_name, M.mem_name, M.addr
                FROM member M
                    LEFT OUTER JOIN buy B
                    ON M.mem_id = B.mem_id
                WHERE B.prod_name IS NULL
                ORDER BY M.mem_id;
            ```
            <br><br>
            * FULL OUTER JOIN: a conbination of LEFT OUTER JOIN and RIGHT OUTER JOIN
    - Other Joins
        * Cross Join: generate a paired combination of each row of the first table with each row of the second table
            - also known as cartesian product
            ```SQL
            SELECT *
                FROM buy
                CROSS JOIN member ;
            ```
            - cannot use ON
            - randomly join, no meaning in the result
            - main purpose is to create a large amount of data
            ```SQL
            SELECT COUNT(*) "# of data"
                FROM sakila.inventory
                    CROSS JOIN world.city;
            ```
            - in order to create a table with this data, use CREATE TABLE ~ SELECT statement
        * Self Join: joining table itself (using 1 table)
            - format
                * SELECT <row list>
                  FROM <table> alias_a
                    INNER JOIN <table> alias_b
                    ON (Join condition)
                [WHERE search condition]
                ```SQL
                SELECT A.emp "employee", B.emp "boss", B.phone "boss contact"
                    FROM emp_table A
                        INNER JOIN emp_table B
                        ON A.manager = B.emp
                    WHERE A.emp = 'chief of accounting';
                ```
                * same data in one table, but exists in more than 2 rows
                


***
Table and View
---
***
Index
---
***
Stored Procedure
---
***
SQL and Python
---
***