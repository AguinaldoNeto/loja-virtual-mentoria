--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-10-24 06:01:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5005 (class 1262 OID 16398)
-- Name: loja_virtual_mentoria; Type: DATABASE; Schema: -; Owner: postgres
--

-- CREATE DATABASE loja_virtual_mentoria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE loja_virtual_mentoria OWNER TO postgres;

-- \connect loja_virtual_mentoria

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 256 (class 1255 OID 16685)
-- Name: validachavepessoa(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validachavepessoa() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	declare existe integer;

BEGIN

				existe = (select count(1) from pessoa_fisica where id = NEW.pessoa_id);
			if(existe <= 0) then
				existe = (select count(1) from pessoa_juridica where id = NEW.pessoa_id);
			if(existe <= 0) then
				RAISE EXCEPTION 'Não foi encontrado o ID e PK da pessoa para realizar a associação do cadastro';
			end if;
		end if;
	return new;
END;
$$;


ALTER FUNCTION public.validachavepessoa() OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 16690)
-- Name: validachavepessoaforn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validachavepessoaforn() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	declare existe integer;

BEGIN

				existe = (select count(1) from pessoa_fisica where id = NEW.pessoa_forn_id);
			if(existe <= 0) then
				existe = (select count(1) from pessoa_juridica where id = NEW.pessoa_forn_id);
			if(existe <= 0) then
				RAISE EXCEPTION 'Não foi encontrado o ID e PK da pessoa para realizar a associação do cadastro';
			end if;
		end if;
	return new;
END;
$$;


ALTER FUNCTION public.validachavepessoaforn() OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16562)
-- Name: seq_nota_item_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_nota_item_produto
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_nota_item_produto OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16415)
-- Name: seq_tb_acesso; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_acesso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_acesso OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16675)
-- Name: seq_tb_avaliacao_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_avaliacao_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_avaliacao_produto OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16416)
-- Name: seq_tb_categoria_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_categoria_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_categoria_produto OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16513)
-- Name: seq_tb_conta_pagar; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_conta_pagar
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_conta_pagar OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16501)
-- Name: seq_tb_conta_receber; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_conta_receber
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_conta_receber OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16520)
-- Name: seq_tb_cupom_desconto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_cupom_desconto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_cupom_desconto OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16451)
-- Name: seq_tb_endereco; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_endereco
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_endereco OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16514)
-- Name: seq_tb_forma_pagamento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_forma_pagamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_forma_pagamento OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16537)
-- Name: seq_tb_imagem_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_imagem_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_imagem_produto OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16654)
-- Name: seq_tb_item_venda_loja; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_item_venda_loja
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_item_venda_loja OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16404)
-- Name: seq_tb_marca_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_marca_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_marca_produto OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16550)
-- Name: seq_tb_nota_fiscal_compra; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_nota_fiscal_compra
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_nota_fiscal_compra OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16588)
-- Name: seq_tb_nota_fiscal_venda; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_nota_fiscal_venda
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_nota_fiscal_venda OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16429)
-- Name: seq_tb_pessoa; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_pessoa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_pessoa OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16551)
-- Name: seq_tb_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_produto OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16580)
-- Name: seq_tb_status_rastreio; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_status_rastreio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_status_rastreio OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16529)
-- Name: seq_tb_tb_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_tb_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_tb_produto OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16467)
-- Name: seq_tb_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_usuario OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16594)
-- Name: seq_tb_vd_cp_loja_virt; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_tb_vd_cp_loja_virt
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_tb_vd_cp_loja_virt OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16417)
-- Name: tb_acesso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_acesso (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.tb_acesso OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16670)
-- Name: tb_avaliacao_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_avaliacao_produto (
    id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    produto_id bigint NOT NULL,
    nota integer NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.tb_avaliacao_produto OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16410)
-- Name: tb_categoria_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_categoria_produto (
    id bigint NOT NULL,
    nome_desc character varying(255) NOT NULL
);


ALTER TABLE public.tb_categoria_produto OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16502)
-- Name: tb_conta_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_conta_pagar (
    id bigint NOT NULL,
    dt_pagamento date,
    valor_desconto numeric(38,2),
    pessoa_id bigint NOT NULL,
    pessoa_fornecedor_id bigint NOT NULL,
    descricao character varying(255) NOT NULL,
    dt_vencimento date NOT NULL,
    status smallint NOT NULL,
    valor_total numeric(38,2) NOT NULL,
    CONSTRAINT tb_conta_pagar_status_check CHECK (((status >= 0) AND (status <= 4)))
);


