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

SET default_tablespace = '';

ALTER TABLE public.person OWNER TO postgres;

CREATE TABLE public.client (
    address character varying(255),
    passport character varying(255),
    id bigint NOT NULL
);

ALTER TABLE public.client OWNER TO postgres;

CREATE TABLE public.rent (
    id bigint NOT NULL,
    rentcar character varying(20)
);

ALTER TABLE public.rent OWNER TO postgres;
CREATE TABLE public.person (
    id bigint NOT NULL,
    name character varying(255)
);


CREATE TABLE public.client_rent (
    client_id bigint NOT NULL,
    rents_id bigint NOT NULL
);

ALTER TABLE public.client_rent OWNER TO postgres;


CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

CREATE SEQUENCE public.person_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.person_seq OWNER TO postgres;

CREATE VIEW clientdata AS
    SELECT c.id, p.name FROM client c JOIN person p ON c.id=p.id;

INSERT INTO public.person (id, name) VALUES (1, 'Maria');

SELECT pg_catalog.setval('public.hibernate_sequence', 28, true);

SELECT pg_catalog.setval('public.person_seq', 5, true);

ALTER TABLE ONLY public.rent
    ADD CONSTRAINT rent_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.client_rent
    ADD CONSTRAINT uk_38qrg00qt74c1jwlf4wmhxopb UNIQUE (rents_id);

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk2318bkniiewt2apqa3fctd91g FOREIGN KEY (id) REFERENCES public.person(id);

ALTER TABLE ONLY public.client_rent
    ADD CONSTRAINT fkatwtbdionrco2l5gtuxdjxmbw FOREIGN KEY (client_id) REFERENCES public.client(id);

ALTER TABLE ONLY public.client_rent
    ADD CONSTRAINT fkgjbkbp162w0o3ifqt8dinovhd FOREIGN KEY (rents_id) REFERENCES public.rent(id) ON UPDATE CASCADE ON DELETE CASCADE;
