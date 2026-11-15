CREATE DATABASE lojaVinis;
USE lojaVinis;

CREATE TABLE Genero(cod_genero int, nome VARCHAR(255), PRIMARY KEY(cod_genero));

CREATE TABLE Album(cod_album int, id_genero int, temp_dur int, ano_lanc int, nome VARCHAR(255),
PRIMARY KEY(cod_album), FOREIGN KEY(id_genero) REFERENCES Genero(cod_genero));

CREATE TABLE Vinil(cod_vinil int, id_album int, qtd_discos int, PRIMARY KEY (cod_vinil), FOREIGN KEY(id_album) REFERENCES Album(cod_album));

CREATE TABLE Bandas(cod_banda int, nome VARCHAR(255), surgimento int, ativo boolean, PRIMARY KEY(cod_banda));

CREATE TABLE Integrantes(cod_integrantes int, nome VARCHAR(255), PRIMARY KEY(cod_integrantes));

CREATE TABLE Bandas_genero(cod_genero int, cod_banda int, PRIMARY KEY (cod_genero, cod_banda), 
FOREIGN KEY (cod_genero) REFERENCES Genero(cod_genero),
FOREIGN KEY (cod_banda) REFERENCES Bandas(cod_banda));

CREATE TABLE Integrantes_bandas(cod_integrantes int, cod_banda int, PRIMARY KEY (cod_integrantes, cod_banda), 
FOREIGN KEY (cod_integrantes) REFERENCES Integrantes(cod_integrantes),
FOREIGN KEY (cod_banda) REFERENCES Bandas(cod_banda));

CREATE TABLE Bandas_album(cod_banda int, cod_album int, PRIMARY KEY (cod_banda, cod_album), 
FOREIGN KEY (cod_banda) REFERENCES Bandas(cod_banda),
FOREIGN KEY (cod_album) REFERENCES Album(cod_album));