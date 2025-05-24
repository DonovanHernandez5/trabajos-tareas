--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (idcampus, nombrecampus, direccioncampus) FROM stdin;
1	Campus Mexicali	Calle Instituto Tecnologico, Mexicali
2	Campus Tijuana	Calle Rio Nuevo, Tijuana
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (idcarrera, nombrecarrera, titulootorgado) FROM stdin;
1	Ingeniería en Sistemas	Titulado en Ingeniería de Sistemas
2	Ingenieria en Mecatronica	Titulado en Mecatronica
3	Ingenieria Civil	Titulado en Ing. Civil
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (iddepartamento, nombredepartamento, edificio) FROM stdin;
1	Matemáticas	Edificio A
2	Filosofía	Edificio B
3	Ciencias de la Computación	Edificio C
4	Humanidades	Edificio D
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (idcurso, nombrecurso, descripcion, creditos, semestre, iddepartamento, idcampus) FROM stdin;
5	Ecuaciones	Curso de Ecuaciones Diferenciales	3	Primero	1	\N
6	Ética	Curso de Ética Profesional	3	Segundo	2	\N
7	Programación	Curso de Programación en C	3	Tercero	3	\N
8	Lectura	Curso de Lectura Crítica y Comprensión	3	Cuarto	4	\N
1	Ecuaciones	Curso de Ecuaciones Diferenciales	3	Primero	1	\N
2	Ética	Curso de Ética Profesional	3	Segundo	2	\N
3	Programación	Curso de Programación en C	3	Tercero	3	\N
4	Lectura	Curso de Lectura Crítica y Comprensión	3	Cuarto	4	\N
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesores (idprofesor, nombre, apellido, titulo, iddepartamento, email) FROM stdin;
1	Jose	Bogarin	Doctor en Matemáticas	1	\N
2	Ana	Lepe	Licenciada en Ciencias de la Computación	3	\N
3	Luis	Alvarado	Doctor en Filosofía	2	\N
4	Daniel	Larusso	Licenciada en Literatura	4	\N
\.


--
-- Data for Name: cursosprofesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursosprofesores (idcursoprofesor, idcurso, idprofesor) FROM stdin;
1	1	1
2	3	1
3	2	2
4	4	2
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (idestudiante, nombre, apellido, fechanacimiento, direccion, email, idcarrera) FROM stdin;
2	Damian	Lugo	2005-06-22	Av. Real 456, Mexicali	damian@gmail.com	2
5	Emanuel	Padilla	1999-07-30	Calle Sol 202, Mexicali	emanuel@gmail.com	1
6	Miguel	Hidalgo	1995-05-25	Calle Historia 303, Tijuana	miguel@gmail.com	3
1	Donovan	Hernandez	2002-09-19	Cerritos, Mexicali	donovan,hdez@gmail.com	1
4	Juanito	Alcachofa	1995-02-01	Calle Jardín 101, Tijuana	juanito@gmail.com	1
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios (idhorario, idcurso, fechainicio, fechafin, horainicio, horafin) FROM stdin;
\.


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (idinscripcion, idestudiante, idcurso, fechainscripcion, calificacion) FROM stdin;
22	1	1	2023-08-01	9.50
23	1	2	2023-08-01	8.00
24	2	3	2023-08-01	7.50
25	4	1	2023-08-01	8.50
26	5	2	2023-08-01	9.00
27	6	3	2023-08-01	6.50
\.


--
-- Data for Name: programasestudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programasestudio (idprograma, nombreprograma, descripcionprograma) FROM stdin;
1	Ingeniería de Sistemas	Programa de estudios orientado a la tecnología y la informática
2	Ingeniería Mecatrónica	Programa de estudios interdisciplinario entre la ingeniería mecánica y electrónica
3	Ingeniería Civil	Programa de estudios enfocado en la construcción y el diseño de infraestructuras
4	Ciencias Sociales	Programa de estudios centrado en la filosofía, sociología y psicología
\.


--
-- Data for Name: programascursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programascursos (idprogramacurso, idprograma, idcurso) FROM stdin;
1	1	1
2	1	3
3	2	1
4	2	4
5	3	2
6	3	4
7	4	2
8	4	4
\.


--
-- Name: campus_idcampus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_idcampus_seq', 2, true);


--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_idcarrera_seq', 3, true);


--
-- Name: cursos_idcurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_idcurso_seq', 8, true);


--
-- Name: cursosprofesores_idcursoprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursosprofesores_idcursoprofesor_seq', 4, true);


--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_iddepartamento_seq', 4, true);


--
-- Name: estudiantes_idestudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_idestudiante_seq', 6, true);


--
-- Name: horarios_idhorario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_idhorario_seq', 1, false);


--
-- Name: inscripciones_idinscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_idinscripcion_seq', 27, true);


--
-- Name: profesores_idprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_idprofesor_seq', 4, true);


--
-- Name: programascursos_idprogramacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programascursos_idprogramacurso_seq', 8, true);


--
-- Name: programasestudio_idprograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudio_idprograma_seq', 4, true);


--
-- PostgreSQL database dump complete
--

