/*
Practice 1
SQL Create Database
SQL Drop Database
SQL Create Table
SQL Insert Into Table
SQL Drop Table
*/


# Single line Comment
/*
Multiline Comment
*/
# ctrl shift enter fot execute entire script
# ctrl enter to execute current line

#show databases;		# show available databases
#use  world;			# selecting a database
#show tables;			# Printing selected database
#select * from city;	# selecting a column in that database
#select * from countrylanguage	# selecting a dissferent column

#create database customers;	# creating a custom database
#show databases;			# seeing if database excist
#drop database customers;	# deleting that database
#show databases;				# seeing if its gone
# creating a custom database again
create database customers;
use customers;

# create table in database customers
create table customer_info(id integer,first_name varchar(10),
last_name varchar(10));

# id is first colum name and its datatype is integer
# datatype varchar mean string and can have speccial character with one or more rows
# last_name is third column name  with datatype varchar

show tables;
select * from customer_info;

# inserting values in columns

Insert into customer_info(id,first_name,last_name) values(1,'Bilal','Khan');

Insert into customer_info(id,first_name,last_name) values(1,'Daniyal','Javeed');

show tables;					# Showing selecting database
select * from customer_info; 	# Showing selecting columns of selected database

drop table customer_info;		# deleting table
drop database customers;		# deleting database customers

########################
/*
Practice 2
SQL Null Values
SQL Update Statement
SQL Delete Statement
SQL Alter Table
--Add column in existing Columns
--Modify/alter Column
--Alter Table-Drop Column
*/
show databases;
create database customer;
use customer;
show tables;
create table customer_info(
id integer auto_increment,
first_name varchar(25),
last_name varchar(25),
salary integer,
primary key(id)
);
show tables;
select * from customer_info;

# inserting record in table
insert into customer_info(first_name,last_name,salary)
values
('Bilal','khan',50000),
('Daniyal','Javeed',25000),
('Maha','Arbaz',15000),
('Janal','Khan',60000),
('Ankit','Sharma',NULL);

select * from customer_info where salary is null;
select * from customer_info where salary is not null;

# SQL Update Statement to replace null values
update customer_info set salary=45000 where id=5;

select * from customer_info;

# SQL delete statement

delete from customer_info where id=5;
select * from customer_info;

# SQL alter table
# 1. add column is existing table
alter table customer_info add email varchar(25);
select * from customer_info;

############
update customer_info set email='abc@gmail.com' where id=1;
update customer_info set email='abc@gmail.com' where id=2;
update customer_info set email='abc@gmail.com' where id=3;
update customer_info set email='abc@gmail.com' where id=4;

select * from customer_info;
###############

alter table customer_info add dob date;
select * from customer_info;

# 2. alter table modify column type
alter table customer_info modify dob year;
select * from customer_info;

# see schema(type)
desc customer_info;

# 2. alter table to drop column
alter table customer_info drop column email;
select * from customer_info;

#################
show databases;
use customer;
show tables;
select * from customer_info;
drop table customer_info;
drop database customer;
show databases;
#################
/*
Practice 3
SQL Constraints
1. Not Null
2. Unique
3. Primary Key
4. Foreign Key
5. Check
6. Default
7. Index
*/

create database Practice1;
show databases;
use Practice1;
show tables;

create table student(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);

select * from student;
desc student;

Alter table student modify age int not null;
desc student;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int not null,
unique(id)							# id can't be same
);

show tables;
select * from person;

insert into person values(1, 'Bilal','Khan',33);
insert into person values(2, 'Jamal','Don',33);
select * from person;
#insert into person values(1, 'Jasdaamal','Dasdon',3433);
desc person;

# it can be added later on with alter
Alter table person
Add unique(first_name);
desc person;
#insert into person values(6, 'Bilal','Khan',33);

# another way add 2 feature to make unique constraint
Alter table person
add constraint uc_person unique(age,first_name);

select * from person;
desc person;

# drop unique constraint
alter table person
drop index uc_person;

desc person;

## Primary key

create table person1(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
constraint pk_person primary key(id,last_name)
);

show tables;
desc person1;

alter table person1
drop primary key;		# droped all primary key

desc person1;

alter table person1
add primary key(id);

desc person1;

########################
show databases;
use practice1;
show tables;
select * from person;
select * from person1;
select * from student;

desc person;
desc person1;
desc student;
#####################
# MYSQL indexes
show databases;
use customer;

create table student(
id integer not null,
first_name varchar(10),
last_name varchar(10),
age int
);

show tables;
desc student;
select * from student;

create index index_age
on student(age);

desc student;

# muti index

create index index_age_first_name
on student(age,first_name);

desc student;

# drop index

alter table student
drop index index_age_first_name;

alter table student
drop index index_age;


desc student;

##############

show databases;
use customer;
show tables;
select * from student;
desc student;

alter table student modify
id int auto_increment;

alter table student modify
first_name varchar(25) not null;

alter table student modify
last_name varchar(25) not null;

alter table student
add primary key(id);

select * from student;

insert into student values
(1, "Bilal","Khan",31),
(2, "Danyal","Javeed",25),
(3, "Maha","Arbaz",21);

select * from student;

create table department(
id int auto_increment,
department_name varchar(25) not null,
foreign key(id) references student(id)
);

desc department;

insert into department values
(1,'Computer science'),
(2,'Electronics'),
(3,'Mechanical');

show databases;
use customer;
show tables;
select * from department;
select * from student;

#create view student_info as
select first_name,last_name,age from
student inner join department using(studentid);

select * from student_info;

drop table department;
drop table student_info;
drop table student;
show tables;
###########

create table student(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
primary key(studentid)
);

show tables;

insert into student values
(1, "Bilal","Khan",31),
(2, "Danyal","Javeed",25),
(3, "Maha","Arbaz",21);

select * from student;

create table department(
studentid int auto_increment,
department_name varchar(25) not null,
foreign key(studentid) references student(studentid)
);

insert into department values
(1, "Computer science"),
(2, "Electronics"),
(3, "Mechnical");


select * from department;
desc department;

create view student_info as
select first_name,last_name,age from student
inner join department using (studentid);

select * from student_info;

drop view student_info;

##################

/*
1. Inner Join
2. Left Join
3. Right Join
4. Full Join
5. Natural Join
6. Cross Join
*/

show databases;
use customer;
show tables;
select * from student;
#insert into student values(4,'Ankit','Kumar',27);
#insert into student values(5,'Ramesh','Singh',27);

select * from department;

# inner join

select * from student inner join department
on student.studentid=department.studentid;

select student.first_name,student.last_name,student.age,department.department_name
from student inner join department
on student.studentid=department.studentid;

# Left Join

select student.first_name,student.last_name,student.age,department.department_name
from student left join department
on student.studentid=department.studentid;

# Right Join

select student.first_name,student.last_name,student.age,department.department_name
from student right join department
on student.studentid=department.studentid;

# Full outer Join

select student.first_name,student.last_name,student.age,department.department_name
from student left join department
on student.studentid=department.studentid
union
select student.first_name,student.last_name,student.age,department.department_name
from student right join department
on student.studentid=department.studentid;

# cross join

select student.first_name,student.last_name,student.age,department.department_name
from student cross join department;

# Natural join	# show values linked by common values

select student.first_name,student.last_name,student.age,department.department_name
from student natural join department;