CREATE DATABASE	MagicRuin;
use MagicRuin;

CREATE TABLE Raca (
idRaca INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
caracteristica VARCHAR(255)
); 

CREATE TABLE Classificacao(
idClassificacao INT PRIMARY KEY AUTO_INCREMENT,
nivel char(1)
);

CREATE TABLE Familia(
idFamilia INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
riqueza INT,
lema VARCHAR(150),
fkClassificacao INT,
FOREIGN KEY(fkClassificacao) REFERENCES Classificacao(idClassificacao)
);

CREATE TABLE Pais(
idPais INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
datNasc DATE,
fkFamilia INT,
FOREIGN KEY(fkFamilia) REFERENCES Familia(idFamilia),
fkRaca INT,
FOREIGN KEY(fkRaca) REFERENCES Raca(idRaca)
);

CREATE TABLE Religiao (
idReligiao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(255)
);

CREATE TABLE Deus (
idDeus INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
elemento VARCHAR(45),
planeta VARCHAR(45)
);

CREATE TABLE Mantra (
idMantra INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(255),
fkReligiao INT,
FOREIGN KEY(fkReligiao) REFERENCES Religiao(idReligiao)
);

CREATE TABLE ReligiaoDeus (
fkReligiao INT,
FOREIGN KEY(fkReligiao) REFERENCES Religiao(idReligiao),
fkDeus INT,
FOREIGN KEY(fkDeus) REFERENCES Deus(idDeus),
PRIMARY KEY (fkReligiao, fkDeus)
);

CREATE TABLE Pessoa(
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dataNasc DATE,
cidade VARCHAR(45),
classeSocial VARCHAR(45),
sexo CHAR(1),
fkFamilia INT,
FOREIGN KEY(fkFamilia) REFERENCES Familia(idFamilia),
fkClassificacao INT,
FOREIGN KEY(fkClassificacao) REFERENCES Classificacao(idClassificacao),
fkRaca INT,
FOREIGN KEY(fkRaca) REFERENCES Raca(idRaca),
fkReligiao INT,
FOREIGN KEY(fkReligiao) REFERENCES Religiao(idReligiao)
);

CREATE TABLE PaisPessoas (
idRegistro INT AUTO_INCREMENT,
fkPais INT,
FOREIGN KEY(fkPais) REFERENCES Pais(idPais),
fkPessoa INT,
FOREIGN KEY(fkPessoa) REFERENCES Pessoa(idPessoa),
PRIMARY KEY (idRegistro, fkPais, fkPessoa)
);

CREATE TABLE Territorio (
idTerritorio INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
extensao BIGINT,
fkFamilia INT,
FOREIGN KEY(fkFamilia) REFERENCES Familia(idFamilia)
);

CREATE TABLE Cidade (
idCidade INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
populacao INT,
fkTerritorio INT,
FOREIGN KEY(fkTerritorio) REFERENCES Territorio(idTerritorio)
);

CREATE TABLE Ruina (
idRuina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
qtdMonstro INT,
fkCidade INT,
FOREIGN KEY(fkCidade) REFERENCES Cidade(idCidade),
fkClassificacao INT,
FOREIGN KEY(fkClassificacao) REFERENCES Classificacao(idClassificacao)
);

CREATE TABLE Monstro (
idMonstro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
tipo VARCHAR(45)
);

CREATE TABLE MonstroRuina (
qtd INT,
fkMonstro INT,
FOREIGN KEY(fkMonstro) REFERENCES Monstro(idMonstro),
fkRuina INT,
FOREIGN KEY(fkRuina) REFERENCES Ruina(idRuina),
PRIMARY KEY (fkRuina, fkMonstro, qtd)
);

CREATE TABLE Recompensa (
idRecompensa INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45)
);

CREATE TABLE RuinaRecompensa (
fkRuina INT,
FOREIGN KEY (fkRuina) REFERENCES Ruina(idRuina),
fkRecompensa INT,
FOREIGN KEY (fkRecompensa) REFERENCES Recompensa(idRecompensa),
PRIMARY KEY (fkRuina, fkRecompensa)
);

CREATE TABLE RuinaPessoa (
dataEx DATE,
fkPessoa INT,
FOREIGN KEY(fkPessoa) REFERENCES Pessoa(idPessoa),
fkRuina INT,
FOREIGN KEY(fkRuina) REFERENCES Ruina(idRuina),
PRIMARY KEY(dataEx, fkPessoa, fkRuina)
);

CREATE TABLE Grimorio (
idGrimorio INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkPessoa INT,
FOREIGN KEY(fkPessoa) REFERENCES Pessoa(idPessoa)
);

