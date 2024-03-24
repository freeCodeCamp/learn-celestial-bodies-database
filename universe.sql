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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    galaxy_type text NOT NULL,
    no_of_stars integer
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
    name character varying(100) NOT NULL,
    planet_id integer,
    radius_km numeric NOT NULL,
    mass_kg numeric NOT NULL,
    distance_from_planet_km numeric NOT NULL,
    is_in_habitable_zone boolean,
    distance_from_earth numeric
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
    name character varying(100) NOT NULL,
    star_id integer,
    radius_km numeric NOT NULL,
    mass_kg numeric NOT NULL,
    distance_from_star_km numeric NOT NULL,
    has_atmosphere boolean,
    planet_type text,
    no_of_moons integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    spectral_type character varying(10) NOT NULL,
    luminosity real NOT NULL,
    has_life boolean,
    is_spherical boolean
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
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    description text,
    distance_from_earth_km numeric,
    spectral_type character varying(20)
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


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
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy', 13000, 'Barred Spiral', 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Closest to the Milky Way', 22000, 'Spiral', 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Third-largest galaxy in the Local Group', 5000, 'Spiral', 50);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 'Located in the Virgo cluster', 60000, 'Elliptical', 10000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 'Known for its spiral arms and interacting with NGC 5195', 23000, 'Spiral', 300);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 'A peculiar galaxy with an active galactic nucleus', 12000, 'Elliptical', 2000);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 'Spiral', 'Known for its large central bulge and prominent dust lane', 28000, 'Spiral', 100);
INSERT INTO public.galaxy VALUES (8, 'Antennae Galaxies', 'Interacting', 'A pair of colliding galaxies in the constellation Corvus', 10000, 'Irregular', 50);
INSERT INTO public.galaxy VALUES (9, 'Cigar Galaxy', 'Spiral', 'Named for its elongated appearance', 23000, 'Spiral', 20);
INSERT INTO public.galaxy VALUES (10, 'Cartwheel Galaxy', 'Ring', 'Distinctive ring structure due to a collision with a smaller galaxy', 50000, 'Ring', 10);
INSERT INTO public.galaxy VALUES (11, 'Whale Galaxy', 'Irregular', 'Resembles a whale swimming through space', 40000, 'Irregular', 15);
INSERT INTO public.galaxy VALUES (12, 'Pinwheel Galaxy', 'Spiral', 'Notable for its pinwheel shape and bright spiral arms', 25000, 'Spiral', 60);
INSERT INTO public.galaxy VALUES (13, 'Andromeda Galaxy', 'Spiral', 'Closest spiral galaxy to the Milky Way', 22000, 'Spiral', 400);
INSERT INTO public.galaxy VALUES (14, 'Tadpole Galaxy', 'Irregular', 'Displays a long tail of stars caused by tidal interactions', 10000, 'Irregular', 30);
INSERT INTO public.galaxy VALUES (15, 'NGC 1300', 'Barred Spiral', 'Features a central bar structure and spiral arms', 30000, 'Barred Spiral', 25);
INSERT INTO public.galaxy VALUES (16, 'Triangulum Galaxy', 'Spiral', 'Third-largest galaxy in the Local Group', 5000, 'Spiral', 50);
INSERT INTO public.galaxy VALUES (17, 'Starburst Galaxy', 'Irregular', 'Undergoing an exceptionally high rate of star formation', 10000, 'Irregular', 35);
INSERT INTO public.galaxy VALUES (18, 'Messier 81', 'Spiral', 'Brightest galaxy in the M81 Group', 50000, 'Spiral', 80);
INSERT INTO public.galaxy VALUES (19, 'Messier 83', 'Barred Spiral', 'Also known as the Southern Pinwheel Galaxy', 15000, 'Barred Spiral', 40);
INSERT INTO public.galaxy VALUES (20, 'Black Eye Galaxy', 'Spiral', 'Known for its prominent dust lane and dark "eye"', 30000, 'Spiral', 25);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (18, 'Luna', 1, 1737.5, 73500000000000000000000, 384400, false, NULL);
INSERT INTO public.moon VALUES (19, 'Phobos', 4, 11.1, 10659000000000000, 9377, false, NULL);
INSERT INTO public.moon VALUES (20, 'Deimos', 4, 6.2, 1476200000000000, 23460, false, NULL);
INSERT INTO public.moon VALUES (21, 'Io', 5, 1821.6, 89319000000000000000000, 421700, false, NULL);
INSERT INTO public.moon VALUES (22, 'Europa', 5, 1560.8, 47998000000000000000000, 671100, false, NULL);
INSERT INTO public.moon VALUES (23, 'Ganymede', 5, 2634.1, 148190000000000000000000, 1070000, false, NULL);
INSERT INTO public.moon VALUES (24, 'Callisto', 5, 2410.3, 107590000000000000000000, 1883000, false, NULL);
INSERT INTO public.moon VALUES (25, 'Titan', 6, 2575, 134550000000000000000000, 1221870, false, NULL);
INSERT INTO public.moon VALUES (26, 'Enceladus', 6, 252.1, 108022000000000000000, 238037, false, NULL);
INSERT INTO public.moon VALUES (27, 'Triton1', 7, 1353.4, 21390000000000000000000, 354759, false, NULL);
INSERT INTO public.moon VALUES (28, 'Charon', 8, 606, 1586000000000000000000, 19591, false, NULL);
INSERT INTO public.moon VALUES (29, 'Ariel', 9, 578.9, 1353000000000000000000, 191020, false, NULL);
INSERT INTO public.moon VALUES (30, 'Umbriel', 9, 584.7, 1272000000000000000000, 266300, false, NULL);
INSERT INTO public.moon VALUES (31, 'Titania', 9, 788.4, 3527000000000000000000, 435910, false, NULL);
INSERT INTO public.moon VALUES (32, 'Oberon', 9, 761.4, 3014000000000000000000, 583520, false, NULL);
INSERT INTO public.moon VALUES (33, 'Miranda', 9, 235.8, 65900000000000000000, 129900, false, NULL);
INSERT INTO public.moon VALUES (34, 'Triton2', 10, 1353.4, 21390000000000000000000, 354759, false, NULL);
INSERT INTO public.moon VALUES (35, 'Eris', 11, 1163, 16600000000000000000000, 55690, false, NULL);
INSERT INTO public.moon VALUES (36, 'Haumea', 12, 620, 4006000000000000000000, 64990, false, NULL);
INSERT INTO public.moon VALUES (37, 'Makemake', 13, 715, 3100000000000000000000, 68210, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2439.7, 330110000000000000000000, 57900000, false, 'Terrestrial', 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6051.8, 4867000000000000000000000, 108200000, true, 'Terrestrial', 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, 5972000000000000000000000, 149600000, true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3389.5, 639000000000000000000000, 227900000, true, 'Terrestrial', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 69911, 1898000000000000000000000000, 778500000, true, 'Gas Giant', 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 58232, 568300000000000000000000000, 1433500000, true, 'Gas Giant', 82);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 25362, 86810000000000000000000000, 2872500000, true, 'Ice Giant', 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, 24622, 102400000000000000000000000, 4495100000, true, 'Ice Giant', 14);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 1188.3, 13030000000000000000000, 5906400000, false, 'Dwarf', 5);
INSERT INTO public.planet VALUES (10, 'Kepler-10b', 3, 1563, 3330000000000000000000000, 16840, false, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 4, 12250, 5360000000000000000000000, 11600000, true, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (12, 'HD 209458b', 5, 15500, 9300000000000000000000000, 7800000, true, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (13, 'PSR B1257+12 A', 6, 3500, 28000000000000000000000000, 40000, false, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (14, 'PSR B1257+12 B', 6, 6000, 39000000000000000000000000, 40000, false, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (15, 'PSR B1257+12 C', 6, 1800, 4300000000000000000000000, 40000, false, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (16, '51 Pegasi b', 7, 120000, 1500000000000000000000000000, 52000, true, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1e', 8, 9100, 4300000000000000000000000, 62000, true, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (18, 'LHS 1140b', 9, 13900, 6620000000000000000000000, 49000, true, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (19, 'TOI 700d', 10, 9617, 1210000000000000000000000, 74000, true, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (20, 'Kepler-452b', 11, 17610, 5390000000000000000000000, 1048000, true, 'Exoplanet', 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 1, 'G2V', 1.5, false, true);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 'A1V', 25.4, false, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M6V', 0.0017, false, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'M1-M2Ia', 120000, false, true);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 'B8Ia', 120000, false, true);
INSERT INTO public.star VALUES (6, 'Vega', 3, 'A0V', 40.12, false, true);
INSERT INTO public.star VALUES (7, 'Pollux', 4, 'K0III', 32.08, false, true);
INSERT INTO public.star VALUES (8, 'Aldebaran', 5, 'K5III', 425.89, false, true);
INSERT INTO public.star VALUES (9, 'Antares', 6, 'M1.5Iab-b', 40.57, false, true);
INSERT INTO public.star VALUES (10, 'Canopus', 7, 'A9II', 15100.4, false, true);
INSERT INTO public.star VALUES (11, 'Altair', 8, 'A7IV-V', 10.6, false, true);
INSERT INTO public.star VALUES (12, 'Arcturus', 9, 'K1.5IIICa-', 170, false, true);
INSERT INTO public.star VALUES (13, 'Regulus', 10, 'B7V', 288, false, true);
INSERT INTO public.star VALUES (14, 'Deneb', 11, 'A2Ia', 200000, false, true);
INSERT INTO public.star VALUES (15, 'Albireo', 12, 'K3II', 740, false, true);
INSERT INTO public.star VALUES (16, 'Spica', 13, 'B1III-IV', 2500, false, true);
INSERT INTO public.star VALUES (17, 'Castor', 14, 'A1Vm', 52.7, false, true);
INSERT INTO public.star VALUES (18, 'Polaris', 15, 'F7Ib', 4000, false, true);
INSERT INTO public.star VALUES (19, 'Bellatrix', 16, 'B2III', 720, false, true);
INSERT INTO public.star VALUES (20, 'Achernar', 17, 'B6IV', 2000, false, true);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sun1', 5000, true, 'Description of Sun1', 149600000, 'SpectralType1');
INSERT INTO public.sun VALUES (2, 'Sun2', 6000, true, 'Description of Sun2', 149600000, 'SpectralType2');
INSERT INTO public.sun VALUES (3, 'Sun3', 7000, true, 'Description of Sun3', 149600000, 'SpectralType3');
INSERT INTO public.sun VALUES (4, 'Sun4', 8000, true, 'Description of Sun4', 149600000, 'SpectralType4');
INSERT INTO public.sun VALUES (5, 'Sun5', 9000, true, 'Description of Sun5', 149600000, 'SpectralType5');
INSERT INTO public.sun VALUES (6, 'Sun6', 10000, true, 'Description of Sun6', 149600000, 'SpectralType6');
INSERT INTO public.sun VALUES (7, 'Sun7', 11000, true, 'Description of Sun7', 149600000, 'SpectralType7');
INSERT INTO public.sun VALUES (8, 'Sun8', 12000, true, 'Description of Sun8', 149600000, 'SpectralType8');
INSERT INTO public.sun VALUES (9, 'Sun9', 13000, true, 'Description of Sun9', 149600000, 'SpectralType9');
INSERT INTO public.sun VALUES (10, 'Sun10', 14000, true, 'Description of Sun10', 149600000, 'SpectralType10');
INSERT INTO public.sun VALUES (11, 'Sun11', 15000, true, 'Description of Sun11', 149600000, 'SpectralType11');
INSERT INTO public.sun VALUES (12, 'Sun12', 16000, true, 'Description of Sun12', 149600000, 'SpectralType12');
INSERT INTO public.sun VALUES (13, 'Sun13', 17000, true, 'Description of Sun13', 149600000, 'SpectralType13');
INSERT INTO public.sun VALUES (14, 'Sun14', 18000, true, 'Description of Sun14', 149600000, 'SpectralType14');
INSERT INTO public.sun VALUES (15, 'Sun15', 19000, true, 'Description of Sun15', 149600000, 'SpectralType15');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 37, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 64, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 53, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 15, true);


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
-- Name: sun sun_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_name_unique UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

