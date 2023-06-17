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
anoNasc CHAR(3),
cidadeNatal VARCHAR(45),
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
fkCidade INT,
FOREIGN KEY(fkCidade) REFERENCES Cidade(idCidade),
fkClassificacao INT,
FOREIGN KEY(fkClassificacao) REFERENCES Classificacao(idClassificacao)
);

CREATE TABLE Monstro (
idMonstro INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(45),
caracteristica VARCHAR(255)
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
anoEx CHAR(3),
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
descricao VARCHAR(255)
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
						   (NULL, 'Mavi', 15000, 'Avançando juntos, moldando um futuro melhor.', 5),
                           (NULL, 'Turunku', 675000, 'Perfeição é o nosso sobrenome, superioridade é o nosso lema.', 2),
                           (NULL, 'Sari', 75000, 'Sempre haverá montanhas mais altas.', 4),
                           (NULL, 'Bezay', 75000, 'Uma jornada de mil milhas começa com o primeiro passo.', 4),
                           (NULL, 'Siyah', 6750000, 'Eu já vi famílias ranks C,B e A. Mas só existe uma S.', 1),
                           (NULL, 'Mor', 675000, 'Talento e magia não se compram na esquina', 2),
                           (NULL, 'Yesil', 225000, 'Unidos na simplicidade, guiados pelo amor e humildade.', 3);

INSERT INTO Pais VALUES (NULL, '', '', '', , );

INSERT INTO Religiao VALUES
  (NULL, 'Ilmalik', 'A religião de Ilmalik baseia-se na adoração dos elementais da natureza, considerando-os como deuses supremos que controlam todos os elementos do mundo.'),
  (NULL, 'Isiksi', 'A religião de Isiksi é centrada no culto da Luz Divina, uma entidade transcendental de grande energia. Eles buscam a purificação da alma através do conhecimento e esperam o grande retorno da Luz Divina. Isiksi é a religião oposta à Karanlik'),
  (NULL, 'Karanlik', 'A religião de Karanlik adora as trevas e a escuridão como manifestações sagradas. Karanliki busca a paz e a verdade no vazio da escuridão do mundo.Karanlik é a religião oposta à Isiksi'),
  (NULL, 'Ruh Yolculari', 'A religião de Ruh Yolculari se baseia na reencarnação de todas as criaturas vivas no mundo. Eles buscam a imortalidade da alma e a sabedoria infinita através das infinitas reencarnações de um ser.'),
  (NULL, 'Sonsuz Uyanis', 'A religião de Sonsuz Uyanis é baseada na unificação física dos seres, tanto divinos quanto mortais, acreditando na evolução do mundo através de seus metamorfos, que são usados em batalhas, questões sociais, questões políticas, etc.') ;
  (NULL, 'Yildiz', 'A religião de Yildiz é uma religião extremista e relativamente nova no mundo de Magic Ruin. Eles adoram os demônios e monstros do submundo, acreditando e sustentando à espera de uma grande era dominada pelo mau e pelos monstros.')

INSERT INTO Deus VALUES
  (NULL, 'Ayse', 'Fogo', 'Gokada'),
  (NULL, 'Demir', 'Terra', 'Maviyildiz'),
  (NULL, 'Selen', 'Água', 'Nilgun'),
  (NULL, 'Ruzgar', 'Ar', 'Yildizsiz'),
  (NULL, 'Elektra', 'Raio', 'Aydinlatan'),
  (NULL, 'Yeryuz', 'Natureza', 'Yesiluyduz'),
  (NULL, 'Zaman', 'Tempo', 'Sonsuzluk'),
  (NULL, 'Isik', 'Luz', 'Parlakçag'),
  (NULL, 'Golgoç', 'Sombra', 'Gecegok'),
  (NULL, 'Aurelius', 'Arcano', 'Mystara');

INSERT INTO Mantra VALUES
  (NULL, 'Mantra dos Elementos', 'Os elementos estão em todos os lugares. Através dos elementos, encontramos a harmonia e paz.', 1),
  (NULL, 'Mantra da Luz Divina', 'Que a chama divina purifique minha alma e ilumine o nosso caminho.', 2),
  (NULL, 'Mantra das Trevas', 'As sombras nos iluminam e ofuscam a dor de nosso mundo.', 3),
  (NULL, 'Mantra da Reencarnação', 'Amanhã seremos mais do que somos hoje.', 4),
  (NULL, 'Mantra da Evolução', 'Juntos somos mais fortes. A união e a evolução caminha lado a lado.', 5),
  (NULL, 'Mantra da Destruição', 'Aguardaremos à ascenção da nova era com muita paciência e fome.', 6)

INSERT INTO ReligiaoDeus
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(2, 7),
	(2, 8),
	(2, 10),
	(3, 7),
	(3, 9),
	(3, 10),
	(4, 7),
	(4, 10),
	(4, 2),
	(4, 4),
	(5, 9),
	(5, 3),
	(5, 5),
	(5, 6),
	(6, 9),
	(6, 1),
	(6, 10);

INSERT INTO Pessoa VALUES
	(NULL, 'Sir Jorge', '373', 'Gozdesehir', 'Burguês', 'M', 6, 1, 8, NULL),
	(NULL, 'Melike Ece', '406', 'Golkasabasi', 'Quase Burguês', 'F', 3, 2, 21, 5),
	(NULL, 'Leandro Jooj', '407', 'Gumuskent', 'Quase Plebeu', 'M', 2, 5, 7, 3),
	(NULL, 'Arthur Brabo', '400', 'Safaksehir', 'Plebeu', 'M', 1, 1, 15, 1),
	(NULL, 'Bia Bala', '408', 'Gozdesehir', 'Média-Alta', 'F', 8, 3, 23, 2),
	(NULL, 'Vitor Chefe', '410', 'Gumuskent', 'Plebeu', 'M', 1, 6, 5, 6),
	(NULL, 'Gabriel Afiado', '411', 'Safaksehir', 'Média', 'M', 4, 4, 26, 4),
	(NULL, 'Luanna Chave', '403', 'Ayisigi Kasabasi', 'Quase Burguês', 'F', 7, 2, 12, NULL),
	(NULL, 'Ayse Elif', '390', 'Nehirsehir', 'Burguês', 'F', 6, 1, 10, 2),
	(NULL, 'Cemal Serdar', '388', 'Umutkent', 'Quase Plebeu', 'M', 2, 5, 3, 6),
	(NULL, 'Leyla Gunes', '391', 'Isildaksehir', 'Média-Alta', 'F', 8, 3, 19, 1),
	(NULL, 'Mehmet Can', '390', 'Nehirsehir', 'Plebeu', 'M', 1, 6, 17, 4),
	(NULL, 'Aysenur Deniz', '392', 'Denizkoy', 'Média', 'M', 5, 4, 6, 3),
	(NULL, 'Emre Cihan', '383', 'Dagkoy', 'Burguês', 'F', 6, 1, 25, 5),
	(NULL, 'Zeynep Ela', '401', 'Ayisigi Kasabasi', 'Quase Burguês', 'F', 3, 2, 9, NULL),
	(NULL, 'Mustafa Kerem', '410', 'Ipeksehir', 'Plebeu', 'M', 1, 6, 2, 1),
	(NULL, 'Melis Defne', '404', 'Denizkoy', 'Média', 'F', 4, 4, 20, 6),
	(NULL, 'Omer Baris', '399', 'Ruzgarsehir', 'Média-Alta', 'M', 8, 3, 16, 4),
	(NULL, 'Nazli Pinar', '394', 'Golkasabasi', 'Quase Plebeu', 'F', 2, 5, 11, 3),
	(NULL, 'Ahmet Emir', '398', 'Ruzgarsehir', 'Quase Burguês', 'M', 7, 2, 27, NULL),
	(NULL, 'Ipek Zehra', '401', 'Yildirimkent', 'Burguês', 'M', 6, 1, 1, 5),
	(NULL, 'Kaan Arda', '411', 'Yildizkoy', 'Média-Alta', 'M', 8, 3, 8, 2),
	(NULL, 'Yasemin Sedef', '388', 'Ipeksehir', 'Plebeu', 'F', 1, 6, 13, 1),
	(NULL, 'Volkan sahin', '399', 'Umutkent', 'Quase Plebeu', 'M', 2, 5, 18, 6),
	(NULL, 'Elif Zehra', '410', 'Huzursehir', 'Média', 'F', 5, 4, 4, 3),
	(NULL, 'Burak Taylan', '406', 'Yildirimkent', 'Burguês', 'M', 6, 1, 22, 4),
	(NULL, 'Dilara Hazal', '394', 'Isildaksehir', 'Quase Burguês', 'F', 3, 2, 14, NULL),
	(NULL, 'Serkan Deniz', '397', 'Yildizkoy', 'Quase Plebeu', 'M', 2, 5, 7, 5),
	(NULL, 'Aylin Selen', '378', 'Dagkoy', 'Plebeu', 'F', 1, 6, 26, 2),
	(NULL, 'Ibrahim Arif', '344', 'Huzursehir', 'Média-Alta', 'M', 8, 3, 5, 1);

INSERT INTO PaisPessoas VALUES (NULL, , );

INSERT INTO Territorio VALUES
	(NULL, 'Sehirsayir', 532, 1),
	(NULL, 'Gokyaka', 189, 2),
	(NULL, 'Cinarkent', 743, 3),
	(NULL, 'Yildizsehir', 421, 4),
	(NULL, 'Ruzgarkale', 912, 5),
	(NULL, 'Gulsehir', 305, 6),
	(NULL, 'Denizyari', 678, 7),
	(NULL, 'Daggolo', 234, 8);

INSERT INTO Cidade VALUES
	(NULL, 'Gozdesehir', 47000, 6),
	(NULL, 'Ayisigi Kasabasi', 62000, 6),
	(NULL, 'Gumuskent', 12, 6),
	(NULL, 'Yildizkoy', 78000, 1),
	(NULL, 'Ruzgarsehir', 56000, 8),
	(NULL, 'Isildaksehir', 41000, 2),
	(NULL, 'Denizkoy', 93000, 2),
	(NULL, 'safaksehir', 28000, 3),
	(NULL, 'Umutkent', 67000, 3),
	(NULL, 'Nehirsehir', 3000, 4),
	(NULL, 'Golkasabasi', 39000, 4),
	(NULL, 'Dagkoy', 81000, 5),
	(NULL, 'Huzursehir', 43000, 5),
	(NULL, 'Ipeksehir', 75000, 7),
	(NULL, 'Yildirimkent', 59000, 8);

INSERT INTO Ruina VALUES
	(NULL, 'Abismo Sombrio', 4, 1),
	(NULL, 'Caverna dos Desafios', 4, 1),
	(NULL, 'Labirinto do Perigo', 1, 1),
	(NULL, 'Túmulo Esquecido', 6, 1),
	(NULL, 'Ruínas Enfeitiçadas', 2, 2),
	(NULL, 'Catacumbas Profundas', 3, 2),
	(NULL, 'Vale das Sombras', 4, 2),
	(NULL, 'Abadia Amaldiçoada', 5, 2),
	(NULL, 'Câmara dos Goblins', 6, 3),
	(NULL, 'Ruínas de Eldoria', 7, 3),
	(NULL, 'Torre Desmoronada de Zephyrus', 8, 3),
	(NULL, 'Antiga Civilização Élfica', 9, 3),
	(NULL, 'Cidade dos Titãs Arruinados', 10, 4),
	(NULL, 'Castelo de Pedra Negra', 11, 4),
	(NULL, 'Fortaleza de Cristal', 12, 4),
	(NULL, 'Ruínas de Atlântida', 13, 4),
	(NULL, 'Abóbada do Terror', 14, 5),
	(NULL, 'Fosso dos Esquecidos', 15, 5),
	(NULL, 'Prisão da Morte', 2, 5),
	(NULL, 'Covil do Flagelo', 3, 5),
	(NULL, 'Poço da Desolação', 4, 6),
	(NULL, 'Vale dos Trolls', 5, 6),
	(NULL, 'Penumbra Desolada', 6, 6),
	(NULL, 'Antro da Angústia', 7, 6);

INSERT INTO Monstro VALUES
	(NULL, 'Espectro', 'Invisível e assombra lugares sombrios'),
	(NULL, 'Golem', 'Feito de pedra e extremamente resistente'),
  	(NULL, 'Grifo', 'Metade leão, metade águia'),
  	(NULL, 'Kraken', 'Enorme polvo marinho com tentáculos poderosos'),
	(NULL, 'Orc', 'Criatura forte, bárbara e violenta'),
	(NULL, 'Pokemon', 'Pokemon'),
	(NULL, 'Goblin', 'Criatura pequena e verde'),
	(NULL, 'Troll', 'Violento e não muito inteligente'),
	(NULL, 'Gigante', 'Criatura gigante'),
	(NULL, 'Demônio', 'Criatura profana com asas negras e chifres'),
	(NULL, 'Vampiro', 'Humano que chupa sangue e vira morcego'),
	(NULL, 'Centauro', 'Meio humano, meio cavalo'),
	(NULL, 'Minotauro', 'Touro humanoide'),
	(NULL, 'Dracônico', 'Humano dracônico'),
	(NULL, 'Alien', 'Criatura de outro mundo / Reptilianos / Segurança do Obama'),
	(NULL, 'Dragão', 'Criatura alada ,que cospe fogo, gigante, que parece um reptiliano'),
	(NULL, 'Minion', 'Servos do Gru'),
	(NULL, 'Pokemon', 'Pokemon'),
	(NULL, 'Zumbi', 'Humano morto-vivo'),
	(NULL, 'Esqueleto', 'Corpo humano sem CSS e JS'),
	(NULL, 'Creeper', 'Bicho verde que explode'),
	(NULL, 'Enderman', 'Criatura insipirada no Slender'),
	(NULL, 'Freezarino', 'Raça do Freeza do Dragon Ball');

INSERT INTO MonstroRuina VALUES
	(14, 1, 5),
	(13, 2, 6),
	(11, 3, 7),
	(2, 4, 4),
	(5, 5, ),
	(19, 6, 5),
	(23, 7, 6),
	(22, 8, 6),
	(10, 9, 7),
	(12, 10, 7),
	(37, 11, 8),
	(22, 12, 8),
	(27, 13, 8),
	(23, 14, 5),
	(16, 15, 9),
	(3, 16, 3),
	(3, 17, 9),
	(19, 18, 9),
	(27, 19, 10),
	(12, 20, 10),
	(3, 21, 10),
	(17, 22, 11),
	(17, 23, 11),
	(13, 1, 11),
	(10, 2, 12),
	(9, 3, 12),
	(3, 4, 3),
	(5, 5, 12),
	(9, 6, 13),
	(12, 7, 13),
	(13, 8, 13),
	(24, 9, 14),
	(1, 10, 14),
	(3, 11, 14),
	(4, 12, 15),
	(8, 13, 15),
	(4, 14, 15),
	(8, 15, 16),
	(1, 16, 1),
	(19, 17, 16),
	(1, 18, 16),
	(5, 19, 17),
	(8, 20, 17),
	(9, 21, 17),
	(3, 22, 18),
	(7, 23, 18),
	(3, 1, 18),
	(2, 2, 19),
	(7, 3, 19),
	(4, 4, 2),
	(8, 5, 19),
	(10, 6, 20),
	(11, 7, 20),
	(4, 8, 20),
	(3, 9, 21),
	(8, 10, 21),
	(9, 11, 21),
	(5, 12, 22),
	(8, 13, 22),
	(3, 14, 22),
	(8, 15, 23),
	(1, 16, 2),
	(7, 17, 23),
	(9, 18, 23),
	(5, 19, 1),
	(2, 20, 24),
	(4, 21, 24),
	(3, 22, 24),
	(3, 23, 1);

INSERT INTO Recompensa VALUES
	(NULL, 'Pouco ouro'),
	(NULL, 'Ouro legal'),
	(NULL, 'Muito ouro'),
	(NULL, 'Vai sair ricaço'),
	(NULL, 'Livro de Magias'),
	(NULL, 'Amuleto de Proteção'),
	(NULL, 'Espada sagrada'),
	(NULL, 'Arco sagrado'),
	(NULL, 'Escudo sagrado'),
	(NULL, 'Adagas sagradas'),
	(NULL, 'Armadura sagrada'),
	(NULL, 'Cajado sagrado'),
	(NULL, 'Machado sagrado'),
	(NULL, 'Martelo sagrado'),
	(NULL, 'Luvas sagradas'),
	(NULL, 'Botas sagradas');

INSERT INTO RuinaRecompensa VALUES
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 11),
	(2, 4),
	(2, 10),
	(2, 9),
	(2, 16),
	(3, 4),
	(3, 12),
	(3, 13),
	(3, 15),
	(4, 4),
	(4, 7),
	(4, 8),
	(4, 14),
	(5, 3),
	(5, 12),
	(5, 6),
	(6, 3),
	(6, 8),
	(6, 13),
	(7, 3),
	(7, 8),
	(7, 6),
	(8, 3),
	(8, 16),
	(8, 7),
	(9, 2),
	(9, 9),
	(10, 2),
	(10, 11),
	(11, 2),
	(11, 12),
	(12, 2),
	(12, 5),
	(13, 2),
	(13, 5),
	(14, 2),
	(14, 10),
	(15, 2),
	(15, 7),
	(16, 2),
	(16, 6),
	(17, 2),
	(17, 9),
	(18, 2),
	(18, 8),
	(19, 1),
	(19, 7),
	(20, 1),
	(20, 15),
	(21, 1),
	(22, 14),
	(23, 1),
	(24, 6);

