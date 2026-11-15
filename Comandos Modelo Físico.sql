CREATE DATABASE lojaVinis;
CREATE TABLE Vinil(cod_vinil int PRIMARY KEY, id_album int FOREIGN KEY, qtd_discos int);
CREATE TABLE Album(cod_album int PRIMARY KEY, id_genero int FOREIGN KEY, temp_dur int, ano_lanc int, nome VARCHAR(255));
CREATE TABLE Bandas_album(cod_banda int PRIMARY KEY FOREIGN KEY, cod_album int PRIMARY KEY FOREIGN KEY);
CREATE TABLE Genero(cod_genero int PRIMARY KEY, nome VARCHAR(255));