ALTER TABLE public.tb_conta_pagar OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16495)
-- Name: tb_conta_receber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_conta_receber (
    id bigint NOT NULL,
    dt_pagamento date,
    valor_desconto numeric(38,2),
    pessoa_id bigint NOT NULL,
    descricao character varying(255) NOT NULL,
    dt_vencimento date NOT NULL,
    status smallint NOT NULL,
    valor_total numeric(38,2) NOT NULL,
    CONSTRAINT tb_conta_receber_status_check CHECK (((status >= 0) AND (status <= 3)))
);


ALTER TABLE public.tb_conta_receber OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16515)
-- Name: tb_cupom_desconto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_cupom_desconto (
    id bigint NOT NULL,
    valor_perc_desconto numeric(38,2),
    valor_real_desconto numeric(38,2),
    cod_descricao character varying(255) NOT NULL,
    validade_cupom date NOT NULL
);


ALTER TABLE public.tb_cupom_desconto OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16444)
-- Name: tb_endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_endereco (
    id bigint NOT NULL,
    complemento character varying(255),
    pessoa_id bigint NOT NULL,
    bairro character varying(255) NOT NULL,
    cep character varying(255) NOT NULL,
    cidade character varying(255) NOT NULL,
    numero character varying(255) NOT NULL,
    rua_logra character varying(255) NOT NULL,
    tipo_endereco character varying(255) NOT NULL,
    uf character varying(255) NOT NULL,
    CONSTRAINT tb_endereco_tipo_endereco_check CHECK (((tipo_endereco)::text = ANY ((ARRAY['COBRANCA'::character varying, 'ENTREGA'::character varying])::text[])))
);


ALTER TABLE public.tb_endereco OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16508)
-- Name: tb_forma_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_forma_pagamento (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.tb_forma_pagamento OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16530)
-- Name: tb_imagem_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_imagem_produto (
    id bigint NOT NULL,
    produto_id bigint NOT NULL,
    imagem_miniatura text NOT NULL,
    imagem_original text NOT NULL
);


ALTER TABLE public.tb_imagem_produto OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16649)
-- Name: tb_item_venda_loja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_item_venda_loja (
    id bigint NOT NULL,
    produto_id bigint NOT NULL,
    vd_cp_loja_virt_id bigint NOT NULL,
    quantidade double precision NOT NULL
);


ALTER TABLE public.tb_item_venda_loja OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: tb_marca_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_marca_produto (
    id bigint NOT NULL,
    nome_desc character varying(255) NOT NULL
);


ALTER TABLE public.tb_marca_produto OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16543)
-- Name: tb_nota_fiscal_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_nota_fiscal_compra (
    id bigint NOT NULL,
    descricao_obs character varying(255),
    valor_desconto numeric(38,2),
    conta_pagar_id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    data_compra date NOT NULL,
    numero_nota character varying(255) NOT NULL,
    serie_nota character varying(255) NOT NULL,
    valoricms numeric(38,2) NOT NULL,
    valor_total numeric(38,2) NOT NULL
);


ALTER TABLE public.tb_nota_fiscal_compra OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16581)
-- Name: tb_nota_fiscal_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_nota_fiscal_venda (
    id bigint NOT NULL,
    venda_compra_loja_virtual_id bigint NOT NULL,
    numero character varying(255) NOT NULL,
    pdf text NOT NULL,
    serie character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    xml text NOT NULL
);


ALTER TABLE public.tb_nota_fiscal_venda OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16557)
-- Name: tb_nota_item_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_nota_item_produto (
    id bigint NOT NULL,
    quantidade double precision NOT NULL,
    nota_fiscal_compra_id bigint NOT NULL,
    produto_id bigint NOT NULL
);


ALTER TABLE public.tb_nota_item_produto OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16430)
-- Name: tb_pessoa_fisica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_pessoa_fisica (
    id bigint NOT NULL,
    cpf character varying(255) NOT NULL,
    data_nascimento date,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    telefone character varying(255) NOT NULL
);


ALTER TABLE public.tb_pessoa_fisica OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16437)
-- Name: tb_pessoa_juridica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_pessoa_juridica (
    id bigint NOT NULL,
    categoria character varying(255),
    insc_municipal character varying(255),
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    telefone character varying(255) NOT NULL,
    cnpj character varying(255) NOT NULL,
    insc_estadual character varying(255) NOT NULL,
    nome_fantasia character varying(255) NOT NULL,
    razao_social character varying(255) NOT NULL
);


