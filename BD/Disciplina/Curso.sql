--Curso--
CREATE TABLE Curso (
 IdCurso INT not null IDENTITY (1,1)
,Nome VARCHAR (100)
,CONSTRAINT pkCursoId PRIMARY KEY (IdCurso)
,CONSTRAINT uqCursoNome UNIQUE (Nome)
)
