SET check_function_bodies = false;
COPY public.bsc_customer_type (id, code, label, terms, media, ext_data, created_at, updated_at) FROM stdin;
51bb79f1-661c-4afd-8d88-188dad25f867	1	{"ar": "عميل متعاقد", "en": "contracted"}	some contracted terms & conditions here	\N	\N	2021-07-15 11:29:25.194528+00	2021-07-15 11:29:25.194528+00
ea3f0d41-f6a6-4ba3-a2ec-5a0bf4ce0ca4	3	{"ar": "عميل بدون تعاقد", "en": "without_contract"}	with no contract terms & conditions	\N	\N	2021-07-15 11:34:16.163147+00	2021-07-15 11:34:16.163147+00
1d13d65b-3d24-4d43-96e3-333724a5e970	2	{"ar": "عميل شركة اخري", "en": "external "}	external customer terms & conditions	\N	\N	2021-07-15 11:30:48.637836+00	2021-07-15 11:30:48.637836+00
\.
COPY public.bsc_customer (id, code, created_at, updated_at, name, ext_data, deleted_at, customer_type_id) FROM stdin;
04c2a85e-6e8c-4abb-8154-c640bb96c067	1	2021-07-04 20:52:08.654239+00	2021-07-15 11:38:43.697167+00	{"full": "محمد علوان"}	\N	\N	51bb79f1-661c-4afd-8d88-188dad25f867
1a4d9635-f168-4e24-b1ee-3dfde0e9f360	2	2021-07-06 14:31:38.75237+00	2021-07-15 11:38:54.733971+00	{"full": "احمد سرحان"}	\N	\N	51bb79f1-661c-4afd-8d88-188dad25f867
330ff0cc-d48f-46a4-a05a-b28a7c9fea6c	3	2021-07-08 20:40:19.540865+00	2021-07-15 11:39:00.496341+00	{"full": "مؤمن بيومي"}	\N	\N	1d13d65b-3d24-4d43-96e3-333724a5e970
41a6c2df-9227-4884-8128-dab9e38f04df	6	2021-07-12 13:47:38.192342+00	2021-07-15 11:39:06.777949+00	{"full": "محمد فريد"}	\N	\N	ea3f0d41-f6a6-4ba3-a2ec-5a0bf4ce0ca4
bf24a9dc-b48d-466f-9011-5d287e089891	4	2021-07-12 05:50:46.810856+00	2021-07-15 11:39:18.78004+00	{"full": "حسين عبدالكريم"}	\N	\N	1d13d65b-3d24-4d43-96e3-333724a5e970
b74ca8d4-97b4-40af-956d-8447b9fe2f58	10	2021-07-15 14:36:02.258366+00	2021-07-15 14:36:02.258366+00	{"full": "Ahmed Sarhan"}	{"national_id": 58564855255645}	\N	51bb79f1-661c-4afd-8d88-188dad25f867
05fedc61-0742-4a9b-84f8-27186894eac1	11	2021-07-25 13:22:52.780635+00	2021-07-25 13:22:52.780635+00	{"full": "Signed Upuser"}	{"national_id": 6525655565633265}	\N	ea3f0d41-f6a6-4ba3-a2ec-5a0bf4ce0ca4
a611493f-3782-4b32-9d89-8b4bf92f0526	12	2021-07-27 08:26:41.713932+00	2021-07-27 08:26:41.713932+00	{"full": "karim testin"}	{"national_id": 58556}	\N	51bb79f1-661c-4afd-8d88-188dad25f867
\.
COPY public.core_usertype (id, code, created_at, updated_at, label, ext_data, deleted_at) FROM stdin;
15caa97f-a548-417f-af37-27460ed6049e	1	2021-07-06 09:36:34.639662+00	2021-07-06 09:36:34.639662+00	{"ar": "مدير", "en": "admin"}	\N	\N
c8ab7590-3172-4bdc-9796-e710fe6850b5	2	2021-07-06 09:38:58.198451+00	2021-07-06 09:38:58.198451+00	{"ar": "عميل", "en": "client"}	\N	\N
76311dea-c1e1-4fa9-be17-a63dc21ae911	3	2021-07-06 09:39:26.86903+00	2021-07-06 09:39:26.86903+00	{"ar": "تقني", "en": "technician"}	\N	\N
\.
COPY public.core_user (id, code, email, phone, passwired, created_at, updated_at, ext_data, name, media, deleted_at, user_type_id, customer_id) FROM stdin;
857ff610-26be-473a-878b-cec628262b72	16	tech4@test.com	\N	0000	2021-07-12 15:51:54.58283+00	2021-07-12 15:51:54.58283+00	\N	{"full": "تجربة فني"}	\N	\N	76311dea-c1e1-4fa9-be17-a63dc21ae911	\N
12d1077e-8d9f-41b6-993a-12f845d15dda	2	client2@test.com	01062365585	0000	2021-07-06 13:20:58.060517+00	2021-07-26 09:25:29.304042+00	{}	{"full": "ahmed sarhan"}	{"profile_img": {"url": "http://res.cloudinary.com/mellw/image/upload/v1627291527/mellw_uploads/blberhgx3itm1clgounx.jpg", "etag": "84fcd7bef969a414df5acd35ba491098", "tags": [], "type": "upload", "bytes": 355486, "width": 2560, "format": "jpg", "height": 1707, "api_key": "329246125839327", "version": 1627291527, "asset_id": "840eaa63ef413a2e973e2f86e4410527", "public_id": "mellw_uploads/blberhgx3itm1clgounx", "signature": "afe7a0fef7f6424c70115937d9fdf90a88c43d27", "created_at": "2021-07-26T09:25:27Z", "secure_url": "https://res.cloudinary.com/mellw/image/upload/v1627291527/mellw_uploads/blberhgx3itm1clgounx.jpg", "version_id": "23255d5dbd73d1ac0b104ac23241c0cd", "placeholder": false, "resource_type": "image", "original_filename": "file"}}	\N	c8ab7590-3172-4bdc-9796-e710fe6850b5	1a4d9635-f168-4e24-b1ee-3dfde0e9f360
04aae9fa-58f0-4d5a-ba82-a5c75af85844	10	client3@test.com	\N	0000	2021-07-12 05:52:15.328008+00	2021-07-12 05:52:15.328008+00	\N	{"full": "Hussien Abdelkarim"}	\N	\N	c8ab7590-3172-4bdc-9796-e710fe6850b5	bf24a9dc-b48d-466f-9011-5d287e089891
dbfc59ec-ccb2-40fd-b53c-22860b9c442f	11	tech@test.com	\N	0000	2021-07-12 07:35:29.807086+00	2021-07-12 07:35:29.807086+00	\N	{"full": "علي سالم"}	\N	\N	76311dea-c1e1-4fa9-be17-a63dc21ae911	\N
98320cb7-4345-4dd8-9baa-f92a9d5b6dc0	15	mohamed@test.com	\N	0000	2021-07-12 15:45:28.338021+00	2021-07-12 15:45:28.338021+00	\N	{"full": "محمد"}	\N	\N	c8ab7590-3172-4bdc-9796-e710fe6850b5	41a6c2df-9227-4884-8128-dab9e38f04df
b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	1	test@test.com	015148584	0000	2021-07-04 20:32:35.946691+00	2021-07-14 13:29:21.530231+00	\N	{"full": "Technican Test"}	{"profile_img": {"url": "http://res.cloudinary.com/mellw/image/upload/v1626268959/mellw_uploads/ufgxfd5clqzqjziscx79.jpg", "etag": "117dca50b99a20e05bd9c5f139e967ac", "tags": [], "type": "upload", "bytes": 74004, "width": 1123, "format": "jpg", "height": 1280, "api_key": "329246125839327", "version": 1626268959, "asset_id": "fc23cf88bf5fc41c59c051219877d4ed", "public_id": "mellw_uploads/ufgxfd5clqzqjziscx79", "signature": "1c9623853768275bff589837861ce07539b71ff3", "created_at": "2021-07-14T13:22:39Z", "secure_url": "https://res.cloudinary.com/mellw/image/upload/v1626268959/mellw_uploads/ufgxfd5clqzqjziscx79.jpg", "version_id": "1b702ee721ae9da993b92e68b0c5d91d", "placeholder": false, "resource_type": "image", "original_filename": "file"}}	\N	76311dea-c1e1-4fa9-be17-a63dc21ae911	04c2a85e-6e8c-4abb-8154-c640bb96c067
a6b3ac17-e364-4484-b680-a68916827aee	18	signed@test.com	+201158698595	test1234	2021-07-25 13:22:53.355077+00	2021-07-25 13:23:26.006471+00	{"national_id": 6525655565633265}	{"full": "Signed Upuser"}	\N	\N	c8ab7590-3172-4bdc-9796-e710fe6850b5	05fedc61-0742-4a9b-84f8-27186894eac1
1158d4b1-8503-4698-ad20-76165b8917d2	17	areensarhan15@gmail.com	010685898965	0000	2021-07-15 14:36:06.644405+00	2021-07-25 13:28:51.085781+00	{"national_id": 58564855255645}	{"full": "Ahmed Sarhan"}	{"profile_img": {"url": "http://res.cloudinary.com/mellw/image/upload/v1627219730/mellw_uploads/lhhka6qug5lqkj8ftl1v.png", "etag": "f67f6d58fefa445d388166cf16d040bf", "tags": [], "type": "upload", "bytes": 210610, "width": 613, "format": "png", "height": 472, "api_key": "329246125839327", "version": 1627219730, "asset_id": "24f618eeb74930e26d0ec2f6becd1fbf", "public_id": "mellw_uploads/lhhka6qug5lqkj8ftl1v", "signature": "d8c01516c1be7b822c9299b61e45a0f38655637f", "created_at": "2021-07-25T13:28:50Z", "secure_url": "https://res.cloudinary.com/mellw/image/upload/v1627219730/mellw_uploads/lhhka6qug5lqkj8ftl1v.png", "version_id": "b9a65fd9f69cca179622b9a13d8eb25b", "placeholder": false, "resource_type": "image", "original_filename": "file"}}	\N	c8ab7590-3172-4bdc-9796-e710fe6850b5	b74ca8d4-97b4-40af-956d-8447b9fe2f58
ca8260c5-dec2-4e85-8a99-83487bbaee9f	19	karim@test.com	0112366588	0000	2021-07-27 08:26:43.546955+00	2021-07-27 08:31:34.305014+00	{"national_id": 58556}	{"full": "karim testin"}	\N	\N	c8ab7590-3172-4bdc-9796-e710fe6850b5	a611493f-3782-4b32-9d89-8b4bf92f0526
df742c04-482f-4b8c-96b8-2c167db3bc99	9	client@test.com	20156555155655	0000	2021-07-06 20:47:19.566675+00	2021-07-28 10:24:41.509164+00	\N	{"full": "تجربة عميل"}	{"profile_img": {"url": "http://res.cloudinary.com/mellw/image/upload/v1627467880/mellw_uploads/u25j1oswsxgdhetzc0fj.png", "etag": "f67f6d58fefa445d388166cf16d040bf", "tags": [], "type": "upload", "bytes": 210610, "width": 613, "format": "png", "height": 472, "api_key": "329246125839327", "version": 1627467880, "asset_id": "fedf7cd9ab687cde047dc9fc6a5bce65", "public_id": "mellw_uploads/u25j1oswsxgdhetzc0fj", "signature": "442ed2585c39a92ccccfa442a1eb46e9ae62fc16", "created_at": "2021-07-28T10:24:40Z", "secure_url": "https://res.cloudinary.com/mellw/image/upload/v1627467880/mellw_uploads/u25j1oswsxgdhetzc0fj.png", "version_id": "b5c08452461f057bffb02fb0eaab98ac", "placeholder": false, "resource_type": "image", "original_filename": "file"}}	\N	c8ab7590-3172-4bdc-9796-e710fe6850b5	04c2a85e-6e8c-4abb-8154-c640bb96c067
\.
COPY public.mnt_site (id, code, label, location, ext_data, media, created_at, deleted_at) FROM stdin;
3c463de5-c420-4ff8-be3f-9a28e7e7c757	1	{"ar": "مدينة البستان", "en": "Bostan City"}	\N	\N	\N	2021-06-21 21:26:08.334008+00	\N
\.
COPY public.mnt_project (id, code, site_id, label, ext_data, media, created_at, updated_at) FROM stdin;
82fd80a4-c1e3-4973-bb49-3e608028264c	1	3c463de5-c420-4ff8-be3f-9a28e7e7c757	{"ar": "ابراج المشروع", "en": "Proj Buildings"}	\N	\N	2021-07-06 14:37:03.185275+00	2021-07-06 14:37:03.185275+00
2a1543b7-14db-49a7-877b-34286ed46903	3	3c463de5-c420-4ff8-be3f-9a28e7e7c757	{"ar": "ابراج المشروع 2", "en": "Tower 2"}	\N	\N	2021-07-27 08:32:35.99605+00	2021-07-27 08:32:35.99605+00
\.
COPY public.mnt_unit (id, created_at, updated_at, project_id, unit_number, code, ext_data, address_id, is_contract_agree) FROM stdin;
eefaac3c-0edf-4440-a705-98d565aa5c6c	2021-07-11 15:08:19.923153+00	2021-07-11 15:08:19.923153+00	82fd80a4-c1e3-4973-bb49-3e608028264c	15	13	\N	\N	f
83a09fa5-058e-422d-9840-0dc47e380f92	2021-07-12 05:51:13.741561+00	2021-07-12 05:51:13.741561+00	82fd80a4-c1e3-4973-bb49-3e608028264c	17	2	\N	\N	f
5a124cd2-42d3-4dc4-b15e-ee5a179259c9	2021-07-12 15:46:51.140205+00	2021-07-12 15:46:51.140205+00	82fd80a4-c1e3-4973-bb49-3e608028264c	88	6	\N	\N	f
2147b360-b72b-4109-80f4-f9cda2353df6	2021-07-24 23:16:05.447552+00	2021-07-24 23:16:05.447552+00	82fd80a4-c1e3-4973-bb49-3e608028264c	89	8	\N	\N	f
c250e883-dc99-49ab-acae-6fc92d3ddd0f	2021-07-27 08:33:05.127995+00	2021-07-27 08:33:05.127995+00	2a1543b7-14db-49a7-877b-34286ed46903	63	9	\N	\N	f
aca85a95-125a-4907-b63c-6580d3723900	2021-07-06 14:37:26.984447+00	2021-07-27 11:52:27.533745+00	82fd80a4-c1e3-4973-bb49-3e608028264c	12	1	\N	\N	t
bdaa00fe-f3a0-4203-aa28-2b34fc7b7136	2021-07-13 13:08:36.574036+00	2021-07-27 11:55:16.916861+00	82fd80a4-c1e3-4973-bb49-3e608028264c	95	7	\N	\N	t
f8cd3e89-906e-44bd-8bda-91657d930456	2021-07-12 11:18:43.189996+00	2021-07-27 12:23:11.899079+00	82fd80a4-c1e3-4973-bb49-3e608028264c	33	3	\N	\N	t
\.
COPY public.mnt_address (address, lat, lng, id, code, ext_data, media, unit_id, created_at, updated_at) FROM stdin;
located some where where you can see it hahaha	\N	\N	212c290b-6e03-4b5b-9e63-f3eae2fc91ac	1	\N	\N	5a124cd2-42d3-4dc4-b15e-ee5a179259c9	2021-07-25 09:37:23.246542+00	2021-07-25 09:37:23.246542+00
\.
COPY public.mnt_contract (id, unit_id, start_date, end_date, created_at, updated_at, code) FROM stdin;
5e1da7cd-54f6-4fec-be50-a9b861e4ea8d	aca85a95-125a-4907-b63c-6580d3723900	2021-07-13	2023-10-26	2021-07-13 09:52:26.767521+00	2021-07-13 09:52:26.767521+00	1
895c2a24-9d85-4ee9-8cb0-bb8638c9b467	f8cd3e89-906e-44bd-8bda-91657d930456	2021-07-04	2025-06-16	2021-07-13 09:54:58.241935+00	2021-07-13 09:54:58.241935+00	2
6264ce33-6f54-4390-ba75-f00a99dbddd3	eefaac3c-0edf-4440-a705-98d565aa5c6c	2021-07-08	2023-10-27	2021-07-13 09:55:20.285074+00	2021-07-13 09:55:20.285074+00	3
a525ac21-a148-4ce8-9e11-93040cc5bb9e	83a09fa5-058e-422d-9840-0dc47e380f92	2018-10-25	2022-10-20	2021-07-13 09:55:43.223557+00	2021-07-13 09:55:43.223557+00	4
f5bdd72b-1dd1-40f3-9d19-c0f7737309ee	5a124cd2-42d3-4dc4-b15e-ee5a179259c9	2022-10-19	2026-12-31	2021-07-13 09:56:10.361848+00	2021-07-13 09:56:10.361848+00	5
a7bf1bd8-7fc0-4a6a-bcd2-e2b32c08c73a	bdaa00fe-f3a0-4203-aa28-2b34fc7b7136	2020-01-19	2027-12-31	2021-07-13 13:09:20.541141+00	2021-07-13 13:09:20.541141+00	6
\.
COPY public.mnt_item (id, code, label, created_at, updated_at, default_price, default_month_period, ext_data, deleted_at) FROM stdin;
2f8dd894-902a-45d8-bcda-67085724a0f2	2	{"ar": "سباكة", "en": "Plumbing"}	2021-07-06 12:09:09.834383+00	2021-07-11 14:33:41.729331+00	300.0	6	\N	\N
9cc0aefe-91dd-4f32-a165-64625a10400f	3	{"ar": "نجارة", "en": "Carpentry"}	2021-07-06 12:09:33.717798+00	2021-07-11 14:33:48.776374+00	250.0	12	\N	\N
bdd3672a-dbf9-40d2-81fe-34b4edb3f9d3	4	{"ar": "تكييف", "en": "Air Conditions"}	2021-07-06 12:10:15.098668+00	2021-07-11 14:33:59.885192+00	400.0	24	\N	\N
8cf2ab02-251c-445a-bc98-7b5fe90c419e	5	{"ar": "صيانة حدائق", "en": "Gardens Manitenance"}	2021-07-11 15:07:06.780342+00	2021-07-11 15:07:06.780342+00	400.0	12	\N	\N
\.
COPY public.mnt_contract_item (id, code, created_at, updated_at, contract_id, mnt_item_id, period_in_monthes, end_date, ext_data) FROM stdin;
6081eee9-a445-46cd-8e0c-075dab99d598	3	2021-07-26 12:53:32.237906+00	2021-07-26 12:53:32.237906+00	5e1da7cd-54f6-4fec-be50-a9b861e4ea8d	8cf2ab02-251c-445a-bc98-7b5fe90c419e	5	2021-10-26 00:00:00+00	\N
4871a889-bf5a-450c-976a-e3be91995ea7	4	2021-07-26 12:56:24.759556+00	2021-07-26 12:56:24.759556+00	5e1da7cd-54f6-4fec-be50-a9b861e4ea8d	9cc0aefe-91dd-4f32-a165-64625a10400f	7	2021-07-27 00:00:00+00	\N
1e237a86-ee12-4615-877c-d1cc8b5902d4	6	2021-07-27 12:18:32.848168+00	2021-07-27 12:18:32.848168+00	895c2a24-9d85-4ee9-8cb0-bb8638c9b467	bdd3672a-dbf9-40d2-81fe-34b4edb3f9d3	8	2021-08-28 00:00:00+00	\N
\.
COPY public.mnt_customer_unit (id, created_at, updated_at, unit_id, customer_id, code, ext_data) FROM stdin;
f3eb7d3b-0ec1-4821-b1a1-fdcc49730e62	2021-07-06 14:41:18.443897+00	2021-07-06 14:41:18.443897+00	aca85a95-125a-4907-b63c-6580d3723900	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	1	\N
9e9a148a-6e77-4873-baac-da8824111e1c	2021-07-11 15:09:52.193026+00	2021-07-11 15:09:52.193026+00	eefaac3c-0edf-4440-a705-98d565aa5c6c	330ff0cc-d48f-46a4-a05a-b28a7c9fea6c	3	\N
affd72d9-c87b-4c27-980e-1770e3a8c5b0	2021-07-12 05:51:25.885598+00	2021-07-12 05:51:25.885598+00	83a09fa5-058e-422d-9840-0dc47e380f92	bf24a9dc-b48d-466f-9011-5d287e089891	4	\N
179567e1-646d-4f09-b701-8ff00f79f11a	2021-07-12 11:19:27.425142+00	2021-07-12 11:19:27.425142+00	f8cd3e89-906e-44bd-8bda-91657d930456	04c2a85e-6e8c-4abb-8154-c640bb96c067	5	\N
a00e1d09-c9f1-4296-a22d-9aea26dffd92	2021-07-12 15:48:06.603592+00	2021-07-12 15:48:06.603592+00	5a124cd2-42d3-4dc4-b15e-ee5a179259c9	41a6c2df-9227-4884-8128-dab9e38f04df	8	\N
8bc6d5b9-0858-408d-8127-192805209f1e	2021-07-13 13:08:55.505794+00	2021-07-13 13:08:55.505794+00	bdaa00fe-f3a0-4203-aa28-2b34fc7b7136	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	9	\N
bedf564a-2e5a-481a-85d9-30a2467423df	2021-07-24 23:16:22.078696+00	2021-07-24 23:16:47.954558+00	2147b360-b72b-4109-80f4-f9cda2353df6	41a6c2df-9227-4884-8128-dab9e38f04df	10	\N
cf57b5ac-e00d-49ad-b433-a3070fa4ca55	2021-07-25 09:04:17.962939+00	2021-07-25 09:04:17.962939+00	f8cd3e89-906e-44bd-8bda-91657d930456	b74ca8d4-97b4-40af-956d-8447b9fe2f58	16	\N
8bff316f-383a-488f-b25b-02361f4a2a82	2021-07-25 09:11:24.722757+00	2021-07-25 09:11:24.722757+00	83a09fa5-058e-422d-9840-0dc47e380f92	b74ca8d4-97b4-40af-956d-8447b9fe2f58	21	\N
2d31ab26-915c-4aa5-a8b8-6169190ef499	2021-07-25 09:11:51.50959+00	2021-07-25 09:11:51.50959+00	5a124cd2-42d3-4dc4-b15e-ee5a179259c9	b74ca8d4-97b4-40af-956d-8447b9fe2f58	22	\N
85f99419-9fd7-499d-8434-a61747365397	2021-07-25 13:48:01.825952+00	2021-07-25 13:48:01.825952+00	2147b360-b72b-4109-80f4-f9cda2353df6	b74ca8d4-97b4-40af-956d-8447b9fe2f58	24	\N
9f54769c-025f-45d5-8436-c3d290b4e4fc	2021-07-26 10:11:47.908716+00	2021-07-26 10:11:47.908716+00	83a09fa5-058e-422d-9840-0dc47e380f92	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	26	\N
8e919af9-8e75-474d-a0f2-40f78c011038	2021-07-27 08:33:30.874187+00	2021-07-27 08:33:30.874187+00	c250e883-dc99-49ab-acae-6fc92d3ddd0f	a611493f-3782-4b32-9d89-8b4bf92f0526	27	\N
\.
COPY public.mnt_request_status_type (id, code, label, created_at, updated_at) FROM stdin;
9369c555-f873-4447-b016-c28dc2d4e1b6	1	{"ar": "جديد", "en": "new"}	2021-07-11 10:35:48.163407+00	2021-07-11 10:35:48.163407+00
90d8232e-ee6d-40ce-ac37-9fd3cbc86212	2	{"ar": "معاينة", "en": "preview"}	2021-07-11 10:36:03.052745+00	2021-07-26 09:36:15.947871+00
3e564c80-a6e1-494a-93aa-458362580482	3	{"ar": "تنفيذ", "en": "execute"}	2021-07-11 10:36:30.753672+00	2021-07-26 09:36:47.859303+00
49cc98cd-e76b-4518-9bc4-e72cda6b89ed	4	{"ar": "تم الاصلاح", "en": "done"}	2021-07-26 09:37:11.341425+00	2021-07-26 09:37:11.341425+00
\.
COPY public.mnt_request (id, code, created_at, updated_at, customer_id, ext_data, media, notes, unit_id, request_status_id, is_urgent) FROM stdin;
49b7f79d-1fa6-4fe2-b36b-1d24f3d350fe	76	2021-07-27 12:29:24.894285+00	2021-07-27 12:29:24.894285+00	04c2a85e-6e8c-4abb-8154-c640bb96c067	\N	\N	Notes on Request	f8cd3e89-906e-44bd-8bda-91657d930456	9369c555-f873-4447-b016-c28dc2d4e1b6	t
da51b8b3-346c-42e4-a9b2-6b5e822d4fbd	68	2021-07-14 13:52:03.070683+00	2021-07-14 13:52:03.070683+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	{"reRequested": true}	\N	this is my second request of the same service	aca85a95-125a-4907-b63c-6580d3723900	9369c555-f873-4447-b016-c28dc2d4e1b6	f
b6522e33-14de-4066-80a6-c30d195f076d	71	2021-07-14 14:01:41.659776+00	2021-07-26 09:35:16.52459+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	{"reRequested": true}	\N	revalidate refetech after remake	aca85a95-125a-4907-b63c-6580d3723900	90d8232e-ee6d-40ce-ac37-9fd3cbc86212	f
4a554f5c-dada-47ae-8a2f-f74522f4f699	42	2021-07-12 06:01:58.605786+00	2021-07-26 10:46:14.130601+00	bf24a9dc-b48d-466f-9011-5d287e089891	\N	\N	Testing Maint Request	83a09fa5-058e-422d-9840-0dc47e380f92	90d8232e-ee6d-40ce-ac37-9fd3cbc86212	f
0d80a750-5dfe-440b-8cb8-811f3b2f256f	66	2021-07-12 15:50:14.609585+00	2021-07-12 15:54:03.510873+00	41a6c2df-9227-4884-8128-dab9e38f04df	\N	\N	note for customer	5a124cd2-42d3-4dc4-b15e-ee5a179259c9	3e564c80-a6e1-494a-93aa-458362580482	f
0e9398f1-576b-4ba6-a7c3-85e09b80c440	1	2021-07-06 15:28:22.107747+00	2021-07-12 10:40:37.64849+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	\N	\N	My first servic	aca85a95-125a-4907-b63c-6580d3723900	90d8232e-ee6d-40ce-ac37-9fd3cbc86212	f
87b10057-e8bf-42a2-a7bc-0f25311c8505	41	2021-07-10 15:15:29.741938+00	2021-07-13 15:17:24.327491+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	{"customer_rate": 4, "customer_rate_notes": "good service, but he seemed a bit in experinced and took longer time "}	\N	additional notes	aca85a95-125a-4907-b63c-6580d3723900	3e564c80-a6e1-494a-93aa-458362580482	f
f547999d-ee3b-4523-91b1-499515f928dd	73	2021-07-27 08:39:58.666856+00	2021-07-27 08:39:58.666856+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	\N	\N	request not urgent 	aca85a95-125a-4907-b63c-6580d3723900	9369c555-f873-4447-b016-c28dc2d4e1b6	f
69225e43-9073-4757-834f-b04bff647350	69	2021-07-14 13:54:22.433354+00	2021-07-27 08:41:21.259336+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	{"reRequested": true}	\N	one more time 	aca85a95-125a-4907-b63c-6580d3723900	3e564c80-a6e1-494a-93aa-458362580482	f
2ba6181d-74b9-4a25-bb78-8dc309f02c63	75	2021-07-27 08:43:47.664294+00	2021-07-27 08:43:47.664294+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	\N	\N	request is urgent	83a09fa5-058e-422d-9840-0dc47e380f92	9369c555-f873-4447-b016-c28dc2d4e1b6	t
5fd50079-c821-457b-9a92-968433b8359b	72	2021-07-27 08:35:37.20076+00	2021-07-27 09:37:47.181898+00	a611493f-3782-4b32-9d89-8b4bf92f0526	\N	\N	tested	c250e883-dc99-49ab-acae-6fc92d3ddd0f	3e564c80-a6e1-494a-93aa-458362580482	f
264563e6-bfc8-46d7-8fb2-8c146e0ebc84	9	2021-07-08 10:57:43.510834+00	2021-07-27 09:38:03.673017+00	04c2a85e-6e8c-4abb-8154-c640bb96c067	\N	\N	9999	aca85a95-125a-4907-b63c-6580d3723900	3e564c80-a6e1-494a-93aa-458362580482	f
95e5f592-7f68-4669-bdda-46d46ba432bd	70	2021-07-14 14:00:24.916303+00	2021-07-27 09:39:30.397306+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	\N	\N	testing it	bdaa00fe-f3a0-4203-aa28-2b34fc7b7136	3e564c80-a6e1-494a-93aa-458362580482	f
296c7377-c802-46f0-8dce-0f90431c43ea	57	2021-07-12 11:42:51.261413+00	2021-07-27 09:45:33.286186+00	04c2a85e-6e8c-4abb-8154-c640bb96c067	\N	\N	ip ip u	f8cd3e89-906e-44bd-8bda-91657d930456	49cc98cd-e76b-4518-9bc4-e72cda6b89ed	f
0c52ac85-955a-4b4b-bb3a-d27e77ffbb5d	67	2021-07-13 13:10:15.068018+00	2021-07-27 09:46:24.834405+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	\N	\N	Testing filters for unit number	bdaa00fe-f3a0-4203-aa28-2b34fc7b7136	49cc98cd-e76b-4518-9bc4-e72cda6b89ed	f
9e963e22-6b91-4f5b-8b4d-8b634fe21d6a	8	2021-07-08 10:53:49.850837+00	2021-07-27 09:46:46.274849+00	1a4d9635-f168-4e24-b1ee-3dfde0e9f360	\N	\N	ملحوظة علي الاصلاح	aca85a95-125a-4907-b63c-6580d3723900	49cc98cd-e76b-4518-9bc4-e72cda6b89ed	f
\.
COPY public.mnt_request_assign (id, code, request_id, technician_id, ext_data, media, created_at, updated_at, assign_date) FROM stdin;
ec3a6e5a-9318-423a-b72e-63444b42e58d	127	296c7377-c802-46f0-8dce-0f90431c43ea	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	{"completed": true, "start_time": "2021-07-26T13:16:31.014Z", "finish_time": "2021-07-27T09:45:33.141Z"}	\N	2021-07-26 10:46:03.727894+00	2021-07-27 09:45:33.286186+00	2021-07-26 00:00:00+00
4a85334a-5607-4ff6-8db3-25e77c12f2b1	125	0c52ac85-955a-4b4b-bb3a-d27e77ffbb5d	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	{"completed": true, "start_time": "2021-07-27T09:43:03.507Z", "finish_time": "2021-07-27T09:46:25.940Z"}	\N	2021-07-26 10:35:59.474141+00	2021-07-27 09:46:24.834405+00	2021-08-05 00:00:00+00
37083f7c-7057-4fe4-8f21-b90a6bfb5548	131	9e963e22-6b91-4f5b-8b4d-8b634fe21d6a	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	{"completed": true, "start_time": "2021-07-27T09:45:05.621Z", "finish_time": "2021-07-27T09:46:48.218Z"}	\N	2021-07-26 10:51:46.564915+00	2021-07-27 09:46:46.274849+00	2021-07-27 00:00:00+00
fe5cfb58-3b23-4709-a621-463f399af405	123	0d80a750-5dfe-440b-8cb8-811f3b2f256f	857ff610-26be-473a-878b-cec628262b72	{"cost": "200", "completed": true, "start_time": "2021-07-12T15:53:14.893Z", "finish_time": "2021-07-12T15:54:03.125Z", "Technician_notes": "notes from tech"}	\N	2021-07-12 15:52:51.584746+00	2021-07-12 15:54:03.510873+00	2021-07-12 00:00:00+00
271e3f6f-06a3-4b72-8cf2-615083259e94	119	87b10057-e8bf-42a2-a7bc-0f25311c8505	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	{"cost": "250", "completed": true, "start_time": "2021-07-13T14:23:31.382Z", "finish_time": "2021-07-13T14:23:47.698Z", "Technician_notes": "notes here "}	\N	2021-07-12 11:16:48.159651+00	2021-07-13 14:23:48.230271+00	2021-07-14 00:00:00+00
87047b1e-4ae5-43d1-935a-b0d80a85ccc4	129	69225e43-9073-4757-834f-b04bff647350	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	{"cost": "0", "completed": true, "start_time": "2021-07-27T08:40:57.670Z", "finish_time": "2021-07-27T08:41:20.109Z"}	\N	2021-07-26 10:49:12.5304+00	2021-07-27 08:41:21.259336+00	2021-07-28 00:00:00+00
5ed92da0-0334-472f-989f-d6ece0fae9f3	132	5fd50079-c821-457b-9a92-968433b8359b	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	{"start_time": "2021-07-27T09:37:48.263Z"}	\N	2021-07-27 08:37:17.648136+00	2021-07-27 09:37:47.181898+00	2021-07-28 00:00:00+00
45601f0a-32c1-4a5e-b993-03445a443345	126	264563e6-bfc8-46d7-8fb2-8c146e0ebc84	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	{"start_time": "2021-07-27T09:38:01.710Z"}	\N	2021-07-26 10:45:50.655775+00	2021-07-27 09:38:03.673017+00	2021-07-26 00:00:00+00
50022751-6672-4ee6-bcc6-7ad27e017726	130	95e5f592-7f68-4669-bdda-46d46ba432bd	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	{"start_time": "2021-07-27T09:39:30.940Z"}	\N	2021-07-26 10:49:41.024637+00	2021-07-27 09:39:30.397306+00	2021-07-29 00:00:00+00
96ed0c7a-23a8-436c-be3a-0abc9b05f0af	116	0e9398f1-576b-4ba6-a7c3-85e09b80c440	dbfc59ec-ccb2-40fd-b53c-22860b9c442f	\N	\N	2021-07-12 10:40:40.25217+00	2021-07-12 10:40:40.25217+00	2021-07-14 00:00:00+00
ba1a4a5f-27aa-486b-8fe2-446ccd8a8c20	124	b6522e33-14de-4066-80a6-c30d195f076d	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	\N	\N	2021-07-26 09:35:21.051623+00	2021-07-26 09:35:21.051623+00	2021-07-28 00:00:00+00
51fdb090-c1f5-44ed-9a14-70aefac7cc32	128	4a554f5c-dada-47ae-8a2f-f74522f4f699	b0b4f83d-b5a9-461c-8fcc-9db8ee59a95a	\N	\N	2021-07-26 10:46:15.870693+00	2021-07-26 10:46:15.870693+00	2021-07-27 00:00:00+00
\.
COPY public.mnt_request_item (id, code, mnt_item_id, mnt_request_id, ext_data) FROM stdin;
\.
COPY public.mnt_request_status (id, code, request_id, req_status_type_id, ext_data, media, created_at, updated_at) FROM stdin;
5da3c7dd-621c-4537-91a3-15336cbd7d80	2	264563e6-bfc8-46d7-8fb2-8c146e0ebc84	9369c555-f873-4447-b016-c28dc2d4e1b6	\N	\N	2021-07-11 11:01:25.864563+00	2021-07-11 11:01:25.864563+00
\.
SELECT pg_catalog.setval('public.bsc_customer_code_seq', 12, true);
SELECT pg_catalog.setval('public.bsc_customer_type_code_seq', 3, true);
SELECT pg_catalog.setval('public.core_usertype_code_seq', 3, true);
SELECT pg_catalog.setval('public.mnt_address_code_seq', 1, true);
SELECT pg_catalog.setval('public.mnt_contract_code_seq', 6, true);
SELECT pg_catalog.setval('public.mnt_contract_item_code_seq', 6, true);
SELECT pg_catalog.setval('public.mnt_customer_unit_code_seq', 27, true);
SELECT pg_catalog.setval('public.mnt_items_code_seq', 5, true);
SELECT pg_catalog.setval('public.mnt_projects_code_seq', 3, true);
SELECT pg_catalog.setval('public.mnt_request_assign_code_seq', 132, true);
SELECT pg_catalog.setval('public.mnt_request_code_seq', 76, true);
SELECT pg_catalog.setval('public.mnt_request_item_code_seq', 1, false);
SELECT pg_catalog.setval('public.mnt_request_status_code_seq', 4, true);
SELECT pg_catalog.setval('public.mnt_request_status_code_seq1', 2, true);
SELECT pg_catalog.setval('public.mnt_site_code_seq', 1, true);
SELECT pg_catalog.setval('public.mnt_unit_code_seq', 9, true);
SELECT pg_catalog.setval('public.users_code_seq', 19, true);