ALTER TABLE public.tb_pessoa_juridica OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16522)
-- Name: tb_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_produto (
    id bigint NOT NULL,
    alerta_qtd_estoque boolean,
    altura double precision NOT NULL,
    ativo boolean NOT NULL,
    descricao text NOT NULL,
    largura double precision NOT NULL,
    link_youtube character varying(255),
    nome character varying(255) NOT NULL,
    peso double precision NOT NULL,
    profundidade double precision NOT NULL,
    qtd_alerta_estoque integer,
    qtd_clique integer,
    qtd_estoque integer NOT NULL,
    tipo_unidade character varying(255) NOT NULL,
    valor_venda numeric(38,2) NOT NULL
);


ALTER TABLE public.tb_produto OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16573)
-- Name: tb_status_rastreio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_status_rastreio (
    id bigint NOT NULL,
    venda_compra_loja_virtual_id bigint NOT NULL,
    centro_distribuicao character varying(255),
    cidade character varying(255),
    estado character varying(255),
    status character varying(255)
);


ALTER TABLE public.tb_status_rastreio OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16453)
-- Name: tb_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuario (
    id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    data_atual_senha date NOT NULL,
    login character varying(255) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE public.tb_usuario OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16478)
-- Name: tb_usuarios_acesso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuarios_acesso (
    usuario_id bigint NOT NULL,
    acesso_id bigint NOT NULL
);


ALTER TABLE public.tb_usuarios_acesso OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16610)
-- Name: tb_vd_cp_loja_virt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_vd_cp_loja_virt (
    id bigint NOT NULL,
    endereco_cobranca_id bigint NOT NULL,
    endereco_entrega_id bigint NOT NULL,
    forma_pagamento_id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    nota_fiscal_venda_id bigint NOT NULL,
    cupom_desconto_id bigint NOT NULL,
    data_entrega date NOT NULL,
    data_venda date NOT NULL,
    dias_entrega integer NOT NULL,
    valor_desconto numeric(38,2),
    valor_frete numeric(38,2) NOT NULL,
    valor_total numeric(38,2) NOT NULL
);


ALTER TABLE public.tb_vd_cp_loja_virt OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 16417)
-- Dependencies: 220
-- Data for Name: tb_acesso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4998 (class 0 OID 16670)
-- Dependencies: 254
-- Data for Name: tb_avaliacao_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4961 (class 0 OID 16410)
-- Dependencies: 217
-- Data for Name: tb_categoria_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4975 (class 0 OID 16502)
-- Dependencies: 231
-- Data for Name: tb_conta_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4973 (class 0 OID 16495)
-- Dependencies: 229
-- Data for Name: tb_conta_receber; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4979 (class 0 OID 16515)
-- Dependencies: 235
-- Data for Name: tb_cupom_desconto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4968 (class 0 OID 16444)
-- Dependencies: 224
-- Data for Name: tb_endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4976 (class 0 OID 16508)
-- Dependencies: 232
-- Data for Name: tb_forma_pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4983 (class 0 OID 16530)
-- Dependencies: 239
-- Data for Name: tb_imagem_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4996 (class 0 OID 16649)
-- Dependencies: 252
-- Data for Name: tb_item_venda_loja; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4959 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: tb_marca_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4985 (class 0 OID 16543)
-- Dependencies: 241
-- Data for Name: tb_nota_fiscal_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4992 (class 0 OID 16581)
-- Dependencies: 248
-- Data for Name: tb_nota_fiscal_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4988 (class 0 OID 16557)
-- Dependencies: 244
-- Data for Name: tb_nota_item_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4966 (class 0 OID 16430)
-- Dependencies: 222
-- Data for Name: tb_pessoa_fisica; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_pessoa_fisica (id, cpf, data_nascimento, email, nome, telefone) VALUES (1, '12345678900', '1993-01-01', 'email', 'pessoa', '99999-9999');


--
-- TOC entry 4967 (class 0 OID 16437)
-- Dependencies: 223
-- Data for Name: tb_pessoa_juridica; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4981 (class 0 OID 16522)
-- Dependencies: 237
-- Data for Name: tb_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_produto (id, alerta_qtd_estoque, altura, ativo, descricao, largura, link_youtube, nome, peso, profundidade, qtd_alerta_estoque, qtd_clique, qtd_estoque, tipo_unidade, valor_venda) VALUES (1, true, 10.5, true, 'DESCRIÇÃO', 2, 'WWW.TESTE.COM.BR', 'TESTE', 1, 1, 1, 1, 10, 'un', 10.00);


