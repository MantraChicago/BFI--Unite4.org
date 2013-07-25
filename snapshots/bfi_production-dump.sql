--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
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


ALTER TABLE public.active_admin_comments OWNER TO bfi_production;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO bfi_production;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
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


ALTER TABLE public.admin_users OWNER TO bfi_production;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO bfi_production;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
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


ALTER TABLE public.badges OWNER TO bfi_production;

--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.badges_id_seq OWNER TO bfi_production;

--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE badges_id_seq OWNED BY badges.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    cause_id integer,
    need_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    percent_complete integer,
    active boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type_of_need character varying(255),
    goal_summary character varying(255),
    timefame_description character varying(255),
    desired_state integer DEFAULT 0,
    current_state integer DEFAULT 0
);


ALTER TABLE public.campaigns OWNER TO bfi_production;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaigns_id_seq OWNER TO bfi_production;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: cash_donations; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE cash_donations (
    id integer NOT NULL,
    user_id integer,
    need_id integer,
    cause_id integer,
    amount integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stripe_id character varying(255),
    tip_amount integer
);


ALTER TABLE public.cash_donations OWNER TO bfi_production;

--
-- Name: cash_donations_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE cash_donations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cash_donations_id_seq OWNER TO bfi_production;

--
-- Name: cash_donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE cash_donations_id_seq OWNED BY cash_donations.id;


--
-- Name: cause_applications; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
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


ALTER TABLE public.cause_applications OWNER TO bfi_production;

--
-- Name: cause_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE cause_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cause_applications_id_seq OWNER TO bfi_production;

--
-- Name: cause_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE cause_applications_id_seq OWNED BY cause_applications.id;


--
-- Name: cause_images; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE cause_images (
    id integer NOT NULL,
    cause_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    caption text
);


ALTER TABLE public.cause_images OWNER TO bfi_production;

--
-- Name: cause_images_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE cause_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cause_images_id_seq OWNER TO bfi_production;

--
-- Name: cause_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE cause_images_id_seq OWNED BY cause_images.id;


--
-- Name: cause_types; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE cause_types (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255),
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    slug character varying(255)
);


ALTER TABLE public.cause_types OWNER TO bfi_production;

--
-- Name: cause_types_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE cause_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cause_types_id_seq OWNER TO bfi_production;

--
-- Name: cause_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE cause_types_id_seq OWNED BY cause_types.id;


--
-- Name: causes; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
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
    region character varying(255),
    video_link character varying(255),
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    is_featured boolean DEFAULT false,
    twitter_handle character varying(255),
    facebook_url character varying(255),
    active boolean,
    display_name character varying(255),
    address_line_one character varying(255),
    address_line_two character varying(255),
    postal_code character varying(255),
    country character varying(255),
    locations_count integer DEFAULT 0,
    needs_count integer DEFAULT 0,
    donations_count integer DEFAULT 0,
    volunteers_count integer DEFAULT 0,
    followers_count integer DEFAULT 0,
    slug character varying(255),
    cash_donations_count integer DEFAULT 0,
    goods_donations_count integer DEFAULT 0,
    city_slug character varying(255),
    short_description character varying(255),
    contact_email character varying(255),
    user_id integer
);


ALTER TABLE public.causes OWNER TO bfi_production;

--
-- Name: causes_cause_types; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE causes_cause_types (
    id integer NOT NULL,
    cause_id integer,
    cause_type_id integer
);


ALTER TABLE public.causes_cause_types OWNER TO bfi_production;

--
-- Name: causes_cause_types_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE causes_cause_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.causes_cause_types_id_seq OWNER TO bfi_production;

--
-- Name: causes_cause_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE causes_cause_types_id_seq OWNED BY causes_cause_types.id;


--
-- Name: causes_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE causes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.causes_id_seq OWNER TO bfi_production;

--
-- Name: causes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE causes_id_seq OWNED BY causes.id;


--
-- Name: contributions; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE contributions (
    id integer NOT NULL,
    user_id integer,
    cause_id integer,
    fulfilment_id integer,
    fulfilment_type character varying(255),
    need_id integer,
    need_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fulfillment_type character varying(255),
    fulfillment_id integer
);


ALTER TABLE public.contributions OWNER TO bfi_production;

--
-- Name: contributions_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE contributions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contributions_id_seq OWNER TO bfi_production;

--
-- Name: contributions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE contributions_id_seq OWNED BY contributions.id;


--
-- Name: featured_causes; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE featured_causes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cause_id integer
);


ALTER TABLE public.featured_causes OWNER TO bfi_production;

--
-- Name: featured_causes_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE featured_causes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.featured_causes_id_seq OWNER TO bfi_production;

--
-- Name: featured_causes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE featured_causes_id_seq OWNED BY featured_causes.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE followers (
    id integer NOT NULL,
    cause_id integer,
    user_id integer,
    need_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.followers OWNER TO bfi_production;

--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.followers_id_seq OWNER TO bfi_production;

--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE followers_id_seq OWNED BY followers.id;


--
-- Name: goods_donations; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE goods_donations (
    id integer NOT NULL,
    user_id integer,
    need_id integer,
    cause_id integer,
    description character varying(255),
    quantity integer,
    cash_value integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.goods_donations OWNER TO bfi_production;

--
-- Name: goods_donations_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE goods_donations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goods_donations_id_seq OWNER TO bfi_production;

--
-- Name: goods_donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE goods_donations_id_seq OWNED BY goods_donations.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
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


ALTER TABLE public.locations OWNER TO bfi_production;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO bfi_production;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: needs; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE needs (
    id integer NOT NULL,
    name character varying(255),
    type_of_need character varying(255),
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
    campaign_id integer,
    settings text,
    location_id integer
);


ALTER TABLE public.needs OWNER TO bfi_production;

--
-- Name: needs_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE needs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.needs_id_seq OWNER TO bfi_production;

--
-- Name: needs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE needs_id_seq OWNED BY needs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO bfi_production;

--
-- Name: subscribes; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE subscribes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255)
);


ALTER TABLE public.subscribes OWNER TO bfi_production;

--
-- Name: subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribes_id_seq OWNER TO bfi_production;

--
-- Name: subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE subscribes_id_seq OWNED BY subscribes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
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
    role character varying(255),
    followers_count integer DEFAULT 0,
    cash_donations_count integer DEFAULT 0,
    goods_donations_count integer DEFAULT 0,
    volunteers_count integer DEFAULT 0,
    authentication_token character varying(255),
    cause_admin boolean,
    cause_admin_id integer
);


ALTER TABLE public.users OWNER TO bfi_production;

--
-- Name: users_badges; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE users_badges (
    id integer NOT NULL,
    user_id integer,
    badge_id integer
);


ALTER TABLE public.users_badges OWNER TO bfi_production;

--
-- Name: users_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE users_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_badges_id_seq OWNER TO bfi_production;

