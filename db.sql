--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category; Type: TABLE; Schema: public; Owner: piotrpawlus
--

CREATE TABLE category (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE category OWNER TO piotrpawlus;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: piotrpawlus
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_id_seq OWNER TO piotrpawlus;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piotrpawlus
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: piotrpawlus
--

CREATE TABLE manufacturer (
    id integer NOT NULL,
    name text NOT NULL,
    web text,
    mail text,
    phone text
);


ALTER TABLE manufacturer OWNER TO piotrpawlus;

--
-- Name: manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: piotrpawlus
--

CREATE SEQUENCE manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manufacturer_id_seq OWNER TO piotrpawlus;

--
-- Name: manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piotrpawlus
--

ALTER SEQUENCE manufacturer_id_seq OWNED BY manufacturer.id;


--
-- Name: medicine; Type: TABLE; Schema: public; Owner: piotrpawlus
--

CREATE TABLE medicine (
    id integer NOT NULL,
    name text NOT NULL,
    price real NOT NULL,
    capacity integer NOT NULL,
    measure text NOT NULL,
    description text,
    category_id integer,
    manufacturer_id integer,
    CONSTRAINT medicine_capacity_check CHECK ((capacity > 0)),
    CONSTRAINT medicine_price_check CHECK ((price > (0)::double precision))
);


ALTER TABLE medicine OWNER TO piotrpawlus;

--
-- Name: medicine_id_seq; Type: SEQUENCE; Schema: public; Owner: piotrpawlus
--

CREATE SEQUENCE medicine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicine_id_seq OWNER TO piotrpawlus;

--
-- Name: medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piotrpawlus
--

ALTER SEQUENCE medicine_id_seq OWNED BY medicine.id;


--
-- Name: series; Type: TABLE; Schema: public; Owner: piotrpawlus
--

CREATE TABLE series (
    id integer NOT NULL,
    manufactured_at date NOT NULL,
    end_at date NOT NULL,
    serial_number text NOT NULL,
    amount integer NOT NULL,
    medicine_id integer,
    CONSTRAINT series_amount_check CHECK ((amount > 0))
);


ALTER TABLE series OWNER TO piotrpawlus;

--
-- Name: series_id_seq; Type: SEQUENCE; Schema: public; Owner: piotrpawlus
--

CREATE SEQUENCE series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE series_id_seq OWNER TO piotrpawlus;

--
-- Name: series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piotrpawlus
--

ALTER SEQUENCE series_id_seq OWNED BY series.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- Name: manufacturer id; Type: DEFAULT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY manufacturer ALTER COLUMN id SET DEFAULT nextval('manufacturer_id_seq'::regclass);


--
-- Name: medicine id; Type: DEFAULT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY medicine ALTER COLUMN id SET DEFAULT nextval('medicine_id_seq'::regclass);


--
-- Name: series id; Type: DEFAULT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY series ALTER COLUMN id SET DEFAULT nextval('series_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: piotrpawlus
--

COPY category (id, name, description) FROM stdin;
6	Bez recepty	Wydawane leki niewymagaja recepty przypisanej przez lekarza.
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piotrpawlus
--

SELECT pg_catalog.setval('category_id_seq', 6, true);


--
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: public; Owner: piotrpawlus
--

COPY manufacturer (id, name, web, mail, phone) FROM stdin;
6	Kru			
\.


--
-- Name: manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piotrpawlus
--

SELECT pg_catalog.setval('manufacturer_id_seq', 6, true);


--
-- Data for Name: medicine; Type: TABLE DATA; Schema: public; Owner: piotrpawlus
--

COPY medicine (id, name, price, capacity, measure, description, category_id, manufacturer_id) FROM stdin;
9	Apap	6.15999985	12	tabletki	Apap medicine without description.	6	6
2	Karol	3.16000009	4	pills	dsa	6	6
10	Paracetamol	8.30000019	16	tabletki	nic	6	6
\.


--
-- Name: medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piotrpawlus
--

SELECT pg_catalog.setval('medicine_id_seq', 10, true);


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: piotrpawlus
--

COPY series (id, manufactured_at, end_at, serial_number, amount, medicine_id) FROM stdin;
1	2016-05-04	2020-05-04	njjnadlkaslkd	5	2
2	2016-05-04	2020-05-04	ASXJAKWDAMCWA213	24	9
3	2016-05-04	2020-05-04	njjnadlkaslkd	3	2
\.


--
-- Name: series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piotrpawlus
--

SELECT pg_catalog.setval('series_id_seq', 3, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);


--
-- Name: medicine medicine_pkey; Type: CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY medicine
    ADD CONSTRAINT medicine_pkey PRIMARY KEY (id);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id, serial_number);


--
-- Name: medicine medicine_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY medicine
    ADD CONSTRAINT medicine_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(id);


--
-- Name: medicine medicine_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY medicine
    ADD CONSTRAINT medicine_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id);


--
-- Name: series series_medicine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_medicine_id_fkey FOREIGN KEY (medicine_id) REFERENCES medicine(id);


--
-- PostgreSQL database dump complete
--

