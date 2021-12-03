drop database Copa;

create database Copa;

use Copa;
-- 6
create table copa(
	id int not null,
    nome varchar(45) not null,
    ano int not null,
    casa varchar(45) null,
    colocacaoID int not null,
    primary key (id),
    foreign key (colocacaoID) references colocacao(id)
);
-- 5
create table colocacao(
	id int not null,
    ranked varchar(45) not null,
    timesID int not null,
    casa varchar(45) null,
    primary key (id),
    foreign key (timesID) references times(id)
);
-- 1
create table times(
	id int not null,
    nome varchar(45) not null,
    data_registro date not null,
    qtd_titulos int not null,
    primary key (id)
);
-- 2
create table jogador(
	id int not null,
    nome varchar(45) not null,
	data_nasc date not null,
    qtd_premios int,
    timesID int not null,
    primary key (id),
	foreign key (timesID) references times(id)
);
-- 9
create table caveira(
	id int not null,
    qtd_faltas int null,
	qtd_gols int null,
    jogadorID int not null,
    jogoID int not null,
    primary key (id),
    foreign key (jogadorID) references jogador(id),
    foreign key (jogoID) references jogo(id)
);
-- 8
create table jogo(
	id int not null,
	dataJ date not null,
    inicio datetime not null,
    fim datetime not null,
    timeVencedorID int null,
    time1ID int not null,
    time2ID int not null,
    detalhesID int not null,
    copaID int not null,
    primary key (id),
    foreign key (timeVencedorID) references times(id),
    foreign key (time1ID) references times(id),
    foreign key (time2ID) references times(id),
    foreign key (detalhesID) references detalhes(id),
    foreign key (copaID) references copa(id)
);
-- 7
create table detalhes(
	id int not null,
    faltasID int not null,
    golsID int not null,
    primary key (id),
    foreign key (faltasID) references faltas(id),
    foreign key (golsID) references gol(id)
);
-- 3
create table faltas(
	id int not null,
    jogadorID int not null,
    timesID int not null,
    tempo int not null,
    primary key (id),
    foreign key (timesID) references times(id),
    foreign key (jogadorID) references jogador(id)
);
-- 4
create table gol(
	id int not null,
    jogadorID int not null,
    timesID int not null,
    tempo int not null,
    primary key (id),
    foreign key (timesID) references times(id),
    foreign key (jogadorID) references jogador(id)
);


