drop database dbCds;

create database dbCds; 

use dbCds;

create table tbArtistas(
    codArt int not null auto_increment,
    nomeArt varchar(100) not null unique,
    primary key(codArt)
);

create table tbGravadoras (
    codGrav int not null auto_increment,
    nomeGrav varchar(50) not null unique,
    primary key(codGrav)
);

create table tbCategorias(
    codCat int not null auto_increment,
    nomeCat varchar(50) not null unique,
    primary key(codCat)
);

create table tbEstados(
    siglaEst char(2) not null,
    nomeEst varchar(50) not null unique,
    primary key(siglaEst)
);


create table tbFuncionarios(
    codFunc int not null auto_increment,
    nomeFunc varchar(50) not null,
    endFunc varchar(100) not null,
    salFunc decimal(9,2) not null default 0 check(salFunc >= 0),
    sexoFun char(1) not null default 'F' check(sexoFun in('F','M')),
    primary key(codFunc)
);

create table tbCidades(
    codCid int not null auto_increment,
    siglaEst char(2) not null,
    nomeCid varchar(50) not null,
    primary key(codCid),
    foreign key(siglaEst) references tbEstados(siglaEst)
);

create table tbClientes(
    codCli int not null auto_increment,
    codCid int not null,
    nomeCli varchar(50) not null,
    endCli varchar(100) not null,
    rendaCli decimal(9,2) not null default 0 check(rendaCli >= 0),
    sexoCli char(1) not null default 'F' check(sexoCli in ('F','M')),
    primary key(codCli),
    foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge(
    codConj int not null auto_increment,
    codCli int not null,
    nomeConj varchar(50) not null,
    rendaConj decimal(9,2) not null default 0 check(rendaConj >= 0),
    sexoConj char(1) not null default 'F' check(sexoConj in ('F','M')),
    primary key(codConj),
    foreign key(codCli) references tbClientes(codCli)
);
create table tbDependentes(
    codDep int not null auto_increment,
    codFunc int not null,
    nomeDep varchar(100) not null,
    sexoDep char(1) not null default 'F' check(sexoDep in('F','M')),
    primary key (codDep),
    foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
    codTit int not null auto_increment,
    codCat int not null,
    codGrav int not null,
    nomeCd varchar(50) not null unique,
    valCd decimal(9,2) not null default 0 check(valCd > 0),
    qtdEstq int not null default 0 check(qtdEstq >= 0),
    primary key(codTit),
    foreign key(codCat) references tbCategorias(codCat),
    foreign key(codGrav) references tbGravadoras(codGrav)
);

create table tbPedidos(
    numPed int not null auto_increment,
    codCli int not null,
    codFunc int not null,
    dataPed datetime not null,
    valPed decimal(9,2) not null default 0 check(valPed >= 0),
    primary key(numPed),
    foreign key(codCli) references tbClientes(codCLi),
    foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosPedido(
    numPed int not null,
    codTit int not null,
    qtdCd int not null check(qtdCd >= 1),
    valCd decimal(9,2) not null check(valCd >= 0),
    foreign key(numPed) references tbPedidos(numPed),
    foreign key(codTit) references tbTitulos(codTit)
);

create table tbTitulosArtistas(
    codTit int not null auto_increment,
    codArt int not null,    
    foreign key(codTit) references tbTitulos(codTit),
    foreign key(codArt) references tbArtistas(codArt)
);

--INSERT 
insert into tbArtistas(nomeArt) values('Marisa Monte');
insert into tbArtistas(nomeArt) values('Gilberto Gil');
insert into tbArtistas(nomeArt) values('Caertano Veloso');
insert into tbArtistas(nomeArt) values('Milton Nascimento');
insert into tbArtistas(nomeArt) values('Legião Urbana');
insert into tbArtistas(nomeArt) values('The Beatles');
insert into tbArtistas(nomeArt) values('Rita Lee');

insert into tbGravadoras(nomeGrav) values('PolyGram');
insert into tbGravadoras(nomeGrav) values('Emi');
insert into tbGravadoras(nomeGrav) values('Som Livre');
insert into tbGravadoras(nomeGrav) values('Som Music');

insert into tbCategorias(nomeCat) values('MPB');
insert into tbCategorias(nomeCat) values('Trilho Sonoro');
insert into tbCategorias(nomeCat) values('Rock Internacional');
insert into tbCategorias(nomeCat) values('Rock Nacional');

insert into tbEstados(siglaEst, nomeEst) values('SP', 'São Paulo');
insert into tbEstados(siglaEst, nomeEst) values('MG', 'Minas Gerais');
insert into tbEstados(siglaEst, nomeEst) values('RJ', 'Rio de Janeiro');
insert into tbEstados(siglaEst, nomeEst) values('ES', 'Vitória');

insert into tbCidades(siglaEst, nomeCid) values('SP', 'São Paulo');
insert into tbCidades(siglaEst, nomeCid) values('SP', 'Sorocaba');
insert into tbCidades(siglaEst, nomeCid) values('SP', 'Jundiaí');
insert into tbCidades(siglaEst, nomeCid) values('SP', 'Americana');
insert into tbCidades(siglaEst, nomeCid) values('SP', 'Araraquara');
insert into tbCidades(siglaEst, nomeCid) values('MG', 'Ouro Preto');
insert into tbCidades(siglaEst, nomeCid) values('ES', 'Cachoeira do Itapemirim');

insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'José Nougeira', 'Rua A', 1500.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'Ângelo Perreira', 'Rua B', 2000.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'Além Mar Paranhos', 'Rua C', 1500.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'Catarina Souza', 'Rua D', 892.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'Vagner Costa', 'Rua E', 950.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(2, 'Antenor da Costa', 'Rua F', 1582.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(2, 'Mari Amélia de Souza', 'Rua G', 1152.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(2, 'Paulo Roberto Silva', 'Rua H', 3250.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(3, 'Fátima Souza', 'Rua I', 1632.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(3, 'Joel da Rocha', 'Rua J', 2000.00, 'M');

insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj) values(1, 'Carla Nogueira', 2500.00, 'F');
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj) values(2, 'Emilia Pereira', 5500.00, 'F');
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj) values(6, 'Altiva da Costa', 3000.00, 'F');
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj) values(7, 'Carlos de Souza', 3250.00, 'M');

insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Vânia Gabriel Pereira', 'Rua A', 2500.00, 'F');
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Norberto Pereira da Silva', 'Rua B', 300.00, 'M');
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Olavo Linhares', 'Rua C', 580.00, 'M');
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Paula da Silva', 'Rua D', 3000.00, 'F');
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Rolando Rocha', 'Rua R', 2000.00, 'M');

insert into tbDependentes(codFunc, nomeDep, sexoDep) values(1, 'Ana Pereira', 'F');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(1, 'Roberto Pereira', 'M');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(1, 'Celso Pereira', 'M');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(3, 'Brisa Linhares', 'F');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(3, 'Mari Sol Linhares', 'F');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(4, 'Sonia da Silva', 'F');

INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (1, 1, 'Tribalistas', 30.00, 1500);
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (1, 2, 'Tropicália', 50.00, 500);
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (1, 1, 'Aquele Abraço', 50.00, 600); 
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (1, 2, 'Refazenda', 60.00, 1000);
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (1, 3, 'Totalmente Demais', 50.00, 2000);
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (1, 3, 'Travessia', 55.00, 500);
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (1, 2, 'Courage', 30.00, 200);
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (4, 3, 'Legião Urbana', 20.00, 300);
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (3, 2, 'The Beatles', 30.00, 300);
INSERT INTO tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) VALUES (4, 1, 'Rita Lee', 30.00, 500);

insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(1, 2, '2002-05-02', 1500.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(3, 4, '2002-05-02', 50.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(4, 5, '2002-06-02', 100.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(1, 4, '2002-02-03', 200.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(7, 5, '2002-03-03', 300.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(4, 4, '2002-03-03', 100.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(5, 5, '2002-03-03', 50.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(8, 2, '2002-03-03', 50.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(2, 2, '2002-03-03', 2000.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed) values(7, 1, '2002-03-03', 3000.00);

insert into tbTitulosArtistas(codArt) values(1);
insert into tbTitulosArtistas(codArt) values(2);
insert into tbTitulosArtistas(codArt) values(2);
insert into tbTitulosArtistas(codArt) values(2);
insert into tbTitulosArtistas(codArt) values(3);
insert into tbTitulosArtistas(codArt) values(4);
insert into tbTitulosArtistas(codArt) values(4);
insert into tbTitulosArtistas(codArt) values(5);
insert into tbTitulosArtistas(codArt) values(6);
insert into tbTitulosArtistas(codArt) values(7);

insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(1, 1, 2, 30.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(1, 2, 3, 20.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(2, 1, 1, 50.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(2, 2, 3, 30.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(3, 1, 2, 40.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(4, 2, 3, 20.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(5, 1, 2, 25.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(6, 2, 3, 30.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(6, 3, 1, 35.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(7, 4, 2, 55.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(8, 1, 4, 60.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(9, 2, 3, 15.00);
insert into tbTitulosPedido(numPed, codTit, qtdCd, valCd) values(10, 7, 2, 15.00);
 
select * from tbArtistas;
select * from tbGravadoras;
select * from tbCategorias;
select * from tbEstados;
select * from tbCidades;
select * from tbClientes;
select * from tbConjuge;
select * from tbFuncionarios;
select * from tbDependentes;
select * from tbTitulos;
select * from tbPedidos;
select * from tbTitulosPedido;
select * from tbTitulosArtistas;

--DESAFIO PAG 88 à 89

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD. 
-- Resposta:
select tbTitulos.nomeCd, tbGravadoras.nomeGrav from tbTitulos join tbGravadoras on tbTitulos.codGrav = tbGravadoras.codGrav;

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD. 
-- Resposta: 
select tbTitulos.nomeCd, tbCategorias.nomeCat from tbTitulos join tbCategorias on tbTitulos.codCat = tbCategorias.codCat;


-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de  cada CD. 
-- Resposta:
SELECT t.nomeCd AS Nome_CD, g.nomeGrav AS Gravadora, c.nomeCat AS Categoria
FROM tbTitulos t JOIN tbGravadoras g ON t.codGrav = g.codGrav JOIN tbCategorias c ON t.codCat = c.codCat;


-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez. 
-- Resposta: 
SELECT 
c.nomeCli AS NomeCliente, t.nomeCd AS TituloCd 
FROM tbClientes c JOIN tbPedidos p ON c.codCli = p.codCli 
JOIN tbTitulosPedido tp ON p.numPed = tp.numPed JOIN tbTitulos t ON tp.codTit = t.codTit;
 
select cli.nome as 'Nome do Cliente',
tit.nome as 'Titulo do CD' from tbTitulosPedidos as titped 
inner join tbTitulos as tit on titped.codTit = tit.codTit
inner join tbPedidos as ped on titped.numPed = ped.numPed 
inner join tbClientes as cli on ped.codCli = cli.codCli;

-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este funcionário registrou, além do nome do cliente que está fazendo o pedido. 
select 
    tbFuncionarios.nomeFunc, tbPedidos.numPed, tbPedidos.dataPed, tbPedidos.valPed, tbClientes.nomeCli 
from tbPedidos 
join tbFuncionarios on tbPedidos.codFun = tbFuncionarios.codFunc 
join tbClientes on tbPedidos = tbClientes.codCli;

-- 6. Selecione o nome dos funcionários e o nome de todos os dependentes de cada funcionário. 
-- Resposta: 
select 
    tbFuncionarios.nomeFunc, tbDependentes.nomeDep 
from tbFuncionarios
join tbDependentes on tbFuncionarios.codFunc =tbDependentes.codFunc


-- 7. Selecione o nome dos clientes e o nome dos cônjuges de cada cliente. Resposta: 
select
    c.nomeCli AS NomeCliente,
    j.nomeConj AS NomeConjuge
from tbClientes c
join mtbConjuge j ON c.codCli = j.codCli;


-- 8. Selecione o nome de todos os clientes. Se estes possuem cônjuges, mostrar os nomes  de seus cônjuges também. 
-- Resposta:
select 
    c.nomeCli,
    j.nomeConj
from
    tbClientes c
left join
    tbConjuge j on c.codCli = j.codCli;


-- 9. Selecione nome do cliente, nome do cônjuge, número do pedido que cada cliente fez, valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cada pedido. 
-- Resposta:
select
    c.nomeCli,
    j.nomeConj,
    p.numPed,
    p.valPed,
    p.codFunc
from
    tbClientes c
left join 
    tbConjuge j on c.codCli = j.codCli
join
    tbPedidos p on c.codCli = p.codCli;


-- 1. Exiba quantos pedidos cada cliente fez.
select 
    c.nomeCli as 'Nome do cliente', 
    sum(p.numPed) as 'Numero de pedidos' 
from 
    tbClientes c 
join 
    tbPedidos p on c.codCli = p.codCli 
group by 
    c.codCli;

-- 2. Exiba quantos CDs possui cada categoria.
select 
    cat.nomeCat as 'Categorias', 
    count(Tit.codTit) as 'Nome dos cds' 
from 
    tbCategorias cat 
join 
    tbTitulos Tit on cat.codCat = Tit.codTit 
group by 
    cat.codCat;

-- 3. Exiba quantos CDs possui cada gravadora.
select 
    grav.nomeGrav as 'Gravadora',
    count(Tit.codTit) as 'Quantidade de CDs'
from
    tbGravadoras grav
join
    tbTitulos Tit on grav.codGrav = Tit.codTit
group by
    grav.codGrav;


-- 4. Exiba quantos pedidos cada funcionário atendeu.
select 
    func.nomeFunc as 'Funcionarios',
    count(ped.numPed) as 'Numero de pedidos'
from 
    tbFuncionarios func
join 
    tbPedidos ped on func.codFunc = ped.codFunc
group by 
    func.codFunc;

-- 5. Exiba quantos dependentes tem cada funcionário.
select 
    func.nomeFunc as 'Funcionários',
    count(dep.codDep) as 'Dependentes dos Funcionários'
from 
    tbFuncionarios func
left join 
    tbDependentes dep on func.codFunc = dep.codFunc
group by 
    func.codFunc;

-- 6. Exiba quantos pedidos cada cliente fez, mostrando o nome dos clientes.
select 
    c.nomeCli as 'Nome do cliente', 
    count(p.numPed) as 'Numero de pedidos' 
from 
    tbClientes c 
join 
    tbPedidos p on c.codCli = p.codCli 
group by 
    c.nomeCli;    


-- 7. Exiba quantos CDs possui cada categoria, mostrando o nome das mesmas.
select 
    cat.nomeCat as 'Categorias', 
    count(Tit.codTit) as 'Nome dos cds' 
from 
    tbCategorias cat 
join 
    tbTitulos Tit on cat.codCat = Tit.codTit 
group by 
    cat.nomeCat;


-- 8. Exiba quantos CDs possui cada gravadora, mostrando o nome das mesmas.
select 
    grav.nomeGrav as 'Gravadora',
    count(Tit.codTit) as 'Quantidade de CDs'
from
    tbGravadoras grav
join
    tbTitulos Tit on grav.codGrav = Tit.codTit
group by
    grav.nomeGrav;


-- 9. Exiba quantos pedidos cada funcionário atendeu, mostrando o nome dos funcionários.
select 
    func.nomeFunc as 'Funcionarios',
    count(ped.numPed) as 'Numero de pedidos'
from 
    tbFuncionarios func
join 
    tbPedidos ped on func.codFunc = ped.codFunc
group by 
    func.nomeFunc;

-- 10. Exiba quantos dependentes cada funcionário possui, mostrando seus nomes.
select 
    func.nomeFunc as 'Funcionários',
    count(dep.codDep) as 'Dependentes dos Funcionários'
from 
    tbFuncionarios func
left join 
    tbDependentes dep on func.codFunc = dep.codFunc
group by 
    func.nomeFunc;