
insert into solicitacaomatricula
values(
'1','1','1','15-04-2018','1','Solicitada'
)

insert into solicitacaomatricula
values(
'2','2','2','9-04-2018','2','Solicitada'
)

insert into solicitacaomatricula
values(
'3','3','1','19-03-2018','4','Solicitada'
)

update solicitacaomatricula
set Status_SM = 'Aprovada' 
where IDsolicitacaomatricula like '1';

update solicitacaomatricula
set Status_SM = 'Rejeitada' 
where IDsolicitacaomatricula like '3';

update solicitacaomatricula
set Status_SM = 'Aprovada' 
where IDsolicitacaomatricula like '2';


select * from solicitacaomatricula
