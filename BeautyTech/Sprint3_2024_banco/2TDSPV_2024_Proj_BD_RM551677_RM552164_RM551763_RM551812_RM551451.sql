-- APAGANDO AS TABELAS

DROP TABLE bt_acesso CASCADE CONSTRAINTS;

DROP TABLE bt_categoria CASCADE CONSTRAINTS;

DROP TABLE bt_cliente CASCADE CONSTRAINTS;

DROP TABLE bt_empresa CASCADE CONSTRAINTS;

DROP TABLE bt_empresa_produto CASCADE CONSTRAINTS;

DROP TABLE bt_endereco CASCADE CONSTRAINTS;

DROP TABLE bt_endereco_cliente CASCADE CONSTRAINTS;

DROP TABLE bt_genero CASCADE CONSTRAINTS;

DROP TABLE bt_produto CASCADE CONSTRAINTS;

DROP TABLE bt_produto_categoria CASCADE CONSTRAINTS;

DROP TABLE bt_telefone CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CRIANDO TABELAS
CREATE TABLE bt_acesso (
    id_acesso  NUMBER(10) NOT NULL,
    id_cliente NUMBER(10) NOT NULL,
    id_produto NUMBER(10) NOT NULL
);

COMMENT ON COLUMN bt_acesso.id_acesso IS
    'Esse atributo recebe o id de acesso e é chave primária da tabela';

COMMENT ON COLUMN bt_acesso.id_cliente IS
    'Esse atributo recebe a chave primária da tabela cliente e é FK na tabela acesso.';

COMMENT ON COLUMN bt_acesso.id_produto IS
    'Esse atributo recebe a chave primária da tabela produto e é FK da tabela acesso.';

ALTER TABLE bt_acesso ADD CONSTRAINT bt_acesso_pk PRIMARY KEY ( id_acesso );