CREATE TABLE Magia (
idMagia INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(45),
nivelPoderInicial INT
);

CREATE TABLE GrimorioMagia (
fkGrimorio INT,
FOREIGN KEY(fkGrimorio) REFERENCES Grimorio(idGrimorio),
fkMagia INT,
FOREIGN KEY(fkMagia) REFERENCES Magia(idMagia),
PRIMARY KEY (fkGrimorio, fkMagia)
);

INSERT INTO Raca VALUES (NULL, 'Elfo', 'Orelha pontuda'),
						(NULL, 'Fada', 'Pequena criatura humanoide com asas'),
						(NULL, 'Troll', 'Violento e não muito inteligente'),
						(NULL, 'Gnomo', 'Criatura humanoide com barba branca, velha e com chapéu'),
						(NULL, 'Gigante', 'Criatura gigante'),
						(NULL, 'Demônio', 'Criatura profana com asas negras e chifres'),
						(NULL, 'Anjo', 'Criatura divina com asas penadas'),
						(NULL, 'Humano', 'Humano'),
						(NULL, 'Vampiro', 'Humano que chupa sangue e vira morcego'),
						(NULL, 'Centauro', 'Meio humano, meio cavalo'),
						(NULL, 'Minotauro', 'Touro humanoide'),
						(NULL, 'Dracônico', 'Humano dracônico'),
						(NULL, 'Orc', 'Criatura forte, bárbara e violenta'),
						(NULL, 'Sereia', 'Criatura metade peixe, metade humano'),
						(NULL, 'Alien', 'Criatura de outro mundo / Reptilianos / Segurança do Obama'),
						(NULL, 'Dragão', 'Criatura alada ,que cospe fogo, gigante, que parece um reptiliano'),
						(NULL, 'Smurf', 'Criatura pequena e azul'),
						(NULL, 'Goblin', 'Criatura pequena e verde'),
						(NULL, 'Minion', 'Servos do Gru'),
						(NULL, 'Sayajin', 'Goku'),
						(NULL, 'Pokemon', 'Pokemon'),
						(NULL, 'Zumbi', 'Humano morto-vivo'),
						(NULL, 'Esqueleto', 'Corpo humano sem CSS e JS'),
						(NULL, 'Creeper', 'Bicho verde que explode'),
						(NULL, 'Enderman', 'Criatura insipirada no Slender'),
						(NULL, 'Freezarino', 'Raça do Freeza do Dragon Ball'),
						(NULL, 'Duende', 'Criatura pequena, brincalhona e com orelhas pontudas');

INSERT INTO Classificacao VALUES (NULL, 'S'),
								 (NULL, 'A'),
								 (NULL, 'B'),
								 (NULL, 'C'),
	                             (NULL, 'D'),
	                             (NULL, 'E');

INSERT INTO Familia VALUES (NULL, 'Kirmizi', 5000, 'Estou mais sozinho que goleiro na hora do pênalti.', 6),
						   (NULL, 'Mavi', 15000, '', 5),
                           (NULL, 'Turunku', 675000, '', 2),
                           (NULL, 'Sari', 75000, '', 4),
                           (NULL, 'Bezay', 75000, '', 4),
                           (NULL, 'Siyah', 6750000, 'Eu já vi famílias ranks C,B e A. Mas só existe uma S.', 1),
                           (NULL, 'Mor', 675000, 'Talento e magia não se compram na esquina', 2),
                           (NULL, 'Yesil', 225000, '', 3);

INSERT INTO Pais VALUES (NULL, '', '', '', , );

INSERT INTO Religiao VALUES (NULL, '', '');

INSERT INTO Deus VALUES (NULL, '', '', '');

INSERT INTO Mantra VALUES (NULL, '', '', );

INSERT INTO ReligiaoDeus (, );

INSERT INTO Pessoa VALUES (NULL, '', '', '', '', '', , , );

INSERT INTO PaisPessoas VALUES (NULL, , );

INSERT INTO Territorio VALUES (NULL, '', , );

INSERT INTO Cidade VALUES (NULL, '', , );

INSERT INTO Ruina VALUES (NULL, '', , , );

INSERT INTO Monstro VALUES (NULL, '', '');

INSERT INTO MonstroRuina VALUES (, , );

INSERT INTO Recompensa VALUES (NULL, '');

INSERT INTO RuinaRecompensa VALUES (, );

INSERT INTO RuinaPessoa VALUES ('', , );

INSERT INTO Grimorio VALUES (NULL, '', );

INSERT INTO Magia VALUES (NULL, '', );

INSERT INTO GrimorioMagia VALUES (, );




