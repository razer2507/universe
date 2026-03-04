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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    age integer,
    galaxy_type text,
    galaxy_id integer NOT NULL,
    diameter numeric(10,2),
    mass numeric(10,2),
    discovery_year integer,
    has_black_hole boolean,
    is_active boolean,
    rotation_speed numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    age integer,
    planet_type text,
    moon_id integer NOT NULL,
    diameter numeric(10,2),
    mass numeric(10,2),
    gravity numeric(10,2),
    distance_from_planet numeric(10,2),
    discovery_year integer,
    has_atmosphere boolean,
    has_geologic_activity boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    age integer,
    planet_type text,
    planet_id integer NOT NULL,
    diameter numeric(10,2),
    mass numeric(10,2),
    gravity numeric(10,2),
    radius numeric(10,2),
    discovery_year integer,
    has_life boolean,
    has_atmosphere boolean,
    is_exoplanet boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    star_type text,
    star_id integer NOT NULL,
    diameter numeric(10,2),
    mass numeric(10,2),
    temp_in_kelvin numeric(10,2),
    is_binary boolean,
    is_variable boolean,
    discovery_year integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (4, 'Orión', 1);
INSERT INTO public.constellation VALUES (5, 'Osa Mayor', 1);
INSERT INTO public.constellation VALUES (6, 'Casiopea', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Vía Láctea', 13000, 'Espiral', 1, 100000.00, 1.50, NULL, true, true, NULL);
INSERT INTO public.galaxy VALUES ('Andrómeda', 10000, 'Espiral', 2, 220000.00, 1.20, NULL, true, true, NULL);
INSERT INTO public.galaxy VALUES ('Sombrero', 13200, 'Lenticular', 3, 50000.00, 0.80, NULL, true, false, NULL);
INSERT INTO public.galaxy VALUES ('Triángulo', 12000, 'Espiral', 4, 60000.00, 0.50, NULL, false, true, NULL);
INSERT INTO public.galaxy VALUES ('Centaurus A', 13000, 'Elíptica', 5, 97000.00, 1.00, NULL, true, true, NULL);
INSERT INTO public.galaxy VALUES ('Bode', 13500, 'Espiral', 6, 90000.00, 1.10, NULL, true, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, false, false, 1);
INSERT INTO public.moon VALUES ('Fobos', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, false, false, 2);
INSERT INTO public.moon VALUES ('Deimos', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, false, false, 2);
INSERT INTO public.moon VALUES ('Dogstar-1', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, true, true, 3);
INSERT INTO public.moon VALUES ('Dogstar-2', NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, true, false, 3);
INSERT INTO public.moon VALUES ('Pup-A', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, false, true, 4);
INSERT INTO public.moon VALUES ('Alpha-Moon-1', NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, true, true, 5);
INSERT INTO public.moon VALUES ('Alpha-Moon-2', NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, false, false, 5);
INSERT INTO public.moon VALUES ('A10-Satellite', NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, true, true, 6);
INSERT INTO public.moon VALUES ('Somb-Luna-A', NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, true, false, 7);
INSERT INTO public.moon VALUES ('Somb-Luna-B', NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, false, true, 7);
INSERT INTO public.moon VALUES ('Dust-1', NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, false, false, 8);
INSERT INTO public.moon VALUES ('Dust-2', NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, false, false, 8);
INSERT INTO public.moon VALUES ('Ice-Ball-1', NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, false, true, 9);
INSERT INTO public.moon VALUES ('Ocean-Moon', NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, true, true, 10);
INSERT INTO public.moon VALUES ('Bode-Guardian', NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, true, true, 11);
INSERT INTO public.moon VALUES ('Bode-Shadow', NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, false, false, 11);
INSERT INTO public.moon VALUES ('Carbon-Rock', NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, false, false, 12);
INSERT INTO public.moon VALUES ('Dark-Moon', NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, false, true, 12);
INSERT INTO public.moon VALUES ('Extra-Moon', NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, false, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Tierra', NULL, 'Terrestre', 1, NULL, NULL, NULL, NULL, NULL, true, true, false, 1);
INSERT INTO public.planet VALUES ('Marte', NULL, 'Terrestre', 2, NULL, NULL, NULL, NULL, NULL, false, true, false, 1);
INSERT INTO public.planet VALUES ('Sirius-B1', NULL, 'Gaseoso', 3, NULL, NULL, NULL, NULL, NULL, false, true, true, 2);
INSERT INTO public.planet VALUES ('Sirius-B2', NULL, 'Rocoso', 4, NULL, NULL, NULL, NULL, NULL, false, false, true, 2);
INSERT INTO public.planet VALUES ('Alph-9', NULL, 'Neptuniano', 5, NULL, NULL, NULL, NULL, NULL, false, true, true, 3);
INSERT INTO public.planet VALUES ('Alph-10', NULL, 'Super-Tierra', 6, NULL, NULL, NULL, NULL, NULL, false, true, true, 3);
INSERT INTO public.planet VALUES ('Somb-X1', NULL, 'Joviano', 7, NULL, NULL, NULL, NULL, NULL, false, true, true, 4);
INSERT INTO public.planet VALUES ('Somb-X2', NULL, 'Desierto', 8, NULL, NULL, NULL, NULL, NULL, false, true, true, 4);
INSERT INTO public.planet VALUES ('Tri-Alpha', NULL, 'Hielo', 9, NULL, NULL, NULL, NULL, NULL, false, false, true, 5);
INSERT INTO public.planet VALUES ('Tri-Beta', NULL, 'Oceánico', 10, NULL, NULL, NULL, NULL, NULL, true, true, true, 5);
INSERT INTO public.planet VALUES ('Bode-99', NULL, 'Gigante', 11, NULL, NULL, NULL, NULL, NULL, false, true, true, 6);
INSERT INTO public.planet VALUES ('Bode-100', NULL, 'Carbonoso', 12, NULL, NULL, NULL, NULL, NULL, false, false, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sol', 4600, 'G2V', 1, 1.39, 1.00, 5778.00, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Sirius', 242, 'A1V', 2, 2.38, 2.06, 9940.00, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Alpheratz', 60, 'B8IV', 3, 2.70, 3.60, 13800.00, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES ('Sombrero-Alpha', 1000, 'Gigante', 4, 15.00, 20.00, 25000.00, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES ('Trianguli-1', 500, 'Enana', 5, 0.01, 0.60, 10000.00, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES ('Bode-Prime', 8000, 'Supergigante', 6, 900.00, 15.00, 3500.00, NULL, NULL, NULL, 6);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

