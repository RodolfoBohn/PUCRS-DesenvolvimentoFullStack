-- Relação: Objeto da realidade representado no conjunto de elementos (tabela) por seus atributos (colunas)
-- Domínio: Características de determindado atributo (tipo, tamanho, restrições etc)

-- SQL: Structured Query Language, linguagem padrão para os SGBDs. Dividida em:
-- DDL: Data Definition Language: Comandos para criação e manutenção de objetos: create, alter, drop, rename, truncate
-- DML: Data Manipulation Language: Comandos para manipulações de dados (Insert, Update, Delete)
-- Recuperação de dados: comando Select
-- Controle de transações: Commit, rollback e savepoint
-- Controle de acesso a dados: Grant e Revoke

-- Tipos de dados:
-- Char (tamanho): Sequência de caracteres com tamanho fixo
-- Varchar (tamanho): Sequência de caracteres com tamanho variado
-- Number (total, decimais): armazena valor numérico, com ou sem decimais
-- Date: Armazena datas (pode incluir a hora)

-- Criação de tabela
CREATE TABLE VEICULOS
(
placa CHAR(8),
ano NUMBER(4),
km NUMBER(6),
marca VARCHAR(50),
modelo VARCHAR(50)
);

-- Inserindo dados
INSERT INTO VEICULOS
VALUES ('IJK-1212', 2022, 0, 'Chevrolet', 'Onix');

-- Repare também na especificação das colunas no segundo caso.
INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IJM-1556', 2015, 72045, 'Volkswagen', 'Gol');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IJA-1556', 2019, 72045, 'Volkswagen', 'Polo');

INSERT INTO VEICULOS
VALUES ('IJK-1218', 1999, 259450, 'Chevrolet', 'Corsa');

INSERT INTO VEICULOS
VALUES ('IJK-1912', 1999, 259450, 'Chevrolet', 'Kadett');

INSERT INTO VEICULOS
VALUES ('IJK-8594', 2011, 107000, 'Ford', 'Focus');

-- Consulta de dados

-- Todas as colunas
SELECT *
FROM VEICULOS

-- Algumas colunas
SELECT placa, modelo, ano
FROM VEICULOS

-- Adicionando condicional
SELECT placa, ano, modelo
FROM VEICULOS
WHERE ano < 2022

-- Atualização de dados
-- IMPORTANTE: Adicionar condicional WHERE, caso contrário atualiza todos os registros
UPDATE VEICULOS
SET modelo = 'Cruze'
WHERE placa = 'IJK-1212';

-- Manipulação com expressão aritmética
-- Ex: Experimente escrever o comando UPDATE para somar 100 quilômetros 
-- a todos os veículos cujos anos estão entre 2015 e 2021 (inclusive).

UPDATE VEICULOS
SET km = km + 100
WHERE ano >=2015
AND ano <=2021

-- Exclusão de dados
-- IMPORTANTE: Adicionar condicional WHERE, caso contrário remove todos os registros

DELETE FROM VEICULOS
WHERE placa = 'IJM-1556';

DELETE FROM VEICULOS
WHERE (marca = 'Chevrolet') AND (km > 50000);

-- Order By
SELECT placa, km
FROM VEICULOS
ORDER BY km;

SELECT placa, km
FROM VEICULOS
ORDER BY km;

SELECT marca, modelo
FROM VEICULOS
ORDER BY marca DESC, modelo ASC;

-- Count (função de agregação)
SELECT COUNT(*)
FROM VEICULOS;

--Distinct
SELECT DISTINCT marca
FROM VEICULOS;

-- Null (campo não obrigatório)
CREATE TABLE PESSOAS
(
cpf VARCHAR(20) NOT NULL,
nome VARCHAR(150) NOT NULL,
idade NUMBER(3) NULL,
endereco VARCHAR(150) -- o campo endereço é NULL implicitamente
);

-- ordem normal das colunas:
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('32809', 'Maria', 25, 'Rua A, 20');
-- outra ordem qualquer das colunas:
INSERT INTO PESSOAS (idade, endereco, cpf, nome)
VALUES (25, 'Rua A, 20', '30599', 'Pedro');
-- valores nulos:
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('29385', 'Carlos', NULL, NULL);
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('39582', 'Alice', 80, NULL);
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('78838', 'Antonio', NULL, 'Rua B, 80');
--omitir campos para valores null
INSERT INTO PESSOAS (cpf, nome)
VALUES ('90038', 'Ana Paula');
INSERT INTO PESSOAS (cpf, nome, idade)
VALUES ('23487', 'Patricia', 18);
INSERT INTO PESSOAS (cpf, nome, endereco)
VALUES ('23363', 'Jose', 'Rua C, 50');

-- Pessoas sem especificação de idade:
SELECT *
FROM PESSOAS
WHERE idade IS NULL;

