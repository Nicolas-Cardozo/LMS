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
