create table tbMedico(
    idMedico int,
    nmMedico varchar(45),
    telefoneMedico varchar(9),
    primary key(idMedico)
);

create table tbPaciente(
    idPaciente int,
    nmPaciente varchar(45),
    telefonePaciente varchar(9),
    convenio varchar(45),
    primary key(idPaciente),
);

create table tbReceitaMedica(
    idReceitaMedica int,
    descricao varchar(500),
    primary key(idReceitaMedica),
);

create table tbConsulta(
    idConsulta int,
    dt_consulta datetime,
    idMedico int,
    idPaciente int,
    idReceitaMedica int,
    primary key(idConsulta),
    foreign key(idMedico) references tbConsulta(idMedico),
    foreign key(idPaciente) references tbConsulta(idPaciente),
    foreign key(idReceitaMedica) references tbConsulta(idReceitaMedica)
);

show tables;

desc tbConsulta;
desc tbMedico;
desc tbPaciente;
desc tbReceitaMedica;