--
-- Name: users_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE users_badges_id_seq OWNED BY users_badges.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO bfi_production;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE TABLE volunteers (
    id integer NOT NULL,
    cause_id integer,
    user_id integer,
    need_id integer,
    location_id integer,
    description character varying(255),
    user_showed_up boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.volunteers OWNER TO bfi_production;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: bfi_production
--

CREATE SEQUENCE volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO bfi_production;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bfi_production
--

ALTER SEQUENCE volunteers_id_seq OWNED BY volunteers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY badges ALTER COLUMN id SET DEFAULT nextval('badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY cash_donations ALTER COLUMN id SET DEFAULT nextval('cash_donations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY cause_applications ALTER COLUMN id SET DEFAULT nextval('cause_applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY cause_images ALTER COLUMN id SET DEFAULT nextval('cause_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY cause_types ALTER COLUMN id SET DEFAULT nextval('cause_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY causes ALTER COLUMN id SET DEFAULT nextval('causes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY causes_cause_types ALTER COLUMN id SET DEFAULT nextval('causes_cause_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY contributions ALTER COLUMN id SET DEFAULT nextval('contributions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY featured_causes ALTER COLUMN id SET DEFAULT nextval('featured_causes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY followers ALTER COLUMN id SET DEFAULT nextval('followers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY goods_donations ALTER COLUMN id SET DEFAULT nextval('goods_donations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY needs ALTER COLUMN id SET DEFAULT nextval('needs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY subscribes ALTER COLUMN id SET DEFAULT nextval('subscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY users_badges ALTER COLUMN id SET DEFAULT nextval('users_badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bfi_production
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteers_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY active_admin_comments (id, resource_id, resource_type, author_id, author_type, body, created_at, updated_at, namespace) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
2	nick@meetmantra.com	$2a$10$J8FEFFq/cWezOo2KSap9Neic97aCkMuhBFAWZ.eocGXW2r.E15pWK	\N	\N	\N	0	\N	\N	\N	\N	2013-06-26 19:53:35.639536	2013-06-26 19:53:35.639536
3	jonathan@meetmantra.com	$2a$10$d5FB0JAyVzD4sYEZwmMKEuxWpsimJwm69paHZZSblws8lAcMbVtzq	\N	\N	\N	0	\N	\N	\N	\N	2013-06-26 19:55:26.319327	2013-06-26 19:55:26.319327
4	colleen@meetmantra.com	$2a$10$5jdv9bdlK9QXSdhR0kPW/e/NHEfA7XyGInbjBFYf0Zio8wEmQh.TG	\N	\N	\N	0	\N	\N	\N	\N	2013-06-26 19:57:51.396734	2013-06-26 19:57:51.396734
5	eddie@meetmantra.com	$2a$10$9Ve81Ra0UuXnX.zAKUGbOuCqMACMqIlCwTo0KUw.m5Gy7WiEh1sJS	\N	\N	\N	2	2013-07-23 15:52:42.44331	2013-07-18 16:35:43.820245	38.106.196.126	38.106.196.126	2013-07-18 16:33:02.442016	2013-07-23 17:48:04.701931
6	frank@meetmantra.com	$2a$10$FAQagorfLvOUfpwrTKgo4uwjjhmru8f.NbcTSMMOCUxUdO29sBnf6	\N	\N	2013-07-23 20:23:24.982272	4	2013-07-25 00:34:15.743397	2013-07-25 00:23:28.176812	166.147.104.152	38.106.196.126	2013-07-23 15:53:30.12156	2013-07-25 00:34:15.74417
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('admin_users_id_seq', 6, true);


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY badges (id, name, file_name, accomplishment, description, created_at, updated_at) FROM stdin;
1	Signed Up	signed-up.png	user_signed_up	\N	2013-07-25 02:23:14.624703	2013-07-25 02:23:14.624703
2	Complete Profile	complete-profile.png	completed_profile	\N	2013-07-25 02:23:14.637384	2013-07-25 02:23:14.637384
3	Watch Video	watch-video.png	watched_video	\N	2013-07-25 02:23:14.641412	2013-07-25 02:23:14.641412
4	Share with friends	share-with-friends.png	shared_with_friends	\N	2013-07-25 02:23:14.645185	2013-07-25 02:23:14.645185
\.


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('badges_id_seq', 4, true);


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY campaigns (id, cause_id, need_id, start_date, end_date, percent_complete, active, created_at, updated_at, type_of_need, goal_summary, timefame_description, desired_state, current_state) FROM stdin;
37	39	41	2013-07-24 19:53:37.641113	2013-08-23 19:53:37.641235	0	t	2013-07-24 19:53:37.641802	2013-07-24 19:53:37.641802	followers	\N	\N	0	0
38	40	42	2013-07-24 19:57:09.765139	2013-08-23 19:57:09.76523	0	t	2013-07-24 19:57:09.765499	2013-07-24 19:57:09.765499	followers	\N	\N	0	0
39	41	43	2013-07-24 20:02:14.960993	2013-08-23 20:02:14.961075	0	t	2013-07-24 20:02:14.961334	2013-07-24 20:02:14.961334	followers	\N	\N	0	0
40	42	44	2013-07-24 20:08:30.198926	2013-08-23 20:08:30.199007	0	t	2013-07-24 20:08:30.199302	2013-07-24 20:08:30.199302	followers	\N	\N	0	0
41	43	45	2013-07-24 20:14:39.129887	2013-08-23 20:14:39.13003	0	t	2013-07-24 20:14:39.130455	2013-07-24 20:14:39.130455	followers	\N	\N	0	0
42	44	46	2013-07-24 20:18:24.874055	2013-08-23 20:18:24.874185	0	t	2013-07-24 20:18:24.874481	2013-07-24 20:18:24.874481	followers	\N	\N	0	0
43	45	47	2013-07-24 20:22:47.21353	2013-08-23 20:22:47.213652	0	t	2013-07-24 20:22:47.21418	2013-07-24 20:22:47.21418	followers	\N	\N	0	0
44	46	48	2013-07-24 20:50:06.185647	2013-08-23 20:50:06.185869	0	t	2013-07-24 20:50:06.186915	2013-07-24 20:50:06.186915	followers	\N	\N	0	0
45	47	49	2013-07-24 20:53:21.760512	2013-08-23 20:53:21.760613	0	t	2013-07-24 20:53:21.760885	2013-07-24 20:53:21.760885	followers	\N	\N	0	0
46	48	50	2013-07-24 20:57:57.046337	2013-08-23 20:57:57.046429	0	t	2013-07-24 20:57:57.04671	2013-07-24 20:57:57.04671	followers	\N	\N	0	0
48	50	52	2013-07-24 21:07:38.017839	2013-08-23 21:07:38.017961	0	t	2013-07-24 21:07:38.018512	2013-07-24 21:07:38.018512	followers	\N	\N	0	0
49	52	53	2013-07-24 21:11:46.97286	2013-08-23 21:11:46.973025	0	t	2013-07-24 21:11:46.973582	2013-07-24 21:11:46.973582	followers	\N	\N	0	0
50	53	54	2013-07-24 21:15:40.433728	2013-08-23 21:15:40.43386	0	t	2013-07-24 21:15:40.434461	2013-07-24 21:15:40.434461	followers	\N	\N	0	0
51	54	55	2013-07-24 21:21:34.697279	2013-08-23 21:21:34.697368	0	t	2013-07-24 21:21:34.697693	2013-07-24 21:21:34.697693	followers	\N	\N	0	0
52	55	56	2013-07-24 21:24:36.717373	2013-08-23 21:24:36.717503	0	t	2013-07-24 21:24:36.717773	2013-07-24 21:24:36.717773	followers	\N	\N	0	0
53	56	57	2013-07-24 21:28:38.041096	2013-08-23 21:28:38.041182	0	t	2013-07-24 21:28:38.041487	2013-07-24 21:28:38.041487	followers	\N	\N	0	0
4	22	4	2013-07-22 23:11:20.114124	2013-08-21 23:11:20.114445	0	t	2013-06-27 19:07:14.766899	2013-07-22 23:11:20.114911	followers	\N	\N	0	0
6	9	8	2013-07-22 23:11:20.118001	2013-08-21 23:11:20.118197	0	t	2013-06-27 19:46:14.022951	2013-07-22 23:11:20.118546	cash_donations	\N	\N	0	0
7	9	10	2013-07-22 23:11:20.121376	2013-08-21 23:11:20.121589	0	t	2013-06-27 19:50:32.34023	2013-07-22 23:11:20.121957	followers	\N	\N	0	0
8	37	11	2013-07-22 23:11:20.124762	2013-08-21 23:11:20.124966	0	t	2013-06-27 20:18:50.492002	2013-07-22 23:11:20.125331	cash_donations	\N	\N	0	0
9	20	12	2013-07-22 23:11:20.128136	2013-08-21 23:11:20.128344	0	t	2013-06-27 20:28:26.408243	2013-07-22 23:11:20.128723	cash_donations	\N	\N	0	0
10	23	13	2013-07-22 23:11:20.131513	2013-08-21 23:11:20.131717	0	t	2013-06-27 21:27:30.772073	2013-07-22 23:11:20.132073	cash_donations	\N	\N	0	0
11	1	14	2013-07-22 23:11:20.134897	2013-08-21 23:11:20.135094	0	t	2013-06-27 21:40:23.981419	2013-07-22 23:11:20.135484	cash_donations	\N	\N	0	0
12	19	15	2013-07-22 23:11:20.138265	2013-08-21 23:11:20.13846	0	t	2013-06-27 21:52:17.362016	2013-07-22 23:11:20.138808	cash_donations	\N	\N	0	0
13	19	16	2013-07-22 23:11:20.141531	2013-08-21 23:11:20.141729	0	t	2013-06-27 22:00:53.8454	2013-07-22 23:11:20.142081	volunteers	\N	\N	0	0
14	36	17	2013-07-22 23:11:20.144835	2013-08-21 23:11:20.145031	0	t	2013-06-27 22:07:10.830968	2013-07-22 23:11:20.14538	followers	\N	\N	0	0
15	17	18	2013-07-22 23:11:20.148058	2013-08-21 23:11:20.148253	0	t	2013-06-27 22:12:21.991599	2013-07-22 23:11:20.148609	followers	\N	\N	0	0
16	17	19	2013-07-22 23:11:20.151254	2013-08-21 23:11:20.15145	0	t	2013-06-27 22:13:50.039158	2013-07-22 23:11:20.151796	cash_donations	\N	\N	0	0
17	10	20	2013-07-22 23:11:20.154417	2013-08-21 23:11:20.154638	0	t	2013-06-27 22:31:30.816631	2013-07-22 23:11:20.154997	followers	\N	\N	0	0
18	1	21	2013-07-22 23:11:20.157671	2013-08-21 23:11:20.157864	0	t	2013-06-27 22:38:26.01898	2013-07-22 23:11:20.158245	followers	\N	\N	0	0
19	8	22	2013-07-22 23:11:20.160932	2013-08-21 23:11:20.161123	0	t	2013-06-27 22:42:03.414109	2013-07-22 23:11:20.161469	followers	\N	\N	0	0
20	11	23	2013-07-22 23:11:20.164211	2013-08-21 23:11:20.164405	0	t	2013-06-27 22:44:53.23073	2013-07-22 23:11:20.164769	followers	\N	\N	0	0
21	7	24	2013-07-22 23:11:20.167429	2013-08-21 23:11:20.167622	0	t	2013-06-27 22:50:31.568322	2013-07-22 23:11:20.167976	followers	\N	\N	0	0
22	6	25	2013-07-22 23:11:20.170653	2013-08-21 23:11:20.170847	0	t	2013-06-27 22:53:15.716397	2013-07-22 23:11:20.171232	followers	\N	\N	0	0
23	3	26	2013-07-22 23:11:20.173866	2013-08-21 23:11:20.174096	0	t	2013-06-27 22:56:49.317229	2013-07-22 23:11:20.174442	followers	\N	\N	0	0
24	19	27	2013-07-22 23:11:20.177221	2013-08-21 23:11:20.177421	0	t	2013-06-27 23:00:01.055784	2013-07-22 23:11:20.177773	followers	\N	\N	0	0
25	15	28	2013-07-22 23:11:20.180472	2013-08-21 23:11:20.180684	0	t	2013-06-27 23:01:59.286965	2013-07-22 23:11:20.181039	followers	\N	\N	0	0
26	14	29	2013-07-22 23:11:20.183834	2013-08-21 23:11:20.184032	0	t	2013-06-27 23:04:33.768213	2013-07-22 23:11:20.184467	followers	\N	\N	0	0
27	21	30	2013-07-22 23:11:20.187189	2013-08-21 23:11:20.187391	0	t	2013-06-27 23:08:12.944473	2013-07-22 23:11:20.187739	followers	\N	\N	0	0
28	13	31	2013-07-22 23:11:20.190363	2013-08-21 23:11:20.190554	0	t	2013-06-27 23:10:00.132481	2013-07-22 23:11:20.190894	followers	\N	\N	0	0
29	16	32	2013-07-22 23:11:20.193617	2013-08-21 23:11:20.19381	0	t	2013-06-27 23:11:57.315762	2013-07-22 23:11:20.194147	followers	\N	\N	0	0
30	20	33	2013-07-22 23:11:20.196776	2013-08-21 23:11:20.196965	0	t	2013-06-27 23:15:17.658623	2013-07-22 23:11:20.197308	followers	\N	\N	0	0
31	23	34	2013-07-22 23:11:20.19995	2013-08-21 23:11:20.200143	0	t	2013-06-27 23:20:37.263045	2013-07-22 23:11:20.200487	followers	\N	\N	0	0
32	35	35	2013-07-22 23:11:20.203284	2013-08-21 23:11:20.203479	0	t	2013-06-27 23:22:09.881264	2013-07-22 23:11:20.203823	followers	\N	\N	0	0
33	34	36	2013-07-22 23:11:20.206459	2013-08-21 23:11:20.206651	0	t	2013-06-27 23:24:35.023632	2013-07-22 23:11:20.206995	followers	\N	\N	0	0
34	38	37	2013-07-22 23:11:20.209649	2013-08-21 23:11:20.209841	0	t	2013-06-27 23:29:00.874403	2013-07-22 23:11:20.210183	followers	\N	\N	0	0
35	37	38	2013-07-22 23:11:20.212876	2013-08-21 23:11:20.213066	0	t	2013-06-27 23:31:30.633095	2013-07-22 23:11:20.213429	followers	\N	\N	0	0
36	4	39	2013-07-22 23:11:20.216142	2013-08-21 23:11:20.216331	0	t	2013-06-27 23:34:28.221145	2013-07-22 23:11:20.216687	followers	\N	\N	0	0
5	2	6	2013-07-22 23:11:19.99603	2013-08-21 23:11:19.996593	0	t	2013-06-27 19:26:23.331863	2013-07-22 23:11:20.046668	followers	\N	\N	0	0
54	57	58	2013-07-24 21:32:33.856098	2013-08-23 21:32:33.856254	0	t	2013-07-24 21:32:33.856636	2013-07-24 21:32:33.856636	followers	\N	\N	0	0
55	58	59	2013-07-24 21:36:09.490393	2013-08-23 21:36:09.490547	0	t	2013-07-24 21:36:09.491102	2013-07-24 21:36:09.491102	followers	\N	\N	0	0
56	59	60	2013-07-24 21:42:19.193408	2013-08-23 21:42:19.193506	0	t	2013-07-24 21:42:19.19385	2013-07-24 21:42:19.19385	followers	\N	\N	0	0
57	60	61	2013-07-24 21:47:49.66413	2013-08-23 21:47:49.664232	0	t	2013-07-24 21:47:49.664529	2013-07-24 21:47:49.664529	followers	\N	\N	0	0
58	61	62	2013-07-24 21:54:28.474905	2013-08-23 21:54:28.475024	0	t	2013-07-24 21:54:28.475619	2013-07-24 21:54:28.475619	followers	\N	\N	0	0
59	62	63	2013-07-24 22:03:35.695965	2013-08-23 22:03:35.696078	0	t	2013-07-24 22:03:35.696612	2013-07-24 22:03:35.696612	followers	\N	\N	0	0
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('campaigns_id_seq', 59, true);


--
-- Data for Name: cash_donations; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY cash_donations (id, user_id, need_id, cause_id, amount, created_at, updated_at, stripe_id, tip_amount) FROM stdin;
2	32	15	19	120	2013-07-23 20:11:59.923831	2013-07-23 20:11:59.923831	tok_2FhXl4WThJqleV	5
3	32	15	19	120	2013-07-23 20:12:48.826003	2013-07-23 20:12:48.826003	tok_2FhYCCMVSsWfAC	5
6	1	15	19	20	2013-07-23 22:52:57.990579	2013-07-23 22:52:57.990579	tok_2Fk8Sl0zusxXeL	5
7	1	15	19	20	2013-07-23 23:39:15.852855	2013-07-23 23:39:15.852855	tok_2FksWT7QInSMFy	5
8	34	15	19	20	2013-07-24 12:41:01.611653	2013-07-24 12:41:01.611653	tok_2FxUiZagini6UB	5
9	1	15	19	12	2013-07-24 18:04:50.105839	2013-07-24 18:04:50.105839	tok_2G2iQp2Ck6zTzr	5
\.


--
-- Name: cash_donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('cash_donations_id_seq', 9, true);


--
-- Data for Name: cause_applications; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY cause_applications (id, name, org_name, website, email, phone_number, mission, how_hear) FROM stdin;
1	Maribeth Joy	CircEsteem	https://www.facebook.com/pages/CircEsteem/349812888376467	info@CircEsteem.org	312-731-3568	CircEsteem's mission is to unite youth from diverse racial, cultural and economic backgrounds and build self esteem and mutual respect through the practice and performance of circus arts.	Building self esteem through circus arts.
\.


--
-- Name: cause_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('cause_applications_id_seq', 1, true);


--
-- Data for Name: cause_images; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY cause_images (id, cause_id, created_at, updated_at, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, caption) FROM stdin;
\.


--
-- Name: cause_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('cause_images_id_seq', 1, false);


--
-- Data for Name: cause_types; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY cause_types (id, created_at, updated_at, name, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, slug) FROM stdin;
9	2013-06-26 22:14:17.593247	2013-07-06 22:18:25.923356	Education	education_front.jpg	image/jpeg	15144	2013-06-27 21:01:38.295349	education
8	2013-06-26 22:13:59.25435	2013-07-06 22:18:25.934939	Social Equality	01k-may-day-cairo-egypt-social-equlaity.jpg	image/jpeg	116054	2013-06-27 21:02:14.625894	social-equality
6	2013-06-26 22:13:09.088478	2013-07-06 22:18:25.944128	Global Outreach	0e744541_global-prayer-gathering-285-by-200.gif	image/gif	40185	2013-06-27 21:03:06.493722	global-outreach
5	2013-06-26 22:12:47.165774	2013-07-06 22:18:25.948251	Environmental 	Environmental.jpg	image/jpeg	19591	2013-06-27 21:03:22.175064	environmental
4	2013-06-26 22:12:28.369818	2013-07-06 22:18:25.95239	Health & Wellness	health-and-wellness.jpg	image/jpeg	382640	2013-06-27 21:03:41.235626	health-wellness
3	2013-06-26 22:12:09.855435	2013-07-06 22:18:25.956409	Youth	YouthProgramming.jpg	image/jpeg	56101	2013-06-27 21:04:06.284554	youth
2	2013-06-26 22:11:54.027773	2013-07-06 22:18:25.960477	Animal Welfare	images.jpeg	image/jpeg	9071	2013-06-27 21:04:23.451298	animal-welfare
1	2013-06-26 22:11:34.187573	2013-07-06 22:18:25.964486	Arts	Performance_art.JPG	image/jpeg	196898	2013-06-27 21:04:39.535733	arts
7	2013-06-26 22:13:23.125476	2013-07-18 15:08:43.311923	Hunger	temple_sunset1.jpg	image/jpeg	22938	2013-06-27 21:02:42.144849	hunger
\.


--
-- Name: cause_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('cause_types_id_seq', 9, true);


--
-- Data for Name: causes; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY causes (id, created_at, updated_at, name, description, mission_statement, how_hear, phone_number, email, website, cause_type_id, city, region, video_link, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, is_featured, twitter_handle, facebook_url, active, display_name, address_line_one, address_line_two, postal_code, country, locations_count, needs_count, donations_count, volunteers_count, followers_count, slug, cash_donations_count, goods_donations_count, city_slug, short_description, contact_email, user_id) FROM stdin;
17	2013-06-18 23:01:45.486017	2013-07-25 01:47:15.316549	Go Farther Foundation	\r\nFarther Foundation was formed to help students break free from the constraints of poverty and gain experiences that propel them toward their highest aspirations. They provide opportunities for eager and deserving students to travel worldwide and interact with individuals who have diverse backgrounds and experiences.  Students participate in programs where they are immersed in new cultures and experiences, learn and develop skills, provide community service, cultivate leadership potential and attain personal growth.\r\n\r\nWhen participating in the Farther Foundation, students and families gain experience in program and financial aid exploration and application processes.They also become comfortable with the experience of being out of the home for an extended period and learn to cooperate, compete and succeed in new environments with unfamiliar surroundings and diverse populations of other students. Students also acknowledge the expectations regarding their educational and life opportunities.\r\n	Farther Foundation was formed to help students break free from the constraints of poverty and gain experiences that propel them toward their highest aspirations.	Farther Foundation is a charitable scholarship organization that helps students take a bold step beyond the familiar.	708-497-7240	gofarther@fartherfoundation.org	http://www.fartherfoundation.org	9	Oak Park	Illinois	http://www.youtube.com/embed/OCq5mP53CTI	go_farther.jpg	image/jpeg	292473	2013-07-08 02:39:43.631389	t	https://twitter.com/FartherFdn		t	Go Farther Foundation	\N	\N	\N	\N	1	0	0	0	12	go-farther-foundation	0	0	chicago	Farther Foundation is a charitable scholarship organization that helps students take a bold step beyond the familiar.	\N	\N
37	2013-06-25 17:06:51.905855	2013-07-25 01:52:19.849263	Perspective Charter Schools	Perspectives was launched in 1993 by two Chicago Public School teachers who believed that character development and academic achievement are interrelated.  They created a curriculum called A Disciplined Life and started a “school within a school” at Dyett Middle School on Chicago’s South Side.  In 1997, Perspectives Charter Schools became one of the first charter schools in Illinois. By 2004, Perspectives had attracted enough attention and supporters to move into an award-winning new building designed by Perkins + Will, now known as Perspectives Rodney D. Joslin Campus.\r\n\r\nIn 2005, after 8 years of steady expansion of enrollment and with Joslin students reaching ever higher rates of academic growth each year, Perspectives was persuaded by Mayor Richard J. Daley, then-CEO of Chicago Public Schools Arne Duncan and the Greater Auburn-Gresham Development Corporation to assume management of a 350,000 square foot former high school campus at 81st and May serving the Auburn Gresham community.  Perspectives opened three schools:  Perspectives Middle Academy, Perspectives Leadership Academy, and Perspectives High School of Technology.  With their first graduating classes in 2010, these schools more than doubled the graduation rate of the high school that had previously served the community.\r\n\r\nAs the transformation in Auburn Gresham was just beginning, Perspectives partnered with the Illinois Institute of Technology to open Perspectives/IIT Math & Science Academy in 2008.  In the spring of 2012, this school celebrated its first graduating class, with 95% of graduates going on to college.\r\n\r\nToday, Perspectives Charter Schools  serves nearly 2,300 students in grades six through twelve at five open-enrollment, tuition-free public schools.	Perspectives Charter Schools manages 5 open enrollment, tuition-free public schools serving 2,300 students in grades 6-12 in the communities of Auburn Gresham, Grand Boulevard and the South Loop. We are committed to providing top quality education in urban public schools.  Our goal is to ensure that our students graduate from Perspectives prepared to succeed in college and in life.\r\n	All Perspectives Charter Schools provide students with a rigorous and relevant education helping them become caring and ethical people engaged in a meaningful life.	312-604-2200	dterry@pcsedu.org	http://www.perspectivescs.org/	9	Chicago	Illinois	http://www.youtube.com/embed/LLi4sqhEbYI	EhFjXxhzG8-aQzmDLHO4-JEsyunEE1r78I0hR_7GfPA_os_l_79sHCoYcnhEnJKObf8O8skORe6hcGQVDKxQhTQ_sINB170JKbiq7cCYYTRwQinctXMXYUCfq-XZ9vyDaC8.jpeg	image/jpeg	192884	2013-06-28 16:28:03.256048	t	https://twitter.com/pcsedu	https://www.facebook.com/perspectivescs	t	Perspective Charter Schools	\N	\N	\N	\N	1	0	0	0	11	perspective-charter-schools	0	0	chicago	All Perspectives Charter Schools provide students with a rigorous and relevant education helping them become caring and ethical people engaged in a meaningful life.	\N	\N
11	2013-06-18 22:42:43.680451	2013-07-25 01:59:31.282208	In Her Shoes Foundation	In Her Shoes Chicago began as the Positive Girls Club in 2008 for women of all ages who were determined to make positive changes in their lives. Small gatherings were held where women came together to share positive thoughts, provide inspiration to each other and share self-improvement opportunities. The group began to slowly grow and gain momentum as a forum for women to build strong individual and community relationships and became a strong professional resource in the Chicago-land area.\r\n\r\nIn 2010 the name was changed to In Her Shoes Chicago and plans were put into place to formalize the group through incorporation as a not-for-profit organization. A kick-off event was held to introduce the new structure and provide the opportunity for women to learn about future plans and direction of the group. Additionally, an initial Board of Directors was put together and a 2011 programming plan was developed. This plan included regular monthly workshops, social and community events, meetings and a yearly conference.\r\n \r\nIn late 2011, In Her Shoes Chicago changed their name to In Her Shoes Foundation and expanded internationally. In Her Shoes Foundation continues to provide opportunities for women to share ideas, and support, inspire, educate, and connect the development and maintenance of a healthy and positive life style.	The mission of In Her Shoes Foundation is to reach out to women of all ages and backgrounds – to share ideas, educate, support and inspire one another, in hopes of creating a positive and healthy lifestyle. It seeks to offer women leadership and empowerment abilities that are required to lead successful lives.\r\n	In Her Shoes Foundation™ brings together women of all ages and backgrounds to inspire, connect, educate and support the development and maintenance of a healthy and positive lifestyle.	847-867-9585	info@inhershoesfoundation.org	http://inhershoesfoundation.org	8	Niles	Illinois	http://www.youtube.com/embed/1gx6ObJFQm0	InHerShoes.jpg	image/jpeg	200488	2013-07-08 03:01:35.669804	t		https://www.facebook.com/inhershoesfoundation	t	In Her Shoes Foundation	\N	\N	\N	\N	1	0	0	0	11	in-her-shoes-foundation	0	0	chicago	In Her Shoes Foundation brings together women of all ages and backgrounds to inspire, connect, educate and support the development and maintenance of a healthy and positive lifestyle.	\N	\N
45	2013-07-24 20:22:46.503508	2013-07-24 22:40:19.658646	Angels of Praise Productions, Inc.	AOP Productions, encourages individuals to "Speak through Movement" by instead of violence and crime.  AOP members experience high level of arts enrichment, physical and social development and higher academic performance.   	\r\nAOP Productions mission is to train, nurture and inspire individuals through the teaching of performing arts combined with spiritual arts.  Giving our youth an outlet from violence and crime by demonstrating positive expressions through training and development of artistic talents to encourage healthy and inspiring life styles as well as enhancing and developing youth, teens and young adults physical and social development.\r\n	Inspiring Through Performing Arts	(708) 634-2192	angelsofpraise@angelsofpraiseproductions.org	www.angelsofpraiseproductions.org	\N	Chicago	Illinois		526531_625113557514094_1088772437_n.jpg	image/jpeg	101979	2013-07-24 20:22:46.0611	f		https://www.facebook.com/AOPProductions	t	Angels of Praise Productions, Inc.	\N	\N	\N	\N	1	0	0	0	0	angels-of-praise-productions-inc	0	0	chicago	Inspire, nurture, encourage and educate youth to reach their highest potential through the teaching of performing arts combined with spiritual arts.  	\N	\N
36	2013-06-25 17:00:02.729233	2013-07-25 01:53:03.281234	Lost Boyz, Inc.	We uniquely stand as an organization focused on the empowerment of low-income people and community redevelopment by attacking our problems together as an entity and focusing on our youth and their preparedness to lead us into the future.\r\n\r\nDuring the spring, participants transition to 8 weeks of outdoor training, service hours, and community planning. For the summer each team plays approximately 30 games in competitive play and faces teams from the Chicagoland Youth Baseball Alliance, a league composed of leagues around the state. All teams will make the playoffs, which is a three round, best-of, round-robin tournament. Also included is the CYBA All-Star Game where the best players from different leagues face off for bragging rights.\r\n\r\nThe teams are made up of two divisions: Youth Baseball Program for ages 9-17 and Young Successful Leaders Summer Program for ages 14+.	 Lost Boyz Inc.'s mission is to decrease violence and improve the social conditions among the youth in the South Shore community. Our mission is achieved by providing quality athletic and leadership training, re-entry assistance, and innovative ideas geared for at-risk youth to align income and entrepreneurial opportunities.\r\n	Lost Boyz Inc. is a non-for-profit community organization with a common interest of community development in disadvantaged neighborhoods.	773-245-6804	LStewart@LostBoyzInc.org	http://www.lostboyzinc.org	3	Chicago	Illinois	http://www.youtube.com/embed/HnbVwlOqmjs	1Y1BNcrWTFLkktAM3kkeKS7n-wXvYlozwMOQaZuEzQE_dSMQbNM9wy6ZnGIJRbf1bKVHqg_a1obzPkrfYLUQ1iA_Q2pxZRwXvbGXJq7Gee6cAHBw8gpcGZ8tP9bxMZSJpV4.jpeg	image/jpeg	140810	2013-06-28 16:23:51.064269	f	https://twitter.com/LVIllinois	https://www.facebook.com/lvillinois	t	Lost Boyz, Inc.	\N	\N	\N	\N	1	0	0	0	13	lost-boyz-inc	0	0	chicago	 Lost Boyz Inc.'s mission is to decrease violence and improve the social conditions among the youth in the South Shore community.	\N	\N
23	2013-06-18 23:13:01.265529	2013-07-25 01:54:16.416784	Bright Promises Fund	In the mid-90`s, several visionaries pictured a fund that would provide financial resources for urban Christian schools, particularly those which - once in financial crisis mode - are now ready to move from viability to sustainability. These people of vision dreamed and prayed. In 2010 they saw their dreams materialize in the formation of Bright Promise Fund for Urban Christian Education, a registered 501(c)(3), nonprofit charitable organization. Bright Promises Fund enriches Chicago and its neighborhoods through schools of character, conviction and achievement by providing new and sustaining sources of revenue for affiliated Christian schools.\r\n\r\nBright Promise Fund aims to:\r\n-enrich the life of Chicago and the communities served by partner schools through excellent Christian education.\r\n-increasingly broaden and deepen a donor base of support by identifying new donors from within the Chicago business, corporate, church and foundation communities.\r\n-extend the reach of Bright Promise Fund, so that former Chicagoans or those with a heart for urban Christian education nationally and globally become sustaining donors.\r\n-increase the number of partner schools in Chicago.\r\n-enhance the marketing effort of all partner schools through collaborative technologies.\r\n-partner with similar organizations in Chicago and the nation so that urban Christian education is strengthened.\r\n-be a voice for school choice and educational justice.	To strengthen and sustain partner Christian schools by generating new sources of revenue so that more families may experience and benefit from urban Christian education.	An organization aimed to strengthen and sustain Christian schools.		info@brightpromisefund.org	http://www.brightpromisefund.org	3	Chicago	Illinois	http://www.youtube.com/embed/AzKljZN_myo	BrightPromisesFund.jpg	image/jpeg	252181	2013-07-08 02:43:59.80077	t	https://twitter.com/Brightfund	https://www.facebook.com/BrightPromiseFund	t	Bright Promises Fund	\N	\N	\N	\N	1	0	0	0	11	bright-promises-fund	0	0	chicago	An organization aimed to strengthen and sustain Christian schools.	\N	\N
20	2013-06-18 23:09:11.044414	2013-07-25 01:55:46.767355	Do Your P'Art Foundation	At Do Your P'Art, we strive to bring young people from a variety of cultural and socioeconomic backgrounds together. Since it’s inception in 1996, Do Your P’Art, has: Involved 7000+ culturally diverse children aged 10-18 in collaborative, curriculum based art projects Exposed thousands of additional children, teachers and parents in 26 schools to activities that enable them to have a glimpse of the bigger world around them Developed a community-supported program dedicated to creating a world where all people are appreciated for their uniqueness. Partnered with the following institutions in the combined effort to expose kids to different cultures and enrich their school education at the same time:\r\n\r\nTruman College\r\nAmerican Indian Center\r\nChicago Historical Society\r\nField Museum\r\nGees Bend Quilters\r\nIllinois Institute of Technology\r\nChicago Park District\r\nChicago Architecture Foundation\r\nShedd Aquarium\r\nWendella Cruises\r\n \r\n\r\nDo Your P'Art has grown from supporting a single collaboration to supporting up to 17 collaborations, involving up to 1600 students in one year.  We are continuing to grow our program to involve more classrooms and more schools in the Chicagoland area. \r\n	Our programs are designed to provide a positive experience where students work collaboratively on a project.   We define our projects such that the theme is appropriate for all, allowing the participants to find common ground and work together on their solution. 	Do Your P'Art Foundation brings young people together from various cultural and socio-economic backgrounds through artistic collaboration	847-441-7195	info@doyourpartfoundation.org	http://doyourpartfoundation.org	9	Winnetka	Illinois	http://www.youtube.com/embed/pxaNfXUvLqM	LHzYSL8IPcIOpM1EY8RY4IKYXFuXJv27oyN-CVu38DI_qnZ2j5Y9ftZK-JCqNUz8dxD5QcKsBhr2MRQhYQpI_XQ_ibFLFCXehXLIMpXlzuQUR04vTp2D2oYtGeXPDlCIuQg_FDnqtGOoJtSYlA1vajz6DxN5NSb0zvoTWMyZ8rwbbn0.jpeg	image/jpeg	271799	2013-06-28 16:31:01.315455	t	https://twitter.com/doyourpart96	https://www.facebook.com/DoYourPartFoundation?ref=ts	t	Do Your P'Art Foundation	\N	\N	\N	\N	1	0	0	0	10	do-your-p-art-foundation	0	0	chicago	Do Your P'Art Foundation brings young people together from various cultural and socio-economic backgrounds through artistic collaboration	\N	\N
19	2013-06-18 23:07:48.330566	2013-07-25 01:56:18.345507	Thyck Troupe Organization	Founder, Tressa Thomas, transitioned the ThYck Troupe from a "modeling interest club" into a 501(c)3 organization, where plus size women could not only pursue modeling careers, but partake in expanded training and development courses, health & wellness workshops, confidence-building seminars and even have their talents showcased for the general public in a variety of venues across the country. \r\n\r\nInitially, there was a Meetup Group formed to find like-minded plus size models that wanted to make their own modeling opportunities in the City of Chicago and the surrounding areas. From there, the “ThYck Troupe” was pitched to members that wanted to branch out and form a “modeling troupe”. A Model Call was held in April of 2010, resulting in 14 models being recruited for  the very first “ThYck Troupe of Chicago” modeling troupe.\r\n\r\nThrough this organization, multiple artistic showcases occur each year, with all communities invited to partake in the festivities for the public good. There is no age limit, and it is both ethnically & socioeconomically diverse.	"We exist to promote and encourage diversity in the arts as it applies to reversing societal stigmas and combating media biases of the full-figured artist.... Talent, beauty and influence should not be limited to size ..."	Nonprofit that trains, mentors, inspires and empowers curvaceous women pursuing professional careers in the arts.	847-582-0555	info@thycktroupe.org	http://www.thycktroupechicago.com	8	Libertyville	Illinois	http://www.youtube.com/embed/njPDt2W_gwc	Thyck.jpg	image/jpeg	184902	2013-07-08 01:41:55.030193	t	https://twitter.com/thycktroupe	https://www.facebook.com/thycktroupe	t	Thyck Troupe Organization	\N	\N	\N	\N	1	0	0	9	15	thyck-troupe-organization	6	10	chicago	Nonprofit that trains, mentors, inspires and empowers curvaceous women pursuing professional careers in the arts.	\N	\N
10	2013-06-18 22:41:38.336665	2013-07-25 02:01:02.507488	Chicago Hopes for Kids	Chicago HOPES, founded in 2006, is a volunteer-based tutoring, homework help, and arts enrichment program for CPS students living in homeless shelters.  Chicago HOPES provides after-school homework help, skills building, and enrichment programming to Chicago Public Schools students living in homeless shelters. We provide a safe, welcoming space, materials, and committed, caring adults whose purpose is to empower our children to succeed academically. This support serves to help our students overcome the negative effects homelessness can have on their education. \r\n\r\nUnstable housing situations can affect a student's ability to succeed academically. Chicago HOPES intervenes with academic support and caring, committed volunteers. \r\nAn uncertain home situation, new school, the trauma of moving -- all can make learning more difficult for the typical student. Through no fault of their own students living in shelters, as unaccompanied youth, or doubled-up with relatives or family friends (doubled-up students also qualify as homeless) face significant barriers to academic development. Even the most talented student will have trouble without a routine spot to do homework, or a home to invite school friends, or in a new classroom in the middle of March. \r\n\r\nEach day at the HOPES program in shelters we see students deal with these challenges -- and witness the resilience, smiles, smarts, and energy they possess, like any child does. Numerous studies offer empirical evidence of the effect on homelessness on education.	Chicago HOPES for Kids We are a shelter based after-school and summer tutoring and enrichment program that, with the help of caring volunteers, strives to help children staying in shelters succeed academically in order to ameliorate the negative effects of homelessness on their lives.	Chicago HOPES is a volunteer-based tutoring, homework help, and arts enrichment program for CPS students living in homeless shelters. 	224-545-4482	chicagohopesforkids@gmail.com	http://www.chicagohopes.org	9	Chicago 	Illinois	http://www.youtube.com/embed/bdQ0v4e7fGw	o-vSBR1zjVjIUI2LBYD1_NwtYGvSwgRP_niuThE76gs_ls8HkFnZBh-lkJt0vA5n2V-0TIy1JI5Fsd1ytrnhbgs_ORD96Syj6OE7kLwB7BW4IDM853p-NCQMa7m4FEPfohE_wOf9xGHen_sde0pXliCL7sNBBNNXE2STg1UUMkb9RFg_Rv8LOTjfm6Q4IVUa4uCpdQjoCKQz-x3J1yXFJvu9jVw.jpeg	image/jpeg	156886	2013-06-28 16:13:06.539623	t	https://twitter.com/Chicago_HOPES	https://www.facebook.com/chicagohopes	t	Chicago Hopes	\N	\N	\N	\N	1	0	0	0	11	chicago-hopes-for-kids	0	0	chicago	Chicago HOPES is a volunteer-based tutoring, homework help, and arts enrichment program for CPS students living in homeless shelters. 	\N	\N
34	2013-06-19 16:03:53.586058	2013-07-25 01:53:52.726883	The Sports Shed	The Sports Shed collects new and gently used sports equipment and distribute to organizations who provide sports programs for kids in need. In March of 2009, The Sports Shed started contacting non-profit organizations like Girls in the Game, Boys and Girls Club of Lake County who provide sports programs to kids in low income areas. They had a huge need for quality sports equipment.  Since a large portion of their budgets go toward staffing and programming, they were working with bare-bones sports equipment. The wish lists of items needed to better serve their kids came in quickly and we were able to start fulfilling their needs right away! \r\n\r\nThe Sports Shed now partner with over 25 organizations to provide quality sports equipment to them on an ongoing basis. Humboldt Park Little League, My Joyful Heart, Lost Boyz, Inc., H.E.D.A.C., Beyond The Ball, and Holy Trinity are just some of the organization that have benefited from The Sports Sheds' collected equipment. \r\n\r\nThe Sports Shed sincerely believes in supporting youth sports and engaging to enhance competitive spirit, build teamwork, support confidence, create and maintain a positive attitude, respect sportsmanlike conduct, achieve success, lead a healthy lifestyle, positive brain development and garner relationship-building. \r\n	Our mission is to give under-resourced kids opportunities to engage in sports and physical activities that have a positive impact on their health, self-esteem, work ethic, and sense of belonging. We collect quality sports equipment and re-distribute it to other non-profit organizations who offer sports-related programs to kids in need.	An organization that collects quality sports equipment and re-distribute it to other non-profit organizations who offer sports-related programs to kids in need.	 847-791-7320	info@thesportsshed.org	http://www.thesportsshed.org	3	Vernon Hills	Illinois	http://www.youtube.com/embed/_L5UrQ8kGC0	RveUBTdWwWuu-lcTB7OINh3JLvVfBXaBzeF2-JHFg-k_duhCQl60NraOQE0hVoVQ5EVHt1tJG7xw94J3kTZ3Y1M_E9XepFKsXex7-Hs9Gu3F5N7nW3kG0FOyJo9J0l-gQxU_1A41FXEfVz1PhBl0YCKDhhbka6iT70ox41fIj_5SFTU.jpeg	image/jpeg	174781	2013-06-28 16:29:43.772338	t		https://www.facebook.com/thesportsshed.org	t	The Sports Shed	\N	\N	\N	\N	1	0	0	0	12	the-sports-shed	0	0	chicago	The Sports Shed is a nonproft that collects quality sports equipment and re-distribute it to other non-profit organizations who offer sports-related programs to kids in need.	\N	\N
21	2013-06-18 23:10:18.698425	2013-07-25 01:54:54.743597	Human Thread	HumanThread recognizes our lives are endowed with limitless potential. Through promoting the seeking mind for education starting with the self, the poetic spirit of art and the dignity of life, they strive to empower individuals to utilize this potential, thus stregthening the pillars of a peaceful and sustainable future.\r\n \r\nTheir programming is founded upon a solid philosophy incorporating a Holistic Health/Humanistic Psychology perspective and values. It means that the programs are developed with a fundamental premise that says all aspects of people's needs and experiences - psychological, physical and social, should be taken into account and seen as a whole that is life. They also recognize that "Creativity is central to what makes us human." (Piaget, Vygotskian, and dynamic systems perspectives)\r\n \r\nThe programs represent a significant shift from other solutions (addresssing our culture of violence in Chicago and beyond) in that they aim to awaken each individual to recognize and tap into their tremendous value and power of their internal-self/resources and creativity in order to bring about a change they wish and deserve in their environment. The programs are designed to help them see the power of making and seeing the critical link between self-knowledge and society, and self-expression and creative solutions, be it family, school, community or work situations, which in turn, opens the doors to self-discovery, leading to self-actualization.\r\n \r\nHumanThread works from a vantage point of the dialogical educational model, in which the learner/participant is perceived as a dynamic organism interacting with his environment and being changed in significant ways by that interaction. The instructor perceives him/herself not as an authoritative "knower" who transmits knowledge to the mind of the learner but rather as a guide or facilitator who assists the learner in gaining maximum benefit from his interaction with his/her environment. The key element in this model is interaction or exploration itself, or encounter.\r\n	Our Mission is to promote and inspire artistic expression and creative actions that help connect communities and develop conscious leadership for the 21st century, focused on youth.	HumanThread Center/Gallery for Peace, Arts & Education is a NPO that engages individuals in conversation about peace, nonviolence and human dignity through art, education, and discussion.	312-646-0627	info@humanthread.net	http://www.humanthread.net	3	Chicago	Illinois	http://www.youtube.com/embed/Sw5k71EVjso	HumanThread.jpg	image/jpeg	236528	2013-07-08 02:23:25.124115	t	https://twitter.com/HumanThreadNet	https://www.facebook.com/pages/HumanThread/151883121529	t	Human Thread	\N	\N	\N	\N	1	0	0	0	11	human-thread	0	0	chicago	HumanThread is an NPO that engages individuals in conversation about peace, nonviolence and human dignity through art, education, and discussion.	\N	\N
2	2013-06-18 22:14:48.123337	2013-07-25 02:08:25.44153	Asher James Congenital Heart Disease & Thrombosis Foundation	Asher James Congenital Heart Disease & Thrombosis Foundation is the first foundation to support and fund research in thrombosis in infants and children. 15% of all children with central venous line develop blood clots. Currently there is little awareness and little research for this growing issue in children. Adult medications are being used to treat children that develop these blood clots.\r\n\r\nThis foundation was started after 6 week old Asher James lost his battle to congenital heart disease and thrombosis. Congenital heart disease is the number one birth defect and causes more deaths in the first year of life than any other birth defect. Thrombosis is the intravascular coagulation or clotting of the blood in any part of the circulatory system, as in the heart, arteries, veins, or capillaries\r\n	Asher James Congenital Heart Disease and Thrombosis Foundation seeks to find preventions and treatments through research by supporting those affected by congenital heart disease and/or thrombosis.	Asher James Congenital Heart Disease & Thrombosis Foundation is the first foundation to support and fund research in thrombosis in infants and children.	580-595-1037 	info@asherjamesfoundation.org	http://www.asherjamesfoundation.org	4	Schaumburg	Illinois	http://www.youtube.com/embed/-kROQy_q4RI	AsherJamesFoundation.jpg	image/jpeg	218703	2013-07-08 02:46:09.891888	t		https://www.facebook.com/asherjamesfoundation	t	Asher James Foundation	\N	\N	\N	\N	1	0	0	0	11	asher-james-congenital-heart-disease-thrombosis-foundation	0	0	chicago	Asher James Congenital Heart Disease & Thrombosis Foundation is the first foundation to support and fund research in thrombosis in infants and children.	\N	\N
55	2013-07-24 21:24:36.155632	2013-07-25 02:21:20.279678	Positive Focus	Positive Focus is a 501c3 non-profit organization headquartered in Chicago, passion and purpose is to spread positivity globally through virtual and physical communities allowing people to see love over fear, abundance over lack, diversity over differences, and peace over conflict.\r\n	We're here to remind YOU that life is loving when you choose to have a positive focus	We are an organization that promotes a positive outlook that inspires and supports you to live a more fulfilling life.	(312) 836-1049	carol@positive-focus.com	www.positive-focus.com	\N	Chicago	Illinois	http://www.youtube.com/watch?v=wD7nOED6Slc&feature=share&list=UUVDkv0Ml-Q-Nts28TyKRUcQ	422824_10151088607590073_468071080_n.jpg	image/jpeg	67496	2013-07-24 21:24:35.817358	f	www.twitter.com/positive_focus	https://www.facebook.com/positivefocusnfp	t	Positive Focus	\N	\N	\N	\N	1	0	0	0	0	positive-focus	0	0	chicago	We provide positive thought leadership along with mind-body-spirit, service-charity, and fun-social events. 	\N	\N
38	2013-06-26 21:49:54.53714	2013-07-24 22:40:19.781793	The Wellness Pros	A nonprotfit organization that provides quality fitness services for individuals with mental and physical disabilities. The populations we serve includes, but is not limited to, those with Down’s syndrome, cerebral palsy, mental retardation, autism, Alzheimer’s and dementia. We also serve those with physical disabilities, including senior citizens, those who are wheelchair bound, blind, deaf and amputees. Some of the primary services include: Group Fitness, One-on-One Training, Nutrition and Massage. 	The Mission of the Wellness Pros is to provide quality fitness services for individuals with mental and physical disabilities. 	A fitness-focused nonprofit servicing the Chicagoland area.\r\n		fitness@thewellnesspros.org	http://thewellnesspros.org	4			http://www.youtube.com/embed/SmP4T-FzWZE	WellnessPros.jpg	image/jpeg	203625	2013-07-08 01:50:44.564893	t			t	The Wellness Pros	\N	\N	\N	\N	1	0	0	0	10	the-wellness-pros	0	0	chicago	A nonprofit organization that provides quality fitness for those with mental and physical disabilities. 	\N	\N
16	2013-06-18 22:59:25.112578	2013-07-25 01:57:19.052324	Dreams for Kids	Founded in 1989, Dreams For Kids is a volunteer based, registered non-profit 501(c)(3) organization that aims to break down the barriers of segregation, embrace the abilities and potential of an isolated population, and empower them by their paying it forward in such a way which changes their communities and transforms their lives.\r\n\r\nDreams For Kids is empowering youth who live in poverty and those with disabilities, by uniting them with their peers, recognizing their abilities, and allowing their voices to be heard.  The most isolated young people from every community are reminded they have something to give, and they are the solution- not the problem.\r\n\r\nIn partnership with the best educators and corporate leaders in the world, our Dream Leaders are creating the future and changing the world right now through Dream Leaders Conferences and life-changing initiatives such as Extreme Recess and Holiday for Hope. Click here to read personal accounts of the lives Dreams For Kids has impacted.\r\n\r\nDream Leaders and the inspiring ways its participants are changing the world would not exist without an extensive history and network of support.  Read our history and learn how a single act of kindness can turn into a global youth organization.  Review our valued partners whose generosity and support allows Dreams For Kids to reach youth who need it the most.  Learn about our Dream Team of staff, interns, associate  board and executive board members who bring their passion, talent, and tireless work ethic to make Dreams For Kids what it is today.	To unite children of disability, race, religion, and socio-economic background and inspire them to realize their full potential and serve as active members of their communities and citizens of the world.\r\n\r\n	Dreams for Kids replaces charity with opportunity for at-risk youth through service, leadership and social activities that inspire them to fearlessly pursue their dreams and compassionately change the world.\r\n	866-729-5454	info@dreamsforkids.org	http://dreamsforkids.org	3	Chicago	Illinois	http://www.youtube.com/embed/cogsF14HjSI	fJoUoUbe8KfOHeYHrfyY6CMLUVrBFdkPmEhFXGgIi6s_ul1Q0mwuS1zeyQjYbwkLtVZQBE8nIxk7UH-Cy74_YYY_q2osqCsJ1lFj9VH3ms_24ECV0BH_vN1navqESnqzBMk.jpeg	image/jpeg	180335	2013-06-28 16:14:43.01406	t	https://twitter.com/DreamsforKids	https://www.facebook.com/pages/Dreams-for-Kids/27669100852	t	Dreams for Kids	\N	\N	\N	\N	1	0	0	0	11	dreams-for-kids	0	0	chicago	Dreams for Kids helps children pursue their dreams and compassionately change the world.	\N	\N
50	2013-07-24 21:06:13.429674	2013-07-24 22:40:19.722432	Rumble Arts Center	Rumble Arts Center is a community-based art center run by a small staff and many volunteers invested in providing space for accessible, family-oriented arts programming to the Humboldt Park neighborhood.  The Center is something we love to share, something we would like to consider yours as well as ours.	Rumble Arts Center is an all ages, multicultural, 501(c)(3) community-based arts organization directly serving Chicago’s Humboldt Park neighborhood.  Our mission is to provide an accessible cultural space that facilitates the empowerment and education of individuals and communities.	Rumble Arts Center provides an accessible cultural space that facilitates the empowerment and education of individuals and communities.	(773) 278-4441 	rumblearts@gmail.com	http://rumblearts.com/wordpress/	\N	Chicago	Illinois		432021_417761408260172_1242743166_n.jpg	image/jpeg	137283	2013-07-24 21:06:12.822989	f	https://twitter.com/rumblearts	https://www.facebook.com/rumbleartscenter	t	Rumble Arts Center	\N	\N	\N	\N	1	0	0	0	0	rumble-arts-center	0	0	chicago	An accessible cultural space that facilitates the empowerment and education of individuals and communities. 	\N	\N
13	2013-06-18 22:44:59.858334	2013-07-25 01:58:54.054709	The Miracle Center	The year was 1995 when Mary A. Santana, Founder and Executive Director of The Miracle Center felt the spark of a dream from within. As a single mother, Mary felt the burden of being at work and spending time away from her son, Adrian. She had a hope, a longing to spend more time with her child. In a complete act of faith, Mary resigned from her position as Sales Associate at Petersen Publishing. Initially, Mary wanted to tap into the gifts and talents of her son, but soon realized many children in her neighborhood had untapped potential. With this decision nearly 14 years ago, Mary embarked on a journey towards turning her desire into reality and Mary’s Camp was created.\r\nHer calling towards impacting youth in such a momentous way began close to home. It started with a 9-week Summer Arts program out of her basement apartment. In that space, the children were exposed and taught to the performing arts of dance, choir, music and theater. The children were impacted by field trips to new and exciting places. They explored the Field Museum, Lake Michigan’s Oak Street Beach and Lincoln Park Zoo. Most importantly, Mary’s camp provided a structured, loving and fun environment for the children. From these humble beginnings, her dream leapt forward bounding towards success and making a difference on impressionable lives.\r\nThe beginning years were crucial, The Miracle Center became its name and the vision expanded. Within the next five years, The Miracle Center became incorporated in 1998 and recognized as an official Faith-based non-profit organization. In Humboldt Park, where the Summer Arts Camps was run, Mary forged many helpful partnerships. In 2002, The Miracle Center expanded its programs, offering 8-week Saturday Arts Activities, Christmas Break activities, carnivals and festivals for the community. The Miracle Center also opened two centers in Tampa, Florida to meet the needs of the city’s youth. In January of 2003, The Miracle Center began offering year round after-school programs for children and youth of all ages. For the 2008-2009 school year 65 children were serviced, 150 children for the summer and nearly 80 teens employed.\r\nToday, The Miracle Center is a vibrant not-for-profit whose success is driven by a visionary leader and a diverse team of experienced full and part-time staff and volunteers. Entering 2009, The Miracle Center has implemented six new programs including YEP-Young Entrepreneur Program, Community Asset Mapping, IDOT Team for Beautification, GED/ESL assistance and Emerging Leaders of Chicago. These programs are in addition to the thriving theater and arts programs that present exceptional spring and summer art productions for the community.\r\n	The Miracle Center is a faith-based agency whose purpose is to help children, youth, and families particularly through the performing arts to grow spiritually, mentally, emotionally, socially and physically during after-school and out-of- school programs.	The Miracle Center is a non-profit organization that serves children, youth, and families in Chicago, Illinois. 	773-276-5933	jsanchez@themiraclecenter.org	http://www.themiraclecenter.com	9	Chicago 	Illinois	http://www.youtube.com/embed/SWk-FVUb-2g	TheMiracleCenter_01.jpg	image/jpeg	135264	2013-07-08 03:49:00.538762	t	https://twitter.com/TMCchicago	https://www.facebook.com/TheMiracleCenter	t	The Miracle Center	\N	\N	\N	\N	1	0	0	0	12	the-miracle-center	0	0	chicago	The Miracle Center is a non-profit organization that serves children, youth, and families in Chicago, Illinois. 	\N	\N
59	2013-07-24 21:42:18.837277	2013-07-25 02:16:50.6412	Mended Little Hearts of Chicago	Mended Little Hearts provides hope and support to children, families, and caregivers impacted by congenital heart defects in order to extend and improve quality of life.	For many parents, hearing the heartbeat of their unborn child becomes their first, loving bond to that child. It’s no wonder, then, that discovering that their child has a heart defect, whether diagnosed in the womb, shortly after birth or during childhood, can be devastating.\r\n\r\nMended Little Hearts, a support program for parents of children with heart defects and heart disease, is dedicated to inspiring hope in those who care for the littlest heart patients of all. Mended Little Hearts offers resources and a caring support network as families find answers and move forward to find healing and hope.\r\n\r\nPartnering with hospitals to provide several programs, Mended Little Hearts connects families in crisis with other parents who have survived the shock of learning a child has a heart problem, navigated the maze of medical decisions and procedures, and mapped out a plan for the future:\r\n	The Mended Little Hearts' mission is to provide hope and support to children, families and caregivers impacted by congenital heart defects in order to extend and improve quality of life.	(708) 232-6542	mtoth@mlhchicago.org	http://www.mlhchicago.org/	\N	Chicago	Illinois	http://youtu.be/GzlLgI45C34	426560_474032085979960_921901630_n.jpg	image/jpeg	110223	2013-07-25 02:16:50.143974	f		https://www.facebook.com/mlhchicago	t	Mended Little Hearts of Chicago	\N	\N	\N	\N	1	0	0	0	0	mended-little-hearts-of-chicago	0	0	chicago	Providing hope and support to children, families and caregivers impacted by congenital heart defects in order to extend and improve quality of life.	\N	\N
52	2013-07-24 21:11:46.510852	2013-07-24 22:40:19.7422	Acts of Kindness Cabaret	Acts Of Kindness Cabaret is a volunteer, not-for-profit association of cabaret professionals passionate about taking what we do well and doing good things with it. We believe in the inspiring power of simple kindness, as well as the artistic value of cabaret. It is our mission to provide benefit cabaret performances, largely free of charge, as fundraising vehicles for other charitable organizations, spreading kindness through music to raise significant charitable dollars while increasing awareness, understanding and enjoyment of cabaret. 	We provide relevant networking, services and information to Chicagoland’s nonprofit community.\r\n	We believe in the inspiring power of simple kindness and the artistic value of modern cabaret.	(847) 419-7664	info@aokcabaret.org	http://www.chicagononprofit.org/profile/aokcabaret	\N	Chicago	Illinois	http://www.youtube.com/user/AOKCabaret/about	AOK_Postcard_Logo.jpg	image/jpeg	37017	2013-07-24 21:11:46.236066	f		https://www.facebook.com/events/152317744891534/	t	Acts of Kindness Cabaret	\N	\N	\N	\N	1	0	0	0	0	acts-of-kindness-cabaret	0	0	chicago	We believe in the inspiring power of simple kindness, as well as the artistic value of cabaret.	\N	\N
35	2013-06-19 16:08:26.736938	2013-07-25 01:50:34.424386	Empower Community Center for Youth and Adults	The ECCYA was founded based on a vision by Yolanda Jeffries, Founder & President.  In July of 2010,  Yolanda held the vision that all youth should be granted an opportunity to succeed and have criticial resources readily at their finger tips for them to leverage as they strive for success within their lives.  Not all children come from a two parent home, or have the wealth, education, and expertise to help guide and direct a child on the right path. Consequently, in September of 2010, Yolanda Jeffries  turned a vision into a reality. \r\n\r\nOn June 12, 2011, the ECCYA opened its door to 20 aspiring youth between the ages of 8-17 years old. \r\n\r\nThe ECCYA offers the Putting My Best Foot Forward program which promotes:\r\nSocial and Academic Excellence through educational  tutoring, mentoring, seminars and discussions.  \r\nCareer Coaching to enhance leadership and career preparation\r\nLife Skills to prepare the youth for future success and potential barriers that they might face or be confronted with\r\nFinancial Awareness to allow participants to engage in investment strategies to build nest eggs and foundations for their future and learn to become responsible adolescents	The Empower Community Center for Youth and Adults, (ECCYA) is a non for profit organization that will service underprivileged youth and adults in low income communities.	The ECCYA is a nonprofit that is dedicated to ensuring that youth and adults have the appropriate tools to be successful in life.	(773) 720-2030	yolanda.jeffries@eccya.org	http://www.eccya.org	9	Chicago	Illinois	http://www.youtube.com/embed/xmz9Ciw6JiQ	EEYCA_05.jpg	image/jpeg	164000	2013-07-08 04:16:29.529075	t		https://www.facebook.com/eccyakids	t	Empower Community Center for Youth and Adults	\N	\N	\N	\N	1	0	0	0	10	empower-community-center-for-youth-and-adults	0	0	chicago	ECCYA is a nonprofit that services underprivileged youth and adults in low income communities.	\N	\N
1	2013-06-18 20:50:55.659346	2013-07-25 02:08:53.691866	Women Divine	WOMEN DIVINE is a 501(c)3 not for profit organization established to respond to the alarming rise in high school drop out rates across the City of Chicago. We strategically plan to increase the attendance rates of young women in high school and promote the importance of becoming a college graduate. \r\n\r\nOur programs serve as caring, inclusive learning environments that promote a young woman's best interest and reinforces personal respect. Our activities serve as a powerful platform for positive peer reinforcement.\r\n\r\nWe will enhance students’ overall well-being by engaging the community in making high scholastic achievement, professional development, financial literacy, and cultural arts awareness a priority. In addition, each program offered by WOMEN DIVINE will enlighten young women about the possibility of attending an institution of higher learning, specifically a college or university.\r\n\r\nWe have designed four distinct mentoring programs that will enhance the lives of young women. The programs are divided into four main categories: academic enhancement, leadership development, financial literacy and cultural enrichment. Our mentoring and support programs are available to young women enrolled in grades 9th –- 12th. We also look forward to forming partnerships with local school districts and other similar organizations that support the mission and vision of WOMEN DIVINE. \r\n\r\nThe ultimate goal is to foster a commitment to young women that will promote pro-social friendships, strong interpersonal skills and reassert a sense of hope in the future. 	To effectively impact the lives of young women through academic enhancement, leadership development, financial literacy and cultural enrichment. Our mission is based on the following principles: Responsibility: Empower young women to establish goals and follow through on commitments. Commitment: Inspire pro-social friendships, strong interpersonal skills and instill a sense of hope in the future. Support: Surround young women in a caring, inclusive learning environment. Possibility: Expand the perspective of young women to make them aware of life's possibilities.	WOMEN DIVINE has a vision to educate, inspire, and empower young women to strive for excellence in all areas of their lives.		jthomas@wdivine.org	http://www.wdivine.org/	9	Chicago	Illinois	http://www.youtube.com/embed/7nZx85zj2xQ	WomenDivine.jpg	image/jpeg	244753	2013-07-08 01:58:50.675381	t		https://www.facebook.com/pages/Women-Divine/107222336098	t	Women Divine	\N	\N	\N	\N	1	0	0	0	12	women-divine	0	0	chicago	WOMEN DIVINE has a vision to educate, inspire, and empower young women to strive for excellence in all areas of their lives.	\N	\N
54	2013-07-24 21:21:34.345463	2013-07-25 02:25:26.418717	Special Kids Network	Special Kids Network was founded in 1999, galvanizing an entire community to support a variety of organizations dedicated to serving children. As an independent non-profit organization 501c(3), Special Kids Network was created to foster community awareness and raise funds in support of organizations who believe that every child and young adult, regardless of the nature of their background or disability, should be able to enjoy life to its fullest and to participate in the mainstream of their community	Special Kids Network was founded in 1999, galvanizing an entire community to support a variety of organizations dedicated to serving children. As an independent non-profit organization 501c(3), Special Kids Network was created to foster community awareness and raise funds in support of organizations who believe that every child and young adult, regardless of the nature of their background or disability, should be able to enjoy life to its fullest and to participate in the mainstream of their community\r\n\r\nOur mission is to create community awareness and raise funds in support of organizations who believe that every child and young adult, regardless of the nature of their background or disability, should be able to enjoy life to its fullest and to participate in the mainstream of their community.	Special Kids Network is an independent non-profit organization that was created to provide funding for programs that help children and young adults with special needs.	(847) 282-3171	info@specialkidsnetwork.org	www.specialkidsnetwork.org	\N	Chicago	Illinois	http://youtu.be/Lu3ThA_kchc	542792_482258725161113_1051359957_n.jpg	image/jpeg	14475	2013-07-24 21:21:34.060417	f	www.twitter.com/specialkidsnet	www.facebook.com/specialkidsnetwork	t	Special Kids Network	\N	\N	\N	\N	1	0	0	0	0	special-kids-network	0	0	chicago	Special Kids Network was created to foster community awareness and raise funds in support of organizations who believe that every child and young adult, regardless of the nature of their background or disability, should be able to enjoy life to its fulles	\N	\N
56	2013-07-24 21:28:37.617812	2013-07-24 22:40:19.813839	Global Explorer Kids	Global Explorers Kids is a 501(c)3 nonprofit organization, incorporated December 2005. The organization grew out of the founders’ involvement in fine arts, arts education, arts administration, anthropology, and world travel. Recognizing a lack of cultural understanding in US society, the founders saw the arts as a means of helping children – and thus future generations – cross cultural boundaries.\r\n\r\n	Global Explorers Kids is a 501(c)3 nonprofit organization, incorporated December 2005. Dedicated to providing children with the opportunity to explore the diversity of the world’s peoples and helping them to understand and respect different cultures, using the arts as a catalyst towards learning, the organization grew out of the founders’ involvement in fine arts, arts education, arts administration, anthropology, and world travel. Recognizing a lack of cultural understanding in US society, the founders saw the arts as a means of helping children – and thus future generations – cross cultural boundaries.	Global Explorers Kids seeks to teach children from an early age about the diversity of the world’s peoples, helping them to understand and respect different cultures. 	(773) 491-2723		http://www.globalexplorerskids.org	\N	Chicago	Illinois		574978_10150985793423709_994483803_n.jpg	image/jpeg	30713	2013-07-24 21:28:37.262836	f		https://www.facebook.com/globalexplorerskids	t	Global Explorer Kids	\N	\N	\N	\N	1	0	0	0	0	global-explorer-kids	0	0	chicago	Global Explorers Kids is a nonprofit organization that teaches children about world cultures through the arts. 	\N	\N
14	2013-06-18 22:45:54.344035	2013-07-25 01:58:29.870097	Matanya's Hope	Matanya's Hope is a non profit organization focused on breaking the cycle of poverty for orphaned and extremely poor children in Kenya East Africa. Our programs also bring clean drinking water to drought stricken homes, villages, orphanages and schools. We supply livestock to families empowering them for the first time to earn a living. We provide uniforms, shoes, blankets, mattresses, medicine and so much more to those who were once forgotten. Please join us in our noble efforts by donating or coming with us on one of our humanitarian missions to Kenya.\r\n\r\nMatanya’s Hope is a world leader in empowering communities with it’s primary focus on education for all seeking power over poverty.	To impart the knowledge and resources necessary for the community members of Nanyuki, the Maasai Mara, and surrounding areas of Kenya to increase their standard of living and establish self sufficiency through educational support, with some financial, psychological and material support as needed.	Matanya’s Hope is a non profit organization based in Kenya East Africa and in the USA which is focused on eradicating poverty by educating Kenya’s future.	 708-822-4673	findonemindbodyspirit@yahoo.com	http://www.matanyashope.org	6	Homewood	Illinois	http://www.youtube.com/embed/TuW620aVcfk	Mantanyas_Hope.jpg	image/jpeg	248292	2013-07-08 02:41:09.395898	t		https://www.facebook.com/matanyashope/info	t	Matanya's Hope	\N	\N	\N	\N	1	0	0	0	12	matanya-s-hope	0	0	chicago	Matanya’s Hope is a nonprofit organization based in Kenya East Africa and in the USA which is focused on eradicating poverty by educating Kenya’s future.	\N	\N
60	2013-07-24 21:47:49.342895	2013-07-25 02:15:02.459429	Mudlark Theater Company	Mudlark Theater Company is a 501(c)(3) not-for-profit children’s theater company dedicated to providing professional-level theatrical training to children 6 to 18 years of age, and to collaborating with children to produce great theater. Each year, we stage a full season of theatrical productions with casts of 18 to 30 children, performed at various venues in Evanston. Through our work, we aim to demonstrate to audiences the unique power of children's theater and the substantial contribution it can make to the public discourse.	Our mission was conceived by our founder, Amy Eaton, who envisioned a theater company where young people could get hands-on experience by collaborating on productions with professional artists. 	Adventurous theater made by young people for audiences of all ages.	(847) 448-0708	headquarters@mudlarktheater.org	http://www.mudlarktheater.org/	\N	Chicago	Illinois		625420_416145991755715_852189237_n.jpg	image/jpeg	101530	2013-07-25 02:15:01.755997	f		https://www.facebook.com/pages/Mudlark-Theater-Company/160144180689232	t	Mudlark Theater Company	\N	\N	\N	\N	1	0	0	0	0	mudlark-theater-company	0	0	Chicago	Adventurous theater made by young people for audiences of all ages.	\N	\N
57	2013-07-24 21:32:33.768119	2013-07-24 22:40:19.828087	Eastern Children’s Relief Fund	By partnering with local non-profits in target countries like Ukraine, ECRF has created sustainable models defining the future of care for orphans within the Post-Soviet Bloc. These models look to dispel the Soviet methods of housing large numbers of children in one orphanage, a model that has encouraged physical and sexual abuse, theft and corruption. By creating small, family-style orphanages and implementing programs asserting the dignity of the weakest of society, ECRF aims to create a better future for parentless children. 	As a Catholic organization with an ecumenical focus, the Eastern Children's Relief Fund aims to assist orphans, foster families, the mentally challenged and the poor in former Soviet Bloc countries such as Ukraine. We accomplish these goals by addressing three areas of need in these communities: intervention and assistance, education, and reintegration.	ECRF aims to protect, serve and ensure the futures of abandoned and homeless children in eastern Europe through education, accountability and education programs.	(815) 904-1363	esternrelief@gmail.com	www.easternrelief.org	\N	Chicago	Illinois		DSC_4543.jpg	image/jpeg	104038	2013-07-24 21:32:33.356399	f	https://twitter.com/ecrf	https://www.facebook.com/easternrelief	t	Eastern Children’s Relief Fund	\N	\N	\N	\N	1	0	0	0	0	eastern-children-s-relief-fund	0	0	chicago	The Eastern Children’s Relief Fund (ECRF) is a charitable organization that seeks to support Catholic and private orphanages, foster-family homes, and special needs facilities for some of the most vulnerable members of post-Soviet society: abandoned and d	\N	\N
39	2013-07-24 19:53:37.065104	2013-07-24 22:40:19.912969	CircEsteem	CircEsteem is Chicago's Premier Youth Circus. Our mission is to help students build self-esteem and mutual respect through the practice of circus arts.	CircEsteem's mission is to unite youth from diverse racial, cultural and economic backgrounds and build self esteem and mutual respect through the practice and performance of circus arts.	Building self esteem through circus arts.	(312) 731-3568	info@CircEsteem.org	https://www.facebook.com/pages/CircEsteem/349812888376467	\N	Chicago	Illinois		522609_414352288589193_146430073_n.jpg	image/jpeg	33858	2013-07-24 19:53:36.245648	f	twitter.com/circesteem	https://www.facebook.com/pages/CircEsteem/349812888376467	t	CircEsteem	\N	\N	\N	\N	1	0	0	0	0	circesteem	0	0	chicago	CircEsteem is Chicago's Premier Youth Circus. Our mission is to help students build self-esteem and mutual respect through the practice of circus arts.	\N	\N
40	2013-07-24 19:57:09.73582	2013-07-25 01:51:46.026559	Storycatchers Theater	Storycatchers serves court-involved and otherwise marginalized young people through innovative programs that use the performing arts to promote change in the following areas: personal growth and self-knowledge; conflict resolution, peer relations and teamwork; healthier family interactions; and increased awareness of community issues and resources. 	To prepare young people to make thoughtful life choices through the process of writing, producing and performing original musical theatre inspired by personal stories. 	Storycatchers Theatre is a youth development arts organization that prepares young people to make thoughtful life choice through the process of writing, producing and performing original musical theatre based on personal stories.	(312) 280-4772	rhcombs@storycatcherstheatre.org	www.storycatcherstheatre.org	\N	Chicago	Illinois		285048_10150396972478294_2933749_n.jpg	image/jpeg	90378	2013-07-24 19:57:09.292636	f	N/A	www.facebook.com/pages/Storycatchers-Theatre	t	Storycatchers Theater	\N	\N	\N	\N	1	0	0	0	0	storycatchers-theater	0	0	chicago	Storycatchers Theatre is a youth development arts organization that prepares young people to make thoughtful life choice through art!	\N	\N
8	2013-06-18 22:39:23.653193	2013-07-25 02:02:42.227118	Community Building Tutors	Community Building Tutors is an organization that delivers over 1,250 hours of free tutoring in five distinct communities in Chicago. The mission is to strengthen communities through the implementation of innovative after school programming involving elementary school students, high-school students, and working professionals emphasizing civic engagement. \r\n\r\nIn building programs that have a focus on developing community minded individuals, CBT acknowledges that people with a wealth of experience and knowledge must be used as a resource. For that reason CBT has created the CDTF whose mission is to support the tutoring programs established by CBT through the creation and monitoring of the community focused curriculum, development and oversight of the tutor recruitment and orientation process, and delivery of ongoing feedback and support to the tutors and program coordinators. CBT has sought out young professionals with a background in teaching or community development to assist the CDTF in fulfilling its mission.\r\n\r\nThe CDTF meets monthly on a weekday evening and is still looking for a few more dedicated young professionals with a relevant background who would be interested in participating in our curriculum development and program oversight process.\r\n\r\n	The mission of Community Building Tutors is to strengthen communities through the implementation of innovative after school programming involving elementary school students, high-school students, and working professionals emphasizing civic engagement. 	Providing tutoring service to five distinct communities in Chicago.	847-508-6691	info@cbtutors.org	http://www.cbtutors.org	9	Chicago 	Illinois	http://www.youtube.com/embed/x8gTpTNaGwc	CommunityBuildingTutors_03.jpg	image/jpeg	223742	2013-07-08 03:53:12.887878	t			t	Community Building Tutors	\N	\N	\N	\N	1	0	0	0	12	community-building-tutors	0	0	chicago	Community Building Tutors is an organization that delivers over 1,250 hours of free tutoring in five distinct communities in Chicago.	\N	\N
7	2013-06-18 22:38:11.481845	2013-07-25 02:03:32.942222	Association of Horizons	Our vision is to have a community where barriers between people with and without physical disabilities are transcended, limitations are overcome, new abilities are discovered and an increased awareness of self and others is developed.\r\n\r\nHorizon offers a week long summer camp experience where adults with physical disabilities team up, usually one on one, with able-bodied volunteers for a week of recreation, learning and fun. Every cabin has wheelchair access and there are a limited number of hospital beds available. The past years, Horizon has hosted as many as 95 adults with physical disabilities and over 130 volunteers. \r\n\r\nThe first camp was a little smaller but the adults with Muscular Dystrophy were grateful to be able to attend summer camp.   Often times, this was the only vacation for the individuals.  This week long excursion is also an excellent opportunity to give the individuals caregivers a necessary and well deserved break.  Horizon has since grown and successfully produced yearly Summer Camp Programs for adults with a wide range of physical disabilities including Muscular Dystrophy, Cerebral Palsy and Multiple Sclerosis.\r\n\r\n	An organization of people with and without physical disabilities that provides opportunities for individuals to challenge themselves, develop responsibility and grow through interacting and working together.\r\n	The Association of Horizon, Inc. is a 501(c)3 not-for-profit organization that provides people with and without physical disabilities the opportunity to challenge themselves.	773-477-5170	horizon@associationofhorizon.org	http://associationofhorizon.org/wordpress/	4	Chicago 	Illinois	http://www.youtube.com/embed/ijEu3s9gRVA	2_T9F7OZ4nfKPo5EA0po-OCKylPLn08ImukkMj4fnw8_U3xb2pBxDuHznGcvSr3Pd6W6QhM27zRIlWaYEswWPpA_OxGRhybY2GEoBobT7v3SRcICzfoWyPVfjezeBcAWwTk_4avxnF2O8q8RdEIuf4U0dXvQUquOxfoe4aoE8Wk_I8o.jpeg	image/jpeg	131335	2013-06-28 16:07:37.693608	t	https://twitter.com/@HorizonCamp92	https://www.facebook.com/pages/Association-of-Horizon-Inc/141191369238305	t	Association of Horizons	\N	\N	\N	\N	1	0	0	0	10	association-of-horizons	0	0	chicago	The Association of Horizon, Inc. nonprofit organization that provides people withand without physical disabilities the opportunity to challenge themselves.	\N	\N
6	2013-06-18 22:37:02.797532	2013-07-25 02:04:00.462554	Bright Promises Foundation 	The Bright Promises Foundation has been serving the children of Illinois for 140 years.Through research and discussion with leading children’s experts and organizations, the Bright Promises Foundation identifies areas of great need, where it can make a difference. \r\n\r\nThe Bright Promises Foundation and its partners develop and fund programs that are best able to provide solutions to those needs, while monitoring results and sharing knowledge. \r\n\r\nThe issues we address change as children’s needs change, but our commitment to funding lasting solutions remains. Currently, the Bright Promises Foundation’s focus is promoting better health among low-income and other at-risk children between the ages of 8 and 12. We revisit our focus every four years to ensure relevancy.\r\n\r\n	The Bright Promises Foundation creates opportunities for Illinois children to reach their full promise and potential. We work with organizations to develop and deliver programs that provide the foundation for positive lives.	The Bright Promises Foundation is the only independent public foundation in Illinois solely dedicated to funding programs for children.	312-704-8260	info@brightpromises.org	http://www.brightpromises.org	9	Chicago 	Illinois	http://www.youtube.com/embed/zLym68bqUwQ	3-yTF5E5c_6m6VuJWAqfojQyOudHW2D2s8nXPzfBNJM_nL9nHgkjADQgZ6cvPXp8NKi4gCcW_N3nPt80tHcd1hk_2TesUo0KlBdjoyKilgu5t1LrAxsHJ3AItQpA5dMUx7Y.jpeg	image/jpeg	207985	2013-06-28 16:05:48.573512	t		https://www.facebook.com/pages/Bright-Promises-Foundation-Young-Professionals-Board/352354803935	t	Bright Promises Foundation 	\N	\N	\N	\N	1	0	0	0	11	bright-promises-foundation	0	0	chicago	The Bright Promises Foundation is the only independent public foundation in Illinois solely dedicated to funding programs for children.	\N	\N
43	2013-07-24 20:14:38.701628	2013-07-24 22:40:19.94741	Prevention First	Public education and awareness about how to prevent children and teens from first trying drugs; Illinois Alliance Partner for the Partnership at Drugfree.org; training, advocacy and education designed to prevent drug use; training and support to schools in Illinois; home of Illinois Students Against Destructive Decisions (SADD); Fetal Alcohol Spectrum Disorder prevention initiative; other initiatives supporting drug prevention and related issues such as violence and school failure.\r\n\r\n	To build community capacity to prevent substance abuse	Prevention First is an Illinois nonprofit organization committed to healthy communities that encourage drug-free youth.	(800) 252-8951 ext. 103	karel.homrig@prevention.org	https://www.prevention.org/	\N	Chicago	Illinois		422274_10151339940162272_1298775757_n.jpg	image/jpeg	15814	2013-07-24 20:14:38.30632	f	https://twitter.com/drugfreeIL	https://www.facebook.com/prevention1st	t	Prevention First	\N	\N	\N	\N	1	0	0	0	0	prevention-first	0	0	chicago	Prevention First is an Illinois nonprofit organization committed to healthy communities that encourage drug-free youth.	\N	\N
44	2013-07-24 20:18:24.168749	2013-07-25 03:14:58.322058	Street-Level Youth Media	Street-Level’s programs build critical thinking skills for young people who have been historically neglected by public policy makers and mass media.  Using video and audio production, graphic design, digital photography, and the Internet, Street-Level youth address community issues, access advanced communication technology, and gain inclusion in our information-based society. \r\n\r\nStreet-Level incorporated in 1995 to become one of the first nonprofit organizations in the country to offer technology access and community-based media arts training to underprivileged urban youth. \r\n\r\nIn conjunction with offering media arts programming at our Multimedia Studio, Street-Level delivers collaborative programming off-site in partnership with community-based organizations and Chicago Public Schools and develops special projects/exhibitions in conjunction with local cultural institutions.	We educate Chicago’s urban youth in media arts and emerging technologies for use in self-expression, communication, and social change	Our programs build critical thinking skills, and target young people who have been historically neglected by public policy makers and mass media. \r\n	(773) 862-5331	helen@street-level.org	www.street-level.org	\N	Chicago	Illinois	http://vimeo.com/64900152	whatshappening2.jpg	image/jpeg	128073	2013-07-25 03:14:58.067878	f	https://twitter.com/street_level	http://www.facebook.com/street.level.youth	t	Street-Level Youth Media	\N	\N	\N	\N	1	0	0	0	0	street-level-youth-media	0	0	chicago	Street-Level Youth Media educates Chicago's youth in media arts and emerging technologies for use in self-expression, communication, and social change. 	\N	\N
9	2013-06-18 22:40:29.224003	2013-07-25 02:01:49.915889	Care & Care	CRE & CARE operats Healthcare facilities nationally/internationally and form partnerships with caregivers in developing countries to improve the delivery and availability of healthcare services by providing appropriate medical equipment and supplies. They operate Educational Institutions where possible nationally, internationally or Partner with other providers to provide direct medical and educational services. CARE & CARE also establish an internet based international community center to disseminate information and knowledge, facilitate communication, promote friendship and good will, and to act as a bridge between resources and needs. \r\n\r\nCARE & CARE is envisions a strong community comprised of Healthy Children, Healthy Families and Individuals of all ages regardless of their financial status, insured or uninsured. CARE & CARE strictly follows the Federal Poverty Guidelines 2010 as the basis of qualification for receiving Health Care and other services offered in the United States by CARE & CARE and its partner Medical Centers. CARE & CARE is a totally independent organization and is not associated, affiliated with any governmental agency or political association or any church or religious organization.  We live in a complex, fast-paced society. Our role is to identify and assist individuals of any age who are experiencing hardship emotionally, financially, health wise or through disability. We respect the privacy and confidentiality of every individual we work with. Urgent Responsiveness is the main core of our Organization for which we are known by our clients, referral sources, and the community we serve.\r\n	Care & Care is committed to improving the quality of life of those who are disadvantaged by poverty, disability or age. CARE & CARE is striving to establish a strong foundation for a dignified and meaningful life through the availability of various services including but not limited to the Charitable, Religious, Research and Education. Health Care Medical Centers are one of its services Primary Care focused and maintenance in nature.	Care & Care is committed to improving the quality of life of those who are disadvantaged by poverty, disability or age. 	773-465-2273	info@carencare.org	http://www.carencare.org	9	Chicago 	Illinois	http://www.youtube.com/embed/E-4gYXgvDbY	Care_n_Care.jpg	image/jpeg	230838	2013-07-08 02:20:53.236586	t			t	Care & Care	\N	\N	\N	\N	1	0	0	0	10	care-care	0	0	chicago	Care & Care is committed to improving the quality of life of those who are disadvantaged by poverty, disability or age. 	\N	\N
47	2013-07-24 20:53:21.323002	2013-07-24 22:40:19.688621	Family Focus, Inc.	Founded in 1976 by Bernice Weissbourd, a leading scholar and educator in child development, the organization has grown from a single site to eight direct service centers in the Chicago metropolitan area. Throughout its 35-year history, Family Focus has responded to community needs by expanding to new locations and developing new programs. Last year, Family Focus provided holistic family support services to over 20,000 individuals through regular programs and an additional 17,000 people through outreach and crisis intervention services.\r\n	Family Focus's mission--to promote the well being of children from birth by supporting and strengthening their families in and with their communities--is realized through programs in Chicago's Englewood, Lawndale and Hermosa neighborhoods, and in Aurora, Bensenville, Cicero, Evanston, and Highland Park, Illinois. With comprehensive, community-based support services that build upon families' inherent strengths, Family Focus works to ensure that all children have the best possible start in life and that communities participate in caring for their children.	The mission of Family Focus is to promote the well-being of children from birth by supporting and strengthening their families in and with their communities.	(312) 421-5200	mail@family-focus.org	http://www.family-focus.org/	\N	Chicago	Illinois		29013_459606857445578_98991763_n.jpg	image/jpeg	38345	2013-07-24 20:53:20.928214	f	https://twitter.com/familyfocus_org	https://www.facebook.com/familyfocus.org?ref=hl	t	Family Focus, Inc.	\N	\N	\N	\N	1	0	0	0	0	family-focus-inc	0	0	chicago	The mission of Family Focus is to promote the well-being of children from birth by supporting and strengthening their families in and with their communities.	\N	\N
46	2013-07-24 20:50:05.656723	2013-07-24 22:40:19.665257	Everybody Dance Now (EDN)	As the Chicago branch of Everybody Dance Now! National, EDN!C strives to offer free dance programming to children who wouldn't otherwise have the opportunity. Not only do we believe dance to be a productive way for young people to express themselves, but we also use this program as a vehicle to teach our students about healthy living, social action, and most importantly, themselves.\r\n\r\nEDN!C currently offers classes at the following locations:\r\n-Logan Square Boys and Girls Club of Chicago: 3228 Palmer Street\r\n-Uptown Boys and Girls Club of Chicago: 4835 N Sheridan Road\r\n-Sheil Park District: 3505 North Southport Avenue\r\n-Erie House: 1347 West Erie Street\r\n-Madero Middle School: 3202 W. 28th Street\r\n-Emmett Till Math and Science Academy: 6543 South Champlain Avenue	Our MISSION is to positively transform the lives of youth through dance, leadership, and community involvement\r\n\r\nOur VISION is to ensure that:\r\n*Everybody has access to creative, healthy and productive outlets such as dance\r\n*Young leaders have the mentor-ship and support to change their passion for dance into social change\r\n\r\n-EDN! strives to help students C.R.E.A.T.E.:\r\n*Cultivate self-esteem and self-value\r\n*Respect their bodies and establish healthy lifestyles\r\n*Express themselves and channel energy through creative alternatives\r\n*Achieve goals and maintain a positive attitude through challenges\r\n*Take part in consistent programming that promotes friendship and a sense of belonging\r\n*Expand their perspectives through community service and cultural learning	Everybody Dance Now! Chicago is a nonprofit organization that provides free, weekly dance classes to youth throughout the city.	(847) 602-5374	sophie93@me.com	http://ednchicago.org/wp/	\N	Chicago	Illinois		524964_415258028560478_1136153850_n.jpg	image/jpeg	113658	2013-07-24 20:50:05.056711	f	https://twitter.com/ednchicago	https://www.facebook.com/ednchicago	t	Everybody Dance Now (EDN)	\N	\N	\N	\N	1	0	0	0	0	everybody-dance-now-edn	0	0	chicago	Everybody Dance Now! Chicago is a nonprofit organization that provides free, weekly dance classes to youth throughout the city.	\N	\N
48	2013-07-24 20:57:56.731513	2013-07-24 22:40:19.702453	Museum Africa	Museum Africa currently is a virtual museum dedicated to bringing to light all of the magnificent achievements of both ancient and modern African civilizations. We believe we are the sole museum of its type attempting to compile, in aggregate, the greatness of African achievements in the arts, religion, and the advancement of humankind.\r\n\r\nHeadquartered in Chicago, Illinois, we nevertheless reach out across the globe to share our findings with all who seek truth and advocate for peaceful coexistence among all peoples of the earth.	Our purpose is to advance the study and understanding of ancient African civilizations, while promoting a greater appreciation of the ancient Africans' historical and cultural heritages.\r\n\r\nWe accomplish our mission by:\r\n\r\ncollecting, preserving and making accessible the historical records and artifacts of ancient African civilizations;\r\n\r\npromoting open discourse on critical issues affecting ancient and modern Africa; and\r\n\r\neducating and encouraging citizens to contribute, through public and community  service, to shaping our understanding of Africa's past.	Museum Africa currently is a virtual museum whose goal is to construct a combination museum and library to house the world's largest collection of primary source documents, books and artifacts pertaining to continental Africa's history. Its primary function is to provide public access and a centralized location for the purpose of conducting research on individual African cultures.	(312) 878-6402	info@museumafrica.org	http://museumafrica.org/about.html	\N	Chicago	Illinois		522355_238228196277675_595838196_n.jpg	image/jpeg	4642	2013-07-24 20:57:56.497606	f	https://twitter.com/MuseumAfrica	https://www.facebook.com/MusAfrica	t	Museum Africa	\N	\N	\N	\N	1	0	0	0	0	museum-africa	0	0	chicago	Museum Africa is dedicated to the rediscovery and study of ancient African civilizations and their place in world history.	\N	\N
61	2013-07-24 21:54:27.780662	2013-07-25 00:49:07.899211	Surge for Water	SURGE is a U.S. based 501(c)3 non-profit organization that improves access to clean, safe water for life. We also work to increase awareness of this global water crisis. 100% of public donations directly fund sustainable water projects. Today, more than 1 billion people do not have access to safe drinking water. That is 1 in 6 of us.	FUND projects that provide access to safe water, ENGAGE, EDUCATE, and EMPOWER communities in which we live, INVEST in innovation that drives sustainable solutions	Surge is a nonprofit organization that brings life-sustaining water to those most in need, while increasing awareness of the global crisis.	(312) 899-6298	Shilpa.Alva@surgeforwater.org	www.surgeforwater.org	\N	Chicago	Illinois		66805_486644868056108_423265487_n.jpg	image/jpeg	63104	2013-07-24 21:54:27.394991	f		https://www.facebook.com/Surging	t	Surge for Water	\N	\N	\N	\N	1	0	0	0	0	surge-for-water	0	0	chicago	SURGE is a non-profit organization that improves access to clean, safe water for life.	\N	\N
4	2013-06-18 22:33:16.152214	2013-07-25 02:04:27.953159	Irving Park Community Food Pantry	The main purpose of the Irving Park Community Food Pantry is to provide nutritionally balanced food to our clients who are at risk of  hunger. In addition, they strive to increase awareness of hunger related issues to the community at large. Clients are often referred to additional community resources to meet the variety of needs that they may have that are beyond the scope of the Pantry. The Pantry also offers periodic nutrition education. Irving Park Community Food Pantry hopes to provide our clients with other opportunities for learning and growth throughout the coming years.\r\n\r\nTheir philosophy of service is to provide caring, consistent quality of service and an equitable distribution of available pantry resources to all clients. It is their belief that service offered and delivered in this manner increases and maintains the self-worth and dignity of each person. Value-based services like theirs enhances the community as a whole and helps make our community one in which residents take pride, where people desire to live and raise their families as people of good will. Together, we are doing important work. Together, we are neighbors helping neighbors.\r\n\r\n\r\n\r\n	The main purpose of the Irving Park Community Food Pantry is to provide nutritionally balanced food to our clients who are at risk of hunger. In addition, we strive to increase awareness of hunger related issues to the community at large. Clients are often referred to additional community resources to meet the variety of needs that they may have that are beyond the scope of the Pantry. The Pantry also offers periodic nutrition education. We hope to provide our clients with other opportunities for learning and growth throughout the coming years.	A community food pantry that provides nutritionally balanced food to their neighbors who are at risk of  hunger. 	773-283-6296	info@irvingparkfoodpantry.org	http://irvingparkfoodpantry.com	8	Chicago 	Illinois	http://www.youtube.com/embed/huClo9_W84o	IrvingParkFoodPantry.jpg	image/jpeg	265034	2013-07-08 02:55:13.849258	t		https://www.facebook.com/pages/Irving-Park-Community-Food-Pantry/58868923870	t	Irving Park Community Food Pantry	\N	\N	\N	\N	1	0	0	0	13	irving-park-community-food-pantry	0	0	chicago	A community food pantry that provides nutritionally balanced food to their neighbors who are at risk of  hunger. 	\N	\N
58	2013-07-24 21:36:08.876943	2013-07-25 02:18:03.777851	Indo American Center	The Indo-American Center is non-profit 501(c)(3) status organization. Our mission is to promote the well-being of South Asian immigrants through services that facilitate their adjustment, integration, and friendship with the wider society, nurture their sense of community, and foster appreciation for their culture and heritage.	The mission of the Indo-American Center is to promote the well being of South Asian immigrants through services that facilitate their adjustment, integration and friendship with the wider society, nurture their sense of community, and foster appreciation for their heritage and culture.	Helping South Asian immigrants in the Chicago area become empowered and connected through education, resources, and social services.	(773) 973-4444	info@indoamerican.org	http://www.indoamerican.org/	\N	Chicago	Illinois	http://youtu.be/u1pfaO-sMac	1012167_10151627928016855_1396627232_n.jpg	image/jpeg	119135	2013-07-24 21:36:08.3035	f	https://twitter.com/indoamerican	https://www.facebook.com/IndoAmericanCenter	t	Indo American Center	\N	\N	\N	\N	1	0	0	0	0	indo-american-center	0	0	chicago	Helping South Asian immigrants in the Chicago area become empowered and connected through education, resources, and social services.	\N	\N
62	2013-07-24 22:03:35.293948	2013-07-25 00:48:37.81309	Irving Park United Methodist Church	A relaxed, personal and communal experience rich in traditional Biblical teachings, and relative to our current lives. You are welcome in your Sunday best or casual jean wear, and by all means, bring your water and coffee mug with you.	Organizations and community groups take advantage of available space opportunities at our church, which allows them to continue their cause in a safe, friendly environment. 	A relaxed, personal and communal experience rich in traditional Biblical teachings, and relative to our current lives. 	(773) 283-6262	irvingparkumc@comcast.net	http://irvingparkumc.com/	\N	Chicago	Illinois		197470_202552309772546_3001757_n.jpg	image/jpeg	55488	2013-07-24 22:03:34.95545	f		https://www.facebook.com/pages/Irving-Park-United-Methodist-Church/194065863954524?fref=ts	t	Irving Park United Methodist Church	\N	\N	\N	\N	1	0	0	0	0	irving-park-united-methodist-church	0	0	chicago	We are a welcoming community of faith that is rethinking church.	\N	\N
22	2013-06-18 23:11:32.615682	2013-07-24 22:40:19.677994	Chicago Photography Center	The Chicago Photography Center (CPC) is a not-for-profit 501(c)3 organization focused on photography. Our facility includes classroom space, a computer lab, darkrooms, a lighting studio and a gallery that exhibits student, instructor and invited artist’s work.  CPC offers a wide range of classes and boot camps for both the digital and film photographer. Our students include true beginners who may not even own a camera when they sit in on their first class, advanced amateurs who are honing their skills to turn their passion into a business, and even pros looking to expand their knowledge and reach.\r\n\r\nCPC’s curriculum offers students solid technical knowledge, creating the foundation they’ll need to create the photos they desire. Our instructors and volunteers foster an environment that encourages students to look at the world as photographers, explore their creative vision and capture their unique perspective through the camera’s lens.	Our mission is to foster a broad community of photographers who practice and appreciate the art of photography by offering a variety of classes and exhibition activities; sustaining a corps of volunteers; sharing our cameras with overlooked and underserved communities; and providing a vibrant, welcoming environment in which all this happens.	An organization aimed to foster a broad community of photographers.	773-549-1631	info@chicagophoto.org	http://www.chicagophoto.org	9	Chicago	Illinois	http://www.youtube.com/embed/izRF8VWwo-A	Chicago_Photo_Center_03.jpg	image/jpeg	221655	2013-07-08 04:01:21.959787	t	https://twitter.com/ChicagoPhotoCtr	https://www.facebook.com/ChicagoPhotographyCenter	t	Chicago Photography Center	\N	\N	\N	\N	1	0	0	0	10	chicago-photography-center	0	0	chicago	\N	\N	\N
41	2013-07-24 20:02:14.623945	2013-07-25 03:22:35.616917	Future Founders Foundation	The Future Founders Foundation is a non-profit organization that expands entrepreneurship and career exploration programs for low income students in Chicago. We inspire teenagers to explore new careers and connect them with successful mentors from various professions. We operate two career exposure programs to empower underserved students to consider careers they never imagined and help them to create roadmaps to achieve these career goals.\r\n\r\nOur organization was created in 2011 through the merger of Future Founders, the youth entrepreneurship program founded by the Chicagoland Entrepreneurial Center (CEC) in 2005 and Connect to the Future, the career exposure program that Lightbank Co-Founder Brad Keywell launched in 2006.\r\n	We inspire underserved youth in Chicago to explore new career opportunities.	We inspire low income teens in Chicago to explore careers they never imagined.	(312) 350-0334	info@futurefounders.com		\N	Chicago	Illinois	http://youtu.be/4cHJoM0TuBM	1002450_626499557369954_162400232_n.jpg	image/jpeg	131588	2013-07-24 20:02:14.106152	f	www.twitter.com/futurefounders	https://www.facebook.com/futurefoundersfoundation	t	Future Founders Foundation	\N	\N	\N	\N	1	0	0	0	0	future-founders-foundation	0	0	chicago	The Future Founders Foundation inspires low-income youth in Chicago to explore new career opportunities. We offer programs to connect students with mentors from various professions and provide engaging project-based learning experiences for 3rd through 12	\N	\N
42	2013-07-24 20:08:30.171444	2013-07-25 03:20:23.562425	Girls in the Game	Since 1995, Girls in the Game, a 501c3 nonprofit organization, has emerged as a leading girls' health and fitness organization in Chicago. Every year, Girls in the Game empowers more than 2,500 girls to make healthier choices and develop the confidence and leadership skills they need to succeed on and off the field.\r\n\r\nFrom yoga and lacrosse to soccer and dance, Girls in the Game exposes girls to a wide and energizing mix of sports and fitness activities year round.\r\n\r\nGirls are encouraged to get in the game —any game—so they can learn teamwork and determination, and to make choices that lead to a happier, healthier life. All sports and fitness programming includes hands-on workshops on nutrition, health and leadership.	Girls in the Game provides and promotes sports & fitness opportunities, nutrition & health education, and leadership development to enhance the overall health and well-being of all girls.	Girls in the Game provides and promotes sports and fitness opportunities, nutrition and health education, and leadership development to enhance the overall health and well-being of girls.\r\n	(312) 633-4263	dkobel@girlsinthegame.org	www.girlsinthegame.org	\N	Chicago	Illinois	http://youtu.be/oY9Q1YmQ5Tk	522744_574363239249488_1100843504_n.jpg	image/jpeg	85794	2013-07-25 03:20:23.180511	f	www.twitter.com/girlsinthegame	www.facebook.com/getgirlsinthegame	t	Girls in the Game	\N	\N	\N	\N	1	0	0	0	0	girls-in-the-game	0	0	chicago	Girls in the Game provides and promotes sports and fitness opportunities, nutrition and health education, and leadership development to enhance the overall health and well-being of girls.	\N	\N
53	2013-07-24 21:15:39.900217	2013-07-24 22:40:19.775159	Cabrini Connections	The tutoring program was created in 1992 to support students from the Montgomery Ward Cabrini-Green Tutoring Program. The founders were volunteers with that program that saw the need to continue to help those students after the sixth grade. Cabrini Connections started offering one-on-one tutoring to 7-12 grade students in donated space in the Montgomery Ward headquarters building.\r\n\r\nSince 1992, more than 625 students have attended the program for at least one year along with over 800 volunteer tutor/mentors. Over 90% of 12th grade program graduates have entered college.	Cabrini Connections helps economically disadvantaged students succeed in high school & move on to college or a career. We do this by pairing the students with an adult tutor who supports their academic achievement and provides guidance in life skills.	Cabrini Connections helps economically disadvantaged students succeed in high school and move on to college followed by a career. We do this by pairing the students with an adult tutor who supports their academic achievement and provides guidance in life skills.	(312) 492.9614	info@cabriniconnections.org	www.Cabrini Connections.net	\N	Chicago	Illinois		397882_325180304187277_1931462556_n.jpg	image/jpeg	41024	2013-07-24 21:15:39.316	f		https://www.facebook.com/CabriniConnections	t	Cabrini Connections	\N	\N	\N	\N	1	0	0	0	0	cabrini-connections	0	0	chicago	To provide inner-city youths with the resources to succeed in school. To foster leadership qualities that the students will bring to their communities and make positive changes.	\N	\N
15	2013-06-18 22:58:10.667982	2013-07-25 01:57:49.209265	Literacy Volunteers of Illinois	Literacy Volunteers of Illinois (LVI) was founded in 1979 to serve as a technical assistance and training agency for volunteer literacy programs affiliated with the national Literacy Volunteers of America organization. \r\n\r\nLVI began by working with just four LVA programs, and today provides an array of resources and services to staff, tutors and students in some 100 adult Literacy Programs statewide. These services include the Jump Start and VOCAL AmeriCorps programs.\r\n\r\nLVI's vision is to:\r\n-Establish a network of trained and dedicated tutors.\r\n-Foster student leadership.\r\n-Make our services available to as many individuals as possible.\r\n-Increase awareness of our services to the broadest possible audience.	Literacy Volunteers of Illinois is a statewide organization committed to developing and supporting volunteer literacy programs that help families, adults and out-of-school teens increase their literacy skills.	Non-profit organization that promotes adult literacy throughout the state of Illinois.	312-857-1582	info@lvillinois.org	http://www.lvillinois.org	9	Chicago	Illinois	http://www.youtube.com/embed/Hqb5wAnsX08	0mwtDbnDUzMct834L_SgntjpHu1TRhB5eJfZOqPEntc_KUQDDSfVA4sVt2qXXsFIILhfwWYMoJXokb5l9XbEUqM_oW7ZEpXh9o0nRsxpIFi-6WZELiiJWe4GOUFQJjz-i60_u3PLPz_4dydtL9-7vOrUN-pu7eBGdlcnGelZja0-Evo.jpeg	image/jpeg	233512	2013-06-28 16:22:21.481842	t	https://twitter.com/LVIllinois	https://www.facebook.com/lvillinois	t	Literacy Volunteers of Illinois	\N	\N	\N	\N	1	0	0	0	11	literacy-volunteers-of-illinois	0	0	chicago	Non-profit organization that promotes adult literacy throughout the state of Illinois.	\N	\N
3	2013-06-18 22:32:08.088468	2013-07-25 02:07:50.393439	Chicago Gateway Green	Chicago Gateway Green is rooted in the spirit of civic pride and leadership first established in 1986 by our visionary founder, the late Donald J. DePorter.\r\n\r\nChicago Gateway Green was founded on the belief that beauty and sustainability go hand-in-hand, and continues to lead the charge in greening and beautifying the great city of Chicago together with our partners.\r\n\r\nChicago Gateway Green developed the Expressway Partnership program in 1999, joining the City of Chicago, the State of Illinois and Chicago’s corporate community to transform the city’s expressways into beautifully-landscaped parkways. Distinct from traditional ‘adopt-a-highway’ programs, Chicago Gateway Green develops and maintains sweeping landscapes which feature our sponsors, creating green ribbons of sustainable landscapes weaving throughout the city.\r\n\r\nAs Chicago Gateway Green evolves, the fundamentals are the same. Our corporate founders led by example and proved that business leaders do care about the communities they live and work in. Then and now we rely on that commitment and spirit of service to support the work of creating a beautiful and green Chicago that can be sustained well into the future.\r\n	We lead urban beautification and greening projects that make a positive environmental and aesthetic impact on Chicago. Ultimately our work leads to improved quality of life through healthier living. Our sustainable landscaping, litter removal and native plantings on hundreds of acres along transportation corridors help improve air quality, protect our water, and restore the beauty of Chicago – making us feel good about our surroundings and breathe a little easier, too.	A non-profit organization dedicated to greening and beautifying Chicago's expressway, gateways, and neighborhoods.	312-540-9930	kteel@gatewaygreen.org	http://www.gatewaygreen.org	5	Chicago	Illinois	http://www.youtube.com/embed/bbtEUJWKjfs	ZnlN4_WvDlLQY0xuMCjXj1EQnE89ZoGs-DfsSyyz7Lk.jpeg	image/jpeg	266357	2013-06-28 16:12:20.586492	t	https://twitter.com/Gateway_Green	https://www.facebook.com/GatewayGreen	t	Chicago Gateway Green	\N	\N	\N	\N	1	0	0	0	10	chicago-gateway-green	0	0	chicago	A non-profit organization dedicated to greening and beautifying Chicago's expressway, gateways, and neighborhoods.	\N	\N
\.


--
-- Data for Name: causes_cause_types; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY causes_cause_types (id, cause_id, cause_type_id) FROM stdin;
1	9	4
2	9	6
3	9	9
4	16	3
5	2	4
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
49	39	3
50	39	1
51	40	9
52	40	3
53	40	1
54	41	9
55	41	3
56	42	4
57	42	3
58	43	9
59	43	4
60	43	3
61	44	9
62	44	3
63	44	1
64	45	9
65	45	3
66	45	1
67	46	4
68	46	3
69	46	1
70	47	8
71	47	4
72	47	3
73	48	9
74	48	3
78	50	9
79	50	4
80	50	3
81	50	1
82	52	9
83	52	3
84	52	1
85	53	9
86	53	4
87	53	3
88	53	1
89	54	9
90	54	4
91	54	3
92	54	1
93	55	9
94	55	4
95	55	3
96	55	1
97	56	9
98	56	6
99	56	5
100	56	3
101	57	8
102	57	6
103	57	3
104	58	9
105	58	8
106	58	6
107	58	4
108	59	4
109	59	3
110	61	8
111	61	6
112	61	5
113	61	4
114	62	9
115	62	8
116	38	8
149	37	4
150	37	3
151	36	9
152	36	4
153	23	9
154	14	3
155	11	9
156	11	4
157	11	3
158	60	9
159	60	3
160	60	1
\.


--
-- Name: causes_cause_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('causes_cause_types_id_seq', 160, true);


--
-- Name: causes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('causes_id_seq', 62, true);


--
-- Data for Name: contributions; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY contributions (id, user_id, cause_id, fulfilment_id, fulfilment_type, need_id, need_type, created_at, updated_at, fulfillment_type, fulfillment_id) FROM stdin;
1	31	19	264	follower	\N	followers	2013-07-23 19:36:22.080291	2013-07-23 19:36:22.080291	\N	\N
2	31	19	5	goods_donation	40	goods_donations	2013-07-23 21:18:06.35128	2013-07-23 21:18:06.35128	\N	\N
3	1	19	\N	\N	15	Need	2013-07-23 22:52:59.623477	2013-07-23 22:52:59.623477	CashDonation	6
4	1	19	\N	\N	16	volunteers	2013-07-23 23:38:05.775721	2013-07-23 23:38:05.775721	Volunteer	8
5	1	19	\N	\N	15	cash_donations	2013-07-23 23:39:17.677563	2013-07-23 23:39:17.677563	CashDonation	7
6	1	19	\N	\N	40	goods_donations	2013-07-23 23:41:21.671459	2013-07-23 23:41:21.671459	GoodsDonation	6
7	1	19	\N	\N	40	goods_donations	2013-07-23 23:45:26.622558	2013-07-23 23:45:26.622558	GoodsDonation	7
8	1	19	\N	\N	40	goods_donations	2013-07-23 23:45:40.063602	2013-07-23 23:45:40.063602	GoodsDonation	8
9	1	19	\N	\N	40	goods_donations	2013-07-23 23:46:25.939439	2013-07-23 23:46:25.939439	GoodsDonation	9
10	1	19	\N	\N	40	goods_donations	2013-07-23 23:50:08.844862	2013-07-23 23:50:08.844862	GoodsDonation	10
11	34	19	\N	\N	15	cash_donations	2013-07-24 12:41:03.312248	2013-07-24 12:41:03.312248	CashDonation	8
12	1	8	\N	\N	22	followers	2013-07-24 17:09:02.578504	2013-07-24 17:09:02.578504	Follower	271
13	1	19	\N	\N	15	cash_donations	2013-07-24 18:04:52.165777	2013-07-24 18:04:52.165777	CashDonation	9
14	1	19	\N	\N	16	volunteers	2013-07-24 18:05:01.762829	2013-07-24 18:05:01.762829	Volunteer	9
15	1	4	\N	\N	39	followers	2013-07-24 18:05:51.665624	2013-07-24 18:05:51.665624	Follower	277
16	35	15	\N	\N	28	followers	2013-07-24 18:38:06.965083	2013-07-24 18:38:06.965083	Follower	278
17	35	17	\N	\N	18	followers	2013-07-24 19:06:48.486894	2013-07-24 19:06:48.486894	Follower	279
18	37	4	\N	\N	39	followers	2013-07-24 21:05:43.553865	2013-07-24 21:05:43.553865	Follower	280
19	38	17	\N	\N	18	followers	2013-07-24 21:39:47.060242	2013-07-24 21:39:47.060242	Follower	281
20	38	14	\N	\N	29	followers	2013-07-24 23:25:14.923295	2013-07-24 23:25:14.923295	Follower	282
\.


--
-- Name: contributions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('contributions_id_seq', 20, true);


--
-- Data for Name: featured_causes; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY featured_causes (id, created_at, updated_at, cause_id) FROM stdin;
1	2013-07-06 22:18:25.787426	2013-07-06 22:18:25.787426	19
2	2013-07-06 22:18:25.870981	2013-07-06 22:18:25.870981	34
3	2013-07-06 22:18:25.874986	2013-07-06 22:18:25.874986	8
4	2013-07-06 22:18:25.877953	2013-07-06 22:18:25.877953	36
\.


--
-- Name: featured_causes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('featured_causes_id_seq', 4, true);


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY followers (id, cause_id, user_id, need_id, created_at, updated_at) FROM stdin;
1	23	6	\N	2013-07-08 05:18:11.218709	2013-07-08 05:18:11.218709
2	6	6	\N	2013-07-08 05:18:11.259956	2013-07-08 05:18:11.259956
3	8	6	\N	2013-07-08 05:18:11.268168	2013-07-08 05:18:11.268168
4	3	6	\N	2013-07-08 05:18:11.275498	2013-07-08 05:18:11.275498
5	38	6	\N	2013-07-08 05:18:11.282763	2013-07-08 05:18:11.282763
6	11	6	\N	2013-07-08 05:18:11.290808	2013-07-08 05:18:11.290808
7	10	6	\N	2013-07-08 05:18:11.298345	2013-07-08 05:18:11.298345
8	16	6	\N	2013-07-08 05:18:11.305616	2013-07-08 05:18:11.305616
9	7	6	\N	2013-07-08 05:18:11.313006	2013-07-08 05:18:11.313006
10	14	6	\N	2013-07-08 05:18:11.32017	2013-07-08 05:18:11.32017
11	34	6	\N	2013-07-08 05:18:11.327348	2013-07-08 05:18:11.327348
12	37	6	\N	2013-07-08 05:18:11.334438	2013-07-08 05:18:11.334438
13	21	6	\N	2013-07-08 05:18:11.341423	2013-07-08 05:18:11.341423
14	20	6	\N	2013-07-08 05:18:11.349469	2013-07-08 05:18:11.349469
15	9	6	\N	2013-07-08 05:18:11.356654	2013-07-08 05:18:11.356654
16	22	6	\N	2013-07-08 05:18:11.363701	2013-07-08 05:18:11.363701
17	1	6	\N	2013-07-08 05:18:11.370927	2013-07-08 05:18:11.370927
18	35	6	\N	2013-07-08 05:18:11.378261	2013-07-08 05:18:11.378261
19	19	6	\N	2013-07-08 05:18:11.385112	2013-07-08 05:18:11.385112
20	17	6	\N	2013-07-08 05:18:11.392511	2013-07-08 05:18:11.392511
21	15	6	\N	2013-07-08 05:18:11.399567	2013-07-08 05:18:11.399567
22	36	6	\N	2013-07-08 05:18:11.406665	2013-07-08 05:18:11.406665
23	13	6	\N	2013-07-08 05:18:11.413678	2013-07-08 05:18:11.413678
24	2	6	\N	2013-07-08 05:18:11.420831	2013-07-08 05:18:11.420831
25	4	6	\N	2013-07-08 05:18:11.428247	2013-07-08 05:18:11.428247
26	23	7	\N	2013-07-08 05:21:24.951016	2013-07-08 05:21:24.951016
27	8	7	\N	2013-07-08 05:21:24.95902	2013-07-08 05:21:24.95902
28	10	7	\N	2013-07-08 05:21:24.966028	2013-07-08 05:21:24.966028
29	34	7	\N	2013-07-08 05:21:24.97306	2013-07-08 05:21:24.97306
30	37	7	\N	2013-07-08 05:21:24.979888	2013-07-08 05:21:24.979888
31	21	7	\N	2013-07-08 05:21:24.986702	2013-07-08 05:21:24.986702
32	20	7	\N	2013-07-08 05:21:24.993889	2013-07-08 05:21:24.993889
33	9	7	\N	2013-07-08 05:21:25.000647	2013-07-08 05:21:25.000647
34	22	7	\N	2013-07-08 05:21:25.007401	2013-07-08 05:21:25.007401
35	35	7	\N	2013-07-08 05:21:25.014135	2013-07-08 05:21:25.014135
36	6	7	\N	2013-07-08 05:21:25.020814	2013-07-08 05:21:25.020814
37	3	7	\N	2013-07-08 05:21:25.027557	2013-07-08 05:21:25.027557
38	38	7	\N	2013-07-08 05:21:25.03433	2013-07-08 05:21:25.03433
39	11	7	\N	2013-07-08 05:21:25.041304	2013-07-08 05:21:25.041304
40	16	7	\N	2013-07-08 05:21:25.048014	2013-07-08 05:21:25.048014
41	7	7	\N	2013-07-08 05:21:25.054716	2013-07-08 05:21:25.054716
42	14	7	\N	2013-07-08 05:21:25.062705	2013-07-08 05:21:25.062705
43	1	7	\N	2013-07-08 05:21:25.069837	2013-07-08 05:21:25.069837
44	19	7	\N	2013-07-08 05:21:25.076955	2013-07-08 05:21:25.076955
45	17	7	\N	2013-07-08 05:21:25.083781	2013-07-08 05:21:25.083781
46	15	7	\N	2013-07-08 05:21:25.090571	2013-07-08 05:21:25.090571
47	36	7	\N	2013-07-08 05:21:25.097289	2013-07-08 05:21:25.097289
48	13	7	\N	2013-07-08 05:21:25.104166	2013-07-08 05:21:25.104166
49	2	7	\N	2013-07-08 05:21:25.110867	2013-07-08 05:21:25.110867
50	4	7	\N	2013-07-08 05:21:25.117792	2013-07-08 05:21:25.117792
51	38	8	\N	2013-07-08 05:24:20.504954	2013-07-08 05:24:20.504954
52	11	8	\N	2013-07-08 05:24:20.512955	2013-07-08 05:24:20.512955
53	16	8	\N	2013-07-08 05:24:20.519974	2013-07-08 05:24:20.519974
54	7	8	\N	2013-07-08 05:24:20.526836	2013-07-08 05:24:20.526836
55	14	8	\N	2013-07-08 05:24:20.533813	2013-07-08 05:24:20.533813
56	1	8	\N	2013-07-08 05:24:20.540761	2013-07-08 05:24:20.540761
57	19	8	\N	2013-07-08 05:24:20.547572	2013-07-08 05:24:20.547572
58	17	8	\N	2013-07-08 05:24:20.554401	2013-07-08 05:24:20.554401
59	15	8	\N	2013-07-08 05:24:20.561251	2013-07-08 05:24:20.561251
60	36	8	\N	2013-07-08 05:24:20.568015	2013-07-08 05:24:20.568015
61	13	8	\N	2013-07-08 05:24:20.574804	2013-07-08 05:24:20.574804
62	23	8	\N	2013-07-08 05:24:20.581726	2013-07-08 05:24:20.581726
63	8	8	\N	2013-07-08 05:24:20.588531	2013-07-08 05:24:20.588531
64	10	8	\N	2013-07-08 05:24:20.59539	2013-07-08 05:24:20.59539
65	34	8	\N	2013-07-08 05:24:20.60233	2013-07-08 05:24:20.60233
66	37	8	\N	2013-07-08 05:24:20.609063	2013-07-08 05:24:20.609063
67	21	8	\N	2013-07-08 05:24:20.615775	2013-07-08 05:24:20.615775
68	20	8	\N	2013-07-08 05:24:20.622554	2013-07-08 05:24:20.622554
69	9	8	\N	2013-07-08 05:24:20.629337	2013-07-08 05:24:20.629337
70	22	8	\N	2013-07-08 05:24:20.636028	2013-07-08 05:24:20.636028
71	35	8	\N	2013-07-08 05:24:20.642683	2013-07-08 05:24:20.642683
72	6	8	\N	2013-07-08 05:24:20.649377	2013-07-08 05:24:20.649377
73	3	8	\N	2013-07-08 05:24:20.656147	2013-07-08 05:24:20.656147
74	2	8	\N	2013-07-08 05:24:20.66306	2013-07-08 05:24:20.66306
75	4	8	\N	2013-07-08 05:24:20.669786	2013-07-08 05:24:20.669786
76	38	9	\N	2013-07-08 05:26:53.034079	2013-07-08 05:26:53.034079
77	11	9	\N	2013-07-08 05:26:53.04183	2013-07-08 05:26:53.04183
78	16	9	\N	2013-07-08 05:26:53.048632	2013-07-08 05:26:53.048632
79	7	9	\N	2013-07-08 05:26:53.055527	2013-07-08 05:26:53.055527
80	14	9	\N	2013-07-08 05:26:53.062343	2013-07-08 05:26:53.062343
81	1	9	\N	2013-07-08 05:26:53.069206	2013-07-08 05:26:53.069206
82	19	9	\N	2013-07-08 05:26:53.076678	2013-07-08 05:26:53.076678
83	17	9	\N	2013-07-08 05:26:53.083564	2013-07-08 05:26:53.083564
84	15	9	\N	2013-07-08 05:26:53.090439	2013-07-08 05:26:53.090439
85	36	9	\N	2013-07-08 05:26:53.097421	2013-07-08 05:26:53.097421
86	13	9	\N	2013-07-08 05:26:53.104125	2013-07-08 05:26:53.104125
87	34	9	\N	2013-07-08 05:26:53.110912	2013-07-08 05:26:53.110912
88	9	9	\N	2013-07-08 05:26:53.11761	2013-07-08 05:26:53.11761
89	22	9	\N	2013-07-08 05:26:53.124173	2013-07-08 05:26:53.124173
90	35	9	\N	2013-07-08 05:26:53.130787	2013-07-08 05:26:53.130787
91	23	9	\N	2013-07-08 05:26:53.137255	2013-07-08 05:26:53.137255
92	8	9	\N	2013-07-08 05:26:53.143763	2013-07-08 05:26:53.143763
93	10	9	\N	2013-07-08 05:26:53.150351	2013-07-08 05:26:53.150351
94	37	9	\N	2013-07-08 05:26:53.156824	2013-07-08 05:26:53.156824
95	21	9	\N	2013-07-08 05:26:53.16335	2013-07-08 05:26:53.16335
96	20	9	\N	2013-07-08 05:26:53.16981	2013-07-08 05:26:53.16981
97	3	9	\N	2013-07-08 05:26:53.176472	2013-07-08 05:26:53.176472
98	6	9	\N	2013-07-08 05:26:53.183373	2013-07-08 05:26:53.183373
99	2	9	\N	2013-07-08 05:26:53.190089	2013-07-08 05:26:53.190089
100	4	9	\N	2013-07-08 05:26:53.196695	2013-07-08 05:26:53.196695
101	38	10	\N	2013-07-08 05:28:38.618999	2013-07-08 05:28:38.618999
102	11	10	\N	2013-07-08 05:28:38.627026	2013-07-08 05:28:38.627026
103	16	10	\N	2013-07-08 05:28:38.633836	2013-07-08 05:28:38.633836
104	7	10	\N	2013-07-08 05:28:38.64064	2013-07-08 05:28:38.64064
105	14	10	\N	2013-07-08 05:28:38.647633	2013-07-08 05:28:38.647633
106	1	10	\N	2013-07-08 05:28:38.654385	2013-07-08 05:28:38.654385
107	19	10	\N	2013-07-08 05:28:38.661151	2013-07-08 05:28:38.661151
108	36	10	\N	2013-07-08 05:28:38.667948	2013-07-08 05:28:38.667948
109	13	10	\N	2013-07-08 05:28:38.674588	2013-07-08 05:28:38.674588
110	34	10	\N	2013-07-08 05:28:38.681318	2013-07-08 05:28:38.681318
111	22	10	\N	2013-07-08 05:28:38.687969	2013-07-08 05:28:38.687969
112	35	10	\N	2013-07-08 05:28:38.695028	2013-07-08 05:28:38.695028
113	9	10	\N	2013-07-08 05:28:38.701728	2013-07-08 05:28:38.701728
114	21	10	\N	2013-07-08 05:28:38.708402	2013-07-08 05:28:38.708402
115	3	10	\N	2013-07-08 05:28:38.715055	2013-07-08 05:28:38.715055
116	6	10	\N	2013-07-08 05:28:38.721709	2013-07-08 05:28:38.721709
117	2	10	\N	2013-07-08 05:28:38.728421	2013-07-08 05:28:38.728421
118	17	10	\N	2013-07-08 05:28:38.73511	2013-07-08 05:28:38.73511
119	15	10	\N	2013-07-08 05:28:38.7417	2013-07-08 05:28:38.7417
120	23	10	\N	2013-07-08 05:28:38.748342	2013-07-08 05:28:38.748342
121	8	10	\N	2013-07-08 05:28:38.754969	2013-07-08 05:28:38.754969
122	10	10	\N	2013-07-08 05:28:38.76179	2013-07-08 05:28:38.76179
123	37	10	\N	2013-07-08 05:28:38.76852	2013-07-08 05:28:38.76852
124	20	10	\N	2013-07-08 05:28:38.77541	2013-07-08 05:28:38.77541
125	4	10	\N	2013-07-08 05:28:38.78219	2013-07-08 05:28:38.78219
126	38	11	\N	2013-07-08 05:30:50.996637	2013-07-08 05:30:50.996637
127	11	11	\N	2013-07-08 05:30:51.011775	2013-07-08 05:30:51.011775
128	16	11	\N	2013-07-08 05:30:51.031679	2013-07-08 05:30:51.031679
129	7	11	\N	2013-07-08 05:30:51.04667	2013-07-08 05:30:51.04667
130	14	11	\N	2013-07-08 05:30:51.054128	2013-07-08 05:30:51.054128
131	1	11	\N	2013-07-08 05:30:51.06155	2013-07-08 05:30:51.06155
132	19	11	\N	2013-07-08 05:30:51.068681	2013-07-08 05:30:51.068681
133	36	11	\N	2013-07-08 05:30:51.075797	2013-07-08 05:30:51.075797
134	13	11	\N	2013-07-08 05:30:51.082926	2013-07-08 05:30:51.082926
135	34	11	\N	2013-07-08 05:30:51.089922	2013-07-08 05:30:51.089922
136	35	11	\N	2013-07-08 05:30:51.097025	2013-07-08 05:30:51.097025
137	9	11	\N	2013-07-08 05:30:51.10406	2013-07-08 05:30:51.10406
138	21	11	\N	2013-07-08 05:30:51.111229	2013-07-08 05:30:51.111229
139	3	11	\N	2013-07-08 05:30:51.118064	2013-07-08 05:30:51.118064
140	2	11	\N	2013-07-08 05:30:51.125195	2013-07-08 05:30:51.125195
141	17	11	\N	2013-07-08 05:30:51.1322	2013-07-08 05:30:51.1322
142	10	11	\N	2013-07-08 05:30:51.139097	2013-07-08 05:30:51.139097
143	22	11	\N	2013-07-08 05:30:51.146264	2013-07-08 05:30:51.146264
144	6	11	\N	2013-07-08 05:30:51.153584	2013-07-08 05:30:51.153584
145	15	11	\N	2013-07-08 05:30:51.160848	2013-07-08 05:30:51.160848
146	23	11	\N	2013-07-08 05:30:51.167839	2013-07-08 05:30:51.167839
147	8	11	\N	2013-07-08 05:30:51.174829	2013-07-08 05:30:51.174829
148	37	11	\N	2013-07-08 05:30:51.181938	2013-07-08 05:30:51.181938
149	20	11	\N	2013-07-08 05:30:51.189305	2013-07-08 05:30:51.189305
150	4	11	\N	2013-07-08 05:30:51.197853	2013-07-08 05:30:51.197853
151	22	12	\N	2013-07-08 05:33:00.711822	2013-07-08 05:33:00.711822
152	6	12	\N	2013-07-08 05:33:00.72053	2013-07-08 05:33:00.72053
153	15	12	\N	2013-07-08 05:33:00.727914	2013-07-08 05:33:00.727914
154	23	12	\N	2013-07-08 05:33:00.735057	2013-07-08 05:33:00.735057
155	37	12	\N	2013-07-08 05:33:00.742137	2013-07-08 05:33:00.742137
156	20	12	\N	2013-07-08 05:33:00.749255	2013-07-08 05:33:00.749255
157	4	12	\N	2013-07-08 05:33:00.756364	2013-07-08 05:33:00.756364
158	38	12	\N	2013-07-08 05:33:00.76352	2013-07-08 05:33:00.76352
159	11	12	\N	2013-07-08 05:33:00.770549	2013-07-08 05:33:00.770549
160	16	12	\N	2013-07-08 05:33:00.777387	2013-07-08 05:33:00.777387
161	7	12	\N	2013-07-08 05:33:00.784137	2013-07-08 05:33:00.784137
162	14	12	\N	2013-07-08 05:33:00.790808	2013-07-08 05:33:00.790808
163	1	12	\N	2013-07-08 05:33:00.79755	2013-07-08 05:33:00.79755
164	19	12	\N	2013-07-08 05:33:00.804517	2013-07-08 05:33:00.804517
165	36	12	\N	2013-07-08 05:33:00.811456	2013-07-08 05:33:00.811456
166	13	12	\N	2013-07-08 05:33:00.818192	2013-07-08 05:33:00.818192
167	34	12	\N	2013-07-08 05:33:00.824892	2013-07-08 05:33:00.824892
168	35	12	\N	2013-07-08 05:33:00.831634	2013-07-08 05:33:00.831634
169	9	12	\N	2013-07-08 05:33:00.838423	2013-07-08 05:33:00.838423
170	21	12	\N	2013-07-08 05:33:00.845116	2013-07-08 05:33:00.845116
171	3	12	\N	2013-07-08 05:33:00.851843	2013-07-08 05:33:00.851843
172	2	12	\N	2013-07-08 05:33:00.858457	2013-07-08 05:33:00.858457
173	17	12	\N	2013-07-08 05:33:00.865265	2013-07-08 05:33:00.865265
174	10	12	\N	2013-07-08 05:33:00.872102	2013-07-08 05:33:00.872102
175	8	12	\N	2013-07-08 05:33:00.878773	2013-07-08 05:33:00.878773
176	22	13	\N	2013-07-08 05:35:21.922978	2013-07-08 05:35:21.922978
177	6	13	\N	2013-07-08 05:35:21.934405	2013-07-08 05:35:21.934405
178	20	13	\N	2013-07-08 05:35:21.941801	2013-07-08 05:35:21.941801
179	15	13	\N	2013-07-08 05:35:21.948733	2013-07-08 05:35:21.948733
180	23	13	\N	2013-07-08 05:35:21.95554	2013-07-08 05:35:21.95554
181	38	13	\N	2013-07-08 05:35:21.962426	2013-07-08 05:35:21.962426
182	37	13	\N	2013-07-08 05:35:21.969198	2013-07-08 05:35:21.969198
183	4	13	\N	2013-07-08 05:35:21.975788	2013-07-08 05:35:21.975788
184	7	13	\N	2013-07-08 05:35:21.982419	2013-07-08 05:35:21.982419
185	11	13	\N	2013-07-08 05:35:21.989112	2013-07-08 05:35:21.989112
186	16	13	\N	2013-07-08 05:35:21.995771	2013-07-08 05:35:21.995771
187	14	13	\N	2013-07-08 05:35:22.002588	2013-07-08 05:35:22.002588
188	19	13	\N	2013-07-08 05:35:22.009483	2013-07-08 05:35:22.009483
189	1	13	\N	2013-07-08 05:35:22.016313	2013-07-08 05:35:22.016313
190	36	13	\N	2013-07-08 05:35:22.022922	2013-07-08 05:35:22.022922
191	13	13	\N	2013-07-08 05:35:22.029573	2013-07-08 05:35:22.029573
192	34	13	\N	2013-07-08 05:35:22.036095	2013-07-08 05:35:22.036095
193	35	13	\N	2013-07-08 05:35:22.042594	2013-07-08 05:35:22.042594
194	9	13	\N	2013-07-08 05:35:22.049248	2013-07-08 05:35:22.049248
195	21	13	\N	2013-07-08 05:35:22.055845	2013-07-08 05:35:22.055845
196	3	13	\N	2013-07-08 05:35:22.06253	2013-07-08 05:35:22.06253
197	2	13	\N	2013-07-08 05:35:22.069298	2013-07-08 05:35:22.069298
198	17	13	\N	2013-07-08 05:35:22.076265	2013-07-08 05:35:22.076265
199	10	13	\N	2013-07-08 05:35:22.082727	2013-07-08 05:35:22.082727
200	8	13	\N	2013-07-08 05:35:22.089384	2013-07-08 05:35:22.089384
201	22	14	\N	2013-07-08 05:37:49.747247	2013-07-08 05:37:49.747247
202	20	14	\N	2013-07-08 05:37:49.756054	2013-07-08 05:37:49.756054
203	15	14	\N	2013-07-08 05:37:49.763336	2013-07-08 05:37:49.763336
204	23	14	\N	2013-07-08 05:37:49.770715	2013-07-08 05:37:49.770715
205	37	14	\N	2013-07-08 05:37:49.778291	2013-07-08 05:37:49.778291
206	4	14	\N	2013-07-08 05:37:49.785793	2013-07-08 05:37:49.785793
207	16	14	\N	2013-07-08 05:37:49.793272	2013-07-08 05:37:49.793272
208	1	14	\N	2013-07-08 05:37:49.800777	2013-07-08 05:37:49.800777
209	36	14	\N	2013-07-08 05:37:49.807807	2013-07-08 05:37:49.807807
210	13	14	\N	2013-07-08 05:37:49.81463	2013-07-08 05:37:49.81463
211	9	14	\N	2013-07-08 05:37:49.821368	2013-07-08 05:37:49.821368
212	34	14	\N	2013-07-08 05:37:49.828089	2013-07-08 05:37:49.828089
213	35	14	\N	2013-07-08 05:37:49.834729	2013-07-08 05:37:49.834729
214	21	14	\N	2013-07-08 05:37:49.841543	2013-07-08 05:37:49.841543
215	6	14	\N	2013-07-08 05:37:49.848313	2013-07-08 05:37:49.848313
216	38	14	\N	2013-07-08 05:37:49.855126	2013-07-08 05:37:49.855126
217	7	14	\N	2013-07-08 05:37:49.861942	2013-07-08 05:37:49.861942
218	11	14	\N	2013-07-08 05:37:49.868754	2013-07-08 05:37:49.868754
219	14	14	\N	2013-07-08 05:37:49.875561	2013-07-08 05:37:49.875561
220	19	14	\N	2013-07-08 05:37:49.882228	2013-07-08 05:37:49.882228
221	3	14	\N	2013-07-08 05:37:49.88893	2013-07-08 05:37:49.88893
222	2	14	\N	2013-07-08 05:37:49.895744	2013-07-08 05:37:49.895744
223	17	14	\N	2013-07-08 05:37:49.902607	2013-07-08 05:37:49.902607
224	10	14	\N	2013-07-08 05:37:49.909661	2013-07-08 05:37:49.909661
225	8	14	\N	2013-07-08 05:37:49.976282	2013-07-08 05:37:49.976282
226	22	15	\N	2013-07-08 05:43:15.74749	2013-07-08 05:43:15.74749
227	20	15	\N	2013-07-08 05:43:15.756007	2013-07-08 05:43:15.756007
228	15	15	\N	2013-07-08 05:43:15.763934	2013-07-08 05:43:15.763934
229	23	15	\N	2013-07-08 05:43:15.771421	2013-07-08 05:43:15.771421
230	37	15	\N	2013-07-08 05:43:15.77865	2013-07-08 05:43:15.77865
231	4	15	\N	2013-07-08 05:43:15.785767	2013-07-08 05:43:15.785767
232	16	15	\N	2013-07-08 05:43:15.792827	2013-07-08 05:43:15.792827
233	1	15	\N	2013-07-08 05:43:15.799816	2013-07-08 05:43:15.799816
234	36	15	\N	2013-07-08 05:43:15.806765	2013-07-08 05:43:15.806765
235	13	15	\N	2013-07-08 05:43:15.814012	2013-07-08 05:43:15.814012
236	9	15	\N	2013-07-08 05:43:15.8211	2013-07-08 05:43:15.8211
237	34	15	\N	2013-07-08 05:43:15.828058	2013-07-08 05:43:15.828058
238	35	15	\N	2013-07-08 05:43:15.835065	2013-07-08 05:43:15.835065
239	21	15	\N	2013-07-08 05:43:15.842143	2013-07-08 05:43:15.842143
240	14	15	\N	2013-07-08 05:43:15.84905	2013-07-08 05:43:15.84905
241	19	15	\N	2013-07-08 05:43:15.856087	2013-07-08 05:43:15.856087
242	3	15	\N	2013-07-08 05:43:15.863129	2013-07-08 05:43:15.863129
243	6	15	\N	2013-07-08 05:43:15.870287	2013-07-08 05:43:15.870287
244	38	15	\N	2013-07-08 05:43:15.87771	2013-07-08 05:43:15.87771
245	7	15	\N	2013-07-08 05:43:15.884792	2013-07-08 05:43:15.884792
246	11	15	\N	2013-07-08 05:43:15.891783	2013-07-08 05:43:15.891783
247	2	15	\N	2013-07-08 05:43:15.898881	2013-07-08 05:43:15.898881
248	17	15	\N	2013-07-08 05:43:15.906055	2013-07-08 05:43:15.906055
249	10	15	\N	2013-07-08 05:43:15.913279	2013-07-08 05:43:15.913279
250	8	15	\N	2013-07-08 05:43:15.920431	2013-07-08 05:43:15.920431
251	36	16	17	2013-07-08 08:34:14.069538	2013-07-08 08:34:14.069538
252	10	16	20	2013-07-08 08:38:21.193886	2013-07-08 08:38:21.193886
253	8	16	22	2013-07-08 14:17:00.130757	2013-07-08 14:17:00.130757
254	19	16	\N	2013-07-09 02:59:21.282207	2013-07-09 02:59:21.282207
255	11	18	23	2013-07-11 20:17:06.457985	2013-07-11 20:17:06.457985
256	2	18	\N	2013-07-11 20:26:38.082885	2013-07-11 20:26:38.082885
257	4	18	39	2013-07-11 20:27:07.304931	2013-07-11 20:27:07.304931
258	19	18	\N	2013-07-12 16:47:54.828675	2013-07-12 16:47:54.828675
259	36	18	17	2013-07-15 21:41:00.276047	2013-07-15 21:41:00.276047
260	13	18	31	2013-07-15 21:43:29.323485	2013-07-15 21:43:29.323485
261	34	1	\N	2013-07-18 00:11:53.16071	2013-07-18 00:11:53.16071
262	14	21	\N	2013-07-18 14:33:05.99417	2013-07-18 14:33:05.99417
263	13	22	\N	2013-07-23 00:14:09.916536	2013-07-23 00:14:09.916536
264	19	31	\N	2013-07-23 19:36:21.65907	2013-07-23 19:36:21.65907
265	16	31	\N	2013-07-23 19:51:04.147282	2013-07-23 19:51:04.147282
266	1	31	\N	2013-07-23 19:51:04.159439	2013-07-23 19:51:04.159439
267	36	31	\N	2013-07-23 19:51:04.167946	2013-07-23 19:51:04.167946
268	19	1	\N	2013-07-23 22:53:32.417857	2013-07-23 22:53:32.417857
269	23	34	\N	2013-07-24 16:28:37.715145	2013-07-24 16:28:37.715145
270	34	35	\N	2013-07-24 16:30:15.807797	2013-07-24 16:30:15.807797
271	8	1	22	2013-07-24 17:09:02.517995	2013-07-24 17:09:02.517995
272	37	36	\N	2013-07-24 17:22:12.632881	2013-07-24 17:22:12.632881
273	1	36	\N	2013-07-24 17:22:12.644851	2013-07-24 17:22:12.644851
274	6	36	\N	2013-07-24 17:22:12.67303	2013-07-24 17:22:12.67303
275	21	36	\N	2013-07-24 17:22:12.680898	2013-07-24 17:22:12.680898
276	19	36	\N	2013-07-24 17:22:12.688298	2013-07-24 17:22:12.688298
277	4	1	39	2013-07-24 18:05:51.649739	2013-07-24 18:05:51.649739
278	15	35	28	2013-07-24 18:38:06.872345	2013-07-24 18:38:06.872345
279	17	35	18	2013-07-24 19:06:48.445858	2013-07-24 19:06:48.445858
280	4	37	39	2013-07-24 21:05:43.511838	2013-07-24 21:05:43.511838
281	17	38	18	2013-07-24 21:39:46.953684	2013-07-24 21:39:46.953684
282	14	38	29	2013-07-24 23:25:14.186603	2013-07-24 23:25:14.186603
\.


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('followers_id_seq', 282, true);


--
-- Data for Name: goods_donations; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY goods_donations (id, user_id, need_id, cause_id, description, quantity, cash_value, created_at, updated_at) FROM stdin;
1	17	40	19	\N	\N	\N	2013-07-18 17:04:53.765466	2013-07-18 17:04:53.765466
2	32	40	19	\N	\N	\N	2013-07-23 20:34:18.53906	2013-07-23 20:34:18.53906
3	32	40	19	\N	\N	\N	2013-07-23 20:39:02.992471	2013-07-23 20:39:02.992471
4	32	40	19	\N	\N	\N	2013-07-23 20:41:50.012752	2013-07-23 20:41:50.012752
5	31	40	19	\N	\N	\N	2013-07-23 21:18:05.727516	2013-07-23 21:18:05.727516
6	1	40	19	\N	\N	\N	2013-07-23 23:41:21.629614	2013-07-23 23:41:21.629614
7	1	40	19	\N	\N	\N	2013-07-23 23:45:26.613369	2013-07-23 23:45:26.613369
8	1	40	19	\N	\N	\N	2013-07-23 23:45:40.051425	2013-07-23 23:45:40.051425
9	1	40	19	\N	\N	\N	2013-07-23 23:46:25.929768	2013-07-23 23:46:25.929768
10	1	40	19	\N	\N	\N	2013-07-23 23:50:08.743492	2013-07-23 23:50:08.743492
\.


--
-- Name: goods_donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('goods_donations_id_seq', 10, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY locations (id, created_at, updated_at, cause_id, latitude, longitude, name, address_line_one, address_line_two, city, region, postal_code, country) FROM stdin;
1	2013-07-01 20:11:39.164469	2013-07-01 20:11:39.164469	1	41.7662320000000022	-87.8006550000000061	Main Office	7530 N. Harlem Ave	\N	Chicago	Illinois	60610	US
2	2013-07-01 20:11:39.551271	2013-07-01 20:11:39.551271	8	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St	\N	Chicago 	Illinois	60610	US
3	2013-07-01 20:11:39.820909	2013-07-01 20:11:39.820909	3	\N	\N	Main Office	2350 N. Clark Ave	\N	Chicago	Illinois	60610	US
4	2013-07-01 20:11:40.095932	2013-07-01 20:11:40.095932	6	41.9037179999999978	-87.6481330000000014	Main Office	1200 W. Division St	\N	Chicago 	Illinois	60610	US
5	2013-07-01 20:11:40.369579	2013-07-01 20:11:40.369579	11	\N	\N	Main Office	2350 N. Clark Ave	\N	Niles	Illinois	60610	US
6	2013-07-01 20:11:40.656869	2013-07-01 20:11:40.656869	2	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave	\N	Schaumburg	Illinois	60610	US
7	2013-07-01 20:11:40.937775	2013-07-01 20:11:40.937775	10	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave	\N	Chicago 	Illinois	60610	US
8	2013-07-01 20:11:40.944557	2013-07-01 20:11:40.944557	7	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St	\N	Chicago 	Illinois	60610	US
9	2013-07-01 20:11:41.220104	2013-07-01 20:11:41.220104	17	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave	\N	Oak Park	Illinois	60610	US
10	2013-07-01 20:11:41.573718	2013-07-01 20:11:41.573718	19	\N	\N	Main Office	3800 S. Halsted St	\N	Libertyville	Illinois	60610	US
11	2013-07-01 20:11:41.986732	2013-07-01 20:11:41.986732	15	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St	\N	Chicago	Illinois	60610	US
12	2013-07-01 20:11:41.994028	2013-07-01 20:11:41.994028	13	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave	\N	Chicago 	Illinois	60610	US
13	2013-07-01 20:11:42.260803	2013-07-01 20:11:42.260803	23	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave	\N	Chicago	Illinois	60610	US
14	2013-07-01 20:11:42.267786	2013-07-01 20:11:42.267786	16	41.7662320000000022	-87.8006550000000061	Main Office	7530 N. Harlem Ave	\N	Chicago	Illinois	60610	US
15	2013-07-01 20:11:42.273573	2013-07-01 20:11:42.273573	21	41.7662320000000022	-87.8006550000000061	Main Office	7530 N. Harlem Ave	\N	Chicago	Illinois	60610	US
16	2013-07-01 20:11:42.279267	2013-07-01 20:11:42.279267	22	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave	\N	Chicago	Illinois	60610	US
17	2013-07-01 20:11:42.285393	2013-07-01 20:11:42.285393	9	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St	\N	Chicago 	Illinois	60610	US
18	2013-07-01 20:11:42.29135	2013-07-01 20:11:42.29135	35	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave	\N	Chicago	Illinois	60610	US
19	2013-07-01 20:11:42.583759	2013-07-01 20:11:42.583759	34	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St	\N	Chicago	IL	60610	US
20	2013-07-01 20:11:42.867	2013-07-01 20:11:42.867	20	\N	\N	Main Office	3800 S. Halsted St	\N	Winnetka	Illinois	60610	US
21	2013-07-01 20:11:43.138586	2013-07-01 20:11:43.138586	14	\N	\N	Main Office	7530 N. Harlem Ave	\N	Homewood	Illinois	60610	US
22	2013-07-01 20:11:43.146	2013-07-01 20:11:43.146	4	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St	\N	Chicago 	Illinois	60610	US
23	2013-07-01 20:11:43.152063	2013-07-01 20:11:43.152063	37	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave	\N	Chicago	Illinois	60610	US
24	2013-07-01 20:11:43.418093	2013-07-01 20:11:43.418093	36	41.9037179999999978	-87.6481330000000014	Main Office	1200 W. Division St	\N	Chicago	Illinois	60610	US
25	2013-07-01 20:11:43.706992	2013-07-01 20:11:43.706992	38	41.7662320000000022	-87.8006550000000061	Main Office	7530 N. Harlem Ave	\N	Chicago	IL	60610	US
26	2013-07-24 19:53:37.528685	2013-07-24 19:53:37.528685	39	41.9037179999999978	-87.6481330000000014	Main Office	1200 W. Division St		Chicago	Illinois	60610	US
27	2013-07-24 19:57:09.747821	2013-07-24 19:57:09.747821	40	41.9037179999999978	-87.6481330000000014	Main Office	1200 W. Division St		Chicago	Illinois	60610	US
28	2013-07-24 20:02:14.94302	2013-07-24 20:02:14.94302	41	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St		Chicago	Illinois	60610	US
29	2013-07-24 20:08:30.182172	2013-07-24 20:08:30.182172	42	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St		Chicago	Illinois	60610	US
30	2013-07-24 20:14:39.110207	2013-07-24 20:14:39.110207	43	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave		Chicago	Illinois	60610	US
31	2013-07-24 20:18:24.85068	2013-07-24 20:18:24.85068	44	41.8985819999999975	-87.6371000000000038	Main Office	2350 N. Clark Ave		Chicago	Illinois	60610	US
32	2013-07-24 20:22:47.108093	2013-07-24 20:22:47.108093	45	41.8985819999999975	-87.6371000000000038	Main Office	2350 N. Clark Ave		Chicago	Illinois	60610	US
33	2013-07-24 20:50:06.158913	2013-07-24 20:50:06.158913	46	41.7662320000000022	-87.8006550000000061	Main Office	7530 N. Harlem Ave		Chicago	Illinois	60610	US
34	2013-07-24 20:53:21.659393	2013-07-24 20:53:21.659393	47	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St		Chicago	Illinois	60610	US
35	2013-07-24 20:57:57.027339	2013-07-24 20:57:57.027339	48	41.9037179999999978	-87.6481330000000014	Main Office	1200 W. Division St		Chicago	Illinois	60610	US
37	2013-07-24 21:07:37.993737	2013-07-24 21:07:37.993737	50	41.7662320000000022	-87.8006550000000061	Main Office	7530 N. Harlem Ave		Chicago	Illinois	60610	US
38	2013-07-24 21:11:46.833221	2013-07-24 21:11:46.833221	52	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave		Chicago	Illinois	60610	US
39	2013-07-24 21:15:40.409807	2013-07-24 21:15:40.409807	53	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St		Chicago	Illinois	60610	US
40	2013-07-24 21:21:34.672807	2013-07-24 21:21:34.672807	54	41.7662320000000022	-87.8006550000000061	Main Office	7530 N. Harlem Ave		Chicago	Illinois	60610	US
41	2013-07-24 21:24:36.700072	2013-07-24 21:24:36.700072	55	41.9037179999999978	-87.6481330000000014	Main Office	1200 W. Division St		Chicago	Illinois	60610	US
42	2013-07-24 21:28:38.022237	2013-07-24 21:28:38.022237	56	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave		Chicago	Illinois	60610	US
43	2013-07-24 21:32:33.781445	2013-07-24 21:32:33.781445	57	41.9037179999999978	-87.6481330000000014	Main Office	1200 W. Division St		Chicago	Illinois	60610	US
44	2013-07-24 21:36:09.466198	2013-07-24 21:36:09.466198	58	41.8985819999999975	-87.6371000000000038	Main Office	2350 N. Clark Ave		Chicago	Illinois	60610	US
45	2013-07-24 21:42:19.173722	2013-07-24 21:42:19.173722	59	41.8255410000000012	-87.6461240000000004	Main Office	3800 S. Halsted St		Chicago	Illinois	60610	US
46	2013-07-24 21:47:49.644369	2013-07-24 21:47:49.644369	60	41.9037179999999978	-87.6481330000000014	Main Office	1200 W. Division St		Chicago	Illinois	60610	US
47	2013-07-24 21:54:28.450804	2013-07-24 21:54:28.450804	61	41.8985819999999975	-87.6371000000000038	Main Office	2350 N. Clark Ave		Chicago	Illinois	60610	US
48	2013-07-24 22:03:35.657331	2013-07-24 22:03:35.657331	62	41.8964319999999972	-87.6430529999999948	Main Office	600 W. Chicago Ave		Chicago	Illinois	60610	US
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('locations_id_seq', 48, true);


--
-- Data for Name: needs; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY needs (id, name, type_of_need, cause_id, description, start_date, end_date, address, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, created_at, updated_at, campaign_id, settings, location_id) FROM stdin;
17	Lost Boyz Inc. Awareness Campaign	followers	36	 Help Lost Boyz Inc. to decrease violence and improve the social conditions among the youth in the South Shore community. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:04:45.907108	2013-07-07 17:34:48.798831	\N	\N	\N
60	\N	followers	59	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:42:19.184454	2013-07-24 21:42:19.184454	\N	\N	\N
61	\N	followers	60	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:47:49.6551	2013-07-24 21:47:49.6551	\N	\N	\N
62	\N	followers	61	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:54:28.464476	2013-07-24 21:54:28.464476	\N	\N	\N
63	\N	followers	62	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 22:03:35.685175	2013-07-24 22:03:35.685175	\N	\N	\N
18	Go Farther Foundation Awareness Campaign	followers	17	Help Go Father Foundation spread awareness of the constraints of poverty and the ability to break free and gain experiences that propel them toward their highest aspirations.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:11:55.507174	2013-07-07 17:34:48.902809	\N	\N	\N
19	Go Farther Foundation Fund Raiser	cash_donations	17	Farther Foundation continually raises money for our scholarship program and general operating needs. Over 90% of all donations go directly toward our scholarship program that allow deserving students to have life changing experiences.	\N	\N		\N	\N	\N	\N	2013-06-27 22:13:35.139214	2013-07-07 17:34:48.90663	\N	\N	\N
20	Chicago Hopes Awareness Campaign	followers	10	Help Chicago Hopes for Kids spread awareness about homelessness in Chicago and how children need are effected.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:31:11.410126	2013-07-07 17:34:48.909206	\N	\N	\N
21	Women Divine Awareness Campaign 	followers	1	Help women Divine to effectively impact the lives of young women through academic enhancement, leadership development, financial literacy and cultural enrichment and spread awareness of their organization.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:38:05.978954	2013-07-07 17:34:48.911084	\N	\N	\N
22	Community Building Tutors Awareness Campaign 	followers	8	Help Community Building Tutors to strengthen communities through the implementation of innovative after school programming involving elementary school students, high-school students, and working professionals emphasizing civic engagement. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:41:41.78663	2013-07-07 17:34:48.91278	\N	\N	\N
5	Chicago Photography Center Needs Volunteers	volunteers	22	The Chicago Photography Center needs volunteers to help with administrative tasks , gallery operations, community outreach, public relations and marketing, facility maintenance, graphic design, and volunteer coordination.	\N	\N	3301 N Lincoln Ave Chicago IL 60657			\N	\N	2013-06-27 19:06:58.502615	2013-07-07 17:34:48.915049	\N	\N	\N
6	Asher James Congenital Heart Disease & Thrombosis Awareness Campaign 	followers	2	Help Asher James Congenital Heart Disease & Thrombosis Foundation spread awareness of health risks of congenital heart disease and thrombosis. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 19:26:01.827568	2013-07-07 17:34:48.917312	\N	\N	\N
4	Chicago Photography Center Awareness Campaign	followers	22	Help Chicago Photography Center foster a broad community of photographers who practice and appreciate the art of photography. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 15:51:16.988491	2013-07-07 17:34:48.919276	\N	\N	\N
8	Care & Care Fund Raiser	cash_donations	9	Care and Care needs donations to operate Healthcare, Educational and Nutritional facilities nationally/internationally and form partnerships with other caregivers and institutions in developing countries to improve the delivery and availability of healthcare services by operating CARE & CARE facilities or co-operate with other entities by providing appropriate medical equipment, expertise and related supplies. To establish nutrition centers for the community to fulfill women, children and elders to overcome malnutrition needs within the community creating healthy communities and healthy productive individuals. To operate Educational Institutions where possible nationally, internationally or creating partnerships and alliances with other institutions to provide direct & educational services. To establish an internet based international community center to disseminate information and knowledge, facilitate communication and promote friendship, good will and to act as a bridge between resources and immediate needs.	\N	\N		\N	\N	\N	\N	2013-06-27 19:45:53.623062	2013-07-07 17:34:48.921821	\N	\N	\N
11	Perspective Charter Schools Fund Raiser	cash_donations	37	Help Perspective Charter Schools raise $2 million dollars to subsidize education expenses,which include the cost to recruit and retain the best educators and to cover curriculum costs.	\N	\N		\N	\N	\N	\N	2013-06-27 20:18:33.636914	2013-07-07 17:34:48.923926	\N	\N	\N
12	Do Your P'art Foundation Fund Raiser	cash_donations	20	\r\nOur donations directly impact our students partnerships and art collaborations. The donations fund transportation, art materials and any other resources that the teachers may need for a successful project.	\N	\N		\N	\N	\N	\N	2013-06-27 20:28:09.737939	2013-07-07 17:34:48.925987	\N	\N	\N
13	Bright Promises Fund Raiser	cash_donations	23	Help Bright Promises raise funds. All donations are distributed in equal shares to the schools in our network. Operating costs are met through an endowment, board gifts, and foundation support.	\N	\N		\N	\N	\N	\N	2013-06-27 21:27:13.123841	2013-07-07 17:34:48.927837	\N	\N	\N
14	Women Divine Fund Raiser	cash_donations	1	Help Women Divine raise funds to help their programs. Monetary donations are used to implement the following programs and the coinciding activites that implement each: Future Leaders Executive Management 101 Cultural Exploration Educational Taskforce	\N	\N		\N	\N	\N	\N	2013-06-27 21:34:25.752275	2013-07-07 17:34:48.929822	\N	\N	\N
15	Thyck Troupe Fund Raiser	cash_donations	19	Help the Thyck Troupe Organization raise funds towards their cause.Funds are used as production costs to produce performing arts showcases and health/wellness events for the education, empowerment and enjoyment of the general public -- specifically the full-figured demographic.	\N	\N		\N	\N	\N	\N	2013-06-27 21:51:55.904072	2013-07-07 17:34:48.932678	\N	\N	\N
16	Thyck Troupe needs Volunteers	volunteers	19	Volunteers for our organization can help with specific event duties, including setup/tear down, videography, photography, ticketing, ushering, gift bag distribution, food serving, audiovisual support and multimedia production assistance. Volunteers need to meet with the organization before being assigned to a certain support area.	\N	\N				\N	\N	2013-06-27 22:00:40.376591	2013-07-07 17:34:48.934505	\N	\N	\N
23	In Her Shoes Foundation Awareness Campaign 	followers	11	Help In Her Shoes to reach out to women of all ages and backgrounds – to share ideas, educate, support and inspire one another, in hopes of creating a positive and healthy lifestyle. It seeks to offer women leadership and empowerment abilities that are required to lead successful lives.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:44:37.098165	2013-07-07 17:34:48.93608	\N	\N	\N
24	Association of Horizon Awareness Campaign 	followers	7	Help Association of Horizon spread their message. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:50:03.557233	2013-07-07 17:34:48.938106	\N	\N	\N
25	Bright Promise Foundation Awareness Campaign 	followers	6	Help Bright Promises Foundation creates opportunities for Illinois children to reach their full promise and potential. Help spread their work with organizations that they have developed and delivered programs that provide the foundation for positive lives.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:52:57.295681	2013-07-07 17:34:48.940123	\N	\N	\N
26	Chicago Gateway Green Awareness Campaign	followers	3	Help spread awareness of Chicago Gateway Green's effort in greening and beautifying Chicago's expressways, gateways, and neighborhoods.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:56:35.874303	2013-07-07 17:34:48.941605	\N	\N	\N
27	Thyck Troupe Awareness Campaign	followers	19	Help Thyck Troupe promote and encourage diversity in the arts as it applies to reversing societal stigmas and combating media biases of the full-figured artist, proving that talent, beauty and influence should not be limited to size by spreading their message.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 22:59:18.726423	2013-07-07 17:34:48.94306	\N	\N	\N
28	Literacy Volunteers of Illinois Awareness Campaign	followers	15	Help Literacy Volunteers of Illinois spread reasons why supporting volunteer literacy programs that help families, adults and out-of-school teens increase their literacy skills are so important.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:01:46.122329	2013-07-07 17:34:48.94495	\N	\N	\N
29	Matanya's Hope Awareness Campaign	followers	14	Help Matanya’s Hope spread awareness and message of  eradicating poverty is by educating Kenya’s future: the children, as well as providing other life sustaining programs and opportunities is so important. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:04:19.331329	2013-07-07 17:34:48.947298	\N	\N	\N
30	Human Thread Awareness Campaign	followers	21	Help Human Thread spread their message of a culture of peace, targeting youth through art and educational events/programs. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:08:00.309176	2013-07-07 17:34:48.94962	\N	\N	\N
31	The Miracle Center Awareness Campaign	followers	13	Help The Miracle Center spread the reasons why helping children, youth, and families particularly through the performing arts to grow spiritually, mentally, emotionally, socially and physically during after-school and out-of- school programs is so important.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:09:49.401913	2013-07-07 17:34:48.951653	\N	\N	\N
32	Dreams for Kids Awareness Campaign	followers	16	Help Dreams for Kids spread awareness why replacing charity with opportunity for at-risk youth through service, leadership and social activities that inspire them to fearlessly pursue their dreams and compassionately change the world is so important. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:11:46.587338	2013-07-07 17:34:48.953423	\N	\N	\N
33	Do Your P'Art Awareness Campaign	followers	20	Help Do Your P'Art Foundation spread awareness of how building a bridge of cultural understanding can occur through art.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:14:23.796003	2013-07-07 17:34:48.955325	\N	\N	\N
34	Bright Promises Fund Awareness Campaign	followers	23	Help Bright Promises Fund spread awareness of why strengthening and sustaining partner Christian schools by generating new sources of revenue so that more families may experience and benefit from urban Christian education is important. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:20:27.19825	2013-07-07 17:34:48.957628	\N	\N	\N
35	ECCYA Awareness Campaign	followers	35	Help The Empower Community Center for Youth and Adults, (ECCYA) heighten awareness of underprivileged youth and adults in low income communities.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:21:58.067482	2013-07-07 17:34:48.959093	\N	\N	\N
36	The Sports Shed Awareness Campaign	followers	34	Help The Sports Shed spread their message why helping under-resourced kids opportunities to engage in sports and physical activities has a positive impact on their health, self-esteem, work ethic, and sense of belonging. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:24:15.578268	2013-07-07 17:34:48.961039	\N	\N	\N
10	Care & Care Awareness Campaign	followers	9	Help Care & Care spread awareness of those who are disadvantaged by poverty, disability and age. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 19:49:20.307343	2013-07-07 17:34:48.963196	\N	\N	\N
37	The Wellness Pros Awareness Campaign 	followers	38	Help spread the mission of the Wellness Pros,which is to provide quality fitness services for individuals with mental and physical disabilities. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:28:50.540471	2013-07-07 17:34:48.965453	\N	\N	\N
38	Perspective Charter Schools Awareness Campaign	followers	37	Help Perspective Charter Schools spread their ethical principles of A Disciplined Life®, which prepares students for life in a changing world and helping them further become intellectually reflective, caring and ethical people engaged in a meaningful life.	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:31:19.444925	2013-07-07 17:34:48.967508	\N	\N	\N
39	Irving Park Community Food Pantry Awareness Campaign	followers	4	Help Irving Park Community Food Pantry to increase awareness of hunger related issues to the community at large. 	\N	\N	\N	\N	\N	\N	\N	2013-06-27 23:33:43.666728	2013-07-07 17:34:48.969843	\N	\N	\N
40	We need computers	goods_donations	19	Please give us computers	\N	\N		\N	\N	\N	\N	2013-07-18 16:37:18.749601	2013-07-18 16:37:18.749601	\N	\N	\N
41	\N	followers	39	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 19:53:37.591356	2013-07-24 19:53:37.591356	\N	\N	\N
42	\N	followers	40	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 19:57:09.756882	2013-07-24 19:57:09.756882	\N	\N	\N
43	\N	followers	41	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 20:02:14.95287	2013-07-24 20:02:14.95287	\N	\N	\N
44	\N	followers	42	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 20:08:30.191002	2013-07-24 20:08:30.191002	\N	\N	\N
45	\N	followers	43	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 20:14:39.120914	2013-07-24 20:14:39.120914	\N	\N	\N
46	\N	followers	44	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 20:18:24.861167	2013-07-24 20:18:24.861167	\N	\N	\N
47	\N	followers	45	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 20:22:47.203306	2013-07-24 20:22:47.203306	\N	\N	\N
48	\N	followers	46	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 20:50:06.173498	2013-07-24 20:50:06.173498	\N	\N	\N
49	\N	followers	47	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 20:53:21.669228	2013-07-24 20:53:21.669228	\N	\N	\N
50	\N	followers	48	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 20:57:57.037669	2013-07-24 20:57:57.037669	\N	\N	\N
52	\N	followers	50	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:07:38.007667	2013-07-24 21:07:38.007667	\N	\N	\N
53	\N	followers	52	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:11:46.961219	2013-07-24 21:11:46.961219	\N	\N	\N
54	\N	followers	53	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:15:40.423486	2013-07-24 21:15:40.423486	\N	\N	\N
55	\N	followers	54	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:21:34.684178	2013-07-24 21:21:34.684178	\N	\N	\N
56	\N	followers	55	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:24:36.709449	2013-07-24 21:24:36.709449	\N	\N	\N
57	\N	followers	56	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:28:38.032841	2013-07-24 21:28:38.032841	\N	\N	\N
58	\N	followers	57	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:32:33.846232	2013-07-24 21:32:33.846232	\N	\N	\N
59	\N	followers	58	\N	\N	\N	\N	\N	\N	\N	\N	2013-07-24 21:36:09.479888	2013-07-24 21:36:09.479888	\N	\N	\N
\.


--
-- Name: needs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('needs_id_seq', 63, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: bfi_production
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
20130701070301
20130701080222
20130701081651
20130701191158
20130701213529
20130701213547
20130701221839
20130702201748
20130702231028
20130702231054
20130702231113
20130703044925
20130703050024
20130706031013
20130706032035
20130706032626
20130706061800
20130706062347
20130706064312
20130707012333
20130707013907
20130707015954
20130707063142
20130710160005
20130710191226
20130716161428
20130716161544
20130716192144
20130717043306
20130722185337
20130723185142
20130723214341
20130723220156
20130723220556
20130724175225
20130724212147
20130724222318
20130724231220
20130724235228
20130725013430
\.


--
-- Data for Name: subscribes; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY subscribes (id, created_at, updated_at, first_name, last_name, email) FROM stdin;
\.


--
-- Name: subscribes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('subscribes_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, bio, city, state, level, provider, uid, game_id, fb_token, role, followers_count, cash_donations_count, goods_donations_count, volunteers_count, authentication_token, cause_admin, cause_admin_id) FROM stdin;
3	tim@meetmantra.com	$2a$10$mt0ktTgkRZ2ceFsNIFNs0u2RJFf59GGCQ9gvq.wWwYoZeOIcrpf6.	\N	\N	\N	1	2013-06-28 20:28:29.316422	2013-06-28 20:28:29.316422	38.106.196.126	38.106.196.126	2013-06-28 20:28:24.02664	2013-06-28 20:28:29.318366	tim	henry	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	\N	\N	\N
2	frankv@meetmantra.com	$2a$10$RH.ZPoabgOOoW1WMrZxwpOa5RrjJB2HJxxHnbhpe/qLgMhTGYXlpu	\N	\N	\N	1	2013-06-27 15:29:17.648818	2013-06-27 15:29:17.648818	38.106.196.126	38.106.196.126	2013-06-27 15:29:17.333522	2013-06-28 20:49:11.069703	Francesco	Pinto	frank.jpg	image/jpeg	18961	2013-06-28 20:49:10.804912				0	\N	\N	\N	\N	\N	0	0	0	0	\N	\N	\N
4	jonathan@meetmantra.com	$2a$10$KXnRy3069lFm6XWg1JNH/OfDfm.AzJTBsmG1jrDsb0f8IydnTx5GO	\N	\N	\N	1	2013-06-30 03:20:25.506731	2013-06-30 03:20:25.506731	99.43.68.108	99.43.68.108	2013-06-30 03:20:25.129856	2013-06-30 03:20:25.508757	Jonathan	Soeder	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	\N	\N	\N
5	frangucc3@gmail.com	$2a$10$TzMVko./bbvCw9dtgIG0d.2leldQr0IM2IhbR8OY0teDoo2EeJYK6	\N	\N	\N	1	2013-07-03 22:30:49.79383	2013-07-03 22:30:49.79383	74.62.91.130	74.62.91.130	2013-07-03 22:30:49.347969	2013-07-03 22:30:49.795466	francesco	vittoeio	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	\N	\N	\N
1	ejanderson4@gmail.com	$2a$10$iB.zPTuKpgEWH2EqgXO0HuljlJLFIzpU5T.xFnob5rzJ.kLcL70N6	\N	\N	\N	10	2013-07-24 17:08:18.500611	2013-07-24 15:35:49.887528	38.106.196.126	38.106.196.126	2013-06-19 22:35:20.412067	2013-07-24 17:08:18.501732	Eddie	Anderson	computers.jpg	image/jpeg	17468	2013-06-26 15:59:55.45712		Chicago	 Illinois	0	facebook	13927884	\N	CAACEMHL6hHQBAJdqp9BauYQvrJZCYAjuJ9ZBMqNL0ZBXFstt8gD7JnowFZBnTPG2wpEPKSUwFZBVlkGE1YWmlidQyDFfqNZBIZANt6B7FhqxC1EdTWxVM10eVo6Invj2hnqclrMZBK64IzqL9ua79m0ZC	\N	4	3	5	3	\N	\N	\N
6	lainie+whatever@meetmantra.com	$2a$10$xDchS0BnydTWaDkcTlYsY.D42nKe6kQzq7a69EELD0bv91M3hsKiK	\N	\N	\N	1	2013-07-08 05:16:07.230813	2013-07-08 05:16:07.230813	24.136.18.37	24.136.18.37	2013-07-08 05:16:06.668458	2013-07-08 05:18:11.785038	Kim	Bauer	Moriarty-profile-photo.JPG	image/jpeg	147864	2013-07-08 05:18:11.437711	Hi! My name is Kim and I've been volunteering in Chicago for the past two years! 	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	ga1eJmQGpvddLBN7i3sW	\N	\N
7	lainie+yoyo@meetmantra.com	$2a$10$3/u5QbFczb0.f5lus0ZFHOIDKM6b/NGRSXDzFuiepFCU3Opi6wHFm	\N	\N	\N	1	2013-07-08 05:19:41.6968	2013-07-08 05:19:41.6968	24.136.18.37	24.136.18.37	2013-07-08 05:19:41.18018	2013-07-08 05:21:25.123448	Donna	Winter	profile_picture_by_dezzan_stock-d5m0mms.jpg	image/jpeg	24824	2013-07-08 05:20:07.141467	I love helping with children and students in Chicago. It is my passion to educate youth and provide a better future for our next generation.	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	kusZRqUwmkSyq2yTMdRK	\N	\N
8	lainie+michael@meetmantra.com	$2a$10$w.XdYgu2affahPFl71Osoecu8EUET9XMpXBwhOTHDifx7zfXX9y16	\N	\N	\N	1	2013-07-08 05:22:09.434745	2013-07-08 05:22:09.434745	24.136.18.37	24.136.18.37	2013-07-08 05:22:09.142254	2013-07-08 05:24:20.675334	Brandon	Lennon	headshotid_by_bokogreat_stock-d355xf3.jpg	image/jpeg	42745	2013-07-08 05:22:27.604268	I'm Brandon. I am truly inspired by the nonprofit organizations that have developed in Chicago over the past few years and I am looking to become more involved within the community. 	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	tQgRaogWZhJsmqk9NWby	\N	\N
9	lainie+bros@meetmantra.com	$2a$10$WlMvkENqTrCp8oTDZCGgCejRc87SBgztUnyp9SzQ/dPLmC26U5/Uq	\N	\N	\N	1	2013-07-08 05:25:42.848813	2013-07-08 05:25:42.848813	24.136.18.37	24.136.18.37	2013-07-08 05:25:42.58644	2013-07-08 05:26:53.460063	Carl	Lauden	alvin-profile.jpg	image/jpeg	219700	2013-07-08 05:26:53.205301	I live in Chicago and I am interested for a non-for-profit that needs my help! 	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	1mYLjPYwDPd5MCasjDX3	\N	\N
10	lainie+brown@meetmantra.com	$2a$10$3AcDkYI1kblQRpdElORKeOx6WyVA/Adc5zYCTNo1YAcDNu5dOABzq	\N	\N	\N	1	2013-07-08 05:27:45.64356	2013-07-08 05:27:45.64356	24.136.18.37	24.136.18.37	2013-07-08 05:27:45.102571	2013-07-08 05:28:39.001755	Randy	Brown	photo-1.jpg	image/jpeg	34025	2013-07-08 05:28:38.790227	Greetings! I am Randy and I am excited to get started on United4:Good! 	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	Gh8fyHf41Mj7z87AxaAD	\N	\N
11	lainie+balhejr@meetmantra.com	$2a$10$ChS/Us7cMknNIWAW/GMPveakQ8/B0ieKPuHkhMN.rhMNVUj5vm7rK	\N	\N	\N	1	2013-07-08 05:29:16.692479	2013-07-08 05:29:16.692479	24.136.18.37	24.136.18.37	2013-07-08 05:29:16.398096	2013-07-08 05:30:51.376813	Jessica	Sacker	profile.jpg	image/jpeg	16217	2013-07-08 05:30:51.205935	I love Chicago and I want to help out as many nonprofit organizations as I can. I am mostly interested in women-based organizations. 	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	h9k5tw4LaAkEg9GGYStN	\N	\N
15	lainie+jackson@meetmantra.com	$2a$10$oCNukaSvGzjWqUJIRDTgC.J2vKaHASdgmA4REPkQxLFvcxt62O7D6	\N	\N	\N	1	2013-07-08 05:39:20.22162	2013-07-08 05:39:20.22162	24.136.18.37	24.136.18.37	2013-07-08 05:39:19.924144	2013-07-08 05:43:16.201857	Raymond	Jackson	profile-1.jpg	image/jpeg	51148	2013-07-08 05:43:15.92866	Hello friends. I am Raymond and my passion is giving back. I am glad I found a platform that allows me to find organizations I want to help out with in my community.	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	hxqLGwgdbKwqsCnsrbDV	\N	\N
12	lainie+park@meetmantra.com	$2a$10$hhZKF8LdE28Uk1l5om9Xb.5S3ER9zDU6SeHdwgCLPwPHaVFwnwn9m	\N	\N	\N	1	2013-07-08 05:31:14.175868	2013-07-08 05:31:14.175868	24.136.18.37	24.136.18.37	2013-07-08 05:31:13.701742	2013-07-08 05:33:01.114361	Joseph	Park	photo.jpg	image/jpeg	34973	2013-07-08 05:33:00.886684	What's up! I'm Joseph, but I go by Joe. I have helped out with some nonprofits when I lived in Cleveland and now that I live in Chicago I'm looking to get back into the scene. Unite4:Good is a great way to connect with organizations that I'm interested in! 	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	WShp9RZxpHSysYygRSSv	\N	\N
13	lainie+mish@meetmantra.com	$2a$10$TJaToaRaKzLXZxA1zTuS5OEckwNbwJJG2eN3KonbK/ADZEK6fDUIS	\N	\N	\N	1	2013-07-08 05:33:46.436005	2013-07-08 05:33:46.436005	24.136.18.37	24.136.18.37	2013-07-08 05:33:46.141709	2013-07-08 05:35:22.288912	Reyna	Mish	reyna.jpg	image/jpeg	29843	2013-07-08 05:35:22.097278	Hello, my name is Reyna and I am very eager to be connected with the Bright Promises Fund, Dreams for Kids and Chicago Hopes nonprofits! 	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	Cy53Wrj847efWZGXRx7b	\N	\N
14	lainie+ghiehge@meetmantra.com	$2a$10$agBp1FFG7A1pmNZkrhXCTu9UQYkNGa0/gfUzHOvFaEtBBSk6xsYra	\N	\N	\N	1	2013-07-08 05:36:11.610281	2013-07-08 05:36:11.610281	24.136.18.37	24.136.18.37	2013-07-08 05:36:11.272467	2013-07-08 05:37:50.160796	Jerry	Gorden	profile-2.jpg	image/jpeg	183006	2013-07-08 05:37:49.985611	Hi Everyone! Signed up for this site because my wife Beth and I are interested in giving back to the community. Hoping to find some great organizations!	Chicago	Illinois	0	\N	\N	\N	\N	\N	25	0	0	0	Geb1PiUzJn7TgpoDjNMR	\N	\N
21	amy@meetmantra.com	$2a$10$mW16gcD9Guidw2PK.EJCY.o9BWb/Q0ZoE7GSLMrC21DwtIXiTk0cK	\N	\N	\N	1	2013-07-18 14:22:55.64635	2013-07-18 14:22:55.64635	38.106.196.126	38.106.196.126	2013-07-18 14:22:55.381927	2013-07-18 14:22:55.647579	Amy	Johnson	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	0	0	0	KNWAbTs46pFAqDpDQzFb	\N	\N
25	ejandersons4@gmail.com	$2a$10$m8BVbxfxowLyu..vDJE2W.M.alzHfDYpBCZpvJ/q7kjf4MPrHF2P.	\N	\N	\N	1	2013-07-23 17:42:34.71162	2013-07-23 17:42:34.71162	38.106.196.126	38.106.196.126	2013-07-23 17:42:34.324147	2013-07-23 17:42:34.712723	eddie	Anderson	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	ZhghbxxHhE6zkM3PWc27	\N	\N
16	frangucc5@gmail.com	$2a$10$eZjo/ocDDZfnyBMds.3xsuu8JgfpWlC62G1OX8OcnHJo50mY2P1c2	\N	\N	\N	1	2013-07-08 08:33:56.440797	2013-07-08 08:33:56.440797	108.240.30.245	108.240.30.245	2013-07-08 08:33:56.134864	2013-07-09 02:59:10.432561	Francesco	Pinto	frank.jpg	image/jpeg	18961	2013-07-09 02:59:10.149812				0	\N	\N	\N	\N	\N	4	0	0	0	dnbkcoiPqFpssU6ypGxA	\N	\N
26	test@test.com	$2a$10$hUQN1sbeNBESzguUydfCw.26EvOAvMkfopdhhkuBIUpXTlgb4bRam	\N	\N	\N	1	2013-07-23 17:48:29.516027	2013-07-23 17:48:29.516027	38.106.196.126	38.106.196.126	2013-07-23 17:48:28.940587	2013-07-23 17:48:29.517339	blabla	bla	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	eP25xVaKRfVsdnZgqzdP	\N	\N
27	testtest@test.coms	$2a$10$MGl6QGKUlzb2SffAiQHLVu.lDVLs1w6vr28rbK3tjZ.01af9EjeUC	\N	\N	\N	1	2013-07-23 17:49:40.14395	2013-07-23 17:49:40.14395	38.106.196.126	38.106.196.126	2013-07-23 17:49:39.861278	2013-07-23 17:49:40.144881	babab	abababa	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	FQ9xppWVnxzydi4rjgQB	\N	\N
17	samantha@meetmantra.com	$2a$10$dOTAp981E7eb85WYNWeGGuDQBPPevt2wwgn8E8XkHbQNXSPMILNNS	\N	\N	2013-07-18 17:01:59.85049	3	2013-07-18 20:07:09.233245	2013-07-18 17:01:59.856828	38.106.196.126	38.106.196.126	2013-07-09 14:35:37.687596	2013-07-18 20:07:09.234734	Samantha	Abernathy	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	1	5	pBxPgy1VLn277CLK8qPB	\N	\N
19	alex@meetmantra.com	$2a$10$ujdVF0sgcdHUqzTE2NNRo.B1NaLikoJrc1N6zTzzWSbMP33z29PQq	\N	\N	\N	1	2013-07-16 17:08:47.656938	2013-07-16 17:08:47.656938	38.106.196.126	38.106.196.126	2013-07-16 17:08:47.143845	2013-07-16 17:08:47.658035	Alex	Smith	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	NBZWGh7WAoUpQzXFZD1Y	\N	\N
20	jsmith@test.com	$2a$10$s/lLxVYz3yWUVowltbPVfe65YwuKp8uUL6aywxFTjGalWD2Hy9vYu	\N	\N	\N	1	2013-07-16 20:33:50.316057	2013-07-16 20:33:50.316057	173.58.231.149	173.58.231.149	2013-07-16 20:33:49.914636	2013-07-16 20:33:50.317245	John	Smith	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	UhMiGyMJTrCMRGdFVxF6	\N	\N
18	frank@meetmantra.com	$2a$10$dn91CTpahiqLkvH9BuvLX.zS32WoKnrq9JAnI/VTRS7XJVzBD.Lz6	\N	\N	\N	3	2013-07-18 22:25:15.775612	2013-07-15 21:40:41.78342	108.240.30.245	38.106.196.126	2013-07-11 20:16:52.999097	2013-07-18 22:25:15.784332	frank	vittorio	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	6	0	0	0	TpGu4g3YMBMGeRjqxsFm	\N	\N
23	frangucc4@gmail.com	$2a$10$NjFPphNTgsXgY8VXcc1z/eNFpamYC7e3rtbUwCXrbLSp.nlKXa04u	\N	\N	\N	1	2013-07-20 15:04:44.524228	2013-07-20 15:04:44.524228	108.240.30.245	108.240.30.245	2013-07-20 15:04:44.259126	2013-07-20 15:04:44.525329	francesco	vittoeio	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	ZxdenZpABXqGqB3qymyZ	\N	\N
24	mashik18@gmail.com	$2a$10$AG3oY6JlndJN6Aml4UFsauO6SKRvKYLFt.CIuhFhu6QSa8XOTrC6y	\N	\N	\N	1	2013-07-22 21:45:55.255778	2013-07-22 21:45:55.255778	67.175.235.26	67.175.235.26	2013-07-22 21:45:54.938434	2013-07-22 21:45:55.256972	Masha	Snitkovsky	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	CjPqUdjkw7xRjWdQnDt3	\N	\N
22	eddie@meetmantra.com	$2a$10$k4JxGpfe20BxVgSow/2TVOJVS3wptV6/.1.k28i4eHxMizV8BIC7m	\N	\N	\N	1	2013-07-18 20:45:38.660271	2013-07-18 20:45:38.660271	38.106.196.126	38.106.196.126	2013-07-18 20:45:38.383553	2013-07-18 20:45:38.661378	Eddie	Anderson	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	0	0	0	K2msaEXtxg8sXfh2ykbY	\N	\N
30	frangucc33133113@gmail.com	$2a$10$yT.wOI52yt.hXJJIdYe.Ze832loEKgFhY/zZZlbOlUFIIJ3rzuoPm	\N	\N	\N	1	2013-07-23 18:24:17.915623	2013-07-23 18:24:17.915623	38.106.196.126	38.106.196.126	2013-07-23 18:23:45.40147	2013-07-23 18:24:17.917236	francesco	vittorio	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	0	eDotsFHTwCXp9GQDvqJx	\N	\N
32	testst@etes.sds	$2a$10$ii9KQeLMjxC1IZmoiXjr3Oy9eKXx6NpFeVJJ0DKakN87kyl24DJKq	\N	\N	\N	1	2013-07-23 19:28:30.938192	2013-07-23 19:28:30.938192	38.106.196.126	38.106.196.126	2013-07-23 19:28:30.223345	2013-07-23 19:28:30.939206	testtes	testest	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	2	3	1	HYNysmB6QcMdoT2UPcyp	\N	\N
31	frangucc+9398@gmail.com	$2a$10$./gZYO3t2p2xmB2Bf1wive3OvsvoRMYsq..yhtYZZ3uY1uUoVBrVa	\N	\N	\N	1	2013-07-23 19:28:09.119107	2013-07-23 19:28:09.119107	38.106.196.126	38.106.196.126	2013-07-23 19:28:08.812874	2013-07-23 19:51:04.176417	francesco	pinto	frank_copy.jpg	image/jpeg	76955	2013-07-23 19:50:36.60248	I'm the art director behind this website. 			0	\N	\N	\N	\N	\N	4	0	1	0	kx6dPEHm2dQkscUMXGFo	\N	\N
34	frangucc+391@gmail.com	$2a$10$scnJmAJFjD2v6hdvzSlyseGAQEfQdkoO6Xs2dCf6Yzj1gmT5ZPYVW	\N	\N	\N	1	2013-07-24 12:38:59.956713	2013-07-24 12:38:59.956713	108.240.30.245	108.240.30.245	2013-07-24 12:38:59.650207	2013-07-24 12:38:59.957608	francesco	vittorio	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	yhiH7ahJPcoyFuQe5zN7	\N	\N
36	nicolas@meetmantra.com	$2a$10$ENhAzQKdDxzVEBiYmpiNJOizpMy8ovyHftVFnvyOdOSdxvC9pMhRK	\N	\N	\N	2	2013-07-24 17:26:13.241804	2013-07-24 17:20:19.101909	190.135.95.145	190.135.95.145	2013-07-24 17:20:18.536945	2013-07-24 17:26:13.244102	Nicolas	Barrera	dh-avatar.jpg	image/jpeg	50936	2013-07-24 17:22:12.697044	Pack my box with five dozen liquor jugs. Few quips galvanized the mock jury box. Quick brown fox jumps over the lazy dog. Jumpy halfling dwarves pick quartz box. Vex quest wizard, judge my backflop hand. The jay, pig, fox, zebra and my wolves quack! Blowzy red vixens fight for a quick jump. Sex prof gives back no quiz with mild joy. The quick brown fox jumps over a lazy dog.	Montevideo	Minnesota	0	\N	\N	\N	\N	\N	5	0	0	0	doqm3Dwz9JpMPFsxmwr5	\N	\N
33	frangucc2@gmail.com	$2a$10$FsC2vduhyNyIulgDVSKyb.t31Hd8MZCb2XhBokfVzMrbFdS0h4.vO	\N	\N	\N	3	2013-07-24 19:14:32.411968	2013-07-24 12:38:37.604044	108.240.30.245	108.240.30.245	2013-07-24 12:37:08.096814	2013-07-24 19:14:32.413078	Francesco	Pinto	\N	\N	\N	\N	\N	Park Ridge	 Illinois	0	facebook	733299616	\N	CAACEMHL6hHQBABvN0rQMfP0SyZAyuOKdc4vmQvPDEOvA4WzBQXIrWHXFebpoxtPZBKc4ZCJPezhbyEeepiERFeoZAwgTzagxjaUP9IBoWjtHoI3ylv9X6XzjNqQNH3ZAzSCTyITbvr5gpYupZBY1fsZBMsbuZA0LztkZD	\N	0	0	0	0	AfiHSY482HACnDqaczfy	\N	\N
35	frangucc+381818@gmail.com	$2a$10$bA7cO9dTwAObx4KNO6ZbOuwwmduKc2rKkHYJE4sVVH.skCSfhzO/G	\N	\N	\N	1	2013-07-24 16:30:11.350846	2013-07-24 16:30:11.350846	108.240.30.245	108.240.30.245	2013-07-24 16:30:10.421428	2013-07-24 16:30:11.351988	francesco	vittoeio	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	3	0	0	0	jqGh6EoeBCTU49tQTjyv	\N	\N
37	amy.schluckebier@murraystate.edu	$2a$10$ihhcqGFGu3QSIJaAmtptoODmXA1qwQx7dGVk.DXSH.5Rww5hAMQmq	\N	\N	\N	1	2013-07-24 21:04:53.893925	2013-07-24 21:04:53.893925	38.106.196.126	38.106.196.126	2013-07-24 21:04:52.484858	2013-07-24 21:04:53.895031	Amy	Johnson	\N	\N	\N	\N	\N	Chicago	 Illinois	0	facebook	1197360149	\N	CAACEMHL6hHQBAOjWWZBHZC0rCAaNrFDC6S4rjR7kbRkSeUUkZCYdukocGTZAilAi3FcEgX1SNZA4HQrZAgoTmprax9xm5LupZCzSViai78tumZC72M25PT1PUnR71oqdJAyQozjDSZAN5xswZBrL37EJbZA	\N	1	0	0	0	Hz7Axqe7GgyQXC2q1FLH	\N	\N
39	samantha.abernathy@hotmail.com	$2a$10$CMcBsvyBzo6YTzyPjrIm3OvTLWu31hStK8RpU9otPOn2uGqQ3K/N.	\N	\N	\N	1	2013-07-24 22:07:12.646544	2013-07-24 22:07:12.646544	64.134.175.173	64.134.175.173	2013-07-24 22:07:11.989551	2013-07-24 22:07:12.647758	Samantha	Abernathy	\N	\N	\N	\N	\N	Chicago	 Illinois	0	facebook	1127430088	\N	CAACEMHL6hHQBAN6m1oQzFZAtvIh2N0izsuk8pI88KDl8uiSJ6HCVzSEtIcJoFssUhZByfOJZA1T6GgZAlMiQEJNQaxab8vLxaVFQ4PdderJZA4hFhuDwRkPwdaZBhz1kbDjvTBO9cCZBLVbSPpu5ZB55	\N	0	0	0	0	1ZxqrJNsuHp5MswRigtN	\N	\N
38	jon@meetmantra.com	$2a$10$OmmXu52suPNdy3TyV7qnv.p6uWh4wG4ZMi7COrtdVkyytYe8MOeDS	\N	\N	\N	1	2013-07-24 21:39:31.325291	2013-07-24 21:39:31.325291	38.106.196.126	38.106.196.126	2013-07-24 21:39:30.981717	2013-07-24 21:39:31.326543	Jonathan	Soeder	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	2	0	0	0	WcHpxNSyydMpFTrXV5DP	\N	\N
\.


--
-- Data for Name: users_badges; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY users_badges (id, user_id, badge_id) FROM stdin;
1	3	1
2	2	1
3	4	1
4	5	1
5	1	1
6	6	1
7	7	1
8	8	1
9	9	1
10	10	1
11	11	1
12	15	1
13	12	1
14	13	1
15	14	1
16	21	1
17	25	1
18	16	1
19	26	1
20	27	1
21	17	1
22	19	1
23	20	1
24	18	1
25	23	1
26	24	1
27	22	1
28	30	1
29	32	1
30	31	1
31	34	1
32	36	1
33	33	1
34	35	1
35	37	1
36	39	1
37	38	1
\.


--
-- Name: users_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('users_badges_id_seq', 37, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('users_id_seq', 39, true);


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: bfi_production
--

COPY volunteers (id, cause_id, user_id, need_id, location_id, description, user_showed_up, created_at, updated_at) FROM stdin;
1	19	1	16	\N	\N	f	2013-07-16 23:26:00.84228	2013-07-16 23:26:00.84228
2	19	17	16	\N	\N	f	2013-07-18 17:19:54.953699	2013-07-18 17:19:54.953699
3	19	17	16	\N	\N	f	2013-07-18 19:13:51.044407	2013-07-18 19:13:51.044407
4	19	17	16	\N	\N	f	2013-07-18 19:14:22.322679	2013-07-18 19:14:22.322679
5	19	17	16	\N	\N	f	2013-07-18 19:14:25.939804	2013-07-18 19:14:25.939804
6	19	17	16	\N	\N	f	2013-07-18 19:14:26.975029	2013-07-18 19:14:26.975029
7	19	32	16	\N	\N	f	2013-07-23 20:24:19.202856	2013-07-23 20:24:19.202856
8	19	1	16	\N	\N	f	2013-07-23 23:38:05.665034	2013-07-23 23:38:05.665034
9	19	1	16	\N	\N	f	2013-07-24 18:05:01.749485	2013-07-24 18:05:01.749485
\.


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bfi_production
--

SELECT pg_catalog.setval('volunteers_id_seq', 9, true);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: badges_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: cash_donations_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY cash_donations
    ADD CONSTRAINT cash_donations_pkey PRIMARY KEY (id);


--
-- Name: cause_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY cause_applications
    ADD CONSTRAINT cause_applications_pkey PRIMARY KEY (id);


--
-- Name: cause_images_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY cause_images
    ADD CONSTRAINT cause_images_pkey PRIMARY KEY (id);


--
-- Name: cause_types_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY cause_types
    ADD CONSTRAINT cause_types_pkey PRIMARY KEY (id);


--
-- Name: causes_cause_types_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY causes_cause_types
    ADD CONSTRAINT causes_cause_types_pkey PRIMARY KEY (id);


--
-- Name: causes_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY causes
    ADD CONSTRAINT causes_pkey PRIMARY KEY (id);


--
-- Name: contributions_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY contributions
    ADD CONSTRAINT contributions_pkey PRIMARY KEY (id);


--
-- Name: featured_causes_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY featured_causes
    ADD CONSTRAINT featured_causes_pkey PRIMARY KEY (id);


--
-- Name: followers_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: goods_donations_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY goods_donations
    ADD CONSTRAINT goods_donations_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: needs_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY needs
    ADD CONSTRAINT needs_pkey PRIMARY KEY (id);


--
-- Name: subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY subscribes
    ADD CONSTRAINT subscribes_pkey PRIMARY KEY (id);


--
-- Name: users_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY users_badges
    ADD CONSTRAINT users_badges_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: bfi_production; Tablespace: 
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_admin_notes_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_admin_notes_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_badges_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_badges_on_id ON badges USING btree (id);


--
-- Name: index_campaigns_on_active; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_campaigns_on_active ON campaigns USING btree (active);


--
-- Name: index_campaigns_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_campaigns_on_cause_id ON campaigns USING btree (cause_id);


--
-- Name: index_campaigns_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_campaigns_on_id ON campaigns USING btree (id);


--
-- Name: index_campaigns_on_need_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_campaigns_on_need_id ON campaigns USING btree (need_id);


--
-- Name: index_campaigns_on_type_of_need; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_campaigns_on_type_of_need ON campaigns USING btree (type_of_need);


--
-- Name: index_cash_donations_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_cash_donations_on_cause_id ON cash_donations USING btree (cause_id);


--
-- Name: index_cash_donations_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_cash_donations_on_id ON cash_donations USING btree (id);


--
-- Name: index_cash_donations_on_need_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_cash_donations_on_need_id ON cash_donations USING btree (need_id);


--
-- Name: index_cash_donations_on_user_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_cash_donations_on_user_id ON cash_donations USING btree (user_id);


--
-- Name: index_cause_applications_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_cause_applications_on_id ON cause_applications USING btree (id);


--
-- Name: index_cause_types_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_cause_types_on_id ON cause_types USING btree (id);


--
-- Name: index_cause_types_on_slug; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_cause_types_on_slug ON cause_types USING btree (slug);


--
-- Name: index_causes_cause_types_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_causes_cause_types_on_cause_id ON causes_cause_types USING btree (cause_id);


--
-- Name: index_causes_cause_types_on_cause_type_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_causes_cause_types_on_cause_type_id ON causes_cause_types USING btree (cause_type_id);


--
-- Name: index_causes_cause_types_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_causes_cause_types_on_id ON causes_cause_types USING btree (id);


--
-- Name: index_causes_on_cause_type_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_causes_on_cause_type_id ON causes USING btree (cause_type_id);


--
-- Name: index_causes_on_city; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_causes_on_city ON causes USING btree (city);


--
-- Name: index_causes_on_city_slug; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_causes_on_city_slug ON causes USING btree (city_slug);


--
-- Name: index_causes_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_causes_on_id ON causes USING btree (id);


--
-- Name: index_causes_on_name; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_causes_on_name ON causes USING btree (name);


--
-- Name: index_causes_on_postal_code; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_causes_on_postal_code ON causes USING btree (postal_code);


--
-- Name: index_causes_on_slug; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_causes_on_slug ON causes USING btree (slug);


--
-- Name: index_featured_causes_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_featured_causes_on_cause_id ON featured_causes USING btree (cause_id);


--
-- Name: index_featured_causes_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_featured_causes_on_id ON featured_causes USING btree (id);


--
-- Name: index_followers_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_followers_on_cause_id ON followers USING btree (cause_id);


--
-- Name: index_followers_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_followers_on_id ON followers USING btree (id);


--
-- Name: index_followers_on_need_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_followers_on_need_id ON followers USING btree (need_id);


--
-- Name: index_followers_on_user_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_followers_on_user_id ON followers USING btree (user_id);


--
-- Name: index_goods_donations_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_goods_donations_on_cause_id ON goods_donations USING btree (cause_id);


--
-- Name: index_goods_donations_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_goods_donations_on_id ON goods_donations USING btree (id);


--
-- Name: index_goods_donations_on_need_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_goods_donations_on_need_id ON goods_donations USING btree (need_id);


--
-- Name: index_goods_donations_on_user_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_goods_donations_on_user_id ON goods_donations USING btree (user_id);


--
-- Name: index_locations_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_locations_on_cause_id ON locations USING btree (cause_id);


--
-- Name: index_locations_on_city; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_locations_on_city ON locations USING btree (city);


--
-- Name: index_locations_on_country; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_locations_on_country ON locations USING btree (country);


--
-- Name: index_locations_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_locations_on_id ON locations USING btree (id);


--
-- Name: index_locations_on_latitude_and_longitude; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_locations_on_latitude_and_longitude ON locations USING btree (latitude, longitude);


--
-- Name: index_locations_on_postal_code; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_locations_on_postal_code ON locations USING btree (postal_code);


--
-- Name: index_needs_on_campaign_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_needs_on_campaign_id ON needs USING btree (campaign_id);


--
-- Name: index_needs_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_needs_on_cause_id ON needs USING btree (cause_id);


--
-- Name: index_needs_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_needs_on_id ON needs USING btree (id);


--
-- Name: index_needs_on_type_of_need; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_needs_on_type_of_need ON needs USING btree (type_of_need);


--
-- Name: index_subscribes_on_email; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_subscribes_on_email ON subscribes USING btree (email);


--
-- Name: index_subscribes_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_subscribes_on_id ON subscribes USING btree (id);


--
-- Name: index_users_badges_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_users_badges_on_id ON users_badges USING btree (id);


--
-- Name: index_users_badges_on_user_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_users_badges_on_user_id ON users_badges USING btree (user_id);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_users_on_authentication_token ON users USING btree (authentication_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_id ON users USING btree (id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_volunteers_on_cause_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_volunteers_on_cause_id ON volunteers USING btree (cause_id);


--
-- Name: index_volunteers_on_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX index_volunteers_on_id ON volunteers USING btree (id);


--
-- Name: index_volunteers_on_location_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_volunteers_on_location_id ON volunteers USING btree (location_id);


--
-- Name: index_volunteers_on_need_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_volunteers_on_need_id ON volunteers USING btree (need_id);


--
-- Name: index_volunteers_on_user_id; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE INDEX index_volunteers_on_user_id ON volunteers USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: bfi_production; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

