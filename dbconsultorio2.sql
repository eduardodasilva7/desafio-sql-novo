drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbGeneros(
    idGenero int not null auto_increment,
    descricao varchar(100),
    primary key(idGenero)
);

create table tbAutores(
    idAutor int not null auto_increment,
    nome varchar(100),
    email varchar(100),
    primary key(idAutor) 
);

create table tbClientes(
    idCliente int not null auto_increment,
    nome varchar(100),
    telefone varchar(9),
    primary key(idCliente)
);

create table tbLivros(
    idLivro int not null auto_increment,
    titulo varchar(100),
    preco decimal(9,2), /*float*/
    estoque int,
    idGenero int not null,
    primary key(idLivro),
    foreign key(idGenero) references tbGeneros(idGenero)
);

create table tbVendas(
    idVenda int not null auto_increment,
    data date,
    total decimal(9,2),
    idCliente int not null,
    primary key(idVenda),
    foreign key(idCliente) references tbClientes(idCliente)
);

create table itens_da_vendas(
    idVenda int not null,
    idLivro int not null,
    quantidade int,
    subtotal varchar(45),
    foreign key(idVenda) references tbVendas(idVenda)
    foreign key(idLivro) references tbLivros(idLivro)
);

create table tbEscreve(
    idLivro int not null,
    idAutor int not null,
    foreign key(idLivro) references tbLivros(idLivro),
    foreign key(idAutor) references tbAutores(idAutor)
);

desc tbGeneros;
desc tbLivros;
desc tbEscreve;
desc tbAutores;
desc itens_da_vendas;
desc tbVendas;
desc tbClientes;