CREATE TABLE bt_categoria (
    id_categoria   NUMBER(10) NOT NULL,
    nm_categoria   VARCHAR2(50) NOT NULL,
    desc_categoria VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN bt_categoria.id_categoria IS
    'Esse atributo recebe o id da categoria e é a chave primária da tabela.';

COMMENT ON COLUMN bt_categoria.nm_categoria IS
    'Esse atributo recebe o nome da categoria e é obrigatório.';

COMMENT ON COLUMN bt_categoria.desc_categoria IS
    'Esse atributo recebe a descrição da categoria e é obrigatório.';

ALTER TABLE bt_categoria ADD CONSTRAINT bt_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE bt_cliente (
    id_cliente            NUMBER(10) NOT NULL,
    id_telefone           NUMBER(10) NOT NULL,
    id_genero             NUMBER(10) NOT NULL,
    cpf_cliente           VARCHAR2(11) NOT NULL,
    nm_cliente            VARCHAR2(150) NOT NULL,
    email_cliente         VARCHAR2(100) NOT NULL,
    dt_nascimento_cliente DATE NOT NULL,
    estado_civil_cliente  VARCHAR2(30) NOT NULL,
    dt_cadastro           DATE NOT NULL,
    dt_exclusao           DATE
);

COMMENT ON COLUMN bt_cliente.id_cliente IS
    'Esse atributo recebe o código do cliente e é a chave primária da tabela.';

COMMENT ON COLUMN bt_cliente.id_telefone IS
    'Esse atributo recebe a chave primária da tabela telefone e é FK na tabela cliente';

COMMENT ON COLUMN bt_cliente.id_genero IS
    'Esse atributo recebe a chave primária da tabela id_genero e é FK na tabela cliente.';

COMMENT ON COLUMN bt_cliente.cpf_cliente IS
    'Esse atributo recebe o CPF d o cliente e é obrigatório';

COMMENT ON COLUMN bt_cliente.nm_cliente IS
    'Esse atributo recebe o nome do cliente e é obrigatório.';

COMMENT ON COLUMN bt_cliente.email_cliente IS
    'Esse atributo recebe o e-mail do cliente e não é obrigatório.';

COMMENT ON COLUMN bt_cliente.dt_nascimento_cliente IS
    'Esse atributo recebe a data de nascimento do cliente e é obrigatório.';

COMMENT ON COLUMN bt_cliente.estado_civil_cliente IS
    'Esse atributo recebe o estado civil do cliente e é obrigatório.';

COMMENT ON COLUMN bt_cliente.dt_cadastro IS
    'Esse atributo recebe a data em que o cliente foi cadastrado e é obrigatório.';

COMMENT ON COLUMN bt_cliente.dt_exclusao IS
    'Esse atributo recebe a data de exclusão do cliente e não é obrigatório.';

ALTER TABLE bt_cliente ADD CONSTRAINT bt_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE bt_empresa (
    id_empresa   NUMBER(10) NOT NULL,
    nm_empresa   VARCHAR2(50) NOT NULL,
    cnpj_empresa VARCHAR2(18) NOT NULL,
    desc_empresa VARCHAR2(300) NOT NULL
);

COMMENT ON COLUMN bt_empresa.id_empresa IS
    'Esse atributo recebe o id da empresa e é chave primaria da tabela.';

COMMENT ON COLUMN bt_empresa.nm_empresa IS
    'Esse atributo recebe o nome da tabela e é obrigatório.';

COMMENT ON COLUMN bt_empresa.cnpj_empresa IS
    'Esse atributo recebe o CNPJ da empresa e é obrigatório.';

COMMENT ON COLUMN bt_empresa.desc_empresa IS
    'Esse atributo recebe a descrição da empresa e é obrigatório.';

ALTER TABLE bt_empresa ADD CONSTRAINT bt_empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE bt_empresa_produto (
    id_empresa_produto NUMBER(10) NOT NULL,
    id_empresa         NUMBER(10) NOT NULL,
    id_produto         NUMBER(10) NOT NULL
);

COMMENT ON COLUMN bt_empresa_produto.id_empresa_produto IS
    'Esse atributo recebe o id empres produto e é chave primária da tabela';

COMMENT ON COLUMN bt_empresa_produto.id_empresa IS
    'Esse atributo recebe a chave primária da tabela empresa e é FK na tabela empresa produto.';

COMMENT ON COLUMN bt_empresa_produto.id_produto IS
    'Esse atributo recebe a chave primária da tabela produto e é FK na tabela empresa produto.';

ALTER TABLE bt_empresa_produto ADD CONSTRAINT bt_empresa_produto_pk PRIMARY KEY ( id_empresa_produto );

CREATE TABLE bt_endereco (
    id_endereco          NUMBER(10) NOT NULL,
    id_empresa           NUMBER(10) NOT NULL,
    uf_endereco          VARCHAR2(100) NOT NULL,
    cidade_endereco      VARCHAR2(250) NOT NULL,
    bairro_endereco      VARCHAR2(50) NOT NULL,
    logradouro_endereco  VARCHAR2(150) NOT NULL,
    nr_endereco          NUMBER(6) NOT NULL,
    complemento_endereco VARCHAR2(50)
);

COMMENT ON COLUMN bt_endereco.id_endereco IS
    'Esse atributo recebe o código do endereço e é a chave primária da tabela.';

COMMENT ON COLUMN bt_endereco.id_empresa IS
    'Esse atributo recebe a chave primária da tabela empresa e é FK na tabela endereco.';

COMMENT ON COLUMN bt_endereco.uf_endereco IS
    'Esse atributo recebe a UF do endereço e é obrigatório.';

COMMENT ON COLUMN bt_endereco.cidade_endereco IS
    'Esse atributo recebe a cidade do endereço e é obrigatório.';

COMMENT ON COLUMN bt_endereco.bairro_endereco IS
    'Esse atributo recebe o bairro do endereço e é obrigatório';

COMMENT ON COLUMN bt_endereco.logradouro_endereco IS
    'Esse atributo recebe o logradouro e é obrigatório.';

COMMENT ON COLUMN bt_endereco.nr_endereco IS
    'Esse atributo recebe o número do logradouro e é obrigatório.';

COMMENT ON COLUMN bt_endereco.complemento_endereco IS
    'Esse atributo recebe o complemento e é obrigatório';

ALTER TABLE bt_endereco ADD CONSTRAINT bt_endereco_pk PRIMARY KEY ( id_endereco );

CREATE TABLE bt_endereco_cliente (
    id_endereco_cliente NUMBER(10) NOT NULL,
    id_endereco         NUMBER(10) NOT NULL,
    id_cliente          NUMBER(10) NOT NULL
);

COMMENT ON COLUMN bt_endereco_cliente.id_endereco_cliente IS
    'Esse atributo recebe o id endereco e cliente e é a chave primária da tabela.';

COMMENT ON COLUMN bt_endereco_cliente.id_endereco IS
    'Esse atributo recebe a chave primária da tabela endereço e é FK na tabela endereço cliente.';

COMMENT ON COLUMN bt_endereco_cliente.id_cliente IS
    'Esse atributo recebe a o id cliente, é chave primária na tabela cliente e é FK na tabela endereço cliente.';

ALTER TABLE bt_endereco_cliente ADD CONSTRAINT bt_endereco_cliente_pk PRIMARY KEY ( id_endereco_cliente );

CREATE TABLE bt_genero (
    id_genero   NUMBER(10) NOT NULL,
    nm_genero   VARCHAR2(50) NOT NULL,
    desc_genero VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN bt_genero.id_genero IS
    'Esse atributo será a chave primária da tabela de genero, sendo obrigatório';

COMMENT ON COLUMN bt_genero.nm_genero IS
    'Esse atributo será responsável pelo nome do genero da tabela, sendo obrigatório o seu valor';

COMMENT ON COLUMN bt_genero.desc_genero IS
    'Esse atributo recebe a descrição do gênero e é obrigatório.';

ALTER TABLE bt_genero ADD CONSTRAINT bt_genero_pk PRIMARY KEY ( id_genero );

CREATE TABLE bt_produto (
    id_produto     NUMBER(10) NOT NULL,
    nm_produto     VARCHAR2(150) NOT NULL,
    desc_produto   VARCHAR2(150) NOT NULL,
    vl_produto     NUMBER(8, 2) NOT NULL,
    dt_fab_produto DATE NOT NULL,
    dt_validade    DATE NOT NULL,
    dt_cadastro    DATE NOT NULL,
    img_produto    VARCHAR2(300) NOT NULL
);

COMMENT ON COLUMN bt_produto.id_produto IS
    'Esse atributo recebe o id do produto e é a chave primária da tabela';

COMMENT ON COLUMN bt_produto.nm_produto IS
    'Esse atributo recebe o nome do produto e é obrigatório.';

COMMENT ON COLUMN bt_produto.desc_produto IS
    'Esse atributo recebe a descrição do produto e é obrigatório.';

COMMENT ON COLUMN bt_produto.vl_produto IS
    'Esse produto recebe o valor do produto e é obrigatório.';

COMMENT ON COLUMN bt_produto.dt_fab_produto IS
    'Esse atributo recebe a data de fabricação do produto e é obrigatório.';

COMMENT ON COLUMN bt_produto.dt_validade IS
    'Esse atributo recebe a data de validade do produto e é obrigatório.';

COMMENT ON COLUMN bt_produto.dt_cadastro IS
    'Esse atributo recebe a data de cadastro do produto e é obrigatório.';

COMMENT ON COLUMN bt_produto.img_produto IS
    'Esse atributo recebe a imagem do produto e é obrigatório.';

ALTER TABLE bt_produto ADD CONSTRAINT bt_produto_pk PRIMARY KEY ( id_produto );

CREATE TABLE bt_produto_categoria (
    id_produto_categoria NUMBER(10) NOT NULL,
    id_categoria         NUMBER(10) NOT NULL,
    id_produto           NUMBER(10) NOT NULL
);

COMMENT ON COLUMN bt_produto_categoria.id_produto_categoria IS
    'Esse atributo recebe o id produto categoria e é chave primária da tabela.';

COMMENT ON COLUMN bt_produto_categoria.id_categoria IS
    'Esse atributo recebe a chave primária da tabela cateogoria e é FK na tabela produto categoria.';

COMMENT ON COLUMN bt_produto_categoria.id_produto IS
    'Esse produto recebe a chave primária da tabela produto e é FK na tabela produto categoria.';

ALTER TABLE bt_produto_categoria ADD CONSTRAINT bt_produto_categoria_pk PRIMARY KEY ( id_produto_categoria );

CREATE TABLE bt_telefone (
    id_telefone  NUMBER(10) NOT NULL,
    ddi_telefone VARCHAR2(3) NOT NULL,
    ddd_telefone NUMBER(2) NOT NULL,
    nr_telefone  VARCHAR2(9) NOT NULL
);

COMMENT ON COLUMN bt_telefone.id_telefone IS
    'Esse atributo recebe o id telefone e é chave primária da tabela.';

COMMENT ON COLUMN bt_telefone.ddi_telefone IS
    'Esse atributo recebe o DDI do telefone e é obrigatório.';

COMMENT ON COLUMN bt_telefone.ddd_telefone IS
    'Esse atributo recebe o DDD do telefone e é obrigatório.';

COMMENT ON COLUMN bt_telefone.nr_telefone IS
    'Esse atributo recebe o número do telefone e é obrigatório';

ALTER TABLE bt_telefone ADD CONSTRAINT bt_telefone_pk PRIMARY KEY ( id_telefone );

ALTER TABLE bt_acesso
    ADD CONSTRAINT bt_acesso_bt_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES bt_cliente ( id_cliente );

ALTER TABLE bt_acesso
    ADD CONSTRAINT bt_acesso_bt_produto_fk FOREIGN KEY ( id_produto )
        REFERENCES bt_produto ( id_produto );

ALTER TABLE bt_cliente
    ADD CONSTRAINT bt_cliente_bt_genero_fk FOREIGN KEY ( id_genero )
        REFERENCES bt_genero ( id_genero );

ALTER TABLE bt_cliente
    ADD CONSTRAINT bt_cliente_bt_telefone_fk FOREIGN KEY ( id_telefone )
        REFERENCES bt_telefone ( id_telefone );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE bt_empresa_produto
    ADD CONSTRAINT bt_empresa_produto_bt_empresa_fk FOREIGN KEY ( id_empresa )
        REFERENCES bt_empresa ( id_empresa );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE bt_empresa_produto
    ADD CONSTRAINT bt_empresa_produto_bt_produto_fk FOREIGN KEY ( id_produto )
        REFERENCES bt_produto ( id_produto );

ALTER TABLE bt_endereco
    ADD CONSTRAINT bt_endereco_bt_empresa_fk FOREIGN KEY ( id_empresa )
        REFERENCES bt_empresa ( id_empresa );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE bt_endereco_cliente
    ADD CONSTRAINT bt_endereco_cliente_bt_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES bt_cliente ( id_cliente );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE bt_endereco_cliente
    ADD CONSTRAINT bt_endereco_cliente_bt_endereco_fk FOREIGN KEY ( id_endereco )
        REFERENCES bt_endereco ( id_endereco );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE bt_produto_categoria
    ADD CONSTRAINT bt_produto_categoria_bt_categoria_fk FOREIGN KEY ( id_categoria )
        REFERENCES bt_categoria ( id_categoria );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE bt_produto_categoria
    ADD CONSTRAINT bt_produto_categoria_bt_produto_fk FOREIGN KEY ( id_produto )
        REFERENCES bt_produto ( id_produto );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             22
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   6
-- WARNINGS                                 0



----------------------------------------------------------------------------------------------------------------------------------------------

-- INSERTS NAS TABELAS
INSERT INTO bt_categoria (id_categoria, nm_categoria, desc_categoria) VALUES (1, 'Creme para pentear', 'Cremes para pentear cabelos');
INSERT INTO bt_categoria (id_categoria, nm_categoria, desc_categoria) VALUES (2, 'Hidratante corporal', 'Creme ou óleo para hidratação corporal');
INSERT INTO bt_categoria (id_categoria, nm_categoria, desc_categoria) VALUES (3, 'Hidratante facial', 'Creme ou óleo para hidratação facial');
INSERT INTO bt_categoria (id_categoria, nm_categoria, desc_categoria) VALUES (4, 'Máscara reparadora para cabelos', 'Máscara reparadora de capilar');
INSERT INTO bt_categoria (id_categoria, nm_categoria, desc_categoria) VALUES (5, 'Protetor Solar', 'Creme para proteção solar');


INSERT INTO bt_empresa (id_empresa, nm_empresa, cnpj_empresa, desc_empresa) VALUES (1, 'Palmolive', '11223344556677', 'Marca especializada em produtos para cabelo');
INSERT INTO bt_empresa (id_empresa, nm_empresa, cnpj_empresa, desc_empresa) VALUES (2, 'Pantene', '22334455667788', 'Marca especializada em produtos para cabelo');
INSERT INTO bt_empresa (id_empresa, nm_empresa, cnpj_empresa, desc_empresa) VALUES (3, 'Amend', '33445566778899', 'Marca especializada em produtos para cabelo');
INSERT INTO bt_empresa (id_empresa, nm_empresa, cnpj_empresa, desc_empresa) VALUES (4, 'Dove', '44556677889900', 'Marca especializada em produtos cósmeticos em geral');
INSERT INTO bt_empresa (id_empresa, nm_empresa, cnpj_empresa, desc_empresa) VALUES (5, 'L''oreal', '55667788990011', 'Marca especializada em produtos para cabelo');


INSERT INTO bt_genero (id_genero, nm_genero, desc_genero) VALUES (1, 'Masculino', 'Pessoa que se identifica como homem');
INSERT INTO bt_genero (id_genero, nm_genero, desc_genero) VALUES (2, 'Feminino', 'Pessoa que se identifica como mulher');
INSERT INTO bt_genero (id_genero, nm_genero, desc_genero) VALUES (3, 'Outro', 'Pessoa que não se identifica como mulher nem homem');


INSERT INTO bt_produto (id_produto, nm_produto, desc_produto, vl_produto, dt_fab_produto, dt_validade, dt_cadastro, img_produto) VALUES (1, 'Shampoo Palmolive', 'Shampoo Palmolive', 10.50, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), SYSDATE, 'produto1.jpg');
INSERT INTO bt_produto (id_produto, nm_produto, desc_produto, vl_produto, dt_fab_produto, dt_validade, dt_cadastro, img_produto) VALUES (2, 'Condicionador Loreal', 'Condicionar Loreal', 15.75, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), SYSDATE, 'produto2.jpg');
INSERT INTO bt_produto (id_produto, nm_produto, desc_produto, vl_produto, dt_fab_produto, dt_validade, dt_cadastro, img_produto) VALUES (3, 'Creme para pentear Amend', 'Creme para pentear cabelos da Amend', 20.00, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), SYSDATE, 'produto3.jpg');
INSERT INTO bt_produto (id_produto, nm_produto, desc_produto, vl_produto, dt_fab_produto, dt_validade, dt_cadastro, img_produto) VALUES (4, 'Hidratante Corporal Dove', 'Creme para hidratar o corpo', 12.99, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), SYSDATE, 'produto4.jpg');
INSERT INTO bt_produto (id_produto, nm_produto, desc_produto, vl_produto, dt_fab_produto, dt_validade, dt_cadastro, img_produto) VALUES (5, 'Protetor Solar Neutrogena', 'Creme para proteção solar', 8.50, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), SYSDATE, 'produto5.jpg');



