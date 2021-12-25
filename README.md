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
***
SQL Advanced Grammar
---
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