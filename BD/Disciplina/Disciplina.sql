
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
,CONSTRAINT fkCoordenador FOREIGN KEY (IdCoordenador) REFERENCES Coordenador(IdCoordenador)
,CONSTRAINT pkIdDisciplina PRIMARY KEY (IdDisciplina)
,CONSTRAINT uqNome UNIQUE (Nome)
,CONSTRAINT uqStatus UNIQUE (Status)  
,CONSTRAINT ckCargaHoraria CHECK (CargaHoraria IN (40,80))  
,CONSTRAINT ckPercentualPratico CHECK (PercentualPratico between 00 and 100)  
,CONSTRAINT ckPercentualTeorico CHECK (PercentualTeorico between 00 and 100)  
)
