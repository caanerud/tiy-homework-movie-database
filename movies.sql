--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

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
-- Name: genre; Type: TABLE; Schema: public; Owner: chrisaanerud
--

CREATE TABLE genre (
    primary_genre character varying(30),
    sub_genre character varying(30),
    genre_id integer NOT NULL,
    movie_genre_id integer
);


ALTER TABLE genre OWNER TO chrisaanerud;

--
-- Name: genre_movie; Type: TABLE; Schema: public; Owner: chrisaanerud
--

CREATE TABLE genre_movie (
    genre_id integer NOT NULL,
    movie_id integer NOT NULL,
    genre_movie_id integer NOT NULL
);


ALTER TABLE genre_movie OWNER TO chrisaanerud;

--
-- Name: genre_movie_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE genre_movie_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_movie_genre_id_seq OWNER TO chrisaanerud;

--
-- Name: genre_movie_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE genre_movie_genre_id_seq OWNED BY genre_movie.genre_id;


--
-- Name: genre_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE genre_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_movie_id_seq OWNER TO chrisaanerud;

--
-- Name: genre_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE genre_movie_id_seq OWNED BY genre_movie.genre_movie_id;


--
-- Name: genre_movie_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE genre_movie_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_movie_movie_id_seq OWNER TO chrisaanerud;

--
-- Name: genre_movie_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE genre_movie_movie_id_seq OWNED BY genre_movie.movie_id;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: chrisaanerud
--

CREATE TABLE movie (
    title character varying(30) NOT NULL,
    release_date date NOT NULL,
    length double precision NOT NULL,
    primary_language character varying(20),
    movie_id integer NOT NULL,
    rating character varying(10) NOT NULL,
    country character varying(30) NOT NULL,
    budget double precision NOT NULL,
    gross double precision,
    released_by character varying(50) NOT NULL
);


ALTER TABLE movie OWNER TO chrisaanerud;

--
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movie_id_seq OWNER TO chrisaanerud;

--
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE movie_id_seq OWNED BY movie.movie_id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: chrisaanerud
--

CREATE TABLE person (
    first_name character varying(50),
    last_name character varying(40),
    person_id integer NOT NULL,
    "movie_person-id" integer
);


ALTER TABLE person OWNER TO chrisaanerud;

--
-- Name: person_movie; Type: TABLE; Schema: public; Owner: chrisaanerud
--

CREATE TABLE person_movie (
    person_id integer NOT NULL,
    movie_id integer NOT NULL,
    person_movie_id integer NOT NULL
);


ALTER TABLE person_movie OWNER TO chrisaanerud;

--
-- Name: person_movie_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE person_movie_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_movie_movie_id_seq OWNER TO chrisaanerud;

--
-- Name: person_movie_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE person_movie_movie_id_seq OWNED BY person_movie.movie_id;


--
-- Name: person_movie_person_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE person_movie_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_movie_person_id_seq OWNER TO chrisaanerud;

--
-- Name: person_movie_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE person_movie_person_id_seq OWNED BY person_movie.person_id;


--
-- Name: person_movie_person_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE person_movie_person_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_movie_person_movie_id_seq OWNER TO chrisaanerud;

--
-- Name: person_movie_person_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE person_movie_person_movie_id_seq OWNED BY person_movie.person_movie_id;


--
-- Name: review; Type: TABLE; Schema: public; Owner: chrisaanerud
--

CREATE TABLE review (
    user_review_score double precision,
    critic_review_score double precision,
    review_id integer NOT NULL,
    movie_id integer
);


ALTER TABLE review OWNER TO chrisaanerud;

--
-- Name: role; Type: TABLE; Schema: public; Owner: chrisaanerud
--

CREATE TABLE role (
    role_id integer NOT NULL,
    role character varying(30)
);


ALTER TABLE role OWNER TO chrisaanerud;

--
-- Name: role_movie; Type: TABLE; Schema: public; Owner: chrisaanerud
--

