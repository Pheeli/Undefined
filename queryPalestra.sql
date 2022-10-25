-- query (a) Selezionare nome, cognome e categoria degli atleti maggiorenni (età maggiore o uguale a
-- 18) iscritti a corsi tenuti dall’istruttore 'Roberto', ordinati per nome ed eliminando i duplicati. 
select distinct nomeAtleta,cognomeAtleta,categoria from palestra.atleta
join palestra.iscrizione on codiceA=atleta
join palestra.corso on codiceC=corso
where eta >= 18 and nomeIstruttore = 'Roberto'
order by nomeAtleta

-- query b) Selezionare il codice delle coppie di atleti che hanno stesso nome ma che appartengono a
-- categorie diverse. 
select A.codiceA, B.codiceA from palestra.atleta A,palestra.atleta B 
where A.nomeAtleta = B.nomeAtleta and A.codiceA < B.codiceA and A.categoria <> B.categoria

-- query (c) Selezionare, per ogni corso a cui sono iscritti almeno 3 atleti diversi, il nome del corso e
-- l’eta media degli atleti iscritti a quel corso.
select codiceC, nomeCorso, avg(eta) from palestra.corso
join palestra.iscrizione on codiceC=corso
join palestra.atleta on codiceA=atleta
group by codiceC having count(atleta)>=3

-- query (d) Selezionare, per ogni corso: il nome del corso, e il nome, il cognome e la categoria
-- dell’atleta più giovane iscritto a quel corso. 
select nomeCorso, nomeAtleta, cognomeAtleta, categoria, eta from palestra.corso
join palestra.iscrizione on codiceC=corso
join palestra.atleta on codiceA=atleta

group by nomeCorso, nomeAtleta, cognomeAtleta, categoria, eta having eta <= all (select min(eta) from palestra.atleta 
																			    join palestra.iscrizione on codiceA=atleta
																			    join palestra.corso on codiceC=corso
																			    group by corso)