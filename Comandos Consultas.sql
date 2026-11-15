USE lojaVinis

-- A) elaborar uma consulta para cada tabela, que obrigatoriamente tenha os comandos: Select e Where e order by.
-- consulta Album
SELECT nome FROM Album WHERE id_genero = 7 ORDER BY temp_dur ASC;

-- consulta Bandas
SELECT nome FROM Bandas WHERE ativo = 1 ORDER BY surgimento DESC;

-- consulta Bandas_album
SELECT cod_album FROM Bandas_album WHERE cod_banda = 2 ORDER BY cod_album ASC;

-- consulta Bandas_genero
SELECT cod_banda FROM Bandas_genero WHERE cod_genero = 1 ORDER BY cod_banda ASC;

-- consulta gênero
SELECT nome FROM Genero WHERE cod_genero > 2 ORDER BY cod_genero;

-- consulta integrantes
SELECT nome FROM Integrantes WHERE cod_integrantes < 10 ORDER BY cod_integrantes;

-- consulta Vinil
SELECT qtd_discos as discos FROM Vinil WHERE cod_vinil <= 4 ORDER BY discos ASC;

-- consulta Integrantes_bandas
SELECT cod_integrantes FROM Integrantes_bandas WHERE cod_banda = 6 ORDER BY cod_integrantes DESC;

-- B) Essa consulta mostra quantos integrantes cada banda contem
SELECT cod_banda, COUNT(cod_integrantes) AS "Numero de Integrantes" FROM Integrantes_bandas GROUP BY cod_banda;

-- C) Essa consulta mostra a junção de duas tabelas Album e Vinil. 
SELECT Album.id_genero, Vinil.id_album FROM Album JOIN Vinil  ON Album.id_genero = Vinil.id_album 
ORDER BY  Album.nome;

-- D) Essa consulta mostra quantos discos cada album possui
SELECT Album.nome, Vinil.qtd_discos FROM Album LEFT JOIN Vinil ON Album.cod_album = Vinil.id_album ORDER BY Album.nome;

-- E)
-- uma busca da quantidade de vinís que cada banda lançou  
SELECT b.nome as banda, SUM(v.qtd_discos ) as quantidade_discos
FROM Bandas b 
INNER JOIN Bandas_album ba on b.cod_banda = ba.cod_banda 
INNER JOIN Album a on ba.cod_album = a.cod_album
INNER JOIN Vinil v  on a.cod_album = v.id_album
GROUP BY b.cod_banda, b.nome;

-- F) Consulta com sub-consulta juntas.
SELECT a.nome
FROM Album a
WHERE a.cod_album IN (
SELECT a2.cod_album
FROM Album a2 
INNER JOIN Bandas_album ba on ba.cod_album = a2.cod_album
INNER JOIN Bandas b on ba.cod_banda = b.cod_banda 
WHERE b.ativo = 1)
ORDER BY a.nome;