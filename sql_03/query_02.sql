-- 1. For the following relation schema:
-- employee(employee-name, street, city) 
-- works(employee-name, company-name, salary)
-- company(company-name, city)
-- manages(employee-name, manager-name)
-- Give an expression in SQL for each of the following queries:

mysql> USE sql_03
-- Database changed

mysql> CREATE TABLE Employee ( Ename VARCHAR(100) PRIMARY KEY, Street VARCHAR(100), City VARCHAR(100));
-- Query OK, 0 rows affected (0.05 sec)


mysql> CREATE TABLE Company (Cname VARCHAR(100) PRIMARY KEY, City VARCHAR(100));
-- Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Works ( Ename VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE, Cname VARCHAR(100) REFERENCES Company(Cname) ON DELETE CASCADE, Salary INT(12));
-- Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> CREATE TABLE Manages (EmpName VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE, MgrName VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE);
-- Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO Employee VALUES
    -> ("Michal", "ABC", "Avivim"),
    -> ("Shon", "XYZ", "Levi"),
    -> ("Nitay", "PQR", "Levon"),
    -> ("Lior", "AB", "Levi");
-- Query OK, 4 rows affected (0.02 sec)
-- Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Company VALUES
    -> ("State Bank Of Israel", "Levi"),
    -> ("Lod", "Levi");
-- Query OK, 2 rows affected (0.01 sec)
-- Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Works VALUES
    -> ("Michal", "Lod", 645132),
    -> ("Shon", "State Bank Of Israel", 352146),
    -> ("Nitay", "State Bank Of Israel", 512463),
    -> ("Lior", "State Bank Of Israel", 865741);
-- Query OK, 4 rows affected (0.01 sec)
-- Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Manages VALUES
    -> ("Shon", "Nitay"),
    -> ("Nitay", "Michal"),
    -> ("Shon", "Lior");
-- Query OK, 3 rows affected (0.01 sec)
-- Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT Employee.Ename, Street, City FROM Employee, Works
    -> WHERE (Employee.Ename=Works.Ename AND Cname="State Bank Of Israel" AND Salary>10000);
-- +-------+--------+-------+
-- | Ename | Street | City  |
-- +-------+--------+-------+
-- | Shon  | XYZ    | Levi  |
-- | Nitay | PQR    | Levon |
-- | Lior  | AB     | Levi  |
-- +-------+--------+-------+
-- 3 rows in set (0.00 sec)

mysql> SELECT Employee.Ename FROM Employee, Company, Works
    -> WHERE Employee.Ename=Works.Ename AND Company.Cname=Works.Cname
    -> AND Employee.City=Company.City;
-- +-------+
-- | Ename |
-- +-------+
-- | Shon  |
-- | Lior  |
-- +-------+
-- 2 rows in set (0.00 sec)

mysql> SELECT EmpEmp.Ename FROM Employee AS EmpEmp, Manages, Employee AS MgrEmp
    -> WHERE EmpEmp.Ename=Manages.EmpName AND EmpEmp.City=MgrEmp.City
    -> AND Manages.EmpName=EmpEmp.Ename AND Manages.MgrName=MgrEmp.Ename;
-- +-------+
-- | Ename |
-- +-------+
-- | Shon  |
-- +-------+
-- 1 row in set (0.00 sec)

mysql> SELECT Employee.Ename FROM Employee, Works
    ->  WHERE Employee.Ename=Works.Ename AND (NOT (Cname="State Bank Of Israel"));
-- +--------+
-- | Ename  |
-- +--------+
-- | Michal |
-- +--------+
-- 1 row in set (0.00 sec)

mysql> SELECT Employee.Ename FROM Employee, Works
    ->  WHERE Employee.Ename=Works.Ename AND Salary>(SELECT MAX(Salary) FROM Works WHERE Cname="Lod");
-- +-------+
-- | Ename |
-- +-------+
-- | Lior  |
-- +-------+
-- 1 row in set (0.00 sec)

mysql> SELECT Cname FROM Company
    -> WHERE (NOT(Cname="Lod")) AND ((SELECT City FROM Company WHERE Cname="Lod") IN
    -> (SELECT City FROM Company GROUP BY Cname));
-- +----------------------+
-- | Cname                |
-- +----------------------+
-- | State Bank Of Israel |
-- +----------------------+
-- 1 row in set (0.00 sec)

mysql> SELECT Employee.Ename FROM Employee, Works
    ->  WHERE Employee.Ename=Works.Ename
    ->  AND Salary > (SELECT AVG(Salary) FROM Works AS SubWorks
    -> WHERE SubWorks.Cname=Works.Cname);
-- +-------+
-- | Ename |
-- +-------+
-- | Lior  |
-- +-------+
-- 1 row in set (0.00 sec)

mysql> SELECT Cname FROM Works
    ->  WHERE (SELECT SUM(Salary) FROM Works AS SubWorks WHERE SubWorks.Cname=Works.Cname)
    -> IN (SELECT MIN(PayRoll) FROM (SELECT SUM(Salary) as PayRoll FROM Works GROUP BY Cname)
    -> AS PayRollPerCompany);
-- +-------+
-- | Cname |
-- +-------+
-- | Lod   |
-- +-------+
-- 1 row in set (0.00 sec)