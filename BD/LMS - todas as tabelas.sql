--Pessoa--
CREATE TABLE Pessoa 
(
login int Identity(1,1)NOT NULL,
Nome varchar(20)NOT NULL,
Email varchar(30)NOT NULL,
Celular int NOT NULL,
Senha int NOT NULL,
DtExpiração datetime NOT NULL,
Constraint pkPessoa PRIMARY KEY(login)
)

--Aluno--
CREATE TABLE Aluno 
(
 IdAluno INT not null IDENTITY(1,1)
,Login INT not null 
,Senha VARCHAR(10) not null
,Nome VARCHAR(50) not null
,Email VARCHAR(50) not null 
,Celular VARCHAR(15) 
,DtExpiracao DATE not null CONSTRAINT dfAlunoDtExpiracao DEFAULT ('1900-01-01')
,RA VARCHAR(10) not null
,Foto VARCHAR(1000) null
,CONSTRAINT pkAluno PRIMARY KEY (IdAluno)
,CONSTRAINT uqAlunoLogin UNIQUE (Login)
,CONSTRAINT uqAlunoEmail UNIQUE (Email)
,CONSTRAINT uqAlunoCelular UNIQUE (Celular)
)

--Professor--
CREATE TABLE Professor 
(
 IdProfessor INT not null IDENTITY(1,1)
,Login INT not null 
,Senha VARCHAR(10) not null
,Nome VARCHAR(50) not null
,Email VARCHAR(50) not null
,Celular VARCHAR(15)
,DtExpiracao DATE not null CONSTRAINT dfProfessorDtExpiracao DEFAULT ('1900-01-01')
,Apelido VARCHAR(20)
,CONSTRAINT pkProfessor PRIMARY KEY (IdProfessor) 
,CONSTRAINT uqProfessorLogin UNIQUE (Login)
,CONSTRAINT uqProfessorEmail UNIQUE (Email)
,CONSTRAINT uqProfessorCelular UNIQUE (Celular)
)

--Coordenador--
CREATE TABLE Coordenador 
(
 IdCoordenador INT not null IDENTITY(1,1)
,Login INT not null 
,Senha VARCHAR(10) not null
,Nome VARCHAR(50) not null
,Email VARCHAR(50) not null 
,Celular VARCHAR(15)
,DtExpiracao DATE not null CONSTRAINT dfCoordenadorDtExpiracao DEFAULT ('1900-01-01')
,CONSTRAINT pkCoordenador PRIMARY KEY (IdCoordenador)
,CONSTRAINT uqCoordenadorLogin UNIQUE (Login)
,CONSTRAINT uqCoordenadorEmail UNIQUE (Email)
,CONSTRAINT uqCoordenadorCelular UNIQUE (Celular)
)

--Atividade--
create table Atividade 
(
idatividade int not null,
titulo int not null,
descricao varchar(max) null,
conteudo varchar(max) null,
tipo varchar(50) not null,
idprofessor int,

constraint uqtitulo unique (titulo),
constraint cktipo check (tipo in ('reposta_aberta','teste')),
constraint pkidatividade primary key(idatividade),
constraint fkidprofessor foreign key(idprofessor)
references Professor (idprofessor)
)


--Curso--
CREATE TABLE Curso 
(
 IdCurso INT not null IDENTITY (1,1)
,Nome VARCHAR (100)
,CONSTRAINT pkCursoId PRIMARY KEY (IdCurso)
,CONSTRAINT uqCursoNome UNIQUE (Nome)
)


--Disciplina--
CREATE TABLE Disciplina 
(
IdCoordenador INT not null 
,IdDisciplina INT not null IDENTITY(1,1)
,Nome VARCHAR(60) not null
,Data DATE not null CONSTRAINT dfData  DEFAULT(GETDATE())
,Status VARCHAR(10) not null CONSTRAINT dfStatus  DEFAULT 'Aberta' 
,PlanoDeEnsino VARCHAR (MAX) not null
,CargaHoraria INT not null
,Competencia VARCHAR (MAX) not null
,Habilidades VARCHAR (MAX) not null
,Ementa VARCHAR (MAX) not null
,ConteudoProgramatico VARCHAR (MAX) not null
,BibliografiaBasica VARCHAR (MAX) not null
,BibliografiaComplementar VARCHAR (MAX) not null
,PercentualPratico int not null
,PercentualTeorico int not null
,CONSTRAINT fkCoordenador FOREIGN KEY (IdCoordenador) REFERENCES Coordenador(IdCoordenador)
,CONSTRAINT pkIdDisciplina PRIMARY KEY (IdDisciplina)
,CONSTRAINT uqNome UNIQUE (Nome)
,CONSTRAINT uqStatus UNIQUE (Status)  
,CONSTRAINT ckCargaHoraria CHECK (CargaHoraria IN (40,80))  
,CONSTRAINT ckPercentualPratico CHECK (PercentualPratico between 00 and 100)  
,CONSTRAINT ckPercentualTeorico CHECK (PercentualTeorico between 00 and 100)  
)

