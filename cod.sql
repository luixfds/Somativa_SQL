drop database Copa;

create database Copa;

use Copa;

-- 1
create table times(
	id int not null auto_increment,
    nome varchar(45) not null,
    data_registro date not null,
    qtd_titulos int not null,
    primary key (id)
);
-- 2
create table jogador(
	id int not null auto_increment,
    nome varchar(45) not null,
	data_nasc date not null,
    qtd_premios int,
    timesID int not null,
    primary key (id),
	foreign key (timesID) references times(id)
);
-- 3
create table copa(
	id int not null auto_increment,
    nome varchar(45) not null,
    ano int not null,
    casa varchar(45) null,
    primary key (id)
);
-- 4
create table colocacao(
	id int not null auto_increment,
    ranked varchar(45) not null,
    timesID int not null,
    copaID int not null,
    casa varchar(45) null,
    primary key (id),
    foreign key (timesID) references times(id),
    foreign key (copaID) references copa(id)
);
-- 5
create table jogo(
	id int not null auto_increment,
	dataJ date not null,
    inicio datetime not null,
    fim datetime not null,
    timeVencedorID int null,
    time1ID int not null,
    time2ID int not null,
    copaID int not null,
    primary key (id),
    foreign key (timeVencedorID) references times(id),
    foreign key (time1ID) references times(id),
    foreign key (time2ID) references times(id),
    foreign key (copaID) references copa(id)
);
-- 6
create table faltas(
	id int not null auto_increment,
    jogadorID int not null,
    timesID int not null,
    jogoID int not null,
    tempo int not null,
    primary key (id),
    foreign key (timesID) references times(id),
    foreign key (jogadorID) references jogador(id),
    foreign key (jogoID) references jogo(id)
);
-- 7
create table gol(
	id int not null auto_increment,
    jogadorID int not null,
    timesID int not null,
    jogoID int not null,
    tempo int not null,
    primary key (id),
    foreign key (timesID) references times(id),
    foreign key (jogadorID) references jogador(id),
    foreign key (jogoID) references jogo(id)
);
-- 8
create table detalhes(
	id int not null auto_increment,
    faltasID int not null,
    golsID int not null,
    jogoID int not null,
    primary key (id),
    foreign key (faltasID) references faltas(id),
    foreign key (golsID) references gol(id),
    foreign key (jogoID) references jogo(id)
);
-- 9
create table caveira(
	id int not null auto_increment,
    qtd_faltas int null,
	qtd_gols int null,
    jogadorID int not null,
    jogoID int not null,
    primary key (id),
    foreign key (jogadorID) references jogador(id),
    foreign key (jogoID) references jogo(id)
);

-- INSERINDO TIMES
 -- INSERT INTO `times` (`id`, `nome`, `data_registro`, `qtd_titulos`) VALUES 
 -- (NULL, 'PSG', '2021-12-07', '12'),
 -- (NULL, 'FLAMENGO', '2021-12-07', '10'),
 -- (NULL, 'PONTE PRETA', '2021-12-07', '6');

-- INSERT INTO `jogador` (`id`, `nome`, `data_nasc`, `qtd_premios`, `timesID`) VALUES 
 -- (NULL, 'Bruno henrique', '2021-12-22', '4', '2'),
 -- (NULL, 'Messi', '2021-12-22', '4', '1'),
 -- (NULL, 'Ronald', '2021-12-22', '4', '3');
 
-- INSERT INTO `copa` (`id`, `nome`, `ano`, `casa`) VALUES (NULL, 'COPA Luis??o', '2021', 'BRAZIL');

-- INSERT INTO `colocacao` (`id`, `ranked`, `timesID`, `copaID`, `casa`) VALUES 
 -- (NULL, '2', '1', '1', 'BRAZIL'),
 -- (NULL, '3', '3', '1', 'BRAZIL');
 
 -- INSERT INTO `jogo` (`id`, `dataJ`, `inicio`, `fim`, `timeVencedorID`, `time1ID`, `time2ID`, `copaID`) VALUES 
  -- (NULL, '2021-12-15', '2021-12-16 10:57:54', '2021-12-10 12:57:54', '2', '3', '2', '1'),
  -- (NULL, '2021-12-15', '2021-12-16 10:57:54', '2021-12-10 12:57:54', '1', '1', '3', '1');
  
  -- INSERT INTO `faltas` (`id`, `jogadorID`, `timesID`, `jogoID`, `tempo`) VALUES 
   -- (NULL, '1', '2', '1', '45');
   
-- INSERT INTO `detalhes` (`id`, `faltasID`, `golsID`, `jogoID`) VALUES 
 -- (NULL, '1', '1', '1');
 
-- INSERT INTO `caveira` (`id`, `qtd_faltas`, `qtd_gols`, `jogadorID`, `jogoID`) 
 -- VALUES (NULL, '3', '20', '2', '1');
 

 