INSERT INTO bt_telefone (id_telefone, ddi_telefone, ddd_telefone, nr_telefone) VALUES (1, '+55', 11, '999999999');
INSERT INTO bt_telefone (id_telefone, ddi_telefone, ddd_telefone, nr_telefone) VALUES (2, '+55', 21, '888888888');
INSERT INTO bt_telefone (id_telefone, ddi_telefone, ddd_telefone, nr_telefone) VALUES (3, '+55', 11, '777777777');
INSERT INTO bt_telefone (id_telefone, ddi_telefone, ddd_telefone, nr_telefone) VALUES (4, '+55', 21, '666666666');
INSERT INTO bt_telefone (id_telefone, ddi_telefone, ddd_telefone, nr_telefone) VALUES (5, '+55', 11, '555555555');


INSERT INTO bt_endereco (id_endereco, id_empresa, uf_endereco, cidade_endereco, bairro_endereco, logradouro_endereco, nr_endereco, complemento_endereco) VALUES (1, 1, 'SP', 'São Paulo', 'Centro', 'Av. Paulista', 100, NULL);
INSERT INTO bt_endereco (id_endereco, id_empresa, uf_endereco, cidade_endereco, bairro_endereco, logradouro_endereco, nr_endereco, complemento_endereco) VALUES (2, 2, 'PE', 'Recife', 'Boa Viagem', 'Av. Taboão', 200, NULL);
INSERT INTO bt_endereco (id_endereco, id_empresa, uf_endereco, cidade_endereco, bairro_endereco, logradouro_endereco, nr_endereco, complemento_endereco) VALUES (3, 3, 'SP', 'Campinas', 'Alphavile', 'Av.Campinas', 300, NULL);
INSERT INTO bt_endereco (id_endereco, id_empresa, uf_endereco, cidade_endereco, bairro_endereco, logradouro_endereco, nr_endereco, complemento_endereco) VALUES (4, 4, 'RJ', 'Rio de Janeiro', 'Leblon', 'Av. Agua Funda', 400, NULL);
INSERT INTO bt_endereco (id_endereco, id_empresa, uf_endereco, cidade_endereco, bairro_endereco, logradouro_endereco, nr_endereco, complemento_endereco) VALUES (5, 5, 'PB', 'João Pessoa', 'Jardins', 'Rua Paraopeba', 500, NULL);


INSERT INTO bt_cliente (id_cliente, id_telefone, id_genero, cpf_cliente, nm_cliente, email_cliente, dt_nascimento_cliente, estado_civil_cliente, dt_cadastro, dt_exclusao) VALUES (1, 1, 1, '12345678901', 'Vitor Machado Mirada', 'vitor@example.com', TO_DATE('1980-08-12', 'YYYY-MM-DD'), 'Solteiro', SYSDATE, NULL);
INSERT INTO bt_cliente (id_cliente, id_telefone, id_genero, cpf_cliente, nm_cliente, email_cliente, dt_nascimento_cliente, estado_civil_cliente, dt_cadastro, dt_exclusao) VALUES (2, 2, 2, '23456789012', 'Adriana Rocha Machado', 'adriana@example.com', TO_DATE('1976-09-18', 'YYYY-MM-DD'), 'Casada', SYSDATE, NULL);
INSERT INTO bt_cliente (id_cliente, id_telefone, id_genero, cpf_cliente, nm_cliente, email_cliente, dt_nascimento_cliente, estado_civil_cliente, dt_cadastro, dt_exclusao) VALUES (3, 3, 2, '34567890123', 'Beatriz Aparecida Leite e Souza', 'beatriz@example.com', TO_DATE('1990-02-25', 'YYYY-MM-DD'), 'Divorciada', SYSDATE, NULL);
INSERT INTO bt_cliente (id_cliente, id_telefone, id_genero, cpf_cliente, nm_cliente, email_cliente, dt_nascimento_cliente, estado_civil_cliente, dt_cadastro, dt_exclusao) VALUES (4, 4, 1, '45678901234', 'José Eduardo Machado Cardoso', 'jose@example.com', TO_DATE('1985-05-30', 'YYYY-MM-DD'), 'Viúvo', SYSDATE, NULL);
INSERT INTO bt_cliente (id_cliente, id_telefone, id_genero, cpf_cliente, nm_cliente, email_cliente, dt_nascimento_cliente, estado_civil_cliente, dt_cadastro, dt_exclusao) VALUES (5, 5, 3, '56789012345', 'Severino Sebastião de Miranda', 'severino@example.com', TO_DATE('1970-12-03', 'YYYY-MM-DD'), 'Solteiro', SYSDATE, NULL);



