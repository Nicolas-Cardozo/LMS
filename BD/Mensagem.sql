CREATE TABLE Mensagem
(
IdMensagem int NOT NULL
, IdAluno int NOT NULL
, IdProfessor int NOT NULL
, CONSTRAINT fkIdAluno FOREIGN KEY (IdAluno) REFERENCES Aluno(IdAluno)
, CONSTRAINT fkIdProfessor FOREIGN KEY (IdProfessor) REFERENCES Professor(IdProfessor)
, Assunto varchar(30) NOT NULL
, Referencia varchar(300) NOT NULL
, Conteudo varchar(300) NOT NULL
, Status varchar(30) constraint dfstatus DEFAULT 'Enviado' CHECK(STATUS LIKE'Enviado' OR STATUS LIKE 'Lido' OR STATUS LIKE 'Respondido') NOT NULL
, DtEnvio SMALLDATETIME CONSTRAINT dfDataEnvio DEFAULT(GETDATE())
, Resposta varchar(300)

)