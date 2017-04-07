create database library;

create table book (
id int(13) not null,
title varchar(15) not null,
publisher varchar(15),
pubyear int(4),
description varchar(200),
series varchar(20),
gle_level decimal,
grl_level char,
lexile_level int(3),
quantity int(2),
image varchar(15),
genre varchar(15),
location int not null,
primary key (id)
);
--foreign key (location) references location(loc_id); Table must be altered later. 
);

create table author (
book_id int(13) not null,
author_name varchar(50) not null,
primary key (book_id,author),
foreign key (book_id) references book(id)
);

create table location (
loc_code int(2) not null,
loc varchar(15) not null,
primary key (loc_code)
);

update table book (
foreign key (location) references location(loc_code)
);

create table search_terms (
book_id int(13) not null,
term varchar(20) not null,
primary key (book_id, term)
);

create table user (
user_id int not null,
username varchar(15) not null,
fname varchar(15) not null,
lname varchar(15) not null,
email varchar(30),
primary key (user_id)
);

create table admin (
admin_id int not null,
username varchar(15) not null,
fname varchar(15) not null,
lname varchar(15) not null,
email varchar(30),
primary key (admin_id)
);

create table available (
check_out_id int not null,
book_id int(13) not null,
check_out date not null,
check_in date,
due_date date not null,
check_out_user int(2) not null,
check_out_admin int(2) not null,
primary key (check_out_id),
foreign key (book_id) references book(id),
foreign key (check_out_user) references user (user_id),
foreign key (check_out_admin) references admin (admin_id)
);

