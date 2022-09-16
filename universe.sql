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
    name character varying(30) NOT NULL,
    year_discovered integer,
    meaning character varying(50) NOT NULL,
    star_id integer NOT NULL
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text NOT NULL,
    is_visible_to_naked_eye boolean NOT NULL,
    constellation_id integer NOT NULL
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
    year_discovered integer,
    diameter_in_km integer,
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
    name character varying(30) NOT NULL,
    orbital_period_in_years numeric(7,2) NOT NULL,
    rotation_period_in_days numeric(5,2),
    has_moon boolean NOT NULL,
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
    name character varying(30) NOT NULL,
    distance_in_light_years numeric(5,2) NOT NULL,
    brightness_of_star numeric(3,2) NOT NULL,
    approval_date date,
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

INSERT INTO public.constellation VALUES (1, 'Aquarius', NULL, 'Water-bearer', 1);
INSERT INTO public.constellation VALUES (2, 'Aries', NULL, 'Ram', 2);
INSERT INTO public.constellation VALUES (3, 'Bootes', NULL, 'Herdsman', 3);
INSERT INTO public.constellation VALUES (4, 'Capricornus', NULL, 'Sea goat', 4);
INSERT INTO public.constellation VALUES (5, 'Centaurus', NULL, 'Centaur', 5);
INSERT INTO public.constellation VALUES (6, 'Cetus', NULL, 'Sea monster (later interpreted as a whale)', 9);
INSERT INTO public.constellation VALUES (7, 'Coma Berenices', 1536, 'Berenice''s hair', 6);
INSERT INTO public.constellation VALUES (8, 'Leo', NULL, 'Lion', 7);
INSERT INTO public.constellation VALUES (9, 'Ophiuchus', NULL, 'Serpent-bearer', 12);
INSERT INTO public.constellation VALUES (10, 'Pegasus', NULL, 'Pegasus (mythological winged horse)', 10);
INSERT INTO public.constellation VALUES (11, 'Sagittarius', NULL, 'Archer', 11);
INSERT INTO public.constellation VALUES (12, 'Taurus', NULL, 'Bull', 8);
INSERT INTO public.constellation VALUES (13, 'Virgo', NULL, 'Virgin or maiden', 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward Galaxy', 'It seems to rotate in the opposite direction to what it should according to its shape', false, 5);
INSERT INTO public.galaxy VALUES (2, 'Centaurus A', 'Named because it''s located in the Centaurus constellation', true, 5);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'It looks like an eye with a dark stripe underneath', false, 7);
INSERT INTO public.galaxy VALUES (4, 'Coma Pinwheel Galaxy', 'It looks like a paper pinwheel', false, 7);
INSERT INTO public.galaxy VALUES (5, 'Malin 1', 'Named after its discoverer, David Malin', false, 7);
INSERT INTO public.galaxy VALUES (6, 'Mice Galaxies', 'Two galaxies with long tails that look like a mouse', false, 7);
INSERT INTO public.galaxy VALUES (7, 'Needle Galaxy', 'Named because of its thin appearance', false, 7);
INSERT INTO public.galaxy VALUES (8, 'Butterfly Galaxies', 'Binary galaxies. It looks like a pair of butterfly wings', false, 13);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', 'Looks like a sombrero', false, 13);
INSERT INTO public.galaxy VALUES (10, 'Little Sombrero Galaxy', 'It looks like a sombrero, but it''s smaller than the Sombrero Galaxy', false, 10);
INSERT INTO public.galaxy VALUES (11, 'Milky Way', 'Our own galaxy. It is said to look like a band of light', true, 11);
INSERT INTO public.galaxy VALUES (12, 'Wolf-Lundmark-Melotte', 'Named after the astronomers that co-discovered it', false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3476, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 23, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 13, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 3630, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 3138, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 5262, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 4800, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 1892, 200, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 1904, 170, 5);
INSERT INTO public.moon VALUES (10, 'Thebe', 1979, 90, 5);
INSERT INTO public.moon VALUES (11, 'Mimas', 1789, 394, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 1789, 502, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 1684, 1048, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 1684, 1120, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 1672, 1530, 6);
INSERT INTO public.moon VALUES (16, 'Titan', 1655, 5150, 6);
INSERT INTO public.moon VALUES (17, 'Hyperion', 1848, 270, 6);
INSERT INTO public.moon VALUES (18, 'Iapetus', 1671, 1435, 6);
INSERT INTO public.moon VALUES (19, 'Phoebe', 1899, 220, 6);
INSERT INTO public.moon VALUES (20, 'Janus', 1966, 190, 6);
INSERT INTO public.moon VALUES (21, 'Epimetheus', 1966, 120, 6);
INSERT INTO public.moon VALUES (22, 'Atlas', 1980, 40, 6);
INSERT INTO public.moon VALUES (23, 'Prometheus', 1980, 80, 6);
INSERT INTO public.moon VALUES (24, 'Pandora', 1980, 100, 6);
INSERT INTO public.moon VALUES (25, 'Pan', 1990, 20, 6);
INSERT INTO public.moon VALUES (26, 'Ariel', 1851, 1160, 7);
INSERT INTO public.moon VALUES (27, 'Umbriel', 1851, 1190, 7);
INSERT INTO public.moon VALUES (28, 'Titania', 1787, 1610, 7);
INSERT INTO public.moon VALUES (29, 'Oberon', 1787, 1550, 7);
INSERT INTO public.moon VALUES (30, 'Miranda', 1948, 485, 7);
INSERT INTO public.moon VALUES (31, 'Puck', 1985, 170, 7);
INSERT INTO public.moon VALUES (32, 'Triton', 1846, 2720, 8);
INSERT INTO public.moon VALUES (33, 'Nereid', 1949, 340, 8);
INSERT INTO public.moon VALUES (34, 'Despina', 1989, 150, 8);
INSERT INTO public.moon VALUES (35, 'Galatea', 1989, 150, 8);
INSERT INTO public.moon VALUES (36, 'Larissa', 1981, 400, 8);
INSERT INTO public.moon VALUES (37, 'Vanth', 2005, NULL, 10);
INSERT INTO public.moon VALUES (38, 'Charon', 1978, 1200, 11);
INSERT INTO public.moon VALUES (39, 'Nix', 2005, 46, 11);
INSERT INTO public.moon VALUES (40, 'Hydra', 2005, 61, 11);
INSERT INTO public.moon VALUES (41, 'Kerberos', 2011, 28, 11);
INSERT INTO public.moon VALUES (42, 'Styx', 2012, 20, 11);
INSERT INTO public.moon VALUES (43, 'Actaea', 2006, NULL, 18);
INSERT INTO public.moon VALUES (44, 'Hi''iaka', 2005, 400, 12);
INSERT INTO public.moon VALUES (45, 'Namaka', 2005, 200, 12);
INSERT INTO public.moon VALUES (46, 'Weywot', 2007, NULL, 13);
INSERT INTO public.moon VALUES (47, 'Ilmare', 2009, NULL, 19);
INSERT INTO public.moon VALUES (48, 'Xiangliu', 2010, NULL, 15);
INSERT INTO public.moon VALUES (49, 'Dysnomia', 2005, 684, 16);
INSERT INTO public.moon VALUES (50, 'MK2', 2016, 160, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.24, 58.65, false, 13);
INSERT INTO public.planet VALUES (2, 'Venus', 0.62, 243.02, false, 7);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 1.00, true, 5);
INSERT INTO public.planet VALUES (4, 'Mars', 1.88, 1.03, true, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11.86, 0.41, true, 9);
INSERT INTO public.planet VALUES (6, 'Saturn', 29.45, 0.44, true, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 84.02, 0.72, true, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 164.79, 0.67, true, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 4.60, 0.38, false, 7);
INSERT INTO public.planet VALUES (10, 'Orcus', 247.50, NULL, true, 11);
INSERT INTO public.planet VALUES (11, 'Pluto', 247.90, 6.39, true, 11);
INSERT INTO public.planet VALUES (12, 'Haumea', 283.80, 0.16, true, 3);
INSERT INTO public.planet VALUES (13, 'Quaoar', 288.00, 0.37, true, 12);
INSERT INTO public.planet VALUES (14, 'Makemake', 306.20, 0.95, true, 6);
INSERT INTO public.planet VALUES (15, 'Gonggong', 552.50, 0.93, true, 1);
INSERT INTO public.planet VALUES (16, 'Eris', 559.00, 14.56, true, 9);
INSERT INTO public.planet VALUES (17, 'Sedna', 12059.00, 0.43, false, 8);
INSERT INTO public.planet VALUES (18, 'Salacia', 273.98, 0.25, true, 10);
INSERT INTO public.planet VALUES (19, 'Varda', 313.12, 0.23, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sadalsuud', 612.00, 2.90, '2016-08-21', 11);
INSERT INTO public.star VALUES (2, 'Hamal', 66.00, 2.01, '2016-07-20', 11);
INSERT INTO public.star VALUES (3, 'Arcturus', 37.00, 0.05, '2016-06-30', 11);
INSERT INTO public.star VALUES (4, 'Deneb Algedi', 39.00, 2.85, '2017-02-01', 11);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 4.36, 0.01, '2016-11-06', 11);
INSERT INTO public.star VALUES (6, 'Beta Comae Berenices', 30.00, 4.26, NULL, 11);
INSERT INTO public.star VALUES (7, 'Regulus', 77.00, 1.36, '2016-06-30', 11);
INSERT INTO public.star VALUES (8, 'Aldebaran', 65.23, 0.85, '2016-06-30', 11);
INSERT INTO public.star VALUES (9, 'Diphda', 96.22, 2.04, '2016-08-21', 11);
INSERT INTO public.star VALUES (10, 'Enif', 688.20, 2.40, '2016-07-20', 11);
INSERT INTO public.star VALUES (11, 'Kaus Australis', 143.20, 1.85, '2016-07-20', 11);
INSERT INTO public.star VALUES (12, 'Rasalhague', 48.60, 2.08, '2016-07-20', 11);
INSERT INTO public.star VALUES (13, 'Spica', 260.90, 1.04, '2016-06-30', 11);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 17, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 36, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 50, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


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
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

