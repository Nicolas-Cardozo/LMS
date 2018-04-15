--MODIFICA��O REALIZADA PARA INSER��O DO CAMPO IdCoordenador COMO CHAVE ESTRANGEIRA NA TABLE DisciplinaOfertada--
ALTER TABLE DISCIPLINAOFERTADA
DROP COLUMN IdCoordenador
ALTER TABLE DISCIPLINAOFERTADA
ADD IdCoordenador int not null
CONSTRAINT fkIdCoordenador FOREIGN KEY (IdCoordenador)
REFERENCES Coordenador(IdCoordenador)

--MODIFICA��O REALIZADA PARA ALTERA��O DO CAMPO IdProfessor COMO CHAVE ESTRANGEIRA--
ALTER TABLE DISCIPLINAOFERTADA
DROP COLUMN IdProfessor
ALTER TABLE DISCIPLINAOFERTADA
ADD IdProfessor INT NOT NULL
CONSTRAINT fkIdProfessorDiscOf FOREIGN KEY (IdProfessor)
REFERENCES Professor(IdProfessor)

--MODIFICA��O REALIZADA PARA ALTERA��O DO CAMPO Turma COMO varchar--
ALTER TABLE DISCIPLINAOFERTADA
DROP CONSTRAINT ckTurma, uqdiscOfertada
ALTER TABLE DISCIPLINAOFERTADA
DROP COLUMN Turma
ALTER TABLE DISCIPLINAOFERTADA
ADD Turma varchar(1) not null
CONSTRAINT ckTurma CHECK (Turma LIKE '[A-Z]'),
CONSTRAINT uqdiscOfertada UNIQUE (IdDisciplina,IdCurso, Ano, Semenstre, Turma)

--INSTERTS--
INSERT INTO DISCIPLINAOFERTADA (iddiscofertada,dtiniciomatricula, dtfimmatricula, iddisciplina, idcurso, ano, semestre, turma, metodologia, recursos, criterioavaliacao, planodeaulas, idcoordenador, idprofessor)
VALUES(
1,'01-12-2017','01-01-2018',1,9,2018,1,'B','','','','',4,1
)
INSERT INTO DISCIPLINAOFERTADA (iddiscofertada,dtiniciomatricula, dtfimmatricula, iddisciplina, idcurso, ano, semestre, turma, metodologia, recursos, criterioavaliacao, planodeaulas, idcoordenador, idprofessor)
VALUES(
2,'01-12-2017','01-01-2018',1,9,2018,1,'B','','','','',4,1
)

SELECT * FROM disciplinaofertada

