--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    mass integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_key_seq OWNER TO freecodecamp;

--
-- Name: asteroid_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_key_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    type text NOT NULL,
    luminosity numeric,
    velocity numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_key_seq OWNER TO freecodecamp;

--
-- Name: galaxy_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_key_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    mass numeric,
    rotation_period numeric,
    primary_material character varying,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_key_seq OWNER TO freecodecamp;

--
-- Name: moon_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_key_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    radius integer,
    mass integer,
    habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_key_seq OWNER TO freecodecamp;

--
-- Name: planet_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_key_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    phase text,
    temp numeric,
    will_go_nova boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_key_seq OWNER TO freecodecamp;

--
-- Name: star_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_key_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_key_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_key_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_key_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_key_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_key_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '1 Ceres', NULL);
INSERT INTO public.asteroid VALUES (2, '4 Vesta', NULL);
INSERT INTO public.asteroid VALUES (3, '2 Pallas', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'milkyway', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'SagDEG', 'dSPH', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'LMC', 'SB(s)m', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Bootes 1', 'dSph', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'SMC', 'pec', NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Andromeda', 'spiral', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Io', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (6, 'Deimos', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (7, 'Phobos', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (8, 'Enceladus', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (9, 'Titan', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Charon', NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (11, 'Hydra', NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (12, 'Nix', NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (13, 'Styx', NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (14, 'Kerberos', NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (15, 'Ariel', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Obveron', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Puck', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Rosalind', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Titania', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Umbriel', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (21, 'Triton', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (22, 'Proteus', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (23, 'Larissa', NULL, NULL, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (2, 'mars', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'mercury', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'venus', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (5, 'uranus', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (6, 'neptune', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (7, 'saturn', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (8, 'jupiter', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (9, 'planetc', NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (10, 'planetb', NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (11, 'planeta', NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'pluto', NULL, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'sun', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'AD Leonis', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'Gliese 832', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (5, 'Gliese 682', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (6, 'Omicron Eridani', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (7, '70 Ophiuchi', NULL, NULL, NULL, 2);


--
-- Name: asteroid_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_key_seq', 3, true);


--
-- Name: galaxy_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_key_seq', 8, true);


--
-- Name: moon_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_key_seq', 24, true);


--
-- Name: planet_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_key_seq', 12, true);


--
-- Name: star_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_key_seq', 7, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uniq UNIQUE (name);


--
-- Name: asteroid uniqa; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT uniqa UNIQUE (name);


--
-- Name: galaxy uniqg; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniqg UNIQUE (name);


--
-- Name: planet uniqp; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniqp UNIQUE (name);


--
-- Name: star uniqs; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uniqs UNIQUE (name);


--
-- Name: star fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_parent_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_parent_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

