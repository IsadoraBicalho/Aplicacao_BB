create database Departamento;
use Departamento;
Go

create table Departamentos (
	id_departamento int identity(1,1) primary key,
	nome varchar(100)
);

create table Funcionarios (
	id_funcionario int identity(1,1) primary key,
	nome varchar(100) not null,
	id_departamento int,
	foreign key (id_departamento) references Departamentos (id_departamento)
);
insert into Departamentos(nome)
Values
('RH'),
('Design Gráfico'),
('Financeiro');


insert into Funcionarios(id_departamento,nome)
VALUES 
(1,'Felipe'),
(2,'Marcia'),
(3,'Regina'),
(3,'João'),
(2,'José'),
(1,'Margarida'),
(3,'Luísa');

select * from Funcionarios;

# Desafio 1: Mapeamento de Departamentos
select 
	d.nome as Departamento,
	f.nome as Funcionario
FROM 
	Departamentos as d
Left join 
	Funcionarios as f
ON d.id_departamento = f.id_departamento 
ORDER By f.nome;

insert into Departamentos(nome)
values ('Inovação'); --como não tinha colocado o departamento pedido, tive que fazer insert

select 
	d.nome as Departamento,
	f.nome as Funcionario
FROM 
	Departamentos as d
Left join 
	Funcionarios as f
ON d.id_departamento = f.id_departamento 
ORDER By d.nome;

#Desafio 2: Classificação de Salários
-- Como não tiha colocado a tabela de salários, coloquei depois	

alter table Funcionarios 
add salario decimal(10,2);

update Funcionarios 
set salario = 2750.50
where id_funcionario = 1;

update Funcionarios 
set salario = 4050.50
where id_funcionario = 2;

update Funcionarios 
set salario = 5750.50
where id_funcionario = 3;

update Funcionarios 
set salario = 6050.50
where id_funcionario = 4;

update Funcionarios 
set salario = 7040.50
where id_funcionario = 5;

update Funcionarios 
set salario = 2750.50
where id_funcionario = 6;

update Funcionarios 
set salario = 5000.50
where id_funcionario = 7;

create table Faixas_Salarios(
	faixa_id int identity(1,1) primary key,
    salario_min decimal(10,2) not null,
    salario_max decimal(10,2) not null,
    categoria varchar(15) not null
);

insert into Faixas_Salarios(salario_min,salario_max,categoria)
values
(0,2999.00,'Junior'),
(3000.00,5999.00,'Pleno'),
(6000.50,8000.00,'Senior');

delete Faixas_Salarios;


select
f.nome as Funcionario,
f.salario as Salario,
s.categoria as Nivel_salarial
from Funcionarios f
left join Faixas_Salarios s
on f.salario between s.salario_min and s.salario_max
order by salario;

# Desafio 3: Relatório Específico
select
f.nome as Funcionario,
f.salario as Salario,
s.categoria as Nivel_salarial,
d.nome as Departamento
from Funcionarios f 
join Departamentos d on f.id_departamento = d.id_departamento
join Faixas_Salarios s on f.salario between s.salario_min and salario_max
where d.nome = 'Financeiro' 
and s.categoria = 'Pleno';
