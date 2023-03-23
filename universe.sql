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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
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
    name character varying(50),
    year_discovered integer NOT NULL,
    shape character varying(20) NOT NULL,
    description text NOT NULL,
    galaxy_code character varying(10),
    constellation_id integer
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
    name character varying(50) NOT NULL,
    planet_id integer,
    year_discovered integer,
    diameter_in_km numeric(6,1) NOT NULL
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
    name character varying(50) NOT NULL,
    star_id integer,
    has_moon boolean,
    oribital_period_in_earth_years numeric(4,2) NOT NULL,
    life_may_exist boolean
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
    name character varying(50) NOT NULL,
    distance_in_light_years numeric(5,2) NOT NULL,
    galaxy_id integer,
    type_of_star character varying(30)
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

INSERT INTO public.constellation VALUES (3, 'Fornax', 'A small faint constellationlocated in the southern sky, named after a furnace.');
INSERT INTO public.constellation VALUES (4, 'Hercules', 'A large constellation located in the northern sky, named after the mythical hero Hercules');
INSERT INTO public.constellation VALUES (5, 'Mensa & Dorado', 'Two southern constellations that are often considered together, named after a table mountain(Mensa) and a Dolphine(Dorado)');
INSERT INTO public.constellation VALUES (6, 'Orion', 'A prominent constellationlocated in the winter sky, named after the mythical hunter Orion. Its distinctive belt of 3 bright stars is easily visible to naked eyes.');
INSERT INTO public.constellation VALUES (7, 'Sagittarius', 'A large constellation located in the southern sky, and known for containg the center of Milky Way galaxy');
INSERT INTO public.constellation VALUES (8, 'Sextans', 'A small, faint constellation located in the southern sky, and named after a Sextan, a navigational instrument used for measuring angles');
INSERT INTO public.constellation VALUES (9, 'Triangulum', 'A small, faint constellation located in the southern sky, named after a triangle.');
INSERT INTO public.constellation VALUES (10, 'Virgo', 'A large, prominent constellation located in the southern sky, known for containing the Virgo Cluster of glaxies, one of the largest and the most studied galaxy clusters in the univers');
INSERT INTO public.constellation VALUES (1, 'Andromeda', 'A northern constellation named after mythical princess Andromeda, best known for containg Andromeda Galaxy.');
INSERT INTO public.constellation VALUES (2, 'Centaurus', 'A large southern constellation that is often depicted as a centaur(half-man, half-horse) includes Alpha Centauri, the closest star system to our own.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 964, 'spiral', 'The closest spiral galaxy to our Milky Way.', 'M31', 1);
INSERT INTO public.galaxy VALUES (2, 'Backward Galaxy', 1787, 'spiral', 'The hyphothetical galaxy that is said to rotate in the opposite direction from the other known galaxies.', 'NGC 4622', 2);
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 1826, 'elliptical', 'Located about 13 light years, known for its unusual appearance due to a colllision with a smaller galaxy.', 'NGC 5128', 2);
INSERT INTO public.galaxy VALUES (4, 'Hercules A', 1961, 'elliptical', 'Located about 2 billion light years away, known for its powerful rradio jets emanating from a supermassive blackhole at its center', '3C 348', 4);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Clouds', 1519, 'irregular', 'A small  satellite galaxy of our Milky Way, located about 160,000 light years away.', 'LMC', 5);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 1781, 'elliptical', 'Located about 55 million light years away, and home to a supermassive blackhole at its center.', 'M87', 10);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 1610, 'spiral', 'The galaxy that contains our solar system, home to over 100 billion stars', '', 7);
INSERT INTO public.galaxy VALUES (8, 'NGC 1427 A', 1835, 'irregular', 'A drawf galaxy located about 52 million light years away.', '', 3);
INSERT INTO public.galaxy VALUES (9, 'Sextans A', 1784, 'irregular', 'A small galaxy located about 4.5 million light years away, home to sevelar young and massive stars', 'NGC 3115', 8);
INSERT INTO public.galaxy VALUES (10, 'Triangulum', 1650, 'spiral', 'A small galaxy located at 3 million light years away, and home to many young stars and star-forming region', 'M33', 9);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'luna', 1, NULL, 3474.0);
INSERT INTO public.moon VALUES (3, 'phobos', 7, 1877, 22.2);
INSERT INTO public.moon VALUES (4, 'deimos', 7, 1877, 12.4);
INSERT INTO public.moon VALUES (5, 'lo', 2, 1610, 3630.0);
INSERT INTO public.moon VALUES (6, 'europa', 2, 1610, 3121.0);
INSERT INTO public.moon VALUES (7, 'ganymede', 2, 1610, 5262.0);
INSERT INTO public.moon VALUES (8, 'callisto', 2, 1610, 4820.0);
INSERT INTO public.moon VALUES (9, 'titan', 11, 1655, 5149.0);
INSERT INTO public.moon VALUES (10, 'enceladus', 11, 1789, 504.0);
INSERT INTO public.moon VALUES (11, 'mimas', 11, 1789, 396.0);
INSERT INTO public.moon VALUES (12, 'tethys', 11, 1684, 1060.0);
INSERT INTO public.moon VALUES (13, 'miranda', 12, 1948, 472.0);
INSERT INTO public.moon VALUES (14, 'ariel', 12, 1851, 1157.0);
INSERT INTO public.moon VALUES (15, 'umbriel', 12, 1851, 1169.0);
INSERT INTO public.moon VALUES (16, 'titania', 12, 1787, 1578.0);
INSERT INTO public.moon VALUES (17, 'oberon', 12, 1787, 1522.0);
INSERT INTO public.moon VALUES (18, 'triton', 9, 1846, 2706.0);
INSERT INTO public.moon VALUES (19, 'nereid', 9, 1949, 340.0);
INSERT INTO public.moon VALUES (20, 'naiad', 9, 1989, 58.0);
INSERT INTO public.moon VALUES (21, 'thalassa', 9, 1989, 82.0);
INSERT INTO public.moon VALUES (22, 'despina', 9, 1989, 150.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 18, true, 1.00, true);
INSERT INTO public.planet VALUES (2, 'Jupiter', 18, true, 11.86, false);
INSERT INTO public.planet VALUES (3, 'Kepler-1625b', 10, true, 99.40, false);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 10, NULL, 99.90, true);
INSERT INTO public.planet VALUES (5, 'Kepler-47b', 10, NULL, 49.50, false);
INSERT INTO public.planet VALUES (6, 'Kepler-62f', 10, NULL, 49.50, NULL);
INSERT INTO public.planet VALUES (7, 'Mars', 18, true, 1.88, true);
INSERT INTO public.planet VALUES (8, 'Mercury', 18, false, 0.24, false);
INSERT INTO public.planet VALUES (9, 'Neptune', 18, true, 64.79, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri B', 1, NULL, 11.20, false);
INSERT INTO public.planet VALUES (11, 'Saturn', 18, true, 29.46, false);
INSERT INTO public.planet VALUES (12, 'Uranus', 18, true, 84.01, false);
INSERT INTO public.planet VALUES (13, 'Venus', 18, false, 0.62, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri C', 4.37, 2, 'red dwarf');
INSERT INTO public.star VALUES (2, 'Alpheratz', 97.00, 1, 'blue-white');
INSERT INTO public.star VALUES (3, 'Ascella', 88.00, 7, 'blue-white subgiant');
INSERT INTO public.star VALUES (4, 'Beta Centauri Aa', 390.00, 2, 'blue giant');
INSERT INTO public.star VALUES (5, 'Dalim', 174.00, 8, 'blue-white');
INSERT INTO public.star VALUES (6, 'Horna*', 104.00, 10, 'white-yellow');
INSERT INTO public.star VALUES (7, 'Irena*', 260.00, 4, 'blue-white');
INSERT INTO public.star VALUES (8, 'Kaus Australis', 144.00, 7, 'blue-white');
INSERT INTO public.star VALUES (9, 'Kaus Borealis', 77.00, 7, 'orange giant');
INSERT INTO public.star VALUES (10, 'Kepler-1625', 800.00, 7, 'g-type');
INSERT INTO public.star VALUES (11, 'Khambalia', 82.00, 6, 'blue-white spetroscopic binary');
INSERT INTO public.star VALUES (12, 'Lich', 390.00, 6, 'neutron star');
INSERT INTO public.star VALUES (13, 'Malmok*', 220.00, 6, 'white-yellow');
INSERT INTO public.star VALUES (14, 'Menkent', 61.00, 3, 'orange giant');
INSERT INTO public.star VALUES (15, 'Mirach', 199.00, 1, 'red giant');
INSERT INTO public.star VALUES (16, 'RX J0042.3+4115', 180.00, 1, 'neutron star');
INSERT INTO public.star VALUES (17, 'S Doradus', 170.00, 5, 'blue supergiant');
INSERT INTO public.star VALUES (18, 'Sun', 0.00, 7, 'yellow dwarf');


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: constellation constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