INSERT INTO bt_acesso (id_acesso, id_cliente, id_produto) VALUES (1, 1, 1);
INSERT INTO bt_acesso (id_acesso, id_cliente, id_produto) VALUES (2, 2, 2);
INSERT INTO bt_acesso (id_acesso, id_cliente, id_produto) VALUES (3, 3, 3);
INSERT INTO bt_acesso (id_acesso, id_cliente, id_produto) VALUES (4, 4, 4);
INSERT INTO bt_acesso (id_acesso, id_cliente, id_produto) VALUES (5, 5, 5);


INSERT INTO bt_empresa_produto (id_empresa_produto, id_empresa, id_produto) VALUES (1, 1, 1);
INSERT INTO bt_empresa_produto (id_empresa_produto, id_empresa, id_produto) VALUES (2, 2, 2);
INSERT INTO bt_empresa_produto (id_empresa_produto, id_empresa, id_produto) VALUES (3, 3, 3);
INSERT INTO bt_empresa_produto (id_empresa_produto, id_empresa, id_produto) VALUES (4, 4, 4);
INSERT INTO bt_empresa_produto (id_empresa_produto, id_empresa, id_produto) VALUES (5, 5, 5);


INSERT INTO bt_produto_categoria (id_produto_categoria, id_categoria, id_produto) VALUES (1, 1, 1);
INSERT INTO bt_produto_categoria (id_produto_categoria, id_categoria, id_produto) VALUES (2, 2, 2);
INSERT INTO bt_produto_categoria (id_produto_categoria, id_categoria, id_produto) VALUES (3, 3, 3);
INSERT INTO bt_produto_categoria (id_produto_categoria, id_categoria, id_produto) VALUES (4, 4, 4);
INSERT INTO bt_produto_categoria (id_produto_categoria, id_categoria, id_produto) VALUES (5, 5, 5);


INSERT INTO bt_endereco_cliente (id_endereco_cliente, id_endereco, id_cliente) VALUES (1, 1, 1);
INSERT INTO bt_endereco_cliente (id_endereco_cliente, id_endereco, id_cliente) VALUES (2, 2, 2);
INSERT INTO bt_endereco_cliente (id_endereco_cliente, id_endereco, id_cliente) VALUES (3, 3, 3);
INSERT INTO bt_endereco_cliente (id_endereco_cliente, id_endereco, id_cliente) VALUES (4, 4, 4);
INSERT INTO bt_endereco_cliente (id_endereco_cliente, id_endereco, id_cliente) VALUES (5, 5, 5);

------------------------------------------------------------------------------------------------------------------------
 SET SERVEROUTPUT ON
 SET VERIFY OFF

-- Verifica se o CPF tem 11 caracteres e se é composto apenas por números
CREATE OR REPLACE FUNCTION validar_cpf (
    p_cpf IN VARCHAR2
) RETURN BOOLEAN IS
BEGIN
    
    IF LENGTH(p_cpf) = 11 AND REGEXP_LIKE(p_cpf, '^[0-9]{11}$') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END validar_cpf;


-- TESTE CORRETO PARA VALIDAR FUNÇÃO CPF

DECLARE
    v_cpf_cliente VARCHAR2(11) := '12345678901';
