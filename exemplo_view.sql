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

-- View
create view vw_lista_funcionarios as
select cod, nome, especialidade
from funcionarios;

select * from vw_lista_funcionarios;

create view vw_lista_dependentes as
select cod, nome, cod_func
from dependentes;

select * from vw_lista_dependentes;

create view vw_funcionarios_e_dependentes as
select func.nome nome_funcionario, depen.nome nome_dependente
from funcionarios func
inner join dependentes depen
on func.cod = depen.cod_func;

select * from vw_funcionarios_e_dependentes;

create view vw_funcionarios_sem_especialidade as
select cod, nome, especialidade
from funcionarios
where especialidade is null;

select * from vw_funcionarios_sem_especialidade;

create view vw_funcionario_por_letra_j as
select cod, nome, especialidade
from funcionarios
where nome like 'J%';

select * from vw_funcionario_por_letra_j;

create view vw_numero_dependente_por_funcionario as
select func.nome nome_funcionario, count(depen.cod) quantia_dependentes
from funcionarios func
inner join dependentes depen
on func.cod = depen.cod_func
group by func.nome;	

select * from vw_numero_dependente_por_funcionario;