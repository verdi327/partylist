--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE playlists (
    id integer NOT NULL,
    name character varying(255),
    creator character varying(255),
    access_token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE playlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE playlists_id_seq OWNED BY playlists.id;


--
-- Name: playlists_songs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE playlists_songs (
    id integer NOT NULL,
    playlist_id integer,
    song_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: playlists_songs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE playlists_songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: playlists_songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE playlists_songs_id_seq OWNED BY playlists_songs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: searches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE searches (
    id integer NOT NULL,
    query hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE searches_id_seq OWNED BY searches.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE songs (
    id integer NOT NULL,
    title character varying(255),
    thumbnail character varying(255),
    original_query character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    youtube_id character varying(255)
);


--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE songs_id_seq OWNED BY songs.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY playlists ALTER COLUMN id SET DEFAULT nextval('playlists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY playlists_songs ALTER COLUMN id SET DEFAULT nextval('playlists_songs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY searches ALTER COLUMN id SET DEFAULT nextval('searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY songs ALTER COLUMN id SET DEFAULT nextval('songs_id_seq'::regclass);


--
-- Name: playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: playlists_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY playlists_songs
    ADD CONSTRAINT playlists_songs_pkey PRIMARY KEY (id);


--
-- Name: searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT searches_pkey PRIMARY KEY (id);


--
-- Name: songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20130529174559');

INSERT INTO schema_migrations (version) VALUES ('20130529185444');

INSERT INTO schema_migrations (version) VALUES ('20130529195043');

INSERT INTO schema_migrations (version) VALUES ('20130529202702');

INSERT INTO schema_migrations (version) VALUES ('20130530160345');

INSERT INTO schema_migrations (version) VALUES ('20130530171414');