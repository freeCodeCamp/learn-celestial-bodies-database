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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    description text NOT NULL,
    galaxy_shape_id integer NOT NULL,
    long integer,
    wide integer
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
-- Name: galaxy_shape; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_shape (
    galaxy_shape_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_shape OWNER TO freecodecamp;

--
-- Name: galaxy_shape_galaxy_shape_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_shape_galaxy_shape_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_shape_galaxy_shape_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_shape_galaxy_shape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_shape_galaxy_shape_id_seq OWNED BY public.galaxy_shape.galaxy_shape_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_live boolean NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_live boolean NOT NULL,
    has_water boolean NOT NULL,
    description text,
    star_id integer NOT NULL
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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age numeric,
    description text,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_shape galaxy_shape_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_shape ALTER COLUMN galaxy_shape_id SET DEFAULT nextval('public.galaxy_shape_galaxy_shape_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda, which', 1, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxy', 'similar to, which', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'spiral arms point, which', 4, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw Galaxy', 'bears claw., which', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Black Eye  Galaxy', 'absorbing dch', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Bodes  Galaxy', 'discovered this', 1, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Bodes  Galaxy', 'discovered this', 1, NULL, NULL);


--
-- Data for Name: galaxy_shape; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_shape VALUES (1, 'Spiral Galaxies', ' These galaxies resemble');
INSERT INTO public.galaxy_shape VALUES (2, 'Elliptical Galaxies', 'Elliptical galaxies');
INSERT INTO public.galaxy_shape VALUES (3, 'Lenticular Galaxies', 'Lenticular galaxies');
INSERT INTO public.galaxy_shape VALUES (4, 'Irregular Galaxies', 'Irregular galaxies');
INSERT INTO public.galaxy_shape VALUES (5, 'Active Galaxies', ' Around 10% of known galaxies');
INSERT INTO public.galaxy_shape VALUES (6, 'Seyfert Galaxies', ' Seyfert galaxies');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Lynx', NULL, 'NULL', 1);
INSERT INTO public.star VALUES (2, 'Eridanus', NULL, 'NULL', 3);
INSERT INTO public.star VALUES (3, 'Cassiopeia', NULL, 'NULL', 4);
INSERT INTO public.star VALUES (4, 'Scorpius', NULL, 'NULL', 2);
INSERT INTO public.star VALUES (5, 'Crux', NULL, 'NULL', 3);
INSERT INTO public.star VALUES (6, 'Cmancer', NULL, 'NULL', 4);
INSERT INTO public.star VALUES (7, 'Leo', NULL, 'NULL', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

 INSERT INTO public.planet VALUES (1, 'Giant planet', true, true, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Ice giant planet', true, true, NULL, 2);
INSERT INTO public.planet VALUES (3, 'Mini-Neptune planet', true, true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Super-Earth planet', true, true, NULL, 3);
INSERT INTO public.planet VALUES (5, 'Super-Jupiter planet', true, true, NULL, 2);
INSERT INTO public.planet VALUES (6, 'Sub-Earth planet', true, true, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Circumbinary planet', true, true, NULL, 4);
INSERT INTO public.planet VALUES (8, 'Double planet', true, false, NULL, 5);
INSERT INTO public.planet VALUES (9, 'Eccentric Jupiter planet', true, true, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Exoplanet planet', true, true, NULL, 5);
INSERT INTO public.planet VALUES (11, 'Extragalactic planet', false, true, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Goldilocks planet', true, true, NULL, 1);
INSERT INTO public.planet VALUES (13, 'Hot Jupiter planet', true, false, NULL, 3);
INSERT INTO public.planet VALUES (14, 'Hot Neptune planet', true, true, NULL, 2);
INSERT INTO public.planet VALUES (15, 'Inferior planets planet', false, true, NULL, 2);
INSERT INTO public.planet VALUES (16, 'Inner planet planet', false, true, NULL, 1);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos  ', true, true, 2);
INSERT INTO public.moon VALUES (3, 'Europa', true, false, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, true, 7);
INSERT INTO public.moon VALUES (5, 'Io', true, false, 10);
INSERT INTO public.moon VALUES (6, 'Dione', true, true, 1);
INSERT INTO public.moon VALUES (7, 'Enceladus', false, false, 3);
INSERT INTO public.moon VALUES (8, 'Hyperion', true, false, 4);
INSERT INTO public.moon VALUES (9, 'Iapetus', true, false, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', false, false, 6);
INSERT INTO public.moon VALUES (11, 'Phoebe', true, false, 11);
INSERT INTO public.moon VALUES (12, 'Rhea', true, false, 12);
INSERT INTO public.moon VALUES (13, 'Tethys', true, false, 5);
INSERT INTO public.moon VALUES (14, 'Titan', false, true, 14);
INSERT INTO public.moon VALUES (15, 'Ariel', true, true, 12);
INSERT INTO public.moon VALUES (16, 'Miranda', true, true, 4);
INSERT INTO public.moon VALUES (17, 'Oberon', true, true, 6);
INSERT INTO public.moon VALUES (18, 'Titania', true, false, 8);
INSERT INTO public.moon VALUES (19, 'Umbriel', true, true, 10);
INSERT INTO public.moon VALUES (20, 'Nereid', false, false, 12);



--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: galaxy_shape_galaxy_shape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_shape_galaxy_shape_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_shape galaxy_shape_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_shape
    ADD CONSTRAINT galaxy_shape_name_key UNIQUE (name);


--
-- Name: galaxy_shape galaxy_shape_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_shape
    ADD CONSTRAINT galaxy_shape_pkey PRIMARY KEY (galaxy_shape_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

