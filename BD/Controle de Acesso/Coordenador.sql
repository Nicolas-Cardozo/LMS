--Coordenador--
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
