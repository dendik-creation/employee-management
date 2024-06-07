--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: tbl_absensi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_absensi (
    nik character varying(15) NOT NULL,
    absen_masuk timestamp without time zone,
    absen_pulang timestamp without time zone,
    tanggal_absensi date
);


ALTER TABLE public.tbl_absensi OWNER TO postgres;

--
-- Name: tbl_absensi_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_absensi_setting (
    uid integer NOT NULL,
    start_masuk character varying(5),
    end_masuk character varying(5),
    start_pulang character varying(5),
    end_pulang character varying(5)
);


ALTER TABLE public.tbl_absensi_setting OWNER TO postgres;

--
-- Name: tbl_bagian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_bagian (
    bagian_id integer NOT NULL,
    nama_bagian character varying(30) DEFAULT NULL::character varying
);


ALTER TABLE public.tbl_bagian OWNER TO postgres;

--
-- Name: tbl_bagian_bagian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_bagian_bagian_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_bagian_bagian_id_seq OWNER TO postgres;

--
-- Name: tbl_bagian_bagian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_bagian_bagian_id_seq OWNED BY public.tbl_bagian.bagian_id;


--
-- Name: tbl_jabatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_jabatan (
    jabatan_id integer NOT NULL,
    bagian_id integer NOT NULL,
    nama_jabatan character varying
);


ALTER TABLE public.tbl_jabatan OWNER TO postgres;

--
-- Name: tbl_jabatan_jabatan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_jabatan_jabatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_jabatan_jabatan_id_seq OWNER TO postgres;

--
-- Name: tbl_jabatan_jabatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_jabatan_jabatan_id_seq OWNED BY public.tbl_jabatan.jabatan_id;


--
-- Name: tbl_karyawan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_karyawan (
    nik_karyawan character varying(15) DEFAULT NULL::character varying NOT NULL,
    nama_karyawan character varying(50),
    jenis_kelamin character varying(9),
    bagian_id integer,
    jabatan_id integer,
    file_foto character varying(13),
    tanggal_masuk date,
    status_kerja character varying(10),
    keterangan character varying(50)
);


ALTER TABLE public.tbl_karyawan OWNER TO postgres;

--
-- Name: tbl_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_user (
    user_id integer NOT NULL,
    user_name character varying(20) DEFAULT NULL::character varying,
    user_password character varying(20) DEFAULT NULL::character varying,
    user_full_name character varying(50) DEFAULT NULL::character varying,
    user_level integer,
    user_status integer
);


ALTER TABLE public.tbl_user OWNER TO postgres;

--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_user_user_id_seq OWNER TO postgres;

--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_user_user_id_seq OWNED BY public.tbl_user.user_id;


--
-- Name: tbl_bagian bagian_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_bagian ALTER COLUMN bagian_id SET DEFAULT nextval('public.tbl_bagian_bagian_id_seq'::regclass);


--
-- Name: tbl_jabatan jabatan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_jabatan ALTER COLUMN jabatan_id SET DEFAULT nextval('public.tbl_jabatan_jabatan_id_seq'::regclass);


--
-- Name: tbl_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user ALTER COLUMN user_id SET DEFAULT nextval('public.tbl_user_user_id_seq'::regclass);


--
-- Data for Name: tbl_absensi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_absensi (nik, absen_masuk, absen_pulang, tanggal_absensi) FROM stdin;
240300001	2024-03-08 08:45:01	\N	2024-03-08
\.


--
-- Data for Name: tbl_absensi_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_absensi_setting (uid, start_masuk, end_masuk, start_pulang, end_pulang) FROM stdin;
1	06:00	07:30	16:00	17:00
\.


--
-- Data for Name: tbl_bagian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_bagian (bagian_id, nama_bagian) FROM stdin;
3	Informasi
5	Konsumsi
6	Desain
2	Teknologi
1	Administrasi
4	Teknisi
39	Hiburan
\.


--
-- Data for Name: tbl_jabatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_jabatan (jabatan_id, bagian_id, nama_jabatan) FROM stdin;
1	4	Teknisi Jaringan
2	4	Teknisi Komputer
3	1	Administrator Perusahaan
4	6	Head Design Team
5	6	Sketsa Creator
6	2	IT Support
7	39	Badut Ceria
\.


--
-- Data for Name: tbl_karyawan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_karyawan (nik_karyawan, nama_karyawan, jenis_kelamin, bagian_id, jabatan_id, file_foto, tanggal_masuk, status_kerja, keterangan) FROM stdin;
240300001	Tuan Hijau Adudu	Laki-laki	2	6	240300001.jpg	2024-03-08	Tetap	Karyawan ini masih bekerja disini
240300002	Acumalaka	Laki-laki	39	7	240300002.jpg	2024-03-08	Tetap	Karyawan ini masih bekerja disini
\.


--
-- Data for Name: tbl_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_user (user_id, user_name, user_password, user_full_name, user_level, user_status) FROM stdin;
1	ADMIN001	ADMIN	ADMINISTRATOR	1	1
\.


--
-- Name: tbl_bagian_bagian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_bagian_bagian_id_seq', 40, true);


--
-- Name: tbl_jabatan_jabatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_jabatan_jabatan_id_seq', 10, true);


--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_user_user_id_seq', 1, true);


--
-- Name: tbl_absensi tbl_absensi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_absensi
    ADD CONSTRAINT tbl_absensi_pkey PRIMARY KEY (nik);


--
-- Name: tbl_absensi_setting tbl_absensi_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_absensi_setting
    ADD CONSTRAINT tbl_absensi_setting_pkey PRIMARY KEY (uid);


--
-- Name: tbl_bagian tbl_bagian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_bagian
    ADD CONSTRAINT tbl_bagian_pkey PRIMARY KEY (bagian_id);


--
-- Name: tbl_jabatan tbl_jabatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_jabatan
    ADD CONSTRAINT tbl_jabatan_pkey PRIMARY KEY (jabatan_id);


--
-- Name: tbl_karyawan tbl_karyawan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_karyawan
    ADD CONSTRAINT tbl_karyawan_pkey PRIMARY KEY (nik_karyawan);


--
-- Name: tbl_user tbl_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (user_id);


--
-- Name: tbl_absensi FK_tbl_absensi_tbl_karyawan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_absensi
    ADD CONSTRAINT "FK_tbl_absensi_tbl_karyawan" FOREIGN KEY (nik) REFERENCES public.tbl_karyawan(nik_karyawan) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tbl_jabatan FK_tbl_jabatan_tbl_bagian; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_jabatan
    ADD CONSTRAINT "FK_tbl_jabatan_tbl_bagian" FOREIGN KEY (bagian_id) REFERENCES public.tbl_bagian(bagian_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tbl_karyawan FK_tbl_karyawan_tbl_bagian; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_karyawan
    ADD CONSTRAINT "FK_tbl_karyawan_tbl_bagian" FOREIGN KEY (bagian_id) REFERENCES public.tbl_bagian(bagian_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tbl_karyawan FK_tbl_karyawan_tbl_jabatan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_karyawan
    ADD CONSTRAINT "FK_tbl_karyawan_tbl_jabatan" FOREIGN KEY (jabatan_id) REFERENCES public.tbl_jabatan(jabatan_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