-- Pessoas que forneceram algum endereço:
SELECT *
FROM PESSOAS
WHERE endereco IS NOT NULL;

--Operador like: usado para busca de textos:
-- Pessoas com nomes iniciando com a letra 'A':
SELECT *
FROM PESSOAS
WHERE nome LIKE 'A%';
-- Pessoas com nomes iniciando com 'Ana':
SELECT *
FROM PESSOAS
WHERE nome LIKE 'Ana%';
-- Pessoas com nomes que terminam com 'Silva':
SELECT *
FROM PESSOAS
WHERE nome LIKE '%Silva';
-- Pessoas com nomes que contenham 'Carlos':
SELECT *
FROM PESSOAS
WHERE nome LIKE '%Carlos%';
-- Pode corresponder a Maria ou Mario:
SELECT *
FROM PESSOAS
WHERE nome LIKE 'Mari_ da Silva';

-- Operador In: determina valor correspondente a qualquer valor da lista (possível fazer subquery)
-- Pessoas que tenham 25, 30 ou 40 anos de idade:
SELECT *
FROM PESSOAS
WHERE idade IN (25, 30, 40);

-- Alteração da estrutura da tabela: alter table
ALTER TABLE PESSOAS
DROP COLUMN idade;

ALTER TABLE PESSOAS
ADD sexo CHAR(1);

-- Manipulação de datas
INSERT INTO PESSOAS (cpf, nome, datanasc, endereco)
VALUES ('29048', 'Roberto', '03-FEB-1980', 'Rua D, 80');

-- Formato alternativo (padrão ANSI YYYY-MM-DD):
-- Deve-se acrescentar a palavra DATE antes da data.
INSERT INTO PESSOAS (cpf, nome, datanasc, endereco)
VALUES ('29048', 'Roberto', DATE '1980-02-03', 'Rua D, 80');

