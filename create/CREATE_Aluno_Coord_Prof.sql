CREATE TABLE Entrega (
	IdEntrega INT NOT NULL,
	IdAluno INT NOT NULL,
	IdAtividadeVinculada INT NOT NULL,
	Titulo VARCHAR (20) NOT NULL,
	Resposta VARCHAR (MAX) NOT NULL,
	DtEntrega DATE NOT NULL,
	Status_E VARCHAR (40),
	IdProfessor INT NOT NULL,
	Nota FLOAT NOT NULL,
	DtAvaliacao DATE NOT NULL,
	Obs VARCHAR (MAX) NOT NULL,
	CONSTRAINT pkIdEntrega PRIMARY KEY (IdEntrega),
	CONSTRAINT fkAluno FOREIGN KEY (IdAluno) REFERENCES Aluno (IdAluno),
	CONSTRAINT fkAtividadeVinculada FOREIGN KEY (IdAtividadeVinculada) REFERENCES AtividadeVinculada (IdAtividadeVinculada),
	CONSTRAINT dfDtEntrega DEFAULT (GETDATE()),
	CONSTRAINT ckStatus_E CHECK (Status_E in ('Entregue','Corrigido')),
	CONSTRAINT fkProfessor FOREIGN KEY (IdProfessor) REFERENCES Professor(IdProfessor),
	CONSTRAINT ckNota CHECK (Nota >= 0.00 and Nota <= 10.00),
)


CREATE TABLE SolicitacaodeMatricula(
IDSolicitacaoMatricula INT NOT NULL,
IdAluno INT NOT NULL,
IdDiscOfertada INT NULL,
DtSolicitacao DATE NOT NULL,
IdCoordenador INT NULL,
CK_Status VARCHAR (30) NOT NULL,
CONSTRAINT IDSolicitacaoMatricula PRIMARY KEY (IDSolicitacaoMatricula),
CONSTRAINT dfDtSolicitacao DEFAULT (GETDATE()),
CONSTRAINT CK_Status DEFAULT "Solicitação" CHECK (CK_Status LIKE 'Solicitada','Aprovada','Rejeitada','Cancelada')
)