INSERT INTO RuinaPessoa VALUES
	('445', 1, 2),
	('432', 6, 5),
	('429', 7, 5),
	('420', 8, 6),
	('433', 1, 1),
	('430', 9, 6),
	('441', 4, 7),
	('440', 10, 7),
	('442', 11, 8),
	('430', 12, 8),
	('412', 13, 9),
	('424', 2, 9),
	('430', 4, 10),
	('433', 14, 11),
	('447', 15, 12),
	('440', 2, 13),
	('439', 16, 13),
	('430', 5, 14),
	('422', 17, 14),
	('426', 18, 15),
	('428', 5, 16),
	('433', 19, 17),
	('431', 3, 18),
	('419', 3, 19),
	('437', 20, 20),
	('442', 21, 21),
	('437', 22, 22),
	('434', 23, 23),
	('430', 24, 24),
	('420', 25, 24),

INSERT INTO Grimorio VALUES
	(NULL, 'Grimório das Sombras', 1),
	(NULL, 'Livro dos Encantamentos', 2),
	(NULL, 'Tratado da Magia Arcana', 3),
	(NULL, 'Grimoire dos Elementos', 4),
	(NULL, 'Livro Proibido da Feitiçaria', 5),
	(NULL, 'Compendium dos Feitiços Antigos', 6),
	(NULL, 'Tomo da Sabedoria Oculta', 7),
	(NULL, 'Grimório dos Segredos Celestiais', 8),
	(NULL, 'Manual da Alquimia Mística', 9),
	(NULL, 'Livro das Invocações Profanas', 10),
	(NULL, 'Grimoire das Trevas Eternas', 11),
	(NULL, 'Codex dos Rituais Arcanos', 12),
	(NULL, 'Pergaminho dos Encantos Perdidos', 13),
	(NULL, 'Livro das Runas Divinas', 14),
	(NULL, 'Jorge', 15),
	(NULL, 'Livro do Fausto', 16),
	(NULL, 'Grimorio da Maria', 17),
	(NULL, 'Tomo dos Negócio', 18),
	(NULL, 'Livro de Figurinhas', 19),
	(NULL, 'Grimório da Sabedoria', 20),
	(NULL, 'Tomo dos Tomos', 21),
	(NULL, 'Livro dos Livros', 22),
	(NULL, 'Grimório dos Grimórios', 23),
	(NULL, 'Tomo Maneiro', 24),
	(NULL, 'Livro com Páginas', 25),
	(NULL, 'Grimório Mágico Gigantesco e Colossal', 26),
	(NULL, 'Tomo Dracônico', 27),
	(NULL, 'Livro Antigo Goblin', 28),
	(NULL, 'Grimório do Futuro', 29),
	(NULL, 'Tomo Invisível Pegando Fogo', 30);