CREATE TABLE role_movie (
    role_movie_id integer NOT NULL,
    person_id integer NOT NULL,
    movie_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE role_movie OWNER TO chrisaanerud;

--
-- Name: role_movie_role_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE role_movie_role_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_movie_role_movie_id_seq OWNER TO chrisaanerud;

--
-- Name: role_movie_role_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE role_movie_role_movie_id_seq OWNED BY role_movie.role_movie_id;


--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: chrisaanerud
--

CREATE SEQUENCE role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_role_id_seq OWNER TO chrisaanerud;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chrisaanerud
--

ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;


--
-- Name: genre_movie genre_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY genre_movie ALTER COLUMN genre_id SET DEFAULT nextval('genre_movie_genre_id_seq'::regclass);


--
-- Name: genre_movie movie_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY genre_movie ALTER COLUMN movie_id SET DEFAULT nextval('genre_movie_movie_id_seq'::regclass);


--
-- Name: genre_movie genre_movie_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY genre_movie ALTER COLUMN genre_movie_id SET DEFAULT nextval('genre_movie_id_seq'::regclass);


--
-- Name: movie movie_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY movie ALTER COLUMN movie_id SET DEFAULT nextval('movie_id_seq'::regclass);


--
-- Name: person_movie person_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY person_movie ALTER COLUMN person_id SET DEFAULT nextval('person_movie_person_id_seq'::regclass);


--
-- Name: person_movie movie_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY person_movie ALTER COLUMN movie_id SET DEFAULT nextval('person_movie_movie_id_seq'::regclass);


--
-- Name: person_movie person_movie_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY person_movie ALTER COLUMN person_movie_id SET DEFAULT nextval('person_movie_person_movie_id_seq'::regclass);


--
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq'::regclass);


--
-- Name: role_movie role_movie_id; Type: DEFAULT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY role_movie ALTER COLUMN role_movie_id SET DEFAULT nextval('role_movie_role_movie_id_seq'::regclass);


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: chrisaanerud
--

COPY genre (primary_genre, sub_genre, genre_id, movie_genre_id) FROM stdin;
Drama	War	1	10
Drama	Crime	2	9
Drama	Crime	3	8
Drama	Crime	4	7
Drama	Sci-Fi	5	6
Drama	Sci-Fi	6	5
Drama	Crime	7	4
Drama	Crime	8	3
Drama	Crime	9	2
Drama	\N	10	1
\.


--
-- Data for Name: genre_movie; Type: TABLE DATA; Schema: public; Owner: chrisaanerud
--

COPY genre_movie (genre_id, movie_id, genre_movie_id) FROM stdin;
10	1	1
9	2	2
8	3	3
7	4	4
6	5	5
5	6	6
4	7	7
3	8	8
2	9	9
1	10	10
\.


--
-- Name: genre_movie_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('genre_movie_genre_id_seq', 1, false);


--
-- Name: genre_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('genre_movie_id_seq', 1, false);


--
-- Name: genre_movie_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('genre_movie_movie_id_seq', 1, false);


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: chrisaanerud
--

COPY movie (title, release_date, length, primary_language, movie_id, rating, country, budget, gross, released_by) FROM stdin;
Shawshank Redemption	1994-10-14	142	English	1	R	USA	25000000	29000000	Castle Rock Entertainment
The Dark Knight	2008-07-18	152	English	2	PG-13	USA	185000000	534000000	Warner Bros
Pulp Fiction	1994-10-14	154	English	3	R	USA	8000000	108000000	Miramax
Fight Club	1999-10-15	139	English	4	R	USA	63000000	38000000	Fox 2000
Inception	2010-07-16	148	English	5	PG-13	USA	160000000	293000000	Warner Bros
The Matrix	1999-03-31	136	English	6	R	USA	63000000	173000000	Warner Bros
City of God	2004-02-13	130	Portuguese	7	R	Brazil	4000000	8000000	Lighthouse Pictures
The Usual Suspects	1995-09-15	106	English	8	R	USA	6000000	24000000	Polygram Filmed Entertainment
L.A. Confidential	1997-09-19	138	English	9	R	USA	35000000	65000000	Regency Enterprises
Saving Private Ryan	1998-07-24	169	English	10	R	USA	70000000	217000000	Dreamworks
\.


--
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('movie_id_seq', 1, false);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: chrisaanerud
--

COPY person (first_name, last_name, person_id, "movie_person-id") FROM stdin;
Tom	Hanks	1	10
Kevin 	Spacey	2	9
Kevin	Spacey	3	8
Alexandre	Rodrigues	4	7
Keanu 	Reeves	5	6
Leonardo	Dicaprio	6	5
Brad	Pitt	7	4
John	Travolta	8	3
Christian	Bale	9	2
Tim	Robbins	10	1
Steven	Spielberg	11	10
Robert 	Rodat	12	10
Tom 	Brown	13	10
Ruth 	Myers	16	9
Curtis	Hanson	14	9
Brian	Helgeland	15	9
Bryan 	Singer	17	8
Christopher	McQuarrie	18	8
John	Ottman	19	8
Fernando	Mierreles	20	7
Braulio	Mantovani	21	7
Cesar	Charlone	22	7
Lana	Wackowski	23	6
Lilly	Wackowski	24	6
Lisa	Brennan	25	6
Christopher	Nolan	26	5
Larry 	Dias	27	5
David	Fincher	28	4
Jim	Uhls	29	4
Jessica	Bellfort	30	4
Quentin	Tarantino	31	3
Frank	Darabont	32	1
\.


--
-- Data for Name: person_movie; Type: TABLE DATA; Schema: public; Owner: chrisaanerud
--

COPY person_movie (person_id, movie_id, person_movie_id) FROM stdin;
32	1	1
10	1	2
9	2	3
26	2	4
8	3	5
31	3	6
31	3	7
29	4	8
30	4	9
28	4	10
7	4	11
26	5	12
6	5	13
7	5	14
24	6	15
23	6	16
5	6	17
25	6	18
20	7	19
22	7	20
4	7	21
21	7	22
17	8	23
3	8	24
18	8	25
19	8	26
15	9	27
14	9	28
16	9	29
2	9	30
13	10	31
1	10	32
12	10	33
11	10	34
\.


--
-- Name: person_movie_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('person_movie_movie_id_seq', 5, true);


--
-- Name: person_movie_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('person_movie_person_id_seq', 5, true);


--
-- Name: person_movie_person_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('person_movie_person_movie_id_seq', 3, true);


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: chrisaanerud
--

COPY review (user_review_score, critic_review_score, review_id, movie_id) FROM stdin;
9.30000000000000071	80	1	1
9	82	2	2
8.90000000000000036	94	3	3
8.80000000000000071	66	4	4
8.80000000000000071	74	5	5
8.69999999999999929	73	6	6
8.69999999999999929	79	7	7
8.59999999999999964	77	8	8
8.30000000000000071	90	9	9
8.59999999999999964	90	10	10
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: chrisaanerud
--

COPY role (role_id, role) FROM stdin;
1	Director
2	Actor
3	Writer
4	Crew
\.


--
-- Data for Name: role_movie; Type: TABLE DATA; Schema: public; Owner: chrisaanerud
--

COPY role_movie (role_movie_id, person_id, movie_id, role_id) FROM stdin;
1	1	10	2
2	2	9	2
3	3	8	2
4	4	7	2
5	5	6	2
6	6	5	2
7	7	4	2
8	8	3	2
9	9	2	2
10	10	1	2
11	11	10	1
12	12	10	3
13	13	10	4
14	14	9	4
15	15	9	2
16	16	9	3
17	17	8	2
18	18	8	3
19	19	8	4
20	20	7	2
21	21	7	3
22	22	7	4
23	23	6	2
24	24	6	3
25	25	6	4
26	26	5	2
27	27	5	4
28	28	4	2
29	29	4	3
30	30	4	4
31	31	3	2
32	32	1	2
\.


--
-- Name: role_movie_role_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('role_movie_role_movie_id_seq', 2, true);


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chrisaanerud
--

SELECT pg_catalog.setval('role_role_id_seq', 4, true);


--
-- Name: genre genre_id_pk; Type: CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_id_pk PRIMARY KEY (genre_id);


--
-- Name: genre_movie genre_movie_id_pk; Type: CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY genre_movie
    ADD CONSTRAINT genre_movie_id_pk PRIMARY KEY (genre_movie_id);


--
-- Name: movie movie_id_pk; Type: CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_id_pk PRIMARY KEY (movie_id);


--
-- Name: person person_id_pk; Type: CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_id_pk PRIMARY KEY (person_id);


--
-- Name: person_movie person_movie_person_movie_id_pk; Type: CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY person_movie
    ADD CONSTRAINT person_movie_person_movie_id_pk PRIMARY KEY (person_movie_id);


--
-- Name: review review_id_pk; Type: CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY review
    ADD CONSTRAINT review_id_pk PRIMARY KEY (review_id);


--
-- Name: role_movie role_movie_role_movie_id_pk; Type: CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY role_movie
    ADD CONSTRAINT role_movie_role_movie_id_pk PRIMARY KEY (role_movie_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: genre_movie_id_uindex; Type: INDEX; Schema: public; Owner: chrisaanerud
--

CREATE UNIQUE INDEX genre_movie_id_uindex ON genre_movie USING btree (genre_movie_id);


--
-- Name: movie_id_uindex; Type: INDEX; Schema: public; Owner: chrisaanerud
--

CREATE UNIQUE INDEX movie_id_uindex ON movie USING btree (movie_id);


--
-- Name: person_movie_person_movie_id_uindex; Type: INDEX; Schema: public; Owner: chrisaanerud
--

CREATE UNIQUE INDEX person_movie_person_movie_id_uindex ON person_movie USING btree (person_movie_id);


--
-- Name: role_role_id_uindex; Type: INDEX; Schema: public; Owner: chrisaanerud
--

CREATE UNIQUE INDEX role_role_id_uindex ON role USING btree (role_id);


--
-- Name: genre_movie genre_movie_genre_genre_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY genre_movie
    ADD CONSTRAINT genre_movie_genre_genre_id_fk FOREIGN KEY (genre_id) REFERENCES genre(genre_id);


--
-- Name: genre_movie genre_movie_movie_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY genre_movie
    ADD CONSTRAINT genre_movie_movie_movie_id_fk FOREIGN KEY (movie_id) REFERENCES movie(movie_id);


--
-- Name: person_movie person_movie_movie_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY person_movie
    ADD CONSTRAINT person_movie_movie_movie_id_fk FOREIGN KEY (movie_id) REFERENCES movie(movie_id);


--
-- Name: person_movie person_movie_person_person_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY person_movie
    ADD CONSTRAINT person_movie_person_person_id_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: review review_movie_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY review
    ADD CONSTRAINT review_movie_movie_id_fk FOREIGN KEY (movie_id) REFERENCES movie(movie_id);


--
-- Name: role_movie role_movie_movie_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY role_movie
    ADD CONSTRAINT role_movie_movie_movie_id_fk FOREIGN KEY (movie_id) REFERENCES movie(movie_id);


--
-- Name: role_movie role_movie_role_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: chrisaanerud
--

ALTER TABLE ONLY role_movie
    ADD CONSTRAINT role_movie_role_role_id_fk FOREIGN KEY (role_id) REFERENCES role(role_id);


--
-- PostgreSQL database dump complete
--

