-- DROP SCHEMA public;

-- CREATE SCHEMA public AUTHORIZATION postgres;

-- DROP SEQUENCE public.associado_id_seq;

CREATE SEQUENCE public.associado_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.cartao_id_associado_seq;

CREATE SEQUENCE public.cartao_id_associado_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.cartao_id_conta_seq;

CREATE SEQUENCE public.cartao_id_conta_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.cartao_id_seq;

CREATE SEQUENCE public.cartao_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.conta_id_associado_seq;

CREATE SEQUENCE public.conta_id_associado_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.conta_id_seq;

CREATE SEQUENCE public.conta_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.movimento_id_cartao_seq;

CREATE SEQUENCE public.movimento_id_cartao_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.movimento_id_seq;

CREATE SEQUENCE public.movimento_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- public.associado definition

-- Drop table

-- DROP TABLE public.associado;

CREATE TABLE public.associado (
	id serial4 NOT NULL,
	nome varchar(100) NOT NULL,
	sobrenome varchar(100) NOT NULL,
	idade int4 NULL,
	email varchar(100) NULL,
	CONSTRAINT associado_pkey PRIMARY KEY (id)
);


-- public.conta definition

-- Drop table

-- DROP TABLE public.conta;

CREATE TABLE public.conta (
	id serial4 NOT NULL,
	tipo varchar(100) NOT NULL,
	data_criacao timestamptz NOT NULL DEFAULT now(),
	id_associado serial4 NOT NULL,
	CONSTRAINT conta_pkey PRIMARY KEY (id),
	CONSTRAINT fk_id_associado FOREIGN KEY (id_associado) REFERENCES public.associado(id)
);


-- public.cartao definition

-- Drop table

-- DROP TABLE public.cartao;

CREATE TABLE public.cartao (
	id serial4 NOT NULL,
	num_cartao int4 NOT NULL,
	nome_impresso varchar(100) NOT NULL,
	id_conta serial4 NOT NULL,
	id_associado serial4 NOT NULL,
	CONSTRAINT cartao_pkey PRIMARY KEY (id),
	CONSTRAINT fk_id_cartao_associado FOREIGN KEY (id_associado) REFERENCES public.associado(id),
	CONSTRAINT fk_id_cartao_conta FOREIGN KEY (id_conta) REFERENCES public.conta(id)
);


-- public.movimento definition

-- Drop table

-- DROP TABLE public.movimento;

CREATE TABLE public.movimento (
	id serial4 NOT NULL,
	vlr_transacao numeric(10, 2) NOT NULL,
	des_transacao varchar(100) NOT NULL,
	data_movimento timestamptz NOT NULL DEFAULT now(),
	id_cartao serial4 NOT NULL,
	CONSTRAINT movimento_pkey PRIMARY KEY (id),
	CONSTRAINT fk_id_cartao FOREIGN KEY (id_cartao) REFERENCES public.cartao(id)
);
