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
CREATE TABLE public.bsc_customer (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name jsonb NOT NULL,
    ext_data jsonb,
    deleted_at timestamp with time zone,
    customer_type_id uuid
);
CREATE SEQUENCE public.bsc_customer_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.bsc_customer_code_seq OWNED BY public.bsc_customer.code;
CREATE TABLE public.bsc_customer_type (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    label jsonb NOT NULL,
    terms text NOT NULL,
    media jsonb,
    ext_data jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
CREATE SEQUENCE public.bsc_customer_type_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.bsc_customer_type_code_seq OWNED BY public.bsc_customer_type.code;
CREATE TABLE public.core_user (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    email text NOT NULL,
    phone text,
    passwired text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    ext_data jsonb,
    name jsonb NOT NULL,
    media jsonb,
    deleted_at timestamp with time zone,
    user_type_id uuid,
    customer_id uuid
);
CREATE TABLE public.core_usertype (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    label jsonb NOT NULL,
    ext_data jsonb,
    deleted_at timestamp with time zone
);
CREATE SEQUENCE public.core_usertype_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.core_usertype_code_seq OWNED BY public.core_usertype.code;
CREATE TABLE public.mnt_address (
    address text NOT NULL,
    lat numeric,
    lng numeric,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    ext_data jsonb,
    media jsonb,
    unit_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.mnt_address_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_address_code_seq OWNED BY public.mnt_address.code;
CREATE TABLE public.mnt_contract (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    unit_id uuid NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    code integer NOT NULL
);
CREATE SEQUENCE public.mnt_contract_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_contract_code_seq OWNED BY public.mnt_contract.code;
CREATE TABLE public.mnt_contract_item (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    contract_id uuid NOT NULL,
    mnt_item_id uuid NOT NULL,
    period_in_monthes integer NOT NULL,
    end_date timestamp with time zone NOT NULL,
    ext_data jsonb
);
CREATE SEQUENCE public.mnt_contract_item_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_contract_item_code_seq OWNED BY public.mnt_contract_item.code;
CREATE TABLE public.mnt_customer_unit (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    unit_id uuid NOT NULL,
    customer_id uuid NOT NULL,
    code integer NOT NULL,
    ext_data jsonb
);
CREATE SEQUENCE public.mnt_customer_unit_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_customer_unit_code_seq OWNED BY public.mnt_customer_unit.code;
CREATE TABLE public.mnt_item (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    label jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    default_price numeric NOT NULL,
    default_month_period integer NOT NULL,
    ext_data jsonb,
    deleted_at timestamp with time zone
);
CREATE SEQUENCE public.mnt_items_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_items_code_seq OWNED BY public.mnt_item.code;
CREATE TABLE public.mnt_project (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    site_id uuid NOT NULL,
    label jsonb NOT NULL,
    ext_data jsonb,
    media jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.mnt_projects_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_projects_code_seq OWNED BY public.mnt_project.code;
CREATE TABLE public.mnt_request (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    customer_id uuid NOT NULL,
    ext_data jsonb,
    media jsonb,
    notes text,
    unit_id uuid NOT NULL,
    request_status_id uuid DEFAULT '9369c555-f873-4447-b016-c28dc2d4e1b6'::uuid NOT NULL,
    is_urgent boolean DEFAULT false NOT NULL
);
CREATE TABLE public.mnt_request_assign (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    request_id uuid NOT NULL,
    technician_id uuid NOT NULL,
    ext_data jsonb,
    media jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    assign_date timestamp with time zone
);
CREATE SEQUENCE public.mnt_request_assign_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_request_assign_code_seq OWNED BY public.mnt_request_assign.code;
CREATE SEQUENCE public.mnt_request_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_request_code_seq OWNED BY public.mnt_request.code;
CREATE TABLE public.mnt_request_item (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    mnt_item_id uuid NOT NULL,
    mnt_request_id uuid NOT NULL,
    ext_data jsonb NOT NULL
);
CREATE SEQUENCE public.mnt_request_item_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_request_item_code_seq OWNED BY public.mnt_request_item.code;
CREATE TABLE public.mnt_request_status (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    request_id uuid NOT NULL,
    req_status_type_id uuid NOT NULL,
    ext_data jsonb,
    media jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE TABLE public.mnt_request_status_type (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    label jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.mnt_request_status_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_request_status_code_seq OWNED BY public.mnt_request_status_type.code;
CREATE SEQUENCE public.mnt_request_status_code_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_request_status_code_seq1 OWNED BY public.mnt_request_status.code;
CREATE TABLE public.mnt_site (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer NOT NULL,
    label jsonb NOT NULL,
    location jsonb,
    ext_data jsonb,
    media jsonb,
    created_at timestamp with time zone DEFAULT now(),
    deleted_at timestamp with time zone
);
CREATE SEQUENCE public.mnt_site_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_site_code_seq OWNED BY public.mnt_site.code;
CREATE TABLE public.mnt_unit (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id uuid NOT NULL,
    unit_number integer NOT NULL,
    code integer NOT NULL,
    ext_data jsonb,
    address_id uuid,
    is_contract_agree boolean DEFAULT false NOT NULL
);
CREATE SEQUENCE public.mnt_unit_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mnt_unit_code_seq OWNED BY public.mnt_unit.code;
CREATE SEQUENCE public.users_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.users_code_seq OWNED BY public.core_user.code;
ALTER TABLE ONLY public.bsc_customer ALTER COLUMN code SET DEFAULT nextval('public.bsc_customer_code_seq'::regclass);
ALTER TABLE ONLY public.bsc_customer_type ALTER COLUMN code SET DEFAULT nextval('public.bsc_customer_type_code_seq'::regclass);
ALTER TABLE ONLY public.core_user ALTER COLUMN code SET DEFAULT nextval('public.users_code_seq'::regclass);
ALTER TABLE ONLY public.core_usertype ALTER COLUMN code SET DEFAULT nextval('public.core_usertype_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_address ALTER COLUMN code SET DEFAULT nextval('public.mnt_address_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_contract ALTER COLUMN code SET DEFAULT nextval('public.mnt_contract_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_contract_item ALTER COLUMN code SET DEFAULT nextval('public.mnt_contract_item_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_customer_unit ALTER COLUMN code SET DEFAULT nextval('public.mnt_customer_unit_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_item ALTER COLUMN code SET DEFAULT nextval('public.mnt_items_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_project ALTER COLUMN code SET DEFAULT nextval('public.mnt_projects_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_request ALTER COLUMN code SET DEFAULT nextval('public.mnt_request_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_request_assign ALTER COLUMN code SET DEFAULT nextval('public.mnt_request_assign_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_request_item ALTER COLUMN code SET DEFAULT nextval('public.mnt_request_item_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_request_status ALTER COLUMN code SET DEFAULT nextval('public.mnt_request_status_code_seq1'::regclass);
ALTER TABLE ONLY public.mnt_request_status_type ALTER COLUMN code SET DEFAULT nextval('public.mnt_request_status_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_site ALTER COLUMN code SET DEFAULT nextval('public.mnt_site_code_seq'::regclass);
ALTER TABLE ONLY public.mnt_unit ALTER COLUMN code SET DEFAULT nextval('public.mnt_unit_code_seq'::regclass);
ALTER TABLE ONLY public.bsc_customer
    ADD CONSTRAINT bsc_customer_id_code_key UNIQUE (id, code);
ALTER TABLE ONLY public.bsc_customer
    ADD CONSTRAINT bsc_customer_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.bsc_customer_type
    ADD CONSTRAINT bsc_customer_type_code_key UNIQUE (code);
ALTER TABLE ONLY public.bsc_customer_type
    ADD CONSTRAINT bsc_customer_type_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_id_code_key UNIQUE (id, code);
ALTER TABLE ONLY public.core_usertype
    ADD CONSTRAINT core_usertype_id_code_key UNIQUE (id, code);
ALTER TABLE ONLY public.core_usertype
    ADD CONSTRAINT core_usertype_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_address
    ADD CONSTRAINT mnt_address_code_key UNIQUE (code);
ALTER TABLE ONLY public.mnt_address
    ADD CONSTRAINT mnt_address_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_contract
    ADD CONSTRAINT mnt_contract_code_key UNIQUE (code);
ALTER TABLE ONLY public.mnt_contract_item
    ADD CONSTRAINT mnt_contract_item_code_key UNIQUE (code);
ALTER TABLE ONLY public.mnt_contract_item
    ADD CONSTRAINT mnt_contract_item_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_contract
    ADD CONSTRAINT mnt_contract_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_customer_unit
    ADD CONSTRAINT mnt_customer_unit_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_item
    ADD CONSTRAINT mnt_item_id_code_key UNIQUE (id, code);
ALTER TABLE ONLY public.mnt_item
    ADD CONSTRAINT mnt_items_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_project
    ADD CONSTRAINT mnt_project_id_code_key UNIQUE (id, code);
ALTER TABLE ONLY public.mnt_project
    ADD CONSTRAINT mnt_projects_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_request_assign
    ADD CONSTRAINT mnt_request_assign_code_key UNIQUE (code);
ALTER TABLE ONLY public.mnt_request_assign
    ADD CONSTRAINT mnt_request_assign_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_request
    ADD CONSTRAINT mnt_request_id_code_key UNIQUE (id, code);
ALTER TABLE ONLY public.mnt_request_item
    ADD CONSTRAINT mnt_request_item_code_key UNIQUE (code);
ALTER TABLE ONLY public.mnt_request_item
    ADD CONSTRAINT mnt_request_item_id_key UNIQUE (id);
ALTER TABLE ONLY public.mnt_request_item
    ADD CONSTRAINT mnt_request_item_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_request
    ADD CONSTRAINT mnt_request_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_request_status_type
    ADD CONSTRAINT mnt_request_status_code_key UNIQUE (code);
ALTER TABLE ONLY public.mnt_request_status_type
    ADD CONSTRAINT mnt_request_status_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_request_status
    ADD CONSTRAINT mnt_request_status_pkey1 PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_site
    ADD CONSTRAINT mnt_site_id_code_key UNIQUE (id, code);
ALTER TABLE ONLY public.mnt_site
    ADD CONSTRAINT mnt_site_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mnt_unit
    ADD CONSTRAINT mnt_unit_id_code_key UNIQUE (id, code);
ALTER TABLE ONLY public.mnt_unit
    ADD CONSTRAINT mnt_unit_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
CREATE TRIGGER set_public_bsc_customer_updated_at BEFORE UPDATE ON public.bsc_customer FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_bsc_customer_updated_at ON public.bsc_customer IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_core_usertype_updated_at BEFORE UPDATE ON public.core_usertype FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_core_usertype_updated_at ON public.core_usertype IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_address_updated_at BEFORE UPDATE ON public.mnt_address FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_address_updated_at ON public.mnt_address IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_contract_item_updated_at BEFORE UPDATE ON public.mnt_contract_item FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_contract_item_updated_at ON public.mnt_contract_item IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_contract_updated_at BEFORE UPDATE ON public.mnt_contract FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_contract_updated_at ON public.mnt_contract IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_customer_unit_updated_at BEFORE UPDATE ON public.mnt_customer_unit FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_customer_unit_updated_at ON public.mnt_customer_unit IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_items_updated_at BEFORE UPDATE ON public.mnt_item FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_items_updated_at ON public.mnt_item IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_projects_updated_at BEFORE UPDATE ON public.mnt_project FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_projects_updated_at ON public.mnt_project IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_request_assign_updated_at BEFORE UPDATE ON public.mnt_request_assign FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_request_assign_updated_at ON public.mnt_request_assign IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_request_status_updated_at BEFORE UPDATE ON public.mnt_request_status FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_request_status_updated_at ON public.mnt_request_status IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_request_status_updated_at BEFORE UPDATE ON public.mnt_request_status_type FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_request_status_updated_at ON public.mnt_request_status_type IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_request_updated_at BEFORE UPDATE ON public.mnt_request FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_request_updated_at ON public.mnt_request IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mnt_unit_updated_at BEFORE UPDATE ON public.mnt_unit FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mnt_unit_updated_at ON public.mnt_unit IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_users_updated_at BEFORE UPDATE ON public.core_user FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_users_updated_at ON public.core_user IS 'trigger to set value of column "updated_at" to current timestamp on row update';
ALTER TABLE ONLY public.bsc_customer
    ADD CONSTRAINT bsc_customer_customer_type_id_fkey FOREIGN KEY (customer_type_id) REFERENCES public.bsc_customer_type(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.bsc_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_user_type_fkey FOREIGN KEY (user_type_id) REFERENCES public.core_usertype(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_address
    ADD CONSTRAINT mnt_address_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.mnt_unit(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_contract_item
    ADD CONSTRAINT mnt_contract_item_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.mnt_contract(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_contract_item
    ADD CONSTRAINT mnt_contract_item_mnt_item_id_fkey FOREIGN KEY (mnt_item_id) REFERENCES public.mnt_item(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_contract
    ADD CONSTRAINT mnt_contract_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.mnt_unit(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_customer_unit
    ADD CONSTRAINT mnt_customer_unit_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.bsc_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_customer_unit
    ADD CONSTRAINT mnt_customer_unit_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.mnt_unit(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_project
    ADD CONSTRAINT mnt_projects_site_id_fkey FOREIGN KEY (site_id) REFERENCES public.mnt_site(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request_assign
    ADD CONSTRAINT mnt_request_assign_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.mnt_request(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request_assign
    ADD CONSTRAINT mnt_request_assign_technician_id_fkey FOREIGN KEY (technician_id) REFERENCES public.core_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request
    ADD CONSTRAINT mnt_request_bsc_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.bsc_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request_item
    ADD CONSTRAINT mnt_request_item_mnt_item_id_fkey FOREIGN KEY (mnt_item_id) REFERENCES public.mnt_item(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request_item
    ADD CONSTRAINT mnt_request_item_mnt_request_id_fkey FOREIGN KEY (mnt_request_id) REFERENCES public.mnt_request(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request
    ADD CONSTRAINT mnt_request_request_status_id_fkey FOREIGN KEY (request_status_id) REFERENCES public.mnt_request_status_type(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request_status
    ADD CONSTRAINT mnt_request_status_req_status_type_id_fkey FOREIGN KEY (req_status_type_id) REFERENCES public.mnt_request_status_type(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request_status
    ADD CONSTRAINT mnt_request_status_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.mnt_request(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_request
    ADD CONSTRAINT mnt_request_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.mnt_unit(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_unit
    ADD CONSTRAINT mnt_unit_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.mnt_address(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mnt_unit
    ADD CONSTRAINT mnt_unit_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.mnt_project(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
