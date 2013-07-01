--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

DROP INDEX public.unique_schema_migrations;
DROP INDEX public.index_users_on_reset_password_token;
DROP INDEX public.index_users_on_email;
DROP INDEX public.index_campaigns_on_need_id;
DROP INDEX public.index_campaigns_on_id;
DROP INDEX public.index_campaigns_on_cause_id;
DROP INDEX public.index_campaigns_on_active;
DROP INDEX public.index_admin_users_on_reset_password_token;
DROP INDEX public.index_admin_users_on_email;
DROP INDEX public.index_admin_notes_on_resource_type_and_resource_id;
DROP INDEX public.index_active_admin_comments_on_namespace;
DROP INDEX public.index_active_admin_comments_on_author_type_and_author_id;
ALTER TABLE ONLY public.volunteers DROP CONSTRAINT volunteers_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users_badges DROP CONSTRAINT users_badges_pkey;
ALTER TABLE ONLY public.usercauses DROP CONSTRAINT usercauses_pkey;
ALTER TABLE ONLY public.subscribes DROP CONSTRAINT subscribes_pkey;
ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
ALTER TABLE ONLY public.needs DROP CONSTRAINT needs_pkey;
ALTER TABLE ONLY public.name DROP CONSTRAINT name_pkey;
ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
ALTER TABLE ONLY public.featured_causes DROP CONSTRAINT featured_causes_pkey;
ALTER TABLE ONLY public.donations DROP CONSTRAINT donations_pkey;
ALTER TABLE ONLY public.causes DROP CONSTRAINT causes_pkey;
ALTER TABLE ONLY public.causes_causetypes DROP CONSTRAINT causes_causetypes_pkey;
ALTER TABLE ONLY public.causes_cause_types DROP CONSTRAINT causes_cause_types_pkey;
ALTER TABLE ONLY public.cause_types DROP CONSTRAINT cause_types_pkey;
ALTER TABLE ONLY public.cause_applications DROP CONSTRAINT cause_applications_pkey;
ALTER TABLE ONLY public.campaigns DROP CONSTRAINT campaigns_pkey;
ALTER TABLE ONLY public.badges_users DROP CONSTRAINT badges_users_pkey;
ALTER TABLE ONLY public.badges DROP CONSTRAINT badges_pkey;
ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
ALTER TABLE ONLY public.active_admin_comments DROP CONSTRAINT active_admin_comments_pkey;
ALTER TABLE public.volunteers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users_badges ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.usercauses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.subscribes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.needs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.name ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.games ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.featured_causes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.donations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.causes_causetypes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.causes_cause_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.causes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cause_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cause_applications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.campaigns ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.badges_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.badges ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_admin_comments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.volunteers_id_seq;
DROP TABLE public.volunteers;
DROP SEQUENCE public.users_id_seq;
DROP SEQUENCE public.users_badges_id_seq;
DROP TABLE public.users_badges;
DROP TABLE public.users;
DROP SEQUENCE public.usercauses_id_seq;
DROP TABLE public.usercauses;
DROP SEQUENCE public.subscribes_id_seq;
DROP TABLE public.subscribes;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.permissions_id_seq;
DROP TABLE public.permissions;
DROP SEQUENCE public.needs_id_seq;
DROP TABLE public.needs;
DROP SEQUENCE public.name_id_seq;
DROP TABLE public.name;
DROP SEQUENCE public.locations_id_seq;
DROP TABLE public.locations_causes;
DROP TABLE public.locations;
DROP SEQUENCE public.games_id_seq;
DROP TABLE public.games;
DROP SEQUENCE public.featured_causes_id_seq;
DROP TABLE public.featured_causes;
DROP SEQUENCE public.donations_id_seq;
DROP TABLE public.donations;
DROP SEQUENCE public.causes_id_seq;
DROP SEQUENCE public.causes_causetypes_id_seq;
DROP TABLE public.causes_causetypes;
DROP TABLE public.causes_causeneeds;
DROP SEQUENCE public.causes_cause_types_id_seq;
DROP TABLE public.causes_cause_types;
DROP TABLE public.causes;
DROP SEQUENCE public.cause_types_id_seq;
DROP TABLE public.cause_types;
DROP SEQUENCE public.cause_applications_id_seq;
DROP TABLE public.cause_applications;
DROP SEQUENCE public.campaigns_id_seq;
DROP TABLE public.campaigns;
DROP SEQUENCE public.badges_users_id_seq;
DROP TABLE public.badges_users;
DROP SEQUENCE public.badges_id_seq;
DROP TABLE public.badges;
DROP SEQUENCE public.admin_users_id_seq;
DROP TABLE public.admin_users;
DROP SEQUENCE public.active_admin_comments_id_seq;
DROP TABLE public.active_admin_comments;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    namespace character varying(255)
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE badges (
    id integer NOT NULL,
    name character varying(255),
    file_name character varying(255),
    accomplishment character varying(255),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badges_id_seq OWNED BY badges.id;


--
-- Name: badges_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE badges_users (
    id integer NOT NULL,
    user_id integer,
    badge_id integer
);


--
-- Name: badges_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badges_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badges_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badges_users_id_seq OWNED BY badges_users.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    cause_id integer,
    need_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    percent_complete integer,
    desired_state character varying(255),
    current_state character varying(255),
    active boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: cause_applications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cause_applications (
    id integer NOT NULL,
    name character varying(255),
    org_name character varying(255),
    website character varying(255),
    email character varying(255),
    phone_number character varying(255),
    mission text,
    how_hear text
);


--
-- Name: cause_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cause_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cause_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cause_applications_id_seq OWNED BY cause_applications.id;


--
-- Name: cause_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cause_types (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255),
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone
);


--
-- Name: cause_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cause_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cause_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cause_types_id_seq OWNED BY cause_types.id;


--
-- Name: causes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE causes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255),
    description text,
    mission_statement text,
    how_hear text,
    phone_number character varying(255),
    email character varying(255),
    website character varying(255),
    cause_type_id integer,
    city character varying(255),
    state character varying(255),
    video_link character varying(255),
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    is_featured boolean DEFAULT false,
    twitter_handle character varying(255),
    facebook_url character varying(255),
    city_id integer,
    active boolean,
    display_name character varying(255)
);


--
-- Name: causes_cause_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE causes_cause_types (
    id integer NOT NULL,
    cause_id integer,
    cause_type_id integer
);


--
-- Name: causes_cause_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE causes_cause_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: causes_cause_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE causes_cause_types_id_seq OWNED BY causes_cause_types.id;


--
-- Name: causes_causeneeds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE causes_causeneeds (
    cause_id integer,
    cause_need_id integer
);


--
-- Name: causes_causetypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE causes_causetypes (
    id integer NOT NULL,
    cause_id integer,
    cause_type_id integer
);


--
-- Name: causes_causetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE causes_causetypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: causes_causetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE causes_causetypes_id_seq OWNED BY causes_causetypes.id;


--
-- Name: causes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE causes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: causes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE causes_id_seq OWNED BY causes.id;


--
-- Name: donations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE donations (
    id integer NOT NULL,
    amount double precision,
    tip double precision,
    tracking character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    donations_need_id integer
);


--
-- Name: donations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE donations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE donations_id_seq OWNED BY donations.id;


--
-- Name: featured_causes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE featured_causes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: featured_causes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE featured_causes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: featured_causes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE featured_causes_id_seq OWNED BY featured_causes.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE games (
    id integer NOT NULL,
    level integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    show_instructions boolean DEFAULT true
);


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE games_id_seq OWNED BY games.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cause_id integer,
    latitude double precision,
    longitude double precision,
    name character varying(255),
    address_line_one character varying(255),
    address_line_two character varying(255),
    city character varying(255),
    region character varying(255),
    postal_code character varying(255),
    country character varying(255)
);


