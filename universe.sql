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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    origin_desc text NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_life boolean NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    num_of_stars integer
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
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric,
    planet_id integer,
    discovery_date date
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
    name character varying(30) NOT NULL,
    num_of_moons integer NOT NULL,
    star_id integer,
    is_habitable boolean
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
    name character varying(30) NOT NULL,
    stellar_classify character varying(20) NOT NULL,
    constellation_id integer,
    is_black_hole_candidate boolean,
    galaxy_id integer
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

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


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

INSERT INTO public.constellation VALUES (1, 'Ursa Majo', 'Ursa Major is a constellation known as the Great Bear. In Greek mythology, its linked to the story of Callisto, a nymph turned into a bear by Artemis. To avoid her son killing her, Zeus placed them both in the sky as Ursa Major and Ursa Minor. Its recognizable by its distinctive bear-like shape and serves as a prominent navigational aid.');
INSERT INTO public.constellation VALUES (2, 'Orion', 'Orion is a constellation named after a Greek hunter. He boasted of his hunting prowess, angering Artemis, who sent a scorpion to kill him. Both Orion and the scorpion were placed in the sky as constellations, forming the familiar shape we see today.');
INSERT INTO public.constellation VALUES (3, 'Canis Major', 'Canis Major is a constellation named after the Greater Dog in Greek mythology. It represents the loyal hunting companion of Orion, the giant hunter. According to legend, Canis Major is a faithful dog named Laelaps or sometimes just the dog that was known for its incredible speed and strength. It is often depicted following Orion in the night sky.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 'spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', false, 'spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', false, 'lenticular galaxy', NULL);
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', false, 'Elliptical galaxy', NULL);
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds', false, 'dwarf galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, 1, NULL);
INSERT INTO public.moon VALUES (2, 'phobos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Io', NULL, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Jupiter LXI', NULL, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Kallichore', NULL, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Philophrosyne', NULL, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Cyllene', NULL, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Adrastea', NULL, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', NULL, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Iapetus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Tethys', NULL, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Mimas', NULL, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Hyperion', NULL, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Telesto', NULL, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Epimetheus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (22, 'Dione', NULL, 6, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 3, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 0, 3, false);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 3, false);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 3, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 3, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 3, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 3, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 3, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 0, 7, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 0, 7, false);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 0, 7, false);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri e', 0, 7, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Rigel', 'B8 Ia', NULL, true, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'B8', NULL, true, 2);
INSERT INTO public.star VALUES (3, 'sol,', 'G2V', NULL, false, 1);
INSERT INTO public.star VALUES (4, 'Antares', 'M1.5Iab-Ib', NULL, true, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'M1-2', NULL, false, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A0', NULL, false, 1);
INSERT INTO public.star VALUES (7, 'dwarf star Proxima Centauri', 'M5. 5', NULL, false, 1);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation uq_constellations_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT uq_constellations_name UNIQUE (name);


--
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: star fk_galaxy_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- PostgreSQL database dump complete
--

