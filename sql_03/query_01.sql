USE sql_03

CREATE TABLE IF NOT EXISTS `employee`(
	`eid` INT NOT NULL AUTO_INCREMENT,
	`ename` varchar(50),
	`street` varchar(50),
	`city` varchar(50),
	PRIMARY KEY (`eid`)
);

CREATE TABLE IF NOT EXISTS `company`(
	`cid` int NOT NULL AUTO_INCREMENT,
	`cname` varchar(50),
	`city` varchar(50),
	PRIMARY KEY (`cid`)
);

CREATE TABLE Company (
    Cname VARCHAR(100) PRIMARY KEY,
    City VARCHAR(100)
);

CREATE TABLE Works (
    Ename VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE,
    Cname VARCHAR(100) REFERENCES Company(Cname) ON DELETE CASCADE,
    Salary INT(12)
);

CREATE TABLE Manages (
    EmpName VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE,
    MgrName VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE
);

INSERT INTO Employee VALUES
    ("Michal", "ABC", "Avivim"),
    ("Shon", "XYZ", "Levi"),
    ("Nitay", "PQR", "Levon"),
    ("Lior", "AB", "Levi");

INSERT INTO Company VALUES
    ("State Bank Of Israel", "Levi"),
    ("Lod", "Levi");
    
INSERT INTO Works VALUES
    ("Michal", "Lod", 645132),
    ("Shon", "State Bank Of Israel", 352146),
    ("Nitay", "State Bank Of Israel", 512463),
    ("Lior", "State Bank Of Israel", 865741);
    
INSERT INTO Manages VALUES
    ("Shon", "Nitay"),
    ("Nitay", "Michal"),
    ("Shon", "Lior");
    
SELECT Employee.Ename, Street, City FROM Employee, Works 
    WHERE (Employee.Ename=Works.Ename AND Cname="State Bank Of Israel" AND Salary>10000);

SELECT Employee.Ename FROM Employee, Company, Works
    WHERE Employee.Ename=Works.Ename AND Company.Cname=Works.Cname 
    AND Employee.City=Company.City;
    
SELECT EmpEmp.Ename FROM Employee AS EmpEmp, Manages, Employee AS MgrEmp
    WHERE EmpEmp.Ename=Manages.EmpName AND EmpEmp.City=MgrEmp.City 
    AND Manages.EmpName=EmpEmp.Ename AND Manages.MgrName=MgrEmp.Ename;

SELECT Employee.Ename FROM Employee, Works
    WHERE Employee.Ename=Works.Ename AND (NOT (Cname="State Bank Of Israel"));

SELECT Employee.Ename FROM Employee, Works
    WHERE Employee.Ename=Works.Ename AND Salary>(SELECT MAX(Salary) FROM Works WHERE Cname="Lod");
    
SELECT Cname FROM Company
    WHERE (NOT(Cname="Lod")) AND ((SELECT City FROM Company WHERE Cname="Lod") IN 
    (SELECT City FROM Company GROUP BY Cname));

SELECT Employee.Ename FROM Employee, Works
    WHERE Employee.Ename=Works.Ename
    AND Salary > (SELECT AVG(Salary) FROM Works AS SubWorks 
    WHERE SubWorks.Cname=Works.Cname);

SELECT Cname FROM Works 
    WHERE (SELECT SUM(Salary) FROM Works AS SubWorks WHERE SubWorks.Cname=Works.Cname) 
    IN (SELECT MIN(PayRoll) FROM (SELECT SUM(Salary) as PayRoll FROM Works GROUP BY Cname) 
    AS PayRollPerCompany);

