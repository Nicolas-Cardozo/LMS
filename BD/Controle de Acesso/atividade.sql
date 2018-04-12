create table atividade (

id_atividade int not null,
titulo int not null,
descricao varchar(max) null,
conteudo varchar(max) null,
tipo varchar(50) not null,
idprofessor int,

constraint uqtitulo unique (titulo),
constraint cktipo check (tipo in ('reposta_aberta','teste')),
constraint pk_idatividade primary key(id_atividade),
constraint fkidprofessor foreign key(idprofessor)
references atividade_vinculada (idprofessor),
)