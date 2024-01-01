
use s_q_l;

create table customers(
	cid int primary key,
	cname varchar(50),
	age int(3),
	address varchar(100),
	city varchar(20),
	postalcode int(10),
	gender varchar(5),
	country varchar(20)
);

insert into customers values (001, "michal", 19, "haim ben.", "tel-aviv", 390022, "Male", "israel");
insert into customers values (002, "alis", 21, "newe haim", "yafo", 440019, "Male", "israel");
insert into customers values (003, "john", 22, "beer", "haifa", 560012, "Male", "israel");
insert into customers values (004, "bob", 23, "ben ben", "netanya", 440019, "Male", "israel");
insert into customers values (005, "moshe", 18, "atar", "gadera", 440019, "Male", "israel");
insert into customers values (006, "aviv", 25, "avi haim", "haifa", 560017, "Male", "israel");
insert into customers values (007, "aviel", 20, "Pabrdes", "afula", 440019, "Male", "israel");
insert into customers values (008, "nina", 17, NULL, "haifa", 560036, "Male", "israel");
insert into customers values (009, "itay", 22, "tom", "hadera", 440019, "Male", "israel");
insert into customers values (010, "doron", 20, "haviv", "haifa", 560063, "Male", "israel");


select * from customers where (city="haifa" or city="tel-aviv") and country="israel";

select cid, cname from customers where address is NULL;

select count(*) from customers where gender="Female";

select * from customers where city="afula" limit 3;

select *  from customers order by age desc;

select count(*) from customers where cname like ('%a') or cname like ('%h');

select * from customers where postalcode like ('5%') and (cname like ('s%') or cname like ('t%') or cname like ('p%'));

select * from customers where (city="haifa" or city="hadera" or city="netanya");