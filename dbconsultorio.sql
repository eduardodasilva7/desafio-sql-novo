drop database dbConsultorio;

create database dbConsultorio;

use dbConsultorio;

create table tbMedico(
    idMedico int not null auto_increment,
    nome varchar(100), 
    telefone char(9) unique,
    primary key(idMedico)
);

create table tbPaciente(
    idPaciente int not null auto_increment,
    nome varchar(100),
    telefone char(9) unique,
    convenio varchar(100),
    primary key(idPaciente)    
);

create table tbReceitaMedica(
    idReceitaMedica int not null auto_increment,
    descricao varchar(100), /* Corrected "barchar" to "varchar" */
    primary key(idReceitaMedica)
);

create table tbConsulta(
    idConsulta int not null auto_increment,
    data datetime,
    idMedico int not null,
    idPaciente int not null,
    idReceitaMedica int not null,
    primary key(idConsulta),
    foreign key(idMedico) references tbMedico(idMedico),
    foreign key(idPaciente) references tbPaciente(idPaciente),
    foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedico;
desc tbPaciente;
desc tbReceitaMedica;
desc tbConsulta;
