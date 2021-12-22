Sql Study
==========
This study is referred to the book, [SQL for Studying Alone].(http://www.yes24.com/Product/Goods/104661489)
***
# Table of Contents
1. [Database and SQL](#database-and-sql)
2. [Preview of SQL for real use](#preview-of-sql-for-real-use)
3. [SQL Basic Grammar](#sql-basic-grammar)
4. [SQL Advanced Grammar](#sql-advanced-grammar)
4. [Table and View](#table-and-view)
4. [Index](#index)
4. [Stored Procedure](#stored-procedure)
4. [SQL and Python](#sql-and-python)
***
Database and SQL
---
### 1. Learning Database
* Database: a set of data
* **Database Management System (DBMS)**: a software that manages and operates the database
    - A database should be shared and allow access to several users or application programs simultaneously, so Microsoft Excel is not a DBMS for this reason.
* *Examples of DBMS*: MySQL, Oracle, SQL server, MariaDB, and etc.
* *History of DBMS*
    - Before DBMS, people used a **file** to document and manage their data. However, with vast amount of data managed by different people, there could be an inconsistency in data management. That's why **DBMS** came out in 1973 by E.F. Codd, to manage and operate database more efficiently. DBMS uses **SQL** (Structured Query Language).
* *Types of DBMS*
    - *Hierarchical DBMS*: Each hierarchy is in a **tree** structure. Hierarchical DBMS is difficult to change after the configuration is completed and connect each data, so it is no longer used because of this inefficiency.
    - *Network DBMS*: Network DBMS solved the problem of Hierarchical DBMS by connecting each subdata so that one subdata does not have to move all the way to the root of the tree to get to another subdata, but it is also no longer used because it is too complicated for the programmer to understand the whole structure of the database to use it.
    - **Relational DBMS**: Relational DBMS, or RDBMS, uses a **table**, a two-dimensional structure using rows and columns. RDBMS use tables as its smallest unit to manage each data set. Most of the DBMSs today use this type of DBMS.
* **SQL**
    - SQL is a language used in RDBMS. **Standard SQL** created by ISO, but each company creating a DBMS uses a slightly differentiated SQL that reflects the characteristics of each product, although it complies with standard SQL. For example, Oracle uses PL/SQL, SQL server uses T-SQL, and MySQL uses SQL.

***
Preview of SQL for Real Use
---
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