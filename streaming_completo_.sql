-- ============================================================
--  STREAMING_DB  |  Script completo de criação e carga
--  Gerado em: 2026-06-09
-- ============================================================

CREATE DATABASE IF NOT EXISTS streaming_db;
USE streaming_db;

-- ============================================================
-- TABELAS
-- ============================================================

CREATE TABLE `plano` (
  `id_plano`         INT          NOT NULL,
  `nome_plano`       VARCHAR(30)  NOT NULL,
  `valor_mensal`     DECIMAL(8,2) NOT NULL,
  `qualidade_video`  VARCHAR(20)  NOT NULL,
  `quantidade_telas` INT          NOT NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE KEY `nome_plano` (`nome_plano`),
  CONSTRAINT `plano_chk_1` CHECK (`valor_mensal` > 0),
  CONSTRAINT `plano_chk_2` CHECK (`quantidade_telas` BETWEEN 1 AND 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------

CREATE TABLE `usuario` (
  `id_usuario`    INT          NOT NULL,
  `nome`          VARCHAR(100) NOT NULL,
  `email`         VARCHAR(120) NOT NULL,
  `senha`         VARCHAR(255) NOT NULL,
  `data_cadastro` DATE         DEFAULT (CURDATE()),
  `status`        VARCHAR(15)  NOT NULL DEFAULT 'ATIVO',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------

CREATE TABLE `assinatura` (
  `id_assinatura` INT         NOT NULL,
  `id_usuario`    INT         NOT NULL,
  `id_plano`      INT         NOT NULL,
  `data_inicio`   DATE        NOT NULL,
  `data_fim`      DATE        DEFAULT NULL,
  `status`        VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_assinatura`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  KEY `id_plano` (`id_plano`),
  CONSTRAINT `assinatura_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assinatura_ibfk_2` FOREIGN KEY (`id_plano`) REFERENCES `plano` (`id_plano`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------

CREATE TABLE `conteudo` (
  `id_conteudo`             INT          NOT NULL,
  `titulo`                  VARCHAR(150) NOT NULL,
  `tipo`                    VARCHAR(20)  DEFAULT NULL,
  `ano_lancamento`          INT          DEFAULT NULL,
  `classificacao_indicativa` VARCHAR(10) DEFAULT NULL,
  `duracao`                 INT          DEFAULT NULL,
  PRIMARY KEY (`id_conteudo`),
  CONSTRAINT `conteudo_chk_1` CHECK (`tipo` IN ('Filme','Serie','Documentario')),
  CONSTRAINT `conteudo_chk_2` CHECK (`duracao` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------

CREATE TABLE `categoria` (
  `id_categoria`   INT         NOT NULL,
  `nome_categoria` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nome_categoria` (`nome_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------

CREATE TABLE `conteudo_categoria` (
  `id_conteudo`  INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_conteudo`, `id_categoria`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `conteudo_categoria_ibfk_1` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudo` (`id_conteudo`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conteudo_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------

CREATE TABLE `historico_reproducao` (
  `id_historico`         INT            NOT NULL,
  `id_usuario`           INT            NOT NULL,
  `id_conteudo`          INT            NOT NULL,
  `data_reproducao`      DATETIME       NOT NULL,
  `progresso_percentual` DECIMAL(5,2)   DEFAULT NULL,
  `tempo_assistido`      INT            NOT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `id_usuario`  (`id_usuario`),
  KEY `id_conteudo` (`id_conteudo`),
  CONSTRAINT `historico_reproducao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historico_reproducao_ibfk_2` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudo` (`id_conteudo`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historico_reproducao_chk_1` CHECK (`progresso_percentual` BETWEEN 0 AND 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------

CREATE TABLE `avaliacao` (
  `id_avaliacao`   INT          NOT NULL,
  `id_usuario`     INT          NOT NULL,
  `id_conteudo`    INT          NOT NULL,
  `nota`           INT          DEFAULT NULL,
  `comentario`     VARCHAR(255) DEFAULT NULL,
  `data_avaliacao` DATE         DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `id_usuario`  (`id_usuario`),
  KEY `id_conteudo` (`id_conteudo`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudo` (`id_conteudo`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `avaliacao_chk_1` CHECK (`nota` BETWEEN 1 AND 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------

CREATE TABLE `dispositivo` (
  `id_dispositivo`     INT         NOT NULL,
  `id_usuario`         INT         NOT NULL,
  `tipo_dispositivo`   VARCHAR(40) NOT NULL,
  `sistema_operacional` VARCHAR(40) NOT NULL,
  `data_registro`      DATE        DEFAULT (CURDATE()),
  PRIMARY KEY (`id_dispositivo`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `dispositivo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- ============================================================
-- INSERÇÕES  (ordem respeita as FK)
-- ============================================================

-- Plano
INSERT INTO `plano` VALUES
  (1, 'Plano1',  10.90, 'HD', 2),
  (2, 'Plano2',  11.90, 'HD', 3),
  (3, 'Plano3',  12.90, 'HD', 4),
  (4, 'Plano4',  13.90, 'HD', 5),
  (5, 'Plano5',  14.90, 'HD', 1),
  (6, 'Plano6',  15.90, 'HD', 2),
  (7, 'Plano7',  16.90, 'HD', 3),
  (8, 'Plano8',  17.90, 'HD', 4),
  (9, 'Plano9',  18.90, 'HD', 5),
  (10,'Plano10', 19.90, 'HD', 1),
  (11,'Plano11', 20.90, 'HD', 2),
  (12,'Plano12', 21.90, 'HD', 3),
  (13,'Plano13', 22.90, 'HD', 4),
  (14,'Plano14', 23.90, 'HD', 5),
  (15,'Plano15', 24.90, 'HD', 1);

-- Usuario
INSERT INTO `usuario` VALUES
  (1,  'Ana Souza',        'u1@mail.com',  'senha1',  '2025-01-01', 'ATIVO'),
  (2,  'Bruno Almeida',    'u2@mail.com',  'senha2',  '2025-01-02', 'ATIVO'),
  (3,  'Carla Mendes',     'u3@mail.com',  'senha3',  '2025-01-03', 'ATIVO'),
  (4,  'Diego Santos',     'u4@mail.com',  'senha4',  '2025-01-04', 'ATIVO'),
  (5,  'Eduarda Lima',     'u5@mail.com',  'senha5',  '2025-01-05', 'ATIVO'),
  (6,  'Felipe Costa',     'u6@mail.com',  'senha6',  '2025-01-06', 'ATIVO'),
  (7,  'Gabriela Rocha',   'u7@mail.com',  'senha7',  '2025-01-07', 'ATIVO'),
  (8,  'Henrique Martins', 'u8@mail.com',  'senha8',  '2025-01-08', 'ATIVO'),
  (9,  'Isabela Oliveira', 'u9@mail.com',  'senha9',  '2025-01-09', 'ATIVO'),
  (10, 'João Pereira',     'u10@mail.com', 'senha10', '2025-01-10', 'ATIVO'),
  (11, 'Karen Ribeiro',    'u11@mail.com', 'senha11', '2025-01-11', 'ATIVO'),
  (12, 'Lucas Ferreira',   'u12@mail.com', 'senha12', '2025-01-12', 'ATIVO'),
  (13, 'Mariana Gomes',    'u13@mail.com', 'senha13', '2025-01-13', 'ATIVO'),
  (14, 'Nicolas Barbosa',  'u14@mail.com', 'senha14', '2025-01-14', 'ATIVO'),
  (15, 'Patrícia Teixeira','u15@mail.com', 'senha15', '2025-01-15', 'ATIVO');

-- Assinatura
INSERT INTO `assinatura` VALUES
  (1,  1,  1,  '2025-02-01', NULL, 'ATIVA'),
  (2,  2,  2,  '2025-02-02', NULL, 'ATIVA'),
  (3,  3,  3,  '2025-02-03', NULL, 'ATIVA'),
  (4,  4,  4,  '2025-02-04', NULL, 'ATIVA'),
  (5,  5,  5,  '2025-02-05', NULL, 'ATIVA'),
  (6,  6,  6,  '2025-02-06', NULL, 'ATIVA'),
  (7,  7,  7,  '2025-02-07', NULL, 'ATIVA'),
  (8,  8,  8,  '2025-02-08', NULL, 'ATIVA'),
  (9,  9,  9,  '2025-02-09', NULL, 'ATIVA'),
  (10, 10, 10, '2025-02-10', NULL, 'ATIVA'),
  (11, 11, 11, '2025-02-11', NULL, 'ATIVA'),
  (12, 12, 12, '2025-02-12', NULL, 'ATIVA'),
  (13, 13, 13, '2025-02-13', NULL, 'ATIVA'),
  (14, 14, 14, '2025-02-14', NULL, 'ATIVA'),
  (15, 15, 15, '2025-02-15', NULL, 'ATIVA');

-- Conteudo
INSERT INTO `conteudo` VALUES
  (1,  'Horizonte Final',      'Filme',        2011, '12', 90),
  (2,  'Cidade das Sombras',   'Serie',        2012, '16', 90),
  (3,  'Mistérios do Oceano',  'Documentario', 2013, 'L',  90),
  (4,  'Código Ômega',         'Filme',        2014, '14', 90),
  (5,  'A Última Fronteira',   'Serie',        2015, '12', 90),
  (6,  'Expresso Noturno',     'Filme',        2016, '16', 90),
  (7,  'Entre Estrelas',       'Documentario', 2017, '10', 90),
  (8,  'Legado Perdido',       'Serie',        2018, '14', 90),
  (9,  'Projeto Atlas',        'Filme',        2019, '12', 90),
  (10, 'No Limite do Tempo',   'Serie',        2020, '18', 90),
  (11, 'Guardiões do Norte',   'Filme',        2021, '14', 90),
  (12, 'A Ilha Esquecida',     'Documentario', 2022, 'L',  90),
  (13, 'Ecos do Passado',      'Serie',        2023, '16', 90),
  (14, 'Operação Eclipse',     'Filme',        2024, '18', 90),
  (15, 'Rota 51',              'Documentario', 2025, '10', 90);

-- Categoria
INSERT INTO `categoria` VALUES
  (1,  'Ação'),
  (2,  'Drama'),
  (3,  'Comédia'),
  (4,  'Terror'),
  (5,  'Ficção Científica'),
  (6,  'Romance'),
  (7,  'Aventura'),
  (8,  'Fantasia'),
  (9,  'Crime'),
  (10, 'História'),
  (11, 'Música'),
  (12, 'Esporte'),
  (13, 'Infantil'),
  (14, 'Natureza'),
  (15, 'Tecnologia');

-- Conteudo_Categoria
INSERT INTO `conteudo_categoria` VALUES
  (1,1),(2,2),(3,3),(4,4),(5,5),
  (6,6),(7,7),(8,8),(9,9),(10,10),
  (11,11),(12,12),(13,13),(14,14),(15,15);

-- Historico_Reproducao
INSERT INTO `historico_reproducao` VALUES
  (1,  1,  1,  '2025-03-01 20:00:00', 51.00, 31),
  (2,  2,  2,  '2025-03-02 20:00:00', 52.00, 32),
  (3,  3,  3,  '2025-03-03 20:00:00', 53.00, 33),
  (4,  4,  4,  '2025-03-04 20:00:00', 54.00, 34),
  (5,  5,  5,  '2025-03-05 20:00:00', 55.00, 35),
  (6,  6,  6,  '2025-03-06 20:00:00', 56.00, 36),
  (7,  7,  7,  '2025-03-07 20:00:00', 57.00, 37),
  (8,  8,  8,  '2025-03-08 20:00:00', 58.00, 38),
  (9,  9,  9,  '2025-03-09 20:00:00', 59.00, 39),
  (10, 10, 10, '2025-03-10 20:00:00', 60.00, 40),
  (11, 11, 11, '2025-03-11 20:00:00', 61.00, 41),
  (12, 12, 12, '2025-03-12 20:00:00', 62.00, 42),
  (13, 13, 13, '2025-03-13 20:00:00', 63.00, 43),
  (14, 14, 14, '2025-03-14 20:00:00', 64.00, 44),
  (15, 15, 15, '2025-03-15 20:00:00', 65.00, 45);

-- Avaliacao
INSERT INTO `avaliacao` VALUES
  (1,  1,  1,  2, 'Excelente produção.',              '2025-04-01'),
  (2,  2,  2,  3, 'Roteiro muito envolvente.',         '2025-04-02'),
  (3,  3,  3,  4, 'Fotografia impressionante.',        '2025-04-03'),
  (4,  4,  4,  5, 'Gostei da atuação principal.',      '2025-04-04'),
  (5,  5,  5,  1, 'Documentário muito informativo.',   '2025-04-05'),
  (6,  6,  6,  2, 'Final surpreendente.',              '2025-04-06'),
  (7,  7,  7,  3, 'Boa opção para maratonar.',         '2025-04-07'),
  (8,  8,  8,  4, 'Trilha sonora marcante.',           '2025-04-08'),
  (9,  9,  9,  5, 'Personagens bem construídos.',      '2025-04-09'),
  (10, 10, 10, 1, 'Narrativa criativa.',               '2025-04-10'),
  (11, 11, 11, 2, 'Muito divertido.',                  '2025-04-11'),
  (12, 12, 12, 3, 'Poderia ser mais curto.',           '2025-04-12'),
  (13, 13, 13, 4, 'Ótima direção.',                    '2025-04-13'),
  (14, 14, 14, 5, 'Vale a recomendação.',              '2025-04-14'),
  (15, 15, 15, 1, 'Assisti novamente e gostei mais.',  '2025-04-15');

-- Dispositivo
INSERT INTO `dispositivo` VALUES
  (1,  1,  'Smart TV',   'Android TV',    '2025-05-01'),
  (2,  2,  'Smartphone', 'Android',       '2025-05-02'),
  (3,  3,  'iPhone',     'iOS',           '2025-05-03'),
  (4,  4,  'Notebook',   'Windows',       '2025-05-04'),
  (5,  5,  'Desktop',    'Linux',         '2025-05-05'),
  (6,  6,  'Tablet',     'Android',       '2025-05-06'),
  (7,  7,  'Smart TV',   'webOS',         '2025-05-07'),
  (8,  8,  'Videogame',  'PlayStation OS','2025-05-08'),
  (9,  9,  'Notebook',   'macOS',         '2025-05-09'),
  (10, 10, 'Smartphone', 'Android',       '2025-05-10'),
  (11, 11, 'Tablet',     'iPadOS',        '2025-05-11'),
  (12, 12, 'Desktop',    'Windows',       '2025-05-12'),
  (13, 13, 'Smart TV',   'Tizen',         '2025-05-13'),
  (14, 14, 'Notebook',   'Ubuntu',        '2025-05-14'),
  (15, 15, 'Videogame',  'Xbox OS',       '2025-05-15');

-- ============================================================
-- FIM DO SCRIPT
-- ============================================================
