
CREATE DATABASE IF NOT EXISTS streaming_ph;
USE streaming_ph;

CREATE TABLE Plano (
 id_plano INT PRIMARY KEY,
 nome_plano VARCHAR(30) UNIQUE NOT NULL,
 valor_mensal DECIMAL(8,2) NOT NULL CHECK (valor_mensal > 0),
 qualidade_video VARCHAR(20) NOT NULL,
 quantidade_telas INT NOT NULL CHECK (quantidade_telas BETWEEN 1 AND 10)
);

CREATE TABLE Usuario (
 id_usuario INT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 email VARCHAR(120) UNIQUE NOT NULL,
 senha VARCHAR(255) NOT NULL,
 data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
 status VARCHAR(15) NOT NULL DEFAULT 'ATIVO'
);

CREATE TABLE Assinatura (
 id_assinatura INT PRIMARY KEY,
 id_usuario INT UNIQUE NOT NULL,
 id_plano INT NOT NULL,
 data_inicio DATE NOT NULL,
 data_fim DATE,
 status VARCHAR(15) NOT NULL,
 FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
   ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY (id_plano) REFERENCES Plano(id_plano)
   ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Conteudo (
 id_conteudo INT PRIMARY KEY,
 titulo VARCHAR(150) NOT NULL,
 tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('Filme','Serie','Documentario')),
 ano_lancamento INT,
 classificacao_indicativa VARCHAR(10),
 duracao INT CHECK (duracao > 0)
);

CREATE TABLE Categoria (
 id_categoria INT PRIMARY KEY,
 nome_categoria VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE Conteudo_Categoria (
 id_conteudo INT,
 id_categoria INT,
 PRIMARY KEY(id_conteudo,id_categoria),
 FOREIGN KEY (id_conteudo) REFERENCES Conteudo(id_conteudo)
   ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
   ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Historico_Reproducao (
 id_historico INT PRIMARY KEY,
 id_usuario INT NOT NULL,
 id_conteudo INT NOT NULL,
 data_reproducao DATETIME NOT NULL,
 progresso_percentual DECIMAL(5,2) CHECK (progresso_percentual BETWEEN 0 AND 100),
 tempo_assistido INT NOT NULL,
 FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
   ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY (id_conteudo) REFERENCES Conteudo(id_conteudo)
   ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Avaliacao (
 id_avaliacao INT PRIMARY KEY,
 id_usuario INT NOT NULL,
 id_conteudo INT NOT NULL,
 nota INT CHECK (nota BETWEEN 1 AND 5),
 comentario VARCHAR(255),
 data_avaliacao DATE,
 FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
   ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY (id_conteudo) REFERENCES Conteudo(id_conteudo)
   ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Dispositivo (
 id_dispositivo INT PRIMARY KEY,
 id_usuario INT NOT NULL,
 tipo_dispositivo VARCHAR(40) NOT NULL,
 sistema_operacional VARCHAR(40) NOT NULL,
 data_registro DATE DEFAULT (CURRENT_DATE),
 FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
   ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Plano VALUES
(1,'Basico',19.90,'HD',1),(2,'Padrao',29.90,'FullHD',2),(3,'Premium',49.90,'4K',4),
(4,'Familia',59.90,'4K',6),(5,'Mobile',14.90,'HD',1),
(6,'Estudante',17.90,'HD',1),(7,'Plus',39.90,'FullHD',3),(8,'Ultra',69.90,'8K',8),
(9,'Kids',24.90,'HD',2),(10,'Anual',199.90,'4K',4),
(11,'Start',9.90,'SD',1),(12,'Gold',54.90,'4K',5),(13,'Silver',34.90,'FullHD',2),
(14,'Black',79.90,'8K',10),(15,'Flex',27.90,'HD',2);

INSERT INTO Usuario VALUES
(1,'Usuario 1','u1@email.com','s1','2025-01-01','ATIVO'),
(2,'Usuario 2','u2@email.com','s2','2025-01-02','ATIVO'),
(3,'Usuario 3','u3@email.com','s3','2025-01-03','ATIVO'),
(4,'Usuario 4','u4@email.com','s4','2025-01-04','ATIVO'),
(5,'Usuario 5','u5@email.com','s5','2025-01-05','ATIVO'),
(6,'Usuario 6','u6@email.com','s6','2025-01-06','ATIVO'),
(7,'Usuario 7','u7@email.com','s7','ATIVO','ATIVO');
