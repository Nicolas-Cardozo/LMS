----Aluno----
CREATE TABLE Aluno (
 IdAluno INT not null IDENTITY(1,1)
,Login INT not null 
,Senha VARCHAR(10) not null
,Nome VARCHAR(50) not null
,Email VARCHAR(50) not null 
,Celular VARCHAR(15) 
,DtExpiracao DATE not null DEFAULT '1900-01-01'
,RA VARCHAR(10) not null
,Foto VARCHAR(1000) null
,CONSTRAINT pkAluno PRIMARY KEY (IdAluno)
,CONSTRAINT uqAlunoLogin UNIQUE (Login)
,CONSTRAINT uqAlunoEmail UNIQUE (Email)
,CONSTRAINT uqAlunoCelular UNIQUE (Celular)
)