--
-- TOC entry 4990 (class 0 OID 16573)
-- Dependencies: 246
-- Data for Name: tb_status_rastreio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4970 (class 0 OID 16453)
-- Dependencies: 226
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4972 (class 0 OID 16478)
-- Dependencies: 228
-- Data for Name: tb_usuarios_acesso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4995 (class 0 OID 16610)
-- Dependencies: 251
-- Data for Name: tb_vd_cp_loja_virt; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 245
-- Name: seq_nota_item_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_nota_item_produto', 1, false);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 218
-- Name: seq_tb_acesso; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_acesso', 1, false);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 255
-- Name: seq_tb_avaliacao_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_avaliacao_produto', 1, false);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 219
-- Name: seq_tb_categoria_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_categoria_produto', 1, false);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 233
-- Name: seq_tb_conta_pagar; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_conta_pagar', 1, false);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 230
-- Name: seq_tb_conta_receber; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_conta_receber', 1, false);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 236
-- Name: seq_tb_cupom_desconto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_cupom_desconto', 1, false);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 225
-- Name: seq_tb_endereco; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_endereco', 1, false);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 234
-- Name: seq_tb_forma_pagamento; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_forma_pagamento', 1, false);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 240
-- Name: seq_tb_imagem_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_imagem_produto', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 253
-- Name: seq_tb_item_venda_loja; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_item_venda_loja', 1, false);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 216
-- Name: seq_tb_marca_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_marca_produto', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 242
-- Name: seq_tb_nota_fiscal_compra; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_nota_fiscal_compra', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 249
-- Name: seq_tb_nota_fiscal_venda; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_nota_fiscal_venda', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 221
-- Name: seq_tb_pessoa; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_pessoa', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 243
-- Name: seq_tb_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_produto', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 247
-- Name: seq_tb_status_rastreio; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_status_rastreio', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 238
-- Name: seq_tb_tb_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_tb_produto', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 227
-- Name: seq_tb_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_usuario', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 250
-- Name: seq_tb_vd_cp_loja_virt; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_tb_vd_cp_loja_virt', 1, false);


--
-- TOC entry 4743 (class 2606 OID 16421)
-- Name: tb_acesso tb_acesso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_acesso
    ADD CONSTRAINT tb_acesso_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 16674)
-- Name: tb_avaliacao_produto tb_avaliacao_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_avaliacao_produto
    ADD CONSTRAINT tb_avaliacao_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 16414)
-- Name: tb_categoria_produto tb_categoria_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria_produto
    ADD CONSTRAINT tb_categoria_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 16507)
-- Name: tb_conta_pagar tb_conta_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_conta_pagar
    ADD CONSTRAINT tb_conta_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 16500)
-- Name: tb_conta_receber tb_conta_receber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_conta_receber
    ADD CONSTRAINT tb_conta_receber_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 16519)
-- Name: tb_cupom_desconto tb_cupom_desconto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_cupom_desconto
    ADD CONSTRAINT tb_cupom_desconto_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 16450)
-- Name: tb_endereco tb_endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_endereco
    ADD CONSTRAINT tb_endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 16512)
-- Name: tb_forma_pagamento tb_forma_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_forma_pagamento
    ADD CONSTRAINT tb_forma_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 16536)
-- Name: tb_imagem_produto tb_imagem_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_imagem_produto
    ADD CONSTRAINT tb_imagem_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4781 (class 2606 OID 16653)
-- Name: tb_item_venda_loja tb_item_venda_loja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_item_venda_loja
    ADD CONSTRAINT tb_item_venda_loja_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 16403)
-- Name: tb_marca_produto tb_marca_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_marca_produto
    ADD CONSTRAINT tb_marca_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 16549)
-- Name: tb_nota_fiscal_compra tb_nota_fiscal_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_compra
    ADD CONSTRAINT tb_nota_fiscal_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 4773 (class 2606 OID 16587)
-- Name: tb_nota_fiscal_venda tb_nota_fiscal_venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_venda
    ADD CONSTRAINT tb_nota_fiscal_venda_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 16561)
-- Name: tb_nota_item_produto tb_nota_item_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_item_produto
    ADD CONSTRAINT tb_nota_item_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 16436)