BEGIN
    IF validar_cpf(v_cpf_cliente) THEN
        DBMS_OUTPUT.PUT_LINE('CPF válido!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('CPF inválido!');
    END IF;
END;


-- TESTE COM ERRO PARA VALIDAR FUNÇÃO CPF
DECLARE
    v_cpf_cliente VARCHAR2(11) := '1234X6Y8901';
BEGIN
    IF validar_cpf(v_cpf_cliente) THEN
        DBMS_OUTPUT.PUT_LINE('CPF válido!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('CPF inválido!');
    END IF;
END;

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Verifica se o e-mail está todo em minúsculas, contém '@' e termina com '.com'
CREATE OR REPLACE FUNCTION validar_email (
    p_email IN VARCHAR2
) RETURN BOOLEAN IS
BEGIN
    
    IF LOWER(p_email) = p_email 
       AND INSTR(p_email, '@') > 1 
       AND SUBSTR(p_email, -4) = '.com' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END validar_email;


--TESTE PARA VALIDAR FUNÇÃO E-MAIL

DECLARE
    v_email_cliente VARCHAR2(100) := 'exemplo@dominio.com';
BEGIN
    IF validar_email(v_email_cliente) THEN
        DBMS_OUTPUT.PUT_LINE('E-mail válido!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('E-mail inválido!');
    END IF;
END;


--TESTE COM ERRO PARA VALIDAR FUNÇÃO E-MAIL
DECLARE
    v_email_cliente VARCHAR2(100) := 'exemplodominio.com';
BEGIN
    IF validar_email(v_email_cliente) THEN
        DBMS_OUTPUT.PUT_LINE('E-mail válido!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('E-mail inválido!');
    END IF;
END;


--------------------------------------------------------------------------------------------------------------------
-- PROCEDIMENTO QUE VERIFICA A QUANTIDADE DE PRODUTOS POR CATEGORIA
DECLARE
  v_categoria bt_categoria.nm_categoria%TYPE;
  v_qtd_produtos NUMBER;
BEGIN
  FOR categoria_rec IN (SELECT c.nm_categoria, COUNT(pc.id_produto) AS qtd_produtos
                         FROM bt_categoria c
                              JOIN bt_produto_categoria pc ON c.id_categoria = pc.id_categoria
                         GROUP BY c.nm_categoria
                         ORDER BY c.nm_categoria) LOOP
    v_categoria := categoria_rec.nm_categoria;
    v_qtd_produtos := categoria_rec.qtd_produtos;
    DBMS_OUTPUT.PUT_LINE('Categoria: ' || v_categoria || ', Quantidade de Produtos: ' || v_qtd_produtos);
  END LOOP;
END;
/
------------------------------------------------------------------------------------------------------------------------
-- PROCEDIMENTO QUE VERIFICA A QUANTIDADE DE PRODUTOS PELA EMPRESA

DECLARE
  v_empresa bt_empresa.nm_empresa%TYPE;
  v_qtd_produtos NUMBER;
BEGIN
  FOR empresa_rec IN (SELECT e.nm_empresa, COUNT(ep.id_produto) AS qtd_produtos
                      FROM bt_empresa e
                           JOIN bt_empresa_produto ep ON e.id_empresa = ep.id_empresa
                      GROUP BY e.nm_empresa
                      ORDER BY COUNT(ep.id_produto) DESC) LOOP
    v_empresa := empresa_rec.nm_empresa;
    v_qtd_produtos := empresa_rec.qtd_produtos;
    DBMS_OUTPUT.PUT_LINE('Empresa: ' || v_empresa || ', Quantidade de Produtos: ' || v_qtd_produtos);
  END LOOP;
END;
/
-------------------------------------------------------------------------------------------------------------------------------------------

-- INSERT NA TABELA BT_CATEGORIA

CREATE OR REPLACE PROCEDURE insert_bt_categoria (
    p_id_categoria   IN bt_categoria.id_categoria%TYPE,
    p_nm_categoria   IN bt_categoria.nm_categoria%TYPE,
    p_desc_categoria IN bt_categoria.desc_categoria%TYPE
) IS
BEGIN
    INSERT INTO bt_categoria (id_categoria, nm_categoria, desc_categoria)
    VALUES (p_id_categoria, p_nm_categoria, p_desc_categoria);
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: Não podemos ter duplicidade de ID na tabela, faça o insert com outro ID.');
END;
/

BEGIN
    -- Testando inserção de nova categoria
    insert_bt_categoria(6, 'Protetor Labial', 'Protetor labial para hidratação');
END;


BEGIN
    -- Testando inserção com ID duplicado
    insert_bt_categoria(1, 'Protetor Solar', 'Creme para proteção solar');
END;

------------------------------------------------------------------------------------------------------------------------------------------------------------

-- UPDATE BT_CATEGORIA
CREATE OR REPLACE PROCEDURE update_bt_categoria (
    p_id_categoria   IN bt_categoria.id_categoria%TYPE,
    p_nm_categoria   IN bt_categoria.nm_categoria%TYPE,
    p_desc_categoria IN bt_categoria.desc_categoria%TYPE
) IS
BEGIN
    UPDATE bt_categoria
    SET nm_categoria = p_nm_categoria,
        desc_categoria = p_desc_categoria
    WHERE id_categoria = p_id_categoria;

    -- Verifica se alguma linha foi atualizada 
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: ID da Categoria a ser atualizada não encontrada.');
    END IF;
COMMIT;
END;

/

BEGIN
    -- Testando atualização de uma categoria existente
    update_bt_categoria(1, 'Creme para pentear novo', 'Nova descrição para cremes de pentear');
END;


BEGIN    
    -- Testando atualização com ID inexistente
    update_bt_categoria(10, 'Novo Nome', 'Nova Descrição');
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- DELETE BT_CATEGORIA

CREATE OR REPLACE PROCEDURE delete_bt_categoria (
    p_id_categoria IN bt_categoria.id_categoria%TYPE
) IS
BEGIN
    DELETE FROM bt_categoria
    WHERE id_categoria = p_id_categoria;

    IF SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR(-20001,'Erro: Categoria a ser excluída não encontrada.');
    END IF;
COMMIT;
END;
/


 BEGIN
    -- Testando exclusão com ID inexistente
    delete_bt_categoria(10);
END;

------------------------------------------------------------------------------------------------------------------------------------------------------

-- PROCEDIMENTO PARA INSERIR CLIENTE
CREATE OR REPLACE PROCEDURE insert_bt_cliente (
    p_id_cliente             IN bt_cliente.id_cliente%TYPE,
    p_id_telefone            IN bt_cliente.id_telefone%TYPE,
    p_id_genero              IN bt_cliente.id_genero%TYPE,
    p_cpf_cliente            IN bt_cliente.cpf_cliente%TYPE,
    p_nm_cliente             IN bt_cliente.nm_cliente%TYPE,
    p_email_cliente          IN bt_cliente.email_cliente%TYPE,
    p_dt_nascimento_cliente  IN bt_cliente.dt_nascimento_cliente%TYPE,
    p_estado_civil_cliente   IN bt_cliente.estado_civil_cliente%TYPE,
    p_dt_cadastro            IN bt_cliente.dt_cadastro%TYPE,
    p_dt_exclusao            IN bt_cliente.dt_exclusao%TYPE DEFAULT NULL
) IS
BEGIN
    INSERT INTO bt_cliente (
        id_cliente,
        id_telefone,
        id_genero,
        cpf_cliente,
        nm_cliente,
        email_cliente,
        dt_nascimento_cliente,
        estado_civil_cliente,
        dt_cadastro,
        dt_exclusao
    ) VALUES (
        p_id_cliente,
        p_id_telefone,
        p_id_genero,
        p_cpf_cliente,
        p_nm_cliente,
        p_email_cliente,
        p_dt_nascimento_cliente,
        p_estado_civil_cliente,
        p_dt_cadastro,
        p_dt_exclusao
    );
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Não podemos ter duplicidade de ID na tabela, faça o insert com outro ID.');
COMMIT;

END;
/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PROCEDIMENTO PARA ATUALIZAR CLIENTE
CREATE OR REPLACE PROCEDURE update_bt_cliente (
    p_id_cliente            IN bt_cliente.id_cliente%TYPE,
    p_id_telefone           IN bt_cliente.id_telefone%TYPE,
    p_id_genero             IN bt_cliente.id_genero%TYPE,
    p_cpf_cliente           IN bt_cliente.cpf_cliente%TYPE,
    p_nm_cliente            IN bt_cliente.nm_cliente%TYPE,
    p_email_cliente         IN bt_cliente.email_cliente%TYPE,
    p_dt_nascimento_cliente IN bt_cliente.dt_nascimento_cliente%TYPE,
    p_estado_civil_cliente  IN bt_cliente.estado_civil_cliente%TYPE,
    p_dt_exclusao           IN bt_cliente.dt_exclusao%TYPE
) IS
BEGIN
    UPDATE bt_cliente
    SET
        id_telefone = p_id_telefone,
        id_genero = p_id_genero,
        cpf_cliente = p_cpf_cliente,
        nm_cliente = p_nm_cliente,
        email_cliente = p_email_cliente,
        dt_nascimento_cliente = p_dt_nascimento_cliente,
        estado_civil_cliente = p_estado_civil_cliente,
        dt_exclusao = p_dt_exclusao
    WHERE
        id_cliente = p_id_cliente;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ID do Cliente a ser atualizado não encontrado.');
    END IF;
    COMMIT;

END;
/

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- PROCEDIMENTO PARA EXCLUIR CLIENTE
CREATE OR REPLACE PROCEDURE delete_bt_cliente (
    p_id_cliente IN bt_cliente.id_cliente%TYPE
) IS
BEGIN
    DELETE FROM bt_cliente
    WHERE id_cliente = p_id_cliente;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Cliente a ser excluído não encontrado.');
    END IF;
    COMMIT;

END;
/
------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERT BT_EMPRESA
CREATE OR REPLACE PROCEDURE insert_bt_empresa (
    p_id_empresa    IN bt_empresa.id_empresa%TYPE,
    p_nm_empresa    IN bt_empresa.nm_empresa%TYPE,
    p_cnpj_empresa  IN bt_empresa.cnpj_empresa%TYPE,
    p_desc_empresa  IN bt_empresa.desc_empresa%TYPE
) IS
BEGIN
    INSERT INTO bt_empresa (
        id_empresa,
        nm_empresa,
        cnpj_empresa,
        desc_empresa
    ) VALUES (
        p_id_empresa,
        p_nm_empresa,
        p_cnpj_empresa,
        p_desc_empresa
    );
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Não podemos ter duplicidade de ID na tabela, faça o insert com outro ID.');
COMMIT;
END;
/
------------------------------------------------------------------------------------------------------------------------------------------------

-- UPDATE  BT_EMPRESA
CREATE OR REPLACE PROCEDURE update_bt_empresa (
    p_id_empresa    IN bt_empresa.id_empresa%TYPE,
    p_nm_empresa    IN bt_empresa.nm_empresa%TYPE,
    p_cnpj_empresa  IN bt_empresa.cnpj_empresa%TYPE,
    p_desc_empresa  IN bt_empresa.desc_empresa%TYPE
) IS
BEGIN
    UPDATE bt_empresa
    SET
        nm_empresa = p_nm_empresa,
        cnpj_empresa = p_cnpj_empresa,
        desc_empresa = p_desc_empresa
    WHERE
        id_empresa = p_id_empresa;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ID da Empresa a ser atualizada não encontrado.');
    END IF;
    COMMIT;
END;
/
----------------------------------------------------------------------------------------------------------------------------------------------------------

-- DELETE  BT_EMPRESA
CREATE OR REPLACE PROCEDURE delete_bt_empresa (
    p_id_empresa IN bt_empresa.id_empresa%TYPE
) IS
BEGIN
    DELETE FROM bt_empresa
    WHERE id_empresa = p_id_empresa;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Empresa a ser excluída não encontrada.');
    END IF;
    COMMIT;
END;
/
-------------------------------------------------------------------------------------------------------------------------------------------------

-- PROCEDIMENTO PARA INSERIR ENDEREÇO
CREATE OR REPLACE PROCEDURE insert_bt_endereco (
    p_id_endereco          IN bt_endereco.id_endereco%TYPE,
    p_id_empresa           IN bt_endereco.id_empresa%TYPE,
    p_uf_endereco          IN bt_endereco.uf_endereco%TYPE,
    p_cidade_endereco      IN bt_endereco.cidade_endereco%TYPE,
    p_bairro_endereco      IN bt_endereco.bairro_endereco%TYPE,
    p_logradouro_endereco  IN bt_endereco.logradouro_endereco%TYPE,
    p_nr_endereco          IN bt_endereco.nr_endereco%TYPE,
    p_complemento_endereco IN bt_endereco.complemento_endereco%TYPE DEFAULT NULL
) IS
BEGIN
    INSERT INTO bt_endereco (
        id_endereco,
        id_empresa,
        uf_endereco,
        cidade_endereco,
        bairro_endereco,
        logradouro_endereco,
        nr_endereco,
        complemento_endereco
    ) VALUES (
        p_id_endereco,
        p_id_empresa,
        p_uf_endereco,
        p_cidade_endereco,
        p_bairro_endereco,
        p_logradouro_endereco,
        p_nr_endereco,
        p_complemento_endereco
    );
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Não podemos ter duplicidade de ID na tabela, faça o insert com outro ID.');
COMMIT;        
END;
/
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PROCEDIMENTO PARA ATUALIZAR ENDEREÇO
CREATE OR REPLACE PROCEDURE update_bt_endereco (
    p_id_endereco          IN bt_endereco.id_endereco%TYPE,
    p_id_empresa           IN bt_endereco.id_empresa%TYPE,
    p_uf_endereco          IN bt_endereco.uf_endereco%TYPE,
    p_cidade_endereco      IN bt_endereco.cidade_endereco%TYPE,
    p_bairro_endereco      IN bt_endereco.bairro_endereco%TYPE,
    p_logradouro_endereco  IN bt_endereco.logradouro_endereco%TYPE,
    p_nr_endereco          IN bt_endereco.nr_endereco%TYPE,
    p_complemento_endereco IN bt_endereco.complemento_endereco%TYPE
) IS
BEGIN
    UPDATE bt_endereco
    SET
        id_empresa = p_id_empresa,
        uf_endereco = p_uf_endereco,
        cidade_endereco = p_cidade_endereco,
        bairro_endereco = p_bairro_endereco,
        logradouro_endereco = p_logradouro_endereco,
        nr_endereco = p_nr_endereco,
        complemento_endereco = p_complemento_endereco
    WHERE
        id_endereco = p_id_endereco;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ID do Endereço a ser atualizado não encontrado.');
    END IF;
COMMIT;
END;
/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PROCEDIMENTO PARA EXCLUIR ENDEREÇO
CREATE OR REPLACE PROCEDURE delete_bt_endereco (
    p_id_endereco IN bt_endereco.id_endereco%TYPE
) IS
BEGIN
    DELETE FROM bt_endereco
    WHERE id_endereco = p_id_endereco;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Endereço a ser excluído não encontrado.');
    END IF;
COMMIT;
END;
/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERT BT_PRODUTO

CREATE OR REPLACE PROCEDURE insert_bt_produto (
    p_id_produto     IN bt_produto.id_produto%TYPE,
    p_nm_produto     IN bt_produto.nm_produto%TYPE,
    p_desc_produto   IN bt_produto.desc_produto%TYPE,
    p_vl_produto     IN bt_produto.vl_produto%TYPE,
    p_dt_fab_produto IN bt_produto.dt_fab_produto%TYPE,
    p_dt_validade    IN bt_produto.dt_validade%TYPE,
    p_dt_cadastro    IN bt_produto.dt_cadastro%TYPE,
    p_img_produto    IN bt_produto.img_produto%TYPE
) IS
BEGIN
    INSERT INTO bt_produto (
        id_produto,
        nm_produto,
        desc_produto,
        vl_produto,
        dt_fab_produto,
        dt_validade,
        dt_cadastro,
        img_produto
    ) VALUES (
        p_id_produto,
        p_nm_produto,
        p_desc_produto,
        p_vl_produto,
        p_dt_fab_produto,
        p_dt_validade,
        p_dt_cadastro,
        p_img_produto
    );
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN        
        DBMS_OUTPUT.PUT_LINE('Erro: Não podemos ter duplicidade de ID na tabela, faça o insert com outro ID.');

COMMIT;   
END;
/
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--UPDATE BT_PRODUTO

CREATE OR REPLACE PROCEDURE update_bt_produto (
    p_id_produto     IN bt_produto.id_produto%TYPE,
    p_nm_produto     IN bt_produto.nm_produto%TYPE,
    p_desc_produto   IN bt_produto.desc_produto%TYPE,
    p_vl_produto     IN bt_produto.vl_produto%TYPE,
    p_dt_fab_produto IN bt_produto.dt_fab_produto%TYPE,
    p_dt_validade    IN bt_produto.dt_validade%TYPE,
    p_dt_cadastro    IN bt_produto.dt_cadastro%TYPE,
    p_img_produto    IN bt_produto.img_produto%TYPE
) IS
BEGIN
    UPDATE bt_produto
    SET
        nm_produto = p_nm_produto,
        desc_produto = p_desc_produto,
        vl_produto = p_vl_produto,
        dt_fab_produto = p_dt_fab_produto,
        dt_validade = p_dt_validade,
        dt_cadastro = p_dt_cadastro,
        img_produto = p_img_produto
    WHERE
        id_produto = p_id_produto;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ID do Produto a ser atualizado não encontrado.');
    END IF;

    COMMIT;
END;
/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DELETE BT_PRODUTO

CREATE OR REPLACE PROCEDURE delete_bt_produto (
    p_id_produto IN bt_produto.id_produto%TYPE,
    p_nm_produto OUT bt_produto.nm_produto%TYPE
) IS
BEGIN

    SELECT nm_produto INTO p_nm_produto
    FROM bt_produto
    WHERE id_produto = p_id_produto;

    
    DELETE FROM bt_produto
    WHERE id_produto = p_id_produto;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Produto a ser excluído não encontrado.');
    END IF;

    COMMIT;

END;
/
----------------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT BT_TELEFONE

CREATE OR REPLACE PROCEDURE insert_bt_telefone (
    p_id_telefone  IN bt_telefone.id_telefone%TYPE,
    p_ddi_telefone IN bt_telefone.ddi_telefone%TYPE,
    p_ddd_telefone IN bt_telefone.ddd_telefone%TYPE,
    p_nr_telefone  IN bt_telefone.nr_telefone%TYPE
) IS
BEGIN
    INSERT INTO bt_telefone (
        id_telefone,
        ddi_telefone,
        ddd_telefone,
        nr_telefone
    ) VALUES (
        p_id_telefone,
        p_ddi_telefone,
        p_ddd_telefone,
        p_nr_telefone
    );
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Não podemos ter duplicidade de ID na tabela, faça o insert com outro ID.');
COMMIT;    
END;
/

----------------------------------------------------------------------------------------------------------------------------------------------------------

--UPDATE BT_TELEFONE

CREATE OR REPLACE PROCEDURE update_bt_telefone (
    p_id_telefone  IN bt_telefone.id_telefone%TYPE,
    p_ddi_telefone IN bt_telefone.ddi_telefone%TYPE,
    p_ddd_telefone IN bt_telefone.ddd_telefone%TYPE,
    p_nr_telefone  IN bt_telefone.nr_telefone%TYPE
) IS
BEGIN
    UPDATE bt_telefone
    SET
        ddi_telefone = p_ddi_telefone,
        ddd_telefone = p_ddd_telefone,
        nr_telefone = p_nr_telefone
    WHERE
        id_telefone = p_id_telefone;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ID do telefone a ser atualizado não encontrado.');
    END IF;
    
COMMIT;
END;
/

----------------------------------------------------------------------------------------------------------------------------------------------------------

--DELETE BT_TELEFONE

CREATE OR REPLACE PROCEDURE delete_bt_telefone (
    p_id_telefone IN bt_telefone.id_telefone%TYPE,
    p_nr_telefone OUT bt_telefone.nr_telefone%TYPE
) IS
BEGIN
  
    SELECT nr_telefone INTO p_nr_telefone
    FROM bt_telefone
    WHERE id_telefone = p_id_telefone;

  
    DELETE FROM bt_telefone
    WHERE id_telefone = p_id_telefone;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Telefone a ser excluído não encontrado.');
    END IF;
COMMIT;
END;

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CRIANDO PROCEDURE QUE IMPRIME NA TELA OS CLIENTE JUNTO COM O RESPECTIVO TELEFONE

CREATE OR REPLACE PROCEDURE get_clientes_com_telefones IS
    CURSOR c_clientes_com_telefones IS
        SELECT 
            c.id_cliente,
            c.nm_cliente,
            t.ddd_telefone,
            t.nr_telefone
        FROM 
            bt_cliente c
        JOIN 
            bt_telefone t ON c.id_telefone = t.id_telefone;
BEGIN
    FOR r IN c_clientes_com_telefones LOOP
        DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || r.id_cliente || 
                             ', Nome: ' || r.nm_cliente || 
                             ', DDD: ' || r.ddd_telefone || 
                             ', Número: ' || r.nr_telefone);
    END LOOP;
END;
/


-- Executar a procedure
BEGIN
    get_clientes_com_telefones;
END;
/
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CRIANDO PROCEDURE QUE IMPRIME O NOME DO CLIENTE, A QUANTIDADE DE ACESSOS E O ÚLTIMO PRODUTO ACESSADO

CREATE OR REPLACE PROCEDURE relatorio_acessos_cliente IS
BEGIN
    FOR r IN (
        SELECT 
            c.nm_cliente AS NomeCliente,
            COUNT(a.id_acesso) AS QuantidadeAcessos,
            MAX(p.nm_produto) AS UltimoProdutoAcessado
        FROM 
            bt_cliente c
            INNER JOIN bt_acesso a ON c.id_cliente = a.id_cliente
            INNER JOIN bt_produto p ON a.id_produto = p.id_produto
        GROUP BY 
            c.nm_cliente
        ORDER BY 
            QuantidadeAcessos DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Nome do Cliente: ' || r.NomeCliente);
        DBMS_OUTPUT.PUT_LINE('Quantidade de Acessos: ' || r.QuantidadeAcessos);
        DBMS_OUTPUT.PUT_LINE('Último Produto Acessado: ' || r.UltimoProdutoAcessado);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
END;
/


-- TESTE PARA A PROCEDURE 
BEGIN
    relatorio_acessos_cliente;
END;
/

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- SPRINT 3 2024
--CRIANDO FUNÇÃO QUE VERIFICA SE O CLIENTE É MAIOR DE IDADE

CREATE OR REPLACE FUNCTION verificar_maioridade(
    p_data_nascimento DATE
) RETURN VARCHAR2 IS
    v_idade NUMBER;
BEGIN
    -- Calcula a idade com base na data atual e na data de nascimento
    v_idade := TRUNC(MONTHS_BETWEEN(SYSDATE, p_data_nascimento) / 12);

    -- Verifica se a idade é 18 ou maior
    IF v_idade >= 18 THEN
        RETURN 'Maior de idade';
    ELSE
        RETURN 'Menor de idade';
    END IF;
END;
/

-- TESTE PARA FUNÇÃO VERIFICAR MAIORIDADE
SELECT NM_CLIENTE,
DT_NASCIMENTO_CLIENTE,
verificar_maioridade(TO_DATE(DT_NASCIMENTO_CLIENTE, 'DD/MM/YYYY')) as Maioridade
from BT_CLIENTE;

-------------------------------------------------------------------------------------------------------------------------------------------------------

-- CRIANDO FUNÇÃO QUE CONVERTE RESULTADO PRA JSON PARA USA NOS PROCEDURE A SEGUIR  
CREATE OR REPLACE FUNCTION transformando_em_json(p_id_cliente NUMBER)
RETURN CLOB
IS
    v_json CLOB := '{';
    v_comma CHAR(1) := '';
    v_data_found BOOLEAN := FALSE; -- Variável para indicar se os dados foram encontrados
BEGIN
    -- Obter os dados do cliente
    FOR rec IN (
        SELECT id_cliente, nm_cliente, email_cliente
        FROM bt_cliente
        WHERE id_cliente = p_id_cliente
    )
    LOOP
        v_data_found := TRUE; -- Indica que os dados foram encontrados
        v_json := v_json || v_comma || '"id_cliente": "' || rec.id_cliente || '", ' ||
                         '"nm_cliente": "' || rec.nm_cliente || '", ' ||
                         '"email_cliente": "' || rec.email_cliente || '"';
        v_comma := ','; -- Atualiza o separador
    END LOOP;

    -- Se nenhum dado foi encontrado, levanta a exceção
    IF NOT v_data_found THEN
        RAISE NO_DATA_FOUND;
    END IF;

    -- Finaliza o JSON
    v_json := v_json || '}';

    RETURN v_json;

EXCEPTION
    -- Tratamento de erro quando nenhum dado é encontrado
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nenhum dado encontrado para o id_cliente: ' || p_id_cliente);
    
    -- Tratamento de erro para valores inválidos
    WHEN VALUE_ERROR THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro de valor encontrado ao processar o id_cliente: ' || p_id_cliente);
    
    -- Tratamento para outros erros inesperados
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro inesperado ao processar o id_cliente: ' || p_id_cliente || '. Detalhes: ' || SQLERRM);
END;
/

------------------------------------------------------------------------------------
--CRIANDO PROCEDURE QUE GERA O RESULTADO EM JSON

CREATE OR REPLACE PROCEDURE gerar_json_cliente(p_id_cliente NUMBER)
IS
    v_json CLOB;
BEGIN

    BEGIN
        SELECT transformando_em_json(c.id_cliente)
        INTO v_json
        FROM bt_cliente c
        JOIN bt_endereco_cliente ec ON c.id_cliente = ec.id_cliente
        JOIN bt_endereco e ON ec.id_endereco = e.id_endereco
        WHERE c.id_cliente = p_id_cliente;

        DBMS_OUTPUT.PUT_LINE(v_json);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('{"error": "Nenhum dado encontrado."}');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('{"error": "Erro inesperado."}');
    END;
END;
/



-- TESTE CORRETO PARA O PROCEDURE GERAR JSON CLIENTE
SET SERVEROUTPUT ON;

BEGIN
    mostrando_dados_clientes(1);
END;
/

-- TESTE COM ERRO PARA A PROCEDURE GERAR JSON CLIENTE

BEGIN
    mostrando_dados_clientes(17);
END;
/

-------------------------------------------------------------------------------------------------------------------------------------------------
-- CRIANDO PROCEDURE QUE IMPRIME OS VALORES DOS PRODUTOS POR LINHA

CREATE OR REPLACE PROCEDURE imprimindo_valores
IS
    v_current_value VARCHAR2(150);
    v_prev_value VARCHAR2(150);
    v_next_value VARCHAR2(150);
BEGIN
    FOR r IN (
        SELECT
            id_produto,
            nm_produto,
            LAG(nm_produto, 1, 'Vazio') OVER (ORDER BY id_produto) AS prev_value,
            LEAD(nm_produto, 1, 'Vazio') OVER (ORDER BY id_produto) AS next_value
        FROM bt_produto
    )
    LOOP
        v_current_value := r.nm_produto;
        v_prev_value := r.prev_value;
        v_next_value := r.next_value;

        DBMS_OUTPUT.PUT_LINE('Valor atual: ' || v_current_value || ', Linha anterior: ' || v_prev_value || ', Linha seguinte: ' || v_next_value);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
END;


-- TESTE PARA A PROCEDURE IMPRIMINDO VALORES
SET SERVEROUTPUT ON;
BEGIN
    imprimindo_valores;
END;
/
 -------------------------------------------------------------------------------------------------------------------------------------------------------                                      

-- APAGANDO TABELA BT_AUDITORIA SOMENTE POR PRECAUÇÃO PRA NÃO TRAVAR O SCRIPT DO PROFESSOR, DESCOMENTAR SE NECESSÁRIO
--DROP TABLE BT_AUDITORIA

-- CRIANDO UMA TABELA AUDITORIA

CREATE TABLE BT_AUDITORIA (
    id_auditoria NUMBER(10) NOT NULL,
    tabela_nome VARCHAR2(50) NOT NULL,
    operacao_tipo VARCHAR2(10) NOT NULL,
    dados_anteriores CLOB,
    dados_novos CLOB,
    usuario_nome VARCHAR2(50) NOT NULL,
    data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

--CRIANDO SEQUENCE PARA O ID AUDITORIA
CREATE SEQUENCE BT_AUDITORIA_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
--------------------------------------------------------------------------------------------------------------------------------------------------

-- TRIGGER QUE INSERE DADO NA TABELA AUDITORIA A CADA INSERT, UPDATE OU DELETE EXECUTADO NA TABELA BT_CLIENTE
CREATE OR REPLACE TRIGGER trg_auditoria_bt_cliente
AFTER INSERT OR UPDATE OR DELETE ON bt_cliente
FOR EACH ROW
DECLARE
    v_dados_anteriores CLOB;
    v_dados_novos CLOB;
BEGIN
    IF INSERTING THEN
        v_dados_novos := '{' ||
                         '"id_cliente": "' || :NEW.id_cliente || '", ' ||
                         '"id_telefone": "' || :NEW.id_telefone || '", ' ||
                         '"id_genero": "' || :NEW.id_genero || '", ' ||
                         '"cpf_cliente": "' || :NEW.cpf_cliente || '", ' ||
                         '"nm_cliente": "' || :NEW.nm_cliente || '", ' ||
                         '"email_cliente": "' || :NEW.email_cliente || '", ' ||
                         '"dt_nascimento_cliente": "' || :NEW.dt_nascimento_cliente || '", ' ||
                         '"estado_civil_cliente": "' || :NEW.estado_civil_cliente || '", ' ||
                         '"dt_cadastro": "' || :NEW.dt_cadastro || '", ' ||
                         '"dt_exclusao": "' || :NEW.dt_exclusao || '"}' ;
        v_dados_anteriores := NULL;
        
        INSERT INTO BT_AUDITORIA (
            id_auditoria, tabela_nome, operacao_tipo, dados_anteriores, dados_novos, usuario_nome, data_operacao
        ) VALUES (
            BT_AUDITORIA_SEQ.NEXTVAL, 'bt_cliente', 'INSERT', v_dados_anteriores, v_dados_novos, SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE
        );

    ELSIF UPDATING THEN
        v_dados_anteriores := '{' ||
                              '"id_cliente": "' || :OLD.id_cliente || '", ' ||
                              '"id_telefone": "' || :OLD.id_telefone || '", ' ||
                              '"id_genero": "' || :OLD.id_genero || '", ' ||
                              '"cpf_cliente": "' || :OLD.cpf_cliente || '", ' ||
                              '"nm_cliente": "' || :OLD.nm_cliente || '", ' ||
                              '"email_cliente": "' || :OLD.email_cliente || '", ' ||
                              '"dt_nascimento_cliente": "' || :OLD.dt_nascimento_cliente || '", ' ||
                              '"estado_civil_cliente": "' || :OLD.estado_civil_cliente || '", ' ||
                              '"dt_cadastro": "' || :OLD.dt_cadastro || '", ' ||
                              '"dt_exclusao": "' || :OLD.dt_exclusao || '"}';
        v_dados_novos := '{' ||
                         '"id_cliente": "' || :NEW.id_cliente || '", ' ||
                         '"id_telefone": "' || :NEW.id_telefone || '", ' ||
                         '"id_genero": "' || :NEW.id_genero || '", ' ||
                         '"cpf_cliente": "' || :NEW.cpf_cliente || '", ' ||
                         '"nm_cliente": "' || :NEW.nm_cliente || '", ' ||
                         '"email_cliente": "' || :NEW.email_cliente || '", ' ||
                         '"dt_nascimento_cliente": "' || :NEW.dt_nascimento_cliente || '", ' ||
                         '"estado_civil_cliente": "' || :NEW.estado_civil_cliente || '", ' ||
                         '"dt_cadastro": "' || :NEW.dt_cadastro || '", ' ||
                         '"dt_exclusao": "' || :NEW.dt_exclusao || '"}' ;

        INSERT INTO BT_AUDITORIA (
            id_auditoria, tabela_nome, operacao_tipo, dados_anteriores, dados_novos, usuario_nome, data_operacao
        ) VALUES (
            BT_AUDITORIA_SEQ.NEXTVAL, 'bt_cliente', 'UPDATE', v_dados_anteriores, v_dados_novos, SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE
        );

    ELSIF DELETING THEN
        v_dados_anteriores := '{' ||
                              '"id_cliente": "' || :OLD.id_cliente || '", ' ||
                              '"id_telefone": "' || :OLD.id_telefone || '", ' ||
                              '"id_genero": "' || :OLD.id_genero || '", ' ||
                              '"cpf_cliente": "' || :OLD.cpf_cliente || '", ' ||
                              '"nm_cliente": "' || :OLD.nm_cliente || '", ' ||
                              '"email_cliente": "' || :OLD.email_cliente || '", ' ||
                              '"dt_nascimento_cliente": "' || :OLD.dt_nascimento_cliente || '", ' ||
                              '"estado_civil_cliente": "' || :OLD.estado_civil_cliente || '", ' ||
                              '"dt_cadastro": "' || :OLD.dt_cadastro || '", ' ||
                              '"dt_exclusao": "' || :OLD.dt_exclusao || '"}' ;
        v_dados_novos := NULL;

        INSERT INTO BT_AUDITORIA (
            id_auditoria, tabela_nome, operacao_tipo, dados_anteriores, dados_novos, usuario_nome, data_operacao
        ) VALUES (
            BT_AUDITORIA_SEQ.NEXTVAL, 'bt_cliente', 'DELETE', v_dados_anteriores, v_dados_novos, SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE
        );
    END IF;
END;
/


-- TESTE DE INSERT CORRETO TRIGGER AUDITORIA BT CLIENTE
INSERT INTO bt_cliente (id_cliente, id_telefone, id_genero, cpf_cliente, nm_cliente, email_cliente, dt_nascimento_cliente, estado_civil_cliente, dt_cadastro) 
VALUES (
        12, 
        1, 
        1, 
        '15926935748', 
        'Ronaldo Souza Miranda',
        'ronaldo.souza@example.com', 
        TO_DATE('2028-12-08', 'YYYY-MM-DD'), 
        'Solteiro', 
        SYSDATE);
        
 SELECT * FROM BT_AUDITORIA WHERE operacao_tipo = 'INSERT';    
 
 
 
 -- TESTE DE UPDATE CORRETO TRIGGER AUDITORIA BT CLIENTE
 
 UPDATE BT_CLIENTE
 SET email_cliente = 'vitormiranda4321@outlook.com'
 where id_cliente = 1;

SELECT * FROM BT_AUDITORIA WHERE operacao_tipo = 'UPDATE';


-- TESTE DE DELETE CORRETO TRIGGER AUDITORIA BT CLIENTE
DELETE FROM BT_CLIENTE WHERE ID_CLIENTE = 12;

SELECT * FROM BT_AUDITORIA WHERE operacao_tipo = 'DELETE';



