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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    description text,
    diameter integer,
    distance_from_sun numeric,
    is_dangerous boolean NOT NULL,
    has_water boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_type character varying(50),
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL,
    has_life boolean
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
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    diameter integer,
    distance_from_planet numeric,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean
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
    star_id integer NOT NULL,
    description text,
    planet_type character varying(50),
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    number_of_moons integer,
    is_spherical boolean NOT NULL,
    has_life boolean
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
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    temperature integer,
    is_main_sequence boolean NOT NULL,
    has_planets boolean
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 5, 'Largest asteroid', 940, 2.8, false, true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 4, 'Brightest asteroid', 525, 2.4, false, false);
INSERT INTO public.asteroid VALUES (3, 'Bennu', 3, 'Potentially hazardous', 1, 1.2, true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 13600, 0, false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 'Spiral', 10000, 2.5, false, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in Local Group', 'Spiral', 12000, 3.0, false, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting galaxy', 'Spiral', 8000, 23.0, false, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with bright nucleus', 'Spiral', 13000, 29.3, false, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Radio galaxy', 'Elliptical', 12000, 13.7, true, false);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'Dwarf galaxy', 'Irregular', 15000, 0.163, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth''s moon', 4500, 3474, 384400, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Mars moon', 4500, 22, 9377, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Mars moon', 4500, 12, 23460, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanic moon', 4500, 3642, 421700, true, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon', 4500, 3122, 670900, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon', 4500, 5268, 1070400, true, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Jupiter moon', 4500, 4821, 1882700, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Moon with atmosphere', 4500, 5150, 1221870, true, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'Saturn moon', 4500, 1527, 527040, true, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 'Two-colored moon', 4500, 1469, 3560820, true, false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Saturn moon', 4500, 1123, 377396, true, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 'Saturn moon', 4500, 1062, 294619, true, false);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 'Icy moon', 4500, 504, 237948, true, false);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 'Death Star moon', 4500, 396, 185539, true, false);
INSERT INTO public.moon VALUES (15, 'Hyperion', 6, 'Irregular shape', 4500, 270, 1481000, false, false);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 'Neptune moon', 4500, 2707, 354759, true, true);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, 'Neptune moon', 4500, 340, 5513818, false, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 'Uranus moon', 4500, 1158, 190900, true, false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 'Uranus moon', 4500, 1169, 266000, true, false);
INSERT INTO public.moon VALUES (20, 'Titania', 7, 'Uranus moon', 4500, 1578, 435910, true, false);
INSERT INTO public.moon VALUES (21, 'Oberon', 7, 'Uranus moon', 4500, 1523, 583520, true, false);
INSERT INTO public.moon VALUES (22, 'Miranda', 7, 'Uranus moon', 4500, 472, 129390, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Closest planet to Sun', 'Terrestrial', 4500, 77, 0, true, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Hottest planet', 'Terrestrial', 4500, 41, 0, true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our planet', 'Terrestrial', 4500, 0, 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Red planet', 'Terrestrial', 4500, 78, 2, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet', 'Gas giant', 4500, 628, 79, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Ringed planet', 'Gas giant', 4500, 1275, 82, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 'Ice giant', 4500, 2720, 27, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Windy planet', 'Ice giant', 4500, 4350, 14, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 'Exoplanet', 'Terrestrial', 4850, 4.2, 0, true, false);
INSERT INTO public.planet VALUES (10, 'Proxima c', 3, 'Exoplanet', 'Mini-Neptune', 4850, 4.2, 0, true, false);
INSERT INTO public.planet VALUES (11, 'Andromeda Exo-1', 5, 'Planet in Andromeda', 'Gas giant', 5000, 2.5, 5, true, false);
INSERT INTO public.planet VALUES (12, 'Andromeda Exo-2', 5, 'Second planet', 'Terrestrial', 5000, 2.5, 0, true, false);
INSERT INTO public.planet VALUES (13, 'Triangulum Exo', 6, 'Planet in Triangulum', 'Super-Earth', 6000, 3.0, 2, true, false);
INSERT INTO public.planet VALUES (14, 'Whirlpool Exo', 7, 'Young planet', 'Gas giant', 800, 23.0, 3, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Center of Solar System', 4600, 5778, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Brightest star in night sky', 240, 9940, true, false);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'Closest star to Sun', 4850, 3042, true, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red supergiant', 8, 3500, false, false);
INSERT INTO public.star VALUES (5, 'Andromeda Star-1', 2, 'Star in Andromeda', 6000, 5800, true, true);
INSERT INTO public.star VALUES (6, 'Triangulum Star-1', 3, 'Star in Triangulum', 7000, 5400, true, true);
INSERT INTO public.star VALUES (7, 'Whirlpool Star-1', 4, 'Young star in Whirlpool', 1000, 8000, true, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