INSERT INTO Magia VALUES
	(NULL, 'Arcano', 'Magia arcana'),
	(NULL, 'Fogo', 'Poder de controlar e criar fogo'),
	(NULL, 'Água', 'Poder de controlar e criar água'),
	(NULL, 'Terra', 'Poder de controlar e criar terra'),
	(NULL, 'Ar', 'Poder de controlar e criar ar'),
	(NULL, 'Trevas', 'Poder de controlar e criar as trevas'),
	(NULL, 'Luz', 'Poder de controlar e criar a luz'),
	(NULL, 'Cura', 'Poder de curar'),
	(NULL, 'Cristal mágico', 'Poder de criar cristais mágicos'),
	(NULL, 'Necromancia', 'Poder de reviver os mortos'),
	(NULL, 'Temporal', 'Poder de controlar o tempo'),
	(NULL, 'Escudo mágico', 'Poder de criar escudos mágicos'),
	(NULL, 'Teletransporte', 'Poder de teletransporte'),
	(NULL, 'Fortalecimento', 'Poder de fortalecer equipamentos e o próprio corpo'),
	(NULL, 'Ilusão', 'Poder de criar ilusões'),
	(NULL, 'Metamorfose', 'Poder de se metamorfar'),
	(NULL, 'Natureza', 'Poderes verdes'),
	(NULL, 'Gelo', 'Poder de controlar e criar gelo'),
	(NULL, 'Fada', 'Poderes de fada'),
	(NULL, 'Sangue', 'Poder de controlar e criar sangue'),
	(NULL, 'Pedra', 'Poder de controlar e criar pedra'),
	(NULL, 'Madeira', 'Poder de controlar e criar madeira'),
	(NULL, 'Insetos', 'Poderes de controlar insetos'),
	(NULL, 'Metal', 'Poder de controlar e criar metal'),
	(NULL, 'Criação', 'Poder de criar objetos'),
	(NULL, 'Magia ruim', 'Magia fraca e ruim');

INSERT INTO GrimorioMagia VALUES
	(1, 16),
	(1, 9),
	(2, 21),
	(2, 14),
	(3, 25),
	(3, 3),
	(4, 5),
	(4, 8),
	(5, 19),
	(5, 10),
	(6, 6),
	(6, 18),
	(7, 24),
	(7, 2),
	(8, 11),
	(8, 15),
	(9, 4),
	(9, 7),
	(10, 1),
	(10, 22),
	(11, 12),
	(11, 13),
	(12, 20),
	(12, 17),
	(13, 26),
	(13, 23),
	(14, 1),
	(14, 3),
	(15, 25),
	(15, 19),
	(16, 9),
	(16, 8),
	(17, 13),
	(17, 2),
	(18, 4),
	(18, 10),
	(19, 11),
	(19, 21),
	(20, 6),
	(20, 12),
	(21, 7),
	(21, 5),
	(22, 17),
	(22, 14),
	(23, 15),
	(23, 18),
	(24, 24),
	(24, 16),
	(25, 22),
	(25, 23),
	(26, 26),
	(26, 20),
	(27, 1),
	(27, 25),
	(28, 9),
	(28, 11),
	(29, 13),
	(29, 3),
	(30, 17),
	(30, 24);