--Disciplina Ofertada--
CREATE TABLE DisciplinaOfertada 
(
idDiscOfertada INT NOT NULL,
IdCoordenador INT NOT NULL,
DtInicioMatricula DATE NULL,
DtFimMatricula DATE NULL,
IdDisciplina INT NOT NULL,
IdCurso INT  NOT NULL,
Ano INT  NOT NULL,
Semestre INT  NOT NULL,
Turma varchar(2)  NOT NULL,
IdProfessor INT NULL,
Metodologia TEXT NULL,
Recursos TEXT NULL,
CriterioAvaliacao TEXT NULL,
PlanoDeAulas TEXT NULL,
CONSTRAINT pkidDiscOfertada PRIMARY KEY (idDiscOfertada),
CONSTRAINT fkDisciplina FOREIGN KEY (idDisciplina) REFERENCES Disciplina (IdDisciplina),
CONSTRAINT fkCurso FOREIGN KEY (IdCurso) REFERENCES Curso (IdCurso),
CONSTRAINT ckAno CHECK (Ano >= 1900 and Ano <= 2100),
CONSTRAINT ckSemestre CHECK (Semestre >= 1 and Semestre <= 2),
CONSTRAINT ckTurma CHECK (Turma LIKE '[A-Z]'),
constraint uqdiscOfertada unique (iddisciplina,idcurso, ano, semestre, turma)
)

--Atividade Vinculada--
Create Table AtividadeVinculada
(
IDAtividadeVinculada int NOT NULL,
IdAtividade int NOT NULL,
IdProfessor int NOT NULL,
idDiscOfertada int NOT NULL,
Rotulo varchar(3) NOT NULL,
av_Status varchar(15) NOT NULL,
DtInicioRespostas date NOT NULL,
DtFimRespostas date NOT NULL,
CONSTRAINT pkAtividadeVinculada PRIMARY KEY(IDAtividadeVinculada),
CONSTRAINT fkAtividade FOREIGN KEY(IdAtividade) REFERENCES atividade (IdAtividade),
CONSTRAINT fkProfessor FOREIGN KEY(IdProfessor) REFERENCES professor (IdProfessor),
CONSTRAINT fkDisciplinaOfertada FOREIGN KEY(idDiscOfertada) REFERENCES DisciplinaOfertada (idDiscOfertada),
constraint uqatividadevinculada unique (idatividade, idDiscOfertada, rotulo)

)

--Entrega--
CREATE TABLE Entrega 
(
IdEntrega INT NOT NULL,
IdAluno INT NOT NULL,
IdAtividadeVinculada INT NOT NULL,
Titulo VARCHAR (20) NOT NULL,
Resposta VARCHAR (MAX) NOT NULL,
DtEntrega DATE NOT NULL,
Status_E VARCHAR (40),
IdProfessor INT NOT NULL,
Nota INT NOT NULL,
DtAvaliacao DATE NOT NULL DEFAULT (getdate()),
Obs VARCHAR (MAX) NOT NULL,
CONSTRAINT pkIdEntrega PRIMARY KEY (IdEntrega),
CONSTRAINT fkAluno FOREIGN KEY (IdAluno) REFERENCES Aluno (IdAluno),
CONSTRAINT fkAtividadeVinculada FOREIGN KEY (IdAtividadeVinculada) REFERENCES AtividadeVinculada (IdAtividadeVinculada),
CONSTRAINT ckStatus_E CHECK (Status_E in ('Entregue','Corrigido')),
CONSTRAINT fkEntregaProfessor FOREIGN KEY (IdProfessor) REFERENCES Professor(IdProfessor),
CONSTRAINT ckNota CHECK (Nota >= 0.00 and Nota <= 10.00)
)

--Solicitação de Matrícula--
CREATE TABLE SolicitacaoMatricula 
(
IDSolicitacaoMatricula INT NOT NULL,
IdAluno INT NOT NULL,
IdDiscOfertada INT NULL,
DtSolicitacao DATE NOT NULL DEFAULT (getdate()),
IdCoordenador INT NULL,
Status_SM int NOT NULL,
CONSTRAINT IDSolicitacaoMatricula PRIMARY KEY (IDSolicitacaoMatricula),
CONSTRAINT CK_Status CHECK (Status_SM in ('Solicitada' , 'Aprovada' , 'Rejeitada' , 'Cancelada'))
)
