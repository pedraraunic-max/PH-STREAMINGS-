#  Plataforma de Streaming - Projeto de Banco de Dados MySQL

##  Sobre o Projeto

Este projeto consiste no desenvolvimento de um Banco de Dados Relacional para uma plataforma de streaming de vídeos semelhante à Netflix, Disney+, Prime Video ou Max.

O sistema foi modelado para gerenciar usuários, planos de assinatura, conteúdos audiovisuais, categorias, histórico de reprodução, avaliações e dispositivos utilizados para acesso à plataforma.

O projeto foi desenvolvido seguindo os conceitos de modelagem relacional, normalização até a 3ª Forma Normal (3FN), integridade referencial e boas práticas de Banco de Dados.

---

#  Objetivo

Criar uma estrutura de banco de dados capaz de armazenar e gerenciar informações relacionadas ao funcionamento de uma plataforma de streaming, permitindo:

- Cadastro de usuários;
- Controle de assinaturas;
- Gerenciamento de conteúdos;
- Classificação por categorias;
- Registro de histórico de reprodução;
- Avaliações dos conteúdos;
- Controle de dispositivos cadastrados.

---

#  Tecnologias Utilizadas

- MySQL 8.0+
- MySQL Workbench
- SQL (DDL e DML)
- GitHub

---

#  Regras de Negócio

## Usuários

- Um usuário pode possuir apenas uma assinatura ativa por vez.
- Um usuário pode registrar vários dispositivos.
- Um usuário pode assistir diversos conteúdos.
- Um usuário pode avaliar vários conteúdos.

## Assinaturas

- Cada assinatura pertence a um único usuário.
- Um plano pode ser utilizado por vários usuários.

## Conteúdos

- Um conteúdo pode pertencer a várias categorias.
- Um conteúdo pode receber avaliações de diversos usuários.
- Um conteúdo pode ser assistido por diversos usuários.

## Histórico de Reprodução

Cada reprodução deve armazenar:

- Data da reprodução;
- Tempo assistido;
- Percentual de progresso.

---

#  Estrutura do Banco de Dados

O banco é composto por 9 tabelas principais:

| Tabela | Finalidade |
|----------|----------|
| Usuario | Armazena os usuários da plataforma |
| Plano | Armazena os planos de assinatura |
| Assinatura | Relaciona usuários aos planos |
| Conteudo | Armazena filmes, séries e documentários |
| Categoria | Categorias dos conteúdos |
| Conteudo_Categoria | Associação N:N entre conteúdos e categorias |
| Historico_Reproducao | Registro de visualizações |
| Avaliacao | Avaliações realizadas pelos usuários |
| Dispositivo | Dispositivos cadastrados pelos usuários |

---

# 🔗 Relacionamentos

## Relacionamento 1:1

### Usuario ↔ Assinatura

Um usuário possui apenas uma assinatura ativa.

```text
Usuario (1) -------- (1) Assinatura
```

---

## Relacionamentos 1:N

### Plano ↔ Assinatura

Um plano pode ser contratado por vários usuários.

```text
Plano (1) -------- (N) Assinatura
```

### Usuario ↔ Dispositivo

Um usuário pode cadastrar vários dispositivos.

```text
Usuario (1) -------- (N) Dispositivo
```

---

## Relacionamentos N:N

### Conteudo ↔ Categoria

Um conteúdo pode possuir várias categorias.

Uma categoria pode conter vários conteúdos.

```text
Conteudo (N) ---- Conteudo_Categoria ---- (N) Categoria
```

### Usuario ↔ Conteudo (Histórico)

Um usuário pode assistir vários conteúdos.

Um conteúdo pode ser assistido por vários usuários.

```text
Usuario (N) ---- Historico_Reproducao ---- (N) Conteudo
```

### Usuario ↔ Conteudo (Avaliação)

Um usuário pode avaliar vários conteúdos.

Um conteúdo pode receber várias avaliações.

```text
Usuario (N) ---- Avaliacao ---- (N) Conteudo
```

---

# 📊 Diagrama Entidade-Relacionamento (DER)

```text
Usuario
│
├── Assinatura ── Plano
│
├── Dispositivo
│
├── Historico_Reproducao ── Conteudo
│
└── Avaliacao ── Conteudo
                    │
                    │
             Conteudo_Categoria
                    │
                    │
                Categoria
```

---

#  Restrições Implementadas

## Chaves Primárias

Todas as tabelas possuem PRIMARY KEY.

Exemplo:

```sql
PRIMARY KEY (id_usuario)
```

---

## Chaves Estrangeiras

Garantem a integridade referencial.

Exemplo:

```sql
FOREIGN KEY (id_usuario)
REFERENCES Usuario(id_usuario)
```

---

## UNIQUE

Evita duplicidades.

Exemplo:

```sql
email VARCHAR(100) UNIQUE
```

---

## NOT NULL

Impede valores vazios.

Exemplo:

```sql
nome VARCHAR(100) NOT NULL
```

---

## CHECK

Validação de regras.

Exemplos:

```sql
CHECK (nota BETWEEN 1 AND 5)

CHECK (valor_mensal > 0)

CHECK (progresso_percentual BETWEEN 0 AND 100)
```

---

## DEFAULT

Valores automáticos.

Exemplos:

```sql
DEFAULT CURRENT_DATE

DEFAULT 'ATIVO'
```

---

#  Normalização

O banco foi normalizado até a Terceira Forma Normal (3FN).

## Primeira Forma Normal (1FN)

- Não existem grupos repetitivos.
- Todos os atributos são atômicos.

## Segunda Forma Normal (2FN)

- Todos os atributos dependem da chave primária inteira.

## Terceira Forma Normal (3FN)

- Não existem dependências transitivas.
- Cada atributo depende apenas da chave primária.

---

#  Consultas Implementadas

O projeto possui consultas utilizando:

- SELECT
- WHERE
- ORDER BY
- LIKE
- BETWEEN
- DISTINCT
- LIMIT
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- COUNT()
- AVG()
- MAX()
- MIN()
- Subqueries

---

#  Como Executar

## 1. Criar o Banco

Execute o script SQL:

```sql
CREATE DATABASE streaming_db;
```

---

## 2. Selecionar o Banco

```sql
USE streaming_db;
```

---

## 3. Executar o Script Completo

Importe ou execute:

```sql
Projeto_Streaming_Completo.sql
```

---

## 4. Verificar os Dados

Exemplo:

```sql
SELECT * FROM Usuario;

SELECT * FROM Conteudo;

SELECT * FROM Plano;
```

---

# 📁 Estrutura do Projeto

```text
Projeto-Streaming/
│
├── README.md
│
├── sql/
│   └── Projeto_Streaming_Completo.sql
│
├── docs/
│   └── Projeto_Streaming_Documentacao.docx
│
└── imagens/
    └── DER.png
```

---

# 👨‍🎓 Autor

Projeto desenvolvido para fins acadêmicos na disciplina de Banco de Dados Relacional, aplicando conceitos de modelagem conceitual, lógica e física utilizando MySQL.

---

# ✅ Resultados Obtidos

O banco de dados permite:

✔ Cadastro de usuários

✔ Controle de assinaturas

✔ Gerenciamento de planos

✔ Cadastro de conteúdos

✔ Classificação por categorias

✔ Histórico de reprodução

✔ Avaliações dos usuários

✔ Controle de dispositivos

✔ Consultas analíticas e operacionais

✔ Integridade referencial garantida
