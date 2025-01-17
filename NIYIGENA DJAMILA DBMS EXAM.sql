Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 180
Server version: 8.3.0 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> drop database clients;
Query OK, 0 rows affected (0.02 sec)

mysql> create database clients;
Query OK, 1 row affected (0.02 sec)

mysql> USE CLIENTS;
Database changed
mysql> CREATE TABLE client_master(client_no int(10) primary key, name char(20), address char(30), city char(40), state char(50), bal_due int(200));
Query OK, 0 rows affected, 2 warnings (0.02 sec)

mysql> insert into client_master values('C123','ALICE','GASABO','KIGALI','RWANDAN','100');
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> insert into client_master values('C124','ALINE','NYARUGENGE','KIGALI','RWANDAN','300');
ERROR 1062 (23000): Duplicate entry '0' for key 'client_master.PRIMARY'
mysql> insert into client_master values('C451','ALINE','NYARUGENGE','KIGALI','RWANDAN','300');
ERROR 1062 (23000): Duplicate entry '0' for key 'client_master.PRIMARY'
mysql> insert into client_master values('D451','ALINE','NYARUGENGE','KIGALI','RWANDAN','300');
ERROR 1062 (23000): Duplicate entry '0' for key 'client_master.PRIMARY'
mysql> SELECT * FROM CLIENT_MASTER;
+-----------+-------+---------+--------+---------+---------+
| client_no | name  | address | city   | state   | bal_due |
+-----------+-------+---------+--------+---------+---------+
|         0 | ALICE | GASABO  | KIGALI | RWANDAN |     100 |
+-----------+-------+---------+--------+---------+---------+
1 row in set (0.00 sec)

mysql> insert into client_master values(1223,'ALINE','NYARUGENGE','KIGALI','RWANDAN','300');
Query OK, 1 row affected (0.01 sec)

mysql> update client_master modify client_no varchar(20);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'client_no varchar(20)' at line 1
mysql> alter client_master  change client_no client_no varchar(20);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'client_master  change client_no client_no varchar(20)' at line 1
mysql> alter table client_master  change client_no client_no varchar(20);
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> de
    ->
    -> delete from ^C
mysql> delete from client_master where client_no=0;
Query OK, 1 row affected (0.01 sec)

mysql> delete from client_master where client_no=1223;
Query OK, 1 row affected (0.00 sec)

mysql> insert into client_master values('D451','ALINE','NYARUGENGE','KIGALI','RWANDAN','300');
Query OK, 1 row affected (0.00 sec)

mysql> insert into client_master values('D345','ruth','gasabo','KIGALI','south','400');
Query OK, 1 row affected (0.00 sec)

mysql> select *from client_master;
+-----------+-------+------------+--------+---------+---------+
| client_no | name  | address    | city   | state   | bal_due |
+-----------+-------+------------+--------+---------+---------+
| D345      | ruth  | gasabo     | KIGALI | south   |     400 |
| D451      | ALINE | NYARUGENGE | KIGALI | RWANDAN |     300 |
+-----------+-------+------------+--------+---------+---------+
2 rows in set (0.00 sec)

mysql> insert into client_master values('C123','funny','kinazi','tanzania','nouth','5000');
Query OK, 1 row affected (0.00 sec)

mysql> insert into client_master values('T678','FRANK','kinazi','tanzania','SOUTH','10000');
Query OK, 1 row affected (0.00 sec)

mysql> insert into client_master values('R878','DERRICK','KINCAZA','KONGO','SOUTH','12000');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT *FROM CLIENT_MASTER;
+-----------+---------+------------+----------+---------+---------+
| client_no | name    | address    | city     | state   | bal_due |
+-----------+---------+------------+----------+---------+---------+
| D345      | ruth    | gasabo     | KIGALI   | south   |     400 |
| D451      | ALINE   | NYARUGENGE | KIGALI   | RWANDAN |     300 |
| C123      | funny   | kinazi     | tanzania | nouth   |    5000 |
| T678      | FRANK   | kinazi     | tanzania | SOUTH   |   10000 |
| R878      | DERRICK | KINCAZA    | KONGO    | SOUTH   |   12000 |
+-----------+---------+------------+----------+---------+---------+
5 rows in set (0.00 sec)

