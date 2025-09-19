--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer,
    guesses integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 9);
INSERT INTO public.games VALUES (2, 2, 348);
INSERT INTO public.games VALUES (3, 2, 103);
INSERT INTO public.games VALUES (4, 3, 983);
INSERT INTO public.games VALUES (5, 3, 47);
INSERT INTO public.games VALUES (6, 2, 307);
INSERT INTO public.games VALUES (7, 2, 959);
INSERT INTO public.games VALUES (8, 2, 45);
INSERT INTO public.games VALUES (9, 4, 975);
INSERT INTO public.games VALUES (10, 4, 808);
INSERT INTO public.games VALUES (11, 5, 7);
INSERT INTO public.games VALUES (12, 5, 629);
INSERT INTO public.games VALUES (13, 4, 288);
INSERT INTO public.games VALUES (14, 4, 714);
INSERT INTO public.games VALUES (15, 4, 14);
INSERT INTO public.games VALUES (16, 1, 15);
INSERT INTO public.games VALUES (17, 6, 523);
INSERT INTO public.games VALUES (18, 6, 906);
INSERT INTO public.games VALUES (19, 7, 563);
INSERT INTO public.games VALUES (20, 7, 742);
INSERT INTO public.games VALUES (21, 6, 863);
INSERT INTO public.games VALUES (22, 6, 788);
INSERT INTO public.games VALUES (23, 6, 762);
INSERT INTO public.games VALUES (24, 8, 855);
INSERT INTO public.games VALUES (25, 8, 450);
INSERT INTO public.games VALUES (26, 9, 351);
INSERT INTO public.games VALUES (27, 9, 280);
INSERT INTO public.games VALUES (28, 8, 186);
INSERT INTO public.games VALUES (29, 8, 296);
INSERT INTO public.games VALUES (30, 8, 867);
INSERT INTO public.games VALUES (31, 1, 13);
INSERT INTO public.games VALUES (32, 10, 977);
INSERT INTO public.games VALUES (33, 10, 804);
INSERT INTO public.games VALUES (34, 11, 690);
INSERT INTO public.games VALUES (35, 11, 162);
INSERT INTO public.games VALUES (36, 10, 418);
INSERT INTO public.games VALUES (37, 10, 258);
INSERT INTO public.games VALUES (38, 10, 326);
INSERT INTO public.games VALUES (39, 12, 437);
INSERT INTO public.games VALUES (40, 12, 771);
INSERT INTO public.games VALUES (41, 13, 623);
INSERT INTO public.games VALUES (42, 13, 747);
INSERT INTO public.games VALUES (43, 12, 134);
INSERT INTO public.games VALUES (44, 12, 325);
INSERT INTO public.games VALUES (45, 12, 948);
INSERT INTO public.games VALUES (46, 14, 804);
INSERT INTO public.games VALUES (47, 14, 510);
INSERT INTO public.games VALUES (48, 15, 465);
INSERT INTO public.games VALUES (49, 15, 513);
INSERT INTO public.games VALUES (50, 14, 327);
INSERT INTO public.games VALUES (51, 14, 629);
INSERT INTO public.games VALUES (52, 14, 106);
INSERT INTO public.games VALUES (53, 16, 894);
INSERT INTO public.games VALUES (54, 16, 45);
INSERT INTO public.games VALUES (55, 17, 172);
INSERT INTO public.games VALUES (56, 17, 175);
INSERT INTO public.games VALUES (57, 16, 828);
INSERT INTO public.games VALUES (58, 16, 39);
INSERT INTO public.games VALUES (59, 16, 368);
INSERT INTO public.games VALUES (60, 18, 606);
INSERT INTO public.games VALUES (61, 18, 509);
INSERT INTO public.games VALUES (62, 19, 981);
INSERT INTO public.games VALUES (63, 19, 752);
INSERT INTO public.games VALUES (64, 18, 223);
INSERT INTO public.games VALUES (65, 18, 255);
INSERT INTO public.games VALUES (66, 18, 170);
INSERT INTO public.games VALUES (67, 27, 8);
INSERT INTO public.games VALUES (68, 28, 385);
INSERT INTO public.games VALUES (69, 28, 937);
INSERT INTO public.games VALUES (70, 29, 547);
INSERT INTO public.games VALUES (71, 29, 212);
INSERT INTO public.games VALUES (72, 28, 513);
INSERT INTO public.games VALUES (73, 28, 48);
INSERT INTO public.games VALUES (74, 28, 280);
INSERT INTO public.games VALUES (75, 30, 884);
INSERT INTO public.games VALUES (76, 30, 906);
INSERT INTO public.games VALUES (77, 31, 879);
INSERT INTO public.games VALUES (78, 31, 714);
INSERT INTO public.games VALUES (79, 30, 750);
INSERT INTO public.games VALUES (80, 30, 346);
INSERT INTO public.games VALUES (81, 30, 692);
INSERT INTO public.games VALUES (82, 32, 964);
INSERT INTO public.games VALUES (83, 32, 289);
INSERT INTO public.games VALUES (84, 33, 873);
INSERT INTO public.games VALUES (85, 33, 664);
INSERT INTO public.games VALUES (86, 32, 374);
INSERT INTO public.games VALUES (87, 32, 210);
INSERT INTO public.games VALUES (88, 32, 498);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Giuli');
INSERT INTO public.users VALUES (2, 'user_1758260576401');
INSERT INTO public.users VALUES (3, 'user_1758260576400');
INSERT INTO public.users VALUES (4, 'user_1758260637873');
INSERT INTO public.users VALUES (5, 'user_1758260637872');
INSERT INTO public.users VALUES (6, 'user_1758260741284');
INSERT INTO public.users VALUES (7, 'user_1758260741283');
INSERT INTO public.users VALUES (8, 'user_1758260846867');
INSERT INTO public.users VALUES (9, 'user_1758260846866');
INSERT INTO public.users VALUES (10, 'user_1758260895602');
INSERT INTO public.users VALUES (11, 'user_1758260895601');
INSERT INTO public.users VALUES (12, 'user_1758260928311');
INSERT INTO public.users VALUES (13, 'user_1758260928310');
INSERT INTO public.users VALUES (14, 'user_1758261095372');
INSERT INTO public.users VALUES (15, 'user_1758261095371');
INSERT INTO public.users VALUES (16, 'user_1758261107182');
INSERT INTO public.users VALUES (17, 'user_1758261107181');
INSERT INTO public.users VALUES (18, 'user_1758261145510');
INSERT INTO public.users VALUES (19, 'user_1758261145509');
INSERT INTO public.users VALUES (20, 'user_1758261153795');
INSERT INTO public.users VALUES (22, 'user_1758261153794');
INSERT INTO public.users VALUES (27, 'Giulitest');
INSERT INTO public.users VALUES (28, 'user_1758261353667');
INSERT INTO public.users VALUES (29, 'user_1758261353666');
INSERT INTO public.users VALUES (30, 'user_1758261598561');
INSERT INTO public.users VALUES (31, 'user_1758261598560');
INSERT INTO public.users VALUES (32, 'user_1758261622833');
INSERT INTO public.users VALUES (33, 'user_1758261622832');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 88, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 33, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