--To_char e To_date
SELECT TO_CHAR(SYSDATE, 'MONTH, DD, YYYY
HH24:MI:SS')
FROM DUAL;
-- DUAL é uma tabela interna do Oracle usada com
-- o comando SELECT quando não precisamos de uma
-- tabela real do banco de dados.

SELECT nome, TO_CHAR(datanasc, 'MONTH, DD, YYYY')
FROM PESSOAS;

INSERT INTO PESSOAS (cpf, nome,
datanasc, endereco)
VALUES (
'29920',
'Beto',
TO_DATE('25-FEB-1979 21:36:28',
'DD-MON-YYYY HH24:MI:SS'),
'Rua E, 80'
);

-- Funções aritméticas com datas
SELECT SYSDATE + 1
FROM DUAL

-- Integridade: Restrição de integridade de Entidade (Primary key e alternate keys)
CREATE TABLE ALUNOS
(
nroMatricula VARCHAR(10) NOT NULL,
cpf VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
nome VARCHAR(150) NOT NULL,
anoIngresso NUMBER(4) NOT NULL,
endereco VARCHAR(150) NULL,
sexo CHAR(1) NOT NULL,

CONSTRAINT PK_ALUNOS PRIMARY KEY (nroMatricula),
CONSTRAINT AK1_ALUNOS UNIQUE (cpf),
CONSTRAINT AK2_ALUNOS UNIQUE (email)
);

-- Domínio: Garantir que os dados armazenados respeitem os valores permitidos
ALTER TABLE ALUNOS
ADD CONSTRAINT CK_AnoIngr CHECK (anoIngresso > 2000);

ALTER TABLE ALUNOS
ADD CONSTRAINT CK_sexo CHECK (sexo IN ('M', 'F'));

-- Referencial: Garantir que os dados entre duas tabelas se relacionem corretamente
--Uso de Foreign Key (FK)
CREATE TABLE ESTADOS
(
uf CHAR(2) NOT NULL,
nome VARCHAR2(40) NOT NULL,
regiao CHAR(2) NOT NULL,
CONSTRAINT PK_ESTADOS PRIMARY KEY (uf)
);

CREATE TABLE CIDADES
(
cod_cidade NUMBER(4) NOT NULL,
nome VARCHAR2(60) NOT NULL,
uf CHAR(2) NOT NULL,
CONSTRAINT PK_CIDADES PRIMARY KEY (cod_cidade)
);

ALTER TABLE CIDADES
ADD
(
CONSTRAINT FK_EST_CID
FOREIGN KEY (uf)
REFERENCES ESTADOS (uf)
);

-- Relacionamento muitos pra muitos (n * n)
-- Utilizar tabela intermediária para o relacionamento
CREATE TABLE MEDICOS 
(
    crm char(6), 
    nome varchar(100), 
    especialidade varchar(50)
);

CREATE TABLE PACIENTES
(
    cpf char(11), 
    nome varchar(100), 
    sexo char(1)
);

ALTER TABLE MEDICOS 
ADD CONSTRAINT PK_MEDICOS PRIMARY KEY(crm)

ALTER TABLE PACIENTES 
ADD CONSTRAINT PK_PACIENTES PRIMARY KEY(cpf)

CREATE TABLE MEDICOSPACIENTES
(
    cpf char(11), 
    crm char(6),
    CONSTRAINT FK_MED_MEDPAC
    FOREIGN KEY (crm)
    REFERENCES MEDICOS (crm),
    CONSTRAINT FK_PAC_MEDPAC
    FOREIGN KEY (cpf)
    REFERENCES PACIENTES (cpf)
);

-- Join: consulta de 2 ou + tabelas, relacionando chaves estrangeiras e chaves primárias
SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST INNER JOIN CIDADES CID
ON EST.uf = CID.uf;

SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST LEFT OUTER JOIN CIDADES CID
ON EST.uf = CID.uf;

-- Podem ser encadeados
SELECT AU.nome, PROD.titulo
FROM AUTORES AU
JOIN AUTORES_PRODUTOS AP
ON (AU.cod_autor = AP.cod_autor)
JOIN PRODUTOS PROD
ON (AP.cod_produto = PROD.cod_produto);

-- Group by: Função agregadora para agrupar resultados em uma consulta
-- Usada em conjunto com funções sobre conjuntos de linha (sum, avg, count etc)
CREATE TABLE PRODS
(
codigo NUMERIC(3) NOT NULL,
nome VARCHAR(50) NOT NULL,
preco NUMERIC (5,2) NOT NULL,
tipo CHAR(1) NULL, -- [S]uprimento, [C]omponente, [P]eriférico
CONSTRAINT PK1 PRIMARY KEY (codigo)
);

INSERT INTO PRODS VALUES( 10, 'HD' ,200 ,'C');
INSERT INTO PRODS VALUES( 11, 'Memoria' ,250 ,'C');
INSERT INTO PRODS VALUES( 12, 'Impressora' ,680 ,'P');
INSERT INTO PRODS VALUES( 13, 'Processador' ,600 ,'C');
INSERT INTO PRODS VALUES( 14, 'DVD-RW' ,2 ,'S');
INSERT INTO PRODS VALUES( 15, 'Papel A4' ,19 ,'S');
INSERT INTO PRODS VALUES( 16, 'Scanner' ,199 ,'P');

ALTER TABLE PRODS ADD (usuario NUMBER(1) NULL);

UPDATE PRODS
SET usuario = 1
WHERE codigo IN (10,12,13,14);

UPDATE PRODS
SET usuario = 2
WHERE usuario IS NULL;

SELECT tipo, usuario, AVG(preco)
FROM PRODS
GROUP BY tipo, usuario
ORDER BY tipo, usuario;

UPDATE PRODS
SET usuario = 2
WHERE codigo = 14;

-- HAVING: clausula que determina as condições para o group by
SELECT CID.nome, COUNT(*) QTD
FROM CIDADES CID JOIN ENDERECOS END
ON CID.cod_cidade = END.cod_cidade
GROUP BY CID.nome
HAVING COUNT(*) > 10;

-- Subconsultas:
SELECT titulo
FROM PRODUTOS
WHERE preco >
            (SELECT preco
            FROM PRODUTOS
            WHERE cod_produto = 9)

INSERT INTO PRODS (codigo, nome, preco, tipo)
SELECT
cod_produto
SUBSTR(titulo, 1, 15),
preco,
'L' -- coluna constante para todos os registros
FROM produtos
WHERE
importado = 'N'
AND titulo LIKE 'A%'
AND cod_produto > 2;

UPDATE PRODUTOS
SET preco = preco - (10/100 * preco)
WHERE cod_produto IN
                  ( SELECT cod_produto
                    FROM PRODUTOS
                    WHERE prazo_entrega > 30 );

DELETE FROM PRODS
WHERE codigo IN
              ( SELECT cod_produto
                FROM PRODUTOS
                WHERE
                importado = 'N’
                AND titulo LIKE 'A%’
                AND cod_produto > 100 );

-- Indexação: visa acelerar a busca por determinado dado, estando ordenado 
-- em um arquivo diferente
-- PK automaticamente é um index no Oracle

CREATE INDEX idx_autores_nome ON AUTORES (nome);

-- Sequence: campo autoincremento sequencial
CREATE SEQUENCE seq_titulacoes START WITH 6 ;

CREATE TABLE TITULACOES
(
cod_titulacao NUMBER(4) DEFAULT seq_titulacoes.nextval NOT NULL,
titulo VARCHAR (20) NOT NULL,

CONSTRAINT pk_titulacoes PRIMARY KEY (cod_titulacao)
) ;

INSERT INTO TITULACOES ( titulo) VALUES (‘Bacharel’ );
INSERT INTO TITULACOES ( titulo) VALUES (‘Especialista’ );
INSERT INTO TITULACOES ( titulo) VALUES (‘Mestre’ );