-- Name: tb_pessoa_fisica tb_pessoa_fisica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_pessoa_fisica
    ADD CONSTRAINT tb_pessoa_fisica_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 16443)
-- Name: tb_pessoa_juridica tb_pessoa_juridica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_pessoa_juridica
    ADD CONSTRAINT tb_pessoa_juridica_pkey PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 16528)
-- Name: tb_produto tb_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_produto
    ADD CONSTRAINT tb_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 16579)
-- Name: tb_status_rastreio tb_status_rastreio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_status_rastreio
    ADD CONSTRAINT tb_status_rastreio_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 16459)
-- Name: tb_usuario tb_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 16614)
-- Name: tb_vd_cp_loja_virt tb_vd_cp_loja_virt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT tb_vd_cp_loja_virt_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 16631)
-- Name: tb_vd_cp_loja_virt uk44dmdjcdoj4few4sapi741mpe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT uk44dmdjcdoj4few4sapi741mpe UNIQUE (nota_fiscal_venda_id);


--
-- TOC entry 4775 (class 2606 OID 16638)
-- Name: tb_nota_fiscal_venda ukl433ofytv0879usov11gnp0ml; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_venda
    ADD CONSTRAINT ukl433ofytv0879usov11gnp0ml UNIQUE (venda_compra_loja_virtual_id);


--
-- TOC entry 4753 (class 2606 OID 16482)
-- Name: tb_usuarios_acesso unique_access_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuarios_acesso
    ADD CONSTRAINT unique_access_user UNIQUE (usuario_id, acesso_id);


--
-- TOC entry 4806 (class 2620 OID 16689)
-- Name: tb_conta_pagar validachavecontapagarinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavecontapagarinsert BEFORE INSERT ON public.tb_conta_pagar FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4807 (class 2620 OID 16688)
-- Name: tb_conta_pagar validachavecontapagarupdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavecontapagarupdate BEFORE UPDATE ON public.tb_conta_pagar FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4804 (class 2620 OID 16695)
-- Name: tb_conta_receber validachavecontareceberinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavecontareceberinsert BEFORE INSERT ON public.tb_conta_receber FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4805 (class 2620 OID 16694)
-- Name: tb_conta_receber validachavecontareceberupdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavecontareceberupdate BEFORE UPDATE ON public.tb_conta_receber FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4800 (class 2620 OID 16697)
-- Name: tb_endereco validachaveenderecoinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachaveenderecoinsert BEFORE INSERT ON public.tb_endereco FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4801 (class 2620 OID 16696)
-- Name: tb_endereco validachaveenderecoupdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachaveenderecoupdate BEFORE UPDATE ON public.tb_endereco FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4812 (class 2620 OID 16703)
-- Name: tb_vd_cp_loja_virt validachavelojavirtualinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavelojavirtualinsert BEFORE INSERT ON public.tb_vd_cp_loja_virt FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4813 (class 2620 OID 16702)
-- Name: tb_vd_cp_loja_virt validachavelojavirtualupdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavelojavirtualupdate BEFORE UPDATE ON public.tb_vd_cp_loja_virt FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4810 (class 2620 OID 16699)
-- Name: tb_nota_fiscal_compra validachavenotafiscalcomprainsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavenotafiscalcomprainsert BEFORE INSERT ON public.tb_nota_fiscal_compra FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4811 (class 2620 OID 16698)
-- Name: tb_nota_fiscal_compra validachavenotafiscalcompraupdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavenotafiscalcompraupdate BEFORE UPDATE ON public.tb_nota_fiscal_compra FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4814 (class 2620 OID 16686)
-- Name: tb_avaliacao_produto validachavepessoaavaliacaoproduto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoaavaliacaoproduto BEFORE UPDATE ON public.tb_avaliacao_produto FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4815 (class 2620 OID 16687)
-- Name: tb_avaliacao_produto validachavepessoaavaliacaoprodutoinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoaavaliacaoprodutoinsert BEFORE INSERT ON public.tb_avaliacao_produto FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4808 (class 2620 OID 16692)
-- Name: tb_conta_pagar validachavepessoaforninsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoaforninsert BEFORE INSERT ON public.tb_conta_pagar FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4809 (class 2620 OID 16693)
-- Name: tb_conta_pagar validachavepessoafornupdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoafornupdate BEFORE UPDATE ON public.tb_conta_pagar FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4802 (class 2620 OID 16701)
-- Name: tb_usuario validachaveusuarioinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachaveusuarioinsert BEFORE INSERT ON public.tb_usuario FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4803 (class 2620 OID 16700)
-- Name: tb_usuario validachaveusuarioupdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachaveusuarioupdate BEFORE UPDATE ON public.tb_usuario FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4784 (class 2606 OID 16485)
-- Name: tb_usuarios_acesso acesso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuarios_acesso
    ADD CONSTRAINT acesso_fk FOREIGN KEY (acesso_id) REFERENCES public.tb_acesso(id);


