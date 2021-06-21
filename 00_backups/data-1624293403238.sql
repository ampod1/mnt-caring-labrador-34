SET check_function_bodies = false;
COPY public.mnt_items (id, code, title, created_at, updated_at, default_price, default_month_period, ext_data) FROM stdin;
\.
COPY public.mnt_site (id, code, title, location, ext_data, media) FROM stdin;
3c463de5-c420-4ff8-be3f-9a28e7e7c757	1	{"ar": "مدينة البستان", "en": "Bostan City"}	\N	\N	\N
\.
COPY public.users (id, code, email, phone, password, created_at, updated_at, ext_data, name, media) FROM stdin;
\.
SELECT pg_catalog.setval('public.mnt_items_code_seq', 1, false);
SELECT pg_catalog.setval('public.mnt_site_code_seq', 1, true);
SELECT pg_catalog.setval('public.users_code_seq', 1, false);
