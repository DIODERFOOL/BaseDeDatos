create database abogados;
create table register(
	id_usuario int NOT NULL auto_increment PRIMARY KEY,
	name varchar(50) NOT NULL,
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL
);	