--
-- TOC entry 4787 (class 2606 OID 16552)
-- Name: tb_nota_fiscal_compra conta_pagar_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_compra
    ADD CONSTRAINT conta_pagar_fk FOREIGN KEY (conta_pagar_id) REFERENCES public.tb_conta_pagar(id);


--
-- TOC entry 4792 (class 2606 OID 16644)
-- Name: tb_vd_cp_loja_virt cupom_desconto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT cupom_desconto_fk FOREIGN KEY (cupom_desconto_id) REFERENCES public.tb_cupom_desconto(id);


--
-- TOC entry 4793 (class 2606 OID 16615)
-- Name: tb_vd_cp_loja_virt endereco_cobranca_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT endereco_cobranca_fk FOREIGN KEY (endereco_cobranca_id) REFERENCES public.tb_endereco(id);


--
-- TOC entry 4794 (class 2606 OID 16620)
-- Name: tb_vd_cp_loja_virt endereco_entrega_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT endereco_entrega_fk FOREIGN KEY (endereco_entrega_id) REFERENCES public.tb_endereco(id);


--
-- TOC entry 4795 (class 2606 OID 16625)
-- Name: tb_vd_cp_loja_virt forma_pagamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT forma_pagamento_fk FOREIGN KEY (forma_pagamento_id) REFERENCES public.tb_forma_pagamento(id);


--
-- TOC entry 4788 (class 2606 OID 16563)
-- Name: tb_nota_item_produto nota_fiscal_compra_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_item_produto
    ADD CONSTRAINT nota_fiscal_compra_fk FOREIGN KEY (nota_fiscal_compra_id) REFERENCES public.tb_nota_fiscal_compra(id);


--
-- TOC entry 4796 (class 2606 OID 16632)
-- Name: tb_vd_cp_loja_virt nota_fiscal_venda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT nota_fiscal_venda_fk FOREIGN KEY (nota_fiscal_venda_id) REFERENCES public.tb_nota_fiscal_venda(id);


--
-- TOC entry 4786 (class 2606 OID 16538)
-- Name: tb_imagem_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_imagem_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.tb_produto(id);


--
-- TOC entry 4789 (class 2606 OID 16568)
-- Name: tb_nota_item_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_item_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.tb_produto(id);


--
-- TOC entry 4797 (class 2606 OID 16655)
-- Name: tb_item_venda_loja produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_item_venda_loja
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.tb_produto(id);


--
-- TOC entry 4799 (class 2606 OID 16676)
-- Name: tb_avaliacao_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_avaliacao_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.tb_produto(id);


--
-- TOC entry 4785 (class 2606 OID 16490)
-- Name: tb_usuarios_acesso usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuarios_acesso
    ADD CONSTRAINT usuario_fk FOREIGN KEY (usuario_id) REFERENCES public.tb_usuario(id);


--
-- TOC entry 4798 (class 2606 OID 16660)
-- Name: tb_item_venda_loja vd_cp_loja_virt_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_item_venda_loja
    ADD CONSTRAINT vd_cp_loja_virt_fk FOREIGN KEY (vd_cp_loja_virt_id) REFERENCES public.tb_vd_cp_loja_virt(id);


--
-- TOC entry 4791 (class 2606 OID 16639)
-- Name: tb_nota_fiscal_venda venda_compra_loja_virtual_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_venda
    ADD CONSTRAINT venda_compra_loja_virtual_fk FOREIGN KEY (venda_compra_loja_virtual_id) REFERENCES public.tb_vd_cp_loja_virt(id);


--
-- TOC entry 4790 (class 2606 OID 16665)
-- Name: tb_status_rastreio venda_compra_loja_virtual_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_status_rastreio
    ADD CONSTRAINT venda_compra_loja_virtual_fk FOREIGN KEY (venda_compra_loja_virtual_id) REFERENCES public.tb_vd_cp_loja_virt(id);


-- Completed on 2024-10-24 06:01:39

--
-- PostgreSQL database dump complete
--