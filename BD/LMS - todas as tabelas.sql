create database LMS
go
 
use LMS
go
 
-- Pessoa -- 
CREATE TABLE Pessoa(
login int Identity(1,1)NOT NULL
,Nome varchar(20)NOT NULL
,Email varchar(30)NOT NULL
,Celular int NOT NULL
,Senha int NOT NULL
,DtExpiração datetime NOT NULL
,Constraint pkPessoa PRIMARY KEY(login)
)
 
----Aluno----
CREATE TABLE Aluno (
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
 
--COORDENADOR--
CREATE TABLE Coordenador (
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
 
--Professor--
CREATE TABLE Professor (
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
 
 
--Atividade--
create table Atividade (
 
IdAtividade int not null identity(1,1)
,titulo int not null
,descricao varchar(max) null
,conteudo varchar(max) null
,tipo varchar(50) not null
,IdProfessor int
,constraint uqtitulo unique (titulo)
,constraint cktipo check (tipo like 'reposta_aberta' or tipo like 'teste')
,constraint pkIdAtividade primary key(IdAtividade)
,constraint fkIdProfessor foreign key (idprofessor) references Professor(idprofessor)
)
 
--Curso--
CREATE TABLE Curso (
IdCurso INT not null IDENTITY (1,1)
,Nome VARCHAR (100)
,CONSTRAINT pkCursoId PRIMARY KEY (IdCurso)
,CONSTRAINT uqCursoNome UNIQUE (Nome)
)

--Disciplina--
CREATE TABLE Disciplina (
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
,CONSTRAINT fkCoordenadorId FOREIGN KEY (IdCoordenador) REFERENCES Coordenador(IdCoordenador)
,CONSTRAINT pkDisciplinaIdDisciplina PRIMARY KEY (IdDisciplina)
,CONSTRAINT uqDisciplinaNome UNIQUE (Nome)
,CONSTRAINT ckDisciplinaStatus CHECK (Status LIKE 'Aberta' or Status like 'Fechada')  
,CONSTRAINT ckDisciplinaCargaHoraria CHECK (CargaHoraria IN (40,80))  
,CONSTRAINT ckDisciplinaPercentualPratico CHECK (PercentualPratico between 00 and 100)  
,CONSTRAINT ckDisciplinaPercentualTeorico CHECK (PercentualTeorico between 00 and 100)  
)
 
--Disciplina Ofertada--
CREATE TABLE DisciplinaOfertada(
idDiscOfertada INT NOT NULL identity(1,1)
,IdCoordenador INT NOT NULL
,DtInicioMatricula DATE NULL
,DtFimMatricula DATE NULL
,IdDisciplina INT NOT NULL
,IdCurso INT NOT NULL
,Ano INT NOT NULL
,Semestre INT NOT NULL
,Turma INT NOT NULL
,IdProfessor INT NULL
,Metodologia TEXT NULL
,Recursos TEXT NULL
,CriterioAvaliacao TEXT NULL
,PlanoDeAulas TEXT NULL
,CONSTRAINT pkidDiscOfertada PRIMARY KEY (idDiscOfertada)
,CONSTRAINT fkCoordenador FOREIGN KEY (IdCoordenador) REFERENCES Coordenador (IdCoordenador)
,CONSTRAINT fkDisciplina FOREIGN KEY (idDisciplina) REFERENCES Disciplina (IdDisciplina)
,CONSTRAINT uqIdDisciplina UNIQUE (IdDisciplina)
,CONSTRAINT fkCurso FOREIGN KEY (IdCurso) REFERENCES Curso (IdCurso)
,CONSTRAINT uqIdCurso UNIQUE (IdCurso)
,CONSTRAINT ckAno CHECK (Ano between 1900 and 2100)
,CONSTRAINT ckSemestre CHECK (Semestre between 1 and 2)
,CONSTRAINT ckTurma CHECK (Turma LIKE '[A-Z]')
)
 
 
--Atividade Vinculada--
Create Table AtividadeVinculada
(
IDAtividadeVinculada int NOT NULL identity (1,1)
,IdAtividade int NOT NULL
,IdProfessor int NOT NULL
,idDiscOfertada int NOT NULL
,Rotulo varchar(3) NOT NULL
,av_Status varchar(15) NOT NULL
,DtInicioRespostas date NOT NULL
,DtFimRespostas date NOT NULL
,CONSTRAINT pkAtividadeVinculada PRIMARY KEY(IDAtividadeVinculada)
,CONSTRAINT fkAtividade FOREIGN KEY(IdAtividade) REFERENCES atividade (IdAtividade)
,CONSTRAINT fkProfessor FOREIGN KEY(IdProfessor) REFERENCES professor (IdProfessor)
,CONSTRAINT fkDisciplinaOfertada FOREIGN KEY(idDiscOfertada) REFERENCES DisciplinaOfertada (idDiscOfertada)
,constraint uqatividadevinculada unique (idatividade, idDiscOfertada, rotulo)
)
  

-- Solicitação Matrícula--
CREATE TABLE SolicitacaoMatricula(
IDSolicitacao INT NOT NULL identity(1,1)
,IdAluno INT NOT NULL
,IdDiscOfertada INT NULL
,DtSolicitacao DATE NOT NULL CONSTRAINT dfDtSolicitacao DEFAULT (getdate())
,IdCoordenador INT NULL
,Status varchar (20) NOT NULL CONSTRAINT dfStatusMat DEFAULT 'Solicitada'
,CONSTRAINT pkIDSolicitacao PRIMARY KEY (IDSolicitacao)
,CONSTRAINT  fkIdAluno FOREIGN KEY  (IdAluno) REFERENCES Aluno(IdAluno)
,CONSTRAINT  fkIdDiscOfertada FOREIGN KEY  (IdDiscOfertada) REFERENCES DisciplinaOfertada(IdDiscOfertada)
,CONSTRAINT  fkIdCoordenador FOREIGN KEY  (IdCoordenador) REFERENCES Coordenador (IdCoordenador)
,CONSTRAINT  ckStatus CHECK (Status LIKE 'Solicitada' or Status like 'Aprovada' or Status like 'Rejeitada' or Status like 'Cancelada')
)
 
--Entrega--
CREATE TABLE Entrega (
IdEntrega INT NOT NULL identity (1,1)
,IdAluno INT NOT NULL
,IdAtividadeVinculada INT NOT NULL
,Titulo VARCHAR (20) NOT NULL
,Resposta VARCHAR (MAX) NOT NULL
,DtEntrega DATE NOT NULL CONSTRAINT dfDtEntrega DEFAULT (GETDATE())
,Status VARCHAR (40) CONSTRAINT dfStatusEnt DEFAULT 'Entregue' 
,IdProfessor INT NOT NULL
,Nota INT NOT NULL
,DtAvaliacao DATE NOT NULL 
,Obs VARCHAR (MAX) NOT NULL
,CONSTRAINT pkIdEntrega PRIMARY KEY (IdEntrega)
,CONSTRAINT fkAlunoEnt FOREIGN KEY (IdAluno) REFERENCES Aluno (IdAluno)
,CONSTRAINT fkAtividadeVinculadaEnt FOREIGN KEY (IdAtividadeVinculada) REFERENCES AtividadeVinculada (IdAtividadeVinculada)
,Constraint ckStatusEnt CHECK (Status like 'Entregue' or Status like 'Corrigido')
,CONSTRAINT fkProfessorEnt FOREIGN KEY (IdProfessor) REFERENCES Professor(IdProfessor)
,CONSTRAINT ckNota CHECK (Nota between 0 and 10)
)
 
--Mensagem--
CREATE TABLE Mensagem(
IdMensagem int NOT NULL identity(1,1)
, IdAluno int NOT NULL
, IdProfessor int NOT NULL
, CONSTRAINT fkIdAlunoMsg FOREIGN KEY (IdAluno) REFERENCES Aluno(IdAluno)
, CONSTRAINT fkIdProfessorMsg FOREIGN KEY (IdProfessor) REFERENCES Professor(IdProfessor)
, Assunto varchar(30) NOT NULL
, Referencia varchar(300) NOT NULL
, Conteudo varchar(300) NOT NULL
, Status varchar(30) constraint dfstatusMsg DEFAULT 'Enviado' CHECK(STATUS LIKE'Enviado' OR STATUS LIKE 'Lido' OR STATUS LIKE 'Respondido') NOT NULL
, DtEnvio SMALLDATETIME CONSTRAINT dfDataEnvio DEFAULT(GETDATE())
, Resposta varchar(300)
)
