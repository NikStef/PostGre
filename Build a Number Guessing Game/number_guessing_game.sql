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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    username_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: usernames_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_username_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_username_id_seq OWNED BY public.usernames.username_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: usernames username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames ALTER COLUMN username_id SET DEFAULT nextval('public.usernames_username_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 25);
INSERT INTO public.games VALUES (2, 1, 35);
INSERT INTO public.games VALUES (3, 1, 10);
INSERT INTO public.games VALUES (4, 14, 418);
INSERT INTO public.games VALUES (5, 14, 465);
INSERT INTO public.games VALUES (6, 15, 724);
INSERT INTO public.games VALUES (7, 15, 733);
INSERT INTO public.games VALUES (8, 14, 915);
INSERT INTO public.games VALUES (9, 14, 772);
INSERT INTO public.games VALUES (10, 14, 199);
INSERT INTO public.games VALUES (11, 16, 360);
INSERT INTO public.games VALUES (12, 16, 180);
INSERT INTO public.games VALUES (13, 17, 648);
INSERT INTO public.games VALUES (14, 17, 815);
INSERT INTO public.games VALUES (15, 16, 369);
INSERT INTO public.games VALUES (16, 16, 12);
INSERT INTO public.games VALUES (17, 16, 647);
INSERT INTO public.games VALUES (18, 18, 126);
INSERT INTO public.games VALUES (19, 18, 401);
INSERT INTO public.games VALUES (20, 19, 213);
INSERT INTO public.games VALUES (21, 19, 121);
INSERT INTO public.games VALUES (22, 18, 37);
INSERT INTO public.games VALUES (23, 18, 303);
INSERT INTO public.games VALUES (24, 18, 567);
INSERT INTO public.games VALUES (25, 20, 517);
INSERT INTO public.games VALUES (26, 20, 568);
INSERT INTO public.games VALUES (27, 21, 733);
INSERT INTO public.games VALUES (28, 21, 758);
INSERT INTO public.games VALUES (29, 20, 383);
INSERT INTO public.games VALUES (30, 20, 45);
INSERT INTO public.games VALUES (31, 20, 333);
INSERT INTO public.games VALUES (32, 22, 84);
INSERT INTO public.games VALUES (33, 22, 548);
INSERT INTO public.games VALUES (34, 23, 682);
INSERT INTO public.games VALUES (35, 23, 676);
INSERT INTO public.games VALUES (36, 22, 646);
INSERT INTO public.games VALUES (37, 22, 989);
INSERT INTO public.games VALUES (38, 22, 394);
INSERT INTO public.games VALUES (39, 1, 10);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES (1, 'Link');
INSERT INTO public.usernames VALUES (2, 'user_1733935207895');
INSERT INTO public.usernames VALUES (3, 'user_1733935207894');
INSERT INTO public.usernames VALUES (4, 'user_1733935268536');
INSERT INTO public.usernames VALUES (5, 'user_1733935268535');
INSERT INTO public.usernames VALUES (6, 'user_1733936575258');
INSERT INTO public.usernames VALUES (7, 'user_1733936575257');
INSERT INTO public.usernames VALUES (8, 'user_1733936647746');
INSERT INTO public.usernames VALUES (9, 'user_1733936647745');
INSERT INTO public.usernames VALUES (10, 'user_1733936726021');
INSERT INTO public.usernames VALUES (11, 'user_1733936726020');
INSERT INTO public.usernames VALUES (12, 'user_1733937457748');
INSERT INTO public.usernames VALUES (13, 'user_1733937457747');
INSERT INTO public.usernames VALUES (14, 'user_1733937760309');
INSERT INTO public.usernames VALUES (15, 'user_1733937760308');
INSERT INTO public.usernames VALUES (16, 'user_1733937797026');
INSERT INTO public.usernames VALUES (17, 'user_1733937797025');
INSERT INTO public.usernames VALUES (18, 'user_1733937877737');
INSERT INTO public.usernames VALUES (19, 'user_1733937877736');
INSERT INTO public.usernames VALUES (20, 'user_1733938002182');
INSERT INTO public.usernames VALUES (21, 'user_1733938002181');
INSERT INTO public.usernames VALUES (22, 'user_1733938038119');
INSERT INTO public.usernames VALUES (23, 'user_1733938038118');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 39, true);


--
-- Name: usernames_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_username_id_seq', 23, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (username_id);


--
-- Name: usernames usernames_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_username_key UNIQUE (username);


--
-- Name: games games_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.usernames(username_id);


--
-- PostgreSQL database dump complete
--