--
-- Name: locations_causes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations_causes (
    location_id integer,
    cause_id integer
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: name; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE name (
    id integer NOT NULL,
    name character varying(255),
    needable_id integer,
    needable_type character varying(255),
    cause_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: name_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE name_id_seq OWNED BY name.id;


--
-- Name: needs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE needs (
    id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    cause_id integer,
    description text,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    address character varying(255),
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    campaign_id integer
);


--
-- Name: needs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE needs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: needs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE needs_id_seq OWNED BY needs.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: subscribes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE subscribes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255)
);


--
-- Name: subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscribes_id_seq OWNED BY subscribes.id;


--
-- Name: usercauses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usercauses (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cause_id integer,
    user_id integer
);


--
-- Name: usercauses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usercauses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usercauses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usercauses_id_seq OWNED BY usercauses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    bio text,
    city character varying(255),
    state character varying(255),
    level integer DEFAULT 0,
    provider character varying(255),
    uid character varying(255),
    game_id integer,
    fb_token text,
    role character varying(255)
);


--
-- Name: users_badges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_badges (
    id integer NOT NULL,
    user_id integer,
    badge_id integer
);


--
-- Name: users_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_badges_id_seq OWNED BY users_badges.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE volunteers (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    volunteer_need_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying(255)
);