mysql> select name from client_master where bal_due >5000;
+---------+
| name    |
+---------+
| FRANK   |
| DERRICK |
+---------+
2 rows in set (0.01 sec)

mysql> update client_master set bal_due=12000 where client_no=878;
Query OK, 0 rows affected, 5 warnings (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 5

mysql> select *from client_master;
+-----------+---------+------------+----------+---------+---------+
| client_no | name    | address    | city     | state   | bal_due |
+-----------+---------+------------+----------+---------+---------+
| D345      | ruth    | gasabo     | KIGALI   | south   |     400 |
| D451      | ALINE   | NYARUGENGE | KIGALI   | RWANDAN |     300 |
| C123      | funny   | kinazi     | tanzania | nouth   |    5000 |
| T678      | FRANK   | kinazi     | tanzania | SOUTH   |   10000 |
| R878      | DERRICK | KINCAZA    | KONGO    | SOUTH   |   12000 |
+-----------+---------+------------+----------+---------+---------+
5 rows in set (0.00 sec)

mysql> update client _master set bal_due=5100 where client_no='123';
ERROR 1146 (42S02): Table 'clients.client' doesn't exist
mysql> alter table client_master rename to client 12;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '12' at line 1
mysql> update client _master set bal_due=5100 where client_no='C123';
ERROR 1146 (42S02): Table 'clients.client' doesn't exist
mysql> alter table client_master rename to client 12;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '12' at line 1
mysql> rename table client_master to client12;
Query OK, 0 rows affected (0.03 sec)

mysql> select bal_due as BALANCE;
ERROR 1054 (42S22): Unknown column 'bal_due' in 'field list'
mysql> select bal_due as BALANCe from client12;
+---------+
| BALANCe |
+---------+
|     400 |
|     300 |
|    5000 |
|   10000 |
|   12000 |
+---------+
5 rows in set (0.00 sec)

mysql> create database Orbut;
Query OK, 1 row affected (0.02 sec)

mysql> use Orbut;
Database changed
mysql> create table DEPARTMENTS(    DeptID INT PRIMARY KEY,
    ->     DeptName VARCHAR(50),
    ->     Location VARCHAR(50),
    ->     Manager VARCHAR(50),
    ->     EstablishedYear INT
    -> ^C
mysql> CREATE TABLE DEPARTMENTS(NAME CHAR(50), ID int Primary key, location char(50), MANAGER CHAR(50), Establishedyear int);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into departments values('finance','1','kigali','John doe','2015');
Query OK, 1 row affected (0.00 sec)

mysql> insert into departments values('HR','2','huye','jane Smith','2018');
Query OK, 1 row affected (0.00 sec)

mysql> insert into departments values('IT','3','MUSANZE','ALICE','2020');
Query OK, 1 row affected (0.00 sec)

mysql> insert into departments values('Marketing','4','RUSIZI','Jonson','2016');
Query OK, 1 row affected (0.00 sec)

mysql> insert into departments values('operation,'5','muhanga','djasila','2018');
    '> ^C
mysql> insert into departments values('operation,'5','muhanga','djasila','2018');
    '> ^C
mysql> select *from departments;
+-----------+----+----------+------------+-----------------+
| NAME      | ID | location | MANAGER    | Establishedyear |
+-----------+----+----------+------------+-----------------+
| finance   |  1 | kigali   | John doe   |            2015 |
| HR        |  2 | huye     | jane Smith |            2018 |
| IT        |  3 | MUSANZE  | ALICE      |            2020 |
| Marketing |  4 | RUSIZI   | Jonson     |            2016 |
+-----------+----+----------+------------+-----------------+
4 rows in set (0.00 sec)

mysql> insert into departments values('operation,'5','muhanga','djasila','2018');
    '> ^C
mysql> insert into departments values('doctor','5', 'ruhango','Ange','2022');
Query OK, 1 row affected (0.00 sec)

mysql> select *from departments;
+-----------+----+----------+------------+-----------------+
| NAME      | ID | location | MANAGER    | Establishedyear |
+-----------+----+----------+------------+-----------------+
| finance   |  1 | kigali   | John doe   |            2015 |
| HR        |  2 | huye     | jane Smith |            2018 |
| IT        |  3 | MUSANZE  | ALICE      |            2020 |
| Marketing |  4 | RUSIZI   | Jonson     |            2016 |
| doctor    |  5 | ruhango  | Ange       |            2022 |
+-----------+----+----------+------------+-----------------+
5 rows in set (0.00 sec)

mysql> create table employees(empid int primary key, name char(50), position char(50), Deptid int, salary decimal(10,2), foreign key(Deptid) References Departments(Deptid);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create table employees(empid int primary key, name char(50), position char(50), id int, salary decimal(10,2), foreign key(id) References Departments(id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create table employees(empid int primary key, name char(50), position char(50), ID int, salary decimal(10,2), foreign key(ID) References Departments(ID));
Query OK, 0 rows affected (0.01 sec)

mysql> insert into employees values('101','john king','Analyst','1','55000');
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values('102','Rwema','Recruiter','2','45000');
Query OK, 1 row affected (0.01 sec)

mysql> insert into employees values('103','Prince','developer','3','650000');
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values('104','dianah night','manager','4','4750000');
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values('105','bishop chris','supervisor','5','7650000');
Query OK, 1 row affected (0.00 sec)

mysql> select *from employees;
+-------+--------------+------------+------+------------+
| empid | name         | position   | ID   | salary     |
+-------+--------------+------------+------+------------+
|   101 | john king    | Analyst    |    1 |   55000.00 |
|   102 | Rwema        | Recruiter  |    2 |   45000.00 |
|   103 | Prince       | developer  |    3 |  650000.00 |
|   104 | dianah night | manager    |    4 | 4750000.00 |
|   105 | bishop chris | supervisor |    5 | 7650000.00 |
+-------+--------------+------------+------+------------+
5 rows in set (0.00 sec)

mysql> create database school 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '2' at line 1
mysql> create database school;
ERROR 1007 (HY000): Can't create database 'school'; database exists
mysql> create database schools;
Query OK, 1 row affected (0.02 sec)

mysql> use schools;
Database changed
mysql> create table STUDENT(studentID INT(5) primary key, fullname char(25), gender char(6), age int(2), department char(30));
Query OK, 0 rows affected, 2 warnings (0.01 sec)

mysql> insert into student values('0001','niyigena djamillah','female','1','BIT');
Query OK, 1 row affected (0.00 sec)

mysql> insert into student values('0002','MAKOMNE VIOLETTE','female','1','NURSING');
Query OK, 1 row affected (0.00 sec)

mysql> insert into student values('0003','RUKUNDO FRANK','MALE','2','POLITICAL');
Query OK, 1 row affected (0.00 sec)

mysql> insert into student values('0004','IGIRANEZA PACCY','MALE','3','CBE');
Query OK, 1 row affected (0.00 sec)

mysql> insert into student values('0005','RWEMA PRINCE','MALE','4','SMHS');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT *FROM STUDENT;
+-----------+--------------------+--------+------+------------+
| studentID | fullname           | gender | age  | department |
+-----------+--------------------+--------+------+------------+
|         1 | niyigena djamillah | female |    1 | BIT        |
|         2 | MAKOMNE VIOLETTE   | female |    1 | NURSING    |
|         3 | RUKUNDO FRANK      | MALE   |    2 | POLITICAL  |
|         4 | IGIRANEZA PACCY    | MALE   |    3 | CBE        |
|         5 | RWEMA PRINCE       | MALE   |    4 | SMHS       |
+-----------+--------------------+--------+------+------------+
5 rows in set (0.00 sec)

mysql> SELECT *FROM TABLE NAME WHERE GENDER='FEMALE';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TABLE NAME WHERE GENDER='FEMALE'' at line 1
mysql> SELECT *FROM STUDENT WHERE GENDER='FEMALE';
+-----------+--------------------+--------+------+------------+
| studentID | fullname           | gender | age  | department |
+-----------+--------------------+--------+------+------------+
|         1 | niyigena djamillah | female |    1 | BIT        |
|         2 | MAKOMNE VIOLETTE   | female |    1 | NURSING    |
+-----------+--------------------+--------+------+------------+
2 rows in set (0.00 sec)

mysql> SELECT *FROM STUDENT WHERE GENDER='MALE';
+-----------+-----------------+--------+------+------------+
| studentID | fullname        | gender | age  | department |
+-----------+-----------------+--------+------+------------+
|         3 | RUKUNDO FRANK   | MALE   |    2 | POLITICAL  |
|         4 | IGIRANEZA PACCY | MALE   |    3 | CBE        |
|         5 | RWEMA PRINCE    | MALE   |    4 | SMHS       |
+-----------+-----------------+--------+------+------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO STUDENT VALUES('0006','RUGWIRO FABRICE','MALE,'5','HR');
    '> ^C
mysql> INSERT INTO STUDENT VALUES('0006','RUGWIRO FABRICE','MALE,'5','HR');
    '> ^C
mysql> insert into student('0006','rugwiro eric','male','5','IT');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''0006','rugwiro eric','male','5','IT')' at line 1
mysql> insert into student(6,'rugwiro eric','male','5','IT');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '6,'rugwiro eric','male','5','IT')' at line 1
mysql> insert into student VALUES('6','rugwiro eric','male','5','IT');
Query OK, 1 row affected (0.00 sec)

mysql> DELETE FROM STUDENT WHERE AGE<20;
Query OK, 6 rows affected (0.00 sec)

mysql> SELECT *FROM STUDENT;
Empty set (0.01 sec)

mysql> INSERT INTO EMPLOYEES (Employee_Id, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Id, Salary, Commission_Pct, Manager_Id, Department_Id)
    -> VALUES
    -> (1, 'Mucyo', 'Ntazinda', 'mucyo.ntazinda@example.com', '+250789123456', '2025-01-17', 'DEV', 500000.00, 0.05, NULL, 1),
    -> (2, 'Ganza', 'Uwase', 'ganza.uwase@example.com', '+250788654321', '2024-06-01', 'HR', 350000.00, 0.03, 1, 2),
    -> (3, 'Kamanzi', 'Bamvungira', 'kamanzi.bamvungira@example.com', '+250783567890', '2023-11-15', 'FIN', 450000.00, 0.04, 2, 3);
ERROR 1146 (42S02): Table 'schools.employees' doesn't exist
mysql> CREATE TABLE EMPLOYEES (
    ->     Employee_Id INT PRIMARY KEY,
    ->     First_Name VARCHAR(50),
    ->     Last_Name VARCHAR(50),
    ->     Email VARCHAR(100) UNIQUE,
    ->     Phone_Number VARCHAR(20),
    ->     Hire_Date DATE,
    ->     Job_Id VARCHAR(10),
    ->     Salary DECIMAL(10, 2),
    ->     Commission_Pct DECIMAL(4, 2) NULL,
    ->     Manager_Id INT NULL,
    ->     Department_Id INT NULL,
    ->     FOREIGN KEY (Manager_Id) REFERENCES EMPLOYEES(Employee_Id),
    ->     FOREIGN KEY (Department_Id) REFERENCES DEPARTMENTS(Department_Id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO EMPLOYEES (Employee_Id, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Id, Salary, Commission_Pct, Manager_Id, Department_Id)
    -> VALUES
    -> (1, 'Mucyo', 'Ntazinda', 'mucyo.ntazinda@example.com', '+250789123456', '2025-01-17', 'DEV', 500000.00, 0.05, NULL, 1),
    -> (2, 'Ganza', 'Uwase', 'ganza.uwase@example.com', '+250788654321', '2024-06-01', 'HR', 350000.00, 0.03, 1, 2),
    -> (3, 'Kamanzi', 'Bamvungira', 'kamanzi.bamvungira@example.com', '+250783567890', '2023-11-15', 'FIN', 450000.00, 0.04, 2, 3);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into employees values(1, 'Mugabo', 'john', 'mugabojohn@gmail.com', '0789123456', '2025-01-17', 'DEV', 500000, 0.05, NULL, 1);
ERROR 1062 (23000): Duplicate entry '1' for key 'employees.PRIMARY'
mysql> insert into employees values(4, 'Mugabo', 'john', 'mugabojohn@gmail.com', '0789123456', '2025-01-17', 'DEV', 500000, 0.05, NULL, 1);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values(5, 'Mutoni', 'emme', 'mutoniemme@gmail.com', '0789123789', '2025-02-18', 'rav', 6700000, 0.09, NULL, 2);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values(6, 'Muhoza', 'naome', 'mutoniemme@gmail.com', '0789123457', '2025-03-19', 'rav', 9080000, 0.08, NULL, 3);
ERROR 1062 (23000): Duplicate entry 'mutoniemme@gmail.com' for key 'employees.Email'
mysql> insert into employees values(6, 'Muhoza', 'naome', 'muhozanaome@gmail.com', '0789123457', '2025-03-19', 'rav', 9080000, 0.08, NULL, 3);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values(7, 'niyigena', 'djamillah', 'niyigenadjamillah@gmail.com', '0790000078', '2025-04-20', 'sav', 78980000, 0.07, NULL, 4);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values(8, 'mahoro', 'alice', 'mahoroalice@gmail.com', '0790067894', '2026-08-20', 'avtv', 30080000, 0.07, NULL, 5);
Query OK, 1 row affected (0.01 sec)

mysql> select *from employees;
+-------------+------------+------------+--------------------------------+---------------+------------+--------+-------------+----------------+------------+---------------+
| Employee_Id | First_Name | Last_Name  | Email                          | Phone_Number  | Hire_Date  | Job_Id | Salary      | Commission_Pct | Manager_Id | Department_Id |
+-------------+------------+------------+--------------------------------+---------------+------------+--------+-------------+----------------+------------+---------------+
|           1 | Mucyo      | Ntazinda   | mucyo.ntazinda@example.com     | +250789123456 | 2025-01-17 | DEV    |   500000.00 |           0.05 |       NULL |             1 |
|           2 | Ganza      | Uwase      | ganza.uwase@example.com        | +250788654321 | 2024-06-01 | HR     |   350000.00 |           0.03 |          1 |             2 |
|           3 | Kamanzi    | Bamvungira | kamanzi.bamvungira@example.com | +250783567890 | 2023-11-15 | FIN    |   450000.00 |           0.04 |          2 |             3 |
|           4 | Mugabo     | john       | mugabojohn@gmail.com           | 0789123456    | 2025-01-17 | DEV    |   500000.00 |           0.05 |       NULL |             1 |
|           5 | Mutoni     | emme       | mutoniemme@gmail.com           | 0789123789    | 2025-02-18 | rav    |  6700000.00 |           0.09 |       NULL |             2 |
|           6 | Muhoza     | naome      | muhozanaome@gmail.com          | 0789123457    | 2025-03-19 | rav    |  9080000.00 |           0.08 |       NULL |             3 |
|           7 | niyigena   | djamillah  | niyigenadjamillah@gmail.com    | 0790000078    | 2025-04-20 | sav    | 78980000.00 |           0.07 |       NULL |             4 |
|           8 | mahoro     | alice      | mahoroalice@gmail.com          | 0790067894    | 2026-08-20 | avtv   | 30080000.00 |           0.07 |       NULL |             5 |
+-------------+------------+------------+--------------------------------+---------------+------------+--------+-------------+----------------+------------+---------------+
8 rows in set (0.00 sec)

mysql> SELECT Employee_Id, First_Name, Last_Name, Salary
    -> FROM EMPLOYEES;
+-------------+------------+------------+-------------+
| Employee_Id | First_Name | Last_Name  | Salary      |
+-------------+------------+------------+-------------+
|           1 | Mucyo      | Ntazinda   |   500000.00 |
|           2 | Ganza      | Uwase      |   350000.00 |
|           3 | Kamanzi    | Bamvungira |   450000.00 |
|           4 | Mugabo     | john       |   500000.00 |
|           5 | Mutoni     | emme       |  6700000.00 |
|           6 | Muhoza     | naome      |  9080000.00 |
|           7 | niyigena   | djamillah  | 78980000.00 |
|           8 | mahoro     | alice      | 30080000.00 |
+-------------+------------+------------+-------------+
8 rows in set (0.00 sec)

mysql> SELECT Employee_Id, First_Name, Last_Name
    -> FROM EMPLOYEES
    -> WHERE Manager_Id = 100;
Empty set (0.00 sec)

mysql> SELECT First_Name, Last_Name
    -> FROM EMPLOYEES
    -> WHERE Salary >= 4800;
+------------+------------+
| First_Name | Last_Name  |
+------------+------------+
| Mucyo      | Ntazinda   |
| Ganza      | Uwase      |
| Kamanzi    | Bamvungira |
| Mugabo     | john       |
| Mutoni     | emme       |
| Muhoza     | naome      |
| niyigena   | djamillah  |
| mahoro     | alice      |
+------------+------------+
8 rows in set (0.01 sec)

mysql> SELECT First_Name, Last_Name
    -> FROM EMPLOYEES
    -> WHERE Salary >= 4800;
+------------+------------+
| First_Name | Last_Name  |
+------------+------------+
| Mucyo      | Ntazinda   |
| Ganza      | Uwase      |
| Kamanzi    | Bamvungira |
| Mugabo     | john       |
| Mutoni     | emme       |
| Muhoza     | naome      |
| niyigena   | djamillah  |
| mahoro     | alice      |
+------------+------------+
8 rows in set (0.00 sec)

mysql> SELECT Employee_Id, First_Name, Last_Name, Salary
    -> FROM EMPLOYEES
    -> WHERE Last_Name = 'AUSTIN';
Empty set (0.00 sec)

mysql> SELECT First_Name, Last_Name
    -> FROM EMPLOYEES
    -> WHERE Department_Id IN (60, 70, 80);
Empty set (0.01 sec)

mysql> CREATE TABLE SALES (
    ->     Sales_No INT PRIMARY KEY,
    ->     Salesname VARCHAR(100),
    ->     Branch VARCHAR(50),
    ->     Salesamount DECIMAL(10, 2),
    ->     DOB DATE
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> create table sales(sales_no int primary key, salesname char(100), branch char(50), salesamount decimal(10, 2), DOB date));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table sales(sales_no int primary key, salesname char(100), branch char(50), salesamount decimal(10, 2), DOB date);
ERROR 1050 (42S01): Table 'sales' already exists
mysql> INSERT INTO SALES (Sales_No, Salesname, Branch, Salesamount, DOB)
    -> VALUES
    -> (1, 'John Doe', 'NYC', 15000.00, '1990-12-05'),
    -> (2, 'Alice Smith', 'LA', 20000.00, '1985-06-15'),
    -> (3, 'Bob Johnson', 'NYC', 25000.00, '1992-12-10'),
    -> (4, 'Emily Davis', 'LA', 18000.00, '1988-11-20'),
    -> (5, 'Michael Brown', 'SF', 22000.00, '1987-12-25');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert inti sales values('5', 'Michael Brown', 'SF', '22000', '1987-12-25');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sales values('5', 'Michael Brown', 'SF', '22000', '1987-12-25')' at line 1
mysql> insert into sales values('5', 'Michael Brown', 'SF', '22000', '1987-12-25');
ERROR 1062 (23000): Duplicate entry '5' for key 'sales.PRIMARY'
mysql> insert into sales values('6', 'Michael allain', 'SF', '22000', '1987-12-25');
Query OK, 1 row affected (0.00 sec)

mysql> insert into sales values('7', 'rukundo frank', 'tf', '25000', '1988-11-26');
Query OK, 1 row affected (0.00 sec)

mysql> insert into sales values('8', 'rwema olivier', 'gh', '28000', '1908-10-27');
Query OK, 1 row affected (0.00 sec)

mysql> insert into sales values('9', 'hakizimana bahati', 'fr', '87000', '1908-9-28');
Query OK, 1 row affected (0.00 sec)

mysql> insert into sales values('10', 'iradukunda fanny', 'mr', '97000', '1998-8-28');
Query OK, 1 row affected (0.00 sec)

mysql> insert into sales values('11', 'muhoza aline', 'kt', '88000', '1998-7-30');
Query OK, 1 row affected (0.00 sec)

mysql> select *from sales;
+----------+-------------------+--------+-------------+------------+
| Sales_No | Salesname         | Branch | Salesamount | DOB        |
+----------+-------------------+--------+-------------+------------+
|        1 | John Doe          | NYC    |    15000.00 | 1990-12-05 |
|        2 | Alice Smith       | LA     |    20000.00 | 1985-06-15 |
|        3 | Bob Johnson       | NYC    |    25000.00 | 1992-12-10 |
|        4 | Emily Davis       | LA     |    18000.00 | 1988-11-20 |
|        5 | Michael Brown     | SF     |    22000.00 | 1987-12-25 |
|        6 | Michael allain    | SF     |    22000.00 | 1987-12-25 |
|        7 | rukundo frank     | tf     |    25000.00 | 1988-11-26 |
|        8 | rwema olivier     | gh     |    28000.00 | 1908-10-27 |
|        9 | hakizimana bahati | fr     |    87000.00 | 1908-09-28 |
|       10 | iradukunda fanny  | mr     |    97000.00 | 1998-08-28 |
|       11 | muhoza aline      | kt     |    88000.00 | 1998-07-30 |
+----------+-------------------+--------+-------------+------------+
11 rows in set (0.00 sec)

mysql> SELECT Branch, SUM(Salesamount) AS Total_Sales
    -> FROM SALES
    -> GROUP BY Branch;
+--------+-------------+
| Branch | Total_Sales |
+--------+-------------+
| NYC    |    40000.00 |
| LA     |    38000.00 |
| SF     |    44000.00 |
| tf     |    25000.00 |
| gh     |    28000.00 |
| fr     |    87000.00 |
| mr     |    97000.00 |
| kt     |    88000.00 |
+--------+-------------+
8 rows in set (0.01 sec)

mysql> SELECT Branch, AVG(Salesamount) AS Average_Sales
    -> FROM SALES
    -> GROUP BY Branch;
+--------+---------------+
| Branch | Average_Sales |
+--------+---------------+
| NYC    |  20000.000000 |
| LA     |  19000.000000 |
| SF     |  22000.000000 |
| tf     |  25000.000000 |
| gh     |  28000.000000 |
| fr     |  87000.000000 |
| mr     |  97000.000000 |
| kt     |  88000.000000 |
+--------+---------------+
8 rows in set (0.00 sec)

mysql> SELECT Salesname, TO_CHAR(DOB, 'DD-Mon-YY') AS DOB
    -> FROM SALES
    -> WHERE EXTRACT(MONTH FROM DOB) = 12;
ERROR 1305 (42000): FUNCTION schools.TO_CHAR does not exist
mysql> SELECT Salesname, TO_CHAR(DOB, 'DD-Mon-YY') AS DOB
    -> FROM SALES
    -> ORDER BY EXTRACT(MONTH FROM DOB), Salesname;
ERROR 1305 (42000): FUNCTION schools.TO_CHAR does not exist
mysql> SELECT Salesname, DATE_FORMAT(DOB, '%d-%b-%y') AS DOB
    -> FROM SALES
    -> WHERE MONTH(DOB) = 12;
+----------------+-----------+
| Salesname      | DOB       |
+----------------+-----------+
| John Doe       | 05-Dec-90 |
| Bob Johnson    | 10-Dec-92 |
| Michael Brown  | 25-Dec-87 |
| Michael allain | 25-Dec-87 |
+----------------+-----------+
4 rows in set (0.02 sec)

mysql>