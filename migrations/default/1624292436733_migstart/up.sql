SET check_function_bodies = false;
CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public.mnt_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    title jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    default_price numeric NOT NULL,
    default_month_period integer NOT NULL,
    ext_data jsonb NOT NULL
);
CREATE SEQUENCE public.mnt_items_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_items_code_seq OWNED BY public.mnt_items.code;
CREATE TABLE public.mnt_site (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    title jsonb NOT NULL,
    location jsonb,
    ext_data jsonb,
    media jsonb
);
CREATE SEQUENCE public.mnt_site_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_site_code_seq OWNED BY public.mnt_site.code;
CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    password text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    ext_data jsonb NOT NULL,
    name jsonb NOT NULL,
    media jsonb NOT NULL
);
CREATE SEQUENCE public.users_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.users_code_seq OWNED BY public.users.code;
ALTER TABLE ONLY public.mnt_items ALTER COLUMN code SET DEFAULT nextval('public.mnt_items_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_site ALTER COLUMN code SET DEFAULT nextval('public.mnt_site_code_seq'::regclass);
ALTER TABLE ONLY public.users ALTER COLUMN code SET DEFAULT nextval('public.users_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_items
    ADD CONSTRAINT mnt_items_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_site
    ADD CONSTRAINT mnt_site_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
CREATE TRIGGER set_public_mnt_items_updated_at BEFORE UPDATE ON public.mnt_items FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_items_updated_at ON public.mnt_items IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_users_updated_at ON public.users IS 'trigger to set value of column "updated_at" to current timestamp on row update';
