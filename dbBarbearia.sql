drop database dbBarbearia;

create database dbBarbearia;

use dbBarbearia;

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
marca varchar(50),
preco decimal(9,2),
primary key(codProd)
);

insert into tbProdutos(descricao,marca,preco)values('Shampoo','Nivea', 30.0);
insert into tbProdutos(descricao,marca,preco)values('Sabonete','Phebo', 50.0);
insert into tbProdutos(descricao,marca, preco)values('Creme de barbear','Barbers', 70.0);
insert into tbProdutos(descricao,marca,preco)values('Gel para cabelos','Salome', 25.0);

--delete from tbProdutos where codProd = 2;

select * from tbProdutos;

-- Alian => as
--select codProd as 'Código',descricao as 'Descrição',marca as 'Marca',preco as 'Preço' from tbprodutos;

-- colunar virtuais 
--select codProd,descricao,'Promoção' as 'promo',marca,preco from tbprodutos;

-- select codProd as 'Código',descricao as 'Descrição',marca as 'Marca','Sim' as 'Vendido',preco as 'Preço' from tbprodutos;

-- update tbProdutos set preco = preco * 1.10;
-- update tbProdutos set preco = preco * 1.10 where codProd = 3;
-- select * from tbProdutos;
-- select codProd * 3.141692 as 'Calculando o PI' from tbprodutos;
-- select codProd * 3.141692 as 'Calculando o PI', preco * 0.9 as 'Desconto' from tbprodutos;
-- select preco * 0.9 as 'Desconto' from tbProdutos;
update tbProdutos set preco = preco * 0.20 where codProd = 1;
select * from tbProdutos;
