create database  bd_view;
use bd_view;

create table funcionarios(
	cod int primary key auto_increment,
    nome varchar(255) not null,
    especialidade varchar(255) not null
);

create table dependentes(
	cod int primary key auto_increment,
    nome varchar(255) not null,
    cod_func int not null,
    foreign key (cod_func) references funcionarios(cod)
);

insert into funcionarios(nome, especialidade)
values ('João Sales', 'Desenvolvedor Full Stack'),
('Daniel Moreira', 'Analista de Dados'),
('Giovanna Busnardi', 'Técnico de Informática'),
('Laura Dias', 'Engenheira de Software'),
('Matheus Costa', 'Desenvolvedor Frontend');

select * from funcionarios;

insert into dependentes(nome, cod_func)
values ('Fábio Costa', 5),
('Heitor Costa', 5),
('Isabela Sales', 1),
('Maria Dias', 4),
('Lucas Busnardi', 3);

select * from dependentes;