--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: candidates; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.candidates (
    candidates_id integer NOT NULL,
    star_id integer NOT NULL,
    distance_in_ly integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.candidates OWNER TO freecodecamp;

--
-- Name: candidates_distance_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.candidates_distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.candidates_distance_id_seq OWNER TO freecodecamp;

--
-- Name: candidates_distance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.candidates_distance_id_seq OWNED BY public.candidates.candidates_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    known_planets integer NOT NULL,
    shape character varying(20),
    years_old integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_number_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_number_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_number_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    years_old integer,
    shape character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    elements integer,
    planet_type integer,
    "percentace_of_life%" numeric(3,1),
    has_life boolean,
    comments text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_number_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_number_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_number_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    dying boolean,
    galaxy_id integer,
    years_old integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_number_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_number_seq OWNER TO freecodecamp;

--
-- Name: star_star_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_number_seq OWNED BY public.star.star_id;


--
-- Name: candidates candidates_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.candidates ALTER COLUMN candidates_id SET DEFAULT nextval('public.candidates_distance_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_number_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_number_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_number_seq'::regclass);


--
-- Data for Name: candidates; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.candidates VALUES (1, 2, 60, NULL);
INSERT INTO public.candidates VALUES (2, 3, 160, NULL);
INSERT INTO public.candidates VALUES (3, 4, 200, NULL);
INSERT INTO public.candidates VALUES (4, 5, 210, NULL);
INSERT INTO public.candidates VALUES (5, 6, 220, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 8, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 15, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 150, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Bodes Galaxy', 250, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sunflower Galaxy', 850, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Black Eye Galaxy', 3550, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', NULL, NULL);
INSERT INTO public.moon VALUES (2, 3, 'Metis', NULL, NULL);
INSERT INTO public.moon VALUES (3, 3, 'Adrastea', NULL, NULL);
INSERT INTO public.moon VALUES (4, 3, 'Amalthea', NULL, NULL);
INSERT INTO public.moon VALUES (5, 3, 'Thebe', NULL, NULL);
INSERT INTO public.moon VALUES (6, 3, 'Io', NULL, NULL);
INSERT INTO public.moon VALUES (7, 3, 'Europa', NULL, NULL);
INSERT INTO public.moon VALUES (8, 3, 'Ganymede', NULL, NULL);
INSERT INTO public.moon VALUES (9, 3, 'Callisto', NULL, NULL);
INSERT INTO public.moon VALUES (10, 3, 'Leda', NULL, NULL);
INSERT INTO public.moon VALUES (11, 2, 'Phobos', NULL, NULL);
INSERT INTO public.moon VALUES (12, 2, 'Deimos', NULL, NULL);
INSERT INTO public.moon VALUES (13, 5, 'Titan', NULL, NULL);
INSERT INTO public.moon VALUES (14, 5, 'Rhea', NULL, NULL);
INSERT INTO public.moon VALUES (15, 5, 'Tethys', NULL, NULL);
INSERT INTO public.moon VALUES (16, 5, 'Dione', NULL, NULL);
INSERT INTO public.moon VALUES (17, 5, 'Enceladus', NULL, NULL);
INSERT INTO public.moon VALUES (18, 5, 'Iapetus', NULL, NULL);
INSERT INTO public.moon VALUES (19, 5, 'Mimas', NULL, NULL);
INSERT INTO public.moon VALUES (20, 5, 'Foreign', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'New Planet Name', 80, 1, 99.0, true, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 60, 1, 40.0, false, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 30, 1, 10.0, false, NULL, 1);
INSERT INTO public.planet VALUES (4, 'VENUS', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Europa', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'X-22', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'X-23', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'X-24', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (13, 'Xbe233', NULL, NULL, NULL, NULL, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SolarBE', false, 1, NULL);
INSERT INTO public.star VALUES (2, 'SolarB121', false, 2, NULL);
INSERT INTO public.star VALUES (3, 'SolarB122', false, 2, NULL);
INSERT INTO public.star VALUES (4, 'SolarB123', true, 3, NULL);
INSERT INTO public.star VALUES (5, 'SolarB124', true, 3, NULL);
INSERT INTO public.star VALUES (6, 'SolarB125', true, 3, NULL);
INSERT INTO public.star VALUES (7, 'SolarB126', true, 3, NULL);


--
-- Name: candidates_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.candidates_distance_id_seq', 5, true);


--
-- Name: galaxy_galaxy_number_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_number_seq', 3, true);


--
-- Name: planet_planet_number_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_number_seq', 13, true);


--
-- Name: star_star_number_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_number_seq', 7, true);


--
-- Name: candidates candidates_distance_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_distance_id_key UNIQUE (candidates_id);


--
-- Name: candidates candidates_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (candidates_id);


--
-- Name: galaxy galaxy_galaxy_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_number_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_number_key UNIQUE (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: candidates candidates_star_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_star_number_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_number_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_number_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_number_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