--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volunteers_id_seq OWNED BY volunteers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badges ALTER COLUMN id SET DEFAULT nextval('badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badges_users ALTER COLUMN id SET DEFAULT nextval('badges_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cause_applications ALTER COLUMN id SET DEFAULT nextval('cause_applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cause_types ALTER COLUMN id SET DEFAULT nextval('cause_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY causes ALTER COLUMN id SET DEFAULT nextval('causes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY causes_cause_types ALTER COLUMN id SET DEFAULT nextval('causes_cause_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY causes_causetypes ALTER COLUMN id SET DEFAULT nextval('causes_causetypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY donations ALTER COLUMN id SET DEFAULT nextval('donations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY featured_causes ALTER COLUMN id SET DEFAULT nextval('featured_causes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY games ALTER COLUMN id SET DEFAULT nextval('games_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY name ALTER COLUMN id SET DEFAULT nextval('name_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY needs ALTER COLUMN id SET DEFAULT nextval('needs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscribes ALTER COLUMN id SET DEFAULT nextval('subscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercauses ALTER COLUMN id SET DEFAULT nextval('usercauses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_badges ALTER COLUMN id SET DEFAULT nextval('users_badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteers_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY active_admin_comments (id, resource_id, resource_type, author_id, author_type, body, created_at, updated_at, namespace) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
2	nick@meetmantra.com	$2a$10$J8FEFFq/cWezOo2KSap9Neic97aCkMuhBFAWZ.eocGXW2r.E15pWK	\N	\N	\N	0	\N	\N	\N	\N	2013-06-26 19:53:35.639536	2013-06-26 19:53:35.639536
3	jonathan@meetmantra.com	$2a$10$d5FB0JAyVzD4sYEZwmMKEuxWpsimJwm69paHZZSblws8lAcMbVtzq	\N	\N	\N	0	\N	\N	\N	\N	2013-06-26 19:55:26.319327	2013-06-26 19:55:26.319327
4	colleen@meetmantra.com	$2a$10$5jdv9bdlK9QXSdhR0kPW/e/NHEfA7XyGInbjBFYf0Zio8wEmQh.TG	\N	\N	\N	0	\N	\N	\N	\N	2013-06-26 19:57:51.396734	2013-06-26 19:57:51.396734
1	tim@meetmantra.com	$2a$10$rOoXYpn5I.OIvoM8YmprluvutqB6AtWBopxH.nyIf8lvk3Xbdc17u	\N	\N	\N	14	2013-06-29 23:07:31.631315	2013-06-28 15:57:48.847647	108.240.30.245	38.106.196.126	2013-06-18 18:24:23.196345	2013-06-29 23:07:31.633724
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('admin_users_id_seq', 4, true);


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY badges (id, name, file_name, accomplishment, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('badges_id_seq', 1, false);


--
-- Data for Name: badges_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY badges_users (id, user_id, badge_id) FROM stdin;
\.


--
-- Name: badges_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('badges_users_id_seq', 1, false);


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY campaigns (id, cause_id, need_id, start_date, end_date, percent_complete, desired_state, current_state, active, created_at, updated_at) FROM stdin;
5	2	6	\N	\N	\N			f	2013-06-27 19:26:23.331863	2013-06-27 19:26:23.331863
4	22	4	\N	\N	\N			f	2013-06-27 19:07:14.766899	2013-06-27 19:42:22.581849
6	9	8	\N	\N	\N			f	2013-06-27 19:46:14.022951	2013-06-27 19:46:14.022951
7	9	10	\N	\N	\N			f	2013-06-27 19:50:32.34023	2013-06-27 19:50:32.34023
8	37	11	\N	\N	\N			f	2013-06-27 20:18:50.492002	2013-06-27 20:18:50.492002
9	20	12	\N	\N	\N			f	2013-06-27 20:28:26.408243	2013-06-27 20:28:26.408243
10	23	13	\N	\N	\N			f	2013-06-27 21:27:30.772073	2013-06-27 21:27:30.772073
11	1	14	\N	\N	\N			f	2013-06-27 21:40:23.981419	2013-06-27 21:40:23.981419
12	19	15	\N	\N	\N			f	2013-06-27 21:52:17.362016	2013-06-27 21:52:17.362016
13	19	16	\N	\N	\N			f	2013-06-27 22:00:53.8454	2013-06-27 22:00:53.8454
14	36	17	\N	\N	\N			f	2013-06-27 22:07:10.830968	2013-06-27 22:07:10.830968
15	17	18	\N	\N	\N			f	2013-06-27 22:12:21.991599	2013-06-27 22:12:21.991599
16	17	19	\N	\N	\N			f	2013-06-27 22:13:50.039158	2013-06-27 22:13:50.039158
17	10	20	\N	\N	\N			f	2013-06-27 22:31:30.816631	2013-06-27 22:31:30.816631
18	1	21	\N	\N	\N			f	2013-06-27 22:38:26.01898	2013-06-27 22:38:26.01898
19	8	22	\N	\N	\N			f	2013-06-27 22:42:03.414109	2013-06-27 22:42:03.414109
20	11	23	\N	\N	\N			f	2013-06-27 22:44:53.23073	2013-06-27 22:44:53.23073
21	7	24	\N	\N	\N			f	2013-06-27 22:50:31.568322	2013-06-27 22:50:31.568322
22	6	25	\N	\N	\N			f	2013-06-27 22:53:15.716397	2013-06-27 22:53:15.716397
23	3	26	\N	\N	\N			f	2013-06-27 22:56:49.317229	2013-06-27 22:56:49.317229
24	19	27	\N	\N	\N			f	2013-06-27 23:00:01.055784	2013-06-27 23:00:01.055784
25	15	28	\N	\N	\N			f	2013-06-27 23:01:59.286965	2013-06-27 23:01:59.286965
26	14	29	\N	\N	\N			f	2013-06-27 23:04:33.768213	2013-06-27 23:04:33.768213
27	21	30	\N	\N	\N			f	2013-06-27 23:08:12.944473	2013-06-27 23:08:12.944473
28	13	31	\N	\N	\N			f	2013-06-27 23:10:00.132481	2013-06-27 23:10:00.132481
29	16	32	\N	\N	\N			f	2013-06-27 23:11:57.315762	2013-06-27 23:11:57.315762
30	20	33	\N	\N	\N			f	2013-06-27 23:15:17.658623	2013-06-27 23:15:17.658623
31	23	34	\N	\N	\N			f	2013-06-27 23:20:37.263045	2013-06-27 23:20:37.263045
32	35	35	\N	\N	\N			f	2013-06-27 23:22:09.881264	2013-06-27 23:22:09.881264
33	34	36	\N	\N	\N			f	2013-06-27 23:24:35.023632	2013-06-27 23:24:35.023632
34	38	37	\N	\N	\N			f	2013-06-27 23:29:00.874403	2013-06-27 23:29:00.874403
35	37	38	\N	\N	\N			f	2013-06-27 23:31:30.633095	2013-06-27 23:31:30.633095
36	4	39	\N	\N	\N			f	2013-06-27 23:34:28.221145	2013-06-27 23:34:28.221145
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('campaigns_id_seq', 36, true);


--
-- Data for Name: cause_applications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cause_applications (id, name, org_name, website, email, phone_number, mission, how_hear) FROM stdin;
\.


--
-- Name: cause_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cause_applications_id_seq', 1, false);


--
-- Data for Name: cause_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cause_types (id, created_at, updated_at, name, picture_file_name, picture_content_type, picture_file_size, picture_updated_at) FROM stdin;
9	2013-06-26 22:14:17.593247	2013-06-27 21:01:38.692033	Education	education_front.jpg	image/jpeg	15144	2013-06-27 21:01:38.295349
8	2013-06-26 22:13:59.25435	2013-06-27 21:02:15.28245	Social Equality	01k-may-day-cairo-egypt-social-equlaity.jpg	image/jpeg	116054	2013-06-27 21:02:14.625894
7	2013-06-26 22:13:23.125476	2013-06-27 21:02:42.523373	Religious 	temple_sunset1.jpg	image/jpeg	22938	2013-06-27 21:02:42.144849
6	2013-06-26 22:13:09.088478	2013-06-27 21:03:07.427488	Global Outreach	0e744541_global-prayer-gathering-285-by-200.gif	image/gif	40185	2013-06-27 21:03:06.493722
5	2013-06-26 22:12:47.165774	2013-06-27 21:03:22.571371	Environmental 	Environmental.jpg	image/jpeg	19591	2013-06-27 21:03:22.175064
4	2013-06-26 22:12:28.369818	2013-06-27 21:03:41.565118	Health & Wellness	health-and-wellness.jpg	image/jpeg	382640	2013-06-27 21:03:41.235626
3	2013-06-26 22:12:09.855435	2013-06-27 21:04:06.710586	Youth	YouthProgramming.jpg	image/jpeg	56101	2013-06-27 21:04:06.284554
2	2013-06-26 22:11:54.027773	2013-06-27 21:04:23.68378	Animal Welfare	images.jpeg	image/jpeg	9071	2013-06-27 21:04:23.451298
1	2013-06-26 22:11:34.187573	2013-06-27 21:04:40.154447	Arts	Performance_art.JPG	image/jpeg	196898	2013-06-27 21:04:39.535733
\.


--
-- Name: cause_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cause_types_id_seq', 9, true);


--
-- Data for Name: causes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY causes (id, created_at, updated_at, name, description, mission_statement, how_hear, phone_number, email, website, cause_type_id, city, state, video_link, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, is_featured, twitter_handle, facebook_url, city_id, active, display_name) FROM stdin;
1	2013-06-18 20:50:55.659346	2013-06-28 19:49:30.155554	Women Divine	WOMEN DIVINE has a vision to educate, inspire, and empower young women to strive for excellence in all areas of their lives.	To effectively impact the lives of young women through academic enhancement, leadership development, financial literacy and cultural enrichment. Our mission is based on the following principles: Responsibility: Empower young women to establish goals and follow through on commitments. Commitment: Inspire pro-social friendships, strong interpersonal skills and instill a sense of hope in the future. Support: Surround young women in a caring, inclusive learning environment. Possibility: Expand the perspective of young women to make them aware of life's possibilities.			jthomas@wdivine.org	http://www.wdivine.org/	\N	Chicago	Illinois	http://www.youtube.com/embed/7nZx85zj2xQ	\N	\N	\N	\N	t		https://www.facebook.com/pages/Women-Divine/107222336098	\N	\N	Women Divine
8	2013-06-18 22:39:23.653193	2013-06-28 19:43:24.46835	Community Building Tutors	An organization that  deliveries over 1,250 hours of free tutoring in five distinct communities in Chicago. 	The mission of Community Building Tutors is to strengthen communities through the implementation of innovative after school programming involving elementary school students, high-school students, and working professionals emphasizing civic engagement. 			info@cbtutors.org	http://www.cbtutors.org	\N	Chicago 	Illinois	http://www.youtube.com/embed/OoKxgal5D7s	O6L5J7iChMf3F4JhTwA1KgY56a7a91JR4IC3S2gwOmQ_HNNpC8Ju48P3J91h66OLP0KdDveR0W-JAdwY0iKMXck_fZqDxAycQlscDFBl3Z0pnvD2sXdzFn5X31Rtq9OYEf4_V0rh07CXp2XSZhvvAv5fy9zeAAJ3p1ytQEIKc_NMpZI.jpeg	image/jpeg	139748	2013-06-28 16:32:49.840969	t			\N	\N	Community Building Tutors
3	2013-06-18 22:32:08.088468	2013-06-28 19:48:13.25055	Chicago Gateway Green	A non-profit organization dedicated to greening and beautifying Chicago's expressway, gateways, and neighborhoods	We lead urban beautification and greening projects that make a positive environmental and aesthetic impact on Chicago. Ultimately our work leads to improved quality of life through healthier living. Our sustainable landscaping, litter removal and native plantings on hundreds of acres along transportation corridors help improve air quality, protect our water, and restore the beauty of Chicago – making us feel good about our surroundings and breathe a little easier, too.			kteel@gatewaygreen.org	http://www.gatewaygreen.org	\N	Chicago	Illinois	http://www.youtube.com/embed/MGYi4Py-bP0	ZnlN4_WvDlLQY0xuMCjXj1EQnE89ZoGs-DfsSyyz7Lk.jpeg	image/jpeg	266357	2013-06-28 16:12:20.586492	t	https://twitter.com/Gateway_Green	https://www.facebook.com/GatewayGreen	\N	\N	Chicago Gateway Green
6	2013-06-18 22:37:02.797532	2013-06-28 19:45:19.741998	Bright Promises Foundation 	The Bright Promises Foundation is the only independent public foundation in Illinois solely dedicated to funding programs for children.	The Bright Promises Foundation creates opportunities for Illinois children to reach their full promise and potential. We work with organizations to develop and deliver programs that provide the foundation for positive lives.			info@brightpromises.org	http://www.brightpromises.org	\N	Chicago 	Illinois	http://www.youtube.com/embed/zLym68bqUwQ	3-yTF5E5c_6m6VuJWAqfojQyOudHW2D2s8nXPzfBNJM_nL9nHgkjADQgZ6cvPXp8NKi4gCcW_N3nPt80tHcd1hk_2TesUo0KlBdjoyKilgu5t1LrAxsHJ3AItQpA5dMUx7Y.jpeg	image/jpeg	207985	2013-06-28 16:05:48.573512	t			\N	\N	Bright Promises Foundation 
11	2013-06-18 22:42:43.680451	2013-06-28 19:38:44.913568	In Her Shoes Foundation	The purpose of In Her Shoes Foundation is to bring women of all ages and backgrounds together, to share ideas, support and inspire the development and maintenance of a healthy and positive lifestyle.	The mission of In Her Shoes Foundation is to reach out to women of all ages and backgrounds – to share ideas, educate, support and inspire one another, in hopes of creating a positive and healthy lifestyle. It seeks to offer women leadership and empowerment abilities that are required to lead successful lives.			info@inhershoesfoundation.org	http://inhershoesfoundation.org	\N	Niles	Illinois	http://www.youtube.com/embed/1gx6ObJFQm0	N85ZxsTu1kz0HkYFARoNARgQYYhpnUpl5RjNn44Ttu8_IcBue9apkrD8dBPXK4GHuDqnfVM-ALnKUNRAHKHFhEo_ajJLAy7A-7s2ltr-8tpWzuXseSAIGxNXBmtKjYTG98U.jpeg	image/jpeg	159814	2013-06-28 16:18:59.640289	t		https://www.facebook.com/inhershoesfoundation	\N	\N	In Her Shoes Foundation
2	2013-06-18 22:14:48.123337	2013-06-28 19:48:55.543114	Asher James Congenital Heart Disease & Thrombosis Foundation	Asher James Congenital Heart Disease & Thrombosis Foundation is the first foundation to support and fund research in thrombosis in infants and children.	Asher James Congenital Heart Disease and Thrombosis Foundation seeks to find preventions and treatments through research by supporting those affected by congenital heart disease and/or thrombosis.		580-595-1037 	info@asherjamesfoundation.org	http://www.asherjamesfoundation.org	\N	Schaumburg	Illinois	http://www.youtube.com/embed/jHtpm0DAq3I	GD3LpinXk3TXAGjENMSvhmd-vIYV9B483ls-w1DVPb0.jpeg	image/jpeg	344555	2013-06-28 16:04:51.561249	t		https://www.facebook.com/asherjamesfoundation	1	\N	Asher James Foundation
10	2013-06-18 22:41:38.336665	2013-06-28 19:39:31.054852	Chicago Hopes for Kids	Chicago HOPES is a volunteer-based tutoring, homework help, and arts enrichment program for CPS students living in homeless shelters. 	Chicago HOPES for Kids We are a shelter based after-school and summer tutoring and enrichment program that, with the help of caring volunteers, strives to help children staying in shelters succeed academically in order to ameliorate the negative effects of homelessness on their lives.			chicagohopesforkids@gmail.com	http://www.chicagohopes.org	\N	Chicago 	Illinois	http://www.youtube.com/embed/ej3nsY5zC40	o-vSBR1zjVjIUI2LBYD1_NwtYGvSwgRP_niuThE76gs_ls8HkFnZBh-lkJt0vA5n2V-0TIy1JI5Fsd1ytrnhbgs_ORD96Syj6OE7kLwB7BW4IDM853p-NCQMa7m4FEPfohE_wOf9xGHen_sde0pXliCL7sNBBNNXE2STg1UUMkb9RFg_Rv8LOTjfm6Q4IVUa4uCpdQjoCKQz-x3J1yXFJvu9jVw.jpeg	image/jpeg	156886	2013-06-28 16:13:06.539623	t			\N	\N	Chicago Hopes
7	2013-06-18 22:38:11.481845	2013-06-28 19:44:18.332618	Association of Horizons	A community where barriers between people with and without physical disabilities are transcended, limitations are overcome, new abilities are discovered and an increased awareness of self and others is developed.	An organization of people with and without physical disabilities that provides opportunities for individuals to challenge themselves, develop responsibility and grow through interacting and working together.			horizon@associationofhorizon.org	http://associationofhorizon.org/wordpress/	\N	Chicago 	Illinois	http://www.youtube.com/embed/ijEu3s9gRVA	2_T9F7OZ4nfKPo5EA0po-OCKylPLn08ImukkMj4fnw8_U3xb2pBxDuHznGcvSr3Pd6W6QhM27zRIlWaYEswWPpA_OxGRhybY2GEoBobT7v3SRcICzfoWyPVfjezeBcAWwTk_4avxnF2O8q8RdEIuf4U0dXvQUquOxfoe4aoE8Wk_I8o.jpeg	image/jpeg	131335	2013-06-28 16:07:37.693608	t	https://twitter.com/@HorizonCamp92	https://www.facebook.com/pages/Association-of-Horizon-Inc/141191369238305	\N	\N	Association of Horizons
17	2013-06-18 23:01:45.486017	2013-06-28 19:32:59.971652	Go Farther Foundation	Farther Foundation was formed to help students break free from the constraints of poverty and gain experiences that propel them toward their highest aspirations.	Go Farther Foundation was formed to help students break free from the constraints of poverty and gain experiences that propel them toward their highest aspirations. We provide opportunities for eager and deserving students to travel worldwide and interact with individuals who have diverse backgrounds and experiences. They participate in programs where they are immersed in new cultures and experiences, learn and develop skills, provide community service, cultivate leadership potential and attain personal growth.			gofarther@fartherfoundation.org	http://www.fartherfoundation.org	\N	Oak Park	Illinois	http://www.youtube.com/embed/OCq5mP53CTI	\N	\N	\N	\N	t			\N	\N	Go Farther Foundation
21	2013-06-18 23:10:18.698425	2013-06-28 19:29:54.422721	Human Thread	HumanThread Center/Gallery for Peace, Arts & Education is a 501(c)(3) NPO that engages individuals in conversation about peace, nonviolence and human dignity through art, education, and discussion.	Our Mission is to promote and inspire artistic expression and creative actions that help connect communities and develop conscious leadership for the 21st century, focused on youth.			info@humanthread.net	http://www.humanthread.net	\N	Chicago	Illinois	http://www.youtube.com/embed/Sw5k71EVjso	\N	\N	\N	\N	t	https://twitter.com/HumanThreadNet	https://www.facebook.com/pages/HumanThread/151883121529	\N	\N	Human Thread
19	2013-06-18 23:07:48.330566	2013-06-28 19:32:11.669865	Thyck Troupe Organization	A 501(c)3, Performing Arts Company - based in Chicago - that trains, mentors, inspires and empowers curvaceous women pursuing professional careers in the arts.	Founder, Tressa Thomas, transitioned the ThYck Troupe from a "modeling interest club" into a 501(c)3 organization, where plus size women could not only pursue modeling careers, but partake in expanded training and development courses, health & wellness workshops, confidence-building seminars and even have their talents showcased for the general public in a variety of venues across the country. 			info@thycktroupe.org	http://www.thycktroupechicago.com	\N	Libertyville	Illinois	http://www.youtube.com/embed/njPDt2W_gwc	\N	\N	\N	\N	t	https://twitter.com/thycktroupe	https://www.facebook.com/thycktroupe	\N	\N	Thyck Troupe Organization
15	2013-06-18 22:58:10.667982	2013-06-28 19:35:15.923622	Literacy Volunteers of Illinois	An organization that aims to serve as a technical assistance and training agency for volunteer literacy programs affiliated with the national Literacy Volunteers of America organization.\r\n	Literacy Volunteers of Illinois is a statewide organization committed to developing and supporting volunteer literacy programs that help families, adults and out-of-school teens increase their literacy skills.			info@lvillinois.org	http://www.lvillinois.org	\N	Chicago	Illinois	http://www.youtube.com/embed/Hqb5wAnsX08	0mwtDbnDUzMct834L_SgntjpHu1TRhB5eJfZOqPEntc_KUQDDSfVA4sVt2qXXsFIILhfwWYMoJXokb5l9XbEUqM_oW7ZEpXh9o0nRsxpIFi-6WZELiiJWe4GOUFQJjz-i60_u3PLPz_4dydtL9-7vOrUN-pu7eBGdlcnGelZja0-Evo.jpeg	image/jpeg	233512	2013-06-28 16:22:21.481842	t	https://twitter.com/LVIllinois	https://www.facebook.com/lvillinois	\N	\N	Literacy Volunteers of Illinois
13	2013-06-18 22:44:59.858334	2013-06-28 19:37:36.125333	The Miracle Center	The Miracle Center is a non-profit organization that serves children, youth, and families in Chicago, Illinois. 	The Miracle Center is a faith-based agency whose purpose is to help children, youth, and families particularly through the performing arts to grow spiritually, mentally, emotionally, socially and physically during after-school and out-of- school programs.			jsanchez@themiraclecenter.org	http://www.themiraclecenter.com	\N	Chicago 	Illinois	http://www.youtube.com/embed/pue4yhcvRRE	VkAM_eb5CzCSPTu-txyBzd05mL-MPSZfcfWY4gkqFKs_vP5ULih_Ue_pParO7rAzwewiEUUXVrULSS94fAzBOtg_Oa-jVo4oFYTcinKl2Lrh6yIMkmZRLfAdKORKrqUngso_ki7LDMtEoE80B3NqfEdpQjyaXE_roYMygKVCGNBB0GY.jpeg	image/jpeg	236913	2013-06-28 16:32:10.592425	t	https://twitter.com/TMCchicago	https://www.facebook.com/TheMiracleCenter	\N	\N	The Miracle Center
16	2013-06-18 22:59:25.112578	2013-06-28 19:34:10.770814	Dreams for Kids	An organization that aims to break down the barriers of segregation, embrace the abilities and potential of an isolated population, and empower them by their paying it forward in such a way which changes their communities and transforms their lives.	Dreams for Kids replaces charity with opportunity for at-risk youth through service, leadership and social activities that inspire them to fearlessly pursue their dreams and compassionately change the world			info@dreamsforkids.org	http://dreamsforkids.org	\N	Chicago	Illinois	http://www.youtube.com/embed/cogsF14HjSI	fJoUoUbe8KfOHeYHrfyY6CMLUVrBFdkPmEhFXGgIi6s_ul1Q0mwuS1zeyQjYbwkLtVZQBE8nIxk7UH-Cy74_YYY_q2osqCsJ1lFj9VH3ms_24ECV0BH_vN1navqESnqzBMk.jpeg	image/jpeg	180335	2013-06-28 16:14:43.01406	t	https://twitter.com/DreamsforKids	https://www.facebook.com/pages/Dreams-for-Kids/27669100852	\N	\N	Dreams for Kids
23	2013-06-18 23:13:01.265529	2013-06-28 18:58:38.922719	Bright Promises Fund	an organization aimed to strengthen and sustain Christian schools.	To strengthen and sustain partner Christian schools by generating new sources of revenue so that more families may experience and benefit from urban Christian education.			info@brightpromisefund.org	http://www.brightpromisefund.org	\N	Chicago	Illinois	http://www.youtube.com/embed/AzKljZN_myo	\N	\N	\N	\N	t	https://twitter.com/Brightfund	https://www.facebook.com/BrightPromiseFund	\N	\N	Bright Promises Fund
22	2013-06-18 23:11:32.615682	2013-06-28 19:27:44.618909	Chicago Photography Center	An organization aimed to foster a broad community of photographers.	Our mission is to foster a broad community of photographers who practice and appreciate the art of photography by offering a variety of classes and exhibition activities; sustaining a corps of volunteers; sharing our cameras with overlooked and underserved communities; and providing a vibrant, welcoming environment in which all this happens.			info@chicagophoto.org	http://www.chicagophoto.org	\N	Chicago	Illinois	http://www.youtube.com/embed/Bck69lkruYY	qhcSRe5JqXMJGI-xRAASya5btI2jVFHeqKjI6Vtm1YY_AebWczHu0Lr7sBksHa9IIXt2yOGKneqZ0fK8ixr2dtI_AoG9tOjfOven4qNK7J0nf8XmMWzGIbdJ2Y9AVOfpjo0_8d4zeEfQnCVvbFLdbIgZiKcvVG3-lf-5XTryMEWwwRA.jpeg	image/jpeg	185587	2013-06-28 16:13:59.189161	t	https://twitter.com/ChicagoPhotoCtr	https://www.facebook.com/ChicagoPhotographyCenter	\N	\N	Chicago Photography Center
9	2013-06-18 22:40:29.224003	2013-06-28 19:42:09.080424	Care & Care	Care & Care is committed to improving the quality of life of those who are disadvantaged by poverty, disability or age. 	Care & Care is committed to improving the quality of life of those who are disadvantaged by poverty, disability or age. CARE & CARE is striving to establish a strong foundation for a dignified and meaningful life through the availability of various services including but not limited to the Charitable, Religious, Research and Education. Health Care Medical Centers are one of its services Primary Care focused and maintenance in nature.			info@carencare.org	http://www.carencare.org	\N	Chicago 	Illinois	http://www.youtube.com/embed/E-4gYXgvDbY	wU6_e1eMitVMjZF5rHQk-t-pPOh_jHb2cfiJLTK2DNo_8bF_ECAMvJJbYxCCwKgyAF2BrIp7O4Y4jPnWuoY8D2o_p49btAUDQe30kFoxmlMZPh1cZang18GfHBZcrfxfKto_EnWE057rG-Qx3eFRhWang5CLbcOqTV_pYSSim5bLHD8.jpeg	image/jpeg	233533	2013-06-28 16:08:33.971497	t			1	\N	Care & Care
35	2013-06-19 16:08:26.736938	2013-06-28 19:13:15.20365	Empower Community Center for Youth and Adults	An organization that services underprivileged youth and adults in low income communities.	The Empower Community Center for Youth and Adults, (ECCYA) is a non for profit organization that will service underprivileged youth and adults in low income communities.			yolanda.jeffries@eccya.org	http://www.eccya.org	\N	Chicago	Illinois	http://www.youtube.com/embed/YhldxJTnoC8	M8E5CR-X8abbCnAb5hBnHFwDuqD2DhqUILDhOwPrE80_YKnO9KbfdOBGgKYM7BShCh7uSLqbBw25Ado65TGd984_gaP4NmnTVWilzI8aCiY5-QFILszGtCs29wSrHwlnlYI.jpeg	image/jpeg	117698	2013-06-28 16:15:36.755335	t			\N	\N	Empower Community Center for Youth and Adults
34	2013-06-19 16:03:53.586058	2013-06-28 19:17:27.894207	The Sports Shed	An organization that collects quality sports equipment and re-distribute it to other non-profit organizations who offer sports-related programs to kids in need.	Our mission is to give under-resourced kids opportunities to engage in sports and physical activities that have a positive impact on their health, self-esteem, work ethic, and sense of belonging. We collect quality sports equipment and re-distribute it to other non-profit organizations who offer sports-related programs to kids in need.			info@thesportsshed.org	http://www.thesportsshed.org	\N			http://www.youtube.com/embed/_L5UrQ8kGC0	RveUBTdWwWuu-lcTB7OINh3JLvVfBXaBzeF2-JHFg-k_duhCQl60NraOQE0hVoVQ5EVHt1tJG7xw94J3kTZ3Y1M_E9XepFKsXex7-Hs9Gu3F5N7nW3kG0FOyJo9J0l-gQxU_1A41FXEfVz1PhBl0YCKDhhbka6iT70ox41fIj_5SFTU.jpeg	image/jpeg	174781	2013-06-28 16:29:43.772338	t			\N	\N	The Sports Shed
20	2013-06-18 23:09:11.044414	2013-06-28 19:31:36.008334	Do Your P'Art Foundation	Do Your P'Art Foundation brings young people together from various cultural and socio-economic backgrounds through artistic collaboration	At Do Your P'Art, we strive to bring young people from a variety of cultural and socioeconomic backgrounds together.  Our programs are designed to provide a positive experience where students work collaboratively on a project.   We define our projects such that the theme is appropriate for all, allowing the participants to find common ground and work together on their solution. 			info@doyourpartfoundation.org	http://doyourpartfoundation.org	\N	Winnetka	Illinois	http://www.youtube.com/embed/pxaNfXUvLqM	LHzYSL8IPcIOpM1EY8RY4IKYXFuXJv27oyN-CVu38DI_qnZ2j5Y9ftZK-JCqNUz8dxD5QcKsBhr2MRQhYQpI_XQ_ibFLFCXehXLIMpXlzuQUR04vTp2D2oYtGeXPDlCIuQg_FDnqtGOoJtSYlA1vajz6DxN5NSb0zvoTWMyZ8rwbbn0.jpeg	image/jpeg	271799	2013-06-28 16:31:01.315455	t	https://twitter.com/doyourpart96	https://www.facebook.com/DoYourPartFoundation?ref=ts	\N	\N	Do Your P'Art Foundation
14	2013-06-18 22:45:54.344035	2013-06-28 19:36:45.134165	Matanya's Hope	Matanya’s Hope is a non profit organization based in Kenya East Africa and in the USA which is focused on eradicating poverty by educating Kenya’s future: the children, as well as providing other life sustaining programs and opportunities.	To impart the knowledge and resources necessary for the community members of Nanyuki, the Maasai Mara, and surrounding areas of Kenya to increase their standard of living and establish self sufficiency through educational support, with some financial, psychological and material support as needed.			findonemindbodyspirit@yahoo.com	http://www.matanyashope.org	\N	Homewood	Illinois	http://www.youtube.com/embed/EGQra9CeZTI	JHFQ56mcoJdRjXZpwuiKhk0-5_ZsZAJFmiXB3ILnbaY_hgJ_QzMErriDivy3yNRxMfrKxdwAXzAhVTKVNybNMZk_ur7tHCG_untnj9p0ncdWyJhS0lKb5i9b_u3GnBmcSR0.jpeg	image/jpeg	195330	2013-06-28 16:26:37.469453	t			\N	\N	Matanya's Hope
4	2013-06-18 22:33:16.152214	2013-06-28 19:47:10.508959	Irving Park Community Food Pantry	A community food pantry that provides nutritionally balanced food to their neighbors who are at risk of  hunger. 	The main purpose of the Irving Park Community Food Pantry is to provide nutritionally balanced food to our clients who are at risk of hunger. In addition, we strive to increase awareness of hunger related issues to the community at large. Clients are often referred to additional community resources to meet the variety of needs that they may have that are beyond the scope of the Pantry. The Pantry also offers periodic nutrition education. We hope to provide our clients with other opportunities for learning and growth throughout the coming years.			info@irvingparkfoodpantry.org	http://irvingparkfoodpantry.com	\N	Chicago 	Illinois	http://www.youtube.com/embed/_V2eZiWpNSE	8mODGo128CtR2qh3jeYgTaPkrMJf9ssg2KbACZGwXaQ_hWsd0sOUFo4nmguPdySOTesT_8rIBmOrqfd1w8kI6aQ_AfxyXGQjO_EI94R-e99ip01VJYr1pf318B7K94w2u_E.jpeg	image/jpeg	339813	2013-06-28 16:19:42.372988	t			\N	\N	Irving Park Community Food Pantry
37	2013-06-25 17:06:51.905855	2013-06-28 19:00:06.901262	Perspective Charter Schools	An organization aimed to ensure that their students graduate from Perspectives prepared to succeed in college and in life.	Perspectives Charter Schools manages 5 open enrollment, tuition-free public schools serving 2,300 students in grades 6-12 in the communities of Auburn Gresham, Grand Boulevard and the South Loop. We are committed to providing top quality education in urban public schools.  Our goal is to ensure that our students graduate from Perspectives prepared to succeed in college and in life.			dterry@pcsedu.org	http://www.perspectivescs.org/	\N	Chicago	Illinois	http://www.youtube.com/embed/LLi4sqhEbYI	EhFjXxhzG8-aQzmDLHO4-JEsyunEE1r78I0hR_7GfPA_os_l_79sHCoYcnhEnJKObf8O8skORe6hcGQVDKxQhTQ_sINB170JKbiq7cCYYTRwQinctXMXYUCfq-XZ9vyDaC8.jpeg	image/jpeg	192884	2013-06-28 16:28:03.256048	t	https://twitter.com/pcsedu	https://www.facebook.com/perspectivescs	\N	\N	Perspective Charter Schools
36	2013-06-25 17:00:02.729233	2013-06-28 19:00:46.74859	Lost Boyz, Inc.	An organization aimed to decrease violence and improve the social conditions among the youth in the South Shore community. 	 Lost Boyz Inc.'s mission is to decrease violence and improve the social conditions among the youth in the South Shore community. Our mission is achieved by providing quality athletic and leadership training, re-entry assistance, and innovative ideas geared for at-risk youth to align income and entrepreneurial opportunities.			LStewart@LostBoyzInc.org	http://www.lostboyzinc.org	\N	Chicago	Illinois	http://www.youtube.com/embed/OMhdjP50DNE	1Y1BNcrWTFLkktAM3kkeKS7n-wXvYlozwMOQaZuEzQE_dSMQbNM9wy6ZnGIJRbf1bKVHqg_a1obzPkrfYLUQ1iA_Q2pxZRwXvbGXJq7Gee6cAHBw8gpcGZ8tP9bxMZSJpV4.jpeg	image/jpeg	140810	2013-06-28 16:23:51.064269	f	https://twitter.com/LVIllinois	https://www.facebook.com/lvillinois	\N	\N	Lost Boyz, Inc.
38	2013-06-26 21:49:54.53714	2013-06-28 19:16:06.766138	The Wellness Pros	An organization that provides quality fitness services for individuals with mental and physical disabilities. 	The Mission of the Wellness Pros is to provide quality fitness services for individuals with mental and physical disabilities. The populations we serve include, but are not limited to, those with Down’s syndrome, cerebral palsy, mental retardation, autism, Alzheimer’s and dementia. We also serve those with physical disabilities, including senior citizens, those who are wheelchair bound, blind, deaf and amputees.			fitness@thewellnesspros.org	http://thewellnesspros.org	\N				\N	\N	\N	\N	t			\N	\N	The Wellness Pros
\.


--
-- Data for Name: causes_cause_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY causes_cause_types (id, cause_id, cause_type_id) FROM stdin;
1	9	4
2	9	6
3	9	9
4	16	3
5	2	4
6	37	7
7	37	9
8	20	1
9	20	3
10	20	8
11	20	9
12	38	4
13	36	3
14	35	3
15	35	9
16	34	3
17	23	3
18	22	1
19	22	9
20	21	1
21	21	3
22	19	1
23	19	8
24	17	3
25	15	9
26	14	6
27	13	1
28	13	3
29	13	9
30	11	8
31	10	3
32	10	8
33	10	9
34	8	3
35	8	9
36	7	3
37	7	4
38	6	3
39	6	9
40	4	4
41	4	8
42	3	5
43	1	1
44	1	3
45	1	9
46	1	4
47	19	4
48	17	9
\.


--
-- Name: causes_cause_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('causes_cause_types_id_seq', 48, true);


--
-- Data for Name: causes_causeneeds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY causes_causeneeds (cause_id, cause_need_id) FROM stdin;
\.


--
-- Data for Name: causes_causetypes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY causes_causetypes (id, cause_id, cause_type_id) FROM stdin;
\.


--
-- Name: causes_causetypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('causes_causetypes_id_seq', 1, false);


--
-- Name: causes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('causes_id_seq', 38, true);


--
-- Data for Name: donations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY donations (id, amount, tip, tracking, created_at, updated_at, donations_need_id) FROM stdin;
\.


--
-- Name: donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('donations_id_seq', 1, false);


--
-- Data for Name: featured_causes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY featured_causes (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: featured_causes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('featured_causes_id_seq', 1, false);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: -
--

COPY games (id, level, created_at, updated_at, user_id, show_instructions) FROM stdin;
\.


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('games_id_seq', 1, false);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY locations (id, created_at, updated_at, cause_id, latitude, longitude, name, address_line_one, address_line_two, city, region, postal_code, country) FROM stdin;
\.


--
-- Data for Name: locations_causes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY locations_causes (location_id, cause_id) FROM stdin;
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('locations_id_seq', 1, false);


--
-- Data for Name: name; Type: TABLE DATA; Schema: public; Owner: -
--

COPY name (id, name, needable_id, needable_type, cause_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('name_id_seq', 1, false);


--
-- Data for Name: needs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY needs (id, name, type, cause_id, description, start_date, end_date, address, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, created_at, updated_at, campaign_id) FROM stdin;
17	Lost Boyz Inc. Awareness Campaign	SocialNeed	36	 Help Lost Boyz Inc. to decrease violence and improve the social conditions among the youth in the South Shore community. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:04:45.907108	2013-06-27 22:04:45.907108	\N
18	Go Farther Foundation Awareness Campaign	SocialNeed	17	Help Go Father Foundation spread awareness of the constraints of poverty and the ability to break free and gain experiences that propel them toward their highest aspirations.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:11:55.507174	2013-06-27 22:11:55.507174	\N
19	Go Farther Foundation Fund Raiser	DonationsNeed	17	Farther Foundation continually raises money for our scholarship program and general operating needs. Over 90% of all donations go directly toward our scholarship program that allow deserving students to have life changing experiences.	\N	\N		\N	\N	\N	\N	2013-06-27 22:13:35.139214	2013-06-27 22:13:35.139214	\N
20	Chicago Hopes Awareness Campaign	SocialNeed	10	Help Chicago Hopes for Kids spread awareness about homelessness in Chicago and how children need are effected.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:31:11.410126	2013-06-27 22:31:11.410126	\N
21	Women Divine Awareness Campaign 	SocialNeed	1	Help women Divine to effectively impact the lives of young women through academic enhancement, leadership development, financial literacy and cultural enrichment and spread awareness of their organization.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:38:05.978954	2013-06-27 22:38:05.978954	\N
22	Community Building Tutors Awareness Campaign 	SocialNeed	8	Help Community Building Tutors to strengthen communities through the implementation of innovative after school programming involving elementary school students, high-school students, and working professionals emphasizing civic engagement. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:41:41.78663	2013-06-27 22:41:41.78663	\N
5	Chicago Photography Center Needs Volunteers	VolunteerNeed	22	The Chicago Photography Center needs volunteers to help with administrative tasks , gallery operations, community outreach, public relations and marketing, facility maintenance, graphic design, and volunteer coordination.	\N	\N	3301 N Lincoln Ave Chicago IL 60657			\N	\N	2013-06-27 19:06:58.502615	2013-06-27 19:06:58.502615	\N
6	Asher James Congenital Heart Disease & Thrombosis Awareness Campaign 	SocialNeed	2	Help Asher James Congenital Heart Disease & Thrombosis Foundation spread awareness of health risks of congenital heart disease and thrombosis. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 19:26:01.827568	2013-06-27 19:26:01.827568	\N
4	Chicago Photography Center Awareness Campaign	SocialNeed	22	Help Chicago Photography Center foster a broad community of photographers who practice and appreciate the art of photography. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 15:51:16.988491	2013-06-27 19:41:56.387555	\N
8	Care & Care Fund Raiser	DonationsNeed	9	Care and Care needs donations to operate Healthcare, Educational and Nutritional facilities nationally/internationally and form partnerships with other caregivers and institutions in developing countries to improve the delivery and availability of healthcare services by operating CARE & CARE facilities or co-operate with other entities by providing appropriate medical equipment, expertise and related supplies. To establish nutrition centers for the community to fulfill women, children and elders to overcome malnutrition needs within the community creating healthy communities and healthy productive individuals. To operate Educational Institutions where possible nationally, internationally or creating partnerships and alliances with other institutions to provide direct & educational services. To establish an internet based international community center to disseminate information and knowledge, facilitate communication and promote friendship, good will and to act as a bridge between resources and immediate needs.	\N	\N		\N	\N	\N	\N	2013-06-27 19:45:53.623062	2013-06-27 19:45:53.623062	\N
11	Perspective Charter Schools Fund Raiser	DonationsNeed	37	Help Perspective Charter Schools raise $2 million dollars to subsidize education expenses,which include the cost to recruit and retain the best educators and to cover curriculum costs.	\N	\N		\N	\N	\N	\N	2013-06-27 20:18:33.636914	2013-06-27 20:18:33.636914	\N
12	Do Your P'art Foundation Fund Raiser	DonationsNeed	20	\r\nOur donations directly impact our students partnerships and art collaborations. The donations fund transportation, art materials and any other resources that the teachers may need for a successful project.	\N	\N		\N	\N	\N	\N	2013-06-27 20:28:09.737939	2013-06-27 20:28:09.737939	\N
13	Bright Promises Fund Raiser	DonationsNeed	23	Help Bright Promises raise funds. All donations are distributed in equal shares to the schools in our network. Operating costs are met through an endowment, board gifts, and foundation support.	\N	\N		\N	\N	\N	\N	2013-06-27 21:27:13.123841	2013-06-27 21:27:13.123841	\N
14	Women Divine Fund Raiser	DonationsNeed	1	Help Women Divine raise funds to help their programs. Monetary donations are used to implement the following programs and the coinciding activites that implement each: Future Leaders Executive Management 101 Cultural Exploration Educational Taskforce	\N	\N		\N	\N	\N	\N	2013-06-27 21:34:25.752275	2013-06-27 21:34:25.752275	\N
15	Thyck Troupe Fund Raiser	DonationsNeed	19	Help the Thyck Troupe Organization raise funds towards their cause.Funds are used as production costs to produce performing arts showcases and health/wellness events for the education, empowerment and enjoyment of the general public -- specifically the full-figured demographic.	\N	\N		\N	\N	\N	\N	2013-06-27 21:51:55.904072	2013-06-27 21:51:55.904072	\N
16	Thyck Troupe needs Volunteers	VolunteerNeed	19	Volunteers for our organization can help with specific event duties, including setup/tear down, videography, photography, ticketing, ushering, gift bag distribution, food serving, audiovisual support and multimedia production assistance. Volunteers need to meet with the organization before being assigned to a certain support area.	\N	\N				\N	\N	2013-06-27 22:00:40.376591	2013-06-27 22:00:40.376591	\N
23	In Her Shoes Foundation Awareness Campaign 	SocialNeed	11	Help In Her Shoes to reach out to women of all ages and backgrounds – to share ideas, educate, support and inspire one another, in hopes of creating a positive and healthy lifestyle. It seeks to offer women leadership and empowerment abilities that are required to lead successful lives.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:44:37.098165	2013-06-27 22:44:37.098165	\N
24	Association of Horizon Awareness Campaign 	SocialNeed	7	Help Association of Horizon spread their message. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:50:03.557233	2013-06-27 22:50:03.557233	\N
25	Bright Promise Foundation Awareness Campaign 	SocialNeed	6	Help Bright Promises Foundation creates opportunities for Illinois children to reach their full promise and potential. Help spread their work with organizations that they have developed and delivered programs that provide the foundation for positive lives.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:52:57.295681	2013-06-27 22:52:57.295681	\N
26	Chicago Gateway Green Awareness Campaign	SocialNeed	3	Help spread awareness of Chicago Gateway Green's effort in greening and beautifying Chicago's expressways, gateways, and neighborhoods.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:56:35.874303	2013-06-27 22:56:35.874303	\N
27	Thyck Troupe Awareness Campaign	SocialNeed	19	Help Thyck Troupe promote and encourage diversity in the arts as it applies to reversing societal stigmas and combating media biases of the full-figured artist, proving that talent, beauty and influence should not be limited to size by spreading their message.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:59:18.726423	2013-06-27 22:59:18.726423	\N
28	Literacy Volunteers of Illinois Awareness Campaign	SocialNeed	15	Help Literacy Volunteers of Illinois spread reasons why supporting volunteer literacy programs that help families, adults and out-of-school teens increase their literacy skills are so important.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:01:46.122329	2013-06-27 23:01:46.122329	\N
29	Matanya's Hope Awareness Campaign	SocialNeed	14	Help Matanya’s Hope spread awareness and message of  eradicating poverty is by educating Kenya’s future: the children, as well as providing other life sustaining programs and opportunities is so important. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:04:19.331329	2013-06-27 23:04:19.331329	\N
30	Human Thread Awareness Campaign	SocialNeed	21	Help Human Thread spread their message of a culture of peace, targeting youth through art and educational events/programs. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:08:00.309176	2013-06-27 23:08:00.309176	\N
31	The Miracle Center Awareness Campaign	SocialNeed	13	Help The Miracle Center spread the reasons why helping children, youth, and families particularly through the performing arts to grow spiritually, mentally, emotionally, socially and physically during after-school and out-of- school programs is so important.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:09:49.401913	2013-06-27 23:09:49.401913	\N
32	Dreams for Kids Awareness Campaign	SocialNeed	16	Help Dreams for Kids spread awareness why replacing charity with opportunity for at-risk youth through service, leadership and social activities that inspire them to fearlessly pursue their dreams and compassionately change the world is so important. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:11:46.587338	2013-06-27 23:11:46.587338	\N
33	Do Your P'Art Awareness Campaign	SocialNeed	20	Help Do Your P'Art Foundation spread awareness of how building a bridge of cultural understanding can occur through art.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:14:23.796003	2013-06-27 23:15:05.193737	\N
34	Bright Promises Fund Awareness Campaign	SocialNeed	23	Help Bright Promises Fund spread awareness of why strengthening and sustaining partner Christian schools by generating new sources of revenue so that more families may experience and benefit from urban Christian education is important. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:20:27.19825	2013-06-27 23:20:27.19825	\N
35	ECCYA Awareness Campaign	SocialNeed	35	Help The Empower Community Center for Youth and Adults, (ECCYA) heighten awareness of underprivileged youth and adults in low income communities.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:21:58.067482	2013-06-27 23:21:58.067482	\N
36	The Sports Shed Awareness Campaign	SocialNeed	34	Help The Sports Shed spread their message why helping under-resourced kids opportunities to engage in sports and physical activities has a positive impact on their health, self-esteem, work ethic, and sense of belonging. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:24:15.578268	2013-06-27 23:24:15.578268	\N
10	Care & Care Awareness Campaign	SocialNeed	9	Help Care & Care spread awareness of those who are disadvantaged by poverty, disability and age. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 19:49:20.307343	2013-06-27 23:26:32.854998	\N
37	The Wellness Pros Awareness Campaign 	SocialNeed	38	Help spread the mission of the Wellness Pros,which is to provide quality fitness services for individuals with mental and physical disabilities. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:28:50.540471	2013-06-27 23:28:50.540471	\N
38	Perspective Charter Schools Awareness Campaign	SocialNeed	37	Help Perspective Charter Schools spread their ethical principles of A Disciplined Life®, which prepares students for life in a changing world and helping them further become intellectually reflective, caring and ethical people engaged in a meaningful life.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:31:19.444925	2013-06-27 23:31:19.444925	\N
39	Irving Park Community Food Pantry Awareness Campaign	SocialNeed	4	Help Irving Park Community Food Pantry to increase awareness of hunger related issues to the community at large. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:33:43.666728	2013-06-27 23:34:19.143595	\N
\.


--
-- Name: needs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('needs_id_seq', 39, true);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permissions (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permissions_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20130524154555
20130522213342
20130524151421
20130523143100
20130522213942
20130614165416
20130614165638
20130619161211
20130619163135
20130619224505
20130619230424
20130624132916
20130624165547
20130624181837
20130625175902
20130625180032
20130625180255
20130625180954
20130626213516
20130627184603
20130627201141
20130627210130
\.


--
-- Data for Name: subscribes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY subscribes (id, created_at, updated_at, first_name, last_name, email) FROM stdin;
\.


--
-- Name: subscribes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('subscribes_id_seq', 1, false);


--
-- Data for Name: usercauses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usercauses (id, created_at, updated_at, cause_id, user_id) FROM stdin;
1	2013-06-21 22:35:10.841144	2013-06-21 22:35:10.841144	22	1
2	2013-06-21 23:15:19.39526	2013-06-21 23:15:19.39526	2	1
3	2013-06-27 16:01:44.435264	2013-06-27 16:01:44.435264	7	1
4	2013-06-27 18:55:28.442977	2013-06-27 18:55:28.442977	35	1
5	2013-06-27 18:56:04.868372	2013-06-27 18:56:04.868372	23	1
6	2013-06-28 20:28:29.617356	2013-06-28 20:28:29.617356	36	3
7	2013-06-28 20:48:48.5315	2013-06-28 20:48:48.5315	6	2
\.


--
-- Name: usercauses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('usercauses_id_seq', 7, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, bio, city, state, level, provider, uid, game_id, fb_token, role) FROM stdin;
1	ejanderson4@gmail.com	$2a$10$iB.zPTuKpgEWH2EqgXO0HuljlJLFIzpU5T.xFnob5rzJ.kLcL70N6	\N	\N	\N	5	2013-06-21 22:31:51.352455	2013-06-19 22:42:26.329253	205.178.94.21	38.106.196.126	2013-06-19 22:35:20.412067	2013-06-26 15:59:55.96342	Eddie	Anderson	computers.jpg	image/jpeg	17468	2013-06-26 15:59:55.45712		Chicago	 Illinois	0	facebook	13927884	\N	CAACEMHL6hHQBAIxBq7ZCIpifZBkLNimzTPe4mdXHF0vbfO7J1LG8mqR5kqzWKwc4Qlat64EclaLngjHxQMho9jNZC3DBFGWXXfgnho7igO404cbIZCD8YGZAKNaEZAYYqZAZAgM1gkY7t9lKBqc8L1dL	\N
3	tim@meetmantra.com	$2a$10$mt0ktTgkRZ2ceFsNIFNs0u2RJFf59GGCQ9gvq.wWwYoZeOIcrpf6.	\N	\N	\N	1	2013-06-28 20:28:29.316422	2013-06-28 20:28:29.316422	38.106.196.126	38.106.196.126	2013-06-28 20:28:24.02664	2013-06-28 20:28:29.318366	tim	henry	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N
2	frankv@meetmantra.com	$2a$10$RH.ZPoabgOOoW1WMrZxwpOa5RrjJB2HJxxHnbhpe/qLgMhTGYXlpu	\N	\N	\N	1	2013-06-27 15:29:17.648818	2013-06-27 15:29:17.648818	38.106.196.126	38.106.196.126	2013-06-27 15:29:17.333522	2013-06-28 20:49:11.069703	Francesco	Pinto	frank.jpg	image/jpeg	18961	2013-06-28 20:49:10.804912				0	\N	\N	\N	\N	\N
4	jonathan@meetmantra.com	$2a$10$KXnRy3069lFm6XWg1JNH/OfDfm.AzJTBsmG1jrDsb0f8IydnTx5GO	\N	\N	\N	1	2013-06-30 03:20:25.506731	2013-06-30 03:20:25.506731	99.43.68.108	99.43.68.108	2013-06-30 03:20:25.129856	2013-06-30 03:20:25.508757	Jonathan	Soeder	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N
\.


--
-- Data for Name: users_badges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users_badges (id, user_id, badge_id) FROM stdin;
\.


--
-- Name: users_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_badges_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY volunteers (id, first_name, last_name, phone_number, volunteer_need_id, created_at, updated_at, email) FROM stdin;
\.


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('volunteers_id_seq', 1, false);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: badges_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY badges_users
    ADD CONSTRAINT badges_users_pkey PRIMARY KEY (id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: cause_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cause_applications
    ADD CONSTRAINT cause_applications_pkey PRIMARY KEY (id);


--
-- Name: cause_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cause_types
    ADD CONSTRAINT cause_types_pkey PRIMARY KEY (id);


--
-- Name: causes_cause_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY causes_cause_types
    ADD CONSTRAINT causes_cause_types_pkey PRIMARY KEY (id);


--
-- Name: causes_causetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY causes_causetypes
    ADD CONSTRAINT causes_causetypes_pkey PRIMARY KEY (id);


--
-- Name: causes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY causes
    ADD CONSTRAINT causes_pkey PRIMARY KEY (id);


--
-- Name: donations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (id);


--
-- Name: featured_causes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY featured_causes
    ADD CONSTRAINT featured_causes_pkey PRIMARY KEY (id);


--
-- Name: games_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: name_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY name
    ADD CONSTRAINT name_pkey PRIMARY KEY (id);


--
-- Name: needs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY needs
    ADD CONSTRAINT needs_pkey PRIMARY KEY (id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subscribes
    ADD CONSTRAINT subscribes_pkey PRIMARY KEY (id);


--
-- Name: usercauses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usercauses
    ADD CONSTRAINT usercauses_pkey PRIMARY KEY (id);


--
-- Name: users_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users_badges
    ADD CONSTRAINT users_badges_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_admin_notes_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_admin_notes_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_campaigns_on_active; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaigns_on_active ON campaigns USING btree (active);


--
-- Name: index_campaigns_on_cause_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaigns_on_cause_id ON campaigns USING btree (cause_id);


--
-- Name: index_campaigns_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_campaigns_on_id ON campaigns USING btree (id);


--
-- Name: index_campaigns_on_need_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaigns_on_need_id ON campaigns USING btree (need_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

