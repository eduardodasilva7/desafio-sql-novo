drop database dbdesafio;

create database dbdesafio;

use dbdesafio;

create table tbGeneros(
    idGenero int not null auto_increment,
    descricao varchar(100),
    primary key(idGenero)
);

create table tbAutor(
    idAutor int not null auto_increment,
    nome varchar(100),
    email varchar(100),
    primary key(idAutor) 
);

create table tbCliente(
    idCliente int not null auto_increment,
    nome varchar(100),
    telefone varchar(45),
    primary key(idCliente)
);


create table tbLivros(
    idLivro int not null auto_increment,
    titulo varchar(100),
    preco decimal(9,2), 
    estoque int,
    idGenero int not null,
    primary key(idLivro),
    foreign key(idGenero) references tbGeneros(idGenero)
);



create table tbEscreve(
    idLivro int,
    idAutor int,
    foreign key(idLivro) references tbLivros(idLivro),
    foreign key(idAutor) references tbAutor(idAutor)
);

create table tbVenda(
    idVenda int not null auto_increment,
    data date,
    total float,
    idCliente int,
    primary key(idVenda),
    foreign key(idCliente) references tbCliente(idCliente)
);

create table tbItens_da_venda(
    idVenda int,
    idLivro int,
    qtd int, 
    subtotal varchar(45),
    foreign key(idVenda) references tbVenda(idVenda),
    foreign key(idLivro) references tbLivros(idLivro)
);

desc tbGeneros;
desc tbLivros;
desc tbEscreve;
desc tbAutor;
desc tbItens_da_venda;
desc tbVenda;
desc tbCliente;

-- cadastrando os registros nas tabelas
insert into tbGeneros(descricao)values('Acao');
insert into tbGeneros(descricao)values('Ficcao');
insert into tbGeneros(descricao)values('Aventura');
insert into tbGeneros(descricao)values('Terror');
insert into tbGeneros(descricao)values('Comedia');
insert into tbGeneros(descricao)values('Romance');
insert into tbGeneros(descricao)values('Documentario');

insert into tbAutor(nome,email)values('Sun Tzu','suntzu@gmail.com');
insert into tbAutor(nome,email)values('Melissa Tobias','melitobias@gmail.com');
insert into tbAutor(nome,email)values('J.R.R. Tolkien','tolkien@gmail.com');
insert into tbAutor(nome,email)values('C S. Lewis','lewis@gmail.com');
insert into tbAutor(nome,email)values('J.K. Rowling','jkrowling@gmail.com');
insert into tbAutor(nome,email)values('Brandon Sanderson','brandonsanderson@gmail.com');
insert into tbAutor(nome,email)values('John Scalzi','johnscal@gmail.com');

insert into tbCliente(nome,telefone)values('Pedro','96852-8629');
insert into tbCliente(nome,telefone)values('Maria','95684-1234');
insert into tbCliente(nome,telefone)values('Marcos','9656-3271');

insert into tbLivros(titulo,preco,estoque,idGenero)values('A arte da Guerra',10.59,5,3);
insert into tbLivros(titulo,preco,estoque,idGenero)values('A Realidade de Madhu',32.32,2,2);
insert into tbLivros(titulo,preco,estoque,idGenero)values('Hobbit',52.42,7,1);
insert into tbLivros(titulo,preco,estoque,idGenero)values('As Cronicas de Narnia',34.10,5,2);

insert into tbEscreve(idLivro, idAutor)values(4,7);
insert into tbEscreve(idLivro, idAutor)values(3,2);
insert into tbEscreve(idLivro, idAutor)values(1,6);

insert into tbVenda(data,total,idCliente)values('2024-05-16',150.00,2);
insert into tbVenda(data,total,idCliente)values('2022-07-22',800.00,1);
insert into tbVenda(data,total,idCliente)values('2023-10-7',85.30,3);

insert into tbItens_da_venda values(1,4,5,150.00);
insert into tbItens_da_venda(idVenda,idLivro,qtd,subtotal)values(2,3,6,800.00);
insert into tbItens_da_venda(idVenda,idLivro,qtd,subtotal)values(3,2,2,85.30);

-- Pesquisar os campos das tabelas
-- select * from tbGeneros;
-- select * from tbAutor;
-- select * from tbCliente;
-- select * from tbLivros;
-- select * from tbVenda;
-- select * from tbItens_da_venda;
-- select * from tbEscreve;

-- ALerando registros das tabelas
update tbCliente set nome = 'Alexandre De Figueira' where idCliente=2;
update tbCliente set nome = 'Patricia Nunes', telefone = '98524-7458' where idCliente = 1;

select * from tbCliente;

update tbLivros set titulo = 'percey Jackson', preco = 60, estoque= 2, idGenero= 6 where idLivro = 2;
update tbLivros set titulo = 'Eu, roubô', preco = 45, estoque = 6, idGenero= 2 where idLivro = 1;
update tbLivros set titulo = 'Maria e as aventuras', preco = 90, estoque = 1, idGenero = 6 where idLivro = 3;

select * from tbLivros;

-- Apagando o registro da tabela 
-- delete from tbItens_da_venda where idVenda = 1;
-- delete from tbVenda where idVenda = 1;
-- delete from tbCliente where idCliente = 2;
select * from tbCliente;

