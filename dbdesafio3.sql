drop database dbdesafio;

create database dbdesafio;

use dbdesafio;

create table tbFuncionarios (
    codFunc int not null auto_increment,
    nome varchar(50),
    email varchar(50),
    telefone char(11) unique,
    endereco varchar(50),
    numero char(9) unique,
    cep varchar(9),
    bairro varchar(50),
    cidade varchar(50),
    estado varchar(50),
    primary key(codFunc)
);


insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) 
    values('Eduardo','edu@gmail.com','95392-8512','Rua Batista Amado','25697-4156','05967-517','Jardim das Flores','São Paulo','São Paulo');
insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) 
    values('João','joao@gmail.com','97469-3169','Rua Dos Alfeneiros','5612-745','96478-517','Maringa','Recife','Pernambuco');
insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) 
    values('Udison','udison@gmail.com','96314-4578','Rua Paulo Santos','9631-8546','02467-787','Uberlandia','Nítroi','Rio de Janeiro');
insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) 
    values('Francisco','fran@gmail.com','9693-8457','Rua Cleber Junior','28934-4156','45621-5172','Jardim Angela','São Paulo','São Paulo');
insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) 
    values('Amanda','amanda@gmail.com','94493-8512','Rua Francisco Xavier','5836-4156','07567-517','Novo Horizonte','Belo Horizonte','Minas Gerais');

select * from tbFuncionarios;

update tbFuncionarios set nome = 'Kleber' where codFunc= 4;
update tbFuncionarios set bairro = 'João Pessoa' where codFunc= 2;
update tbFuncionarios set email = 'amanda189@yahoo.com' where codFunc= 5;

select * from tbFuncionarios;

delete from tbFuncionarios where codFunc= 2;

select * from tbFuncionarios;

select nome from tbFuncionarios;
select * from tbFuncionarios;
select codFunc * 3 from tbFuncionarios;
select codFunc as 'Código',nome as 'Nome',email as 'Email',telefone as 'Telefone',endereco as 'Endereço',numero as 'Numero',cep as 'CEP',bairro as 'Bairro',cidade as 'Cidade',estado as 'Estado' from tbFuncionarios;
select 'Sim' as pessoa from tbFuncionarios;

select distinct tipo from tbFuncionarios; -- tipos sem repetição --

select distinct tipo from tbFuncionarios;
