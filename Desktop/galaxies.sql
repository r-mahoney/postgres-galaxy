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
    name character varying(40) NOT NULL,
    distance_in_mly numeric(4,2),
    apparent_magnitude numeric(3,2),
    constellation character varying(30)
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
    name character varying(20) NOT NULL,
    distance_from_orbit_in_km_10_3 integer,
    orbital_period_in_days numeric(7,2),
    orbits text,
    number integer,
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    type_of_galaxy character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    gravity_in_m_s2 numeric(3,1),
    distance_from_sun_in_km_10_6 numeric(7,2),
    orbital_period_in_days integer,
    length_of_day_in_hours numeric(5,1),
    orbits text,
    has_moons boolean,
    number_of_moons integer,
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
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    system text,
    constellation character varying(30),
    stellar_class text,
    apparent_magnitude numeric(5,2),
    visible_to_unaided_eye boolean,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.00, -6.50, 'Sagittarius');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 0.16, 0.90, 'Dorado/Mensa');
INSERT INTO public.galaxy VALUES (2, 'Small Magellanic Cloud(NGC 292)', 0.20, 2.70, 'Tucana');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy(M31, NGC 224)', 2.50, 3.40, 'Andromeda');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy(M33, NGC 598)', 2.90, 5.70, 'Triangulum');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A(NGC 5128)', 13.70, 6.84, 'Centaurus');
INSERT INTO public.galaxy VALUES (7, 'Bodes Galaxy(M81, NGC 3031)', 12.00, 6.94, 'Ursa Major');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384, 27.32, 'Earth', 1, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9, 0.32, 'Mars', 1, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23, 1.26, 'Mars', 2, 4);
INSERT INTO public.moon VALUES (4, 'Io', 422, 1.77, 'Jupiter', 1, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 671, 3.55, 'Jupiter', 2, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070, 7.15, 'Jupiter', 3, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1883, 16.69, 'Jupiter', 4, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 181, 0.50, 'Jupiter', 5, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 11480, 250.57, 'Jupiter', 6, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 11737, 259.65, 'Jupiter', 7, 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 23500, NULL, 'Jupiter', 8, 5);
INSERT INTO public.moon VALUES (12, 'Sinope', 23700, NULL, 'Jupiter', 9, 5);
INSERT INTO public.moon VALUES (13, 'Lysithea', 11720, 259.22, 'Jupiter', 10, 5);
INSERT INTO public.moon VALUES (14, 'Mimas', 186, 0.94, 'Saturn', 1, 6);
INSERT INTO public.moon VALUES (15, 'Enceladus', 238, 1.37, 'Saturn', 2, 6);
INSERT INTO public.moon VALUES (16, 'Tethys', 295, 1.89, 'Saturn', 3, 6);
INSERT INTO public.moon VALUES (17, 'Dione', 377, 2.74, 'Saturn', 4, 6);
INSERT INTO public.moon VALUES (18, 'Rhea', 527, 4.52, 'Saturn', 5, 6);
INSERT INTO public.moon VALUES (19, 'Titan', 1222, 15.95, 'Saturn', 6, 6);
INSERT INTO public.moon VALUES (20, 'Hyperion', 1481, 21.28, 'Saturn', 7, 6);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Barred Spiral Galaxy', 1, NULL);
INSERT INTO public.more_info VALUES (2, 'Magellanic Spiral', 3, NULL);
INSERT INTO public.more_info VALUES (3, 'Dwarf Irregular Galaxy', 2, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3.7, 57.90, 88, 4222.6, 'Sun', false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 8.9, 108.20, 225, 2802.0, 'Sun', false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 9.8, 149.60, 365, 24.0, 'Sun', true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3.7, 228.00, 687, 24.7, 'Sun', true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 23.1, 778.50, 4331, 9.9, 'Sun', true, 27, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.0, 1432.00, 10747, 10.7, 'Sun', true, 18, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 8.7, 2867.00, 30589, 17.2, 'Sun', true, 21, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 11.0, 4515.00, 59800, 16.1, 'Sun', true, 8, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.7, 5906.40, 90560, 153.3, 'Sun', true, 3, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', NULL, NULL, 11, NULL, 'Proxima Centauri', NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', NULL, NULL, 1928, NULL, 'Proxima Centauri', NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', NULL, NULL, 5, NULL, 'Proxima Centauri', NULL, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun(Sol)', 'Solar System', NULL, 'G2V', -26.74, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri(C, V645 Centauri)', 'Alpha Centauri', 'Centaurus', 'M5.5Ve', 11.09, false, NULL);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus (A)', 'Alpha Centauri', 'Centaurus', 'G2V', 0.01, true, NULL);
INSERT INTO public.star VALUES (4, 'Toliman (B)', 'Alpha Centauri', 'Centaurus', 'K1V', 1.34, true, NULL);
INSERT INTO public.star VALUES (5, 'Barnards Star (BD+04°3561a)', NULL, 'Ophiuchus', 'M4.0Ve', 9.53, false, NULL);
INSERT INTO public.star VALUES (6, 'A§', 'Luhman 16 (WISE 1049−5319)', 'Carina', 'L8±1', 10.70, false, NULL);
INSERT INTO public.star VALUES (7, 'B§', 'Luhman 16 (WISE 1049−5319)', 'Carina', 'T1±2', 10.70, false, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: more_info more_info_associated_galaxy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_associated_galaxy_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: more_info more_info_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

