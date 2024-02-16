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
    name character varying(40) NOT NULL,
    type character varying(40),
    has_life boolean DEFAULT false,
    age_in_millions_of_years numeric(18,4),
    distance_from_earth numeric(18,4),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: intersteller_connections; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.intersteller_connections (
    galaxy_name character varying(40),
    galaxy_id integer,
    star_name character varying(40) NOT NULL,
    star_id integer,
    planet_name character varying(40),
    planet_id integer,
    moon_name character varying(40) NOT NULL,
    moon_id integer,
    name character varying(40),
    intersteller_connections_id integer NOT NULL
);


ALTER TABLE public.intersteller_connections OWNER TO freecodecamp;

--
-- Name: intersteller_connections_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.intersteller_connections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intersteller_connections_id_seq OWNER TO freecodecamp;

--
-- Name: intersteller_connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.intersteller_connections_id_seq OWNED BY public.intersteller_connections.intersteller_connections_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(18,4),
    galaxy_id integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    type character varying(40),
    has_life boolean DEFAULT false,
    age_in_millions_of_years integer,
    distance_from_earth numeric(18,4),
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(300),
    type character varying(40),
    has_life boolean DEFAULT false,
    age_in_millions_of_years integer,
    distance_from_earth numeric(25,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: intersteller_connections intersteller_connections_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.intersteller_connections ALTER COLUMN intersteller_connections_id SET DEFAULT nextval('public.intersteller_connections_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Barred Spiral Galaxy', false, 2500000000.0000, 928800000000.0000, 'Named after the Andromeda Nebula where it is located. It is the closest galaxy to the Milky Way and is expected to collide and form a new galaxy called Milkdromeda in approximately 2 to 3 billion years');
INSERT INTO public.galaxy VALUES (2, 'Milkyway', 'Barred Spiral Galaxy', true, 13610.0000, 0.0000, 'The galaxy containing our Sun and Solar System that was incepted with the Big Bang. It can be identified as hazy bands of white light approximately 30 degrees wide. The galaxy covers the entire sky, however the bands of light are the best way to identify it. Bands are formed by reflections of light on unresolved stars and other materials clustered together. Darker areas are appear so due to the collections of interstellar dust that blocks the light of distant stars');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral Galaxy', false, 3.5000, 16048650000000.0000, 'Located in the Triangulum Constellation, it is sometimes referred to as a pinwheel galaxy. It is the third largest galaxy behind the Milkyway and Andromeda');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 'Lenticular Ring Galaxy', false, 400.0000, 500.0000, 'The largest of the Cartwheel Galaxy Group is believed to have collided head on with one of it''s companion galaxies approximately 200-300 million years before it''s current formation. A type II supernova was discovered in this galaxy in November of 2021.');
INSERT INTO public.galaxy VALUES (5, 'Eye of God', 'Grand Design Galaxy', false, NULL, 65000000000.0000, 'This galaxy is considered the prototype for multi-arm spiral galaxies. It show''s hints of a galactic bar. ');
INSERT INTO public.galaxy VALUES (6, 'Fireworks', 'Intermediate Spiral Galaxy', false, NULL, 25.2500, 'This galaxy ius a site of high star formation. It is also known as a Starburst Galaxy. There have been 10 supernovae discoverend there in the last century.');


--
-- Data for Name: intersteller_connections; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.intersteller_connections VALUES ('Andromeda', 1, 'Alpheratz', 1, 'Andromere', 2, 'Andrea', 4, NULL, 1);
INSERT INTO public.intersteller_connections VALUES ('Andromeda', 1, 'Alpheratz', 1, 'Andromere', 2, 'Andreu', 20, NULL, 2);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Earth', 1, 'x125', 1, NULL, 3);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Earth', 1, 'Jupix-583', 2, NULL, 4);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Earth', 1, 'Plut7', 3, NULL, 5);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Uranus', 7, 'Titania', 9, NULL, 6);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Uranus', 7, 'Miranda', 10, NULL, 7);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Saturn', 12, 'Titan', 11, NULL, 8);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Saturn', 12, 'Enceladus', 12, NULL, 9);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Saturn', 12, 'Telesto', 13, NULL, 10);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Saturn', 12, 'Pandora', 14, NULL, 11);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Saturn', 12, 'Hyperion', 15, NULL, 12);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Saturn', 12, 'Narvi', 16, NULL, 13);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Saturn', 12, 'Rhea', 17, NULL, 14);
INSERT INTO public.intersteller_connections VALUES ('Milkyway', 2, 'Sun', 4, 'Saturn', 12, 'Aegaeon', 18, NULL, 15);
INSERT INTO public.intersteller_connections VALUES ('Triangulum', 3, 'SN 2002hh', 2, 'Ovalum', 6, 'Circulum', 8, NULL, 16);
INSERT INTO public.intersteller_connections VALUES ('Cartwheel', 4, 'Made Up Name1', 3, 'Baqphlip', 4, 'Tumnbull', 6, NULL, 17);
INSERT INTO public.intersteller_connections VALUES ('Cartwheel', 4, 'Made Up Name1', 3, 'Baqphlip', 4, 'Roll', 19, NULL, 18);
INSERT INTO public.intersteller_connections VALUES ('Eye of God', 5, 'Pupil', 6, 'Cornea', 3, 'Retinea', 5, NULL, 19);
INSERT INTO public.intersteller_connections VALUES ('Fireworks', 6, 'Bright Pookie', 5, 'Sparkle', 5, 'Flame', 7, NULL, 20);
INSERT INTO public.intersteller_connections VALUES ('Fireworks', 6, 'Bright Pookie', 5, 'Sparkle', 5, 'c4', 21, NULL, 21);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'x125', 4530, 238900.0000, 2, 1);
INSERT INTO public.moon VALUES (2, 'Jupix-583', 10500, 18025648203.0000, 2, 1);
INSERT INTO public.moon VALUES (3, 'Plut7', 8000, 336005210001.0000, 2, 1);
INSERT INTO public.moon VALUES (4, 'Andrea', 125, 928857000600.0000, 1, 2);
INSERT INTO public.moon VALUES (5, 'Retinea', 200, 651525000000.0000, 5, 3);
INSERT INTO public.moon VALUES (6, 'Tumnbull', 388, 600.0050, 4, 4);
INSERT INTO public.moon VALUES (7, 'Flame', 15, 25.9051, 6, 5);
INSERT INTO public.moon VALUES (8, 'Circulum', 2, 16048652154300.0000, 3, 6);
INSERT INTO public.moon VALUES (9, 'Titania', 13500, 100000000000.0000, 2, 7);
INSERT INTO public.moon VALUES (10, 'Miranda', 1000, 100000000000.0000, 2, 7);
INSERT INTO public.moon VALUES (11, 'Titan', 4003000, 746.0000, 2, 12);
INSERT INTO public.moon VALUES (12, 'Enceladus', 4003000, 746.0000, 2, 12);
INSERT INTO public.moon VALUES (13, 'Telesto', 4003000, 746.0000, 2, 12);
INSERT INTO public.moon VALUES (14, 'Pandora', 4003000, 746.0000, 2, 12);
INSERT INTO public.moon VALUES (15, 'Hyperion', 4003000, 746.0000, 2, 12);
INSERT INTO public.moon VALUES (16, 'Narvi', 4003000, 746.0000, 2, 12);
INSERT INTO public.moon VALUES (17, 'Rhea', 4003000, 746.0000, 2, 12);
INSERT INTO public.moon VALUES (18, 'Aegaeon', 4003000, 746.0000, 2, 12);
INSERT INTO public.moon VALUES (19, 'Roll', 380, 600.0150, 4, 4);
INSERT INTO public.moon VALUES (20, 'Andreu', 161, 9288915480600.0000, 1, 2);
INSERT INTO public.moon VALUES (21, 'c4', 15, 30.0000, 6, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Rocky planet with water covering 70.8% of its surface. Earth is the third planet from the Sun and the only astronomical object known to harbor life due to it''s dynamic atmosphere.', 'Terrestrial', true, 4543, 0.0000, 2, 4);
INSERT INTO public.planet VALUES (2, 'Andromere', 'This huge planet is a collection of gases rotating together similar to Jupiter.', 'Gas Giant', false, 125, 928857000000.0000, 1, 1);
INSERT INTO public.planet VALUES (3, 'Cornea', 'Made of predominately helium, this planet resembles Neptune in the Milkyway. It can also be classified as a mini-neptune. Mini-Neptunes are smaller than Neptune but larger than Earth.', 'Neptune-Like', false, 259, 65152000000.0000, 5, 6);
INSERT INTO public.planet VALUES (4, 'Baqphlip', 'This Earth-like planet is about double the size of earth. It has both rocky and oceanic environments. However, at this time the atmosphere contains toxic amounts of hydrogen. There are signs of single-celled organism life.', 'Super Earth', true, 368, 600.0000, 4, 3);
INSERT INTO public.planet VALUES (5, 'Sparkle', 'Sparkle find''s its home in the Fireworks galaxy. Like many other formations in fireworks, it is a large gaseous planet that sits close to the major star of this galaxy, Bright Pookie causing the temperature to exceed 500 degrees Kelvin', 'Gas Giant', false, 15, 25.5889, 6, 5);
INSERT INTO public.planet VALUES (6, 'Ovalum', 'This planet is thought to have held human-like life at some point in it''s lifepan. Currently, it looks as if the atmosphere has become too acidic for inhabitation. There are signs of microsopic life.', 'Terrestrial', true, 2, 16048652150000.0000, 3, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The original Ice Giant, Uranus is about 4 times the size of earth and is composed of a rocky core surrounded by ice. Uranus has two sets of rings compossed of space dust.', 'Terrestrial', false, 13610, 100000000000.0000, 2, 4);
INSERT INTO public.planet VALUES (8, 'Venus', 'Venus is also known as Earth''s twin. With similar size and makeup, it is likely to have been habitable for life at some point. However, now the planet orbits so close to and slowly around the sun that the surface is hot enough to melt lead. The surface is covered in volcanic activity and the atmosphere is so dense that a greenhouse effect has trapped the harmful gases and made the sun''s light nearly impossible to see from the surface. Venus and Uranus are the only planets in the Milky way to rotate backwards around the sun. The days on Venus are longer than it''s years.', 'Terrestrial', false, 4500, 67000000.0000, 2, 4);
INSERT INTO public.planet VALUES (10, 'Mars', 'Mars is the 4th planet from the sun. It is red due to the surface being covered in iron. There is some evidence that Mars was once much wetter and more humid than its current climate. Astrolonomers believe it could have had life over a billion years ago.', 'Terrestrial', false, 4500, 141.0000, 2, 4);
INSERT INTO public.planet VALUES (9, '14 Andromedae b', 'This planet was discovered in 2008. It is a large gas giant that orbits very closely to its star. It''s thought to be 3.559 times the size of Jupiter.', 'Gas Giant', false, 2000000000, 758300000.0000, 1, 1);
INSERT INTO public.planet VALUES (11, 'Mercury', 'Mercury is the smallest planet in the milkyway. It is also the closest to the Sun, but it is not the hottest planet, thanks to its very thick atmosphere. Mercury can experience days as hot as 800 degrees and as cold as -259 degrees Farenheit.', 'Terrestrial', false, 4500, 128.6000, 2, 4);
INSERT INTO public.planet VALUES (12, 'Saturn', 'Saturn is the second largest planet in the Milkyway. Having a similar tilt angle to earth, this surface-less planet experiences seasons. There are at least 146 moons orbitting in Saturn''s rings. Those rings are also composed of other chunchs of rock, ice, and spacial dust. Interestingly enough, the rings orbit Saturn at different speeds.', 'Gas Giant', false, 4000, 746.0000, 2, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 'Also known as Alphae Andromedae, Alpheratz is located within the Great Square of Pagasus. It also marks the Andromeda galay''s head.', 'Binary Star', false, 60, 570200000000.00, 1);
INSERT INTO public.star VALUES (3, 'Made Up Name1', 'I''m tired of researching planets and stars. I''m supposed to be learning SQL', 'basic', true, 5, 500.00, 4);
INSERT INTO public.star VALUES (4, 'Sun', 'Massive ball of hot plasma, inflated and heated by energy produced through nuclear fusion. It makes up more than 98% of the Solar System', 'G-type main-sequence star', false, 4600, 93000000.00, 2);
INSERT INTO public.star VALUES (6, 'Pupil', 'Every eye needs a pupil right?', 'new', false, 15, 4000.00, 5);
INSERT INTO public.star VALUES (2, 'SN 2002hh', 'One of the many supernovae that have been identified in the Fireworks galaxy.', 'Type II-P supernova', false, 0, 25.25, 3);
INSERT INTO public.star VALUES (5, 'Bright Pookie', 'pookie from back in the day got so mad one they, they exploded and catapulted themselves all the way to a new galaxy.', 'Hot Boys', true, 999999999, 895000000.00, 6);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: intersteller_connections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.intersteller_connections_id_seq', 21, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


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
-- Name: intersteller_connections intersteller_connections_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.intersteller_connections
    ADD CONSTRAINT intersteller_connections_moon_name_key UNIQUE (moon_name);


--
-- Name: intersteller_connections intersteller_connections_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.intersteller_connections
    ADD CONSTRAINT intersteller_connections_pkey PRIMARY KEY (intersteller_connections_id);


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
-- Name: planet closest_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT closest_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: intersteller_connections intersteller_connections_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.intersteller_connections
    ADD CONSTRAINT intersteller_connections_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: intersteller_connections intersteller_connections_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.intersteller_connections
    ADD CONSTRAINT intersteller_connections_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: intersteller_connections intersteller_connections_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.intersteller_connections
    ADD CONSTRAINT intersteller_connections_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: intersteller_connections intersteller_connections_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.intersteller_connections
    ADD CONSTRAINT intersteller_connections_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

