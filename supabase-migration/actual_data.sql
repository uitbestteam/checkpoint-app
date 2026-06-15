SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict xhPVemKith3S79fOSxoOlF0m6n5YHOQapwHTi0iHkOSESMF8LwMRZIIegTa56OR

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."custom_oauth_providers" ("id", "provider_type", "identifier", "name", "client_id", "client_secret", "acceptable_client_ids", "scopes", "pkce_enabled", "attribute_mapping", "authorization_params", "enabled", "email_optional", "issuer", "discovery_url", "skip_nonce_check", "cached_discovery", "discovery_cached_at", "authorization_url", "token_url", "userinfo_url", "jwks_uri", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at", "invite_token", "referrer", "oauth_client_state_id", "linking_target_id", "email_optional") FROM stdin;
5cdd2922-24b9-4e25-8447-98be5cd38e6a	\N	\N	\N	\N	google			2026-06-11 06:49:35.138975+00	2026-06-11 06:49:35.138975+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
662206d7-056c-410c-9574-0950ed36003a	\N	\N	\N	\N	google			2026-06-11 08:40:54.651861+00	2026-06-11 08:40:54.651861+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
07b9ae2f-a6e8-4b01-85bb-0fd77344767d	\N	\N	\N	\N	google			2026-06-12 06:08:33.714754+00	2026-06-12 06:08:33.714754+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
25889752-dd3c-44a1-ba2f-fd78809e54c5	\N	\N	\N	\N	google			2026-06-12 06:16:29.260687+00	2026-06-12 06:16:29.260687+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
04df89d5-b811-4889-8bbb-b9859537313b	\N	\N	\N	\N	google			2026-06-13 00:12:48.777152+00	2026-06-13 00:12:48.777152+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
2bced634-adea-400f-9ca2-0441198f18f3	\N	\N	\N	\N	google			2026-06-13 11:05:40.485624+00	2026-06-13 11:05:40.485624+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
4f66a499-8629-411b-8096-ca04d93522dc	\N	\N	\N	\N	google			2026-06-13 15:26:32.632312+00	2026-06-13 15:26:32.632312+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
8b195db7-283d-4509-838d-3cd2b7ddd030	\N	\N	\N	\N	google			2026-06-13 15:26:46.686323+00	2026-06-13 15:26:46.686323+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
05c6005d-fc28-49c3-88fb-75a7b105230d	\N	\N	\N	\N	google			2026-06-13 15:28:18.777947+00	2026-06-13 15:28:18.777947+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
d62d042f-27d0-4a5a-9917-980f8808e537	\N	\N	\N	\N	google			2026-06-13 15:33:37.72211+00	2026-06-13 15:33:37.72211+00	oauth	\N	\N	https://checkpoint-web.dev-hongquan.workers.dev	\N	\N	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") FROM stdin;
00000000-0000-0000-0000-000000000000	e7c7a2bb-c3ff-4bb4-8f78-9eaad620cad7	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 01:45:57.916855+00	{}	{}	\N	2026-06-11 01:45:57.886476+00	2026-06-11 01:45:57.925635+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	753a48d6-dbfc-4917-af77-c123616683f8	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 04:32:42.552506+00	{}	{}	\N	2026-06-10 04:32:42.537847+00	2026-06-10 05:33:13.081072+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	7bc60ae4-1e67-41a9-9b95-f27b33ecbf62	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 04:42:30.674712+00	{}	{}	\N	2026-06-10 04:42:30.664386+00	2026-06-14 04:00:02.461376+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	ec06f433-d526-4837-be90-6c5507c5b435	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 04:42:43.786599+00	{}	{}	\N	2026-06-10 04:42:43.780093+00	2026-06-11 03:15:21.589504+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a32d08ad-cfa4-4b66-9fab-fbbb94fd4c42	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:37:22.318949+00	{}	{}	\N	2026-06-12 07:37:22.311348+00	2026-06-12 07:37:22.323467+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	88592718-7475-4d65-bdd3-56b3242cbf2d	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:38:26.354944+00	{}	{}	\N	2026-06-12 07:38:26.352785+00	2026-06-12 07:38:26.356662+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a0138e1f-b2d5-493c-841d-f0f6fa9591ae	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:37:50.500653+00	{}	{}	\N	2026-06-12 07:37:50.493526+00	2026-06-12 07:37:50.502708+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	03d71ade-0176-41ed-ba4d-84d62214cb46	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-14 04:00:04.626807+00	{}	{}	\N	2026-06-14 04:00:04.620356+00	2026-06-14 04:00:04.633729+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	9eff9a68-8377-48e1-9055-7dfd329d45f3	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 10:01:07.039327+00	{}	{}	\N	2026-06-10 10:01:07.00874+00	2026-06-11 03:02:21.916748+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	669fac28-307a-4710-83a1-1ff49a1de9f5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 06:44:58.702003+00	{}	{}	\N	2026-06-12 06:44:58.699737+00	2026-06-12 15:54:33.38623+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	6269d783-cbb6-486a-a376-7d0d16aefcaf	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:38:53.907483+00	{}	{}	\N	2026-06-12 07:38:53.905289+00	2026-06-12 07:38:53.909341+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	2fdf9677-2cc8-4776-98c8-aaa6d8f008d7	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 04:08:30.319779+00	{}	{}	\N	2026-06-13 04:08:30.303024+00	2026-06-14 09:01:10.198109+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	51d193d4-d889-4ee4-af7a-02e643d00703	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:21:42.810408+00	{}	{}	\N	2026-06-11 04:21:42.714762+00	2026-06-11 04:21:42.864743+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	9dfa9573-2ab0-4f11-90c8-178c28e48761	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:39:07.110311+00	{}	{}	\N	2026-06-12 07:39:07.108231+00	2026-06-12 07:39:07.117468+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f0acbc44-483d-449d-8380-f3b7ef5ca7d2	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 06:43:25.114543+00	{}	{}	\N	2026-06-11 06:43:25.111109+00	2026-06-11 06:43:25.116501+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	54e610db-68cd-4162-9714-db38ad23df40	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 05:53:58.172192+00	{}	{}	\N	2026-06-10 05:53:58.09347+00	2026-06-14 10:14:43.002504+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	9b64fa66-2e4a-4a28-8794-7ee7fc732b48	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 14:59:27.703107+00	{}	{}	\N	2026-06-10 14:59:27.642527+00	2026-06-13 10:30:24.904612+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	50456677-11a5-4567-9cc3-20d4624bd430	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:40:05.463717+00	{}	{}	\N	2026-06-12 07:40:05.461446+00	2026-06-12 07:40:05.465611+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	c4e67583-7df6-48f5-bae0-1244fbab4021	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:40:06.364423+00	{}	{}	\N	2026-06-12 07:40:06.362305+00	2026-06-12 07:40:06.366405+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	7829ee34-4dd6-4e6b-9aaf-7e5bd5c1a8b1	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 06:42:27.739237+00	{}	{}	\N	2026-06-11 06:42:27.716364+00	2026-06-11 06:42:27.749573+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	06d23a82-219a-4d0b-8a9d-249bf291e615	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 06:36:33.631808+00	{}	{}	\N	2026-06-10 06:36:33.566097+00	2026-06-13 12:37:21.39432+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	3365234f-6ef5-4b87-a306-ce324a246577	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 04:15:13.349635+00	{}	{}	\N	2026-06-10 04:15:13.338908+00	2026-06-10 13:09:32.67645+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b0309d1a-bee7-4ccd-957d-c86becc726ae	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 06:03:46.168948+00	{}	{}	\N	2026-06-10 06:03:46.136484+00	2026-06-10 07:35:24.977103+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f7df0f03-9ba8-4b47-8881-20e1f071a4f8	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 06:43:42.631072+00	{}	{}	\N	2026-06-11 06:43:42.576005+00	2026-06-11 06:43:42.645251+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	eff3ca66-3d2c-4895-bfaa-a5f528c2dcab	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 06:42:29.888265+00	{}	{}	\N	2026-06-11 06:42:29.885618+00	2026-06-11 06:42:29.896664+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	1073e7a6-ddb4-4375-83c8-84d4eecc5475	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 15:28:27.623556+00	{}	{}	\N	2026-06-13 15:28:27.604717+00	2026-06-13 15:28:27.637237+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b39a4e04-acf5-41fd-997d-526640e0584f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 07:40:30.381682+00	{}	{}	\N	2026-06-10 07:40:30.37745+00	2026-06-10 07:40:30.383648+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	7f290992-7cc2-4a46-8f3e-48c89a5cc603	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 06:44:06.393125+00	{}	{}	\N	2026-06-11 06:44:06.38562+00	2026-06-11 06:44:06.39511+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	20df83a9-2659-4754-87ba-21518a7c18fe	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 04:38:52.92246+00	{}	{}	\N	2026-06-10 04:38:52.911989+00	2026-06-10 14:07:08.790234+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	daa2947e-d5bb-4df7-b4f5-69505655e639	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 06:44:08.228681+00	{}	{}	\N	2026-06-11 06:44:08.224604+00	2026-06-11 06:44:08.230495+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	94e11b1c-7330-4214-a522-4abd72dafa27	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 06:12:41.944967+00	{}	{}	\N	2026-06-10 06:12:41.92858+00	2026-06-12 06:08:31.297003+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	7fca6250-e697-45f9-8b21-cbdfdea4da45	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 06:56:32.876062+00	{}	{}	\N	2026-06-11 06:56:32.857023+00	2026-06-11 06:56:32.883643+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	13387259-398e-4d7a-9469-9d5eefa409bc	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:29:54.186237+00	{}	{}	\N	2026-06-12 08:29:54.170897+00	2026-06-12 08:29:54.190301+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a188a19d-c9fe-4add-aa2d-4fa0050fd5b4	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 06:44:24.516758+00	{}	{}	\N	2026-06-12 06:44:24.49897+00	2026-06-12 09:18:36.075103+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	36d717a2-6458-42c3-ab63-2421230477ba	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:34:46.336582+00	{}	{}	\N	2026-06-12 07:34:46.32234+00	2026-06-12 07:34:46.344804+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a75e8f74-ae56-446e-97b2-ec3e889bd986	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:42:02.612463+00	{}	{}	\N	2026-06-12 08:42:02.60466+00	2026-06-12 08:42:02.615113+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	c13f83d6-3c10-4cff-b07f-a6817fce40f5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:35:57.357721+00	{}	{}	\N	2026-06-12 07:35:57.341647+00	2026-06-12 07:35:57.360954+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b37a2603-11ba-4c3c-8225-adf08f82e461	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:35:09.805063+00	{}	{}	\N	2026-06-12 07:35:09.802977+00	2026-06-12 07:35:09.806741+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	ce25f033-b6b0-4155-998e-94acb4da6483	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:42:04.844162+00	{}	{}	\N	2026-06-12 08:42:04.841955+00	2026-06-12 08:42:04.851333+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	8d4af825-f434-48e7-aaa1-8d753fb3c782	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:35:11.651601+00	{}	{}	\N	2026-06-12 07:35:11.649528+00	2026-06-12 07:35:11.653497+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	49b634c7-f3be-4b92-b9c7-ce03d4014db9	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:32:18.9535+00	{}	{}	\N	2026-06-12 09:32:18.926035+00	2026-06-12 09:32:18.96597+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	20123896-bd7c-4afc-9b61-08de7592d4e1	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:35:34.146132+00	{}	{}	\N	2026-06-12 07:35:34.144048+00	2026-06-12 07:35:34.147899+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	0274cd59-9615-451e-848c-fd15bfe6bacc	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:36:05.990039+00	{}	{}	\N	2026-06-12 07:36:05.987999+00	2026-06-12 07:36:05.991864+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	e27fb815-f136-4969-a4da-061056cc55e0	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:32:21.771616+00	{}	{}	\N	2026-06-12 09:32:21.769318+00	2026-06-12 09:32:21.773711+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f7f722f8-d85a-4f47-a94a-01afd1911b92	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:36:10.603952+00	{}	{}	\N	2026-06-12 07:36:10.602164+00	2026-06-12 07:36:10.611437+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	6b3ec4de-d1e6-495b-984a-d07744255357	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:40:44.986057+00	{}	{}	\N	2026-06-12 07:40:44.937823+00	2026-06-12 07:40:44.999119+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	ce4f5c2d-c5d1-42ab-999f-70d2e88b52e4	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:34:02.380181+00	{}	{}	\N	2026-06-12 09:34:02.367887+00	2026-06-12 09:34:02.385252+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b8ff4154-afb9-402e-b12f-e0db6b0357f3	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:04:36.124559+00	{}	{}	\N	2026-06-12 08:04:36.122519+00	2026-06-12 08:04:36.126346+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	1da7e9b5-2cba-4b87-af95-16339a23a7fa	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:28:32.73151+00	{}	{}	\N	2026-06-10 13:28:32.644135+00	2026-06-10 13:28:32.775296+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	4c0fb5ef-d61b-4d24-bc28-0cbc9201f710	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:40:46.622515+00	{}	{}	\N	2026-06-12 07:40:46.618234+00	2026-06-12 07:40:46.624655+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	55ebcbaf-8356-49a9-81f8-caca676b6a44	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:29:34.017645+00	{}	{}	\N	2026-06-10 13:29:34.015368+00	2026-06-10 13:29:34.019527+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	d5e9762e-d7e1-4679-9cad-7653e84f05ce	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:52:54.447668+00	{}	{}	\N	2026-06-12 07:52:54.437753+00	2026-06-12 07:52:54.459193+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	60e19456-c8e1-4dd6-b900-91573244c2a5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 03:15:23.832523+00	{}	{}	\N	2026-06-11 03:15:23.824691+00	2026-06-11 03:15:23.838583+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	cd3c27f6-ffe9-4d26-8d63-1c2cab574fe5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:33:20.447223+00	{}	{}	\N	2026-06-10 13:33:20.42314+00	2026-06-10 13:33:20.454248+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	db0c53e0-9c81-4209-9e2d-d0e78ef0a682	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:55:49.192635+00	{}	{}	\N	2026-06-12 07:55:49.176235+00	2026-06-12 07:55:49.196946+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	7a0e3d35-d34f-4656-8d93-1db86e55f68c	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:33:25.554381+00	{}	{}	\N	2026-06-10 13:33:25.552336+00	2026-06-10 13:33:25.556093+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b970951d-80f4-4308-acd9-63138826d814	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 03:15:26.724602+00	{}	{}	\N	2026-06-11 03:15:26.721078+00	2026-06-11 03:15:26.726404+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	7e586f94-c37b-4f49-a3f8-024ba3045cbe	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:00:40.906411+00	{}	{}	\N	2026-06-12 08:00:40.899975+00	2026-06-12 08:00:40.909395+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	03ddd27d-f5c3-4234-9519-52a77acecd0f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:35:10.468469+00	{}	{}	\N	2026-06-10 13:35:10.430677+00	2026-06-10 13:35:10.477378+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	225a7e35-d82f-4836-9071-b6937ed0dba2	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:03:18.198904+00	{}	{}	\N	2026-06-12 08:03:18.182596+00	2026-06-12 08:03:18.203598+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	34784636-6c24-4a69-be3d-c027ca7b64a4	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:01.079212+00	{}	{}	\N	2026-06-11 04:33:01.059809+00	2026-06-11 04:33:01.086548+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	6f7e32b3-1d33-4e7f-ada7-e9d02385143d	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:35:17.563157+00	{}	{}	\N	2026-06-10 13:35:17.560888+00	2026-06-10 13:35:17.570226+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	3600d5ae-0e04-4a6c-9436-55699f2de0a8	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 05:21:56.76143+00	{}	{}	\N	2026-06-12 05:21:56.734207+00	2026-06-14 10:16:57.208259+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	73b0f65a-e485-4038-94ff-1e27ab1c9ec5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:04:29.012561+00	{}	{}	\N	2026-06-12 08:04:29.010202+00	2026-06-12 08:04:29.014616+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	2075df08-defd-479a-8755-55f8d702a5c5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:35:44.689183+00	{}	{}	\N	2026-06-10 13:35:44.687006+00	2026-06-10 13:35:44.690922+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	998c0d62-b7d5-450a-b73e-40f9f8e61128	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:03.991693+00	{}	{}	\N	2026-06-11 04:33:03.989267+00	2026-06-11 04:33:03.993538+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	57fa0346-f5e5-4c2e-b217-376147f2b0ef	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:03:51.951369+00	{}	{}	\N	2026-06-12 08:03:51.948246+00	2026-06-12 08:03:51.953193+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a72e271e-0ded-4bc9-bac0-54c56e9667e5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:35:46.230785+00	{}	{}	\N	2026-06-10 13:35:46.22872+00	2026-06-10 13:35:46.232704+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	5050ebc5-e6b0-41d2-acf8-ceb88714a98f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 15:53:36.688151+00	{}	{}	\N	2026-06-10 15:53:36.631001+00	2026-06-13 16:12:15.61479+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	ae93a0b6-bb60-45f5-ba45-0d9dc18e2ff8	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:21.547019+00	{}	{}	\N	2026-06-11 04:33:21.544855+00	2026-06-11 04:33:21.548819+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a1d7785a-e363-401b-b505-1cad4745a196	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:35:55.058261+00	{}	{}	\N	2026-06-10 13:35:55.056218+00	2026-06-10 13:35:55.059916+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	03b58870-37b2-431a-91b9-8d88747a5d11	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:04:10.293337+00	{}	{}	\N	2026-06-12 08:04:10.29087+00	2026-06-12 08:04:10.295377+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	eafaebd2-e3b0-42c0-a616-139dc6dc1081	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-10 13:44:38.608158+00	{}	{}	\N	2026-06-10 13:44:38.589397+00	2026-06-10 13:44:38.615401+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	40635144-881b-49f4-9c45-5e9f5c3f6851	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:22.899296+00	{}	{}	\N	2026-06-11 04:33:22.897036+00	2026-06-11 04:33:22.901273+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a2711dbd-2f52-4665-b394-c80212cad9e6	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-14 10:21:36.263249+00	{}	{}	\N	2026-06-14 10:21:36.250786+00	2026-06-15 00:18:25.211816+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	e3c5d208-2b38-44fb-90e1-7d184b129dd5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:25.650212+00	{}	{}	\N	2026-06-11 04:33:25.648114+00	2026-06-11 04:33:25.654883+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f94554df-c3d8-4712-be57-9510b513c3af	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 06:49:06.252041+00	{}	{}	\N	2026-06-12 06:49:06.236144+00	2026-06-12 08:06:10.698706+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	084aaedb-b710-4ef7-8c4f-8377d53068ba	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:26.832978+00	{}	{}	\N	2026-06-11 04:33:26.830755+00	2026-06-11 04:33:26.835079+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	1f1cb1a3-faef-481e-a073-4c1c8d967fb1	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:05:00.217621+00	{}	{}	\N	2026-06-12 08:05:00.214945+00	2026-06-12 08:05:00.219724+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	2d4aca79-aefc-4553-a8d8-f79fa8cde1bb	authenticated	authenticated	baohandao2303@gmail.com	$2a$10$fnmaiQMZFjsmCociLV/NoulZ5ZwBSc3a8wekQUCmWQcGFbG9soAOi	2026-06-11 06:50:49.692332+00	\N		\N		\N			\N	2026-06-11 06:50:49.699662+00	{"provider": "email", "providers": ["email"]}	{"sub": "2d4aca79-aefc-4553-a8d8-f79fa8cde1bb", "email": "baohandao2303@gmail.com", "email_verified": true, "phone_verified": false}	\N	2026-06-11 06:50:49.667612+00	2026-06-15 01:55:48.795685+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	46876a71-605d-469f-8a9d-0488741e3c2e	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:27.943436+00	{}	{}	\N	2026-06-11 04:33:27.941546+00	2026-06-11 04:33:27.945119+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	8b25b10b-1610-4680-902f-e3f55b7f9778	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:05:03.110365+00	{}	{}	\N	2026-06-12 08:05:03.108572+00	2026-06-12 08:05:03.112055+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	5ef42176-dac4-494d-bd3e-b4ab64d14d51	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:34.807714+00	{}	{}	\N	2026-06-11 04:33:34.805796+00	2026-06-11 04:33:34.81131+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b91d6118-05e0-4e0f-9e09-7bc93bacb880	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 07:16:04.856584+00	{}	{}	\N	2026-06-11 07:16:04.843693+00	2026-06-12 06:08:42.446514+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	cd92543c-20ab-483a-8787-4c43ce91770c	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-11 04:33:41.596233+00	{}	{}	\N	2026-06-11 04:33:41.594356+00	2026-06-11 04:33:41.597934+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	5128b5ad-af23-4c12-ad9a-de7c4f902374	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:05:08.094346+00	{}	{}	\N	2026-06-12 08:05:08.092523+00	2026-06-12 08:05:08.096378+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	664ce247-3698-417c-ab9d-0628f1fdfe3e	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:10:41.400081+00	{}	{}	\N	2026-06-12 08:10:41.393627+00	2026-06-12 08:10:41.403796+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a62aa2bc-d2e6-40e9-9ec5-a6dd48bfe914	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:10:54.804417+00	{}	{}	\N	2026-06-12 08:10:54.802197+00	2026-06-12 08:10:54.80633+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	c58b9fb4-a921-403f-9296-84f2198d265c	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:07:59.504678+00	{}	{}	\N	2026-06-12 08:07:59.502334+00	2026-06-12 08:07:59.506576+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	fd8bdfd2-91f0-48bf-abd6-7db00f28de64	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:41:03.40258+00	{}	{}	\N	2026-06-12 07:41:03.396947+00	2026-06-12 07:41:03.404998+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	bf607771-0378-4fa3-9ec3-9cad1d0da0fb	authenticated	authenticated	buihung.galaxy.s2@gmail.com	\N	2026-06-11 08:41:23.334587+00	\N		\N		\N			\N	2026-06-11 08:41:23.339723+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "106153525996936105624", "name": "Thanh Pham", "email": "buihung.galaxy.s2@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKmZn02vFySKBxDIM5UG5R8iXEA5NlQZREODdqyAMkWIneH5w=s96-c", "full_name": "Thanh Pham", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKmZn02vFySKBxDIM5UG5R8iXEA5NlQZREODdqyAMkWIneH5w=s96-c", "provider_id": "106153525996936105624", "email_verified": true, "phone_verified": false}	\N	2026-06-11 08:41:23.31528+00	2026-06-11 08:41:23.346579+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f23764ab-0b53-4eea-921a-62e07a56d7b9	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:34:18.906085+00	{}	{}	\N	2026-06-12 09:34:18.902945+00	2026-06-12 09:34:18.908546+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	abdf20d4-1e35-4703-a6ff-67d4d4d171aa	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:54:03.116112+00	{}	{}	\N	2026-06-12 07:54:03.113936+00	2026-06-12 07:54:03.117869+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	90b762d0-0836-4726-a093-8a19cbcf40d0	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:41:06.954457+00	{}	{}	\N	2026-06-12 07:41:06.952502+00	2026-06-12 07:41:06.956351+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	8990047a-f5bc-4220-970a-711d9c9fcdba	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:08:27.638404+00	{}	{}	\N	2026-06-12 08:08:27.636369+00	2026-06-12 09:34:55.119718+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	148a6ed3-cd1f-4051-aed3-21b324d1d82a	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:41:16.28894+00	{}	{}	\N	2026-06-12 08:41:16.286584+00	2026-06-12 09:43:35.909992+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	e8726fc7-9cdd-4364-abe4-f180ea44a7c1	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:41:17.785029+00	{}	{}	\N	2026-06-12 07:41:17.782922+00	2026-06-12 07:41:17.787042+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	18e452a5-3fed-4b7f-bece-28d0edc7783e	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:09:09.216737+00	{}	{}	\N	2026-06-12 08:09:09.214904+00	2026-06-12 13:05:58.931679+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	c6b1885d-c451-462d-afd1-d8a14082fc11	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-14 10:30:29.497985+00	{}	{}	\N	2026-06-14 10:30:29.483623+00	2026-06-14 10:30:29.501031+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	0d95d2e5-44c2-4ebc-8a19-6749471f899c	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:41:22.258876+00	{}	{}	\N	2026-06-12 07:41:22.25601+00	2026-06-12 07:41:22.261029+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	124d00b9-b6a0-4813-9820-6e42268d7864	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:40:38.340889+00	{}	{}	\N	2026-06-12 08:40:38.338398+00	2026-06-13 03:54:03.888637+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	18efe2fe-42f1-447d-9209-1a802535ad60	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:54:35.904621+00	{}	{}	\N	2026-06-12 07:54:35.902468+00	2026-06-12 07:54:35.906648+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	d8fa2d60-affe-488b-9ced-ed0451ee0978	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:41:55.06728+00	{}	{}	\N	2026-06-12 07:41:55.06457+00	2026-06-12 07:41:55.074246+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	11db0121-0900-4ca6-b5ad-954904c61177	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:41:59.740922+00	{}	{}	\N	2026-06-12 07:41:59.738928+00	2026-06-12 07:41:59.742776+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	cf4be2ba-95ac-4316-a219-26bf7bdb48b3	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:09:35.731037+00	{}	{}	\N	2026-06-12 08:09:35.728475+00	2026-06-12 08:09:35.732568+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	e76f78a5-6a6d-4d75-9533-2406fbd544a5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:42:09.914419+00	{}	{}	\N	2026-06-12 07:42:09.91089+00	2026-06-12 07:42:09.916133+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	11285f0c-784e-4ba1-bf70-7a9d286cb320	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:54:38.307989+00	{}	{}	\N	2026-06-12 07:54:38.305576+00	2026-06-12 07:54:38.31008+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f8503299-55a5-4574-ac3c-2e539b98b930	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:42:31.68317+00	{}	{}	\N	2026-06-12 07:42:31.681166+00	2026-06-12 07:42:31.684861+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	3db326ec-ef45-4bf3-a2c7-bf9ab4ad6b98	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:42:54.725977+00	{}	{}	\N	2026-06-12 07:42:54.724068+00	2026-06-12 07:42:54.727714+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	201d6368-5c4c-42bb-b1cf-af2d51ee27a9	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:08:01.163658+00	{}	{}	\N	2026-06-12 08:08:01.16155+00	2026-06-12 08:08:01.165494+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	31f27e3e-e37a-483c-b0cf-268f24a61350	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:43:01.757344+00	{}	{}	\N	2026-06-12 07:43:01.755658+00	2026-06-12 07:43:01.758972+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	aa2cb7f3-d889-4101-8d5c-8dd43646188e	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:56:55.100671+00	{}	{}	\N	2026-06-12 07:56:55.091873+00	2026-06-12 07:56:55.106309+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	1e254bec-48f2-46ec-ad66-61f396b4d2da	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:43:25.733499+00	{}	{}	\N	2026-06-12 07:43:25.731554+00	2026-06-12 07:43:25.735129+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	7d8c5e03-8935-41e8-9d43-f711af128895	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:43:37.510896+00	{}	{}	\N	2026-06-12 07:43:37.508051+00	2026-06-12 07:43:37.516617+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	1cad7ac6-0461-4aa3-b6de-9064effa74af	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 07:54:00.57503+00	{}	{}	\N	2026-06-12 07:54:00.567068+00	2026-06-12 07:54:00.578215+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	fa67e9fe-8c2c-449a-8dc8-ddf2546ff3fd	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:01:06.658735+00	{}	{}	\N	2026-06-12 08:01:06.628386+00	2026-06-12 08:01:06.664405+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	3481e30b-aa9a-4e31-a3b5-113bf2fdeb47	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:06:45.604154+00	{}	{}	\N	2026-06-12 08:06:45.599717+00	2026-06-12 08:06:45.606123+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	6956ab7a-febf-44e0-bf37-a4a13d662c65	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:07:34.385857+00	{}	{}	\N	2026-06-12 08:07:34.383691+00	2026-06-12 08:07:34.387641+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	c9d36fa3-e4d7-4c00-a055-0697e326a5f5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:07:56.296769+00	{}	{}	\N	2026-06-12 08:07:56.292338+00	2026-06-12 08:07:56.298772+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	21b0ebca-c531-4f62-ad6c-062e945241b2	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:14:09.961559+00	{}	{}	\N	2026-06-12 08:14:09.927797+00	2026-06-12 08:14:09.972669+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	397d819c-df84-435d-97cf-fe2499a178b2	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:08:42.73722+00	{}	{}	\N	2026-06-12 08:08:42.735286+00	2026-06-12 08:08:42.743023+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f7e7062d-0992-442b-bca0-adfc3b300c82	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:16:43.723551+00	{}	{}	\N	2026-06-12 08:16:43.720469+00	2026-06-12 08:16:43.725534+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	11e1d361-9d77-47c2-aa43-98f36c72c4fe	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:14:39.30717+00	{}	{}	\N	2026-06-12 08:14:39.301828+00	2026-06-12 08:14:39.309348+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	8801626e-54eb-435c-879d-10906f693d49	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:16:34.093558+00	{}	{}	\N	2026-06-12 08:16:34.080025+00	2026-06-12 08:16:34.099047+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f56acc37-4f1c-4b27-9a51-ef6cdb97be47	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:18:00.627994+00	{}	{}	\N	2026-06-12 08:18:00.617906+00	2026-06-12 08:18:00.631896+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	d54bd569-2fbd-4e3b-9457-130a8b3a1fc9	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:17:05.224514+00	{}	{}	\N	2026-06-12 08:17:05.221672+00	2026-06-12 08:17:05.226402+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	dd946dde-b8e1-42bb-b883-73336b256f47	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:18:05.00307+00	{}	{}	\N	2026-06-12 08:18:05.000905+00	2026-06-12 08:18:05.012477+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	7d4593f0-0400-4710-abaf-825eb92ff153	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:18:57.722624+00	{}	{}	\N	2026-06-12 08:18:57.720591+00	2026-06-12 08:18:57.724387+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	31072724-c420-4697-946e-87fbcf045692	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 08:40:31.994172+00	{}	{}	\N	2026-06-12 08:40:31.989549+00	2026-06-12 08:40:31.996637+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	d279074b-7967-4be0-9ac0-7f933dca23b6	authenticated	authenticated	lhongquan.1998@gmail.com	$2a$10$MOb2ssNKlzmnytOhs.em0.D8KGnabTuyq/dbtp2fqvRViobVZK4Ju	2026-06-10 04:11:07.052523+00	\N		\N		\N			\N	2026-06-15 02:30:44.354628+00	{"provider": "email", "providers": ["email", "google"]}	{"iss": "https://accounts.google.com", "sub": "116590389245224680468", "name": "Lương Quân", "email": "lhongquan.1998@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKXxBWLCf0Cr3FpZYDkCOfoa3l4X5HKKpt5y_rbrFvDzhNBhxw=s96-c", "full_name": "Lương Quân", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKXxBWLCf0Cr3FpZYDkCOfoa3l4X5HKKpt5y_rbrFvDzhNBhxw=s96-c", "provider_id": "116590389245224680468", "email_verified": true, "phone_verified": false}	\N	2026-06-10 04:11:07.032158+00	2026-06-15 02:59:09.256356+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	40514075-d5ed-4273-be49-e94d34e04613	authenticated	authenticated	danh98.it@gmail.com	\N	2026-06-12 06:34:55.697539+00	\N		\N		\N			\N	2026-06-13 05:37:16.920244+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "116820045571865280654", "name": "Ngô Ngọc Danh", "email": "danh98.it@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocK7FmFdymLA5PQwCGvVY4ENG5dEgPe3LlJJMAzADMLKaF1y8ss=s96-c", "full_name": "Ngô Ngọc Danh", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocK7FmFdymLA5PQwCGvVY4ENG5dEgPe3LlJJMAzADMLKaF1y8ss=s96-c", "provider_id": "116820045571865280654", "email_verified": true, "phone_verified": false}	\N	2026-06-12 06:34:55.683628+00	2026-06-14 12:46:17.567431+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	af9fc048-8014-4384-a0d0-f31d1e6c4638	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:35:31.696681+00	{}	{}	\N	2026-06-12 09:35:31.69452+00	2026-06-12 09:35:31.698694+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	24ffa000-5b2a-4055-8b85-051b3ae39d3f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:39:11.270271+00	{}	{}	\N	2026-06-12 09:39:11.264048+00	2026-06-12 09:39:11.272111+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	189dfd01-3549-4b85-a125-4ff4fe21973a	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:35:33.432495+00	{}	{}	\N	2026-06-12 09:35:33.430152+00	2026-06-12 09:35:33.434304+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	9c5f933e-74c0-4035-9656-24d410345832	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:35:39.7301+00	{}	{}	\N	2026-06-12 09:35:39.727103+00	2026-06-12 09:35:39.732075+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	1fbe544f-8961-493b-9636-e89a8e213f3f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:16.994891+00	{}	{}	\N	2026-06-12 09:36:16.983402+00	2026-06-12 09:36:17.000914+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	ffed837f-9680-4773-8e2e-9f59c2771b61	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:39:12.12383+00	{}	{}	\N	2026-06-12 09:39:12.12202+00	2026-06-12 09:39:12.125699+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f7b9f068-0069-4676-a960-f4fe2420c7d1	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:18.28138+00	{}	{}	\N	2026-06-12 09:36:18.279527+00	2026-06-12 09:36:18.283023+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	52c8f853-2649-480a-bdfc-f04cb3219afd	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:19.046597+00	{}	{}	\N	2026-06-12 09:36:19.043359+00	2026-06-12 09:36:19.048378+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	add5c076-3a63-48d7-bf6a-c2c344a0c02e	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:19.883401+00	{}	{}	\N	2026-06-12 09:36:19.88151+00	2026-06-12 09:36:19.885077+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	945e5bb2-44bb-4e99-804b-4df989c7aadb	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:39:12.754039+00	{}	{}	\N	2026-06-12 09:39:12.752252+00	2026-06-12 09:39:12.755863+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	098caab1-26d1-48a9-9544-20888b7b08b7	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:25.267922+00	{}	{}	\N	2026-06-12 09:36:25.264139+00	2026-06-12 09:36:25.269568+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	9885e2d1-5e7f-4f09-95d8-de22d84391b0	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:42:16.695895+00	{}	{}	\N	2026-06-12 09:42:16.682105+00	2026-06-12 09:42:16.699675+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	90ab57ed-a6a7-42a1-8f00-f0affefbe9c5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:25.949305+00	{}	{}	\N	2026-06-12 09:36:25.947594+00	2026-06-12 09:36:25.950919+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b3c6da83-938f-4c22-86e0-ccd832c142f4	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:27.349919+00	{}	{}	\N	2026-06-12 09:36:27.348125+00	2026-06-12 09:36:27.351497+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	dce33968-4dbb-4600-b78f-0c7f4f0b302d	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:57.119622+00	{}	{}	\N	2026-06-12 09:36:57.11777+00	2026-06-12 09:36:57.12126+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	18bd5b89-c11b-4fff-9c58-c4743cdced99	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:42:25.339507+00	{}	{}	\N	2026-06-12 09:42:25.337421+00	2026-06-12 09:42:25.341363+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	80950f0a-8660-4b5e-b59d-bacd3e4b411d	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:58.284341+00	{}	{}	\N	2026-06-12 09:36:58.282524+00	2026-06-12 09:36:58.28597+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	9e0bd2e9-bdbf-4e9f-adc7-2aec7b351178	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:36:59.10155+00	{}	{}	\N	2026-06-12 09:36:59.099023+00	2026-06-12 09:36:59.103162+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	1bea8877-9902-4fb0-9b54-837927d86b1f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:37:21.072999+00	{}	{}	\N	2026-06-12 09:37:21.071163+00	2026-06-12 09:37:21.075049+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	12465f7e-bd43-4577-9f72-8b9ec0ed5b47	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:43:37.541069+00	{}	{}	\N	2026-06-12 09:43:37.538954+00	2026-06-12 09:43:37.542866+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	25a735c5-cd09-4b2e-9261-805f224731de	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:37:28.93749+00	{}	{}	\N	2026-06-12 09:37:28.935728+00	2026-06-12 09:37:28.939212+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	4af4b21d-e0cc-4e13-b72c-5f322bdf4a43	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:39:09.944794+00	{}	{}	\N	2026-06-12 09:39:09.941931+00	2026-06-12 09:39:09.94708+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b3ceed5f-3077-470b-995e-941a958f8f36	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:43:38.946084+00	{}	{}	\N	2026-06-12 09:43:38.943985+00	2026-06-12 09:43:38.947981+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	6c9a7777-9b79-4113-9839-0805280ca55a	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:43:39.733856+00	{}	{}	\N	2026-06-12 09:43:39.729658+00	2026-06-12 09:43:39.735759+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	78d55f61-3c1b-455d-bb86-5bc07be81b29	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:58:22.445497+00	{}	{}	\N	2026-06-12 09:58:22.39505+00	2026-06-12 09:58:22.47441+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	e377ff25-d2f9-4601-9dc0-f67d5ffc2fae	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 10:04:11.048094+00	{}	{}	\N	2026-06-12 10:04:11.031573+00	2026-06-12 10:04:11.055933+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	2b362ca9-84a9-4eae-a5f1-6937d2e35034	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 10:30:27.854322+00	{}	{}	\N	2026-06-13 10:30:27.84009+00	2026-06-13 10:30:27.860675+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	82e1a5d9-d557-42dc-a7ee-6475ec9867be	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 10:30:46.138867+00	{}	{}	\N	2026-06-13 10:30:46.136113+00	2026-06-13 10:30:46.140621+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	e0007381-cf34-4037-8dcb-d762401dec65	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 10:30:31.34361+00	{}	{}	\N	2026-06-13 10:30:31.338589+00	2026-06-13 10:30:31.345465+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	8b540241-add8-40bb-93ec-a1f4332ac0f0	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 10:30:37.649715+00	{}	{}	\N	2026-06-13 10:30:37.646076+00	2026-06-13 10:30:37.652313+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	16d81c04-9ef0-4307-b6be-af6286a10cf4	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 10:30:50.106219+00	{}	{}	\N	2026-06-13 10:30:50.103351+00	2026-06-13 10:30:50.108811+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	d3ae6305-a53b-4608-95ef-e17171e9b8db	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 15:56:20.359507+00	{}	{}	\N	2026-06-13 15:56:20.341058+00	2026-06-13 15:56:20.373199+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a90012e0-8556-46d0-b27f-84c58c80dc6d	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:32:56.488031+00	{}	{}	\N	2026-06-12 09:32:56.485801+00	2026-06-12 09:32:56.489918+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	b2ea14f6-4707-4dde-b9f6-e426aa22bc9d	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:32:57.900205+00	{}	{}	\N	2026-06-12 09:32:57.898135+00	2026-06-12 09:32:57.901998+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	406099d7-4700-44ad-90f5-6ec1db7995f1	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:38:30.360655+00	{}	{}	\N	2026-06-12 09:38:30.353745+00	2026-06-12 09:38:30.36413+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	5e77db29-f3ec-4d3f-829b-1dd742abebf5	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:32:58.836894+00	{}	{}	\N	2026-06-12 09:32:58.834799+00	2026-06-12 09:32:58.841532+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a204d21c-17fb-4eec-84b9-78b958f86f46	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 00:12:52.334263+00	{}	{}	\N	2026-06-13 00:12:52.322696+00	2026-06-13 00:12:52.351978+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	95ad49c3-a03b-49a6-a67e-63a33f42c029	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:38:51.452789+00	{}	{}	\N	2026-06-12 09:38:51.448751+00	2026-06-12 09:38:51.454798+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	97ac06df-8f3d-4eb3-a695-1a94f3a26289	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:32:59.755316+00	{}	{}	\N	2026-06-12 09:32:59.752565+00	2026-06-12 09:32:59.757898+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	34f810eb-05c4-449a-a806-9ac45ec67f01	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:33:00.81964+00	{}	{}	\N	2026-06-12 09:33:00.817558+00	2026-06-12 09:33:00.821365+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	dbec404f-2233-41c8-a373-0e79d5541e62	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:38:52.755808+00	{}	{}	\N	2026-06-12 09:38:52.753645+00	2026-06-12 09:38:52.757711+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	37304c07-2c30-48e2-a104-138a10150ef3	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:38:53.516883+00	{}	{}	\N	2026-06-12 09:38:53.514883+00	2026-06-12 09:38:53.51866+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a20786bc-3c58-49b9-8fe4-00978b4a036a	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:38:54.189316+00	{}	{}	\N	2026-06-12 09:38:54.187219+00	2026-06-12 09:38:54.19105+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	ae19d965-d835-4e48-bbe5-cd22f458181f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-13 00:12:58.197739+00	{}	{}	\N	2026-06-13 00:12:58.195558+00	2026-06-13 02:07:51.370084+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	809b24e3-9eae-4f00-ae9a-06e5217977d6	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:41:11.844672+00	{}	{}	\N	2026-06-12 09:41:11.837862+00	2026-06-12 09:41:11.848696+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	f838a000-e70c-4606-a764-60460867dca9	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:48:42.910589+00	{}	{}	\N	2026-06-12 09:48:42.905809+00	2026-06-12 09:48:42.912987+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	e3fe2440-b7d6-4001-be43-63c2d9ceaf1d	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:49:32.389779+00	{}	{}	\N	2026-06-12 09:49:32.386962+00	2026-06-12 09:49:32.391492+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	d5f7406e-edea-4b6b-9fbe-ca9c43d887c7	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:50:02.666729+00	{}	{}	\N	2026-06-12 09:50:02.662157+00	2026-06-12 09:50:02.669234+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a9a5fca5-4ff5-4a55-9bf4-48ec422ae02f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:50:07.615155+00	{}	{}	\N	2026-06-12 09:50:07.613047+00	2026-06-12 09:50:07.616893+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	8b764345-86d4-4c42-8c0a-93583b0cbf2b	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:50:09.580324+00	{}	{}	\N	2026-06-12 09:50:09.571268+00	2026-06-12 09:50:09.589063+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a5924b4f-7154-4c55-aca6-ffe1b4ca737f	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:50:25.943096+00	{}	{}	\N	2026-06-12 09:50:25.940055+00	2026-06-12 09:50:25.944961+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a2313f28-627f-4178-9cb5-98e8d2d414cb	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 09:51:23.075889+00	{}	{}	\N	2026-06-12 09:51:23.073857+00	2026-06-12 09:51:23.077554+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	4ca0d654-4b61-4381-a053-8269cc9ad6b0	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 10:01:02.859961+00	{}	{}	\N	2026-06-12 10:01:02.843319+00	2026-06-12 10:01:02.867465+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	2d0a2b99-4b2b-4689-917d-3372716c9e08	authenticated	authenticated	\N		\N	\N		\N		\N			\N	2026-06-12 10:01:04.208948+00	{}	{}	\N	2026-06-12 10:01:04.206688+00	2026-06-12 10:01:04.210903+00	\N	\N			\N		0	\N		\N	f	\N	t
00000000-0000-0000-0000-000000000000	a392bd34-3795-41ce-9d2e-3a43c9220ea2	authenticated	authenticated	phamduclong1411@gmail.com	\N	2026-06-13 09:57:27.09504+00	\N		\N		\N			\N	2026-06-13 09:57:27.101075+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "112658206498089224089", "name": "Sung Jin Woo", "email": "phamduclong1411@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJggw3r63Hs8H0wfnbtM2hJUBfllHreI0Iz_tTJPE3WRZEDn9xJ=s96-c", "full_name": "Sung Jin Woo", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJggw3r63Hs8H0wfnbtM2hJUBfllHreI0Iz_tTJPE3WRZEDn9xJ=s96-c", "provider_id": "112658206498089224089", "email_verified": true, "phone_verified": false}	\N	2026-06-13 09:57:27.070299+00	2026-06-13 09:57:27.128469+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	30e0a794-89eb-44df-bc4f-51b04ceba280	authenticated	authenticated	dangbaohan1006@gmail.com	\N	2026-06-11 03:02:52.168906+00	\N		\N		\N			\N	2026-06-12 06:25:01.008851+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "107288026214849782538", "name": "Đặng Bảo Hân", "email": "dangbaohan1006@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKe89c3IeF92gzC4B01CHltmbrYdZ8S0rwV1_YGb7YFA-mmP0s=s96-c", "full_name": "Đặng Bảo Hân", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKe89c3IeF92gzC4B01CHltmbrYdZ8S0rwV1_YGb7YFA-mmP0s=s96-c", "provider_id": "107288026214849782538", "email_verified": true, "phone_verified": false}	\N	2026-06-11 03:02:52.14671+00	2026-06-15 01:54:47.591417+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	9c41e93c-efeb-40fa-8c67-e8549d10d46a	authenticated	authenticated	lhquan1998@gmail.com	\N	2026-06-13 15:33:47.721571+00	\N		\N		\N			\N	2026-06-13 15:33:47.726438+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "111153482512999408620", "name": "Luong Hong Quan", "email": "lhquan1998@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocLJStD01n5GmD5CenvOb55UUKWzxKcHathTGjRjsqW55r0Rp9EE=s96-c", "full_name": "Luong Hong Quan", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocLJStD01n5GmD5CenvOb55UUKWzxKcHathTGjRjsqW55r0Rp9EE=s96-c", "provider_id": "111153482512999408620", "email_verified": true, "phone_verified": false}	\N	2026-06-13 15:33:47.70826+00	2026-06-14 13:37:40.021388+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	544434d3-ad2a-4364-a154-1f60154c603d	authenticated	authenticated	anotherminhnhat@gmail.com	\N	2026-06-13 11:30:43.551911+00	\N		\N		\N			\N	2026-06-13 11:57:26.770209+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "114296913527756030112", "name": "dang nho", "email": "anotherminhnhat@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocId79fBGdbsCSS-XhC1aZK5HPAjPlFiBqzSzNE69uZb-Omw7VM=s96-c", "full_name": "dang nho", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocId79fBGdbsCSS-XhC1aZK5HPAjPlFiBqzSzNE69uZb-Omw7VM=s96-c", "provider_id": "114296913527756030112", "email_verified": true, "phone_verified": false}	\N	2026-06-13 11:30:43.499076+00	2026-06-13 13:51:56.934173+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	edf75b25-8658-45f9-a078-c8cb8ea5fbe9	authenticated	authenticated	testkenmen@gmail.com	\N	2026-06-13 11:06:14.497671+00	\N		\N		\N			\N	2026-06-13 11:06:14.505384+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "108678354748552762772", "name": "Thao Nguyễn", "email": "testkenmen@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocL28rcQoC_4CXZJqVZ0IZC4lbaWsTuBODfG-fm6xvRYoLW-gA=s96-c", "full_name": "Thao Nguyễn", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocL28rcQoC_4CXZJqVZ0IZC4lbaWsTuBODfG-fm6xvRYoLW-gA=s96-c", "provider_id": "108678354748552762772", "email_verified": true, "phone_verified": false}	\N	2026-06-13 11:06:14.45374+00	2026-06-13 14:45:40.416549+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	bbb0ada2-a3a0-4dfe-961a-959836b12f81	authenticated	authenticated	meekpz97@gmail.com	\N	2026-06-10 10:32:10.228453+00	\N		\N		\N			\N	2026-06-14 09:09:30.301902+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "109498146891952799902", "name": "Hien Nguyen Quang", "email": "meekpz97@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJnSymrgcMWS8QjV7tnezm_yXPdDXGnz_yMnz3oj03SlTCp_UP0=s96-c", "full_name": "Hien Nguyen Quang", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJnSymrgcMWS8QjV7tnezm_yXPdDXGnz_yMnz3oj03SlTCp_UP0=s96-c", "provider_id": "109498146891952799902", "email_verified": true, "phone_verified": false}	\N	2026-06-10 10:32:10.209949+00	2026-06-14 09:09:30.320226+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
d279074b-7967-4be0-9ac0-7f933dca23b6	d279074b-7967-4be0-9ac0-7f933dca23b6	{"sub": "d279074b-7967-4be0-9ac0-7f933dca23b6", "email": "lhongquan.1998@gmail.com", "email_verified": false, "phone_verified": false}	email	2026-06-10 04:11:07.048993+00	2026-06-10 04:11:07.04904+00	2026-06-10 04:11:07.04904+00	54241dd4-2632-4a90-bfaf-2c853331294d
111153482512999408620	9c41e93c-efeb-40fa-8c67-e8549d10d46a	{"iss": "https://accounts.google.com", "sub": "111153482512999408620", "name": "Luong Hong Quan", "email": "lhquan1998@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocLJStD01n5GmD5CenvOb55UUKWzxKcHathTGjRjsqW55r0Rp9EE=s96-c", "full_name": "Luong Hong Quan", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocLJStD01n5GmD5CenvOb55UUKWzxKcHathTGjRjsqW55r0Rp9EE=s96-c", "provider_id": "111153482512999408620", "email_verified": true, "phone_verified": false}	google	2026-06-13 15:33:47.714379+00	2026-06-13 15:33:47.71443+00	2026-06-13 15:33:47.71443+00	231b8d61-40db-4ea9-b580-7f2a41bad57b
116820045571865280654	40514075-d5ed-4273-be49-e94d34e04613	{"iss": "https://accounts.google.com", "sub": "116820045571865280654", "name": "Ngô Ngọc Danh", "email": "danh98.it@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocK7FmFdymLA5PQwCGvVY4ENG5dEgPe3LlJJMAzADMLKaF1y8ss=s96-c", "full_name": "Ngô Ngọc Danh", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocK7FmFdymLA5PQwCGvVY4ENG5dEgPe3LlJJMAzADMLKaF1y8ss=s96-c", "provider_id": "116820045571865280654", "email_verified": true, "phone_verified": false}	google	2026-06-12 06:34:55.693258+00	2026-06-12 06:34:55.693312+00	2026-06-13 05:37:16.916058+00	3c85dae9-44f7-49d1-b3fc-9b9474bf2167
116590389245224680468	d279074b-7967-4be0-9ac0-7f933dca23b6	{"iss": "https://accounts.google.com", "sub": "116590389245224680468", "name": "Lương Quân", "email": "lhongquan.1998@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKXxBWLCf0Cr3FpZYDkCOfoa3l4X5HKKpt5y_rbrFvDzhNBhxw=s96-c", "full_name": "Lương Quân", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKXxBWLCf0Cr3FpZYDkCOfoa3l4X5HKKpt5y_rbrFvDzhNBhxw=s96-c", "provider_id": "116590389245224680468", "email_verified": true, "phone_verified": false}	google	2026-06-10 05:58:42.66877+00	2026-06-10 05:58:42.668817+00	2026-06-10 07:40:59.818261+00	f5a82c7f-b5f0-4a07-afd4-0b952c4ee64a
112658206498089224089	a392bd34-3795-41ce-9d2e-3a43c9220ea2	{"iss": "https://accounts.google.com", "sub": "112658206498089224089", "name": "Sung Jin Woo", "email": "phamduclong1411@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJggw3r63Hs8H0wfnbtM2hJUBfllHreI0Iz_tTJPE3WRZEDn9xJ=s96-c", "full_name": "Sung Jin Woo", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJggw3r63Hs8H0wfnbtM2hJUBfllHreI0Iz_tTJPE3WRZEDn9xJ=s96-c", "provider_id": "112658206498089224089", "email_verified": true, "phone_verified": false}	google	2026-06-13 09:57:27.088406+00	2026-06-13 09:57:27.088459+00	2026-06-13 09:57:27.088459+00	cef15dca-2487-4658-b55e-13d9cfd65471
2d4aca79-aefc-4553-a8d8-f79fa8cde1bb	2d4aca79-aefc-4553-a8d8-f79fa8cde1bb	{"sub": "2d4aca79-aefc-4553-a8d8-f79fa8cde1bb", "email": "baohandao2303@gmail.com", "email_verified": false, "phone_verified": false}	email	2026-06-11 06:50:49.687335+00	2026-06-11 06:50:49.687393+00	2026-06-11 06:50:49.687393+00	e20157bc-3e4e-4921-bf3b-1f87db64f912
106153525996936105624	bf607771-0378-4fa3-9ec3-9cad1d0da0fb	{"iss": "https://accounts.google.com", "sub": "106153525996936105624", "name": "Thanh Pham", "email": "buihung.galaxy.s2@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKmZn02vFySKBxDIM5UG5R8iXEA5NlQZREODdqyAMkWIneH5w=s96-c", "full_name": "Thanh Pham", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKmZn02vFySKBxDIM5UG5R8iXEA5NlQZREODdqyAMkWIneH5w=s96-c", "provider_id": "106153525996936105624", "email_verified": true, "phone_verified": false}	google	2026-06-11 08:41:23.329312+00	2026-06-11 08:41:23.329361+00	2026-06-11 08:41:23.329361+00	bd8ccbae-99ed-424b-b380-1c87f8bffd26
107288026214849782538	30e0a794-89eb-44df-bc4f-51b04ceba280	{"iss": "https://accounts.google.com", "sub": "107288026214849782538", "name": "Đặng Bảo Hân", "email": "dangbaohan1006@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKe89c3IeF92gzC4B01CHltmbrYdZ8S0rwV1_YGb7YFA-mmP0s=s96-c", "full_name": "Đặng Bảo Hân", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKe89c3IeF92gzC4B01CHltmbrYdZ8S0rwV1_YGb7YFA-mmP0s=s96-c", "provider_id": "107288026214849782538", "email_verified": true, "phone_verified": false}	google	2026-06-11 03:02:52.162962+00	2026-06-11 03:02:52.163019+00	2026-06-12 06:25:01.00158+00	cfbed990-cda3-472c-bc7c-1af6e5e55aba
108678354748552762772	edf75b25-8658-45f9-a078-c8cb8ea5fbe9	{"iss": "https://accounts.google.com", "sub": "108678354748552762772", "name": "Thao Nguyễn", "email": "testkenmen@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocL28rcQoC_4CXZJqVZ0IZC4lbaWsTuBODfG-fm6xvRYoLW-gA=s96-c", "full_name": "Thao Nguyễn", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocL28rcQoC_4CXZJqVZ0IZC4lbaWsTuBODfG-fm6xvRYoLW-gA=s96-c", "provider_id": "108678354748552762772", "email_verified": true, "phone_verified": false}	google	2026-06-13 11:06:14.484888+00	2026-06-13 11:06:14.484939+00	2026-06-13 11:06:14.484939+00	f323dfed-e628-41dd-882b-f13e65ac19e0
114296913527756030112	544434d3-ad2a-4364-a154-1f60154c603d	{"iss": "https://accounts.google.com", "sub": "114296913527756030112", "name": "dang nho", "email": "anotherminhnhat@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocId79fBGdbsCSS-XhC1aZK5HPAjPlFiBqzSzNE69uZb-Omw7VM=s96-c", "full_name": "dang nho", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocId79fBGdbsCSS-XhC1aZK5HPAjPlFiBqzSzNE69uZb-Omw7VM=s96-c", "provider_id": "114296913527756030112", "email_verified": true, "phone_verified": false}	google	2026-06-13 11:30:43.539941+00	2026-06-13 11:30:43.539996+00	2026-06-13 11:57:26.761241+00	edc22819-115c-47d6-8f5d-29df7c140a82
109498146891952799902	bbb0ada2-a3a0-4dfe-961a-959836b12f81	{"iss": "https://accounts.google.com", "sub": "109498146891952799902", "name": "Hien Nguyen Quang", "email": "meekpz97@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJnSymrgcMWS8QjV7tnezm_yXPdDXGnz_yMnz3oj03SlTCp_UP0=s96-c", "full_name": "Hien Nguyen Quang", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJnSymrgcMWS8QjV7tnezm_yXPdDXGnz_yMnz3oj03SlTCp_UP0=s96-c", "provider_id": "109498146891952799902", "email_verified": true, "phone_verified": false}	google	2026-06-10 10:32:10.222049+00	2026-06-10 10:32:10.222101+00	2026-06-14 09:09:30.292798+00	e4468ff5-6772-4b6d-89bd-798b1f25d1fe
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_clients" ("id", "client_secret_hash", "registration_type", "redirect_uris", "grant_types", "client_name", "client_uri", "logo_uri", "created_at", "updated_at", "deleted_at", "client_type", "token_endpoint_auth_method") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id", "refresh_token_hmac_key", "refresh_token_counter", "scopes") FROM stdin;
2873c830-23f8-4bfb-a887-faa36d757db2	3365234f-6ef5-4b87-a306-ce324a246577	2026-06-10 04:15:13.349723+00	2026-06-10 13:09:32.678815+00	\N	aal1	\N	2026-06-10 13:09:32.678723	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
27f180b4-4d8c-474e-9a28-f6c668e376fd	1da7e9b5-2cba-4b87-af95-16339a23a7fa	2026-06-10 13:28:32.734991+00	2026-06-10 13:28:32.734991+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
7b32ed3c-f74b-40cc-bace-ee45047950eb	55ebcbaf-8356-49a9-81f8-caca676b6a44	2026-06-10 13:29:34.017725+00	2026-06-10 13:29:34.017725+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
921dee6b-9b40-4722-812a-ae33112f9a81	cd3c27f6-ffe9-4d26-8d63-1c2cab574fe5	2026-06-10 13:33:20.44943+00	2026-06-10 13:33:20.44943+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
373631f6-b8f0-491b-81f2-c9092648cc51	7a0e3d35-d34f-4656-8d93-1db86e55f68c	2026-06-10 13:33:25.55446+00	2026-06-10 13:33:25.55446+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
a9b66bf4-c441-4297-b8c7-c6f22f1bdca0	03ddd27d-f5c3-4234-9519-52a77acecd0f	2026-06-10 13:35:10.471343+00	2026-06-10 13:35:10.471343+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
7088b322-64b9-4f15-a8e8-a53a269a2d18	6f7e32b3-1d33-4e7f-ada7-e9d02385143d	2026-06-10 13:35:17.563258+00	2026-06-10 13:35:17.563258+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
5d11f586-82ea-4f0b-b088-93211556060c	9b64fa66-2e4a-4a28-8794-7ee7fc732b48	2026-06-10 14:59:27.705326+00	2026-06-13 10:30:24.917047+00	\N	aal1	\N	2026-06-13 10:30:24.916938	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	42.113.150.207	\N	\N	\N	\N	\N
28d3548d-2f10-48e4-9d2e-9f5c02a5b0f3	2075df08-defd-479a-8755-55f8d702a5c5	2026-06-10 13:35:44.689265+00	2026-06-10 13:35:44.689265+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
e3a9fe58-536c-4f67-8471-3224a6a0f665	e7c7a2bb-c3ff-4bb4-8f78-9eaad620cad7	2026-06-11 01:45:57.916973+00	2026-06-11 01:45:57.916973+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	113.161.78.29	\N	\N	\N	\N	\N
97f32f2e-d9f5-49ed-ad8c-3d98aa3dda77	a72e271e-0ded-4bc9-bac0-54c56e9667e5	2026-06-10 13:35:46.230886+00	2026-06-10 13:35:46.230886+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
9ade8318-ae2c-4d9f-82f1-918c4b386f6b	a1d7785a-e363-401b-b505-1cad4745a196	2026-06-10 13:35:55.05834+00	2026-06-10 13:35:55.05834+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
d898387d-5334-4710-95b9-7e50d8d755b6	eafaebd2-e3b0-42c0-a616-139dc6dc1081	2026-06-10 13:44:38.611084+00	2026-06-10 13:44:38.611084+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
ffc4c90f-2658-4941-923b-17977eea3c8b	b970951d-80f4-4308-acd9-63138826d814	2026-06-11 03:15:26.724685+00	2026-06-11 03:15:26.724685+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36	14.179.85.74	\N	\N	\N	\N	\N
31446a88-88b4-4dba-a426-74cc266d4299	06d23a82-219a-4d0b-8a9d-249bf291e615	2026-06-10 06:36:33.635+00	2026-06-13 12:37:21.406659+00	\N	aal1	\N	2026-06-13 12:37:21.406554	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	171.248.144.240	\N	\N	\N	\N	\N
22752014-cdd7-448a-b17f-6176494eadb9	ec06f433-d526-4837-be90-6c5507c5b435	2026-06-10 04:42:43.786687+00	2026-06-11 03:15:21.602193+00	\N	aal1	\N	2026-06-11 03:15:21.602085	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36	14.179.85.74	\N	\N	\N	\N	\N
d6f46639-9773-4fea-8bc1-ee46621ff805	54e610db-68cd-4162-9714-db38ad23df40	2026-06-10 05:53:58.173472+00	2026-06-14 10:14:43.012116+00	\N	aal1	\N	2026-06-14 10:14:43.012011	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBAV/565.0.0.29.108;FBBV/991411137;FBDV/iPhone13,3;FBMD/iPhone;FBSN/iOS;FBSV/26.5;FBSS/3;FBCR/;FBID/phone;FBLC/vi_VN;FBOP/80]	118.71.92.156	\N	\N	\N	\N	\N
0148d578-ee1c-4a16-884d-d1dc3a668075	60e19456-c8e1-4dd6-b900-91573244c2a5	2026-06-11 03:15:23.832615+00	2026-06-11 03:15:23.832615+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36	14.179.85.74	\N	\N	\N	\N	\N
e3c36b7d-bd08-4b9a-bd07-4fd11a903dd0	94e11b1c-7330-4214-a522-4abd72dafa27	2026-06-10 06:12:41.945063+00	2026-06-12 06:08:31.308683+00	\N	aal1	\N	2026-06-12 06:08:31.308525	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0	54.254.136.207	\N	\N	\N	\N	\N
5f338fb5-f2d9-42e7-9901-ea1db50f74fc	5050ebc5-e6b0-41d2-acf8-ceb88714a98f	2026-06-10 15:53:36.691251+00	2026-06-13 16:12:15.633082+00	\N	aal1	\N	2026-06-13 16:12:15.632971	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBAV/565.0.0.29.108;FBBV/991411137;FBDV/iPhone15,3;FBMD/iPhone;FBSN/iOS;FBSV/26.1;FBSS/3;FBCR/;FBID/phone;FBLC/vi_VN;FBOP/80]	27.64.31.41	\N	\N	\N	\N	\N
43c4e37b-de48-4215-a2c8-e082d3370c24	7bc60ae4-1e67-41a9-9b95-f27b33ecbf62	2026-06-10 04:42:30.674814+00	2026-06-14 04:00:02.463097+00	\N	aal1	\N	2026-06-14 04:00:02.462989	Mozilla/5.0 (Linux; Android 12; SO-51A Build/58.2.B.0.520;) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/148.0.7778.217 Mobile Safari/537.36 Zalo android/260501901 ZaloTheme/light ZaloLanguage/vi	14.186.186.211	\N	\N	\N	\N	\N
4b7c320f-fa17-461e-8c5b-3e66418d2332	51d193d4-d889-4ee4-af7a-02e643d00703	2026-06-11 04:21:42.813316+00	2026-06-11 04:21:42.813316+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.7444.265 Mobile Safari/537.36	115.79.192.13	\N	\N	\N	\N	\N
d476fbd2-a0a1-49c3-8f3d-6c13941ea9e2	34784636-6c24-4a69-be3d-c027ca7b64a4	2026-06-11 04:33:01.081327+00	2026-06-11 04:33:01.081327+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
86e4ec86-0fea-47f4-8c1c-43e1cf03e99e	998c0d62-b7d5-450a-b73e-40f9f8e61128	2026-06-11 04:33:03.99178+00	2026-06-11 04:33:03.99178+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
ba784013-bbd7-4870-85fe-02f843426d7f	ae93a0b6-bb60-45f5-ba45-0d9dc18e2ff8	2026-06-11 04:33:21.547099+00	2026-06-11 04:33:21.547099+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
e934a4be-4c69-4879-a74a-12d16e8265c4	40635144-881b-49f4-9c45-5e9f5c3f6851	2026-06-11 04:33:22.89939+00	2026-06-11 04:33:22.89939+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
a1ca7e64-87ce-428d-9aac-5205d6b25ab1	e3c5d208-2b38-44fb-90e1-7d184b129dd5	2026-06-11 04:33:25.65029+00	2026-06-11 04:33:25.65029+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
e81571e1-8b2f-4ef5-91af-d5945c0ddf1c	084aaedb-b710-4ef7-8c4f-8377d53068ba	2026-06-11 04:33:26.833059+00	2026-06-11 04:33:26.833059+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
65b71518-2284-49ae-abca-3ac96a8810db	46876a71-605d-469f-8a9d-0488741e3c2e	2026-06-11 04:33:27.943515+00	2026-06-11 04:33:27.943515+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
333220dd-590c-41c0-85df-7696754aa62e	5ef42176-dac4-494d-bd3e-b4ab64d14d51	2026-06-11 04:33:34.808003+00	2026-06-11 04:33:34.808003+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
3aeecb04-a5ab-483f-aa48-34f33f587e13	cd92543c-20ab-483a-8787-4c43ce91770c	2026-06-11 04:33:41.596314+00	2026-06-11 04:33:41.596314+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	113.161.78.29	\N	\N	\N	\N	\N
a809673b-fdaa-4673-83f4-3af52fc1471e	30e0a794-89eb-44df-bc4f-51b04ceba280	2026-06-12 06:25:01.008947+00	2026-06-15 01:54:47.606564+00	\N	aal1	\N	2026-06-15 01:54:47.606409	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36	14.179.85.74	\N	\N	\N	\N	\N
f5ff760a-c1af-4612-8e6a-e821df8afb68	2d4aca79-aefc-4553-a8d8-f79fa8cde1bb	2026-06-11 06:50:49.699789+00	2026-06-15 01:55:48.797333+00	\N	aal1	\N	2026-06-15 01:55:48.797243	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS/260502804 ZaloTheme/light ZaloLanguage/en	14.179.85.74	\N	\N	\N	\N	\N
7e20cdfd-60a2-4a69-95e1-d6bd509b5122	36d717a2-6458-42c3-ab63-2421230477ba	2026-06-12 07:34:46.336691+00	2026-06-12 07:34:46.336691+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
57e2c39d-b584-48d8-8f49-3cd3c1804c71	7829ee34-4dd6-4e6b-9aaf-7e5bd5c1a8b1	2026-06-11 06:42:27.741261+00	2026-06-11 06:42:27.741261+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	113.161.78.29	\N	\N	\N	\N	\N
b340153c-edb2-4059-80f2-b0fb7bd02101	eff3ca66-3d2c-4895-bfaa-a5f528c2dcab	2026-06-11 06:42:29.894646+00	2026-06-11 06:42:29.894646+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	113.161.78.29	\N	\N	\N	\N	\N
0f139128-8bbf-4ba9-9d6e-640a1a576e47	f0acbc44-483d-449d-8380-f3b7ef5ca7d2	2026-06-11 06:43:25.114632+00	2026-06-11 06:43:25.114632+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	115.79.192.13	\N	\N	\N	\N	\N
ad9df9cd-d73e-4bde-a615-a0b3cca933e1	f7df0f03-9ba8-4b47-8881-20e1f071a4f8	2026-06-11 06:43:42.631936+00	2026-06-11 06:43:42.631936+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	115.79.192.13	\N	\N	\N	\N	\N
dab8b8ca-9c9c-4780-a199-90425f4e43fd	7f290992-7cc2-4a46-8f3e-48c89a5cc603	2026-06-11 06:44:06.393208+00	2026-06-11 06:44:06.393208+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	113.161.78.29	\N	\N	\N	\N	\N
2d83fb2c-aaf8-4348-b698-0521c8a62d59	daa2947e-d5bb-4df7-b4f5-69505655e639	2026-06-11 06:44:08.228759+00	2026-06-11 06:44:08.228759+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	113.161.78.29	\N	\N	\N	\N	\N
95fcc347-78b0-4463-ba84-7d4688fe598a	7fca6250-e697-45f9-8b21-cbdfdea4da45	2026-06-11 06:56:32.878998+00	2026-06-11 06:56:32.878998+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	14.179.85.74	\N	\N	\N	\N	\N
e65db0c1-fe32-43a9-9458-f6cdf702824b	bf607771-0378-4fa3-9ec3-9cad1d0da0fb	2026-06-11 08:41:23.33982+00	2026-06-11 08:41:23.33982+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	42.117.64.200	\N	\N	\N	\N	\N
180426a6-517f-4803-b156-95eefbd0f646	b37a2603-11ba-4c3c-8225-adf08f82e461	2026-06-12 07:35:09.80514+00	2026-06-12 07:35:09.80514+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS/260502804 ZaloTheme/dark ZaloLanguage/vn	118.71.92.156	\N	\N	\N	\N	\N
a715777f-5cbd-4320-87f3-133f84becf3f	40514075-d5ed-4273-be49-e94d34e04613	2026-06-12 06:38:03.952782+00	2026-06-12 06:38:03.952782+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1	103.199.32.88	\N	\N	\N	\N	\N
a9962ce5-824b-4265-9b32-0bbc0ecd84c6	a188a19d-c9fe-4add-aa2d-4fa0050fd5b4	2026-06-12 06:44:24.519387+00	2026-06-12 09:18:36.091775+00	\N	aal1	\N	2026-06-12 09:18:36.091665	Mozilla/5.0 (Linux; Android 16; CPH2745 Build/BP2A.250605.015; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.91 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/565.0.0.43.88;]	118.69.35.175	\N	\N	\N	\N	\N
a8401cad-c79d-436e-a604-1a2320e102c7	8d4af825-f434-48e7-aaa1-8d753fb3c782	2026-06-12 07:35:11.65168+00	2026-06-12 07:35:11.65168+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS/260502804 ZaloTheme/dark ZaloLanguage/vn	118.71.92.156	\N	\N	\N	\N	\N
daef983a-ff6d-45e4-93ba-3683a12adc52	20123896-bd7c-4afc-9b61-08de7592d4e1	2026-06-12 07:35:34.146217+00	2026-06-12 07:35:34.146217+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
27a349c0-9ead-422c-bb2e-c3568aaa9fac	c13f83d6-3c10-4cff-b07f-a6817fce40f5	2026-06-12 07:35:57.358406+00	2026-06-12 07:35:57.358406+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
bbe1e50d-5576-4088-ba5d-edeb9bde8717	0274cd59-9615-451e-848c-fd15bfe6bacc	2026-06-12 07:36:05.990125+00	2026-06-12 07:36:05.990125+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
29c890ee-2cae-4e88-a739-b7818e357254	40514075-d5ed-4273-be49-e94d34e04613	2026-06-12 06:34:55.704332+00	2026-06-13 14:08:48.284497+00	\N	aal1	\N	2026-06-13 14:08:48.284398	Mozilla/5.0 (iPhone; CPU iPhone OS 26_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149.0.7827.137 Mobile/15E148 Safari/604.1	103.199.33.178	\N	\N	\N	\N	\N
73e41d07-71d8-4c4a-b9b0-226cb975ade1	669fac28-307a-4710-83a1-1ff49a1de9f5	2026-06-12 06:44:58.702084+00	2026-06-12 15:54:33.399411+00	\N	aal1	\N	2026-06-12 15:54:33.398687	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36	171.248.144.240	\N	\N	\N	\N	\N
bf27e73b-4d9f-4840-bce1-ed87af80e993	3600d5ae-0e04-4a6c-9436-55699f2de0a8	2026-06-12 05:21:56.764798+00	2026-06-14 10:16:57.218039+00	\N	aal1	\N	2026-06-14 10:16:57.217938	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS/260502804 ZaloTheme/dark ZaloLanguage/vn	118.71.92.156	\N	\N	\N	\N	\N
8aad5d4d-dd61-4789-8cc9-2a342c061db4	f7f722f8-d85a-4f47-a94a-01afd1911b92	2026-06-12 07:36:10.604033+00	2026-06-12 07:36:10.604033+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	14.179.85.74	\N	\N	\N	\N	\N
e11e243d-4e63-488d-9791-15d2b71fedd6	a32d08ad-cfa4-4b66-9fab-fbbb94fd4c42	2026-06-12 07:37:22.319033+00	2026-06-12 07:37:22.319033+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
b1178548-c8d4-414c-bfbc-a411cc9f4bdd	a0138e1f-b2d5-493c-841d-f0f6fa9591ae	2026-06-12 07:37:50.500784+00	2026-06-12 07:37:50.500784+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
f9d3f87c-fb3c-43c0-a74b-ca9d15b87b79	88592718-7475-4d65-bdd3-56b3242cbf2d	2026-06-12 07:38:26.355028+00	2026-06-12 07:38:26.355028+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
0018c86f-283e-4228-bda1-e12b86fcc33e	6269d783-cbb6-486a-a376-7d0d16aefcaf	2026-06-12 07:38:53.907565+00	2026-06-12 07:38:53.907565+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
5ab30283-5cb3-4296-9f8e-f23a23b6db73	9dfa9573-2ab0-4f11-90c8-178c28e48761	2026-06-12 07:39:07.110392+00	2026-06-12 07:39:07.110392+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
3ef50453-589a-4406-8a13-58735b0b2074	50456677-11a5-4567-9cc3-20d4624bd430	2026-06-12 07:40:05.463797+00	2026-06-12 07:40:05.463797+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
93378fa9-fcb2-49ac-82b2-7997ee387c08	c4e67583-7df6-48f5-bae0-1244fbab4021	2026-06-12 07:40:06.364511+00	2026-06-12 07:40:06.364511+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
d0b4a022-1fb7-4cc2-936d-610b849bc2b7	6b3ec4de-d1e6-495b-984a-d07744255357	2026-06-12 07:40:44.989542+00	2026-06-12 07:40:44.989542+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
b022546b-1405-4fec-a161-03ab6d974276	4c0fb5ef-d61b-4d24-bc28-0cbc9201f710	2026-06-12 07:40:46.622698+00	2026-06-12 07:40:46.622698+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	14.179.85.74	\N	\N	\N	\N	\N
acad5992-49ec-4840-b79c-9144ba66b7c7	fd8bdfd2-91f0-48bf-abd6-7db00f28de64	2026-06-12 07:41:03.402708+00	2026-06-12 07:41:03.402708+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
61329589-96ce-4178-9995-2b016d25a88a	90b762d0-0836-4726-a093-8a19cbcf40d0	2026-06-12 07:41:06.954608+00	2026-06-12 07:41:06.954608+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
09b80dc6-66ab-4944-b601-31d3efb13022	e8726fc7-9cdd-4364-abe4-f180ea44a7c1	2026-06-12 07:41:17.785196+00	2026-06-12 07:41:17.785196+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
5f730885-f36d-49cd-96c8-ac5842c0e2ee	0d95d2e5-44c2-4ebc-8a19-6749471f899c	2026-06-12 07:41:22.258957+00	2026-06-12 07:41:22.258957+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	14.179.85.74	\N	\N	\N	\N	\N
844e9ac6-8004-405e-981d-4ce3097dfdb8	d8fa2d60-affe-488b-9ced-ed0451ee0978	2026-06-12 07:41:55.067367+00	2026-06-12 07:41:55.067367+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	14.179.85.74	\N	\N	\N	\N	\N
25957de9-67dd-43e8-9457-cc7b5fb686a6	11db0121-0900-4ca6-b5ad-954904c61177	2026-06-12 07:41:59.74103+00	2026-06-12 07:41:59.74103+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	14.179.85.74	\N	\N	\N	\N	\N
e56a6ecc-4000-438b-a877-5a5ace0a3acd	e76f78a5-6a6d-4d75-9533-2406fbd544a5	2026-06-12 07:42:09.9145+00	2026-06-12 07:42:09.9145+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
0e90fa95-74f8-48d5-907d-b0d8d780f102	f8503299-55a5-4574-ac3c-2e539b98b930	2026-06-12 07:42:31.683251+00	2026-06-12 07:42:31.683251+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
e9228138-e91a-42ec-9900-e887f372a646	3db326ec-ef45-4bf3-a2c7-bf9ab4ad6b98	2026-06-12 07:42:54.726073+00	2026-06-12 07:42:54.726073+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
e4db6399-1514-4452-91a3-1286168795a6	31f27e3e-e37a-483c-b0cf-268f24a61350	2026-06-12 07:43:01.757417+00	2026-06-12 07:43:01.757417+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
84e6468e-2451-4bf9-a357-e44b49abc49d	1e254bec-48f2-46ec-ad66-61f396b4d2da	2026-06-12 07:43:25.733584+00	2026-06-12 07:43:25.733584+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	14.179.85.74	\N	\N	\N	\N	\N
a38a1efa-5760-481e-9fad-6f9ea54dc815	7d8c5e03-8935-41e8-9d43-f711af128895	2026-06-12 07:43:37.514203+00	2026-06-12 07:43:37.514203+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
98f44290-8349-48c3-9a16-948052987476	d5e9762e-d7e1-4679-9cad-7653e84f05ce	2026-06-12 07:52:54.447808+00	2026-06-12 07:52:54.447808+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
64eaa247-37cc-4963-92e0-9111c8c97209	1cad7ac6-0461-4aa3-b6de-9064effa74af	2026-06-12 07:54:00.575125+00	2026-06-12 07:54:00.575125+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
5b8aecb8-8880-4cf6-aae0-4ca9194dbb6e	abdf20d4-1e35-4703-a6ff-67d4d4d171aa	2026-06-12 07:54:03.116192+00	2026-06-12 07:54:03.116192+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
c168ffcd-e176-4bc5-b442-57f954b8c7a4	18efe2fe-42f1-447d-9209-1a802535ad60	2026-06-12 07:54:35.904732+00	2026-06-12 07:54:35.904732+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
9aef4a4b-b513-4479-971b-9a1e38dacfcb	11285f0c-784e-4ba1-bf70-7a9d286cb320	2026-06-12 07:54:38.308072+00	2026-06-12 07:54:38.308072+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
457e39d3-3492-447e-9d80-9b5b7ed21cf9	db0c53e0-9c81-4209-9e2d-d0e78ef0a682	2026-06-12 07:55:49.193311+00	2026-06-12 07:55:49.193311+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
f806a294-1590-41f8-8c8d-31b05da5619f	aa2cb7f3-d889-4101-8d5c-8dd43646188e	2026-06-12 07:56:55.100757+00	2026-06-12 07:56:55.100757+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
f7344eef-f416-4875-81e6-db9094175c5d	7e586f94-c37b-4f49-a3f8-024ba3045cbe	2026-06-12 08:00:40.906501+00	2026-06-12 08:00:40.906501+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
f10bee2b-ecae-46c1-85e6-48f96b638f01	fa67e9fe-8c2c-449a-8dc8-ddf2546ff3fd	2026-06-12 08:01:06.659818+00	2026-06-12 08:01:06.659818+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
10e636ea-42c9-4a95-a5d1-f4406fccc8a5	225a7e35-d82f-4836-9071-b6937ed0dba2	2026-06-12 08:03:18.199+00	2026-06-12 08:03:18.199+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
e5b7d8ce-8202-4cd6-9a3d-61e771bfd392	03b58870-37b2-431a-91b9-8d88747a5d11	2026-06-12 08:04:10.29343+00	2026-06-12 08:04:10.29343+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
c48790bc-fc12-4acc-9535-e7cdc76614b0	73b0f65a-e485-4038-94ff-1e27ab1c9ec5	2026-06-12 08:04:29.012646+00	2026-06-12 08:04:29.012646+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 26_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/146.0.7680.204 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
2298ce0f-5f95-41b0-b24c-0edc096b8577	b8ff4154-afb9-402e-b12f-e0db6b0357f3	2026-06-12 08:04:36.124641+00	2026-06-12 08:04:36.124641+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
9b73fc4f-42b0-4014-b3dc-a54fbb104c0d	1f1cb1a3-faef-481e-a073-4c1c8d967fb1	2026-06-12 08:05:00.217709+00	2026-06-12 08:05:00.217709+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
b7650dec-50f6-4487-b754-e494fbbab234	8b25b10b-1610-4680-902f-e3f55b7f9778	2026-06-12 08:05:03.110446+00	2026-06-12 08:05:03.110446+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
f2b680fb-3b45-4b39-96a2-edb70f66d737	5128b5ad-af23-4c12-ad9a-de7c4f902374	2026-06-12 08:05:08.094426+00	2026-06-12 08:05:08.094426+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
1a1ae151-63f0-4c71-ade5-6afe116f5582	f94554df-c3d8-4712-be57-9510b513c3af	2026-06-12 06:49:06.255331+00	2026-06-12 08:06:10.701335+00	\N	aal1	\N	2026-06-12 08:06:10.701242	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	118.69.35.175	\N	\N	\N	\N	\N
f552000b-3c5c-4776-bdcc-601c9d3035f7	3481e30b-aa9a-4e31-a3b5-113bf2fdeb47	2026-06-12 08:06:45.604232+00	2026-06-12 08:06:45.604232+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
8a714cb6-db3d-4740-a698-680d5ea03998	6956ab7a-febf-44e0-bf37-a4a13d662c65	2026-06-12 08:07:34.385942+00	2026-06-12 08:07:34.385942+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	14.179.85.74	\N	\N	\N	\N	\N
56e05af7-15c8-4d1b-95f2-240661865e19	c9d36fa3-e4d7-4c00-a055-0697e326a5f5	2026-06-12 08:07:56.296862+00	2026-06-12 08:07:56.296862+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	14.179.85.74	\N	\N	\N	\N	\N
54f0efcb-3935-4db9-8b9e-7b99d4e7efc1	c58b9fb4-a921-403f-9296-84f2198d265c	2026-06-12 08:07:59.504781+00	2026-06-12 08:07:59.504781+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	27.74.133.73	\N	\N	\N	\N	\N
649169d0-ce6a-4c3f-8751-55ca375b9cdf	201d6368-5c4c-42bb-b1cf-af2d51ee27a9	2026-06-12 08:08:01.163738+00	2026-06-12 08:08:01.163738+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	27.74.133.73	\N	\N	\N	\N	\N
45bf9b24-fd27-4ce1-9f39-19ba33b63ce0	397d819c-df84-435d-97cf-fe2499a178b2	2026-06-12 08:08:42.737296+00	2026-06-12 08:08:42.737296+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	27.74.133.73	\N	\N	\N	\N	\N
16d5048f-6fa7-4328-abf0-847466873fb7	cf4be2ba-95ac-4316-a219-26bf7bdb48b3	2026-06-12 08:09:35.731118+00	2026-06-12 08:09:35.731118+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
84dad685-5889-49f7-bbfc-2e47115f94a9	664ce247-3698-417c-ab9d-0628f1fdfe3e	2026-06-12 08:10:41.400176+00	2026-06-12 08:10:41.400176+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
4d962455-2403-4a78-b514-142d1115859a	a62aa2bc-d2e6-40e9-9ec5-a6dd48bfe914	2026-06-12 08:10:54.8045+00	2026-06-12 08:10:54.8045+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
438bb8bc-fd83-44ca-a1c8-0164d764f86e	21b0ebca-c531-4f62-ad6c-062e945241b2	2026-06-12 08:14:09.964585+00	2026-06-12 08:14:09.964585+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 26_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149.0.7827.45 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
306a1a14-5688-477d-8d82-75a579e93e71	11e1d361-9d77-47c2-aa43-98f36c72c4fe	2026-06-12 08:14:39.307278+00	2026-06-12 08:14:39.307278+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
4806245a-4dc4-4cd4-9dd0-0766d98a6adc	8801626e-54eb-435c-879d-10906f693d49	2026-06-12 08:16:34.095923+00	2026-06-12 08:16:34.095923+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
e995a00f-c116-4d67-bcd2-183e8c3204d4	f7e7062d-0992-442b-bca0-adfc3b300c82	2026-06-12 08:16:43.723628+00	2026-06-12 08:16:43.723628+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
62629549-2351-4468-abb8-d198ab57a8a8	d54bd569-2fbd-4e3b-9457-130a8b3a1fc9	2026-06-12 08:17:05.224648+00	2026-06-12 08:17:05.224648+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
a119407b-3c31-4027-b7ba-762dc26dfa88	f56acc37-4f1c-4b27-9a51-ef6cdb97be47	2026-06-12 08:18:00.630211+00	2026-06-12 08:18:00.630211+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
410a90b4-33cb-4491-9510-cf570f74c844	dd946dde-b8e1-42bb-b883-73336b256f47	2026-06-12 08:18:05.00315+00	2026-06-12 08:18:05.00315+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
861621fc-fa81-4df9-836f-0af541da9eb9	7d4593f0-0400-4710-abaf-825eb92ff153	2026-06-12 08:18:57.72271+00	2026-06-12 08:18:57.72271+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 26_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/146.0.7680.204 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
16b33ec6-3097-4446-8915-d12d037eaada	13387259-398e-4d7a-9469-9d5eefa409bc	2026-06-12 08:29:54.18633+00	2026-06-12 08:29:54.18633+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
1da66fb2-a304-41db-a126-39241b33e246	31072724-c420-4697-946e-87fbcf045692	2026-06-12 08:40:31.994258+00	2026-06-12 08:40:31.994258+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
8e4d8bfb-b192-48bd-9a3d-832797f845b7	a75e8f74-ae56-446e-97b2-ec3e889bd986	2026-06-12 08:42:02.613212+00	2026-06-12 08:42:02.613212+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
5081743b-2063-47f3-af82-a8ecaa239696	ce25f033-b6b0-4155-998e-94acb4da6483	2026-06-12 08:42:04.84424+00	2026-06-12 08:42:04.84424+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
3fd4e058-3ccc-4059-ba9a-6f588ee91258	49b634c7-f3be-4b92-b9c7-ce03d4014db9	2026-06-12 09:32:18.95693+00	2026-06-12 09:32:18.95693+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
568ebd8f-23b2-4804-8364-d6dca73c0c42	e27fb815-f136-4969-a4da-061056cc55e0	2026-06-12 09:32:21.771731+00	2026-06-12 09:32:21.771731+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
42f6aa0c-d459-4259-ab16-b2df4cc7f598	a90012e0-8556-46d0-b27f-84c58c80dc6d	2026-06-12 09:32:56.488114+00	2026-06-12 09:32:56.488114+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
d8ff325b-d2f6-4cef-a148-88b2322985bc	b2ea14f6-4707-4dde-b9f6-e426aa22bc9d	2026-06-12 09:32:57.900286+00	2026-06-12 09:32:57.900286+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
52ebada6-a0d1-4a14-ab98-f6bae5fdf7d0	5e77db29-f3ec-4d3f-829b-1dd742abebf5	2026-06-12 09:32:58.83698+00	2026-06-12 09:32:58.83698+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
cdd01dc3-3535-4479-9844-689fded9b103	148a6ed3-cd1f-4051-aed3-21b324d1d82a	2026-06-12 08:41:16.289036+00	2026-06-12 09:43:35.911325+00	\N	aal1	\N	2026-06-12 09:43:35.911235	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
32751717-7b64-4e2e-ab80-17042bda7bf1	18e452a5-3fed-4b7f-bece-28d0edc7783e	2026-06-12 08:09:09.216818+00	2026-06-12 13:05:58.943294+00	\N	aal1	\N	2026-06-12 13:05:58.943183	Mozilla/5.0 (iPhone; CPU iPhone OS 26_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/146.0.7680.204 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
3c038494-1849-4464-8706-8c6a4a6df15a	124d00b9-b6a0-4813-9820-6e42268d7864	2026-06-12 08:40:38.340975+00	2026-06-13 03:54:03.927364+00	\N	aal1	\N	2026-06-13 03:54:03.927264	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	42.118.145.146	\N	\N	\N	\N	\N
784d3062-fdba-4705-9370-4ad6c8a8047a	97ac06df-8f3d-4eb3-a695-1a94f3a26289	2026-06-12 09:32:59.755401+00	2026-06-12 09:32:59.755401+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
b158e434-90ba-4bf7-b717-e30a58c741d6	34f810eb-05c4-449a-a806-9ac45ec67f01	2026-06-12 09:33:00.819717+00	2026-06-12 09:33:00.819717+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
1ee1e0a1-6311-4531-8a18-dbf0c19b1efa	ce4f5c2d-c5d1-42ab-999f-70d2e88b52e4	2026-06-12 09:34:02.380274+00	2026-06-12 09:34:02.380274+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
ede33dd7-4dde-482f-9aa8-45c89bc16200	f23764ab-0b53-4eea-921a-62e07a56d7b9	2026-06-12 09:34:18.906169+00	2026-06-12 09:34:18.906169+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
039e72bd-1746-4cc2-a434-4493dfc11fec	8990047a-f5bc-4220-970a-711d9c9fcdba	2026-06-12 08:08:27.638486+00	2026-06-12 09:34:55.121056+00	\N	aal1	\N	2026-06-12 09:34:55.120963	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	14.179.85.74	\N	\N	\N	\N	\N
28a6acc8-897c-43be-b210-54081f82e8b1	af9fc048-8014-4384-a0d0-f31d1e6c4638	2026-06-12 09:35:31.696764+00	2026-06-12 09:35:31.696764+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
7f72cc7d-1b80-4cfd-b48a-ef401a00e54b	189dfd01-3549-4b85-a125-4ff4fe21973a	2026-06-12 09:35:33.432581+00	2026-06-12 09:35:33.432581+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
a5b45f89-304f-4832-9a05-db8e7a12ee85	9c5f933e-74c0-4035-9656-24d410345832	2026-06-12 09:35:39.730185+00	2026-06-12 09:35:39.730185+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
2fa0f7f8-333d-4c49-835f-dd3732273d6d	1fbe544f-8961-493b-9636-e89a8e213f3f	2026-06-12 09:36:16.997227+00	2026-06-12 09:36:16.997227+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
556003d0-87f4-444a-a9bb-6032904575b6	f7b9f068-0069-4676-a960-f4fe2420c7d1	2026-06-12 09:36:18.281457+00	2026-06-12 09:36:18.281457+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
7922830c-35c2-4abf-bb02-ff3c9d42bc63	52c8f853-2649-480a-bdfc-f04cb3219afd	2026-06-12 09:36:19.04668+00	2026-06-12 09:36:19.04668+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
cf504de3-43ff-4656-b110-44384d86cb63	add5c076-3a63-48d7-bf6a-c2c344a0c02e	2026-06-12 09:36:19.883479+00	2026-06-12 09:36:19.883479+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
ff65f629-70b1-4d53-b361-bc193b126bfd	098caab1-26d1-48a9-9544-20888b7b08b7	2026-06-12 09:36:25.268002+00	2026-06-12 09:36:25.268002+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
36d4b758-c906-4188-abcd-453635a4a21f	90ab57ed-a6a7-42a1-8f00-f0affefbe9c5	2026-06-12 09:36:25.949381+00	2026-06-12 09:36:25.949381+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
4836ee16-c983-4168-ae1d-1d2da89ab404	b3c6da83-938f-4c22-86e0-ccd832c142f4	2026-06-12 09:36:27.35+00	2026-06-12 09:36:27.35+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
ef121dfb-cdb6-4d43-8a9f-761b317f1880	dce33968-4dbb-4600-b78f-0c7f4f0b302d	2026-06-12 09:36:57.119712+00	2026-06-12 09:36:57.119712+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
df1c84e6-6419-4acd-8565-53c90b77c07b	80950f0a-8660-4b5e-b59d-bacd3e4b411d	2026-06-12 09:36:58.284429+00	2026-06-12 09:36:58.284429+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
e446e2d3-b5e4-4d89-9f09-f6ccd90b530b	9e0bd2e9-bdbf-4e9f-adc7-2aec7b351178	2026-06-12 09:36:59.101629+00	2026-06-12 09:36:59.101629+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
83f34bdc-4a42-4616-a4b2-97131469cd3e	1bea8877-9902-4fb0-9b54-837927d86b1f	2026-06-12 09:37:21.073082+00	2026-06-12 09:37:21.073082+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
e5d8db3e-2dac-43f1-96fc-d194a451312f	25a735c5-cd09-4b2e-9261-805f224731de	2026-06-12 09:37:28.937567+00	2026-06-12 09:37:28.937567+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
0c648ad6-5f64-4da6-9c4e-3ab9ad0a4f20	406099d7-4700-44ad-90f5-6ec1db7995f1	2026-06-12 09:38:30.360737+00	2026-06-12 09:38:30.360737+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
e664315b-0988-4caf-b965-70d1d699c00a	95ad49c3-a03b-49a6-a67e-63a33f42c029	2026-06-12 09:38:51.452899+00	2026-06-12 09:38:51.452899+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
34996de3-226e-466f-a086-5fc1d9451e60	dbec404f-2233-41c8-a373-0e79d5541e62	2026-06-12 09:38:52.755912+00	2026-06-12 09:38:52.755912+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
9e11e5c3-72b5-428e-baa4-b4c373c670ef	37304c07-2c30-48e2-a104-138a10150ef3	2026-06-12 09:38:53.516961+00	2026-06-12 09:38:53.516961+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
d4b99fd8-388f-4ade-a6aa-583888dd1663	a20786bc-3c58-49b9-8fe4-00978b4a036a	2026-06-12 09:38:54.189396+00	2026-06-12 09:38:54.189396+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
cf91c061-4972-46e2-86d4-f733d80977c0	4af4b21d-e0cc-4e13-b72c-5f322bdf4a43	2026-06-12 09:39:09.9449+00	2026-06-12 09:39:09.9449+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
af325113-f292-437a-bc5a-9bc5fb497402	24ffa000-5b2a-4055-8b85-051b3ae39d3f	2026-06-12 09:39:11.270353+00	2026-06-12 09:39:11.270353+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
c08db4b2-045a-40ed-ba57-3592441bed5b	ffed837f-9680-4773-8e2e-9f59c2771b61	2026-06-12 09:39:12.123921+00	2026-06-12 09:39:12.123921+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
bf3e4b54-b1fb-4be4-9180-d88f8d3611e1	945e5bb2-44bb-4e99-804b-4df989c7aadb	2026-06-12 09:39:12.754116+00	2026-06-12 09:39:12.754116+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
7ef8d3e6-b6f4-4681-9eb8-0ecd42ab1742	809b24e3-9eae-4f00-ae9a-06e5217977d6	2026-06-12 09:41:11.845683+00	2026-06-12 09:41:11.845683+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
3ad53fad-d076-48a2-a240-ae7ddef3c874	9885e2d1-5e7f-4f09-95d8-de22d84391b0	2026-06-12 09:42:16.695999+00	2026-06-12 09:42:16.695999+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
de24ea7e-1e22-44e0-87f8-a1ff41104786	18bd5b89-c11b-4fff-9c58-c4743cdced99	2026-06-12 09:42:25.339587+00	2026-06-12 09:42:25.339587+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
980f747c-253a-4461-8348-c291a01a9a7a	12465f7e-bd43-4577-9f72-8b9ec0ed5b47	2026-06-12 09:43:37.541152+00	2026-06-12 09:43:37.541152+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
5491d9d5-3983-4712-9647-d337df570d6c	b3ceed5f-3077-470b-995e-941a958f8f36	2026-06-12 09:43:38.946172+00	2026-06-12 09:43:38.946172+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
8a1384d3-9318-4fc9-aa5e-9762b2de6850	6c9a7777-9b79-4113-9839-0805280ca55a	2026-06-12 09:43:39.733951+00	2026-06-12 09:43:39.733951+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
30fcff79-8bfa-4c95-87a8-08f7c66cc691	f838a000-e70c-4606-a764-60460867dca9	2026-06-12 09:48:42.910674+00	2026-06-12 09:48:42.910674+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
0adf82d7-0cb7-4c59-b9f1-aeae33a411cb	e3fe2440-b7d6-4001-be43-63c2d9ceaf1d	2026-06-12 09:49:32.389871+00	2026-06-12 09:49:32.389871+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
4c973497-1521-4c12-beb7-f97589b0e97a	d5f7406e-edea-4b6b-9fbe-ca9c43d887c7	2026-06-12 09:50:02.667408+00	2026-06-12 09:50:02.667408+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
8212da37-eda8-4d7a-9eca-d867672210fc	a9a5fca5-4ff5-4a55-9bf4-48ec422ae02f	2026-06-12 09:50:07.615234+00	2026-06-12 09:50:07.615234+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
44e06417-adaa-4b63-9f9e-900b58f5e59b	8b764345-86d4-4c42-8c0a-93583b0cbf2b	2026-06-12 09:50:09.580415+00	2026-06-12 09:50:09.580415+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
0bd295f9-4250-47ad-88f6-3ee109f13a23	a5924b4f-7154-4c55-aca6-ffe1b4ca737f	2026-06-12 09:50:25.943181+00	2026-06-12 09:50:25.943181+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
e0c50005-0d75-4217-ba04-d522f9853b1e	a2313f28-627f-4178-9cb5-98e8d2d414cb	2026-06-12 09:51:23.075974+00	2026-06-12 09:51:23.075974+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
e66febfd-af64-4db0-bf1d-f87c50053725	78d55f61-3c1b-455d-bb86-5bc07be81b29	2026-06-12 09:58:22.448+00	2026-06-12 09:58:22.448+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
7a65e573-5c2b-45e9-8ca0-e2c938610eee	4ca0d654-4b61-4381-a053-8269cc9ad6b0	2026-06-12 10:01:02.862772+00	2026-06-12 10:01:02.862772+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
778235b4-815b-4de9-87c8-1d4d1b50c391	2d0a2b99-4b2b-4689-917d-3372716c9e08	2026-06-12 10:01:04.209034+00	2026-06-12 10:01:04.209034+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
72ef9197-d380-4f3e-9abc-c9ac1c48c1c3	e377ff25-d2f9-4601-9dc0-f67d5ffc2fae	2026-06-12 10:04:11.051135+00	2026-06-12 10:04:11.051135+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
e4981f53-b0b3-4195-86cb-37b1dabf5081	a204d21c-17fb-4eec-84b9-78b958f86f46	2026-06-13 00:12:52.337085+00	2026-06-13 00:12:52.337085+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 15; A301SH Build/SC36A;) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.91 Mobile Safari/537.36 Zalo android/260502907 ZaloTheme/light ZaloLanguage/vi	27.70.241.108	\N	\N	\N	\N	\N
d4b0494e-1dd5-4ce9-b74f-d2e002f0a741	ae19d965-d835-4e48-bbe5-cd22f458181f	2026-06-13 00:12:58.197818+00	2026-06-13 02:07:51.380446+00	\N	aal1	\N	2026-06-13 02:07:51.380332	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36 EdgA/149.0.0.0	27.70.241.108	\N	\N	\N	\N	\N
336ecd4f-f756-44f4-9dce-16b9d2787c8c	40514075-d5ed-4273-be49-e94d34e04613	2026-06-13 05:37:16.920338+00	2026-06-14 12:46:17.578728+00	\N	aal1	\N	2026-06-14 12:46:17.578617	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1	103.199.33.179	\N	\N	\N	\N	\N
8c4965f0-82f3-477d-8a3c-05390a3dacc2	a392bd34-3795-41ce-9d2e-3a43c9220ea2	2026-06-13 09:57:27.103521+00	2026-06-13 09:57:27.103521+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36	171.255.158.169	\N	\N	\N	\N	\N
59b2f53c-a976-411e-88ea-9bbc4b3b7bb9	2b362ca9-84a9-4eae-a5f1-6937d2e35034	2026-06-13 10:30:27.854408+00	2026-06-13 10:30:27.854408+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	42.113.150.207	\N	\N	\N	\N	\N
3c472d9a-da0f-4918-bf82-6818d3f92b82	e0007381-cf34-4037-8dcb-d762401dec65	2026-06-13 10:30:31.343699+00	2026-06-13 10:30:31.343699+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	42.113.150.207	\N	\N	\N	\N	\N
ca62bb60-1ef3-4bbd-a216-9e56246f5e33	8b540241-add8-40bb-93ec-a1f4332ac0f0	2026-06-13 10:30:37.649798+00	2026-06-13 10:30:37.649798+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	42.113.150.207	\N	\N	\N	\N	\N
818e77d1-0b7e-4c99-8764-57cdb82cb8fb	82e1a5d9-d557-42dc-a7ee-6475ec9867be	2026-06-13 10:30:46.138946+00	2026-06-13 10:30:46.138946+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	42.113.150.207	\N	\N	\N	\N	\N
826a4e26-343a-4382-9d33-9822e8cd460a	16d81c04-9ef0-4307-b6be-af6286a10cf4	2026-06-13 10:30:50.106297+00	2026-06-13 10:30:50.106297+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	42.113.150.207	\N	\N	\N	\N	\N
097b6e37-17bd-4500-a89d-f2912c23d835	2fdf9677-2cc8-4776-98c8-aaa6d8f008d7	2026-06-13 04:08:30.319877+00	2026-06-14 09:01:10.199959+00	\N	aal1	\N	2026-06-14 09:01:10.199861	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	118.71.92.156	\N	\N	\N	\N	\N
06b144ea-e24e-4fcf-95d1-6c798b5f74c5	544434d3-ad2a-4364-a154-1f60154c603d	2026-06-13 11:57:26.772439+00	2026-06-13 11:57:26.772439+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/299.0.597926513 Mobile/15E148 Safari/604.1	42.1.84.124	\N	\N	\N	\N	\N
905ff0f9-72e8-4748-9480-7288740a7808	544434d3-ad2a-4364-a154-1f60154c603d	2026-06-13 11:30:43.566086+00	2026-06-13 13:51:56.946481+00	\N	aal1	\N	2026-06-13 13:51:56.94635	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	42.1.84.124	\N	\N	\N	\N	\N
69b69066-70bc-4318-8651-d66106c0fdca	edf75b25-8658-45f9-a078-c8cb8ea5fbe9	2026-06-13 11:06:14.507702+00	2026-06-13 14:45:40.418191+00	\N	aal1	\N	2026-06-13 14:45:40.418101	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/129.0.6668.69 Mobile/15E148 Safari/604.1	171.226.54.213	\N	\N	\N	\N	\N
79138b30-67af-435c-a673-639a65cb424d	1073e7a6-ddb4-4375-83c8-84d4eecc5475	2026-06-13 15:28:27.62588+00	2026-06-13 15:28:27.62588+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBAV/565.0.0.29.108;FBBV/991411137;FBDV/iPhone16,2;FBMD/iPhone;FBSN/iOS;FBSV/26.5;FBSS/3;FBCR/;FBID/phone;FBLC/vi_VN;FBOP/80]	171.251.232.152	\N	\N	\N	\N	\N
b90d3c5c-9e85-4117-98c0-67266a0def6e	d3ae6305-a53b-4608-95ef-e17171e9b8db	2026-06-13 15:56:20.361859+00	2026-06-13 15:56:20.361859+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBAV/565.0.0.29.108;FBBV/991411137;FBDV/iPhone12,5;FBMD/iPhone;FBSN/iOS;FBSV/18.5;FBSS/3;FBCR/;FBID/phone;FBLC/vi_VN;FBOP/80]	42.116.103.254	\N	\N	\N	\N	\N
63d2d37a-c4cf-48ab-b75e-e49275ed0fd7	03d71ade-0176-41ed-ba4d-84d62214cb46	2026-06-14 04:00:04.626903+00	2026-06-14 04:00:04.626903+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 12; SO-51A Build/58.2.B.0.520;) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/148.0.7778.217 Mobile Safari/537.36 Zalo android/260501901 ZaloTheme/light ZaloLanguage/vi	14.186.186.211	\N	\N	\N	\N	\N
c074b5d6-06c7-463f-8d63-52edf3b82ef9	bbb0ada2-a3a0-4dfe-961a-959836b12f81	2026-06-14 09:09:30.304157+00	2026-06-14 09:09:30.304157+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	27.76.195.105	\N	\N	\N	\N	\N
5dbf510d-f285-41fa-adf0-c8354109792a	c6b1885d-c451-462d-afd1-d8a14082fc11	2026-06-14 10:30:29.498105+00	2026-06-14 10:30:29.498105+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	118.71.92.156	\N	\N	\N	\N	\N
5df25f4d-947c-4f08-b5a7-2ded69571d7f	9c41e93c-efeb-40fa-8c67-e8549d10d46a	2026-06-13 15:33:47.728636+00	2026-06-14 13:37:40.030898+00	\N	aal1	\N	2026-06-14 13:37:40.030772	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/149 Version/11.1.1 Safari/605.1.15	118.71.92.156	\N	\N	\N	\N	\N
5ea1d268-c0e9-43e0-933b-404c2fbe9f67	d279074b-7967-4be0-9ac0-7f933dca23b6	2026-06-15 02:30:44.355761+00	2026-06-15 02:30:44.355761+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	115.79.192.13	\N	\N	\N	\N	\N
2efcf5f7-f095-4803-aaea-95834a0263df	d279074b-7967-4be0-9ac0-7f933dca23b6	2026-06-14 10:30:09.126422+00	2026-06-15 02:59:09.265168+00	\N	aal1	\N	2026-06-15 02:59:09.265058	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	115.79.192.13	\N	\N	\N	\N	\N
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
2873c830-23f8-4bfb-a887-faa36d757db2	2026-06-10 04:15:13.352931+00	2026-06-10 04:15:13.352931+00	anonymous	6ad4081a-2d57-495e-84af-71d6e3528a1d
43c4e37b-de48-4215-a2c8-e082d3370c24	2026-06-10 04:42:30.679022+00	2026-06-10 04:42:30.679022+00	anonymous	98526acd-e6b8-4edf-bdfb-2b2cf7654b89
22752014-cdd7-448a-b17f-6176494eadb9	2026-06-10 04:42:43.788807+00	2026-06-10 04:42:43.788807+00	anonymous	a3e2b2b7-f39b-4547-8cf3-f204a6e6ff67
d6f46639-9773-4fea-8bc1-ee46621ff805	2026-06-10 05:53:58.205216+00	2026-06-10 05:53:58.205216+00	anonymous	e03fda9f-2ca2-4f8a-a396-3179d09c4bb2
e3c36b7d-bd08-4b9a-bd07-4fd11a903dd0	2026-06-10 06:12:41.948889+00	2026-06-10 06:12:41.948889+00	anonymous	eeab1d2c-c88f-48cd-b364-8c42e013eaea
31446a88-88b4-4dba-a426-74cc266d4299	2026-06-10 06:36:33.665298+00	2026-06-10 06:36:33.665298+00	anonymous	f65aea56-23a4-470f-915c-ac61fb7bad27
27f180b4-4d8c-474e-9a28-f6c668e376fd	2026-06-10 13:28:32.775863+00	2026-06-10 13:28:32.775863+00	anonymous	481857f1-a2ec-4a83-b0a7-94b160c05f86
7b32ed3c-f74b-40cc-bace-ee45047950eb	2026-06-10 13:29:34.019881+00	2026-06-10 13:29:34.019881+00	anonymous	9055ffdf-4a3f-4740-ab36-0f4168daa0aa
921dee6b-9b40-4722-812a-ae33112f9a81	2026-06-10 13:33:20.454811+00	2026-06-10 13:33:20.454811+00	anonymous	bcde28c0-745b-4249-80b4-f5eee9387658
373631f6-b8f0-491b-81f2-c9092648cc51	2026-06-10 13:33:25.556441+00	2026-06-10 13:33:25.556441+00	anonymous	afa81388-a6ca-4cec-bade-99bb4ac7d1c0
a9b66bf4-c441-4297-b8c7-c6f22f1bdca0	2026-06-10 13:35:10.477987+00	2026-06-10 13:35:10.477987+00	anonymous	2ce3004c-7445-473d-ab40-d8c330b3bf25
7088b322-64b9-4f15-a8e8-a53a269a2d18	2026-06-10 13:35:17.570602+00	2026-06-10 13:35:17.570602+00	anonymous	3a1294cf-3eca-4c6c-a195-dd6d7fa0ffca
28d3548d-2f10-48e4-9d2e-9f5c02a5b0f3	2026-06-10 13:35:44.691255+00	2026-06-10 13:35:44.691255+00	anonymous	1413bfbb-b5dd-4213-b9a9-8d93c249551f
97f32f2e-d9f5-49ed-ad8c-3d98aa3dda77	2026-06-10 13:35:46.233063+00	2026-06-10 13:35:46.233063+00	anonymous	b7f51c6b-4da0-4e9f-8e7c-22737c6d7dfb
9ade8318-ae2c-4d9f-82f1-918c4b386f6b	2026-06-10 13:35:55.060192+00	2026-06-10 13:35:55.060192+00	anonymous	70eceb1f-274b-4e47-95c1-dd63b191c1bd
d898387d-5334-4710-95b9-7e50d8d755b6	2026-06-10 13:44:38.615978+00	2026-06-10 13:44:38.615978+00	anonymous	738abce5-cfd9-4a16-92f8-7888fa474f14
5d11f586-82ea-4f0b-b088-93211556060c	2026-06-10 14:59:27.734983+00	2026-06-10 14:59:27.734983+00	anonymous	f919c46f-933a-49dd-a64f-3f43b0bb2558
5f338fb5-f2d9-42e7-9901-ea1db50f74fc	2026-06-10 15:53:36.709771+00	2026-06-10 15:53:36.709771+00	anonymous	8bc87872-8a4b-42b2-ad32-e73aacc604df
e3a9fe58-536c-4f67-8471-3224a6a0f665	2026-06-11 01:45:57.925999+00	2026-06-11 01:45:57.925999+00	anonymous	b4b039ef-a970-4aff-be11-30ed6e1be850
0148d578-ee1c-4a16-884d-d1dc3a668075	2026-06-11 03:15:23.83894+00	2026-06-11 03:15:23.83894+00	anonymous	e35c1600-9a27-4253-839f-c1d1d5e635d3
ffc4c90f-2658-4941-923b-17977eea3c8b	2026-06-11 03:15:26.72674+00	2026-06-11 03:15:26.72674+00	anonymous	f6634dd6-395c-4eb9-afba-6fc1d4b24e71
4b7c320f-fa17-461e-8c5b-3e66418d2332	2026-06-11 04:21:42.865434+00	2026-06-11 04:21:42.865434+00	anonymous	48e01098-fa9c-400c-acbb-cdba1cc510d9
d476fbd2-a0a1-49c3-8f3d-6c13941ea9e2	2026-06-11 04:33:01.087152+00	2026-06-11 04:33:01.087152+00	anonymous	f0de24a9-a19b-4f72-a89d-d995dac8308e
86e4ec86-0fea-47f4-8c1c-43e1cf03e99e	2026-06-11 04:33:03.993935+00	2026-06-11 04:33:03.993935+00	anonymous	4a662652-cf62-411e-bd82-29f822db9cb1
ba784013-bbd7-4870-85fe-02f843426d7f	2026-06-11 04:33:21.54922+00	2026-06-11 04:33:21.54922+00	anonymous	71d7b650-7630-4ed1-9936-ee4bc31240de
e934a4be-4c69-4879-a74a-12d16e8265c4	2026-06-11 04:33:22.90167+00	2026-06-11 04:33:22.90167+00	anonymous	bf79a2d6-0e83-4abb-b717-4cf72779ce37
a1ca7e64-87ce-428d-9aac-5205d6b25ab1	2026-06-11 04:33:25.655261+00	2026-06-11 04:33:25.655261+00	anonymous	a8c58863-8951-4f65-8253-ac2ba18158f7
e81571e1-8b2f-4ef5-91af-d5945c0ddf1c	2026-06-11 04:33:26.835474+00	2026-06-11 04:33:26.835474+00	anonymous	6375f8f5-a513-49be-8cea-3cbc26d5fa99
65b71518-2284-49ae-abca-3ac96a8810db	2026-06-11 04:33:27.945438+00	2026-06-11 04:33:27.945438+00	anonymous	3ac95b64-0e54-480e-a235-4d23a589526b
333220dd-590c-41c0-85df-7696754aa62e	2026-06-11 04:33:34.811626+00	2026-06-11 04:33:34.811626+00	anonymous	5ed372e7-0fcf-44da-b1fe-a9550af5ea3a
3aeecb04-a5ab-483f-aa48-34f33f587e13	2026-06-11 04:33:41.598243+00	2026-06-11 04:33:41.598243+00	anonymous	9c7f961d-6219-4a4f-9814-bd767d3f1450
57e2c39d-b584-48d8-8f49-3cd3c1804c71	2026-06-11 06:42:27.750188+00	2026-06-11 06:42:27.750188+00	anonymous	e005b9d7-6ce8-4c4b-92ce-b4a380e97f10
b340153c-edb2-4059-80f2-b0fb7bd02101	2026-06-11 06:42:29.897073+00	2026-06-11 06:42:29.897073+00	anonymous	21dd87fa-cbf5-4b1a-90eb-d7e2b09c3b8e
0f139128-8bbf-4ba9-9d6e-640a1a576e47	2026-06-11 06:43:25.116873+00	2026-06-11 06:43:25.116873+00	anonymous	2671553f-b018-4190-b22d-645f78347207
ad9df9cd-d73e-4bde-a615-a0b3cca933e1	2026-06-11 06:43:42.645783+00	2026-06-11 06:43:42.645783+00	anonymous	5ef1398b-5fb6-422c-a9f5-6f55e76ad3fd
dab8b8ca-9c9c-4780-a199-90425f4e43fd	2026-06-11 06:44:06.395502+00	2026-06-11 06:44:06.395502+00	anonymous	e7bc96ee-e5ab-48d7-82ad-a68025332b48
2d83fb2c-aaf8-4348-b698-0521c8a62d59	2026-06-11 06:44:08.230855+00	2026-06-11 06:44:08.230855+00	anonymous	92301ea2-bd25-4b78-8ab5-5fa3ca4ad4bb
f5ff760a-c1af-4612-8e6a-e821df8afb68	2026-06-11 06:50:49.704928+00	2026-06-11 06:50:49.704928+00	password	b4790bc9-cd93-41b0-bff3-48888dd5b966
95fcc347-78b0-4463-ba84-7d4688fe598a	2026-06-11 06:56:32.884208+00	2026-06-11 06:56:32.884208+00	anonymous	9fd4f6cd-6142-450a-9714-9b1978b45665
e65db0c1-fe32-43a9-9458-f6cdf702824b	2026-06-11 08:41:23.347037+00	2026-06-11 08:41:23.347037+00	oauth	d2ea9330-346a-44db-9d6b-00ac817bfa7a
bf27e73b-4d9f-4840-bce1-ed87af80e993	2026-06-12 05:21:56.772816+00	2026-06-12 05:21:56.772816+00	anonymous	c19628a0-821d-4624-a0bc-6b5f3bcfbc24
a809673b-fdaa-4673-83f4-3af52fc1471e	2026-06-12 06:25:01.032641+00	2026-06-12 06:25:01.032641+00	oauth	4a9085c4-d6ef-4961-964b-9a12c5bfacd3
29c890ee-2cae-4e88-a739-b7818e357254	2026-06-12 06:34:55.709135+00	2026-06-12 06:34:55.709135+00	oauth	ddf04ea9-78bd-42ad-a7aa-4986c527a5da
a715777f-5cbd-4320-87f3-133f84becf3f	2026-06-12 06:38:03.96015+00	2026-06-12 06:38:03.96015+00	oauth	83aea439-19ab-41a3-9ccb-7a59af83bfb3
a9962ce5-824b-4265-9b32-0bbc0ecd84c6	2026-06-12 06:44:24.525689+00	2026-06-12 06:44:24.525689+00	anonymous	be7365ad-5a9d-439b-8bc0-e476e64cbd6d
73e41d07-71d8-4c4a-b9b0-226cb975ade1	2026-06-12 06:44:58.704131+00	2026-06-12 06:44:58.704131+00	anonymous	5d878911-e27b-4c50-bef3-9471f91db3ac
1a1ae151-63f0-4c71-ade5-6afe116f5582	2026-06-12 06:49:06.25918+00	2026-06-12 06:49:06.25918+00	anonymous	e17b8a4a-fc47-41f0-8b82-1e359f69673b
7e20cdfd-60a2-4a69-95e1-d6bd509b5122	2026-06-12 07:34:46.345438+00	2026-06-12 07:34:46.345438+00	anonymous	c2445a50-a10c-4ba4-936e-1272c2f794ce
180426a6-517f-4803-b156-95eefbd0f646	2026-06-12 07:35:09.807077+00	2026-06-12 07:35:09.807077+00	anonymous	1f387e37-e51b-4675-b315-3fcbe3a32ad8
a8401cad-c79d-436e-a604-1a2320e102c7	2026-06-12 07:35:11.653851+00	2026-06-12 07:35:11.653851+00	anonymous	97f72cca-7690-44c2-8f88-d1b7c27aa1cd
daef983a-ff6d-45e4-93ba-3683a12adc52	2026-06-12 07:35:34.148228+00	2026-06-12 07:35:34.148228+00	anonymous	a9080e00-09b1-479c-88ee-4aeaa8300fc4
27a349c0-9ead-422c-bb2e-c3568aaa9fac	2026-06-12 07:35:57.361303+00	2026-06-12 07:35:57.361303+00	anonymous	19984b65-d27c-4f16-b0ac-8fd247e3332c
bbe1e50d-5576-4088-ba5d-edeb9bde8717	2026-06-12 07:36:05.992257+00	2026-06-12 07:36:05.992257+00	anonymous	c52264ec-c532-4370-a959-2686f08944b2
8aad5d4d-dd61-4789-8cc9-2a342c061db4	2026-06-12 07:36:10.611819+00	2026-06-12 07:36:10.611819+00	anonymous	daa79652-e627-4557-a5c1-6114d364ece4
e11e243d-4e63-488d-9791-15d2b71fedd6	2026-06-12 07:37:22.324047+00	2026-06-12 07:37:22.324047+00	anonymous	01d9aefc-1051-4855-b4b4-2b5fb772e6a0
b1178548-c8d4-414c-bfbc-a411cc9f4bdd	2026-06-12 07:37:50.503089+00	2026-06-12 07:37:50.503089+00	anonymous	735016cd-e106-4d46-bcda-18a5af88614a
f9d3f87c-fb3c-43c0-a74b-ca9d15b87b79	2026-06-12 07:38:26.357043+00	2026-06-12 07:38:26.357043+00	anonymous	9baea23b-7aab-4754-bbd5-ef3a2c52e7e1
0018c86f-283e-4228-bda1-e12b86fcc33e	2026-06-12 07:38:53.909704+00	2026-06-12 07:38:53.909704+00	anonymous	97a160fa-571b-4b67-9cfa-19022365eea0
5ab30283-5cb3-4296-9f8e-f23a23b6db73	2026-06-12 07:39:07.117913+00	2026-06-12 07:39:07.117913+00	anonymous	d278002c-72d9-4aab-9b12-24da81c8efc5
3ef50453-589a-4406-8a13-58735b0b2074	2026-06-12 07:40:05.466019+00	2026-06-12 07:40:05.466019+00	anonymous	b380fc28-00fc-4094-af9c-c26fc4230be4
93378fa9-fcb2-49ac-82b2-7997ee387c08	2026-06-12 07:40:06.366745+00	2026-06-12 07:40:06.366745+00	anonymous	ca709703-f7a3-480b-9b77-2bd313c0d3f8
d0b4a022-1fb7-4cc2-936d-610b849bc2b7	2026-06-12 07:40:45.000772+00	2026-06-12 07:40:45.000772+00	anonymous	6927078c-97e4-4027-a27d-3293ac6405f3
b022546b-1405-4fec-a161-03ab6d974276	2026-06-12 07:40:46.625068+00	2026-06-12 07:40:46.625068+00	anonymous	8cfdd332-787d-4ce8-a95c-c41a61a46269
acad5992-49ec-4840-b79c-9144ba66b7c7	2026-06-12 07:41:03.405416+00	2026-06-12 07:41:03.405416+00	anonymous	1d25f01f-11fe-4fd7-99cd-85a381b1b889
61329589-96ce-4178-9995-2b016d25a88a	2026-06-12 07:41:06.956633+00	2026-06-12 07:41:06.956633+00	anonymous	d8e6ed64-cefe-4884-8339-82ec0c91eb67
09b80dc6-66ab-4944-b601-31d3efb13022	2026-06-12 07:41:17.787361+00	2026-06-12 07:41:17.787361+00	anonymous	ca9fa15b-b0fc-42bc-9fe9-16af5a75901f
5f730885-f36d-49cd-96c8-ac5842c0e2ee	2026-06-12 07:41:22.261377+00	2026-06-12 07:41:22.261377+00	anonymous	e94e1695-384b-4291-b59c-d037bf43dcea
844e9ac6-8004-405e-981d-4ce3097dfdb8	2026-06-12 07:41:55.076294+00	2026-06-12 07:41:55.076294+00	anonymous	9447e1ae-f094-40e8-8dbf-a326f0719a29
25957de9-67dd-43e8-9457-cc7b5fb686a6	2026-06-12 07:41:59.743107+00	2026-06-12 07:41:59.743107+00	anonymous	0aee8406-3685-4b1f-aaa0-6100bf707ebd
e56a6ecc-4000-438b-a877-5a5ace0a3acd	2026-06-12 07:42:09.91644+00	2026-06-12 07:42:09.91644+00	anonymous	1af857d4-1dbf-4c23-901e-4e86c1194747
0e90fa95-74f8-48d5-907d-b0d8d780f102	2026-06-12 07:42:31.685154+00	2026-06-12 07:42:31.685154+00	anonymous	c343d4d7-9542-41e6-999f-f2721d130174
e9228138-e91a-42ec-9900-e887f372a646	2026-06-12 07:42:54.728015+00	2026-06-12 07:42:54.728015+00	anonymous	6546696c-be05-4ef0-997b-d859b6bd2c19
e4db6399-1514-4452-91a3-1286168795a6	2026-06-12 07:43:01.759252+00	2026-06-12 07:43:01.759252+00	anonymous	1a383447-3dfa-49e0-bee4-886cc81d205b
84e6468e-2451-4bf9-a357-e44b49abc49d	2026-06-12 07:43:25.735442+00	2026-06-12 07:43:25.735442+00	anonymous	e11ad724-5a06-4308-83f1-489c6294ebf5
a38a1efa-5760-481e-9fad-6f9ea54dc815	2026-06-12 07:43:37.517084+00	2026-06-12 07:43:37.517084+00	anonymous	81691f84-f9b1-46c4-926d-e50cae206ac0
98f44290-8349-48c3-9a16-948052987476	2026-06-12 07:52:54.459897+00	2026-06-12 07:52:54.459897+00	anonymous	59a8d044-322b-46a0-ab29-f599ada669bb
64eaa247-37cc-4963-92e0-9111c8c97209	2026-06-12 07:54:00.578827+00	2026-06-12 07:54:00.578827+00	anonymous	ec9e05da-b9dc-4c03-bb68-7f23a25317f4
5b8aecb8-8880-4cf6-aae0-4ca9194dbb6e	2026-06-12 07:54:03.118215+00	2026-06-12 07:54:03.118215+00	anonymous	1a21f305-14c5-4388-91fb-fcecd6f8b018
c168ffcd-e176-4bc5-b442-57f954b8c7a4	2026-06-12 07:54:35.907093+00	2026-06-12 07:54:35.907093+00	anonymous	1be5f115-994d-44a9-84de-4b80fbe4a7db
9aef4a4b-b513-4479-971b-9a1e38dacfcb	2026-06-12 07:54:38.310519+00	2026-06-12 07:54:38.310519+00	anonymous	517749fb-979d-43c4-beda-caa05925f07c
457e39d3-3492-447e-9d80-9b5b7ed21cf9	2026-06-12 07:55:49.19754+00	2026-06-12 07:55:49.19754+00	anonymous	cd8da324-0971-49d1-9c56-9f5193abc94b
f806a294-1590-41f8-8c8d-31b05da5619f	2026-06-12 07:56:55.10692+00	2026-06-12 07:56:55.10692+00	anonymous	ec214949-441c-4282-ad82-c85fc9d8fa2b
f7344eef-f416-4875-81e6-db9094175c5d	2026-06-12 08:00:40.909979+00	2026-06-12 08:00:40.909979+00	anonymous	accb931d-811c-4d5c-ad6b-22fa0170bcf2
f10bee2b-ecae-46c1-85e6-48f96b638f01	2026-06-12 08:01:06.664857+00	2026-06-12 08:01:06.664857+00	anonymous	bfc063af-5518-4b32-978c-5c59cce9452a
10e636ea-42c9-4a95-a5d1-f4406fccc8a5	2026-06-12 08:03:18.20419+00	2026-06-12 08:03:18.20419+00	anonymous	7b27f567-71f3-4de6-90d0-7696eac43cad
e5b7d8ce-8202-4cd6-9a3d-61e771bfd392	2026-06-12 08:04:10.295895+00	2026-06-12 08:04:10.295895+00	anonymous	83e3f812-fdc7-4ed9-abb6-31e946fa5d24
c48790bc-fc12-4acc-9535-e7cdc76614b0	2026-06-12 08:04:29.015045+00	2026-06-12 08:04:29.015045+00	anonymous	d3ec275d-00e6-4c1c-ae6b-477c57392b55
2298ce0f-5f95-41b0-b24c-0edc096b8577	2026-06-12 08:04:36.126711+00	2026-06-12 08:04:36.126711+00	anonymous	0d0544db-bd1c-4eaa-9a53-17e8e85d4481
9b73fc4f-42b0-4014-b3dc-a54fbb104c0d	2026-06-12 08:05:00.220189+00	2026-06-12 08:05:00.220189+00	anonymous	6d8c550e-1edf-47f4-a7b6-5bd94d5ec57e
b7650dec-50f6-4487-b754-e494fbbab234	2026-06-12 08:05:03.112328+00	2026-06-12 08:05:03.112328+00	anonymous	028afdf3-2df6-4411-8c1c-9c3ddc0e083b
f2b680fb-3b45-4b39-96a2-edb70f66d737	2026-06-12 08:05:08.096659+00	2026-06-12 08:05:08.096659+00	anonymous	b1cb9aa5-b424-44a0-ae30-f57c9f705572
f552000b-3c5c-4776-bdcc-601c9d3035f7	2026-06-12 08:06:45.606467+00	2026-06-12 08:06:45.606467+00	anonymous	184ecc6f-4e08-48ad-bbf3-a55d2d84f216
8a714cb6-db3d-4740-a698-680d5ea03998	2026-06-12 08:07:34.38801+00	2026-06-12 08:07:34.38801+00	anonymous	795c860e-cfcb-4156-97df-3206beefd60f
56e05af7-15c8-4d1b-95f2-240661865e19	2026-06-12 08:07:56.299135+00	2026-06-12 08:07:56.299135+00	anonymous	d4b88d4a-d4a8-4ea9-9f6d-8d973a911fa6
54f0efcb-3935-4db9-8b9e-7b99d4e7efc1	2026-06-12 08:07:59.506982+00	2026-06-12 08:07:59.506982+00	anonymous	2047ee42-f7dd-4ff5-b212-d8fd2e6bc0ce
649169d0-ce6a-4c3f-8751-55ca375b9cdf	2026-06-12 08:08:01.165911+00	2026-06-12 08:08:01.165911+00	anonymous	5c1e6e8a-2a22-4928-85b9-1c37608b6036
039e72bd-1746-4cc2-a434-4493dfc11fec	2026-06-12 08:08:27.64046+00	2026-06-12 08:08:27.64046+00	anonymous	a7099574-3275-4bc5-93eb-643842b7e39f
45bf9b24-fd27-4ce1-9f39-19ba33b63ce0	2026-06-12 08:08:42.743326+00	2026-06-12 08:08:42.743326+00	anonymous	969de619-5ad1-451c-a1b9-9b692c024dd6
32751717-7b64-4e2e-ab80-17042bda7bf1	2026-06-12 08:09:09.218669+00	2026-06-12 08:09:09.218669+00	anonymous	48529e52-f54e-40ae-8e77-f06bf2c016d8
16d5048f-6fa7-4328-abf0-847466873fb7	2026-06-12 08:09:35.732858+00	2026-06-12 08:09:35.732858+00	anonymous	6167d37c-189a-427e-986b-f8fb067ed297
84dad685-5889-49f7-bbfc-2e47115f94a9	2026-06-12 08:10:41.404413+00	2026-06-12 08:10:41.404413+00	anonymous	10c0834b-c2aa-4b9b-9d5c-a4770fa81ba7
4d962455-2403-4a78-b514-142d1115859a	2026-06-12 08:10:54.806705+00	2026-06-12 08:10:54.806705+00	anonymous	c8c2fe12-57f2-4a99-a685-566064b3fd1a
438bb8bc-fd83-44ca-a1c8-0164d764f86e	2026-06-12 08:14:09.973396+00	2026-06-12 08:14:09.973396+00	anonymous	18f5d16e-a3f3-42f9-9766-dd988523efaf
306a1a14-5688-477d-8d82-75a579e93e71	2026-06-12 08:14:39.309754+00	2026-06-12 08:14:39.309754+00	anonymous	1a7466ab-1581-4eac-b184-c6e0994f3cff
4806245a-4dc4-4cd4-9dd0-0766d98a6adc	2026-06-12 08:16:34.099659+00	2026-06-12 08:16:34.099659+00	anonymous	782ec17d-f3f0-44e7-96be-7e1ba9bec9c1
e995a00f-c116-4d67-bcd2-183e8c3204d4	2026-06-12 08:16:43.725925+00	2026-06-12 08:16:43.725925+00	anonymous	8121b130-4ff2-4562-a212-3e7332100487
62629549-2351-4468-abb8-d198ab57a8a8	2026-06-12 08:17:05.226743+00	2026-06-12 08:17:05.226743+00	anonymous	51af44c2-fe91-453a-b647-4c87c6deb940
a119407b-3c31-4027-b7ba-762dc26dfa88	2026-06-12 08:18:00.632267+00	2026-06-12 08:18:00.632267+00	anonymous	e25b2bfa-20c2-4034-87d2-2933c5c17e29
410a90b4-33cb-4491-9510-cf570f74c844	2026-06-12 08:18:05.012992+00	2026-06-12 08:18:05.012992+00	anonymous	2d77a2d5-5750-4954-a1a2-b1109ff404ce
861621fc-fa81-4df9-836f-0af541da9eb9	2026-06-12 08:18:57.724752+00	2026-06-12 08:18:57.724752+00	anonymous	86112700-7c90-4d49-901a-390cd05cef29
16b33ec6-3097-4446-8915-d12d037eaada	2026-06-12 08:29:54.190802+00	2026-06-12 08:29:54.190802+00	anonymous	d85fe1b5-ffde-4534-9123-18760876bd8f
1da66fb2-a304-41db-a126-39241b33e246	2026-06-12 08:40:31.997066+00	2026-06-12 08:40:31.997066+00	anonymous	564a46e1-937d-45a9-bc6a-aaac55b795e9
3c038494-1849-4464-8706-8c6a4a6df15a	2026-06-12 08:40:38.343249+00	2026-06-12 08:40:38.343249+00	anonymous	80c70934-771a-4b34-a974-ce10967013f6
cdd01dc3-3535-4479-9844-689fded9b103	2026-06-12 08:41:16.29122+00	2026-06-12 08:41:16.29122+00	anonymous	1fcb21d5-de89-4ac7-824f-200219cc4aef
8e4d8bfb-b192-48bd-9a3d-832797f845b7	2026-06-12 08:42:02.615477+00	2026-06-12 08:42:02.615477+00	anonymous	a0a5d645-5fcb-4a48-bb0c-0160084cbace
5081743b-2063-47f3-af82-a8ecaa239696	2026-06-12 08:42:04.851869+00	2026-06-12 08:42:04.851869+00	anonymous	a47dabdd-a7f6-4e4c-9d95-3bb749d6c7b5
3fd4e058-3ccc-4059-ba9a-6f588ee91258	2026-06-12 09:32:18.966604+00	2026-06-12 09:32:18.966604+00	anonymous	13abcb9c-5872-4105-a434-9263e37105d6
568ebd8f-23b2-4804-8364-d6dca73c0c42	2026-06-12 09:32:21.774115+00	2026-06-12 09:32:21.774115+00	anonymous	c6b7de38-8b06-4b86-8a20-4fb156bc6829
42f6aa0c-d459-4259-ab16-b2df4cc7f598	2026-06-12 09:32:56.490431+00	2026-06-12 09:32:56.490431+00	anonymous	76946b79-a18a-492e-9ea9-049ab61bc900
d8ff325b-d2f6-4cef-a148-88b2322985bc	2026-06-12 09:32:57.902371+00	2026-06-12 09:32:57.902371+00	anonymous	bee06771-c266-4c2e-96f3-bfa8296650c3
52ebada6-a0d1-4a14-ab98-f6bae5fdf7d0	2026-06-12 09:32:58.841966+00	2026-06-12 09:32:58.841966+00	anonymous	de9ed8b5-eaaa-48d9-a411-ab870522d8fd
784d3062-fdba-4705-9370-4ad6c8a8047a	2026-06-12 09:32:59.758275+00	2026-06-12 09:32:59.758275+00	anonymous	f338d416-b2ec-4bf8-a80f-a3a4aa183d94
b158e434-90ba-4bf7-b717-e30a58c741d6	2026-06-12 09:33:00.821704+00	2026-06-12 09:33:00.821704+00	anonymous	7a425dc0-fcee-40dc-b035-b44fd361181c
1ee1e0a1-6311-4531-8a18-dbf0c19b1efa	2026-06-12 09:34:02.386023+00	2026-06-12 09:34:02.386023+00	anonymous	6c5b51ea-0a40-418d-80a8-149f18edb596
ede33dd7-4dde-482f-9aa8-45c89bc16200	2026-06-12 09:34:18.908989+00	2026-06-12 09:34:18.908989+00	anonymous	4ea9fe87-17b8-441d-ab1e-edf8151ca10e
28a6acc8-897c-43be-b210-54081f82e8b1	2026-06-12 09:35:31.699083+00	2026-06-12 09:35:31.699083+00	anonymous	43708edf-b9ec-4ae3-b6c7-d3339d0a0fb9
7f72cc7d-1b80-4cfd-b48a-ef401a00e54b	2026-06-12 09:35:33.434669+00	2026-06-12 09:35:33.434669+00	anonymous	78c33ae3-132a-4380-89be-1bae5f4de3da
a5b45f89-304f-4832-9a05-db8e7a12ee85	2026-06-12 09:35:39.73243+00	2026-06-12 09:35:39.73243+00	anonymous	05d5c8d8-8abf-4bd0-bd0e-90463f401a80
2fa0f7f8-333d-4c49-835f-dd3732273d6d	2026-06-12 09:36:17.001251+00	2026-06-12 09:36:17.001251+00	anonymous	d4e85869-973d-4b56-a807-65f764ba2365
556003d0-87f4-444a-a9bb-6032904575b6	2026-06-12 09:36:18.283314+00	2026-06-12 09:36:18.283314+00	anonymous	59aa939c-00c2-4373-98ec-2458aab0f6b1
7922830c-35c2-4abf-bb02-ff3c9d42bc63	2026-06-12 09:36:19.048677+00	2026-06-12 09:36:19.048677+00	anonymous	04acfddb-e2e0-4f69-a288-4d1a8629ceac
cf504de3-43ff-4656-b110-44384d86cb63	2026-06-12 09:36:19.885366+00	2026-06-12 09:36:19.885366+00	anonymous	60287c78-5af1-4b72-95fd-93722ab7bd3e
ff65f629-70b1-4d53-b361-bc193b126bfd	2026-06-12 09:36:25.269859+00	2026-06-12 09:36:25.269859+00	anonymous	fb23e012-b24e-415d-b093-88dc0014a5d9
36d4b758-c906-4188-abcd-453635a4a21f	2026-06-12 09:36:25.951208+00	2026-06-12 09:36:25.951208+00	anonymous	57a04785-fda2-48fc-8a94-ca4a18775327
4836ee16-c983-4168-ae1d-1d2da89ab404	2026-06-12 09:36:27.351776+00	2026-06-12 09:36:27.351776+00	anonymous	b7a20753-e86f-4617-9f86-0434d0bcb48a
ef121dfb-cdb6-4d43-8a9f-761b317f1880	2026-06-12 09:36:57.121554+00	2026-06-12 09:36:57.121554+00	anonymous	01af2850-1984-4283-a186-b1646d35dcbe
df1c84e6-6419-4acd-8565-53c90b77c07b	2026-06-12 09:36:58.286252+00	2026-06-12 09:36:58.286252+00	anonymous	9307a99a-9aa2-48f0-b849-53c704dac5dc
e446e2d3-b5e4-4d89-9f09-f6ccd90b530b	2026-06-12 09:36:59.103444+00	2026-06-12 09:36:59.103444+00	anonymous	4b6ff5ca-b856-4b5f-8f51-6bd41d2ba98f
83f34bdc-4a42-4616-a4b2-97131469cd3e	2026-06-12 09:37:21.075351+00	2026-06-12 09:37:21.075351+00	anonymous	2ca3d3e9-0b96-463a-a206-54d013aa1d6c
e5d8db3e-2dac-43f1-96fc-d194a451312f	2026-06-12 09:37:28.939505+00	2026-06-12 09:37:28.939505+00	anonymous	165d0d83-7b90-4a20-b054-25c713662fc5
0c648ad6-5f64-4da6-9c4e-3ab9ad0a4f20	2026-06-12 09:38:30.364678+00	2026-06-12 09:38:30.364678+00	anonymous	0fda0d9c-aada-4966-b78e-eeb2692e00d0
e664315b-0988-4caf-b965-70d1d699c00a	2026-06-12 09:38:51.455166+00	2026-06-12 09:38:51.455166+00	anonymous	c6406457-327e-41a4-8992-cc7dcc6892d1
34996de3-226e-466f-a086-5fc1d9451e60	2026-06-12 09:38:52.75809+00	2026-06-12 09:38:52.75809+00	anonymous	6a8f493d-5c0b-4ea8-a8ec-53c41497654d
9e11e5c3-72b5-428e-baa4-b4c373c670ef	2026-06-12 09:38:53.519041+00	2026-06-12 09:38:53.519041+00	anonymous	cfedbe18-d393-411b-95a5-3523fc8e69c6
d4b99fd8-388f-4ade-a6aa-583888dd1663	2026-06-12 09:38:54.191381+00	2026-06-12 09:38:54.191381+00	anonymous	3f87c4eb-86d1-467c-a9c2-c8824028fcd4
cf91c061-4972-46e2-86d4-f733d80977c0	2026-06-12 09:39:09.947511+00	2026-06-12 09:39:09.947511+00	anonymous	b9065b04-ca5f-4751-b528-0734e1f2e3ed
af325113-f292-437a-bc5a-9bc5fb497402	2026-06-12 09:39:11.272412+00	2026-06-12 09:39:11.272412+00	anonymous	5b26f04e-5d12-423f-b4f4-7f2b0c0e0544
c08db4b2-045a-40ed-ba57-3592441bed5b	2026-06-12 09:39:12.126005+00	2026-06-12 09:39:12.126005+00	anonymous	d5fb4ed2-c4b8-4b78-a6ae-0a50f59e798f
bf3e4b54-b1fb-4be4-9180-d88f8d3611e1	2026-06-12 09:39:12.756148+00	2026-06-12 09:39:12.756148+00	anonymous	f3cb9f07-8451-4a95-b9a4-cc6080c79b4a
7ef8d3e6-b6f4-4681-9eb8-0ecd42ab1742	2026-06-12 09:41:11.849271+00	2026-06-12 09:41:11.849271+00	anonymous	6ea13a5d-42c6-409a-85a1-4779bf35693b
3ad53fad-d076-48a2-a240-ae7ddef3c874	2026-06-12 09:42:16.700323+00	2026-06-12 09:42:16.700323+00	anonymous	f1a91075-2eae-477f-abc7-f7331c08117a
de24ea7e-1e22-44e0-87f8-a1ff41104786	2026-06-12 09:42:25.341732+00	2026-06-12 09:42:25.341732+00	anonymous	ace46144-7e9e-4293-82f6-6994c1d4d2d2
980f747c-253a-4461-8348-c291a01a9a7a	2026-06-12 09:43:37.543207+00	2026-06-12 09:43:37.543207+00	anonymous	3b5c76a6-d5a1-4a28-a799-fce7ea70c9b8
5491d9d5-3983-4712-9647-d337df570d6c	2026-06-12 09:43:38.948348+00	2026-06-12 09:43:38.948348+00	anonymous	ddb4109e-f3dd-47c3-8248-65b1432150df
8a1384d3-9318-4fc9-aa5e-9762b2de6850	2026-06-12 09:43:39.738989+00	2026-06-12 09:43:39.738989+00	anonymous	c3cc98a3-2039-4209-aa98-e669d196291e
30fcff79-8bfa-4c95-87a8-08f7c66cc691	2026-06-12 09:48:42.913385+00	2026-06-12 09:48:42.913385+00	anonymous	8bfb4d03-4efc-4ed1-a8f0-4e109807d231
0adf82d7-0cb7-4c59-b9f1-aeae33a411cb	2026-06-12 09:49:32.391818+00	2026-06-12 09:49:32.391818+00	anonymous	670b62a6-4556-4983-8ddc-ca55c3f9b632
4c973497-1521-4c12-beb7-f97589b0e97a	2026-06-12 09:50:02.669608+00	2026-06-12 09:50:02.669608+00	anonymous	16082236-4561-465a-89c7-aae685a68943
8212da37-eda8-4d7a-9eca-d867672210fc	2026-06-12 09:50:07.617231+00	2026-06-12 09:50:07.617231+00	anonymous	c5487966-b930-49c9-a25f-9882ae8c2c3c
44e06417-adaa-4b63-9f9e-900b58f5e59b	2026-06-12 09:50:09.589687+00	2026-06-12 09:50:09.589687+00	anonymous	bec9d141-a206-46ba-acd9-448cd17f3840
0bd295f9-4250-47ad-88f6-3ee109f13a23	2026-06-12 09:50:25.945261+00	2026-06-12 09:50:25.945261+00	anonymous	bf721ddb-179e-49cc-a4bf-38264778f2b2
e0c50005-0d75-4217-ba04-d522f9853b1e	2026-06-12 09:51:23.077963+00	2026-06-12 09:51:23.077963+00	anonymous	956b8dac-a0f7-4352-897d-7c87af11b070
e66febfd-af64-4db0-bf1d-f87c50053725	2026-06-12 09:58:22.475769+00	2026-06-12 09:58:22.475769+00	anonymous	ec00fe68-348f-49dc-9641-fc87d4e06ef8
7a65e573-5c2b-45e9-8ca0-e2c938610eee	2026-06-12 10:01:02.868044+00	2026-06-12 10:01:02.868044+00	anonymous	c456e231-427b-4a22-ab26-387ab20d5f8b
778235b4-815b-4de9-87c8-1d4d1b50c391	2026-06-12 10:01:04.211275+00	2026-06-12 10:01:04.211275+00	anonymous	51c82cae-608f-4f9d-a91b-18470163b7db
72ef9197-d380-4f3e-9abc-c9ac1c48c1c3	2026-06-12 10:04:11.056602+00	2026-06-12 10:04:11.056602+00	anonymous	a6e8f07f-c953-483f-b226-4cb4d89a6415
e4981f53-b0b3-4195-86cb-37b1dabf5081	2026-06-13 00:12:52.352525+00	2026-06-13 00:12:52.352525+00	anonymous	9e9c7ad6-4d10-464f-b3ee-678842b01259
d4b0494e-1dd5-4ce9-b74f-d2e002f0a741	2026-06-13 00:12:58.199951+00	2026-06-13 00:12:58.199951+00	anonymous	d0f08fc6-bfea-44c8-aac6-c66cc8c81fe8
097b6e37-17bd-4500-a89d-f2912c23d835	2026-06-13 04:08:30.325314+00	2026-06-13 04:08:30.325314+00	anonymous	8103b2f0-4ac3-4a4a-9bde-d234dd3ba39c
336ecd4f-f756-44f4-9dce-16b9d2787c8c	2026-06-13 05:37:16.932014+00	2026-06-13 05:37:16.932014+00	oauth	55f0497d-42ce-417b-815a-13ebeb74aef2
8c4965f0-82f3-477d-8a3c-05390a3dacc2	2026-06-13 09:57:27.129199+00	2026-06-13 09:57:27.129199+00	oauth	51df901d-c8d0-44eb-a661-5470d2f1a2e3
59b2f53c-a976-411e-88ea-9bbc4b3b7bb9	2026-06-13 10:30:27.861195+00	2026-06-13 10:30:27.861195+00	anonymous	1a8019dd-b009-46aa-9a9f-a79f9efc6057
3c472d9a-da0f-4918-bf82-6818d3f92b82	2026-06-13 10:30:31.345831+00	2026-06-13 10:30:31.345831+00	anonymous	c773f0d9-4bc2-4b76-86cd-3a7737cbf0ca
ca62bb60-1ef3-4bbd-a216-9e56246f5e33	2026-06-13 10:30:37.6527+00	2026-06-13 10:30:37.6527+00	anonymous	adcac113-f05a-400a-a201-e1e185cfa806
818e77d1-0b7e-4c99-8764-57cdb82cb8fb	2026-06-13 10:30:46.140978+00	2026-06-13 10:30:46.140978+00	anonymous	709dd99e-f6ae-413e-a71c-9340a536b393
826a4e26-343a-4382-9d33-9822e8cd460a	2026-06-13 10:30:50.109225+00	2026-06-13 10:30:50.109225+00	anonymous	7e2f9f67-6c0e-4314-ab79-ea2b189c9838
69b69066-70bc-4318-8651-d66106c0fdca	2026-06-13 11:06:14.545717+00	2026-06-13 11:06:14.545717+00	oauth	5005d392-c47d-4285-a320-96c11b60361b
905ff0f9-72e8-4748-9480-7288740a7808	2026-06-13 11:30:43.596659+00	2026-06-13 11:30:43.596659+00	oauth	78f335bb-4882-4cf6-a46e-7486f6afc4e7
06b144ea-e24e-4fcf-95d1-6c798b5f74c5	2026-06-13 11:57:26.780992+00	2026-06-13 11:57:26.780992+00	oauth	40944c2a-47ed-42ef-ba5a-ecbc6ecd4e08
79138b30-67af-435c-a673-639a65cb424d	2026-06-13 15:28:27.637865+00	2026-06-13 15:28:27.637865+00	anonymous	c860a3c6-c7fa-49a3-91de-a3dc68d0f7e9
5df25f4d-947c-4f08-b5a7-2ded69571d7f	2026-06-13 15:33:47.733245+00	2026-06-13 15:33:47.733245+00	oauth	ae18a55f-8a76-4796-ad80-5bb0dacf93c4
b90d3c5c-9e85-4117-98c0-67266a0def6e	2026-06-13 15:56:20.373881+00	2026-06-13 15:56:20.373881+00	anonymous	bcb656cd-d270-42f0-a976-685035a2bbc2
63d2d37a-c4cf-48ab-b75e-e49275ed0fd7	2026-06-14 04:00:04.634148+00	2026-06-14 04:00:04.634148+00	anonymous	b8fb13d4-60ae-478d-9271-01a8d860198b
c074b5d6-06c7-463f-8d63-52edf3b82ef9	2026-06-14 09:09:30.327966+00	2026-06-14 09:09:30.327966+00	oauth	08493979-e598-44ff-bd14-7da44b8bbff0
2efcf5f7-f095-4803-aaea-95834a0263df	2026-06-14 10:30:09.142656+00	2026-06-14 10:30:09.142656+00	password	3156e251-a05f-44cb-9da9-6c93764ceda3
5dbf510d-f285-41fa-adf0-c8354109792a	2026-06-14 10:30:29.501462+00	2026-06-14 10:30:29.501462+00	anonymous	68c6d2af-e366-45a5-89b9-23de3038df95
5ea1d268-c0e9-43e0-933b-404c2fbe9f67	2026-06-15 02:30:44.402722+00	2026-06-15 02:30:44.402722+00	password	e2204c54-c4a9-4303-9b96-6d0e6285053e
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret", "phone", "last_challenged_at", "web_authn_credential", "web_authn_aaguid", "last_webauthn_challenge_data") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address", "otp_code", "web_authn_session_data") FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_authorizations" ("id", "authorization_id", "client_id", "user_id", "redirect_uri", "scope", "state", "resource", "code_challenge", "code_challenge_method", "response_type", "status", "authorization_code", "created_at", "expires_at", "approved_at", "nonce") FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_client_states" ("id", "provider_type", "code_verifier", "created_at") FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_consents" ("id", "user_id", "client_id", "scopes", "granted_at", "revoked_at") FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
00000000-0000-0000-0000-000000000000	109	z5o3cirivjdg	bf607771-0378-4fa3-9ec3-9cad1d0da0fb	f	2026-06-11 08:41:23.34559+00	2026-06-11 08:41:23.34559+00	\N	e65db0c1-fe32-43a9-9458-f6cdf702824b
00000000-0000-0000-0000-000000000000	16	3dianlyahx7n	06d23a82-219a-4d0b-8a9d-249bf291e615	t	2026-06-10 06:36:33.653233+00	2026-06-11 08:54:11.726828+00	\N	31446a88-88b4-4dba-a426-74cc266d4299
00000000-0000-0000-0000-000000000000	15	haewv4ttwd6d	94e11b1c-7330-4214-a522-4abd72dafa27	t	2026-06-10 06:12:41.946705+00	2026-06-12 06:08:31.282422+00	\N	e3c36b7d-bd08-4b9a-bd07-4fd11a903dd0
00000000-0000-0000-0000-000000000000	127	othqlyepvrv2	3600d5ae-0e04-4a6c-9436-55699f2de0a8	t	2026-06-12 05:21:56.77018+00	2026-06-12 06:20:40.019411+00	\N	bf27e73b-4d9f-4840-bce1-ed87af80e993
00000000-0000-0000-0000-000000000000	374	gazvhqan6vvo	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-14 10:24:24.766455+00	2026-06-15 01:54:47.566197+00	ufjxf6q3arjn	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	2	dd2lt4dx6qq4	3365234f-6ef5-4b87-a306-ce324a246577	t	2026-06-10 04:15:13.351379+00	2026-06-10 05:14:14.891937+00	\N	2873c830-23f8-4bfb-a887-faa36d757db2
00000000-0000-0000-0000-000000000000	134	qseiyh4nits5	40514075-d5ed-4273-be49-e94d34e04613	f	2026-06-12 06:38:03.956003+00	2026-06-12 06:38:03.956003+00	\N	a715777f-5cbd-4320-87f3-133f84becf3f
00000000-0000-0000-0000-000000000000	381	4d3i3ew67ink	30e0a794-89eb-44df-bc4f-51b04ceba280	f	2026-06-15 01:54:47.581913+00	2026-06-15 01:54:47.581913+00	gazvhqan6vvo	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	168	b3g56sqxljbt	d5e9762e-d7e1-4679-9cad-7653e84f05ce	f	2026-06-12 07:52:54.455133+00	2026-06-12 07:52:54.455133+00	\N	98f44290-8349-48c3-9a16-948052987476
00000000-0000-0000-0000-000000000000	174	ece3u7eaokbg	aa2cb7f3-d889-4101-8d5c-8dd43646188e	f	2026-06-12 07:56:55.102188+00	2026-06-12 07:56:55.102188+00	\N	f806a294-1590-41f8-8c8d-31b05da5619f
00000000-0000-0000-0000-000000000000	185	4eiw3lw64s6a	f94554df-c3d8-4712-be57-9510b513c3af	f	2026-06-12 08:06:10.69673+00	2026-06-12 08:06:10.69673+00	mmoakkdzpfc4	1a1ae151-63f0-4c71-ade5-6afe116f5582
00000000-0000-0000-0000-000000000000	186	eszgd46r7xwy	3481e30b-aa9a-4e31-a3b5-113bf2fdeb47	f	2026-06-12 08:06:45.605224+00	2026-06-12 08:06:45.605224+00	\N	f552000b-3c5c-4776-bdcc-601c9d3035f7
00000000-0000-0000-0000-000000000000	187	ymbymcc74heq	6956ab7a-febf-44e0-bf37-a4a13d662c65	f	2026-06-12 08:07:34.386721+00	2026-06-12 08:07:34.386721+00	\N	8a714cb6-db3d-4740-a698-680d5ea03998
00000000-0000-0000-0000-000000000000	6	ostlfp5bicyp	ec06f433-d526-4837-be90-6c5507c5b435	t	2026-06-10 04:42:43.787521+00	2026-06-10 06:05:01.948182+00	\N	22752014-cdd7-448a-b17f-6176494eadb9
00000000-0000-0000-0000-000000000000	188	bcbrtvk3rwh3	c9d36fa3-e4d7-4c00-a055-0697e326a5f5	f	2026-06-12 08:07:56.297744+00	2026-06-12 08:07:56.297744+00	\N	56e05af7-15c8-4d1b-95f2-240661865e19
00000000-0000-0000-0000-000000000000	189	glwkhidbyzq5	c58b9fb4-a921-403f-9296-84f2198d265c	f	2026-06-12 08:07:59.505584+00	2026-06-12 08:07:59.505584+00	\N	54f0efcb-3935-4db9-8b9e-7b99d4e7efc1
00000000-0000-0000-0000-000000000000	190	pd34ecmkdppb	201d6368-5c4c-42bb-b1cf-af2d51ee27a9	f	2026-06-12 08:08:01.164577+00	2026-06-12 08:08:01.164577+00	\N	649169d0-ce6a-4c3f-8751-55ca375b9cdf
00000000-0000-0000-0000-000000000000	192	v4wxluuttu5c	397d819c-df84-435d-97cf-fe2499a178b2	f	2026-06-12 08:08:42.738039+00	2026-06-12 08:08:42.738039+00	\N	45bf9b24-fd27-4ce1-9f39-19ba33b63ce0
00000000-0000-0000-0000-000000000000	194	mddxeqowx7no	cf4be2ba-95ac-4316-a219-26bf7bdb48b3	f	2026-06-12 08:09:35.731785+00	2026-06-12 08:09:35.731785+00	\N	16d5048f-6fa7-4328-abf0-847466873fb7
00000000-0000-0000-0000-000000000000	199	irm42s6a6wtx	8801626e-54eb-435c-879d-10906f693d49	f	2026-06-12 08:16:34.097499+00	2026-06-12 08:16:34.097499+00	\N	4806245a-4dc4-4cd4-9dd0-0766d98a6adc
00000000-0000-0000-0000-000000000000	200	lmo7j2b3qny6	f7e7062d-0992-442b-bca0-adfc3b300c82	f	2026-06-12 08:16:43.724544+00	2026-06-12 08:16:43.724544+00	\N	e995a00f-c116-4d67-bcd2-183e8c3204d4
00000000-0000-0000-0000-000000000000	7	5zjucord5qav	3365234f-6ef5-4b87-a306-ce324a246577	t	2026-06-10 05:14:14.913745+00	2026-06-10 07:44:57.551955+00	dd2lt4dx6qq4	2873c830-23f8-4bfb-a887-faa36d757db2
00000000-0000-0000-0000-000000000000	201	h3lsmmf6323o	d54bd569-2fbd-4e3b-9457-130a8b3a1fc9	f	2026-06-12 08:17:05.225425+00	2026-06-12 08:17:05.225425+00	\N	62629549-2351-4468-abb8-d198ab57a8a8
00000000-0000-0000-0000-000000000000	14	dzlxksold3og	ec06f433-d526-4837-be90-6c5507c5b435	t	2026-06-10 06:05:01.955279+00	2026-06-10 08:40:13.798611+00	ostlfp5bicyp	22752014-cdd7-448a-b17f-6176494eadb9
00000000-0000-0000-0000-000000000000	202	cp6fde5tqa2m	f56acc37-4f1c-4b27-9a51-ef6cdb97be47	f	2026-06-12 08:18:00.631046+00	2026-06-12 08:18:00.631046+00	\N	a119407b-3c31-4027-b7ba-762dc26dfa88
00000000-0000-0000-0000-000000000000	203	ewxk2n7u6v4j	dd946dde-b8e1-42bb-b883-73336b256f47	f	2026-06-12 08:18:05.003973+00	2026-06-12 08:18:05.003973+00	\N	410a90b4-33cb-4491-9510-cf570f74c844
00000000-0000-0000-0000-000000000000	204	55nepmw3eecw	7d4593f0-0400-4710-abaf-825eb92ff153	f	2026-06-12 08:18:57.72347+00	2026-06-12 08:18:57.72347+00	\N	861621fc-fa81-4df9-836f-0af541da9eb9
00000000-0000-0000-0000-000000000000	22	aeyl6jlagwkn	3365234f-6ef5-4b87-a306-ce324a246577	t	2026-06-10 07:44:57.55803+00	2026-06-10 10:17:06.755772+00	5zjucord5qav	2873c830-23f8-4bfb-a887-faa36d757db2
00000000-0000-0000-0000-000000000000	208	w7sntnw5q3fq	31072724-c420-4697-946e-87fbcf045692	f	2026-06-12 08:40:31.995682+00	2026-06-12 08:40:31.995682+00	\N	1da66fb2-a304-41db-a126-39241b33e246
00000000-0000-0000-0000-000000000000	211	4zwbhoy3ah6t	a75e8f74-ae56-446e-97b2-ec3e889bd986	f	2026-06-12 08:42:02.614136+00	2026-06-12 08:42:02.614136+00	\N	8e4d8bfb-b192-48bd-9a3d-832797f845b7
00000000-0000-0000-0000-000000000000	5	fnj2l65f6rso	7bc60ae4-1e67-41a9-9b95-f27b33ecbf62	t	2026-06-10 04:42:30.676959+00	2026-06-10 13:08:47.721356+00	\N	43c4e37b-de48-4215-a2c8-e082d3370c24
00000000-0000-0000-0000-000000000000	23	26g3zlztygsw	ec06f433-d526-4837-be90-6c5507c5b435	t	2026-06-10 08:40:13.81039+00	2026-06-10 13:08:51.401748+00	dzlxksold3og	22752014-cdd7-448a-b17f-6176494eadb9
00000000-0000-0000-0000-000000000000	212	pdvti3jkprj3	ce25f033-b6b0-4155-998e-94acb4da6483	f	2026-06-12 08:42:04.845036+00	2026-06-12 08:42:04.845036+00	\N	5081743b-2063-47f3-af82-a8ecaa239696
00000000-0000-0000-0000-000000000000	26	nwzxmfgml6ap	3365234f-6ef5-4b87-a306-ce324a246577	t	2026-06-10 10:17:06.760218+00	2026-06-10 13:09:32.673774+00	aeyl6jlagwkn	2873c830-23f8-4bfb-a887-faa36d757db2
00000000-0000-0000-0000-000000000000	32	pczwjdyrtdu2	3365234f-6ef5-4b87-a306-ce324a246577	f	2026-06-10 13:09:32.674855+00	2026-06-10 13:09:32.674855+00	nwzxmfgml6ap	2873c830-23f8-4bfb-a887-faa36d757db2
00000000-0000-0000-0000-000000000000	33	n6t5ncnpmfw3	1da7e9b5-2cba-4b87-af95-16339a23a7fa	f	2026-06-10 13:28:32.759097+00	2026-06-10 13:28:32.759097+00	\N	27f180b4-4d8c-474e-9a28-f6c668e376fd
00000000-0000-0000-0000-000000000000	216	jfkyaegef4gn	a90012e0-8556-46d0-b27f-84c58c80dc6d	f	2026-06-12 09:32:56.488964+00	2026-06-12 09:32:56.488964+00	\N	42f6aa0c-d459-4259-ab16-b2df4cc7f598
00000000-0000-0000-0000-000000000000	35	6qjzogip42bd	55ebcbaf-8356-49a9-81f8-caca676b6a44	f	2026-06-10 13:29:34.018597+00	2026-06-10 13:29:34.018597+00	\N	7b32ed3c-f74b-40cc-bace-ee45047950eb
00000000-0000-0000-0000-000000000000	36	nw2uy64ffymn	cd3c27f6-ffe9-4d26-8d63-1c2cab574fe5	f	2026-06-10 13:33:20.452761+00	2026-06-10 13:33:20.452761+00	\N	921dee6b-9b40-4722-812a-ae33112f9a81
00000000-0000-0000-0000-000000000000	37	cxm33obqsrpl	7a0e3d35-d34f-4656-8d93-1db86e55f68c	f	2026-06-10 13:33:25.555214+00	2026-06-10 13:33:25.555214+00	\N	373631f6-b8f0-491b-81f2-c9092648cc51
00000000-0000-0000-0000-000000000000	38	shckv7fh7xeq	03ddd27d-f5c3-4234-9519-52a77acecd0f	f	2026-06-10 13:35:10.475221+00	2026-06-10 13:35:10.475221+00	\N	a9b66bf4-c441-4297-b8c7-c6f22f1bdca0
00000000-0000-0000-0000-000000000000	191	njwneg7nzzaf	8990047a-f5bc-4220-970a-711d9c9fcdba	t	2026-06-12 08:08:27.639336+00	2026-06-12 09:34:55.118056+00	\N	039e72bd-1746-4cc2-a434-4493dfc11fec
00000000-0000-0000-0000-000000000000	31	warhje5k6jfu	ec06f433-d526-4837-be90-6c5507c5b435	t	2026-06-10 13:08:51.402106+00	2026-06-10 14:07:09.32873+00	26g3zlztygsw	22752014-cdd7-448a-b17f-6176494eadb9
00000000-0000-0000-0000-000000000000	210	bkx3mgovvkez	148a6ed3-cd1f-4051-aed3-21b324d1d82a	t	2026-06-12 08:41:16.289904+00	2026-06-12 09:43:35.908385+00	\N	cdd01dc3-3535-4479-9844-689fded9b103
00000000-0000-0000-0000-000000000000	209	jeidjnpkslmy	124d00b9-b6a0-4813-9820-6e42268d7864	t	2026-06-12 08:40:38.341878+00	2026-06-12 09:47:45.945444+00	\N	3c038494-1849-4464-8706-8c6a4a6df15a
00000000-0000-0000-0000-000000000000	193	jt6quqqopjoj	18e452a5-3fed-4b7f-bece-28d0edc7783e	t	2026-06-12 08:09:09.217518+00	2026-06-12 13:05:58.910128+00	\N	32751717-7b64-4e2e-ab80-17042bda7bf1
00000000-0000-0000-0000-000000000000	139	hkprxbrcqzdh	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-12 07:30:19.606399+00	2026-06-13 00:09:51.265315+00	rfvyx4owultq	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	131	eztadiu256n6	3600d5ae-0e04-4a6c-9436-55699f2de0a8	t	2026-06-12 06:20:40.027493+00	2026-06-13 18:16:47.220802+00	othqlyepvrv2	bf27e73b-4d9f-4840-bce1-ed87af80e993
00000000-0000-0000-0000-000000000000	30	ry7b4skcxraz	7bc60ae4-1e67-41a9-9b95-f27b33ecbf62	t	2026-06-10 13:08:47.73181+00	2026-06-14 04:00:02.457178+00	fnj2l65f6rso	43c4e37b-de48-4215-a2c8-e082d3370c24
00000000-0000-0000-0000-000000000000	10	g5kzkvsym5sf	54e610db-68cd-4162-9714-db38ad23df40	t	2026-06-10 05:53:58.197289+00	2026-06-14 08:52:31.958821+00	\N	d6f46639-9773-4fea-8bc1-ee46621ff805
00000000-0000-0000-0000-000000000000	39	3o6gidkhtng6	6f7e32b3-1d33-4e7f-ada7-e9d02385143d	f	2026-06-10 13:35:17.568888+00	2026-06-10 13:35:17.568888+00	\N	7088b322-64b9-4f15-a8e8-a53a269a2d18
00000000-0000-0000-0000-000000000000	40	oz5xnilvzxt6	2075df08-defd-479a-8755-55f8d702a5c5	f	2026-06-10 13:35:44.690039+00	2026-06-10 13:35:44.690039+00	\N	28d3548d-2f10-48e4-9d2e-9f5c02a5b0f3
00000000-0000-0000-0000-000000000000	41	ixmemovbejs7	a72e271e-0ded-4bc9-bac0-54c56e9667e5	f	2026-06-10 13:35:46.23177+00	2026-06-10 13:35:46.23177+00	\N	97f32f2e-d9f5-49ed-ad8c-3d98aa3dda77
00000000-0000-0000-0000-000000000000	376	exowkdtw72ep	c6b1885d-c451-462d-afd1-d8a14082fc11	f	2026-06-14 10:30:29.499189+00	2026-06-14 10:30:29.499189+00	\N	5dbf510d-f285-41fa-adf0-c8354109792a
00000000-0000-0000-0000-000000000000	44	rrwbimvoi425	a1d7785a-e363-401b-b505-1cad4745a196	f	2026-06-10 13:35:55.059068+00	2026-06-10 13:35:55.059068+00	\N	9ade8318-ae2c-4d9f-82f1-918c4b386f6b
00000000-0000-0000-0000-000000000000	45	ay2howrnxe3g	eafaebd2-e3b0-42c0-a616-139dc6dc1081	f	2026-06-10 13:44:38.613762+00	2026-06-10 13:44:38.613762+00	\N	d898387d-5334-4710-95b9-7e50d8d755b6
00000000-0000-0000-0000-000000000000	375	klqqq4zbx5hj	d279074b-7967-4be0-9ac0-7f933dca23b6	t	2026-06-14 10:30:09.136226+00	2026-06-14 12:26:29.402901+00	\N	2efcf5f7-f095-4803-aaea-95834a0263df
00000000-0000-0000-0000-000000000000	382	cvvviksgbo7v	2d4aca79-aefc-4553-a8d8-f79fa8cde1bb	f	2026-06-15 01:55:48.790513+00	2026-06-15 01:55:48.790513+00	ekjckecxrsfx	f5ff760a-c1af-4612-8e6a-e821df8afb68
00000000-0000-0000-0000-000000000000	132	rfvyx4owultq	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-12 06:25:01.017873+00	2026-06-12 07:30:19.60223+00	\N	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	140	wwjq6i7f5js2	36d717a2-6458-42c3-ab63-2421230477ba	f	2026-06-12 07:34:46.342668+00	2026-06-12 07:34:46.342668+00	\N	7e20cdfd-60a2-4a69-95e1-d6bd509b5122
00000000-0000-0000-0000-000000000000	141	e3evxd3nw2ek	b37a2603-11ba-4c3c-8225-adf08f82e461	f	2026-06-12 07:35:09.805897+00	2026-06-12 07:35:09.805897+00	\N	180426a6-517f-4803-b156-95eefbd0f646
00000000-0000-0000-0000-000000000000	142	g63n3b7jfd66	8d4af825-f434-48e7-aaa1-8d753fb3c782	f	2026-06-12 07:35:11.652527+00	2026-06-12 07:35:11.652527+00	\N	a8401cad-c79d-436e-a604-1a2320e102c7
00000000-0000-0000-0000-000000000000	143	ohmh23jcf5jy	20123896-bd7c-4afc-9b61-08de7592d4e1	f	2026-06-12 07:35:34.147002+00	2026-06-12 07:35:34.147002+00	\N	daef983a-ff6d-45e4-93ba-3683a12adc52
00000000-0000-0000-0000-000000000000	144	v7thjy7l6pua	c13f83d6-3c10-4cff-b07f-a6817fce40f5	f	2026-06-12 07:35:57.359336+00	2026-06-12 07:35:57.359336+00	\N	27a349c0-9ead-422c-bb2e-c3568aaa9fac
00000000-0000-0000-0000-000000000000	145	yuyy2cg2c2po	0274cd59-9615-451e-848c-fd15bfe6bacc	f	2026-06-12 07:36:05.990931+00	2026-06-12 07:36:05.990931+00	\N	bbe1e50d-5576-4088-ba5d-edeb9bde8717
00000000-0000-0000-0000-000000000000	146	hwutghox6cz3	f7f722f8-d85a-4f47-a94a-01afd1911b92	f	2026-06-12 07:36:10.605473+00	2026-06-12 07:36:10.605473+00	\N	8aad5d4d-dd61-4789-8cc9-2a342c061db4
00000000-0000-0000-0000-000000000000	169	n7zqshexg3hd	1cad7ac6-0461-4aa3-b6de-9064effa74af	f	2026-06-12 07:54:00.576648+00	2026-06-12 07:54:00.576648+00	\N	64eaa247-37cc-4963-92e0-9111c8c97209
00000000-0000-0000-0000-000000000000	61	hmy5g5phzf6b	e7c7a2bb-c3ff-4bb4-8f78-9eaad620cad7	f	2026-06-11 01:45:57.924679+00	2026-06-11 01:45:57.924679+00	\N	e3a9fe58-536c-4f67-8471-3224a6a0f665
00000000-0000-0000-0000-000000000000	170	3xiuofxtyvhd	abdf20d4-1e35-4703-a6ff-67d4d4d171aa	f	2026-06-12 07:54:03.116968+00	2026-06-12 07:54:03.116968+00	\N	5b8aecb8-8880-4cf6-aae0-4ca9194dbb6e
00000000-0000-0000-0000-000000000000	171	2hhvxdcdajfb	18efe2fe-42f1-447d-9209-1a802535ad60	f	2026-06-12 07:54:35.905691+00	2026-06-12 07:54:35.905691+00	\N	c168ffcd-e176-4bc5-b442-57f954b8c7a4
00000000-0000-0000-0000-000000000000	172	hgrdio26nrtb	11285f0c-784e-4ba1-bf70-7a9d286cb320	f	2026-06-12 07:54:38.309074+00	2026-06-12 07:54:38.309074+00	\N	9aef4a4b-b513-4479-971b-9a1e38dacfcb
00000000-0000-0000-0000-000000000000	175	5yuqyueexyfz	7e586f94-c37b-4f49-a3f8-024ba3045cbe	f	2026-06-12 08:00:40.907929+00	2026-06-12 08:00:40.907929+00	\N	f7344eef-f416-4875-81e6-db9094175c5d
00000000-0000-0000-0000-000000000000	176	g2sxguhe4m5u	fa67e9fe-8c2c-449a-8dc8-ddf2546ff3fd	f	2026-06-12 08:01:06.662877+00	2026-06-12 08:01:06.662877+00	\N	f10bee2b-ecae-46c1-85e6-48f96b638f01
00000000-0000-0000-0000-000000000000	195	dizbkf3fx7hc	664ce247-3698-417c-ab9d-0628f1fdfe3e	f	2026-06-12 08:10:41.401953+00	2026-06-12 08:10:41.401953+00	\N	84dad685-5889-49f7-bbfc-2e47115f94a9
00000000-0000-0000-0000-000000000000	196	5hpi2toeyl7b	a62aa2bc-d2e6-40e9-9ec5-a6dd48bfe914	f	2026-06-12 08:10:54.805366+00	2026-06-12 08:10:54.805366+00	\N	4d962455-2403-4a78-b514-142d1115859a
00000000-0000-0000-0000-000000000000	135	5chdwwexrqfq	a188a19d-c9fe-4add-aa2d-4fa0050fd5b4	t	2026-06-12 06:44:24.523038+00	2026-06-12 09:18:36.053369+00	\N	a9962ce5-824b-4265-9b32-0bbc0ecd84c6
00000000-0000-0000-0000-000000000000	213	jzcipwlqsws4	a188a19d-c9fe-4add-aa2d-4fa0050fd5b4	f	2026-06-12 09:18:36.06522+00	2026-06-12 09:18:36.06522+00	5chdwwexrqfq	a9962ce5-824b-4265-9b32-0bbc0ecd84c6
00000000-0000-0000-0000-000000000000	217	ejpv4v2nkbqg	b2ea14f6-4707-4dde-b9f6-e426aa22bc9d	f	2026-06-12 09:32:57.901044+00	2026-06-12 09:32:57.901044+00	\N	d8ff325b-d2f6-4cef-a148-88b2322985bc
00000000-0000-0000-0000-000000000000	218	q6hudxl2k2kw	5e77db29-f3ec-4d3f-829b-1dd742abebf5	f	2026-06-12 09:32:58.837772+00	2026-06-12 09:32:58.837772+00	\N	52ebada6-a0d1-4a14-ab98-f6bae5fdf7d0
00000000-0000-0000-0000-000000000000	52	rkdy3hakjsui	ec06f433-d526-4837-be90-6c5507c5b435	t	2026-06-10 14:07:09.329132+00	2026-06-11 03:15:21.573603+00	warhje5k6jfu	22752014-cdd7-448a-b17f-6176494eadb9
00000000-0000-0000-0000-000000000000	69	kelcghmzip46	ec06f433-d526-4837-be90-6c5507c5b435	f	2026-06-11 03:15:21.584214+00	2026-06-11 03:15:21.584214+00	rkdy3hakjsui	22752014-cdd7-448a-b17f-6176494eadb9
00000000-0000-0000-0000-000000000000	70	427neyzgk6nn	60e19456-c8e1-4dd6-b900-91573244c2a5	f	2026-06-11 03:15:23.837688+00	2026-06-11 03:15:23.837688+00	\N	0148d578-ee1c-4a16-884d-d1dc3a668075
00000000-0000-0000-0000-000000000000	71	tmpycsidf4zu	b970951d-80f4-4308-acd9-63138826d814	f	2026-06-11 03:15:26.725536+00	2026-06-11 03:15:26.725536+00	\N	ffc4c90f-2658-4941-923b-17977eea3c8b
00000000-0000-0000-0000-000000000000	219	gymlegdethoj	97ac06df-8f3d-4eb3-a695-1a94f3a26289	f	2026-06-12 09:32:59.75696+00	2026-06-12 09:32:59.75696+00	\N	784d3062-fdba-4705-9370-4ad6c8a8047a
00000000-0000-0000-0000-000000000000	220	vtaoukt5yfrd	34f810eb-05c4-449a-a806-9ac45ec67f01	f	2026-06-12 09:33:00.820476+00	2026-06-12 09:33:00.820476+00	\N	b158e434-90ba-4bf7-b717-e30a58c741d6
00000000-0000-0000-0000-000000000000	74	7sj7uqcmltyn	51d193d4-d889-4ee4-af7a-02e643d00703	f	2026-06-11 04:21:42.842335+00	2026-06-11 04:21:42.842335+00	\N	4b7c320f-fa17-461e-8c5b-3e66418d2332
00000000-0000-0000-0000-000000000000	221	aibaxbya3vyg	ce4f5c2d-c5d1-42ab-999f-70d2e88b52e4	f	2026-06-12 09:34:02.383402+00	2026-06-12 09:34:02.383402+00	\N	1ee1e0a1-6311-4531-8a18-dbf0c19b1efa
00000000-0000-0000-0000-000000000000	222	y4a3aofpwgqf	f23764ab-0b53-4eea-921a-62e07a56d7b9	f	2026-06-12 09:34:18.907322+00	2026-06-12 09:34:18.907322+00	\N	ede33dd7-4dde-482f-9aa8-45c89bc16200
00000000-0000-0000-0000-000000000000	76	gk3a6l4huzsp	34784636-6c24-4a69-be3d-c027ca7b64a4	f	2026-06-11 04:33:01.08446+00	2026-06-11 04:33:01.08446+00	\N	d476fbd2-a0a1-49c3-8f3d-6c13941ea9e2
00000000-0000-0000-0000-000000000000	77	apttf7wfivhz	998c0d62-b7d5-450a-b73e-40f9f8e61128	f	2026-06-11 04:33:03.992641+00	2026-06-11 04:33:03.992641+00	\N	86e4ec86-0fea-47f4-8c1c-43e1cf03e99e
00000000-0000-0000-0000-000000000000	78	y4kxf6cgi3hb	ae93a0b6-bb60-45f5-ba45-0d9dc18e2ff8	f	2026-06-11 04:33:21.547902+00	2026-06-11 04:33:21.547902+00	\N	ba784013-bbd7-4870-85fe-02f843426d7f
00000000-0000-0000-0000-000000000000	79	xdikmx5pvpij	40635144-881b-49f4-9c45-5e9f5c3f6851	f	2026-06-11 04:33:22.900251+00	2026-06-11 04:33:22.900251+00	\N	e934a4be-4c69-4879-a74a-12d16e8265c4
00000000-0000-0000-0000-000000000000	80	fuvtcvcxqo2n	e3c5d208-2b38-44fb-90e1-7d184b129dd5	f	2026-06-11 04:33:25.653921+00	2026-06-11 04:33:25.653921+00	\N	a1ca7e64-87ce-428d-9aac-5205d6b25ab1
00000000-0000-0000-0000-000000000000	223	dfnf5rhmyd2d	8990047a-f5bc-4220-970a-711d9c9fcdba	f	2026-06-12 09:34:55.118747+00	2026-06-12 09:34:55.118747+00	njwneg7nzzaf	039e72bd-1746-4cc2-a434-4493dfc11fec
00000000-0000-0000-0000-000000000000	136	ygidslimmus7	669fac28-307a-4710-83a1-1ff49a1de9f5	t	2026-06-12 06:44:58.702874+00	2026-06-12 15:54:33.360279+00	\N	73e41d07-71d8-4c4a-b9b0-226cb975ade1
00000000-0000-0000-0000-000000000000	55	bjljogfmyxcq	9b64fa66-2e4a-4a28-8794-7ee7fc732b48	t	2026-06-10 14:59:27.721875+00	2026-06-13 10:30:24.890564+00	\N	5d11f586-82ea-4f0b-b088-93211556060c
00000000-0000-0000-0000-000000000000	57	a2oo4hgm3oqu	5050ebc5-e6b0-41d2-acf8-ceb88714a98f	t	2026-06-10 15:53:36.703941+00	2026-06-13 16:12:15.601461+00	\N	5f338fb5-f2d9-42e7-9901-ea1db50f74fc
00000000-0000-0000-0000-000000000000	81	eomx5x33t4jc	084aaedb-b710-4ef7-8c4f-8377d53068ba	f	2026-06-11 04:33:26.833972+00	2026-06-11 04:33:26.833972+00	\N	e81571e1-8b2f-4ef5-91af-d5945c0ddf1c
00000000-0000-0000-0000-000000000000	82	27slwdxvp67z	46876a71-605d-469f-8a9d-0488741e3c2e	f	2026-06-11 04:33:27.944269+00	2026-06-11 04:33:27.944269+00	\N	65b71518-2284-49ae-abca-3ac96a8810db
00000000-0000-0000-0000-000000000000	83	sqmcfirynxsj	5ef42176-dac4-494d-bd3e-b4ab64d14d51	f	2026-06-11 04:33:34.810047+00	2026-06-11 04:33:34.810047+00	\N	333220dd-590c-41c0-85df-7696754aa62e
00000000-0000-0000-0000-000000000000	84	z2dcf5cnroey	cd92543c-20ab-483a-8787-4c43ce91770c	f	2026-06-11 04:33:41.59702+00	2026-06-11 04:33:41.59702+00	\N	3aeecb04-a5ab-483f-aa48-34f33f587e13
00000000-0000-0000-0000-000000000000	129	mvwaslkvvcn2	94e11b1c-7330-4214-a522-4abd72dafa27	f	2026-06-12 06:08:31.29282+00	2026-06-12 06:08:31.29282+00	haewv4ttwd6d	e3c36b7d-bd08-4b9a-bd07-4fd11a903dd0
00000000-0000-0000-0000-000000000000	104	ekjckecxrsfx	2d4aca79-aefc-4553-a8d8-f79fa8cde1bb	t	2026-06-11 06:50:49.702223+00	2026-06-15 01:55:48.788496+00	\N	f5ff760a-c1af-4612-8e6a-e821df8afb68
00000000-0000-0000-0000-000000000000	383	aqph5c27q545	d279074b-7967-4be0-9ac0-7f933dca23b6	f	2026-06-15 02:30:44.377003+00	2026-06-15 02:30:44.377003+00	\N	5ea1d268-c0e9-43e0-933b-404c2fbe9f67
00000000-0000-0000-0000-000000000000	147	oszmgmlkwdoy	a32d08ad-cfa4-4b66-9fab-fbbb94fd4c42	f	2026-06-12 07:37:22.321214+00	2026-06-12 07:37:22.321214+00	\N	e11e243d-4e63-488d-9791-15d2b71fedd6
00000000-0000-0000-0000-000000000000	377	me4cbydfhtsd	d279074b-7967-4be0-9ac0-7f933dca23b6	t	2026-06-14 12:26:29.418065+00	2026-06-15 02:59:09.233386+00	klqqq4zbx5hj	2efcf5f7-f095-4803-aaea-95834a0263df
00000000-0000-0000-0000-000000000000	148	pvjso56wwxw6	a0138e1f-b2d5-493c-841d-f0f6fa9591ae	f	2026-06-12 07:37:50.501738+00	2026-06-12 07:37:50.501738+00	\N	b1178548-c8d4-414c-bfbc-a411cc9f4bdd
00000000-0000-0000-0000-000000000000	149	33m22u5iscvd	88592718-7475-4d65-bdd3-56b3242cbf2d	f	2026-06-12 07:38:26.355778+00	2026-06-12 07:38:26.355778+00	\N	f9d3f87c-fb3c-43c0-a74b-ca9d15b87b79
00000000-0000-0000-0000-000000000000	150	jdonc2p45h7d	6269d783-cbb6-486a-a376-7d0d16aefcaf	f	2026-06-12 07:38:53.908334+00	2026-06-12 07:38:53.908334+00	\N	0018c86f-283e-4228-bda1-e12b86fcc33e
00000000-0000-0000-0000-000000000000	151	bml4f57mn2gj	9dfa9573-2ab0-4f11-90c8-178c28e48761	f	2026-06-12 07:39:07.114984+00	2026-06-12 07:39:07.114984+00	\N	5ab30283-5cb3-4296-9f8e-f23a23b6db73
00000000-0000-0000-0000-000000000000	152	tk4tyewgvzuf	50456677-11a5-4567-9cc3-20d4624bd430	f	2026-06-12 07:40:05.464643+00	2026-06-12 07:40:05.464643+00	\N	3ef50453-589a-4406-8a13-58735b0b2074
00000000-0000-0000-0000-000000000000	153	mkwbjbxl245n	c4e67583-7df6-48f5-bae0-1244fbab4021	f	2026-06-12 07:40:06.365326+00	2026-06-12 07:40:06.365326+00	\N	93378fa9-fcb2-49ac-82b2-7997ee387c08
00000000-0000-0000-0000-000000000000	97	brbyqurmdr5h	7829ee34-4dd6-4e6b-9aaf-7e5bd5c1a8b1	f	2026-06-11 06:42:27.745297+00	2026-06-11 06:42:27.745297+00	\N	57e2c39d-b584-48d8-8f49-3cd3c1804c71
00000000-0000-0000-0000-000000000000	98	q5btke34evyu	eff3ca66-3d2c-4895-bfaa-a5f528c2dcab	f	2026-06-11 06:42:29.895666+00	2026-06-11 06:42:29.895666+00	\N	b340153c-edb2-4059-80f2-b0fb7bd02101
00000000-0000-0000-0000-000000000000	99	5zdf2bdbfk7m	f0acbc44-483d-449d-8380-f3b7ef5ca7d2	f	2026-06-11 06:43:25.115556+00	2026-06-11 06:43:25.115556+00	\N	0f139128-8bbf-4ba9-9d6e-640a1a576e47
00000000-0000-0000-0000-000000000000	100	tzjqysmyoon5	f7df0f03-9ba8-4b47-8881-20e1f071a4f8	f	2026-06-11 06:43:42.636473+00	2026-06-11 06:43:42.636473+00	\N	ad9df9cd-d73e-4bde-a615-a0b3cca933e1
00000000-0000-0000-0000-000000000000	101	jfftmpwq7azd	7f290992-7cc2-4a46-8f3e-48c89a5cc603	f	2026-06-11 06:44:06.394053+00	2026-06-11 06:44:06.394053+00	\N	dab8b8ca-9c9c-4780-a199-90425f4e43fd
00000000-0000-0000-0000-000000000000	102	blwymk3rhknh	daa2947e-d5bb-4df7-b4f5-69505655e639	f	2026-06-11 06:44:08.229611+00	2026-06-11 06:44:08.229611+00	\N	2d83fb2c-aaf8-4348-b698-0521c8a62d59
00000000-0000-0000-0000-000000000000	154	p6zncxtkc3io	6b3ec4de-d1e6-495b-984a-d07744255357	f	2026-06-12 07:40:44.991478+00	2026-06-12 07:40:44.991478+00	\N	d0b4a022-1fb7-4cc2-936d-610b849bc2b7
00000000-0000-0000-0000-000000000000	155	swisdzyuwulv	4c0fb5ef-d61b-4d24-bc28-0cbc9201f710	f	2026-06-12 07:40:46.623621+00	2026-06-12 07:40:46.623621+00	\N	b022546b-1405-4fec-a161-03ab6d974276
00000000-0000-0000-0000-000000000000	105	zus3ivsysd3t	7fca6250-e697-45f9-8b21-cbdfdea4da45	f	2026-06-11 06:56:32.881663+00	2026-06-11 06:56:32.881663+00	\N	95fcc347-78b0-4463-ba84-7d4688fe598a
00000000-0000-0000-0000-000000000000	156	hzdeyqrpzuld	fd8bdfd2-91f0-48bf-abd6-7db00f28de64	f	2026-06-12 07:41:03.403922+00	2026-06-12 07:41:03.403922+00	\N	acad5992-49ec-4840-b79c-9144ba66b7c7
00000000-0000-0000-0000-000000000000	157	6ej2jf2wsysd	90b762d0-0836-4726-a093-8a19cbcf40d0	f	2026-06-12 07:41:06.955424+00	2026-06-12 07:41:06.955424+00	\N	61329589-96ce-4178-9995-2b016d25a88a
00000000-0000-0000-0000-000000000000	158	pd3je2v6wrw6	e8726fc7-9cdd-4364-abe4-f180ea44a7c1	f	2026-06-12 07:41:17.786201+00	2026-06-12 07:41:17.786201+00	\N	09b80dc6-66ab-4944-b601-31d3efb13022
00000000-0000-0000-0000-000000000000	159	twlbpzld3ikn	0d95d2e5-44c2-4ebc-8a19-6749471f899c	f	2026-06-12 07:41:22.259998+00	2026-06-12 07:41:22.259998+00	\N	5f730885-f36d-49cd-96c8-ac5842c0e2ee
00000000-0000-0000-0000-000000000000	160	bpuluqkj4sti	d8fa2d60-affe-488b-9ced-ed0451ee0978	f	2026-06-12 07:41:55.068965+00	2026-06-12 07:41:55.068965+00	\N	844e9ac6-8004-405e-981d-4ce3097dfdb8
00000000-0000-0000-0000-000000000000	161	hff7argrgzfg	11db0121-0900-4ca6-b5ad-954904c61177	f	2026-06-12 07:41:59.741936+00	2026-06-12 07:41:59.741936+00	\N	25957de9-67dd-43e8-9457-cc7b5fb686a6
00000000-0000-0000-0000-000000000000	162	aycd3rbil2zm	e76f78a5-6a6d-4d75-9533-2406fbd544a5	f	2026-06-12 07:42:09.915281+00	2026-06-12 07:42:09.915281+00	\N	e56a6ecc-4000-438b-a877-5a5ace0a3acd
00000000-0000-0000-0000-000000000000	163	w53p7t2ip4ie	f8503299-55a5-4574-ac3c-2e539b98b930	f	2026-06-12 07:42:31.683989+00	2026-06-12 07:42:31.683989+00	\N	0e90fa95-74f8-48d5-907d-b0d8d780f102
00000000-0000-0000-0000-000000000000	164	45uck64nod4n	3db326ec-ef45-4bf3-a2c7-bf9ab4ad6b98	f	2026-06-12 07:42:54.726816+00	2026-06-12 07:42:54.726816+00	\N	e9228138-e91a-42ec-9900-e887f372a646
00000000-0000-0000-0000-000000000000	165	qz7rqmmxxrua	31f27e3e-e37a-483c-b0cf-268f24a61350	f	2026-06-12 07:43:01.758194+00	2026-06-12 07:43:01.758194+00	\N	e4db6399-1514-4452-91a3-1286168795a6
00000000-0000-0000-0000-000000000000	166	tfckaxhnzqe2	1e254bec-48f2-46ec-ad66-61f396b4d2da	f	2026-06-12 07:43:25.734305+00	2026-06-12 07:43:25.734305+00	\N	84e6468e-2451-4bf9-a357-e44b49abc49d
00000000-0000-0000-0000-000000000000	167	ctsarzit45gx	7d8c5e03-8935-41e8-9d43-f711af128895	f	2026-06-12 07:43:37.515196+00	2026-06-12 07:43:37.515196+00	\N	a38a1efa-5760-481e-9fad-6f9ea54dc815
00000000-0000-0000-0000-000000000000	173	kglbjbezdfrt	db0c53e0-9c81-4209-9e2d-d0e78ef0a682	f	2026-06-12 07:55:49.194763+00	2026-06-12 07:55:49.194763+00	\N	457e39d3-3492-447e-9d80-9b5b7ed21cf9
00000000-0000-0000-0000-000000000000	177	4xq72ez6n6eh	225a7e35-d82f-4836-9071-b6937ed0dba2	f	2026-06-12 08:03:18.201789+00	2026-06-12 08:03:18.201789+00	\N	10e636ea-42c9-4a95-a5d1-f4406fccc8a5
00000000-0000-0000-0000-000000000000	179	b566fxmd5alc	03b58870-37b2-431a-91b9-8d88747a5d11	f	2026-06-12 08:04:10.294336+00	2026-06-12 08:04:10.294336+00	\N	e5b7d8ce-8202-4cd6-9a3d-61e771bfd392
00000000-0000-0000-0000-000000000000	180	wrlydxskoykt	73b0f65a-e485-4038-94ff-1e27ab1c9ec5	f	2026-06-12 08:04:29.01355+00	2026-06-12 08:04:29.01355+00	\N	c48790bc-fc12-4acc-9535-e7cdc76614b0
00000000-0000-0000-0000-000000000000	181	7r5zs4z4yfdj	b8ff4154-afb9-402e-b12f-e0db6b0357f3	f	2026-06-12 08:04:36.125466+00	2026-06-12 08:04:36.125466+00	\N	2298ce0f-5f95-41b0-b24c-0edc096b8577
00000000-0000-0000-0000-000000000000	182	476c3c2tvc67	1f1cb1a3-faef-481e-a073-4c1c8d967fb1	f	2026-06-12 08:05:00.218702+00	2026-06-12 08:05:00.218702+00	\N	9b73fc4f-42b0-4014-b3dc-a54fbb104c0d
00000000-0000-0000-0000-000000000000	183	qujlbdrvqdlh	8b25b10b-1610-4680-902f-e3f55b7f9778	f	2026-06-12 08:05:03.111208+00	2026-06-12 08:05:03.111208+00	\N	b7650dec-50f6-4487-b754-e494fbbab234
00000000-0000-0000-0000-000000000000	184	igrj3snblf5q	5128b5ad-af23-4c12-ad9a-de7c4f902374	f	2026-06-12 08:05:08.095349+00	2026-06-12 08:05:08.095349+00	\N	f2b680fb-3b45-4b39-96a2-edb70f66d737
00000000-0000-0000-0000-000000000000	137	mmoakkdzpfc4	f94554df-c3d8-4712-be57-9510b513c3af	t	2026-06-12 06:49:06.257246+00	2026-06-12 08:06:10.693592+00	\N	1a1ae151-63f0-4c71-ade5-6afe116f5582
00000000-0000-0000-0000-000000000000	197	4z2hdgky66fs	21b0ebca-c531-4f62-ad6c-062e945241b2	f	2026-06-12 08:14:09.968732+00	2026-06-12 08:14:09.968732+00	\N	438bb8bc-fd83-44ca-a1c8-0164d764f86e
00000000-0000-0000-0000-000000000000	198	fbgxvwbjetrp	11e1d361-9d77-47c2-aa43-98f36c72c4fe	f	2026-06-12 08:14:39.308265+00	2026-06-12 08:14:39.308265+00	\N	306a1a14-5688-477d-8d82-75a579e93e71
00000000-0000-0000-0000-000000000000	206	nalr4tg2guyg	13387259-398e-4d7a-9469-9d5eefa409bc	f	2026-06-12 08:29:54.188876+00	2026-06-12 08:29:54.188876+00	\N	16b33ec6-3097-4446-8915-d12d037eaada
00000000-0000-0000-0000-000000000000	214	djrfhq2eywk4	49b634c7-f3be-4b92-b9c7-ce03d4014db9	f	2026-06-12 09:32:18.963131+00	2026-06-12 09:32:18.963131+00	\N	3fd4e058-3ccc-4059-ba9a-6f588ee91258
00000000-0000-0000-0000-000000000000	215	ggll7h54sxzo	e27fb815-f136-4969-a4da-061056cc55e0	f	2026-06-12 09:32:21.772625+00	2026-06-12 09:32:21.772625+00	\N	568ebd8f-23b2-4804-8364-d6dca73c0c42
00000000-0000-0000-0000-000000000000	133	p6qg735hiyaw	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-12 06:34:55.70653+00	2026-06-12 10:55:10.081339+00	\N	29c890ee-2cae-4e88-a739-b7818e357254
00000000-0000-0000-0000-000000000000	111	anbccka57wbf	06d23a82-219a-4d0b-8a9d-249bf291e615	t	2026-06-11 08:54:11.728802+00	2026-06-13 12:37:21.369959+00	3dianlyahx7n	31446a88-88b4-4dba-a426-74cc266d4299
00000000-0000-0000-0000-000000000000	224	fue72w7k534i	af9fc048-8014-4384-a0d0-f31d1e6c4638	f	2026-06-12 09:35:31.697602+00	2026-06-12 09:35:31.697602+00	\N	28a6acc8-897c-43be-b210-54081f82e8b1
00000000-0000-0000-0000-000000000000	225	hlhhixuj56qg	189dfd01-3549-4b85-a125-4ff4fe21973a	f	2026-06-12 09:35:33.433408+00	2026-06-12 09:35:33.433408+00	\N	7f72cc7d-1b80-4cfd-b48a-ef401a00e54b
00000000-0000-0000-0000-000000000000	226	wzkvo3i4bcdy	9c5f933e-74c0-4035-9656-24d410345832	f	2026-06-12 09:35:39.731164+00	2026-06-12 09:35:39.731164+00	\N	a5b45f89-304f-4832-9a05-db8e7a12ee85
00000000-0000-0000-0000-000000000000	227	4embsltbplpf	1fbe544f-8961-493b-9636-e89a8e213f3f	f	2026-06-12 09:36:16.9982+00	2026-06-12 09:36:16.9982+00	\N	2fa0f7f8-333d-4c49-835f-dd3732273d6d
00000000-0000-0000-0000-000000000000	228	3duvvrsnx3yx	f7b9f068-0069-4676-a960-f4fe2420c7d1	f	2026-06-12 09:36:18.282166+00	2026-06-12 09:36:18.282166+00	\N	556003d0-87f4-444a-a9bb-6032904575b6
00000000-0000-0000-0000-000000000000	229	b5zsxmhgffpw	52c8f853-2649-480a-bdfc-f04cb3219afd	f	2026-06-12 09:36:19.047402+00	2026-06-12 09:36:19.047402+00	\N	7922830c-35c2-4abf-bb02-ff3c9d42bc63
00000000-0000-0000-0000-000000000000	230	qyqhn7iuiirq	add5c076-3a63-48d7-bf6a-c2c344a0c02e	f	2026-06-12 09:36:19.884243+00	2026-06-12 09:36:19.884243+00	\N	cf504de3-43ff-4656-b110-44384d86cb63
00000000-0000-0000-0000-000000000000	231	vraabbjilov7	098caab1-26d1-48a9-9544-20888b7b08b7	f	2026-06-12 09:36:25.268717+00	2026-06-12 09:36:25.268717+00	\N	ff65f629-70b1-4d53-b361-bc193b126bfd
00000000-0000-0000-0000-000000000000	232	lfuswrn32afx	90ab57ed-a6a7-42a1-8f00-f0affefbe9c5	f	2026-06-12 09:36:25.950036+00	2026-06-12 09:36:25.950036+00	\N	36d4b758-c906-4188-abcd-453635a4a21f
00000000-0000-0000-0000-000000000000	233	5zgfo2istaol	b3c6da83-938f-4c22-86e0-ccd832c142f4	f	2026-06-12 09:36:27.350676+00	2026-06-12 09:36:27.350676+00	\N	4836ee16-c983-4168-ae1d-1d2da89ab404
00000000-0000-0000-0000-000000000000	234	znzawys5apxl	dce33968-4dbb-4600-b78f-0c7f4f0b302d	f	2026-06-12 09:36:57.120414+00	2026-06-12 09:36:57.120414+00	\N	ef121dfb-cdb6-4d43-8a9f-761b317f1880
00000000-0000-0000-0000-000000000000	235	aioj6uvwcvfe	80950f0a-8660-4b5e-b59d-bacd3e4b411d	f	2026-06-12 09:36:58.285144+00	2026-06-12 09:36:58.285144+00	\N	df1c84e6-6419-4acd-8565-53c90b77c07b
00000000-0000-0000-0000-000000000000	236	ebhmgbse6ech	9e0bd2e9-bdbf-4e9f-adc7-2aec7b351178	f	2026-06-12 09:36:59.102321+00	2026-06-12 09:36:59.102321+00	\N	e446e2d3-b5e4-4d89-9f09-f6ccd90b530b
00000000-0000-0000-0000-000000000000	237	xrall5fgldf6	1bea8877-9902-4fb0-9b54-837927d86b1f	f	2026-06-12 09:37:21.073901+00	2026-06-12 09:37:21.073901+00	\N	83f34bdc-4a42-4616-a4b2-97131469cd3e
00000000-0000-0000-0000-000000000000	238	iae3ksoxgy54	25a735c5-cd09-4b2e-9261-805f224731de	f	2026-06-12 09:37:28.938283+00	2026-06-12 09:37:28.938283+00	\N	e5d8db3e-2dac-43f1-96fc-d194a451312f
00000000-0000-0000-0000-000000000000	239	3ejast6g2ryu	406099d7-4700-44ad-90f5-6ec1db7995f1	f	2026-06-12 09:38:30.362751+00	2026-06-12 09:38:30.362751+00	\N	0c648ad6-5f64-4da6-9c4e-3ab9ad0a4f20
00000000-0000-0000-0000-000000000000	240	qoimpyl2kbmt	95ad49c3-a03b-49a6-a67e-63a33f42c029	f	2026-06-12 09:38:51.453825+00	2026-06-12 09:38:51.453825+00	\N	e664315b-0988-4caf-b965-70d1d699c00a
00000000-0000-0000-0000-000000000000	241	s5k7bxlrx4dx	dbec404f-2233-41c8-a373-0e79d5541e62	f	2026-06-12 09:38:52.756745+00	2026-06-12 09:38:52.756745+00	\N	34996de3-226e-466f-a086-5fc1d9451e60
00000000-0000-0000-0000-000000000000	242	eecdbfh3hu7o	37304c07-2c30-48e2-a104-138a10150ef3	f	2026-06-12 09:38:53.517775+00	2026-06-12 09:38:53.517775+00	\N	9e11e5c3-72b5-428e-baa4-b4c373c670ef
00000000-0000-0000-0000-000000000000	243	b7jag4fd5j7o	a20786bc-3c58-49b9-8fe4-00978b4a036a	f	2026-06-12 09:38:54.190181+00	2026-06-12 09:38:54.190181+00	\N	d4b99fd8-388f-4ade-a6aa-583888dd1663
00000000-0000-0000-0000-000000000000	244	q3zrcd5qxcml	4af4b21d-e0cc-4e13-b72c-5f322bdf4a43	f	2026-06-12 09:39:09.946034+00	2026-06-12 09:39:09.946034+00	\N	cf91c061-4972-46e2-86d4-f733d80977c0
00000000-0000-0000-0000-000000000000	245	o3s3ediaarnp	24ffa000-5b2a-4055-8b85-051b3ae39d3f	f	2026-06-12 09:39:11.271228+00	2026-06-12 09:39:11.271228+00	\N	af325113-f292-437a-bc5a-9bc5fb497402
00000000-0000-0000-0000-000000000000	246	enxb6ue252nb	ffed837f-9680-4773-8e2e-9f59c2771b61	f	2026-06-12 09:39:12.124755+00	2026-06-12 09:39:12.124755+00	\N	c08db4b2-045a-40ed-ba57-3592441bed5b
00000000-0000-0000-0000-000000000000	247	fai6aef6z3ir	945e5bb2-44bb-4e99-804b-4df989c7aadb	f	2026-06-12 09:39:12.754971+00	2026-06-12 09:39:12.754971+00	\N	bf3e4b54-b1fb-4be4-9180-d88f8d3611e1
00000000-0000-0000-0000-000000000000	248	pkcvxkllhxzf	809b24e3-9eae-4f00-ae9a-06e5217977d6	f	2026-06-12 09:41:11.847184+00	2026-06-12 09:41:11.847184+00	\N	7ef8d3e6-b6f4-4681-9eb8-0ecd42ab1742
00000000-0000-0000-0000-000000000000	249	ennnulqjg44q	9885e2d1-5e7f-4f09-95d8-de22d84391b0	f	2026-06-12 09:42:16.69808+00	2026-06-12 09:42:16.69808+00	\N	3ad53fad-d076-48a2-a240-ae7ddef3c874
00000000-0000-0000-0000-000000000000	250	53vm6zp4a3z3	18bd5b89-c11b-4fff-9c58-c4743cdced99	f	2026-06-12 09:42:25.340393+00	2026-06-12 09:42:25.340393+00	\N	de24ea7e-1e22-44e0-87f8-a1ff41104786
00000000-0000-0000-0000-000000000000	251	i4ewar6b6dhr	148a6ed3-cd1f-4051-aed3-21b324d1d82a	f	2026-06-12 09:43:35.909064+00	2026-06-12 09:43:35.909064+00	bkx3mgovvkez	cdd01dc3-3535-4479-9844-689fded9b103
00000000-0000-0000-0000-000000000000	252	bojpydr7gfst	12465f7e-bd43-4577-9f72-8b9ec0ed5b47	f	2026-06-12 09:43:37.541984+00	2026-06-12 09:43:37.541984+00	\N	980f747c-253a-4461-8348-c291a01a9a7a
00000000-0000-0000-0000-000000000000	253	2zjbu27b3vwz	b3ceed5f-3077-470b-995e-941a958f8f36	f	2026-06-12 09:43:38.947042+00	2026-06-12 09:43:38.947042+00	\N	5491d9d5-3983-4712-9647-d337df570d6c
00000000-0000-0000-0000-000000000000	254	n24qmuanxlwb	6c9a7777-9b79-4113-9839-0805280ca55a	f	2026-06-12 09:43:39.734791+00	2026-06-12 09:43:39.734791+00	\N	8a1384d3-9318-4fc9-aa5e-9762b2de6850
00000000-0000-0000-0000-000000000000	378	2vg3fdnbnod2	40514075-d5ed-4273-be49-e94d34e04613	f	2026-06-14 12:46:17.555782+00	2026-06-14 12:46:17.555782+00	pgjfye3nya2j	336ecd4f-f756-44f4-9dce-16b9d2787c8c
00000000-0000-0000-0000-000000000000	256	vcvnwhougrs4	f838a000-e70c-4606-a764-60460867dca9	f	2026-06-12 09:48:42.911961+00	2026-06-12 09:48:42.911961+00	\N	30fcff79-8bfa-4c95-87a8-08f7c66cc691
00000000-0000-0000-0000-000000000000	257	3hocwhiw6hso	e3fe2440-b7d6-4001-be43-63c2d9ceaf1d	f	2026-06-12 09:49:32.390629+00	2026-06-12 09:49:32.390629+00	\N	0adf82d7-0cb7-4c59-b9f1-aeae33a411cb
00000000-0000-0000-0000-000000000000	258	3vf4q5nez6jg	d5f7406e-edea-4b6b-9fbe-ca9c43d887c7	f	2026-06-12 09:50:02.668288+00	2026-06-12 09:50:02.668288+00	\N	4c973497-1521-4c12-beb7-f97589b0e97a
00000000-0000-0000-0000-000000000000	259	i7ylhxp7a4ip	a9a5fca5-4ff5-4a55-9bf4-48ec422ae02f	f	2026-06-12 09:50:07.616028+00	2026-06-12 09:50:07.616028+00	\N	8212da37-eda8-4d7a-9eca-d867672210fc
00000000-0000-0000-0000-000000000000	260	mfspxufd653s	8b764345-86d4-4c42-8c0a-93583b0cbf2b	f	2026-06-12 09:50:09.581397+00	2026-06-12 09:50:09.581397+00	\N	44e06417-adaa-4b63-9f9e-900b58f5e59b
00000000-0000-0000-0000-000000000000	261	vggwc5m4umth	a5924b4f-7154-4c55-aca6-ffe1b4ca737f	f	2026-06-12 09:50:25.944136+00	2026-06-12 09:50:25.944136+00	\N	0bd295f9-4250-47ad-88f6-3ee109f13a23
00000000-0000-0000-0000-000000000000	262	2vjgyyp5wvhp	a2313f28-627f-4178-9cb5-98e8d2d414cb	f	2026-06-12 09:51:23.076709+00	2026-06-12 09:51:23.076709+00	\N	e0c50005-0d75-4217-ba04-d522f9853b1e
00000000-0000-0000-0000-000000000000	263	2qmq53caieu3	78d55f61-3c1b-455d-bb86-5bc07be81b29	f	2026-06-12 09:58:22.464097+00	2026-06-12 09:58:22.464097+00	\N	e66febfd-af64-4db0-bf1d-f87c50053725
00000000-0000-0000-0000-000000000000	264	nwvzodf5awxr	4ca0d654-4b61-4381-a053-8269cc9ad6b0	f	2026-06-12 10:01:02.865703+00	2026-06-12 10:01:02.865703+00	\N	7a65e573-5c2b-45e9-8ca0-e2c938610eee
00000000-0000-0000-0000-000000000000	265	b6mxfg4lfuow	2d0a2b99-4b2b-4689-917d-3372716c9e08	f	2026-06-12 10:01:04.209896+00	2026-06-12 10:01:04.209896+00	\N	778235b4-815b-4de9-87c8-1d4d1b50c391
00000000-0000-0000-0000-000000000000	266	szv6pjs5fjzo	e377ff25-d2f9-4601-9dc0-f67d5ffc2fae	f	2026-06-12 10:04:11.053695+00	2026-06-12 10:04:11.053695+00	\N	72ef9197-d380-4f3e-9abc-c9ac1c48c1c3
00000000-0000-0000-0000-000000000000	255	ebicjkl6zqcz	124d00b9-b6a0-4813-9820-6e42268d7864	t	2026-06-12 09:47:45.951729+00	2026-06-12 10:54:39.1506+00	jeidjnpkslmy	3c038494-1849-4464-8706-8c6a4a6df15a
00000000-0000-0000-0000-000000000000	269	4hjklq6ag2qs	18e452a5-3fed-4b7f-bece-28d0edc7783e	f	2026-06-12 13:05:58.925418+00	2026-06-12 13:05:58.925418+00	jt6quqqopjoj	32751717-7b64-4e2e-ab80-17042bda7bf1
00000000-0000-0000-0000-000000000000	270	ywxa43fwh2xm	669fac28-307a-4710-83a1-1ff49a1de9f5	f	2026-06-12 15:54:33.378801+00	2026-06-12 15:54:33.378801+00	ygidslimmus7	73e41d07-71d8-4c4a-b9b0-226cb975ade1
00000000-0000-0000-0000-000000000000	272	f7pzp2z2yysw	a204d21c-17fb-4eec-84b9-78b958f86f46	f	2026-06-13 00:12:52.349241+00	2026-06-13 00:12:52.349241+00	\N	e4981f53-b0b3-4195-86cb-37b1dabf5081
00000000-0000-0000-0000-000000000000	273	6q2xva4kt7zq	ae19d965-d835-4e48-bbe5-cd22f458181f	t	2026-06-13 00:12:58.198616+00	2026-06-13 02:07:51.34394+00	\N	d4b0494e-1dd5-4ce9-b74f-d2e002f0a741
00000000-0000-0000-0000-000000000000	274	tg6t6dovmxyr	ae19d965-d835-4e48-bbe5-cd22f458181f	f	2026-06-13 02:07:51.362318+00	2026-06-13 02:07:51.362318+00	6q2xva4kt7zq	d4b0494e-1dd5-4ce9-b74f-d2e002f0a741
00000000-0000-0000-0000-000000000000	271	4zqby4dvmdyq	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-13 00:09:51.274788+00	2026-06-13 02:41:35.085722+00	hkprxbrcqzdh	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	275	fnoo2jwrbpdi	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-13 02:41:35.096777+00	2026-06-13 03:43:06.188749+00	4zqby4dvmdyq	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	267	yyfld5snaytd	124d00b9-b6a0-4813-9820-6e42268d7864	t	2026-06-12 10:54:39.172669+00	2026-06-13 03:54:03.87748+00	ebicjkl6zqcz	3c038494-1849-4464-8706-8c6a4a6df15a
00000000-0000-0000-0000-000000000000	276	vzd4ynru3ee2	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-13 03:43:06.198576+00	2026-06-13 05:36:38.25014+00	fnoo2jwrbpdi	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	268	q3s2a2dsj64c	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-12 10:55:10.089702+00	2026-06-13 05:36:39.406882+00	p6qg735hiyaw	29c890ee-2cae-4e88-a739-b7818e357254
00000000-0000-0000-0000-000000000000	277	pxltbizayeir	124d00b9-b6a0-4813-9820-6e42268d7864	f	2026-06-13 03:54:03.883424+00	2026-06-13 03:54:03.883424+00	yyfld5snaytd	3c038494-1849-4464-8706-8c6a4a6df15a
00000000-0000-0000-0000-000000000000	379	ahfr2u3vwz7z	9c41e93c-efeb-40fa-8c67-e8549d10d46a	f	2026-06-14 13:37:40.014589+00	2026-06-14 13:37:40.014589+00	ie2d5ym3prck	5df25f4d-947c-4f08-b5a7-2ded69571d7f
00000000-0000-0000-0000-000000000000	384	xmocpqqgz2h5	d279074b-7967-4be0-9ac0-7f933dca23b6	f	2026-06-15 02:59:09.246099+00	2026-06-15 02:59:09.246099+00	me4cbydfhtsd	2efcf5f7-f095-4803-aaea-95834a0263df
00000000-0000-0000-0000-000000000000	289	wo5j7cpaz6w2	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-13 05:36:39.407315+00	2026-06-13 07:59:49.023004+00	q3s2a2dsj64c	29c890ee-2cae-4e88-a739-b7818e357254
00000000-0000-0000-0000-000000000000	288	abnddsexcslm	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-13 05:36:38.262371+00	2026-06-13 09:10:56.440674+00	vzd4ynru3ee2	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	296	i4gsg23rnxbl	a392bd34-3795-41ce-9d2e-3a43c9220ea2	f	2026-06-13 09:57:27.118347+00	2026-06-13 09:57:27.118347+00	\N	8c4965f0-82f3-477d-8a3c-05390a3dacc2
00000000-0000-0000-0000-000000000000	293	qq3gvoayal5n	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-13 09:10:56.441124+00	2026-06-13 10:09:34.893734+00	abnddsexcslm	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	298	w2kilroathpl	9b64fa66-2e4a-4a28-8794-7ee7fc732b48	f	2026-06-13 10:30:24.897946+00	2026-06-13 10:30:24.897946+00	bjljogfmyxcq	5d11f586-82ea-4f0b-b088-93211556060c
00000000-0000-0000-0000-000000000000	299	hwa55p562vfm	2b362ca9-84a9-4eae-a5f1-6937d2e35034	f	2026-06-13 10:30:27.858314+00	2026-06-13 10:30:27.858314+00	\N	59b2f53c-a976-411e-88ea-9bbc4b3b7bb9
00000000-0000-0000-0000-000000000000	300	o2pedfn6cnhd	e0007381-cf34-4037-8dcb-d762401dec65	f	2026-06-13 10:30:31.344557+00	2026-06-13 10:30:31.344557+00	\N	3c472d9a-da0f-4918-bf82-6818d3f92b82
00000000-0000-0000-0000-000000000000	301	c3nna5naf5nl	8b540241-add8-40bb-93ec-a1f4332ac0f0	f	2026-06-13 10:30:37.651332+00	2026-06-13 10:30:37.651332+00	\N	ca62bb60-1ef3-4bbd-a216-9e56246f5e33
00000000-0000-0000-0000-000000000000	302	ny5glgv26wgt	82e1a5d9-d557-42dc-a7ee-6475ec9867be	f	2026-06-13 10:30:46.139729+00	2026-06-13 10:30:46.139729+00	\N	818e77d1-0b7e-4c99-8764-57cdb82cb8fb
00000000-0000-0000-0000-000000000000	303	vbe36wjemkd7	16d81c04-9ef0-4307-b6be-af6286a10cf4	f	2026-06-13 10:30:50.107096+00	2026-06-13 10:30:50.107096+00	\N	826a4e26-343a-4382-9d33-9822e8cd460a
00000000-0000-0000-0000-000000000000	297	pkek75iuynqk	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-13 10:09:34.899511+00	2026-06-13 11:30:46.50252+00	qq3gvoayal5n	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	312	7qrjsmhsmbsz	544434d3-ad2a-4364-a154-1f60154c603d	f	2026-06-13 11:57:26.775274+00	2026-06-13 11:57:26.775274+00	\N	06b144ea-e24e-4fcf-95d1-6c798b5f74c5
00000000-0000-0000-0000-000000000000	313	tzd4nveiw2wm	06d23a82-219a-4d0b-8a9d-249bf291e615	f	2026-06-13 12:37:21.385469+00	2026-06-13 12:37:21.385469+00	anbccka57wbf	31446a88-88b4-4dba-a426-74cc266d4299
00000000-0000-0000-0000-000000000000	290	ygso4cfddppm	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-13 05:37:16.927578+00	2026-06-13 12:43:38.766968+00	\N	336ecd4f-f756-44f4-9dce-16b9d2787c8c
00000000-0000-0000-0000-000000000000	309	asyhg4uollrd	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-13 11:30:46.507127+00	2026-06-13 12:46:01.867321+00	pkek75iuynqk	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	308	ouryqafdpmh7	544434d3-ad2a-4364-a154-1f60154c603d	t	2026-06-13 11:30:43.583093+00	2026-06-13 13:51:56.922028+00	\N	905ff0f9-72e8-4748-9480-7288740a7808
00000000-0000-0000-0000-000000000000	318	ueenk7d675au	544434d3-ad2a-4364-a154-1f60154c603d	f	2026-06-13 13:51:56.931292+00	2026-06-13 13:51:56.931292+00	ouryqafdpmh7	905ff0f9-72e8-4748-9480-7288740a7808
00000000-0000-0000-0000-000000000000	291	oooqmaiuz6op	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-13 07:59:49.036963+00	2026-06-13 14:08:48.265492+00	wo5j7cpaz6w2	29c890ee-2cae-4e88-a739-b7818e357254
00000000-0000-0000-0000-000000000000	320	p6ljdve2nnwc	40514075-d5ed-4273-be49-e94d34e04613	f	2026-06-13 14:08:48.273694+00	2026-06-13 14:08:48.273694+00	oooqmaiuz6op	29c890ee-2cae-4e88-a739-b7818e357254
00000000-0000-0000-0000-000000000000	315	zmxvokdyk6gs	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-13 12:43:38.77114+00	2026-06-13 14:18:39.611919+00	ygso4cfddppm	336ecd4f-f756-44f4-9dce-16b9d2787c8c
00000000-0000-0000-0000-000000000000	306	7pegx3npbnfz	edf75b25-8658-45f9-a078-c8cb8ea5fbe9	t	2026-06-13 11:06:14.525493+00	2026-06-13 14:45:40.411007+00	\N	69b69066-70bc-4318-8651-d66106c0fdca
00000000-0000-0000-0000-000000000000	323	ugkci6qpeuyw	edf75b25-8658-45f9-a078-c8cb8ea5fbe9	f	2026-06-13 14:45:40.413867+00	2026-06-13 14:45:40.413867+00	7pegx3npbnfz	69b69066-70bc-4318-8651-d66106c0fdca
00000000-0000-0000-0000-000000000000	321	jcnvcskmiyey	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-13 14:18:39.623291+00	2026-06-13 15:22:39.544121+00	zmxvokdyk6gs	336ecd4f-f756-44f4-9dce-16b9d2787c8c
00000000-0000-0000-0000-000000000000	327	jheuf6dcxtoj	1073e7a6-ddb4-4375-83c8-84d4eecc5475	f	2026-06-13 15:28:27.635336+00	2026-06-13 15:28:27.635336+00	\N	79138b30-67af-435c-a673-639a65cb424d
00000000-0000-0000-0000-000000000000	328	lgse6n7qkvaj	9c41e93c-efeb-40fa-8c67-e8549d10d46a	t	2026-06-13 15:33:47.730689+00	2026-06-13 17:40:33.584321+00	\N	5df25f4d-947c-4f08-b5a7-2ded69571d7f
00000000-0000-0000-0000-000000000000	316	j5i3c7urx2mw	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-13 12:46:01.869209+00	2026-06-14 02:19:54.774173+00	asyhg4uollrd	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	326	7fwsrd7qsqyq	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-13 15:22:39.54949+00	2026-06-14 06:27:47.139086+00	jcnvcskmiyey	336ecd4f-f756-44f4-9dce-16b9d2787c8c
00000000-0000-0000-0000-000000000000	284	vyegvpoumilu	2fdf9677-2cc8-4776-98c8-aaa6d8f008d7	t	2026-06-13 04:08:30.322594+00	2026-06-14 09:01:10.192795+00	\N	097b6e37-17bd-4500-a89d-f2912c23d835
00000000-0000-0000-0000-000000000000	349	ufjxf6q3arjn	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-14 05:16:24.622698+00	2026-06-14 10:24:24.759981+00	qyihqemlybua	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	330	pxvkm5xclrci	d3ae6305-a53b-4608-95ef-e17171e9b8db	f	2026-06-13 15:56:20.365152+00	2026-06-13 15:56:20.365152+00	\N	b90d3c5c-9e85-4117-98c0-67266a0def6e
00000000-0000-0000-0000-000000000000	331	atvoljut2tnp	5050ebc5-e6b0-41d2-acf8-ceb88714a98f	f	2026-06-13 16:12:15.609906+00	2026-06-13 16:12:15.609906+00	a2oo4hgm3oqu	5f338fb5-f2d9-42e7-9901-ea1db50f74fc
00000000-0000-0000-0000-000000000000	353	pgjfye3nya2j	40514075-d5ed-4273-be49-e94d34e04613	t	2026-06-14 06:27:47.149438+00	2026-06-14 12:46:17.54571+00	7fwsrd7qsqyq	336ecd4f-f756-44f4-9dce-16b9d2787c8c
00000000-0000-0000-0000-000000000000	369	ie2d5ym3prck	9c41e93c-efeb-40fa-8c67-e8549d10d46a	t	2026-06-14 10:12:48.913903+00	2026-06-14 13:37:40.008954+00	bkksnu2wjm2h	5df25f4d-947c-4f08-b5a7-2ded69571d7f
00000000-0000-0000-0000-000000000000	339	hw7gtkmvwpr2	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-14 02:19:54.776577+00	2026-06-14 03:18:11.79613+00	j5i3c7urx2mw	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	336	5cxnvf7hen6x	3600d5ae-0e04-4a6c-9436-55699f2de0a8	t	2026-06-13 18:16:47.233144+00	2026-06-14 03:58:35.342972+00	eztadiu256n6	bf27e73b-4d9f-4840-bce1-ed87af80e993
00000000-0000-0000-0000-000000000000	334	rtxrtunz24az	9c41e93c-efeb-40fa-8c67-e8549d10d46a	t	2026-06-13 17:40:33.59249+00	2026-06-14 03:58:54.495807+00	lgse6n7qkvaj	5df25f4d-947c-4f08-b5a7-2ded69571d7f
00000000-0000-0000-0000-000000000000	345	ywzrc4zhn5n2	7bc60ae4-1e67-41a9-9b95-f27b33ecbf62	f	2026-06-14 04:00:02.458766+00	2026-06-14 04:00:02.458766+00	ry7b4skcxraz	43c4e37b-de48-4215-a2c8-e082d3370c24
00000000-0000-0000-0000-000000000000	346	auvjes3ur6vq	03d71ade-0176-41ed-ba4d-84d62214cb46	f	2026-06-14 04:00:04.632774+00	2026-06-14 04:00:04.632774+00	\N	63d2d37a-c4cf-48ab-b75e-e49275ed0fd7
00000000-0000-0000-0000-000000000000	341	qyihqemlybua	30e0a794-89eb-44df-bc4f-51b04ceba280	t	2026-06-14 03:18:11.813872+00	2026-06-14 05:16:24.617149+00	hw7gtkmvwpr2	a809673b-fdaa-4673-83f4-3af52fc1471e
00000000-0000-0000-0000-000000000000	344	qonhuvyfbbbe	9c41e93c-efeb-40fa-8c67-e8549d10d46a	t	2026-06-14 03:58:54.498137+00	2026-06-14 08:51:32.90226+00	rtxrtunz24az	5df25f4d-947c-4f08-b5a7-2ded69571d7f
00000000-0000-0000-0000-000000000000	364	wc44w2emj445	2fdf9677-2cc8-4776-98c8-aaa6d8f008d7	f	2026-06-14 09:01:10.195305+00	2026-06-14 09:01:10.195305+00	vyegvpoumilu	097b6e37-17bd-4500-a89d-f2912c23d835
00000000-0000-0000-0000-000000000000	365	yt356xjzfpw7	bbb0ada2-a3a0-4dfe-961a-959836b12f81	f	2026-06-14 09:09:30.316818+00	2026-06-14 09:09:30.316818+00	\N	c074b5d6-06c7-463f-8d63-52edf3b82ef9
00000000-0000-0000-0000-000000000000	361	bkksnu2wjm2h	9c41e93c-efeb-40fa-8c67-e8549d10d46a	t	2026-06-14 08:51:32.908003+00	2026-06-14 10:12:48.912522+00	qonhuvyfbbbe	5df25f4d-947c-4f08-b5a7-2ded69571d7f
00000000-0000-0000-0000-000000000000	362	pgboz5rzacuq	54e610db-68cd-4162-9714-db38ad23df40	t	2026-06-14 08:52:31.963466+00	2026-06-14 10:14:42.989723+00	g5kzkvsym5sf	d6f46639-9773-4fea-8bc1-ee46621ff805
00000000-0000-0000-0000-000000000000	370	stkhzwn3xsht	54e610db-68cd-4162-9714-db38ad23df40	f	2026-06-14 10:14:42.997318+00	2026-06-14 10:14:42.997318+00	pgboz5rzacuq	d6f46639-9773-4fea-8bc1-ee46621ff805
00000000-0000-0000-0000-000000000000	343	fzivn2ob3myb	3600d5ae-0e04-4a6c-9436-55699f2de0a8	t	2026-06-14 03:58:35.358715+00	2026-06-14 10:16:57.199227+00	5cxnvf7hen6x	bf27e73b-4d9f-4840-bce1-ed87af80e993
00000000-0000-0000-0000-000000000000	371	2kbrrm3hgxpg	3600d5ae-0e04-4a6c-9436-55699f2de0a8	f	2026-06-14 10:16:57.205546+00	2026-06-14 10:16:57.205546+00	fzivn2ob3myb	bf27e73b-4d9f-4840-bce1-ed87af80e993
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at", "disabled") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at", "name_id_format") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."webauthn_challenges" ("id", "user_id", "challenge_type", "session_data", "created_at", "expires_at") FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."webauthn_credentials" ("id", "user_id", "credential_id", "public_key", "attestation_type", "aaguid", "sign_count", "transports", "backup_eligible", "backed_up", "friendly_name", "created_at", "updated_at", "last_used_at") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."users" ("id", "supabase_id", "email", "username", "display_name", "avatar_key", "bio", "role", "total_xp", "level", "checkpoint_count", "journey_count", "created_at", "updated_at", "deleted_at", "is_anonymous") FROM stdin;
97d054d6-7db3-41cb-9f76-342d9d9bcae9	9b64fa66-2e4a-4a28-8794-7ee7fc732b48	\N	traveler_9d1d9b	\N	\N	\N	user	0	1	0	0	2026-06-10 14:59:28.651938+00	2026-06-10 14:59:28.651938+00	\N	t
5696e3cd-2e5c-4fb4-8f62-34ae80033475	5050ebc5-e6b0-41d2-acf8-ceb88714a98f	\N	traveler_b76dda	\N	\N	\N	user	0	1	0	0	2026-06-10 15:53:39.40078+00	2026-06-10 15:53:39.40078+00	\N	t
5508302b-91a6-477e-9a30-295a658630de	2d4aca79-aefc-4553-a8d8-f79fa8cde1bb	baohandao2303@gmail.com	baohandao2303_4bcaf9	Kon Moè 🦄	avatars/5508302b-91a6-477e-9a30-295a658630de/5bd84938ddbc72f0.jpg	Thích leo núi 💖✈️	user	10	1	1	1	2026-06-11 06:50:51.474885+00	2026-06-11 07:15:48.883098+00	\N	f
1c53f958-a9df-4a58-8fee-232970396c7a	e7c7a2bb-c3ff-4bb4-8f78-9eaad620cad7	\N	traveler_7a15cf	\N	\N	\N	user	0	1	0	0	2026-06-11 01:45:59.464819+00	2026-06-11 01:45:59.464819+00	\N	t
c61b8ed0-2bfc-4793-8572-0542dc529050	bf607771-0378-4fa3-9ec3-9cad1d0da0fb	buihung.galaxy.s2@gmail.com	buihunggalaxys2_e342d0	\N	\N	\N	user	0	1	0	0	2026-06-11 08:41:25.363775+00	2026-06-11 08:41:25.363775+00	\N	f
2f62ff6f-3ea7-40bd-b97d-a3c72ceadf5e	3600d5ae-0e04-4a6c-9436-55699f2de0a8	\N	traveler_6ec2b7	\N	\N	\N	user	0	1	0	0	2026-06-12 05:21:58.507447+00	2026-06-12 05:21:58.507447+00	\N	t
c6987c3a-694a-4546-a3c9-35bd5a6912a2	a392bd34-3795-41ce-9d2e-3a43c9220ea2	phamduclong1411@gmail.com	phamduclong1411_191bc6	\N	\N	\N	user	0	1	0	0	2026-06-13 09:57:30.513128+00	2026-06-13 09:57:30.513128+00	\N	f
b2c86793-5da0-4967-919b-0d3753ea7d83	51d193d4-d889-4ee4-af7a-02e643d00703	\N	traveler_b0ac62	\N	\N	\N	user	0	1	0	0	2026-06-11 04:21:44.477008+00	2026-06-11 04:21:44.477008+00	\N	t
ab399319-768d-4f8b-b3d2-a77e76a9ca58	b91d6118-05e0-4e0f-9e09-7bc93bacb880	\N	traveler_b80ff8	\N	\N	\N	user	10	1	1	0	2026-06-11 07:16:06.250556+00	2026-06-12 06:09:58.66914+00	\N	t
fae451b5-149e-4490-a50e-53cb946bd425	753a48d6-dbfc-4917-af77-c123616683f8	\N	traveler_a9b303	\N	\N	\N	user	300000	5	0	0	2026-06-10 04:34:04.891452+00	2026-06-10 04:34:04.891452+00	\N	t
6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	20df83a9-2659-4754-87ba-21518a7c18fe	\N	traveler_5c5763	\N	\N	\N	user	300000	5	0	0	2026-06-10 04:38:53.619066+00	2026-06-10 04:38:53.619066+00	\N	t
826d1485-378e-4a4a-b1a8-bb1f6425c6d7	7bc60ae4-1e67-41a9-9b95-f27b33ecbf62	\N	traveler_33e8d2	\N	\N	\N	user	300000	5	0	0	2026-06-10 04:42:31.226927+00	2026-06-10 04:42:31.226927+00	\N	t
86c8251c-6780-46dc-9cde-30554403b8ca	f7df0f03-9ba8-4b47-8881-20e1f071a4f8	\N	traveler_e3c5c1	\N	\N	\N	user	0	1	0	0	2026-06-11 06:43:44.814197+00	2026-06-11 06:43:44.814197+00	\N	t
f0629d87-0f29-41cb-bb8a-5417d3bfc630	54e610db-68cd-4162-9714-db38ad23df40	\N	traveler_3e3ebb	\N	\N	\N	user	300000	5	0	0	2026-06-10 05:53:59.152621+00	2026-06-10 05:53:59.152621+00	\N	t
76fedef6-be58-4708-96f8-f281b0c691c0	b0309d1a-bee7-4ccd-957d-c86becc726ae	\N	traveler_a22977	\N	\N	\N	user	300000	5	0	0	2026-06-10 06:03:46.872517+00	2026-06-10 06:03:46.872517+00	\N	t
0342e751-0cee-4e4b-8724-3650c6d0d0ae	bbb0ada2-a3a0-4dfe-961a-959836b12f81	meekpz97@gmail.com	meekpz97_ad8aa1	Quang Hiền	\N		user	10	1	1	0	2026-06-10 10:32:12.154571+00	2026-06-14 09:09:59.480138+00	\N	f
7ff5f595-3918-47a2-9ab1-75c57d56ce1e	a204d21c-17fb-4eec-84b9-78b958f86f46	\N	traveler_91b34d	\N	\N	\N	user	0	1	0	0	2026-06-13 00:12:53.970892+00	2026-06-13 00:12:53.970892+00	\N	t
f03c0851-61bf-48e3-b074-73baedcc9a5e	b39a4e04-acf5-41fd-997d-526640e0584f	\N	traveler_f31bd3	\N	\N	\N	user	0	1	0	0	2026-06-10 07:40:30.911089+00	2026-06-10 07:40:30.911089+00	\N	t
72983125-1336-4911-93f1-58817ccf8795	06d23a82-219a-4d0b-8a9d-249bf291e615	\N	traveler_7ccfed	\N	\N	\N	user	30	1	3	0	2026-06-10 06:36:34.743084+00	2026-06-11 08:55:37.611256+00	\N	t
b5fb73dd-67f9-443b-b6db-68fd94f4bc93	f94554df-c3d8-4712-be57-9510b513c3af	\N	traveler_18cc74	\N	\N	\N	user	530	3	53	0	2026-06-12 06:49:07.623642+00	2026-06-12 08:17:01.080656+00	\N	t
d782bf6e-51ea-4f57-931f-5135650029fb	9eff9a68-8377-48e1-9055-7dfd329d45f3	\N	traveler_448836	\N	\N	\N	user	0	1	0	0	2026-06-10 10:01:07.868329+00	2026-06-10 10:01:07.868329+00	\N	t
9f7d5180-abe1-4c22-b640-1644c4f3640d	94e11b1c-7330-4214-a522-4abd72dafa27	\N	traveler_650aee	\N	\N	\N	user	20	1	2	0	2026-06-10 06:12:42.526825+00	2026-06-12 06:15:08.832733+00	\N	t
2e0bd89b-124e-47d5-9336-ea8f50d89950	3365234f-6ef5-4b87-a306-ce324a246577	\N	traveler_2da969	\N	\N	\N	user	300050	50	8	1	2026-06-10 04:15:14.079359+00	2026-06-10 13:12:43.852791+00	\N	t
335c2b65-8f3e-471e-9369-9ad607f08444	7a0e3d35-d34f-4656-8d93-1db86e55f68c	\N	traveler_6cdad6	\N	\N	\N	user	0	1	0	0	2026-06-10 13:33:26.371091+00	2026-06-10 13:33:26.371091+00	\N	t
4fe46da0-ef42-4d2a-ab95-7e580c1583f3	a1d7785a-e363-401b-b505-1cad4745a196	\N	traveler_dc35d1	\N	\N	\N	user	0	1	0	0	2026-06-10 13:35:55.976942+00	2026-06-10 13:35:55.976942+00	\N	t
1555459e-6a2f-49d8-b281-8ee5223a2072	669fac28-307a-4710-83a1-1ff49a1de9f5	\N	traveler_b5bbb2	\N	\N	\N	user	10	1	1	0	2026-06-12 06:44:59.950579+00	2026-06-12 06:53:02.926191+00	\N	t
efd3fee0-fe7e-4917-943f-a401124ca5b6	ec06f433-d526-4837-be90-6c5507c5b435	\N	traveler_7f7295	\N	\N	\N	user	300010	50	2	1	2026-06-10 04:42:44.296081+00	2026-06-10 14:35:45.370109+00	\N	t
d7ad428b-4598-43a0-a2dc-0c651b3933c4	7fca6250-e697-45f9-8b21-cbdfdea4da45	\N	traveler_d788a4	\N	\N	\N	user	0	1	0	0	2026-06-11 06:56:33.708939+00	2026-06-11 06:56:33.708939+00	\N	t
337f5196-baa4-4f2c-80ad-64d9f55529c8	18bd5b89-c11b-4fff-9c58-c4743cdced99	\N	traveler_9080fc	\N	\N	\N	user	0	1	0	0	2026-06-12 09:42:26.21682+00	2026-06-12 09:42:26.21682+00	\N	t
3775fc8d-a27d-44a4-8919-d87cbb6cc99d	16d81c04-9ef0-4307-b6be-af6286a10cf4	\N	traveler_09b925	\N	\N	\N	user	0	1	0	0	2026-06-13 10:30:59.547225+00	2026-06-13 10:30:59.547225+00	\N	t
dd01bb6f-ef9c-47bc-b316-7d7ab98b0352	36d717a2-6458-42c3-ab63-2421230477ba	\N	traveler_e8d165	\N	\N	\N	user	0	1	0	0	2026-06-12 07:34:48.271319+00	2026-06-12 07:34:48.271319+00	\N	t
37566c0e-3816-471a-8072-78adda056c22	e76f78a5-6a6d-4d75-9533-2406fbd544a5	\N	traveler_f74cc9	\N	\N	\N	user	0	1	0	0	2026-06-12 07:42:10.695054+00	2026-06-12 07:42:10.695054+00	\N	t
4a49a532-f103-4ab1-87d7-427dc79a6f3c	a188a19d-c9fe-4add-aa2d-4fa0050fd5b4	\N	traveler_cb6def	\N	\N	\N	user	0	1	0	0	2026-06-12 06:44:25.981631+00	2026-06-12 06:44:25.981631+00	\N	t
38b58a35-ff9c-4ab6-b505-4a51d2244f51	a62aa2bc-d2e6-40e9-9ec5-a6dd48bfe914	\N	traveler_a71fd6	\N	\N	\N	user	0	1	0	0	2026-06-12 08:11:41.19996+00	2026-06-12 08:11:41.19996+00	\N	t
26231d99-a413-420f-8f92-3a4e6f3fcd1d	57fa0346-f5e5-4c2e-b217-376147f2b0ef	\N	traveler_7471b8	\N	\N	\N	user	0	1	0	0	2026-06-12 08:03:53.916173+00	2026-06-12 08:03:53.916173+00	\N	t
c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	03b58870-37b2-431a-91b9-8d88747a5d11	\N	traveler_5075af	\N	\N	\N	user	0	1	0	0	2026-06-12 08:04:10.965297+00	2026-06-12 08:04:10.965297+00	\N	t
fd6e1226-381e-4430-a479-e8fda6be7ef2	b8ff4154-afb9-402e-b12f-e0db6b0357f3	\N	traveler_f03fb4	\N	\N	\N	user	0	1	0	0	2026-06-12 08:04:40.213325+00	2026-06-12 08:04:40.213325+00	\N	t
8c08b6ef-d71f-45f3-9d3a-5e673e162a90	124d00b9-b6a0-4813-9820-6e42268d7864	\N	traveler_330f5b	\N	\N	\N	user	0	1	0	0	2026-06-12 09:47:47.44194+00	2026-06-12 09:47:47.44194+00	\N	t
375f09b8-8450-4732-ae97-33fffcd95477	ae19d965-d835-4e48-bbe5-cd22f458181f	\N	traveler_c6c1e0	\N	\N	\N	user	0	1	0	0	2026-06-13 00:12:59.386174+00	2026-06-13 00:12:59.386174+00	\N	t
3f97bffb-d279-4536-8597-69622e964815	edf75b25-8658-45f9-a078-c8cb8ea5fbe9	testkenmen@gmail.com	testkenmen_57c5d4	\N	\N	\N	user	0	1	0	0	2026-06-13 11:06:16.250333+00	2026-06-13 11:06:16.250333+00	\N	f
53d98013-bbd3-423a-84ae-3803a841f72c	2fdf9677-2cc8-4776-98c8-aaa6d8f008d7	\N	traveler_676ff2	\N	\N	\N	user	0	1	0	0	2026-06-13 04:08:31.066767+00	2026-06-13 04:08:31.066767+00	\N	t
3d23104b-dce2-4205-833b-fa2c003e89f2	e3fe2440-b7d6-4001-be43-63c2d9ceaf1d	\N	traveler_8f70b4	\N	\N	\N	user	20	1	2	0	2026-06-12 09:49:59.718553+00	2026-06-13 03:54:30.417862+00	\N	t
7fac5feb-a2e6-4902-8941-8f14eadf8c7c	544434d3-ad2a-4364-a154-1f60154c603d	anotherminhnhat@gmail.com	anotherminhnhat_d55727	\N	\N	\N	user	10	1	1	0	2026-06-13 11:30:46.173664+00	2026-06-13 11:58:35.98258+00	\N	f
821768a5-8bb9-464e-a083-6225736a26b5	40514075-d5ed-4273-be49-e94d34e04613	danh98.it@gmail.com	danh98it_7dec3a	\N	\N	\N	user	60	1	6	0	2026-06-12 06:34:57.778943+00	2026-06-14 12:47:01.32722+00	\N	f
4f8f526b-cb59-411a-8689-bd75b8ad0138	d279074b-7967-4be0-9ac0-7f933dca23b6	lhongquan.1998@gmail.com	lhongquan1998_df6aba	Quill Luon	avatars/4f8f526b-cb59-411a-8689-bd75b8ad0138/33be665feea8f0c4.jpg	Senior fullstack developer	user	300630	50	63	1	2026-06-10 04:11:07.802904+00	2026-06-15 01:12:51.90938+00	\N	f
977cefb0-c1dc-4586-857b-efbce2509f04	1073e7a6-ddb4-4375-83c8-84d4eecc5475	\N	traveler_f10292	\N	\N	\N	user	10	1	1	0	2026-06-13 15:28:58.590977+00	2026-06-13 15:30:35.399311+00	\N	t
543eb38c-7878-41b0-b2e6-a58cbeb0fa06	9c41e93c-efeb-40fa-8c67-e8549d10d46a	lhquan1998@gmail.com	lhquan1998_1cf834	\N	\N	\N	user	10	1	1	0	2026-06-13 15:33:49.449567+00	2026-06-13 15:34:33.707464+00	\N	f
830dd861-36c0-4702-a433-81210387fff2	d3ae6305-a53b-4608-95ef-e17171e9b8db	\N	traveler_3898da	\N	\N	\N	user	0	1	0	0	2026-06-13 15:56:22.046154+00	2026-06-13 15:56:22.046154+00	\N	t
520f96ef-7103-414c-8400-da6b60663eb8	30e0a794-89eb-44df-bc4f-51b04ceba280	dangbaohan1006@gmail.com	dangbaohan1006_4a10b5	Dang Bao Han	avatars/520f96ef-7103-414c-8400-da6b60663eb8/530483fff9454b9e.jpg		user	200	2	20	1	2026-06-11 03:02:53.792899+00	2026-06-14 05:17:14.741574+00	\N	f
cd64452e-ed42-49d8-902c-eeca68d455cd	a2711dbd-2f52-4665-b394-c80212cad9e6	\N	traveler_05a8fa	\N	\N	\N	user	0	1	0	0	2026-06-14 10:21:37.608379+00	2026-06-14 10:21:37.608379+00	\N	t
01364b6d-0292-47cc-8f5a-7054d3652276	c6b1885d-c451-462d-afd1-d8a14082fc11	\N	traveler_7a280d	\N	\N	\N	user	0	1	0	0	2026-06-14 10:30:30.622635+00	2026-06-14 10:30:30.622635+00	\N	t
\.


--
-- Data for Name: journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."journeys" ("id", "user_id", "title", "description", "is_active", "started_at", "ended_at", "created_at", "updated_at", "deleted_at", "checkpoint_count", "total_xp") FROM stdin;
5dc977dc-507c-4f5f-a9f2-cf1960677f9a	4f8f526b-cb59-411a-8689-bd75b8ad0138	hello 1	\N	f	2026-06-10 13:12:29.130095+00	2026-06-10 13:12:57.206794+00	2026-06-10 13:12:28.210187+00	2026-06-10 13:12:57.206794+00	\N	1	10
0711ce09-3d55-48d5-91dc-9afcbdbe7736	efd3fee0-fe7e-4917-943f-a401124ca5b6	Tây Ninh	Go go	t	2026-06-10 14:35:46.127378+00	\N	2026-06-10 14:35:45.370109+00	2026-06-10 14:35:46.127378+00	\N	0	0
2237e37a-1a44-4f85-a88c-8dd8af79cce8	5508302b-91a6-477e-9a30-295a658630de	Sài Gòn 2 ngày 1 đêm	Xả stress cùng chuyến đi Sài Gòn, khám phá các quán cafe cùng mình nhé	t	2026-06-11 07:15:50.566102+00	\N	2026-06-11 07:15:48.883098+00	2026-06-11 07:15:50.566102+00	\N	0	0
f3b1d613-29d5-4316-b161-dcba5ddb6fea	4f8f526b-cb59-411a-8689-bd75b8ad0138	Đi thi	\N	f	2026-06-13 00:24:50.647448+00	2026-06-13 05:50:38.069293+00	2026-06-13 00:24:49.077089+00	2026-06-13 05:50:38.069293+00	\N	7	70
17942e4e-af8d-4720-987c-f13c96d68cbb	520f96ef-7103-414c-8400-da6b60663eb8	Tây Ninh	\N	f	2026-06-11 05:42:02.786331+00	2026-06-13 09:43:43.439342+00	2026-06-11 05:42:01.129537+00	2026-06-13 09:43:43.439342+00	\N	8	80
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."places" ("id", "name", "category", "lat", "lng", "address", "checkin_count", "created_at", "updated_at") FROM stdin;
d5fd56a0-1364-4e01-9601-947a8b1130f7	Copac square	view	10.762499681088485	106.70737943291152	OCB, 12, Tôn Đản, Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh, 72806, Việt Nam	2	2026-06-10 10:21:33.099303+00	2026-06-10 10:22:15.511471+00
6f8233cc-0dc8-452b-8b93-1774cff5176a	Nhà	other	11.248059	106.1337687	Phường Hòa Thành, Tỉnh Tây Ninh, 84060, Việt Nam	1	2026-06-10 14:15:36.147517+00	2026-06-10 14:15:36.147517+00
7ba8143f-f860-47e8-bb82-229a65ebb7c3	Điều hoà	view	10.825658887268691	106.68135092542539	Hẻm 263/11 Đường Số 6, Phường Hạnh Thông, Thủ Đức, Thành phố Hồ Chí Minh, 71400, Việt Nam	1	2026-06-10 14:34:43.881281+00	2026-06-10 14:34:43.881281+00
41bca866-1b4e-4e88-a05c-44bdc28889e0	Manabie	other	10.762351944818016	106.7072543160969	Copac Square, 12, Tôn Đản, Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh, 72806, Việt Nam	1	2026-06-11 03:17:10.45139+00	2026-06-11 03:17:10.45139+00
8be70a71-e9ef-42fc-8be2-513642cd2282	Đi làm	other	10.762350836189613	106.70725121412805	Copac Square, 12, Tôn Đản, Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh, 72806, Việt Nam	1	2026-06-11 04:04:01.105565+00	2026-06-11 04:04:01.105565+00
ecee12f2-c243-40df-8442-3caaa2f592b5	Nép cafe	cafe	11.35157913229531	106.20398669694133	Xã Dương Minh Châu, Tỉnh Tây Ninh, Việt Nam	1	2026-06-11 06:54:04.798039+00	2026-06-11 06:54:04.798039+00
c7e2978d-dc80-4b9b-8c9b-20b1cc0cd850	cà phê đánh rắm	cafe	10.799624945677294	106.64001060848184	Hẻm 449/23 Trường Chinh, Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh, 72110, Việt Nam	1	2026-06-11 08:54:47.431608+00	2026-06-11 08:54:47.431608+00
9aa1db06-63eb-4e68-91d4-67809cc05724	helxkxkxx	cafe	10.762466080109514	106.70736834491551	Thủ Đức, , , OCB, 12, Tôn Đản, Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh, 72806, Việt Nam	1	2026-06-11 10:13:36.272071+00	2026-06-11 10:13:36.272071+00
bb045aa0-55b5-420b-acb4-8ffe5b9bf396	asdaszxczxc	cafe	10.762515020797284	106.70736853807888	Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-11 10:17:35.99789+00	2026-06-11 10:17:35.99789+00
3d5375bf-2554-433b-8355-f61bf21a723f	Nghỉ ốm	other	10.825656578049829	106.68136057686556	Phường Hạnh Thông, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-12 05:16:55.201382+00	2026-06-12 05:16:55.201382+00
b3e57aa8-be9c-4265-ad33-51a4080eee4d	Royal Tea	cafe	11.3206594	106.1008181	Phường Tân Ninh, Tỉnh Tây Ninh, 84000	1	2026-06-12 06:09:58.66914+00	2026-06-12 06:09:58.66914+00
4a080187-60c3-4975-8f3a-8b473ad75a67	Chiều ở cty	view	10.77811811708833	106.71383656453631	Phường An Khánh, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-12 06:15:08.832733+00	2026-06-12 06:15:08.832733+00
cbe2b185-80d3-4a2d-b280-6931745a6dde	Vin com	other	10.778290101836522	106.70201807310254	Phường Sài Gòn, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-12 06:38:43.549114+00	2026-06-12 06:38:43.549114+00
e8b276ac-89f3-4bcb-bc97-eac59157ff76	Gần núi	cafe	11.338086	106.1294765	Phường Bình Minh, Tỉnh Tây Ninh, 80606, Việt Nam	2	2026-06-11 06:52:22.284961+00	2026-06-12 07:05:28.222873+00
eaaa1e6a-1335-4cfb-90e7-f3abddf90a22	we dont care	view	10.799624945554637	106.64001060851975	Hẻm 449/23 Trường Chinh, Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh, 72110, Việt Nam	3	2026-06-11 08:55:37.611256+00	2026-06-12 08:06:36.77677+00
c8eba829-6a62-4384-b79b-edffe949a94b	Trí Võ	cafe	10.799609114838818	106.64000213510062	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	2	2026-06-12 08:08:46.187046+00	2026-06-12 08:10:16.109526+00
df57cae3-6c7f-44a5-ab6e-c6ef2b35492b	Tri 2250	other	10.795060481126583	106.6426178064097	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:29.368034+00	2026-06-12 08:14:29.368034+00
b175d76e-9c45-4b18-9663-8007505cd613	Quill 7185	other	10.797201719227349	106.63628511896908	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:32.545991+00	2026-06-12 08:14:32.545991+00
d55e1989-76e4-4719-aa3d-2500f38abebc	Long 1604	other	10.800962581084516	106.63565761470849	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:35.746039+00	2026-06-12 08:14:35.746039+00
777de2bb-ecee-4107-a362-59a68d30b963	Quill 9630	other	10.803945777283817	106.63976944863523	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:38.878129+00	2026-06-12 08:14:38.878129+00
380b9724-d601-45c1-8b1d-de04e67e3065	Tri 8258	other	10.803356114500824	106.64004850483235	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:41.882882+00	2026-06-12 08:14:41.882882+00
8b39331e-9f22-4d7d-bd3e-656d28795600	Felix 9031	other	10.798534647045965	106.64013529642105	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:44.928648+00	2026-06-12 08:14:44.928648+00
4edc3398-8167-4f2f-b2fc-6e30634e2bc5	Quân 8567	other	10.801389281864921	106.64133084694038	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:48.141717+00	2026-06-12 08:14:48.141717+00
4316999e-9312-4624-b4bc-4d2e415aadd7	Quân 3336	other	10.801780695571424	106.63727115806047	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:51.089055+00	2026-06-12 08:14:51.089055+00
6d59322f-a608-498f-aa83-66f42b2e811b	Tri 5513	other	10.795558282333866	106.64069244587037	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:54.182072+00	2026-06-12 08:14:54.182072+00
dc8d9640-b44f-436e-a3de-b5aa91eeab52	Tri 5620	other	10.796963952463033	106.64130808679607	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:14:57.356708+00	2026-06-12 08:14:57.356708+00
4d5cdd55-7c63-4eed-8aa2-24145db08304	Felix 9237	other	10.795470271591205	106.6442499250376	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:00.532559+00	2026-06-12 08:15:00.532559+00
3d87239b-8da1-49b6-803b-9e22e3f9a169	Felix 3697	other	10.80002611260614	106.63963414999306	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:03.721306+00	2026-06-12 08:15:03.721306+00
a841829e-abf1-4b2e-ac38-dc86ac18a2fb	Felix 7794	other	10.79841576654104	106.64222823816625	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:07.015908+00	2026-06-12 08:15:07.015908+00
37d622a5-b905-478c-87c0-6b26699b90f6	Felix 5904	other	10.798662496790756	106.64338431193336	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:10.052289+00	2026-06-12 08:15:10.052289+00
87133ff2-cd5b-4f3c-93ed-49a0e370455d	Long 6951	other	10.79830771190004	106.63987865374233	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:13.253039+00	2026-06-12 08:15:13.253039+00
0ba9ffba-4a6d-4bff-894a-35ce66883165	Felix 8205	other	10.796419872592399	106.63828539865958	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:16.414262+00	2026-06-12 08:15:16.414262+00
60dd72e6-01a3-4c30-a157-8ac8d5a36989	Quill 2674	other	10.795137034805325	106.63973450430757	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:19.546133+00	2026-06-12 08:15:19.546133+00
6ba03ca0-39d8-4539-a2c2-663ba43c98d4	Quân 5361	other	10.79785331100901	106.63946751455806	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:22.718958+00	2026-06-12 08:15:22.718958+00
e33cf75f-e7bd-4122-b138-2a35be6db1f5	Quill 1676	other	10.801097747948406	106.63694337769431	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:25.766012+00	2026-06-12 08:15:25.766012+00
e1b14c95-8ebe-48a1-a4d8-f20524d20b8b	Quill 7158	other	10.804242711620283	106.6408043778245	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:28.926316+00	2026-06-12 08:15:28.926316+00
cb7b2aeb-c75d-4dda-bc5a-d8c5389f9b37	Tri 9211	other	10.80082642636369	106.63680987201987	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:31.948365+00	2026-06-12 08:15:31.948365+00
6991648c-ae02-4e29-997c-d4992c7609d0	Felix 3264	other	10.803476896977926	106.63962964459041	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:35.087881+00	2026-06-12 08:15:35.087881+00
c175fa0b-14da-4b97-ac12-8cf2f21374b8	Hải Vân	cafe	16.095594444444444	108.14605833333334	Hải Vân, Đà Nẵng	1	2026-06-13 14:57:47.528905+00	2026-06-13 14:57:47.528905+00
ef2bc19c-dbe5-44cd-9710-0ea90ad37abc	Tri 2915	other	10.796256185399999	106.63555571413075	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:38.130394+00	2026-06-12 08:15:38.130394+00
001b990a-0c44-4b37-8b71-8784d68b210f	Sáng đi thi	view	10.771188644351064	106.69684875534419	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-13 00:04:08.768212+00	2026-06-13 00:04:08.768212+00
4c212341-0fa0-41de-8d1c-81413f91aae3	Long 2482	other	10.798160129185977	106.63615426731411	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:41.148661+00	2026-06-12 08:15:41.148661+00
292687b7-4065-48ed-8dea-ed42d3877696	Long 2277	other	10.795449568126388	106.63700093382313	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:44.170934+00	2026-06-12 08:15:44.170934+00
83663729-c461-4a7f-abc7-c9b73a4df806	2 thanh niên ăn sáng	food	10.771430608117623	106.69739729404297	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-13 00:09:07.374413+00	2026-06-13 00:09:07.374413+00
663de604-1a69-4f8d-a072-f347a1c4078f	Long 2669	other	10.80165099803074	106.64358402954447	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:47.32381+00	2026-06-12 08:15:47.32381+00
9e8dc8e3-c5ee-4c83-b0a1-b9ac67c1d8e1	Quân 4112	other	10.800276671319242	106.63686163402701	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:50.243312+00	2026-06-12 08:15:50.243312+00
bd004aeb-3b4b-4d00-b587-c4bb3997b655	Circle k metro	cafe	10.7715761	106.6973329	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-13 00:10:54.476098+00	2026-06-13 00:10:54.476098+00
49453735-0cc0-4346-8ed5-9ff73ee8f303	Felix 735	other	10.798053240285517	106.63507456452103	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:53.401065+00	2026-06-12 08:15:53.401065+00
f18e2f26-4029-4147-91b9-d6d9d174c483	Quill 525	other	10.8004268223593	106.64460808297427	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:56.590915+00	2026-06-12 08:15:56.590915+00
843ab594-5c07-45e1-9a8a-fcf4bef6a286	Metro bến thành	cafe	10.771148503764644	106.69684608924746	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-13 00:20:05.275938+00	2026-06-13 00:20:05.275938+00
f430fa47-2ad5-4f69-ad89-c28bbd186a99	Tri 6186	other	10.796563418992125	106.6387669604677	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:15:59.474903+00	2026-06-12 08:15:59.474903+00
8ff756f4-8ed0-43da-9ad6-18d9b920298e	Long 377	other	10.796310527246986	106.64324842806671	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:02.604244+00	2026-06-12 08:16:02.604244+00
384e5a36-c6ec-4110-bc44-a58f02c484e1	Long 5959	other	10.799938464061478	106.63973867751429	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:05.733823+00	2026-06-12 08:16:05.733823+00
9a1f56b1-b54b-4af8-96a9-19eb546b1611	Felix 1548	other	10.796800563227132	106.63924409090791	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:08.889661+00	2026-06-12 08:16:08.889661+00
c9ecacef-d5ac-45ac-aa7c-25b2d4f54b5a	Metro opera house	cafe	10.7709518	106.6976631	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-13 00:31:58.289398+00	2026-06-13 00:31:58.289398+00
529fc487-05ab-42a8-b512-f8305d80b357	Tri 1881	other	10.801417881119079	106.63669138438999	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:12.054565+00	2026-06-12 08:16:12.054565+00
c6d2561d-beb2-4438-91f7-bd1ab5283023	Quill 3788	other	10.79612620839267	106.63652340414849	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:15.098072+00	2026-06-12 08:16:15.098072+00
e874006b-7e0d-495c-9b90-5d1f188b156d	Metro nga thủ đức	cafe	10.8452605	106.7706153	Phường Thủ Đức, Thủ Đức, Thành phố Hồ Chí Minh	1	2026-06-13 00:51:10.948132+00	2026-06-13 00:51:10.948132+00
0f0c614f-e7a6-4213-a3a0-86780accd525	Felix 7426	other	10.802411791894707	106.6435216141056	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:18.240586+00	2026-06-12 08:16:18.240586+00
3328d474-d615-48f4-b730-4d48f651cf23	Nộp bài	other	10.869951268179983	106.80362673009252	Phường Linh Xuân, Dĩ An, Thành phố Hồ Chí Minh	1	2026-06-13 01:57:38.300542+00	2026-06-13 01:57:38.300542+00
ec10e23b-3a29-4fc6-b4be-edbc9f78311a	Quân 5835	other	10.803828526255849	106.63842209676781	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:21.27225+00	2026-06-12 08:16:21.27225+00
856ee7c9-63e4-41d3-8dff-587cfcb02f32	Long 7331	other	10.80230023004109	106.64258396250204	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:24.226775+00	2026-06-12 08:16:24.226775+00
011dcbc1-5734-4166-8946-a09ca99ad961	Căn tin trường	food	10.869310825811345	106.80390607921926	Phường Linh Xuân, Dĩ An, Thành phố Hồ Chí Minh	1	2026-06-13 02:23:29.457635+00	2026-06-13 02:23:29.457635+00
8fe10ffb-307d-49c7-b7e6-ab978f3936bf	Quill 989	other	10.795173327551336	106.6447154452951	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:27.128199+00	2026-06-12 08:16:27.128199+00
c489c9ec-0f08-4310-8cc2-01ce5f7ff1fa	Long 1813	other	10.797131930202351	106.63773359602642	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:30.05569+00	2026-06-12 08:16:30.05569+00
6649b43c-ecf4-491b-ad47-f850ee126f7d	Felix 7651	other	10.797482127386807	106.63662425621308	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:33.061337+00	2026-06-12 08:16:33.061337+00
7313a06f-233b-47d2-8d01-ea142e466535	Long 2304	other	10.796064168503955	106.64469258797271	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:36.041758+00	2026-06-12 08:16:36.041758+00
e431a423-46c6-41db-aa92-e46b46f63391	Tri 1497	other	10.79622672731282	106.63843341250049	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:39.179698+00	2026-06-12 08:16:39.179698+00
ede5f873-0f28-43dd-826e-278d0f489f4a	Tri 5863	other	10.796918215852159	106.63649873395015	Phường Tân Sơn Nhì, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:42.194086+00	2026-06-12 08:16:42.194086+00
7b47fcf4-5956-4eb2-80f6-465463f49d63	Cafe	cafe	10.877693626857374	106.80909156043572	Đông Hòa, Tân Lập, Thành phố Hồ Chí Minh	2	2026-06-13 03:54:13.486253+00	2026-06-13 03:54:30.417862+00
e325562c-486f-4511-8a93-5c4d4b0e53eb	Felix 9265	other	10.804367667173194	106.6415550122982	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:48.493028+00	2026-06-12 08:16:48.493028+00
d2334b19-f843-4c8f-8881-20bd3dc66226	Ken House	cafe	10.877650332847711	106.80877670780129	Phường Đông Hòa, Dĩ An, Thành phố Hồ Chí Minh	3	2026-06-13 03:37:43.527982+00	2026-06-13 04:46:14.171615+00
52b15108-026c-4902-b27a-b7f9a2aeeb2f	Tri 7386	other	10.802195512407563	106.63902845553069	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:51.645999+00	2026-06-12 08:16:51.645999+00
3d9f0935-3b27-41c9-8a88-8a4c175188dc	Tri 3534	other	10.794704579535592	106.64379155757983	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:54.769688+00	2026-06-12 08:16:54.769688+00
6983baef-73cd-4838-a554-00508e92a639	UIT	cafe	10.8694564	106.8038775	Phường Linh Xuân, Dĩ An, Thành phố Hồ Chí Minh	2	2026-06-13 02:43:45.083023+00	2026-06-13 05:38:34.312155+00
577fd337-a91e-4673-85e1-dfe199cd8c2c	Long 9047	other	10.803076959010362	106.64387094428398	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	1	2026-06-12 08:16:57.947377+00	2026-06-12 08:16:57.947377+00
7c389560-3a0c-4ee0-b742-3c47213e65ac	Long 1912	other	10.800371718630082	106.64169446273864	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	2	2026-06-12 08:16:45.351376+00	2026-06-12 08:17:01.080656+00
84dfef48-ba9c-4910-97ef-8c5f4a2d802b	Metro Bến Thành	other	10.770809226876862	106.69746021794319	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	2	2026-06-13 00:25:08.650713+00	2026-06-13 07:19:07.446902+00
d72b8c91-fd05-4b0f-838e-21e5662caee6	Thành Vinh	cafe	18.666666666666668	105.68228888888889	Thành Vinh, Nghệ An	1	2026-06-13 14:58:50.963197+00	2026-06-13 14:58:50.963197+00
741d2f8a-d675-451a-99fc-a670248e6bc8	Linh Xuân	cafe	10.869646957319018	106.8040145405329	Linh Xuân, Khu phố 34, Thành phố Hồ Chí Minh	3	2026-06-13 05:37:54.390696+00	2026-06-13 05:50:13.986477+00
a11ba38b-06b0-4a0f-b59e-029a9af52985	Xóm Lèo	cafe	11.938255555555555	108.48216944444445	Xóm Lèo, Đà Lạt, Phường Xuân Trường - Đà Lạt, Lâm Đồng	1	2026-06-13 14:59:57.576271+00	2026-06-13 14:59:57.576271+00
49a6cd72-969f-4aff-b89d-2fe0a5671410	Linh Xuân	cafe	10.866394406194674	106.80123187611512	Linh Xuân, Khu phố 34, Thành phố Hồ Chí Minh	1	2026-06-13 06:44:42.530814+00	2026-06-13 06:44:42.530814+00
2bfa8978-1612-4b4b-a48d-37fd314add74	Lumiere	cafe	10.827972371100948	106.68237785600736	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	4	2026-06-13 08:57:28.337631+00	2026-06-13 09:19:38.630877+00
81f205ca-a8fd-47b4-8f80-a552d314c607	Bình Trưng	cafe	10.789588383894266	106.76883774628344	Bình Trưng, Phường Bình Trưng Tây, Thành phố Hồ Chí Minh	1	2026-06-13 15:30:35.399311+00	2026-06-13 15:30:35.399311+00
59c600f6-1e11-487c-b576-a52025c89306	Khánh Hội	cafe	10.75623888888889	106.70229444444445	Khánh Hội, Thành phố Hồ Chí Minh	16	2026-06-13 12:43:21.781056+00	2026-06-13 15:34:33.707464+00
500c63ca-67b9-4d31-8a74-464fb42d0821	Hạnh Thông	cafe	10.829372222222222	106.68908055555556	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	1	2026-06-13 18:04:01.433371+00	2026-06-13 18:04:01.433371+00
c780fc32-ed7c-4923-939c-79636590f2d8	Cầu Ông Lãnh	cafe	10.765730555555555	106.69558611111111	Cầu Ông Lãnh, Khu phố 34, Thành phố Hồ Chí Minh	1	2026-06-13 09:45:50.874101+00	2026-06-13 09:45:50.874101+00
325d8f03-599e-46fc-88e2-7293f4326f29	Quảng trường Vinh	other	18.67100779628919	105.69010880620078	\N	1	2026-06-14 02:20:15.075773+00	2026-06-14 02:20:15.075773+00
bf820592-8a88-43b3-af48-89022b720823	Đại	cafe	0	0	\N	1	2026-06-13 10:10:27.942766+00	2026-06-13 10:10:27.942766+00
569081ae-774d-4701-80df-7666cf435925	Bánh mì chén	food	10.828289574008434	106.68522019942152	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	1	2026-06-14 02:23:14.844405+00	2026-06-14 02:23:14.844405+00
2028a0b2-d11c-44df-8064-665c61692f5f	Tttt	cafe	0	0	\N	1	2026-06-13 10:11:24.236127+00	2026-06-13 10:11:24.236127+00
f3d34c28-a8ee-4585-9e7a-c23ce3ee39ef	Xíu mại chén	cafe	10.8283055	106.6852877	Hạnh Thông, Go Vap, Ho Chi Minh City	1	2026-06-14 02:23:41.102704+00	2026-06-14 02:23:41.102704+00
03645de9-ffdd-49ba-87f6-67867e232a03	Thạnh Mỹ Tây	other	10.798597222222222	106.72335833333334	Thạnh Mỹ Tây, Khu phố 49, Thành phố Hồ Chí Minh	1	2026-06-13 10:14:20.872575+00	2026-06-13 10:14:20.872575+00
ca2fafc9-edd5-4da5-9881-138c1dee961e	Bánh cuốn chưa tày	food	10.71191111111111	106.73710555555556	Phú Thuận, Thành phố Hồ Chí Minh	1	2026-06-14 02:56:02.00918+00	2026-06-14 02:56:02.00918+00
8c53634f-63b8-49bd-85f5-f92640620c84	Lều	cafe	10.828026077239574	106.68236412215542	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	2	2026-06-14 02:51:03.458637+00	2026-06-14 02:56:03.870432+00
29d67ed9-1790-4e2f-b669-85a39d5e4275	Xóm Chiếu	cafe	10.76238611111111	106.70726666666667	Xóm Chiếu, Thành phố Hồ Chí Minh	1	2026-06-13 10:51:08.827432+00	2026-06-13 10:51:08.827432+00
75accba6-5513-48d6-afea-42db75dd201a	Hạnh Thông	cafe	10.828108039545393	106.68232949781263	Hạnh Thông, Go Vap, Ho Chi Minh City	17	2026-06-13 09:19:58.441414+00	2026-06-14 03:07:53.473222+00
fbd918e2-e944-4390-8ad8-c8afc145ea41	Gò Vấp	cafe	10.837569444444446	106.66850277777779	Gò Vấp, Thành phố Hồ Chí Minh	1	2026-06-13 10:57:06.149215+00	2026-06-13 10:57:06.149215+00
3ec81222-ad12-4acb-ba81-e43f924a8445	BHD Quang Trung	cafe	10.8295559	106.6724816	Gò Vấp, Ho Chi Minh City	1	2026-06-14 05:17:14.741574+00	2026-06-14 05:17:14.741574+00
44dd1477-5627-4e02-bf3b-9cdfacc15b00	Nhà Hàng The Daun	view	10.770902321286004	106.69707445224896	Bến Thành, Khu phố 16, Thành phố Hồ Chí Minh	1	2026-06-14 06:28:12.789982+00	2026-06-14 06:28:12.789982+00
c2a95029-96c9-4b70-9dcd-a47a6045812b	Sân banh	other	16.034359484138502	108.22764227673238	\N	1	2026-06-13 11:58:35.98258+00	2026-06-13 11:58:35.98258+00
bb4bd209-0d67-4d6d-a0b5-521d6ebda9a0	T1	other	10.825641918722713	106.68136379694188	Hạnh Thông, Thành phố Hồ Chí Minh	1	2026-06-14 09:17:40.743538+00	2026-06-14 09:17:40.743538+00
3bc1d491-398f-4d78-88bc-d77a67d43903	Trung Tâm Văn Hóa Quận 7	nature	10.712094444444444	106.73751944444444	Phú Thuận, Thành phố Hồ Chí Minh	1	2026-06-14 09:35:21.292893+00	2026-06-14 09:35:21.292893+00
42ff463e-32ae-453a-ac75-05365677af48	Cube	cafe	10.756217	106.7023521	Khánh Hội, Ho Chi Minh City	1	2026-06-13 12:46:55.741181+00	2026-06-13 12:46:55.741181+00
61b11a2c-b0c7-4600-92c1-819170f5c628	Phú Thọ Hòa	food	10.793057869950426	106.61920948096564	Phú Thọ Hòa, Khu phố 16, Thành phố Hồ Chí Minh	1	2026-06-14 12:47:01.32722+00	2026-06-14 12:47:01.32722+00
79ee5560-b2a3-48fe-9c3b-5eee2a01c53f	CAFECUB	cafe	10.756202777777778	106.70227777777778	\N	2	2026-06-14 06:13:45.499523+00	2026-06-14 13:54:53.765035+00
b6295299-817b-4696-88aa-0d749356912d	Phúc Long	cafe	10.766712451465136	106.7064111127858	Nguyễn Tất Thành, Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh, 72806, Việt Nam	2	2026-06-11 00:36:00.765049+00	2026-06-15 00:07:51.188813+00
6a1e90a1-8640-4108-ba13-105970b7e525	Nha Rong Port Historic Site	nature	10.766925	106.70645277777778	Xóm Chiếu, Thành phố Hồ Chí Minh	1	2026-06-15 01:12:51.90938+00	2026-06-15 01:12:51.90938+00
\.


--
-- Data for Name: checkpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."checkpoints" ("id", "user_id", "name", "category", "note", "rating", "lat", "lng", "address", "xp_awarded", "created_at", "updated_at", "deleted_at", "place_id", "journey_id", "province", "image_key", "thumbnail_key", "view_count") FROM stdin;
db60f53b-9169-4e36-870a-dff93df31076	520f96ef-7103-414c-8400-da6b60663eb8	Gần núi	other	\N	4	11.3380691	106.1294806	Phường Bình Minh, Tỉnh Tây Ninh, 80606	10	2026-06-12 07:05:28.222873+00	2026-06-12 07:05:28.222873+00	\N	e8b276ac-89f3-4bcb-bc97-eac59157ff76	17942e4e-af8d-4720-987c-f13c96d68cbb	Tỉnh Tây Ninh	checkpoints/db60f53b-9169-4e36-870a-dff93df31076/e9eb18a41611449f.jpg	checkpoints/db60f53b-9169-4e36-870a-dff93df31076/e9eb18a41611449f.jpg	0
0c0d28cd-de2d-44ec-a224-609384b7e428	4f8f526b-cb59-411a-8689-bd75b8ad0138	Manabie	other	Đi làm	4	10.762351944818016	106.7072543160969	Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-11 03:17:10.45139+00	2026-06-11 03:17:10.45139+00	\N	41bca866-1b4e-4e88-a05c-44bdc28889e0	\N	Thủ Đức	checkpoints/0c0d28cd-de2d-44ec-a224-609384b7e428/c369ed977f0fbea2.jpg	checkpoints/0c0d28cd-de2d-44ec-a224-609384b7e428/c369ed977f0fbea2.jpg	0
dffbaf2c-ccdc-42c3-ae7a-0d70df60120e	72983125-1336-4911-93f1-58817ccf8795	cà phê đánh rắm	cafe	\N	4	10.799624945677294	106.64001060848184	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	10	2026-06-11 08:54:47.431608+00	2026-06-11 08:54:47.431608+00	\N	c7e2978d-dc80-4b9b-8c9b-20b1cc0cd850	\N	Thuận An	checkpoints/dffbaf2c-ccdc-42c3-ae7a-0d70df60120e/9af1c7395d25a8d3.jpg	checkpoints/dffbaf2c-ccdc-42c3-ae7a-0d70df60120e/9af1c7395d25a8d3.jpg	0
9dfbaad5-c798-4eba-828d-ed003326747f	72983125-1336-4911-93f1-58817ccf8795	we dont care	view	\N	4	10.799624945554637	106.64001060851975	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	10	2026-06-11 08:55:37.611256+00	2026-06-11 08:55:37.611256+00	\N	eaaa1e6a-1335-4cfb-90e7-f3abddf90a22	\N	Thuận An	checkpoints/9dfbaad5-c798-4eba-828d-ed003326747f/9a5f7f60285743e6.png	checkpoints/9dfbaad5-c798-4eba-828d-ed003326747f/9a5f7f60285743e6.png	0
81368c1f-0110-4ba9-8933-1ba8b8fe562d	2e0bd89b-124e-47d5-9336-ea8f50d89950	ok good	cafe	ok good	4	10.762463454752243	106.70737850318517	Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-10 08:20:46.354076+00	2026-06-10 08:20:46.354076+00	\N	\N	\N	Thủ Đức	checkpoints/81368c1f-0110-4ba9-8933-1ba8b8fe562d/27089cead120340b.jpg	checkpoints/81368c1f-0110-4ba9-8933-1ba8b8fe562d/27089cead120340b.jpg	0
d445f97b-60fa-4c9b-9c06-483cf5fcb589	4f8f526b-cb59-411a-8689-bd75b8ad0138	Copac Meo	view	Mèo ngủ meo meo	4	10.762430712018395	106.70734547701348	Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-10 10:22:15.511471+00	2026-06-10 10:22:15.511471+00	\N	d5fd56a0-1364-4e01-9601-947a8b1130f7	5dc977dc-507c-4f5f-a9f2-cf1960677f9a	Thủ Đức	checkpoints/d445f97b-60fa-4c9b-9c06-483cf5fcb589/1e075e4d83309a2f.jpg	checkpoints/d445f97b-60fa-4c9b-9c06-483cf5fcb589/1e075e4d83309a2f.jpg	0
18a2f48e-801b-447e-b931-0d207c5c2873	4f8f526b-cb59-411a-8689-bd75b8ad0138	Điều hoà	view	Quá tệ, k mát	4	10.825658887268691	106.68135092542539	Phường Hạnh Thông, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-10 14:34:43.881281+00	2026-06-10 14:34:43.881281+00	\N	7ba8143f-f860-47e8-bb82-229a65ebb7c3	\N	Thủ Đức	checkpoints/18a2f48e-801b-447e-b931-0d207c5c2873/60bedd0a6669c4b3.jpg	checkpoints/18a2f48e-801b-447e-b931-0d207c5c2873/60bedd0a6669c4b3.jpg	0
0d215a15-4c24-4204-9cfb-0b108bf1b2d9	4f8f526b-cb59-411a-8689-bd75b8ad0138	Nghỉ ốm	other	Nghỉ ốm mệt nhoài vibe coding	4	10.825656578049829	106.68136057686556	Phường Hạnh Thông, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-12 05:16:55.201382+00	2026-06-12 05:16:55.201382+00	\N	3d5375bf-2554-433b-8355-f61bf21a723f	\N	Thủ Đức	checkpoints/0d215a15-4c24-4204-9cfb-0b108bf1b2d9/47da06d6afcec0bc.jpg	checkpoints/0d215a15-4c24-4204-9cfb-0b108bf1b2d9/47da06d6afcec0bc.jpg	0
cbe9e96b-c7bd-4227-ab7d-46495aa98691	520f96ef-7103-414c-8400-da6b60663eb8	Hạnh Thông	cafe	\N	4	10.8281409	106.682345	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-13 10:11:46.639799+00	2026-06-13 10:11:46.639799+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Ho Chi Minh City	checkpoints/cbe9e96b-c7bd-4227-ab7d-46495aa98691/b8abb7430855d858.jpg	checkpoints/cbe9e96b-c7bd-4227-ab7d-46495aa98691/thumbnails/c27bee152c3b09ee.jpg	0
836d4d23-e5b5-491c-93fe-c09535a844a1	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	Thạc sĩ kinh tế	4	10.828016666666667	106.68237222222223	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 10:23:26.436017+00	2026-06-13 10:23:26.436017+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/5bd97db5555b4a66e40d18ddb154d8e3/f54c30903238f7b8.jpg	checkpoints/5bd97db5555b4a66e40d18ddb154d8e3/thumbnails/a8a22f3e7e68103d.jpg	0
e1575567-e47d-4c77-8ceb-33acd6b7b18e	4f8f526b-cb59-411a-8689-bd75b8ad0138	Xóm Chiếu	cafe	Lắc bạc đang bay	4	10.76238611111111	106.70726666666667	Xóm Chiếu, Thành phố Hồ Chí Minh	10	2026-06-13 10:51:08.827432+00	2026-06-13 10:51:08.827432+00	\N	29d67ed9-1790-4e2f-b669-85a39d5e4275	\N	Thành phố Hồ Chí Minh	checkpoints/3d1a12cc8cedc6f3c70f6a9c3dfcb02f/561a65aabb6a3959.jpg	checkpoints/3d1a12cc8cedc6f3c70f6a9c3dfcb02f/thumbnails/aadfe53b7d0e436c.jpg	0
198caa71-c383-45e1-ba15-92a6e106f82b	4f8f526b-cb59-411a-8689-bd75b8ad0138	Gò Vấp	cafe	Duy đánh cầu	4	10.837569444444446	106.66850277777779	Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 10:57:06.149215+00	2026-06-13 10:57:06.149215+00	\N	fbd918e2-e944-4390-8ad8-c8afc145ea41	\N	Thành phố Hồ Chí Minh	checkpoints/7d59f39cf4c44f3ea4d855e23e7981ac/fa08493200887383.jpg	checkpoints/7d59f39cf4c44f3ea4d855e23e7981ac/thumbnails/e80fc40a193da14f.jpg	0
23a66b75-6379-424c-beee-7ca1b67f88d8	520f96ef-7103-414c-8400-da6b60663eb8	Hạnh Thông	cafe	\N	4	10.8281382	106.6823807	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-13 11:42:51.043761+00	2026-06-13 11:42:51.043761+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Ho Chi Minh City	checkpoints/09abb9cdde2f534e9efee6085939fd53/369d114c9ac0e3b5.jpg	checkpoints/09abb9cdde2f534e9efee6085939fd53/thumbnails/fa622d553b9188d4.jpg	0
bdcdac6a-9985-4f70-b849-ac2c970097e0	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	\N	4	10.828016380550007	106.68237009626755	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 11:52:27.054817+00	2026-06-13 11:52:27.054817+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/e52cdaf1daa293c76d825ffc68469c26/4f0dee7ee7fa30eb.jpg	checkpoints/e52cdaf1daa293c76d825ffc68469c26/thumbnails/e70912439dc01a42.jpg	0
1121689a-e495-470b-acfa-dcfff9052bfa	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	food	\N	4	10.756213550570603	106.70234862147797	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 12:45:48.258892+00	2026-06-13 12:45:48.258892+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/302341c78119d88aaf8ecf56d8f2f093/b67f9e61692d3d35.jpg	checkpoints/302341c78119d88aaf8ecf56d8f2f093/thumbnails/f6ccc0874516c0b5.jpg	0
1da89fc4-97b6-4216-82ab-32af5a21189c	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	\N	4	10.75622378194721	106.70234161177356	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 12:46:00.261546+00	2026-06-13 12:46:00.261546+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/e69d1a310fde82f8bb06876ffe9271ea/b8aadb5ca4bf9b0a.jpg	checkpoints/e69d1a310fde82f8bb06876ffe9271ea/thumbnails/f7f269a011e5151b.jpg	0
4057ff11-0ea4-4dc3-8c1e-c1a76afc50b4	4f8f526b-cb59-411a-8689-bd75b8ad0138	Lều	cafe	\N	4	10.828026077239574	106.68236412215542	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-14 02:51:03.458637+00	2026-06-14 02:51:03.458637+00	\N	8c53634f-63b8-49bd-85f5-f92640620c84	\N	Thành phố Hồ Chí Minh	checkpoints/c1499e1bedc34a39a47df89b29b17a1c/050098588b2a7e29.jpg	checkpoints/c1499e1bedc34a39a47df89b29b17a1c/thumbnails/c35f61db577cb731.jpg	1
68a1c99f-67cf-4502-8901-176b96231b16	9f7d5180-abe1-4c22-b640-1644c4f3640d	Chiều ở cty	view	Ảnh cũ hôm qua	4	10.77811811708833	106.71383656453631	Phường An Khánh, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-12 06:15:08.832733+00	2026-06-12 06:15:08.832733+00	\N	4a080187-60c3-4975-8f3a-8b473ad75a67	\N	Thủ Đức	checkpoints/68a1c99f-67cf-4502-8901-176b96231b16/006839bbf6ad7d47.png	checkpoints/68a1c99f-67cf-4502-8901-176b96231b16/006839bbf6ad7d47.png	1
2594bd69-b389-49b0-9357-45462bf70c82	520f96ef-7103-414c-8400-da6b60663eb8	Hạnh Thông	cafe	\N	4	10.8281371	106.6823644	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-13 10:43:26.024617+00	2026-06-13 10:43:26.024617+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Ho Chi Minh City	checkpoints/2e0de650fd810f8d17ba30487ea50d7d/756f370b2d374d2c.jpg	checkpoints/2e0de650fd810f8d17ba30487ea50d7d/thumbnails/af6cb9b11454c970.jpg	0
22358dcd-0cd5-437d-b680-42f69b96c21d	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	\N	4	10.82801638404633	106.68237030796463	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 11:06:06.000929+00	2026-06-13 11:06:06.000929+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/a5566c54b2914068bfd1e85315f1a548/4593abc5f7f4bfd4.jpg	checkpoints/a5566c54b2914068bfd1e85315f1a548/thumbnails/0fceb3d4d642e330.jpg	0
5f9404df-0712-42c8-9c28-bcc79af469f4	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	\N	4	10.756210282279401	106.70232201973714	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 12:44:27.626505+00	2026-06-13 12:44:27.626505+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/64e1495d88598475a4485ed0fcba9f1d/d0bd6240dcf3517c.jpg	checkpoints/64e1495d88598475a4485ed0fcba9f1d/thumbnails/5caac7a86333d705.jpg	0
01a1e767-e0ff-4fe6-92e0-ef7c429d2146	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	Đang làm thạc sĩ kinh tế	4	10.756336738794113	106.70232028382567	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 12:44:45.216893+00	2026-06-13 12:44:45.216893+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/70d3e8ddc3caadc4c031e267eacea91b/e4ef66beec0762f7.jpg	checkpoints/70d3e8ddc3caadc4c031e267eacea91b/thumbnails/68f313ef146e03d6.jpg	0
f12b1483-d695-4115-9e9e-d179ae1e9efd	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	\N	4	10.756204263282093	106.70233552520968	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 14:19:56.884073+00	2026-06-13 14:19:56.884073+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/d50bb4f529dd785c51825edeb628f3af/8b106210747b0f50.jpg	checkpoints/d50bb4f529dd785c51825edeb628f3af/thumbnails/9d768075824e8dae.jpg	0
9c9ad02b-0ed1-478f-986b-653c3dd1ac3b	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	2222	4	10.756045691380406	106.70241824898963	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 15:22:37.078623+00	2026-06-13 15:22:37.078623+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/c5739c123383f403c591609f2b3a1835/f000d76845d058fe.jpg	checkpoints/c5739c123383f403c591609f2b3a1835/thumbnails/0de3d4ba08aa618e.jpg	0
84e72417-977b-4f43-bbff-b61880aae25d	977cefb0-c1dc-4586-857b-efbce2509f04	Bình Trưng	cafe	Quá ngon	4	10.789588383894266	106.76883774628344	Bình Trưng, Phường Bình Trưng Tây, Thành phố Hồ Chí Minh	10	2026-06-13 15:30:35.399311+00	2026-06-13 15:30:35.399311+00	\N	81f205ca-a8fd-47b4-8f80-a552d314c607	\N	Thành phố Hồ Chí Minh	checkpoints/3d08b9155c4fe11a367f5377eddaffcd/573265d20bf8a733.jpg	checkpoints/3d08b9155c4fe11a367f5377eddaffcd/thumbnails/8b3f1bbaf25d3985.jpg	2
4d123179-5094-445f-9e87-363475923d1c	4f8f526b-cb59-411a-8689-bd75b8ad0138	Trung Tâm Văn Hóa Quận 7	nature	Bắn cung	\N	10.712094444444444	106.73751944444444	Phú Thuận, Thành phố Hồ Chí Minh	10	2026-06-14 09:35:21.292893+00	2026-06-14 09:35:21.292893+00	\N	3bc1d491-398f-4d78-88bc-d77a67d43903	\N	Thành phố Hồ Chí Minh	checkpoints/8f53c65f26197d9a6ef99b9fbcb2871e/7193b3c5abf8b5ae.jpg	checkpoints/8f53c65f26197d9a6ef99b9fbcb2871e/thumbnails/813076d51d7f5b97.jpg	51
743bdc55-eb93-4ced-ab5d-6debfa081ed8	4f8f526b-cb59-411a-8689-bd75b8ad0138	T1	other	\N	\N	10.825641918722713	106.68136379694188	Hạnh Thông, Thành phố Hồ Chí Minh	10	2026-06-14 09:17:40.743538+00	2026-06-14 09:17:40.743538+00	\N	bb4bd209-0d67-4d6d-a0b5-521d6ebda9a0	\N	Thành phố Hồ Chí Minh	checkpoints/ed32e77f2a938afa37dee625e55486ca/dcebaf2aad187e4d.jpg	checkpoints/ed32e77f2a938afa37dee625e55486ca/thumbnails/11326459fbe8c6db.jpg	13
2b504bd1-3fa3-4883-a92c-0be5744b2f95	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hải Vân	cafe	Chill	5	16.095594444444444	108.14605833333334	Hải Vân, Đà Nẵng	10	2026-06-13 14:57:47.528905+00	2026-06-13 14:57:47.528905+00	\N	c175fa0b-14da-4b97-ac12-8cf2f21374b8	\N	Đà Nẵng	checkpoints/e16f0ed51a9796382ff1cc231a942ec5/f541fba48a19cdcf.jpg	checkpoints/e16f0ed51a9796382ff1cc231a942ec5/thumbnails/28e3aa20d4984e81.jpg	0
2b26e607-a208-472b-999a-388fb69f4ad8	4f8f526b-cb59-411a-8689-bd75b8ad0138	Xóm Lèo	cafe	\N	4	11.938255555555555	108.48216944444445	Xóm Lèo, Đà Lạt, Phường Xuân Trường - Đà Lạt, Lâm Đồng	10	2026-06-13 14:59:57.576271+00	2026-06-13 14:59:57.576271+00	\N	a11ba38b-06b0-4a0f-b59e-029a9af52985	\N	Lâm Đồng	checkpoints/bb8805d7b600be79852c3762f1cd111a/a48edb8983e55170.jpg	checkpoints/bb8805d7b600be79852c3762f1cd111a/thumbnails/ec073eff15d0aa86.jpg	3
51da2bc0-75fd-407e-a4c8-7dcb9bdb8935	543eb38c-7878-41b0-b2e6-a58cbeb0fa06	Khánh Hội	cafe	\N	4	10.75604570143413	106.70241828771611	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 15:34:33.707464+00	2026-06-13 15:34:33.707464+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/bb6c8d077616318fbe315091f2fa8800/54547041eaf11efb.jpg	checkpoints/bb6c8d077616318fbe315091f2fa8800/thumbnails/de19f089956367c8.jpg	1
5ed40ac8-ad29-4a99-9f37-f9aecc71eaa8	520f96ef-7103-414c-8400-da6b60663eb8	Đại	cafe	\N	4	0	0	\N	10	2026-06-13 10:10:27.942766+00	2026-06-13 10:10:27.942766+00	\N	bf820592-8a88-43b3-af48-89022b720823	\N	\N	checkpoints/5ed40ac8-ad29-4a99-9f37-f9aecc71eaa8/1459fa9950b5a22a.jpg	checkpoints/5ed40ac8-ad29-4a99-9f37-f9aecc71eaa8/thumbnails/fcda3bafe6a87d93.jpg	0
c613718b-aa46-4b20-ae44-740071ccd596	520f96ef-7103-414c-8400-da6b60663eb8	BHD Quang Trung	cafe	Xem phim	4	10.8295559	106.6724816	Gò Vấp, Ho Chi Minh City	10	2026-06-14 05:17:14.741574+00	2026-06-14 05:17:14.741574+00	\N	3ec81222-ad12-4acb-ba81-e43f924a8445	\N	Ho Chi Minh City	checkpoints/20a2380e195554c554ffdc37e226e80b/ccd7b10803002779.jpg	checkpoints/20a2380e195554c554ffdc37e226e80b/thumbnails/3b99b60921b6a9d3.jpg	30
f8bb7c1e-13fa-4d93-8027-749a599ca4d2	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	\N	4	10.756188249779292	106.70240602897435	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 13:03:19.697583+00	2026-06-13 13:03:19.697583+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/269e3587210166266019bd7be1f0fd72/5af9c73a1b5b6596.jpg	checkpoints/269e3587210166266019bd7be1f0fd72/thumbnails/e12d2f53d335e556.jpg	0
919c7081-87b7-4a22-91a3-efe52abb824e	4f8f526b-cb59-411a-8689-bd75b8ad0138	Vĩnh Hội	cafe	\N	4	10.756131375115642	106.70223064336149	Vĩnh Hội, Hồ Chí Minh, Thành phố Hồ Chí Minh	10	2026-06-13 14:20:14.338765+00	2026-06-13 14:20:14.338765+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/12d4485d77f34e90f85bc08ffdff7589/441de9c87ef29d3b.jpg	checkpoints/12d4485d77f34e90f85bc08ffdff7589/thumbnails/2e36c24829b18ecf.jpg	0
135f06b2-7a4c-453d-af79-860c2a380bd4	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	Thạc sĩ Kinh tế đang làm bài	4	10.828016370461853	106.6823703097415	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 10:23:54.867309+00	2026-06-13 10:23:54.867309+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/440b648011e638ebf11d931e0bf15389/db3a793458b8974f.jpg	checkpoints/440b648011e638ebf11d931e0bf15389/thumbnails/395de33bb08e5937.jpg	0
229f2b25-a925-4b3a-97ed-df0fb47c77fb	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	\N	4	10.828020929786602	106.68236850502026	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 11:51:06.746641+00	2026-06-13 11:51:06.746641+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/c76086b10cf2a80e9cc7bb60b8ae2cbf/f23c2736d98ca258.jpg	checkpoints/c76086b10cf2a80e9cc7bb60b8ae2cbf/thumbnails/32ddc2ac37725bd6.jpg	0
0f4299d0-8d64-4316-a42c-347de07d7c9d	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	Vẫn là thạc sĩ kinh tế	4	10.756131100175391	106.702451458514	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 14:40:05.073618+00	2026-06-13 14:40:05.073618+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/c5192bd217947e474dcc8e7e4f91d81c/af0e29e4d7c02593.jpg	checkpoints/c5192bd217947e474dcc8e7e4f91d81c/thumbnails/06a46a1eba45fcf5.jpg	0
703acff7-ee10-48e1-bbe9-31804de951b0	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	\N	4	10.756139288308471	106.70244091676838	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 14:40:12.234655+00	2026-06-13 14:40:12.234655+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/bc3c3075ca44f371e10e2e19a2d7cc2d/7778aa9811aca734.jpg	checkpoints/bc3c3075ca44f371e10e2e19a2d7cc2d/thumbnails/1b0f7cae6f603434.jpg	0
0f23717b-991b-486a-b900-cd7c3a658560	4f8f526b-cb59-411a-8689-bd75b8ad0138	Sáng đi thi	view	\N	4	10.771188644351064	106.69684875534419	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-13 00:04:08.768212+00	2026-06-13 00:04:08.768212+00	\N	001b990a-0c44-4b37-8b71-8784d68b210f	\N	Thủ Đức	checkpoints/0f23717b-991b-486a-b900-cd7c3a658560/1baac0539adb96d3.jpg	checkpoints/0f23717b-991b-486a-b900-cd7c3a658560/1baac0539adb96d3.jpg	0
5ac8049d-6e73-4256-83fe-735670ebc85f	4f8f526b-cb59-411a-8689-bd75b8ad0138	2 thanh niên ăn sáng	food	\N	4	10.771430608117623	106.69739729404297	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-13 00:09:07.374413+00	2026-06-13 00:09:07.374413+00	\N	83663729-c461-4a7f-abc7-c9b73a4df806	\N	Thủ Đức	checkpoints/5ac8049d-6e73-4256-83fe-735670ebc85f/c99d822ec28f119b.jpg	checkpoints/5ac8049d-6e73-4256-83fe-735670ebc85f/c99d822ec28f119b.jpg	0
33a46cbf-f94b-4415-aa03-95be955c15e5	7fac5feb-a2e6-4902-8941-8f14eadf8c7c	Sân banh	other	Đá như l	4	16.034359484138502	108.22764227673238	\N	10	2026-06-13 11:58:35.98258+00	2026-06-13 11:58:35.98258+00	\N	c2a95029-96c9-4b70-9dcd-a47a6045812b	\N	\N	checkpoints/7f9767cbd28bff6a92dad716fa947adb/659cce893dab2075.jpg	checkpoints/7f9767cbd28bff6a92dad716fa947adb/thumbnails/f72256c264de6d7a.jpg	1
f1f41aeb-2212-4d43-b8b7-8de89432ac81	4f8f526b-cb59-411a-8689-bd75b8ad0138	Bánh cuốn chưa tày	food	\N	4	10.71191111111111	106.73710555555556	Phú Thuận, Thành phố Hồ Chí Minh	10	2026-06-14 02:56:02.00918+00	2026-06-14 02:56:02.00918+00	\N	ca2fafc9-edd5-4da5-9881-138c1dee961e	\N	Thành phố Hồ Chí Minh	checkpoints/f3b6547a7c19f2e8db8d6bd1d5fac23c/dab9e368d1954406.jpg	checkpoints/f3b6547a7c19f2e8db8d6bd1d5fac23c/thumbnails/475808ec24182d1b.jpg	3
cea21473-bd93-40f5-a8c3-5e7ea62c9e90	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	Bảo Hân 1:00AM	4	10.829372222222222	106.68908055555556	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 18:04:01.433371+00	2026-06-13 18:04:01.433371+00	\N	500c63ca-67b9-4d31-8a74-464fb42d0821	\N	Thành phố Hồ Chí Minh	checkpoints/a96e177ab1d59fb680862f543c4515c3/4e59e6620180e8fa.jpg	checkpoints/a96e177ab1d59fb680862f543c4515c3/thumbnails/78e75500b853442c.jpg	6
0afece2b-dc4e-4eef-9cda-fe70083641ef	4f8f526b-cb59-411a-8689-bd75b8ad0138	Thạnh Mỹ Tây	other	Học trên Metro	4	10.798597222222222	106.72335833333334	Thạnh Mỹ Tây, Khu phố 49, Thành phố Hồ Chí Minh	10	2026-06-13 10:14:20.872575+00	2026-06-13 10:14:20.872575+00	\N	03645de9-ffdd-49ba-87f6-67867e232a03	\N	Thành phố Hồ Chí Minh	checkpoints/0afece2b-dc4e-4eef-9cda-fe70083641ef/bd34d084487587c8.jpg	checkpoints/0afece2b-dc4e-4eef-9cda-fe70083641ef/thumbnails/1b32781ae356e5f4.jpg	3
b089a495-2a03-409b-bf09-8c5a2d76d689	520f96ef-7103-414c-8400-da6b60663eb8	Xíu mại chén	cafe	Ngon	4	10.8283055	106.6852877	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-14 02:23:41.102704+00	2026-06-14 02:23:41.102704+00	\N	f3d34c28-a8ee-4585-9e7a-c23ce3ee39ef	\N	Ho Chi Minh City	checkpoints/cec1990ce3bee61472437ce0bc78fd58/b94d1a8fb9b27abd.jpg	checkpoints/cec1990ce3bee61472437ce0bc78fd58/thumbnails/e21acb4700c0df68.jpg	5
965ea106-0a95-42dd-b564-a45e697441f2	0342e751-0cee-4e4b-8724-3650c6d0d0ae	Quảng trường Vinh	other	Chương trình Mái ấm gia đình Việt	4	18.67100779628919	105.69010880620078	\N	10	2026-06-14 02:20:15.075773+00	2026-06-14 02:20:15.075773+00	\N	325d8f03-599e-46fc-88e2-7293f4326f29	\N	\N	checkpoints/01ca855089a25c324a5e248360dabb25/02932d041431192b.jpg	checkpoints/01ca855089a25c324a5e248360dabb25/thumbnails/97913107276f9c60.jpg	19
6e4f0460-7547-49f3-85d9-0c094586636d	4f8f526b-cb59-411a-8689-bd75b8ad0138	Thành Vinh	cafe	\N	4	18.666666666666668	105.68228888888889	Thành Vinh, Nghệ An	10	2026-06-13 14:58:50.963197+00	2026-06-13 14:58:50.963197+00	\N	d72b8c91-fd05-4b0f-838e-21e5662caee6	\N	Nghệ An	checkpoints/9e292b5c1ca145ecd33f0e6d476ad9ae/f08ac75d2001e5f7.jpg	checkpoints/9e292b5c1ca145ecd33f0e6d476ad9ae/thumbnails/5abfff42a57794a7.jpg	3
3de506e2-be3f-457a-b251-e0b41c0a673d	efd3fee0-fe7e-4917-943f-a401124ca5b6	Nhà	other	\N	4	11.248059	106.1337687	Phường Hòa Thành, Tỉnh Tây Ninh	10	2026-06-10 14:15:36.147517+00	2026-06-10 14:15:36.147517+00	\N	6f8233cc-0dc8-452b-8b93-1774cff5176a	\N	Tỉnh Tây Ninh	checkpoints/3de506e2-be3f-457a-b251-e0b41c0a673d/3028f96df95203f0.jpg	checkpoints/3de506e2-be3f-457a-b251-e0b41c0a673d/3028f96df95203f0.jpg	1
c113752c-5282-4fbd-ad74-d4d279ca9ccc	821768a5-8bb9-464e-a083-6225736a26b5	Vĩnh Hội	cafe	22:22	4	10.756116343500501	106.70259372451275	Vĩnh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 15:23:05.951005+00	2026-06-13 15:23:05.951005+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/3bb73df89c744d4e5d23740367195692/211c534ed419456b.jpg	checkpoints/3bb73df89c744d4e5d23740367195692/thumbnails/213e41260019f7f6.jpg	2
3b6194e0-640b-4db8-b155-209615c9a050	520f96ef-7103-414c-8400-da6b60663eb8	UIT	cafe	Thi lần 2	4	10.869605	106.8042738	Linh Xuân, Khu phố 34, Ho Chi Minh City	10	2026-06-13 05:38:34.312155+00	2026-06-13 05:38:34.312155+00	\N	6983baef-73cd-4838-a554-00508e92a639	\N	Ho Chi Minh City	checkpoints/3b6194e0-640b-4db8-b155-209615c9a050/264762f118a6e099.jpg	checkpoints/3b6194e0-640b-4db8-b155-209615c9a050/thumbnails/53b80473a6b79c12.jpg	0
38dac9e2-f37b-43b5-a909-9dffee8c0da2	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	\N	4	10.828108039545393	106.68232949781263	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-13 09:19:58.441414+00	2026-06-13 09:19:58.441414+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Ho Chi Minh City	checkpoints/38dac9e2-f37b-43b5-a909-9dffee8c0da2/c60161d1b2886c85.jpg	checkpoints/38dac9e2-f37b-43b5-a909-9dffee8c0da2/thumbnails/10f4083bd02eceb6.jpg	0
d2d21695-e680-45cf-b808-3f7e656412ba	520f96ef-7103-414c-8400-da6b60663eb8	Circle k metro	cafe	Ok	4	10.7715761	106.6973329	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-13 00:10:54.476098+00	2026-06-13 00:10:54.476098+00	\N	bd004aeb-3b4b-4d00-b587-c4bb3997b655	17942e4e-af8d-4720-987c-f13c96d68cbb	Thủ Đức	checkpoints/d2d21695-e680-45cf-b808-3f7e656412ba/3d12984171358b04.jpg	checkpoints/d2d21695-e680-45cf-b808-3f7e656412ba/3d12984171358b04.jpg	0
e3bdc6c2-da4a-4e34-89a7-b3e76e7ec740	4f8f526b-cb59-411a-8689-bd75b8ad0138	Metro bến thành	cafe	\N	4	10.771148503764644	106.69684608924746	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-13 00:20:05.275938+00	2026-06-13 00:20:05.275938+00	\N	843ab594-5c07-45e1-9a8a-fcf4bef6a286	\N	Thủ Đức	checkpoints/e3bdc6c2-da4a-4e34-89a7-b3e76e7ec740/62aed9f61aa0994f.jpg	checkpoints/e3bdc6c2-da4a-4e34-89a7-b3e76e7ec740/62aed9f61aa0994f.jpg	0
30f2aaa2-8ed4-481e-adb1-2cb92e4616c1	4f8f526b-cb59-411a-8689-bd75b8ad0138	Metro Bến Thành	other	\N	4	10.770809226876862	106.69746021794319	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-13 00:25:08.650713+00	2026-06-13 00:25:08.650713+00	\N	84dfef48-ba9c-4910-97ef-8c5f4a2d802b	f3b1d613-29d5-4316-b161-dcba5ddb6fea	Thủ Đức	checkpoints/30f2aaa2-8ed4-481e-adb1-2cb92e4616c1/e309d4ed4bf50cf4.jpg	checkpoints/30f2aaa2-8ed4-481e-adb1-2cb92e4616c1/e309d4ed4bf50cf4.jpg	0
0ac5a013-8318-4bd8-bbc5-d05419a46837	520f96ef-7103-414c-8400-da6b60663eb8	Metro opera house	cafe	\N	4	10.7709518	106.6976631	Phường Bến Thành, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-13 00:31:58.289398+00	2026-06-13 00:31:58.289398+00	\N	c9ecacef-d5ac-45ac-aa7c-25b2d4f54b5a	17942e4e-af8d-4720-987c-f13c96d68cbb	Thủ Đức	checkpoints/0ac5a013-8318-4bd8-bbc5-d05419a46837/d8f7a787c1d1cfdf.jpg	checkpoints/0ac5a013-8318-4bd8-bbc5-d05419a46837/d8f7a787c1d1cfdf.jpg	0
ab51e919-723c-4a4b-8168-bc0357af2cff	4f8f526b-cb59-411a-8689-bd75b8ad0138	Nộp bài	other	Có làm đc moẹ đâu	4	10.869951268179983	106.80362673009252	Phường Linh Xuân, Dĩ An, Thành phố Hồ Chí Minh	10	2026-06-13 01:57:38.300542+00	2026-06-13 01:57:38.300542+00	\N	3328d474-d615-48f4-b730-4d48f651cf23	f3b1d613-29d5-4316-b161-dcba5ddb6fea	Dĩ An	checkpoints/ab51e919-723c-4a4b-8168-bc0357af2cff/1a05e08692c8e847.jpg	checkpoints/ab51e919-723c-4a4b-8168-bc0357af2cff/1a05e08692c8e847.jpg	0
55cc89e6-0a8a-46a7-8ae6-f385e857ca15	4f8f526b-cb59-411a-8689-bd75b8ad0138	Căn tin trường	food	\N	4	10.869310825811345	106.80390607921926	Phường Linh Xuân, Dĩ An, Thành phố Hồ Chí Minh	10	2026-06-13 02:23:29.457635+00	2026-06-13 02:23:29.457635+00	\N	011dcbc1-5734-4166-8946-a09ca99ad961	f3b1d613-29d5-4316-b161-dcba5ddb6fea	Dĩ An	checkpoints/55cc89e6-0a8a-46a7-8ae6-f385e857ca15/56cf7ab45a145f4c.jpg	checkpoints/55cc89e6-0a8a-46a7-8ae6-f385e857ca15/56cf7ab45a145f4c.jpg	0
73b152a9-eff3-4a27-8b39-58e195e5398a	4f8f526b-cb59-411a-8689-bd75b8ad0138	Ken House	cafe	Nghỉ giữa môn	4	10.877650332847711	106.80877670780129	Phường Đông Hòa, Dĩ An, Thành phố Hồ Chí Minh	10	2026-06-13 03:37:43.527982+00	2026-06-13 03:37:43.527982+00	\N	d2334b19-f843-4c8f-8881-20bd3dc66226	f3b1d613-29d5-4316-b161-dcba5ddb6fea	Dĩ An	checkpoints/73b152a9-eff3-4a27-8b39-58e195e5398a/8fa990300517890e.jpg	checkpoints/73b152a9-eff3-4a27-8b39-58e195e5398a/8fa990300517890e.jpg	0
9746dc15-86da-40be-b076-e14d65cc6557	3d23104b-dce2-4205-833b-fa2c003e89f2	Cafe	cafe	\N	4	10.877693626857374	106.80909156043572	Đông Hòa, Tân Lập, Thành phố Hồ Chí Minh	10	2026-06-13 03:54:13.486253+00	2026-06-13 03:54:13.486253+00	\N	7b47fcf4-5956-4eb2-80f6-465463f49d63	\N	Thành phố Hồ Chí Minh	checkpoints/9746dc15-86da-40be-b076-e14d65cc6557/f4b39fa136466caf.jpg	checkpoints/9746dc15-86da-40be-b076-e14d65cc6557/f4b39fa136466caf.jpg	0
3e30c7e3-c071-45e1-bc52-0eb348c23aa8	3d23104b-dce2-4205-833b-fa2c003e89f2	Cafe	cafe	\N	4	10.877631837596816	106.80878262493029	Đông Hòa, Khu đô thị Đại học Quốc gia Thành phố Hồ Chí Minh, Thành phố Hồ Chí Minh	10	2026-06-13 03:54:30.417862+00	2026-06-13 03:54:30.417862+00	\N	7b47fcf4-5956-4eb2-80f6-465463f49d63	\N	Thành phố Hồ Chí Minh	checkpoints/3e30c7e3-c071-45e1-bc52-0eb348c23aa8/ca7446add0d820d0.jpg	checkpoints/3e30c7e3-c071-45e1-bc52-0eb348c23aa8/ca7446add0d820d0.jpg	0
666739ff-00d9-49d2-b5be-ce2063d5acd3	4f8f526b-cb59-411a-8689-bd75b8ad0138	Ken Housi	cafe	\N	4	10.877632221212647	106.80870251934631	Đông Hòa, Khu đô thị Đại học Quốc gia Thành phố Hồ Chí Minh, Thành phố Hồ Chí Minh	10	2026-06-13 04:46:14.171615+00	2026-06-13 04:46:14.171615+00	\N	d2334b19-f843-4c8f-8881-20bd3dc66226	f3b1d613-29d5-4316-b161-dcba5ddb6fea	Thành phố Hồ Chí Minh	checkpoints/666739ff-00d9-49d2-b5be-ce2063d5acd3/6fa79b0efb4ecccd.jpg	checkpoints/666739ff-00d9-49d2-b5be-ce2063d5acd3/6fa79b0efb4ecccd.jpg	0
7b991662-972c-463a-ab7a-b6affd287f61	4f8f526b-cb59-411a-8689-bd75b8ad0138	Linh Xuân	cafe	\N	4	10.869731882109619	106.80401695951662	Linh Xuân, Khu phố 34, Thành phố Hồ Chí Minh	10	2026-06-13 05:38:47.381877+00	2026-06-13 05:38:47.381877+00	\N	741d2f8a-d675-451a-99fc-a670248e6bc8	f3b1d613-29d5-4316-b161-dcba5ddb6fea	Thành phố Hồ Chí Minh	checkpoints/7b991662-972c-463a-ab7a-b6affd287f61/ae65ca855a0f5340.jpg	checkpoints/7b991662-972c-463a-ab7a-b6affd287f61/thumbnails/54d317b3ee57a9f7.jpg	0
442a4d2f-6b82-4fbf-b2ad-a1d70da166d5	821768a5-8bb9-464e-a083-6225736a26b5	Linh Xuân	cafe	Chúc e thượng bình minh	4	10.869646957319018	106.8040145405329	Linh Xuân, Khu phố 34, Thành phố Hồ Chí Minh	10	2026-06-13 05:37:54.390696+00	2026-06-13 05:37:54.390696+00	\N	741d2f8a-d675-451a-99fc-a670248e6bc8	\N	Thành phố Hồ Chí Minh	checkpoints/442a4d2f-6b82-4fbf-b2ad-a1d70da166d5/a61fe577d92a09cf.jpg	checkpoints/442a4d2f-6b82-4fbf-b2ad-a1d70da166d5/thumbnails/79cfb959ecab80da.jpg	1
0ecf3e31-ec10-497a-923b-dc4773d3a38f	2e0bd89b-124e-47d5-9336-ea8f50d89950	Cafe go go	cafe	Hay qua	2	10.76251512822853	106.70738150509395	\N	10	2026-06-10 05:21:03.071668+00	2026-06-10 05:21:03.071668+00	\N	\N	\N	\N	checkpoints/0ecf3e31-ec10-497a-923b-dc4773d3a38f/71877e8dd5a75694.jpg	checkpoints/0ecf3e31-ec10-497a-923b-dc4773d3a38f/71877e8dd5a75694.jpg	0
cf2848c5-63de-426f-83ea-71d8d80718c5	efd3fee0-fe7e-4917-943f-a401124ca5b6	Nép coffee	cafe	Nước như nước tẩy	3	11.3280803	106.1072756	\N	1000	2026-06-10 06:07:22.168735+00	2026-06-10 06:07:22.168735+00	\N	\N	\N	\N	checkpoints/cf2848c5-63de-426f-83ea-71d8d80718c5/fb24bb764bbd1359.jpg	checkpoints/cf2848c5-63de-426f-83ea-71d8d80718c5/fb24bb764bbd1359.jpg	0
8d2454b9-8793-4b41-af8c-94eed86e8510	5508302b-91a6-477e-9a30-295a658630de	Nép cafe	cafe	Quán xinhhh	5	11.35157913229531	106.20398669694133	Xã Dương Minh Châu, Tỉnh Tây Ninh, Việt Nam	10	2026-06-11 06:54:04.798039+00	2026-06-11 06:54:04.798039+00	\N	ecee12f2-c243-40df-8442-3caaa2f592b5	\N	Tỉnh Tây Ninh	checkpoints/8d2454b9-8793-4b41-af8c-94eed86e8510/2fb0290677d7342a.jpg	checkpoints/8d2454b9-8793-4b41-af8c-94eed86e8510/2fb0290677d7342a.jpg	0
ae5e536d-4f06-45e3-95ab-7268c7a6bc96	ab399319-768d-4f8b-b3d2-a77e76a9ca58	Royal Tea	cafe	Nước ok, có bàn rộng, không quá đông	5	11.3206594	106.1008181	Phường Tân Ninh, Tỉnh Tây Ninh, 84000	10	2026-06-12 06:09:58.66914+00	2026-06-12 06:09:58.66914+00	\N	b3e57aa8-be9c-4265-ad33-51a4080eee4d	\N	Tỉnh Tây Ninh	checkpoints/ae5e536d-4f06-45e3-95ab-7268c7a6bc96/c3f2964371ce7186.jpg	checkpoints/ae5e536d-4f06-45e3-95ab-7268c7a6bc96/c3f2964371ce7186.jpg	0
6ab89b60-82b8-497b-9728-375ec6c8630b	1555459e-6a2f-49d8-b281-8ee5223a2072	we r careless	cafe	it feels good to careless	5	10.7995685	106.6400534	Phường Tân Bình, Thuận An, Thành phố Hồ Chí Minh	10	2026-06-12 06:53:02.926191+00	2026-06-12 06:53:02.926191+00	\N	eaaa1e6a-1335-4cfb-90e7-f3abddf90a22	\N	Thuận An	checkpoints/6ab89b60-82b8-497b-9728-375ec6c8630b/9ae849e76704ae89.jpg	checkpoints/6ab89b60-82b8-497b-9728-375ec6c8630b/9ae849e76704ae89.jpg	0
1f7208a7-66e1-4127-84b0-115416a5f07f	520f96ef-7103-414c-8400-da6b60663eb8	Gần núi	cafe	Dằm trong tim	1	11.338086	106.1294765	Phường Bình Minh, Tỉnh Tây Ninh	10	2026-06-11 06:52:22.284961+00	2026-06-11 06:52:22.284961+00	\N	e8b276ac-89f3-4bcb-bc97-eac59157ff76	17942e4e-af8d-4720-987c-f13c96d68cbb	Tỉnh Tây Ninh	checkpoints/1f7208a7-66e1-4127-84b0-115416a5f07f/c858ae36ed0ac886.jpg	checkpoints/1f7208a7-66e1-4127-84b0-115416a5f07f/c858ae36ed0ac886.jpg	0
678cbdd5-ece4-4cd2-9878-471de59a4242	821768a5-8bb9-464e-a083-6225736a26b5	Phú Thọ Hòa	food	Đi ăn cưới fen Bình An	5	10.793057869950426	106.61920948096564	Phú Thọ Hòa, Khu phố 16, Thành phố Hồ Chí Minh	10	2026-06-14 12:47:01.32722+00	2026-06-14 12:47:01.32722+00	\N	61b11a2c-b0c7-4600-92c1-819170f5c628	\N	Thành phố Hồ Chí Minh	checkpoints/6fc79667d5c974976d6f3b3e435be8cf/633ac579e681b6cb.jpg	checkpoints/6fc79667d5c974976d6f3b3e435be8cf/thumbnails/42c59e1f7fd76758.jpg	14
200dd427-6628-4f39-8c11-110df37997b5	4f8f526b-cb59-411a-8689-bd75b8ad0138	Phúc Long	cafe	Wifi như bòi, được cái wc có vòi xịt	2	10.766712451465136	106.7064111127858	Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-11 00:36:00.765049+00	2026-06-11 00:36:00.765049+00	\N	b6295299-817b-4696-88aa-0d749356912d	\N	Thủ Đức	checkpoints/200dd427-6628-4f39-8c11-110df37997b5/8dbd9074a05e80e3.jpg	checkpoints/200dd427-6628-4f39-8c11-110df37997b5/8dbd9074a05e80e3.jpg	0
a87b5659-72a2-4c47-9b32-e6c8e8e460de	520f96ef-7103-414c-8400-da6b60663eb8	Tttt	cafe	\N	5	0	0	\N	10	2026-06-13 10:11:24.236127+00	2026-06-13 10:11:24.236127+00	\N	2028a0b2-d11c-44df-8064-665c61692f5f	\N	\N	checkpoints/a87b5659-72a2-4c47-9b32-e6c8e8e460de/9ab8e2b09eab5a41.jpg	checkpoints/a87b5659-72a2-4c47-9b32-e6c8e8e460de/thumbnails/bf7dcb86a6185b44.jpg	0
e0444098-7a84-4943-b71b-46a7d9f02d69	4f8f526b-cb59-411a-8689-bd75b8ad0138	CAFECUB	cafe	\N	\N	10.756186111111111	106.70242222222222	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-14 13:54:53.765035+00	2026-06-14 13:54:53.765035+00	\N	79ee5560-b2a3-48fe-9c3b-5eee2a01c53f	\N	Thành phố Hồ Chí Minh	checkpoints/88bd9f5367a4eb32288f4d0682d36fda/277773f19dd50e88.jpg	checkpoints/88bd9f5367a4eb32288f4d0682d36fda/thumbnails/f1bb0f2accbf54fb.jpg	8
c49833d6-f57a-490f-9dba-498512a50ece	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	\N	5	10.828022383927433	106.68236799448023	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 11:50:48.744631+00	2026-06-13 11:50:48.744631+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/8791e685a229256e084ee48ff3f7509f/4afc2f867085921e.jpg	checkpoints/8791e685a229256e084ee48ff3f7509f/thumbnails/29513b6213bedfbc.jpg	0
21f92c63-d5e2-4657-a131-223cae91d25c	520f96ef-7103-414c-8400-da6b60663eb8	Cube	cafe	Ngon	5	10.756217	106.7023521	Khánh Hội, Ho Chi Minh City	10	2026-06-13 12:46:55.741181+00	2026-06-13 12:46:55.741181+00	\N	42ff463e-32ae-453a-ac75-05365677af48	\N	Ho Chi Minh City	checkpoints/7b34834baa0984b0eb8d925619745be3/6ea4840c3461143c.jpg	checkpoints/7b34834baa0984b0eb8d925619745be3/thumbnails/3be6cd3f0e9d0ce2.jpg	1
f4555e91-3e97-4bc3-8d05-38a880d3ab9b	4f8f526b-cb59-411a-8689-bd75b8ad0138	CAFECUB	cafe	\N	\N	10.756202777777778	106.70227777777778	\N	10	2026-06-14 06:13:45.499523+00	2026-06-14 06:13:45.499523+00	\N	79ee5560-b2a3-48fe-9c3b-5eee2a01c53f	\N	\N	checkpoints/e3035d6900b327313e1a74e3595e3e83/2d5d7c2604e1928c.jpg	checkpoints/e3035d6900b327313e1a74e3595e3e83/thumbnails/9e8f31d7dc03d1cc.jpg	20
0e255bd8-44d8-4703-bed5-69eebed796c1	520f96ef-7103-414c-8400-da6b60663eb8	Lều	cafe	Ok, đông	5	10.8280623	106.6823042	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-14 02:56:03.870432+00	2026-06-14 02:56:03.870432+00	\N	8c53634f-63b8-49bd-85f5-f92640620c84	\N	Ho Chi Minh City	checkpoints/41545e0d6407b4a472d8f5bc2ff2df12/cc8f4b4fa01f29be.jpg	checkpoints/41545e0d6407b4a472d8f5bc2ff2df12/thumbnails/c566c5b5557e91a9.jpg	7
397921c2-fa25-46c0-8cf3-f2e83f74c9d0	520f96ef-7103-414c-8400-da6b60663eb8	Metro nga thủ đức	cafe	Chưa kịp ăn...	5	10.8452605	106.7706153	Phường Thủ Đức, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-13 00:51:10.948132+00	2026-06-13 00:51:10.948132+00	\N	e874006b-7e0d-495c-9b90-5d1f188b156d	17942e4e-af8d-4720-987c-f13c96d68cbb	Thủ Đức	checkpoints/397921c2-fa25-46c0-8cf3-f2e83f74c9d0/6050217b100a6a70.jpg	checkpoints/397921c2-fa25-46c0-8cf3-f2e83f74c9d0/6050217b100a6a70.jpg	2
e528e9a5-0c83-4bca-882f-b275a229fb07	520f96ef-7103-414c-8400-da6b60663eb8	UIT	cafe	Trải nghiệm đi thi đau bụng	5	10.8694564	106.8038775	Phường Linh Xuân, Dĩ An, Thành phố Hồ Chí Minh	10	2026-06-13 02:43:45.083023+00	2026-06-13 02:43:45.083023+00	\N	6983baef-73cd-4838-a554-00508e92a639	17942e4e-af8d-4720-987c-f13c96d68cbb	Dĩ An	checkpoints/e528e9a5-0c83-4bca-882f-b275a229fb07/f2f33adebf662e5c.jpg	checkpoints/e528e9a5-0c83-4bca-882f-b275a229fb07/f2f33adebf662e5c.jpg	0
f31b78ce-4905-4230-8e22-89eca78e2473	520f96ef-7103-414c-8400-da6b60663eb8	Ken House	cafe	Mát, đông, nhạc chill	5	10.8775674	106.8087509	Phường Đông Hòa, Dĩ An, Thành phố Hồ Chí Minh	10	2026-06-13 03:44:20.797477+00	2026-06-13 03:44:20.797477+00	\N	d2334b19-f843-4c8f-8881-20bd3dc66226	17942e4e-af8d-4720-987c-f13c96d68cbb	Dĩ An	checkpoints/f31b78ce-4905-4230-8e22-89eca78e2473/b1329b181fcab5b2.jpg	checkpoints/f31b78ce-4905-4230-8e22-89eca78e2473/b1329b181fcab5b2.jpg	0
5528fa5a-26c2-417a-bf13-d7b027e9ffb3	4f8f526b-cb59-411a-8689-bd75b8ad0138	Phúc Long	cafe	\N	\N	10.766898625536031	106.70637871956114	Xóm Chiếu, Thành phố Hồ Chí Minh	10	2026-06-15 00:07:51.188813+00	2026-06-15 00:07:51.188813+00	\N	b6295299-817b-4696-88aa-0d749356912d	\N	Thành phố Hồ Chí Minh	checkpoints/c9a658b3d14f342767029a2fde44dfab/717cdbcfd3cf4ba4.jpg	checkpoints/c9a658b3d14f342767029a2fde44dfab/thumbnails/f1872c9f55e2cd3d.jpg	5
028e2b7a-a25e-40c6-9712-8b6ebb9a4f22	4f8f526b-cb59-411a-8689-bd75b8ad0138	Đi làm	other	Đi làm có cái chậu cây	4	10.762350836189613	106.70725121412805	Phường Xóm Chiếu, Thủ Đức, Thành phố Hồ Chí Minh	10	2026-06-11 04:04:01.105565+00	2026-06-11 04:04:01.105565+00	\N	8be70a71-e9ef-42fc-8be2-513642cd2282	\N	Thủ Đức	checkpoints/028e2b7a-a25e-40c6-9712-8b6ebb9a4f22/1b1f7003b7adb6b3.jpg	checkpoints/028e2b7a-a25e-40c6-9712-8b6ebb9a4f22/1b1f7003b7adb6b3.jpg	1
6d3235f1-1afd-42a8-914d-63edef7a37ae	821768a5-8bb9-464e-a083-6225736a26b5	Nhà Hàng The Daun	view	Thi alone	\N	10.770902321286004	106.69707445224896	Bến Thành, Khu phố 16, Thành phố Hồ Chí Minh	10	2026-06-14 06:28:12.789982+00	2026-06-14 06:28:12.789982+00	\N	44dd1477-5627-4e02-bf3b-9cdfacc15b00	\N	Thành phố Hồ Chí Minh	checkpoints/e58851f4e53931a2c6429f5f3735c6f1/4b0da269d0925fca.jpg	checkpoints/e58851f4e53931a2c6429f5f3735c6f1/thumbnails/19c77c74570f55f1.jpg	104
80c95747-b97e-44f2-bf12-01737c722370	520f96ef-7103-414c-8400-da6b60663eb8	Lumière	cafe	\N	4	10.8281479	106.6823846	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-13 09:19:38.630877+00	2026-06-13 09:19:38.630877+00	\N	2bfa8978-1612-4b4b-a48d-37fd314add74	17942e4e-af8d-4720-987c-f13c96d68cbb	Ho Chi Minh City	checkpoints/80c95747-b97e-44f2-bf12-01737c722370/13936ce61cbd0df0.jpg	checkpoints/80c95747-b97e-44f2-bf12-01737c722370/thumbnails/b075cc1f064c9522.jpg	1
3b71097d-02da-4811-a348-8f4185234713	4f8f526b-cb59-411a-8689-bd75b8ad0138	Bánh mì chén	food	\N	4	10.828289574008434	106.68522019942152	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-14 02:23:14.844405+00	2026-06-14 02:23:14.844405+00	\N	569081ae-774d-4701-80df-7666cf435925	\N	Thành phố Hồ Chí Minh	checkpoints/0e0be946e5ee08615d4451746b82954e/884696709bafcf50.jpg	checkpoints/0e0be946e5ee08615d4451746b82954e/thumbnails/2bd18c2e25664be6.jpg	5
865809f4-8421-44ad-83bb-f4713fe069dd	4f8f526b-cb59-411a-8689-bd75b8ad0138	Nha Rong Port Historic Site	nature	Daily	\N	10.766925	106.70645277777778	Xóm Chiếu, Thành phố Hồ Chí Minh	10	2026-06-15 01:12:51.90938+00	2026-06-15 01:12:51.90938+00	\N	6a1e90a1-8640-4108-ba13-105970b7e525	\N	Thành phố Hồ Chí Minh	checkpoints/a79d7a65e323d77e8e8546c9c3d8e751/178ae0a34c586d18.jpg	checkpoints/a79d7a65e323d77e8e8546c9c3d8e751/thumbnails/7734310b717361c4.jpg	6
bd7cc9a7-ddc4-4254-8994-f6fc771a6b64	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	Cầu thang	4	10.82801642413494	106.68237032078528	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 10:25:38.644323+00	2026-06-13 10:25:38.644323+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/55e853465f52a6ce8e9936e4bb774d8d/0795881f5347ebdf.jpg	checkpoints/55e853465f52a6ce8e9936e4bb774d8d/thumbnails/00d721ee63fa5da0.jpg	0
5ef8ce8a-0408-42e3-b65b-14b21658501a	4f8f526b-cb59-411a-8689-bd75b8ad0138	Linh Xuân	cafe	Thi xong\nDìa	4	10.870235445808216	106.80377357802317	Linh Xuân, Khu phố 34, Thành phố Hồ Chí Minh	10	2026-06-13 05:50:13.986477+00	2026-06-13 05:50:13.986477+00	\N	741d2f8a-d675-451a-99fc-a670248e6bc8	f3b1d613-29d5-4316-b161-dcba5ddb6fea	Thành phố Hồ Chí Minh	checkpoints/5ef8ce8a-0408-42e3-b65b-14b21658501a/702124bb0363403f.jpg	checkpoints/5ef8ce8a-0408-42e3-b65b-14b21658501a/thumbnails/b5b69ba0db765144.jpg	0
efc69860-0fa4-44ea-b697-bfa47db463be	4f8f526b-cb59-411a-8689-bd75b8ad0138	Bến Thành	cafe	\N	4	10.77076765013189	106.69713996979874	Bến Thành, Khu phố 16, Thành phố Hồ Chí Minh	10	2026-06-13 07:19:07.446902+00	2026-06-13 07:19:07.446902+00	\N	84dfef48-ba9c-4910-97ef-8c5f4a2d802b	\N	Thành phố Hồ Chí Minh	checkpoints/efc69860-0fa4-44ea-b697-bfa47db463be/1980e7b29e0b6566.jpg	checkpoints/efc69860-0fa4-44ea-b697-bfa47db463be/thumbnails/34bbe4e720824208.jpg	0
934a21eb-a015-4f68-b3de-99a277c2a4b6	4f8f526b-cb59-411a-8689-bd75b8ad0138	Lumiere	cafe	Cafe sau giờ thi căng thẳng	4	10.827972371100948	106.68237785600736	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 08:57:28.337631+00	2026-06-13 08:57:28.337631+00	\N	2bfa8978-1612-4b4b-a48d-37fd314add74	\N	Thành phố Hồ Chí Minh	checkpoints/934a21eb-a015-4f68-b3de-99a277c2a4b6/e84b745a006587ad.jpg	checkpoints/934a21eb-a015-4f68-b3de-99a277c2a4b6/thumbnails/3068f80adae932e9.jpg	0
ef5cab98-9347-4e46-8255-af57df1e7106	520f96ef-7103-414c-8400-da6b60663eb8	Lumière	cafe	Nước ngon, nvs sạch	4	10.8281156	106.682367	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-13 09:12:12.454422+00	2026-06-13 09:12:12.454422+00	\N	2bfa8978-1612-4b4b-a48d-37fd314add74	\N	Ho Chi Minh City	checkpoints/ef5cab98-9347-4e46-8255-af57df1e7106/b348a961083a5112.jpg	checkpoints/ef5cab98-9347-4e46-8255-af57df1e7106/thumbnails/228ec039605e2958.jpg	0
1e591d97-6bf5-45de-89d4-a6d87e028a9a	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Lumiere	cafe	\N	4	10.828016119303797	106.68237042384726	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 09:18:00.560335+00	2026-06-13 09:18:00.560335+00	\N	2bfa8978-1612-4b4b-a48d-37fd314add74	\N	Thành phố Hồ Chí Minh	checkpoints/1e591d97-6bf5-45de-89d4-a6d87e028a9a/c2a617db92544c73.jpg	checkpoints/1e591d97-6bf5-45de-89d4-a6d87e028a9a/thumbnails/9291e81d5491025d.jpg	0
1b1a4e61-c170-4530-9067-f347e2a069fc	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	Vibe coding	4	10.828136633377925	106.68233751271458	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 09:33:24.622556+00	2026-06-13 09:33:24.622556+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/1b1a4e61-c170-4530-9067-f347e2a069fc/d1a58546de91c064.jpg	checkpoints/1b1a4e61-c170-4530-9067-f347e2a069fc/thumbnails/50babac90392dff6.jpg	0
b65b8b61-316e-42db-a288-aac4805f8aca	4f8f526b-cb59-411a-8689-bd75b8ad0138	Cầu Ông Lãnh	cafe	\N	4	10.765730555555555	106.69558611111111	Cầu Ông Lãnh, Khu phố 34, Thành phố Hồ Chí Minh	10	2026-06-13 09:45:50.874101+00	2026-06-13 09:45:50.874101+00	\N	c780fc32-ed7c-4923-939c-79636590f2d8	\N	Thành phố Hồ Chí Minh	checkpoints/b65b8b61-316e-42db-a288-aac4805f8aca/7f05a51fc9d98564.jpg	checkpoints/b65b8b61-316e-42db-a288-aac4805f8aca/thumbnails/4c88cada1c0cfd87.jpg	0
65e65feb-aab7-41d2-bee9-37fc1b04223d	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	Cafe Lumiere	4	10.828030555555555	106.68236666666667	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 09:48:06.455425+00	2026-06-13 09:48:06.455425+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/65e65feb-aab7-41d2-bee9-37fc1b04223d/7be3cf6e58ff12d9.jpg	checkpoints/65e65feb-aab7-41d2-bee9-37fc1b04223d/thumbnails/769e1bb36c495438.jpg	0
fc9ef34d-ce3e-4cbc-97dc-a5a7a7310820	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	\N	4	10.828068657510952	106.68231226586234	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-13 09:57:10.826654+00	2026-06-13 09:57:10.826654+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Ho Chi Minh City	checkpoints/fc9ef34d-ce3e-4cbc-97dc-a5a7a7310820/327e3303f0a62f28.jpg	checkpoints/fc9ef34d-ce3e-4cbc-97dc-a5a7a7310820/thumbnails/c15ddfefea52fda7.jpg	0
716227d6-44f0-4bb3-b747-fdbf18710977	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	\N	4	10.828016332324285	106.68237010639217	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 11:52:48.48794+00	2026-06-13 11:52:48.48794+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/83511fa8ce016d40a7a0ba14a5e03887/9e5800d842c0c56f.jpg	checkpoints/83511fa8ce016d40a7a0ba14a5e03887/thumbnails/c369cd29b7cdd4c8.jpg	0
40af0117-3d4a-4efc-adb9-23e8801ae6fe	4f8f526b-cb59-411a-8689-bd75b8ad0138	Hạnh Thông	cafe	\N	4	10.828016346787946	106.68237010570849	Hạnh Thông, Gò Vấp, Thành phố Hồ Chí Minh	10	2026-06-13 11:53:12.608465+00	2026-06-13 11:53:12.608465+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Thành phố Hồ Chí Minh	checkpoints/4436b5acc9ef741988a16777a789da72/625321cbfba34346.jpg	checkpoints/4436b5acc9ef741988a16777a789da72/thumbnails/4355536f819afa85.jpg	0
d94b23ab-bae4-46c7-a3c2-631389b61a9f	821768a5-8bb9-464e-a083-6225736a26b5	Khánh Hội	food	Quán ốc số 1 tân vĩnh mời ae	4	10.75616820468989	106.70234646315157	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 12:44:25.751701+00	2026-06-13 12:44:25.751701+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/e21496612ee30bb9a381f151e756f6ce/cdb5ca4ac85d9968.jpg	checkpoints/e21496612ee30bb9a381f151e756f6ce/thumbnails/7ba9148e94f2a1bc.jpg	0
75cfbc96-e4c5-46af-a3b8-a3a07695eed5	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	\N	4	10.756205179875518	106.70234978944828	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 14:19:28.004552+00	2026-06-13 14:19:28.004552+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/ae0737034ddec4a7e4918052d2c2d699/572ea1fc1b0a38bf.jpg	checkpoints/ae0737034ddec4a7e4918052d2c2d699/thumbnails/95dcb68aa4c4fa49.jpg	0
abfb5933-ba04-4122-9af4-8a8b9b3b1989	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	\N	4	10.756116852908336	106.70246875532352	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 14:46:00.210862+00	2026-06-13 14:46:00.210862+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/e4964951caf0d6678732770bcf886f38/8154245bae2a5913.jpg	checkpoints/e4964951caf0d6678732770bcf886f38/thumbnails/28b0e809002f10f8.jpg	0
ead3baa7-a131-42c8-9685-e8848b5a6fe4	4f8f526b-cb59-411a-8689-bd75b8ad0138	Khánh Hội	cafe	\N	4	10.75623888888889	106.70229444444445	Khánh Hội, Thành phố Hồ Chí Minh	10	2026-06-13 12:43:21.781056+00	2026-06-13 12:43:21.781056+00	\N	59c600f6-1e11-487c-b576-a52025c89306	\N	Thành phố Hồ Chí Minh	checkpoints/e4c1c6fdb02892357a0a3afb933e78d7/f215a67edec7e9b1.jpg	checkpoints/e4c1c6fdb02892357a0a3afb933e78d7/thumbnails/e4585f53435f2083.jpg	1
d5199ae6-77ca-45e5-9546-3a5f5c7f874e	520f96ef-7103-414c-8400-da6b60663eb8	Hạnh Thông	cafe	\N	4	10.8281448	106.682369	Hạnh Thông, Go Vap, Ho Chi Minh City	10	2026-06-13 10:44:16.076915+00	2026-06-13 10:44:16.076915+00	\N	75accba6-5513-48d6-afea-42db75dd201a	\N	Ho Chi Minh City	checkpoints/624d372b185b5a3f15640164ea7773b0/6c598797e4a015b0.jpg	checkpoints/624d372b185b5a3f15640164ea7773b0/thumbnails/023ccfa314dd01f9.jpg	2
88ff9f74-2894-46d8-8910-7473b2df53fc	4f8f526b-cb59-411a-8689-bd75b8ad0138	Linh Xuân	cafe	Dìa	4	10.866394406194674	106.80123187611512	Linh Xuân, Khu phố 34, Thành phố Hồ Chí Minh	10	2026-06-13 06:44:42.530814+00	2026-06-13 06:44:42.530814+00	\N	49a6cd72-969f-4aff-b89d-2fe0a5671410	\N	Thành phố Hồ Chí Minh	checkpoints/88ff9f74-2894-46d8-8910-7473b2df53fc/62a53d044e666fd3.jpg	checkpoints/88ff9f74-2894-46d8-8910-7473b2df53fc/thumbnails/0d489317a7170033.jpg	1
\.


--
-- Data for Name: checkpoint_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."checkpoint_images" ("id", "checkpoint_id", "object_key", "sort_order", "created_at", "thumbnail_key") FROM stdin;
5c3588bb-be7e-458e-9c12-420a003bb26f	5ac8049d-6e73-4256-83fe-735670ebc85f	checkpoints/5ac8049d-6e73-4256-83fe-735670ebc85f/c99d822ec28f119b.jpg	0	2026-06-13 00:09:12.880393+00	\N
4db63284-2ed7-4142-8d52-ed266d7e0452	d2d21695-e680-45cf-b808-3f7e656412ba	checkpoints/d2d21695-e680-45cf-b808-3f7e656412ba/3d12984171358b04.jpg	0	2026-06-13 00:10:59.454116+00	\N
867ac759-5f9a-4278-a7ef-0027ac5dbb30	e3bdc6c2-da4a-4e34-89a7-b3e76e7ec740	checkpoints/e3bdc6c2-da4a-4e34-89a7-b3e76e7ec740/62aed9f61aa0994f.jpg	0	2026-06-13 00:20:12.105391+00	\N
87f327fc-8b4a-48c9-97ea-18ccb806a874	30f2aaa2-8ed4-481e-adb1-2cb92e4616c1	checkpoints/30f2aaa2-8ed4-481e-adb1-2cb92e4616c1/e309d4ed4bf50cf4.jpg	0	2026-06-13 00:25:16.115591+00	\N
ef2988d7-06fa-49f6-a7da-8e1741e5c8b1	0ac5a013-8318-4bd8-bbc5-d05419a46837	checkpoints/0ac5a013-8318-4bd8-bbc5-d05419a46837/d8f7a787c1d1cfdf.jpg	0	2026-06-13 00:32:05.412467+00	\N
508544aa-bfdf-455d-8163-80b4fb15d4ed	397921c2-fa25-46c0-8cf3-f2e83f74c9d0	checkpoints/397921c2-fa25-46c0-8cf3-f2e83f74c9d0/6050217b100a6a70.jpg	0	2026-06-13 00:51:18.473784+00	\N
16db8511-af4b-4c2d-82d0-d0558ec00ae5	0ecf3e31-ec10-497a-923b-dc4773d3a38f	checkpoints/0ecf3e31-ec10-497a-923b-dc4773d3a38f/71877e8dd5a75694.jpg	0	2026-06-10 05:21:07.248129+00	\N
8ec44971-9af5-4303-8d23-51a77acbc0ff	0ecf3e31-ec10-497a-923b-dc4773d3a38f	checkpoints/0ecf3e31-ec10-497a-923b-dc4773d3a38f/1ea193fb346205f7.jpg	1	2026-06-10 05:21:07.427078+00	\N
cfbea725-eb98-4cd4-af04-26f209b6123f	0ecf3e31-ec10-497a-923b-dc4773d3a38f	checkpoints/0ecf3e31-ec10-497a-923b-dc4773d3a38f/e6c924f1e38aef61.jpg	2	2026-06-10 05:21:07.556236+00	\N
c8da30ca-4872-4ba5-9e3f-955bbe0b1dad	0ecf3e31-ec10-497a-923b-dc4773d3a38f	checkpoints/0ecf3e31-ec10-497a-923b-dc4773d3a38f/50d994555a192c02.jpg	3	2026-06-10 05:21:07.690247+00	\N
c15c4bee-32d9-4065-827f-c9700771fd09	cf2848c5-63de-426f-83ea-71d8d80718c5	checkpoints/cf2848c5-63de-426f-83ea-71d8d80718c5/fb24bb764bbd1359.jpg	0	2026-06-10 06:07:26.683452+00	\N
8e6ca2f9-0c63-4b18-8bcf-cf51019f585c	cf2848c5-63de-426f-83ea-71d8d80718c5	checkpoints/cf2848c5-63de-426f-83ea-71d8d80718c5/88ced5fa35ba2e2c.jpg	1	2026-06-10 06:07:26.781633+00	\N
d84a9806-3dc7-4352-8fee-00177162546c	81368c1f-0110-4ba9-8933-1ba8b8fe562d	checkpoints/81368c1f-0110-4ba9-8933-1ba8b8fe562d/27089cead120340b.jpg	0	2026-06-10 08:20:49.963439+00	\N
a262fe58-ca26-4f4b-8c91-e5ca01ca28a0	81368c1f-0110-4ba9-8933-1ba8b8fe562d	checkpoints/81368c1f-0110-4ba9-8933-1ba8b8fe562d/0330e6eb81f575b6.jpg	1	2026-06-10 08:20:50.105167+00	\N
31047609-1041-4c32-b847-e3b1a5ded29a	81368c1f-0110-4ba9-8933-1ba8b8fe562d	checkpoints/81368c1f-0110-4ba9-8933-1ba8b8fe562d/8caa0d9fa71960d6.jpg	2	2026-06-10 08:20:50.262275+00	\N
fceb6227-af4a-4d7c-a176-d3fbf2236f34	d445f97b-60fa-4c9b-9c06-483cf5fcb589	checkpoints/d445f97b-60fa-4c9b-9c06-483cf5fcb589/1e075e4d83309a2f.jpg	0	2026-06-10 10:22:19.166938+00	\N
eb78f946-9dff-4727-80a3-dbb4f8c32587	3de506e2-be3f-457a-b251-e0b41c0a673d	checkpoints/3de506e2-be3f-457a-b251-e0b41c0a673d/3028f96df95203f0.jpg	0	2026-06-10 14:15:38.699126+00	\N
4a5dfd35-672e-4ca3-8c19-742b33a1b37c	18a2f48e-801b-447e-b931-0d207c5c2873	checkpoints/18a2f48e-801b-447e-b931-0d207c5c2873/60bedd0a6669c4b3.jpg	0	2026-06-10 14:34:47.802528+00	\N
8dcfc5d8-69e9-4108-8145-af52e55ee3a8	200dd427-6628-4f39-8c11-110df37997b5	checkpoints/200dd427-6628-4f39-8c11-110df37997b5/8dbd9074a05e80e3.jpg	0	2026-06-11 00:36:07.602799+00	\N
f786bf3b-5642-430d-b7e8-ab9f7340aeaa	0c0d28cd-de2d-44ec-a224-609384b7e428	checkpoints/0c0d28cd-de2d-44ec-a224-609384b7e428/c369ed977f0fbea2.jpg	0	2026-06-11 03:17:20.945093+00	\N
52bc49a0-ab49-47ab-96ee-a95123c5187b	028e2b7a-a25e-40c6-9712-8b6ebb9a4f22	checkpoints/028e2b7a-a25e-40c6-9712-8b6ebb9a4f22/1b1f7003b7adb6b3.jpg	0	2026-06-11 04:04:08.651168+00	\N
38edd730-55b4-48d8-a384-933d12dddd03	1f7208a7-66e1-4127-84b0-115416a5f07f	checkpoints/1f7208a7-66e1-4127-84b0-115416a5f07f/c858ae36ed0ac886.jpg	0	2026-06-11 06:52:30.66001+00	\N
e8863d8a-149a-45fd-b4e9-7504819b8ab8	8d2454b9-8793-4b41-af8c-94eed86e8510	checkpoints/8d2454b9-8793-4b41-af8c-94eed86e8510/2fb0290677d7342a.jpg	0	2026-06-11 06:54:10.726308+00	\N
32264dd3-95fb-4729-b275-a83b2e4b107e	dffbaf2c-ccdc-42c3-ae7a-0d70df60120e	checkpoints/dffbaf2c-ccdc-42c3-ae7a-0d70df60120e/9af1c7395d25a8d3.jpg	0	2026-06-11 08:54:54.218416+00	\N
c21bb887-bb42-4f66-b4e7-44abc50ab0ab	9dfbaad5-c798-4eba-828d-ed003326747f	checkpoints/9dfbaad5-c798-4eba-828d-ed003326747f/9a5f7f60285743e6.png	0	2026-06-11 08:55:46.417332+00	\N
f01562fe-3047-4aa9-b4c6-41e7a4d3b823	0d215a15-4c24-4204-9cfb-0b108bf1b2d9	checkpoints/0d215a15-4c24-4204-9cfb-0b108bf1b2d9/47da06d6afcec0bc.jpg	0	2026-06-12 05:17:05.566877+00	\N
9b7eaa38-6d61-4c50-9ce3-efd93fa74f36	0d215a15-4c24-4204-9cfb-0b108bf1b2d9	checkpoints/0d215a15-4c24-4204-9cfb-0b108bf1b2d9/4904f585da9aad2a.jpg	1	2026-06-12 05:17:05.758466+00	\N
81848912-9aae-4c23-84bd-9695a0954a14	0d215a15-4c24-4204-9cfb-0b108bf1b2d9	checkpoints/0d215a15-4c24-4204-9cfb-0b108bf1b2d9/3cd17fc23f0c1ab8.jpg	2	2026-06-12 05:17:05.94817+00	\N
8ecd3b9b-b666-449c-ad32-56f2fd2a003c	ae5e536d-4f06-45e3-95ab-7268c7a6bc96	checkpoints/ae5e536d-4f06-45e3-95ab-7268c7a6bc96/c3f2964371ce7186.jpg	0	2026-06-12 06:10:05.517342+00	\N
43f0c947-16db-41d9-a3d6-a0a130e0c7d1	68a1c99f-67cf-4502-8901-176b96231b16	checkpoints/68a1c99f-67cf-4502-8901-176b96231b16/006839bbf6ad7d47.png	0	2026-06-12 06:15:16.60515+00	\N
8d41f508-919c-40ce-aed9-888b387530ab	6ab89b60-82b8-497b-9728-375ec6c8630b	checkpoints/6ab89b60-82b8-497b-9728-375ec6c8630b/9ae849e76704ae89.jpg	0	2026-06-12 06:53:11.183068+00	\N
0f13156b-a7c4-4d60-b27a-ddeade01c72e	6ab89b60-82b8-497b-9728-375ec6c8630b	checkpoints/6ab89b60-82b8-497b-9728-375ec6c8630b/ea1fe1ea3ce26b02.jpg	1	2026-06-12 06:53:11.376173+00	\N
e69bbb5a-fe01-45a6-95ee-0d15af1b0157	6ab89b60-82b8-497b-9728-375ec6c8630b	checkpoints/6ab89b60-82b8-497b-9728-375ec6c8630b/7bc07878905de034.jpg	2	2026-06-12 06:53:11.566229+00	\N
74beff5c-c466-41e1-99e9-1160bb1ed065	db60f53b-9169-4e36-870a-dff93df31076	checkpoints/db60f53b-9169-4e36-870a-dff93df31076/e9eb18a41611449f.jpg	0	2026-06-12 07:05:33.01787+00	\N
a6b5cbbd-e6c8-4db1-9fac-a1c0e58a9f1e	db60f53b-9169-4e36-870a-dff93df31076	checkpoints/db60f53b-9169-4e36-870a-dff93df31076/77f8193fd6e705eb.jpg	1	2026-06-12 07:05:33.211625+00	\N
f9d10f84-dfea-448d-981b-be1f7f8c36ee	0f23717b-991b-486a-b900-cd7c3a658560	checkpoints/0f23717b-991b-486a-b900-cd7c3a658560/1baac0539adb96d3.jpg	0	2026-06-13 00:04:16.451481+00	\N
90ebd481-bca9-40ed-adf5-cac22f2e63cd	ab51e919-723c-4a4b-8168-bc0357af2cff	checkpoints/ab51e919-723c-4a4b-8168-bc0357af2cff/1a05e08692c8e847.jpg	0	2026-06-13 01:57:45.230974+00	\N
dc305f69-0a39-40bf-ad89-6a24e24aad5f	55cc89e6-0a8a-46a7-8ae6-f385e857ca15	checkpoints/55cc89e6-0a8a-46a7-8ae6-f385e857ca15/56cf7ab45a145f4c.jpg	0	2026-06-13 02:23:36.181086+00	\N
54e37ac3-0994-4e55-bbc0-987b8c2b6e5d	e528e9a5-0c83-4bca-882f-b275a229fb07	checkpoints/e528e9a5-0c83-4bca-882f-b275a229fb07/f2f33adebf662e5c.jpg	0	2026-06-13 02:43:53.905097+00	\N
20281016-0adf-4359-8246-3119aadbf0ae	73b152a9-eff3-4a27-8b39-58e195e5398a	checkpoints/73b152a9-eff3-4a27-8b39-58e195e5398a/8fa990300517890e.jpg	0	2026-06-13 03:37:51.937815+00	\N
58dd5c3c-927b-4704-bd9b-3174a97972c2	f31b78ce-4905-4230-8e22-89eca78e2473	checkpoints/f31b78ce-4905-4230-8e22-89eca78e2473/b1329b181fcab5b2.jpg	0	2026-06-13 03:44:25.809415+00	\N
97459af1-fdc8-4546-9659-c0adcc97021c	9746dc15-86da-40be-b076-e14d65cc6557	checkpoints/9746dc15-86da-40be-b076-e14d65cc6557/f4b39fa136466caf.jpg	0	2026-06-13 03:54:17.894096+00	\N
82178f63-d9f7-42b1-bf9b-603f37dd33b6	3e30c7e3-c071-45e1-bc52-0eb348c23aa8	checkpoints/3e30c7e3-c071-45e1-bc52-0eb348c23aa8/ca7446add0d820d0.jpg	0	2026-06-13 03:54:32.460374+00	\N
56f21a36-7f85-4cea-80ee-38c96dd960f0	666739ff-00d9-49d2-b5be-ce2063d5acd3	checkpoints/666739ff-00d9-49d2-b5be-ce2063d5acd3/6fa79b0efb4ecccd.jpg	0	2026-06-13 04:46:21.343063+00	\N
e90ce1d1-fe5e-44c7-9489-1e5407ddea59	7b991662-972c-463a-ab7a-b6affd287f61	checkpoints/7b991662-972c-463a-ab7a-b6affd287f61/ae65ca855a0f5340.jpg	0	2026-06-13 05:38:55.2437+00	checkpoints/7b991662-972c-463a-ab7a-b6affd287f61/thumbnails/54d317b3ee57a9f7.jpg
ed498fe4-521c-4b67-8f85-96b450f0c9ac	442a4d2f-6b82-4fbf-b2ad-a1d70da166d5	checkpoints/442a4d2f-6b82-4fbf-b2ad-a1d70da166d5/a61fe577d92a09cf.jpg	0	2026-06-13 05:39:02.051175+00	checkpoints/442a4d2f-6b82-4fbf-b2ad-a1d70da166d5/thumbnails/79cfb959ecab80da.jpg
226f14a6-35bf-4b0a-8e12-275d4f8a7674	442a4d2f-6b82-4fbf-b2ad-a1d70da166d5	checkpoints/442a4d2f-6b82-4fbf-b2ad-a1d70da166d5/76b3ef4dafd5f3b9.jpg	1	2026-06-13 05:39:02.24308+00	checkpoints/442a4d2f-6b82-4fbf-b2ad-a1d70da166d5/thumbnails/dec4aba0da265e65.jpg
f6150596-da34-4cd3-9f69-1f4c8ef42b25	442a4d2f-6b82-4fbf-b2ad-a1d70da166d5	checkpoints/442a4d2f-6b82-4fbf-b2ad-a1d70da166d5/bc8d91a6552ff9a8.jpg	2	2026-06-13 05:39:02.435943+00	checkpoints/442a4d2f-6b82-4fbf-b2ad-a1d70da166d5/thumbnails/ea11f83701f4ab72.jpg
aa4a6925-5217-43c1-8807-faab2cc5de71	3b6194e0-640b-4db8-b155-209615c9a050	checkpoints/3b6194e0-640b-4db8-b155-209615c9a050/264762f118a6e099.jpg	0	2026-06-13 05:39:03.933411+00	checkpoints/3b6194e0-640b-4db8-b155-209615c9a050/thumbnails/53b80473a6b79c12.jpg
0235d19a-4395-4e74-9d9d-6ffae9037b36	3b6194e0-640b-4db8-b155-209615c9a050	checkpoints/3b6194e0-640b-4db8-b155-209615c9a050/b861698acc110f79.jpg	1	2026-06-13 05:39:04.127307+00	checkpoints/3b6194e0-640b-4db8-b155-209615c9a050/thumbnails/6c4f274e0631204e.jpg
bcdda111-b7fe-4180-9b73-57ccb537d8a9	5ef8ce8a-0408-42e3-b65b-14b21658501a	checkpoints/5ef8ce8a-0408-42e3-b65b-14b21658501a/702124bb0363403f.jpg	0	2026-06-13 05:50:20.521251+00	checkpoints/5ef8ce8a-0408-42e3-b65b-14b21658501a/thumbnails/b5b69ba0db765144.jpg
320f8a95-ca61-40bb-812b-99558c6da0bf	88ff9f74-2894-46d8-8910-7473b2df53fc	checkpoints/88ff9f74-2894-46d8-8910-7473b2df53fc/62a53d044e666fd3.jpg	0	2026-06-13 06:44:52.961178+00	checkpoints/88ff9f74-2894-46d8-8910-7473b2df53fc/thumbnails/0d489317a7170033.jpg
3c296525-a44c-46be-8be7-5e93656df25c	efc69860-0fa4-44ea-b697-bfa47db463be	checkpoints/efc69860-0fa4-44ea-b697-bfa47db463be/1980e7b29e0b6566.jpg	0	2026-06-13 07:19:15.94137+00	checkpoints/efc69860-0fa4-44ea-b697-bfa47db463be/thumbnails/34bbe4e720824208.jpg
d11e3289-645d-49b4-a679-6721b9b58bac	934a21eb-a015-4f68-b3de-99a277c2a4b6	checkpoints/934a21eb-a015-4f68-b3de-99a277c2a4b6/e84b745a006587ad.jpg	0	2026-06-13 08:57:38.207807+00	checkpoints/934a21eb-a015-4f68-b3de-99a277c2a4b6/thumbnails/3068f80adae932e9.jpg
d76d9e40-dead-4d7b-97a3-fde451dd5313	934a21eb-a015-4f68-b3de-99a277c2a4b6	checkpoints/934a21eb-a015-4f68-b3de-99a277c2a4b6/f6b84a187f0e757e.jpg	1	2026-06-13 08:57:38.399706+00	checkpoints/934a21eb-a015-4f68-b3de-99a277c2a4b6/thumbnails/45266c1f3b4232e0.jpg
df4439e1-573d-4c49-9e1f-a529161bd605	ef5cab98-9347-4e46-8255-af57df1e7106	checkpoints/ef5cab98-9347-4e46-8255-af57df1e7106/b348a961083a5112.jpg	0	2026-06-13 09:12:18.261728+00	checkpoints/ef5cab98-9347-4e46-8255-af57df1e7106/thumbnails/228ec039605e2958.jpg
dad5ca27-b66a-43a1-a4cd-289ff36001ee	1e591d97-6bf5-45de-89d4-a6d87e028a9a	checkpoints/1e591d97-6bf5-45de-89d4-a6d87e028a9a/c2a617db92544c73.jpg	0	2026-06-13 09:18:10.360351+00	checkpoints/1e591d97-6bf5-45de-89d4-a6d87e028a9a/thumbnails/9291e81d5491025d.jpg
a0cb51af-2264-4d85-bd0e-29d67798b8a9	1e591d97-6bf5-45de-89d4-a6d87e028a9a	checkpoints/1e591d97-6bf5-45de-89d4-a6d87e028a9a/655f361f5baa6d89.jpg	1	2026-06-13 09:18:10.553235+00	checkpoints/1e591d97-6bf5-45de-89d4-a6d87e028a9a/thumbnails/e60bf5ef7fe69846.jpg
b280c808-2f00-4c38-ad01-7e65e39bbcc3	1e591d97-6bf5-45de-89d4-a6d87e028a9a	checkpoints/1e591d97-6bf5-45de-89d4-a6d87e028a9a/bc5bddb8d1e5ef43.jpg	2	2026-06-13 09:18:10.745991+00	checkpoints/1e591d97-6bf5-45de-89d4-a6d87e028a9a/thumbnails/e51536e495567010.jpg
4fbf6607-97b4-4bb9-bd0b-e7ab77b63200	80c95747-b97e-44f2-bf12-01737c722370	checkpoints/80c95747-b97e-44f2-bf12-01737c722370/13936ce61cbd0df0.jpg	0	2026-06-13 09:19:47.254762+00	checkpoints/80c95747-b97e-44f2-bf12-01737c722370/thumbnails/b075cc1f064c9522.jpg
6b325313-b414-4d1c-a5dd-49dc895bb719	80c95747-b97e-44f2-bf12-01737c722370	checkpoints/80c95747-b97e-44f2-bf12-01737c722370/fdf745f611873876.jpg	1	2026-06-13 09:19:47.447343+00	checkpoints/80c95747-b97e-44f2-bf12-01737c722370/thumbnails/3dbc41f5fa530f73.jpg
9b244220-57b8-46b7-808b-0bc04686992b	80c95747-b97e-44f2-bf12-01737c722370	checkpoints/80c95747-b97e-44f2-bf12-01737c722370/fe6b4e63ea8bdbf7.jpg	2	2026-06-13 09:19:47.639342+00	checkpoints/80c95747-b97e-44f2-bf12-01737c722370/thumbnails/c4d24ef2f31bced7.jpg
c7159c21-86dc-45d2-ab76-e407b23fe8c0	38dac9e2-f37b-43b5-a909-9dffee8c0da2	checkpoints/38dac9e2-f37b-43b5-a909-9dffee8c0da2/c60161d1b2886c85.jpg	0	2026-06-13 09:20:07.400207+00	checkpoints/38dac9e2-f37b-43b5-a909-9dffee8c0da2/thumbnails/10f4083bd02eceb6.jpg
8d133781-12b5-4c86-8fc7-796feabbadb8	38dac9e2-f37b-43b5-a909-9dffee8c0da2	checkpoints/38dac9e2-f37b-43b5-a909-9dffee8c0da2/3c1871cedb4a36ca.jpg	1	2026-06-13 09:20:07.592704+00	checkpoints/38dac9e2-f37b-43b5-a909-9dffee8c0da2/thumbnails/3c0b1c61e4e302e2.jpg
73a9a40c-59f6-4408-ad8e-76b7d9046c70	38dac9e2-f37b-43b5-a909-9dffee8c0da2	checkpoints/38dac9e2-f37b-43b5-a909-9dffee8c0da2/457918b8c1aa77c4.jpg	2	2026-06-13 09:20:07.783873+00	checkpoints/38dac9e2-f37b-43b5-a909-9dffee8c0da2/thumbnails/8c7e9fec13bbdd84.jpg
d0e262ca-1cf3-4177-8caa-b107ded45e6c	1b1a4e61-c170-4530-9067-f347e2a069fc	checkpoints/1b1a4e61-c170-4530-9067-f347e2a069fc/d1a58546de91c064.jpg	0	2026-06-13 09:33:32.591963+00	checkpoints/1b1a4e61-c170-4530-9067-f347e2a069fc/thumbnails/50babac90392dff6.jpg
4a9ce691-ba74-40a6-9776-aaef97d3cdc3	1b1a4e61-c170-4530-9067-f347e2a069fc	checkpoints/1b1a4e61-c170-4530-9067-f347e2a069fc/54ab73895545191a.jpg	1	2026-06-13 09:33:32.784749+00	checkpoints/1b1a4e61-c170-4530-9067-f347e2a069fc/thumbnails/f22caa2266537f1e.jpg
c33791f0-9d95-497c-881f-b6a8421e6af2	1b1a4e61-c170-4530-9067-f347e2a069fc	checkpoints/1b1a4e61-c170-4530-9067-f347e2a069fc/a9ed7310ed7ae12b.jpg	2	2026-06-13 09:33:32.977385+00	checkpoints/1b1a4e61-c170-4530-9067-f347e2a069fc/thumbnails/57bc9c4e56f87bce.jpg
549b4e64-24cf-4340-8bbb-ab46f2fbffaf	b65b8b61-316e-42db-a288-aac4805f8aca	checkpoints/b65b8b61-316e-42db-a288-aac4805f8aca/7f05a51fc9d98564.jpg	0	2026-06-13 09:45:58.404119+00	checkpoints/b65b8b61-316e-42db-a288-aac4805f8aca/thumbnails/4c88cada1c0cfd87.jpg
3856661d-3513-4d0b-8d71-ffc2e3ead381	65e65feb-aab7-41d2-bee9-37fc1b04223d	checkpoints/65e65feb-aab7-41d2-bee9-37fc1b04223d/7be3cf6e58ff12d9.jpg	0	2026-06-13 09:48:13.093411+00	checkpoints/65e65feb-aab7-41d2-bee9-37fc1b04223d/thumbnails/769e1bb36c495438.jpg
66394301-14c7-476c-bcc0-9907b9af9182	fc9ef34d-ce3e-4cbc-97dc-a5a7a7310820	checkpoints/fc9ef34d-ce3e-4cbc-97dc-a5a7a7310820/327e3303f0a62f28.jpg	0	2026-06-13 09:57:18.014492+00	checkpoints/fc9ef34d-ce3e-4cbc-97dc-a5a7a7310820/thumbnails/c15ddfefea52fda7.jpg
76ff3cf0-b8b2-49e0-a379-2aab32fa2a99	5ed40ac8-ad29-4a99-9f37-f9aecc71eaa8	checkpoints/5ed40ac8-ad29-4a99-9f37-f9aecc71eaa8/1459fa9950b5a22a.jpg	0	2026-06-13 10:10:33.941394+00	checkpoints/5ed40ac8-ad29-4a99-9f37-f9aecc71eaa8/thumbnails/fcda3bafe6a87d93.jpg
7b4a6183-c720-4b92-b10c-2927330bcde0	a87b5659-72a2-4c47-9b32-e6c8e8e460de	checkpoints/a87b5659-72a2-4c47-9b32-e6c8e8e460de/9ab8e2b09eab5a41.jpg	0	2026-06-13 10:11:29.932565+00	checkpoints/a87b5659-72a2-4c47-9b32-e6c8e8e460de/thumbnails/bf7dcb86a6185b44.jpg
5fb21ed1-4360-48f2-9b60-e15ca514362d	cbe9e96b-c7bd-4227-ab7d-46495aa98691	checkpoints/cbe9e96b-c7bd-4227-ab7d-46495aa98691/b8abb7430855d858.jpg	0	2026-06-13 10:11:51.390583+00	checkpoints/cbe9e96b-c7bd-4227-ab7d-46495aa98691/thumbnails/c27bee152c3b09ee.jpg
3575a0e7-c852-4147-ae4f-982c40ca9d48	0afece2b-dc4e-4eef-9cda-fe70083641ef	checkpoints/0afece2b-dc4e-4eef-9cda-fe70083641ef/bd34d084487587c8.jpg	0	2026-06-13 10:14:25.339414+00	checkpoints/0afece2b-dc4e-4eef-9cda-fe70083641ef/thumbnails/1b32781ae356e5f4.jpg
ff1a1e3b-b845-48d9-b00b-801c7c928801	836d4d23-e5b5-491c-93fe-c09535a844a1	checkpoints/5bd97db5555b4a66e40d18ddb154d8e3/f54c30903238f7b8.jpg	0	2026-06-13 10:23:26.436017+00	checkpoints/5bd97db5555b4a66e40d18ddb154d8e3/thumbnails/a8a22f3e7e68103d.jpg
203fae39-1e6a-4d6d-b392-34382f44e511	135f06b2-7a4c-453d-af79-860c2a380bd4	checkpoints/440b648011e638ebf11d931e0bf15389/db3a793458b8974f.jpg	0	2026-06-13 10:23:54.867309+00	checkpoints/440b648011e638ebf11d931e0bf15389/thumbnails/395de33bb08e5937.jpg
0d2720fe-8388-402c-91da-1fddf888f203	bd7cc9a7-ddc4-4254-8994-f6fc771a6b64	checkpoints/55e853465f52a6ce8e9936e4bb774d8d/0795881f5347ebdf.jpg	0	2026-06-13 10:25:38.644323+00	checkpoints/55e853465f52a6ce8e9936e4bb774d8d/thumbnails/00d721ee63fa5da0.jpg
54f56097-f74c-4e28-9e5c-3b843ecd299e	2594bd69-b389-49b0-9357-45462bf70c82	checkpoints/2e0de650fd810f8d17ba30487ea50d7d/756f370b2d374d2c.jpg	0	2026-06-13 10:43:26.024617+00	checkpoints/2e0de650fd810f8d17ba30487ea50d7d/thumbnails/af6cb9b11454c970.jpg
5d0ba0fa-5c45-47e6-a3ef-736ec32f289e	2594bd69-b389-49b0-9357-45462bf70c82	checkpoints/2e0de650fd810f8d17ba30487ea50d7d/f5e9a2a7f572c231.jpg	1	2026-06-13 10:43:26.024617+00	checkpoints/2e0de650fd810f8d17ba30487ea50d7d/thumbnails/c619e9d12b6f69a1.jpg
16f83afa-c88e-43d7-8384-c5da1d81ebb7	d5199ae6-77ca-45e5-9546-3a5f5c7f874e	checkpoints/624d372b185b5a3f15640164ea7773b0/6c598797e4a015b0.jpg	0	2026-06-13 10:44:16.076915+00	checkpoints/624d372b185b5a3f15640164ea7773b0/thumbnails/023ccfa314dd01f9.jpg
8671ddb7-b523-4220-b8e1-5fe0ce3f6d11	d5199ae6-77ca-45e5-9546-3a5f5c7f874e	checkpoints/624d372b185b5a3f15640164ea7773b0/555e65697e79a86f.jpg	1	2026-06-13 10:44:16.076915+00	checkpoints/624d372b185b5a3f15640164ea7773b0/thumbnails/5eb915ae0a0e4f79.jpg
6a355c57-a75b-4397-aa81-0090611c5c6d	e1575567-e47d-4c77-8ceb-33acd6b7b18e	checkpoints/3d1a12cc8cedc6f3c70f6a9c3dfcb02f/561a65aabb6a3959.jpg	0	2026-06-13 10:51:08.827432+00	checkpoints/3d1a12cc8cedc6f3c70f6a9c3dfcb02f/thumbnails/aadfe53b7d0e436c.jpg
dd5862ba-272f-47dd-8dad-a7057208e82d	198caa71-c383-45e1-ba15-92a6e106f82b	checkpoints/7d59f39cf4c44f3ea4d855e23e7981ac/fa08493200887383.jpg	0	2026-06-13 10:57:06.149215+00	checkpoints/7d59f39cf4c44f3ea4d855e23e7981ac/thumbnails/e80fc40a193da14f.jpg
9939f883-df7f-420b-9abc-1d7e7ca0edc6	22358dcd-0cd5-437d-b680-42f69b96c21d	checkpoints/a5566c54b2914068bfd1e85315f1a548/4593abc5f7f4bfd4.jpg	0	2026-06-13 11:06:06.000929+00	checkpoints/a5566c54b2914068bfd1e85315f1a548/thumbnails/0fceb3d4d642e330.jpg
866f5c5f-c9bb-4535-8741-2d4f160d473e	23a66b75-6379-424c-beee-7ca1b67f88d8	checkpoints/09abb9cdde2f534e9efee6085939fd53/369d114c9ac0e3b5.jpg	0	2026-06-13 11:42:51.043761+00	checkpoints/09abb9cdde2f534e9efee6085939fd53/thumbnails/fa622d553b9188d4.jpg
ed370c70-a016-4d5c-8cc2-dfadfe0bf228	23a66b75-6379-424c-beee-7ca1b67f88d8	checkpoints/09abb9cdde2f534e9efee6085939fd53/0ac960116e36e81d.jpg	1	2026-06-13 11:42:51.043761+00	checkpoints/09abb9cdde2f534e9efee6085939fd53/thumbnails/d1c058493795581a.jpg
0822ec18-6405-41c8-911f-f9ee8b4c72a8	c49833d6-f57a-490f-9dba-498512a50ece	checkpoints/8791e685a229256e084ee48ff3f7509f/4afc2f867085921e.jpg	0	2026-06-13 11:50:48.744631+00	checkpoints/8791e685a229256e084ee48ff3f7509f/thumbnails/29513b6213bedfbc.jpg
8ee9799d-50da-4848-89fc-0c4c29d4615d	229f2b25-a925-4b3a-97ed-df0fb47c77fb	checkpoints/c76086b10cf2a80e9cc7bb60b8ae2cbf/f23c2736d98ca258.jpg	0	2026-06-13 11:51:06.746641+00	checkpoints/c76086b10cf2a80e9cc7bb60b8ae2cbf/thumbnails/32ddc2ac37725bd6.jpg
c5ed7d1d-f533-4876-8aeb-7f9833834190	bdcdac6a-9985-4f70-b849-ac2c970097e0	checkpoints/e52cdaf1daa293c76d825ffc68469c26/4f0dee7ee7fa30eb.jpg	0	2026-06-13 11:52:27.054817+00	checkpoints/e52cdaf1daa293c76d825ffc68469c26/thumbnails/e70912439dc01a42.jpg
44bad5cf-5c0c-4e1f-950f-1fcb9f728c64	33a46cbf-f94b-4415-aa03-95be955c15e5	checkpoints/7f9767cbd28bff6a92dad716fa947adb/659cce893dab2075.jpg	0	2026-06-13 11:58:35.98258+00	checkpoints/7f9767cbd28bff6a92dad716fa947adb/thumbnails/f72256c264de6d7a.jpg
b261856c-a0d8-4749-a177-59ed4875e145	716227d6-44f0-4bb3-b747-fdbf18710977	checkpoints/83511fa8ce016d40a7a0ba14a5e03887/9e5800d842c0c56f.jpg	0	2026-06-13 11:52:48.48794+00	checkpoints/83511fa8ce016d40a7a0ba14a5e03887/thumbnails/c369cd29b7cdd4c8.jpg
e9fd924f-c421-4e44-a156-06abad8d02be	40af0117-3d4a-4efc-adb9-23e8801ae6fe	checkpoints/4436b5acc9ef741988a16777a789da72/625321cbfba34346.jpg	0	2026-06-13 11:53:12.608465+00	checkpoints/4436b5acc9ef741988a16777a789da72/thumbnails/4355536f819afa85.jpg
09b79023-134d-4c25-9a70-a9062041f9c1	ead3baa7-a131-42c8-9685-e8848b5a6fe4	checkpoints/e4c1c6fdb02892357a0a3afb933e78d7/f215a67edec7e9b1.jpg	0	2026-06-13 12:43:21.781056+00	checkpoints/e4c1c6fdb02892357a0a3afb933e78d7/thumbnails/e4585f53435f2083.jpg
9fd8b65b-ca6f-4e70-bb66-bd90159a211d	d94b23ab-bae4-46c7-a3c2-631389b61a9f	checkpoints/e21496612ee30bb9a381f151e756f6ce/cdb5ca4ac85d9968.jpg	0	2026-06-13 12:44:25.751701+00	checkpoints/e21496612ee30bb9a381f151e756f6ce/thumbnails/7ba9148e94f2a1bc.jpg
20740f6b-b0cd-4ac3-8cb4-9fb1ed9379ff	5f9404df-0712-42c8-9c28-bcc79af469f4	checkpoints/64e1495d88598475a4485ed0fcba9f1d/d0bd6240dcf3517c.jpg	0	2026-06-13 12:44:27.626505+00	checkpoints/64e1495d88598475a4485ed0fcba9f1d/thumbnails/5caac7a86333d705.jpg
cd5a328b-2e97-4628-81d8-cf6ad8720d56	5f9404df-0712-42c8-9c28-bcc79af469f4	checkpoints/64e1495d88598475a4485ed0fcba9f1d/ffe526806856e3ab.jpg	1	2026-06-13 12:44:27.626505+00	checkpoints/64e1495d88598475a4485ed0fcba9f1d/thumbnails/fe7da5d067055c7e.jpg
5fe8f0b4-b789-44c6-908e-6c3eba5b1891	01a1e767-e0ff-4fe6-92e0-ef7c429d2146	checkpoints/70d3e8ddc3caadc4c031e267eacea91b/e4ef66beec0762f7.jpg	0	2026-06-13 12:44:45.216893+00	checkpoints/70d3e8ddc3caadc4c031e267eacea91b/thumbnails/68f313ef146e03d6.jpg
21887a66-5644-4fd1-988d-144ec4c23d80	1121689a-e495-470b-acfa-dcfff9052bfa	checkpoints/302341c78119d88aaf8ecf56d8f2f093/b67f9e61692d3d35.jpg	0	2026-06-13 12:45:48.258892+00	checkpoints/302341c78119d88aaf8ecf56d8f2f093/thumbnails/f6ccc0874516c0b5.jpg
0ebc2dcd-e722-4481-a8a2-167fe2256624	1da89fc4-97b6-4216-82ab-32af5a21189c	checkpoints/e69d1a310fde82f8bb06876ffe9271ea/b8aadb5ca4bf9b0a.jpg	0	2026-06-13 12:46:00.261546+00	checkpoints/e69d1a310fde82f8bb06876ffe9271ea/thumbnails/f7f269a011e5151b.jpg
4a160d47-5c30-429e-a11b-8c7f0e9ac7a6	21f92c63-d5e2-4657-a131-223cae91d25c	checkpoints/7b34834baa0984b0eb8d925619745be3/6ea4840c3461143c.jpg	0	2026-06-13 12:46:55.741181+00	checkpoints/7b34834baa0984b0eb8d925619745be3/thumbnails/3be6cd3f0e9d0ce2.jpg
aca413f0-c539-454e-9929-a5a9ac32c7cf	f8bb7c1e-13fa-4d93-8027-749a599ca4d2	checkpoints/269e3587210166266019bd7be1f0fd72/5af9c73a1b5b6596.jpg	0	2026-06-13 13:03:19.697583+00	checkpoints/269e3587210166266019bd7be1f0fd72/thumbnails/e12d2f53d335e556.jpg
b716a35b-c7bb-4918-93af-405794a61a23	75cfbc96-e4c5-46af-a3b8-a3a07695eed5	checkpoints/ae0737034ddec4a7e4918052d2c2d699/572ea1fc1b0a38bf.jpg	0	2026-06-13 14:19:28.004552+00	checkpoints/ae0737034ddec4a7e4918052d2c2d699/thumbnails/95dcb68aa4c4fa49.jpg
e5a5539a-5ec2-4d56-92d8-f984521d506c	f12b1483-d695-4115-9e9e-d179ae1e9efd	checkpoints/d50bb4f529dd785c51825edeb628f3af/8b106210747b0f50.jpg	0	2026-06-13 14:19:56.884073+00	checkpoints/d50bb4f529dd785c51825edeb628f3af/thumbnails/9d768075824e8dae.jpg
2befa17e-cdd8-47f9-9de2-d4834efb6135	919c7081-87b7-4a22-91a3-efe52abb824e	checkpoints/12d4485d77f34e90f85bc08ffdff7589/441de9c87ef29d3b.jpg	0	2026-06-13 14:20:14.338765+00	checkpoints/12d4485d77f34e90f85bc08ffdff7589/thumbnails/2e36c24829b18ecf.jpg
61d3a758-c419-4c8a-b8d5-aef6605b7bbe	0f4299d0-8d64-4316-a42c-347de07d7c9d	checkpoints/c5192bd217947e474dcc8e7e4f91d81c/af0e29e4d7c02593.jpg	0	2026-06-13 14:40:05.073618+00	checkpoints/c5192bd217947e474dcc8e7e4f91d81c/thumbnails/06a46a1eba45fcf5.jpg
ecfc149b-470e-4f86-98fc-36ede1f6a38b	703acff7-ee10-48e1-bbe9-31804de951b0	checkpoints/bc3c3075ca44f371e10e2e19a2d7cc2d/7778aa9811aca734.jpg	0	2026-06-13 14:40:12.234655+00	checkpoints/bc3c3075ca44f371e10e2e19a2d7cc2d/thumbnails/1b0f7cae6f603434.jpg
c3f9ea8d-6d52-49af-8006-a05f06de8139	abfb5933-ba04-4122-9af4-8a8b9b3b1989	checkpoints/e4964951caf0d6678732770bcf886f38/8154245bae2a5913.jpg	0	2026-06-13 14:46:00.210862+00	checkpoints/e4964951caf0d6678732770bcf886f38/thumbnails/28b0e809002f10f8.jpg
26e2f332-a653-4f62-8c9d-ded338b8d09d	2b504bd1-3fa3-4883-a92c-0be5744b2f95	checkpoints/e16f0ed51a9796382ff1cc231a942ec5/f541fba48a19cdcf.jpg	0	2026-06-13 14:57:47.528905+00	checkpoints/e16f0ed51a9796382ff1cc231a942ec5/thumbnails/28e3aa20d4984e81.jpg
6cb08249-0837-4f21-af5f-77a345c1a258	6e4f0460-7547-49f3-85d9-0c094586636d	checkpoints/9e292b5c1ca145ecd33f0e6d476ad9ae/f08ac75d2001e5f7.jpg	0	2026-06-13 14:58:50.963197+00	checkpoints/9e292b5c1ca145ecd33f0e6d476ad9ae/thumbnails/5abfff42a57794a7.jpg
941c76fc-088b-4e95-989d-a36ee375d5c8	2b26e607-a208-472b-999a-388fb69f4ad8	checkpoints/bb8805d7b600be79852c3762f1cd111a/a48edb8983e55170.jpg	0	2026-06-13 14:59:57.576271+00	checkpoints/bb8805d7b600be79852c3762f1cd111a/thumbnails/ec073eff15d0aa86.jpg
278e1425-142b-4aa7-ad7f-3fdf923df4a3	9c9ad02b-0ed1-478f-986b-653c3dd1ac3b	checkpoints/c5739c123383f403c591609f2b3a1835/f000d76845d058fe.jpg	0	2026-06-13 15:22:37.078623+00	checkpoints/c5739c123383f403c591609f2b3a1835/thumbnails/0de3d4ba08aa618e.jpg
2e0ec099-67b5-42e3-a40d-adfe0e0fee0c	c113752c-5282-4fbd-ad74-d4d279ca9ccc	checkpoints/3bb73df89c744d4e5d23740367195692/211c534ed419456b.jpg	0	2026-06-13 15:23:05.951005+00	checkpoints/3bb73df89c744d4e5d23740367195692/thumbnails/213e41260019f7f6.jpg
78f64cfd-9ba6-40b5-90be-0686824247b4	84e72417-977b-4f43-bbff-b61880aae25d	checkpoints/3d08b9155c4fe11a367f5377eddaffcd/573265d20bf8a733.jpg	0	2026-06-13 15:30:35.399311+00	checkpoints/3d08b9155c4fe11a367f5377eddaffcd/thumbnails/8b3f1bbaf25d3985.jpg
23c71eb7-a4bb-4f66-b6c6-e930fc2ce892	51da2bc0-75fd-407e-a4c8-7dcb9bdb8935	checkpoints/bb6c8d077616318fbe315091f2fa8800/54547041eaf11efb.jpg	0	2026-06-13 15:34:33.707464+00	checkpoints/bb6c8d077616318fbe315091f2fa8800/thumbnails/de19f089956367c8.jpg
1c48fb27-dc7e-4658-a279-68f5f8f88704	cea21473-bd93-40f5-a8c3-5e7ea62c9e90	checkpoints/a96e177ab1d59fb680862f543c4515c3/4e59e6620180e8fa.jpg	0	2026-06-13 18:04:01.433371+00	checkpoints/a96e177ab1d59fb680862f543c4515c3/thumbnails/78e75500b853442c.jpg
74a55d12-03fe-48b5-8860-61636031dddb	965ea106-0a95-42dd-b564-a45e697441f2	checkpoints/01ca855089a25c324a5e248360dabb25/02932d041431192b.jpg	0	2026-06-14 02:20:15.075773+00	checkpoints/01ca855089a25c324a5e248360dabb25/thumbnails/97913107276f9c60.jpg
a7317fb3-dcc2-4e83-9c7a-c00e2e77b943	3b71097d-02da-4811-a348-8f4185234713	checkpoints/0e0be946e5ee08615d4451746b82954e/884696709bafcf50.jpg	0	2026-06-14 02:23:14.844405+00	checkpoints/0e0be946e5ee08615d4451746b82954e/thumbnails/2bd18c2e25664be6.jpg
97e7071b-e06d-460c-b173-f346d68829c5	b089a495-2a03-409b-bf09-8c5a2d76d689	checkpoints/cec1990ce3bee61472437ce0bc78fd58/b94d1a8fb9b27abd.jpg	0	2026-06-14 02:23:41.102704+00	checkpoints/cec1990ce3bee61472437ce0bc78fd58/thumbnails/e21acb4700c0df68.jpg
c6469742-3681-49e2-92bd-87a072c6f56c	4057ff11-0ea4-4dc3-8c1e-c1a76afc50b4	checkpoints/c1499e1bedc34a39a47df89b29b17a1c/050098588b2a7e29.jpg	0	2026-06-14 02:51:03.458637+00	checkpoints/c1499e1bedc34a39a47df89b29b17a1c/thumbnails/c35f61db577cb731.jpg
eac08a3f-b9b8-4bf4-b055-9ed58929a9d1	f1f41aeb-2212-4d43-b8b7-8de89432ac81	checkpoints/f3b6547a7c19f2e8db8d6bd1d5fac23c/dab9e368d1954406.jpg	0	2026-06-14 02:56:02.00918+00	checkpoints/f3b6547a7c19f2e8db8d6bd1d5fac23c/thumbnails/475808ec24182d1b.jpg
3f106e9e-b346-4c57-8ccb-682b8103db84	0e255bd8-44d8-4703-bed5-69eebed796c1	checkpoints/41545e0d6407b4a472d8f5bc2ff2df12/cc8f4b4fa01f29be.jpg	0	2026-06-14 02:56:03.870432+00	checkpoints/41545e0d6407b4a472d8f5bc2ff2df12/thumbnails/c566c5b5557e91a9.jpg
2e366fb2-7c2d-4b15-abae-9895dcb797d2	0e255bd8-44d8-4703-bed5-69eebed796c1	checkpoints/41545e0d6407b4a472d8f5bc2ff2df12/c81d3642fba94d58.jpg	1	2026-06-14 02:56:03.870432+00	checkpoints/41545e0d6407b4a472d8f5bc2ff2df12/thumbnails/1466e80930445c0e.jpg
2c263acf-9b90-4de5-8c9a-68d0f93202e2	c613718b-aa46-4b20-ae44-740071ccd596	checkpoints/20a2380e195554c554ffdc37e226e80b/ccd7b10803002779.jpg	0	2026-06-14 05:17:14.741574+00	checkpoints/20a2380e195554c554ffdc37e226e80b/thumbnails/3b99b60921b6a9d3.jpg
cd68b4f2-36ff-4595-af7f-4e1890dff26f	f4555e91-3e97-4bc3-8d05-38a880d3ab9b	checkpoints/e3035d6900b327313e1a74e3595e3e83/2d5d7c2604e1928c.jpg	0	2026-06-14 06:13:45.499523+00	checkpoints/e3035d6900b327313e1a74e3595e3e83/thumbnails/9e8f31d7dc03d1cc.jpg
f6f57e59-438e-4037-9dbf-d5ba6e797767	6d3235f1-1afd-42a8-914d-63edef7a37ae	checkpoints/e58851f4e53931a2c6429f5f3735c6f1/4b0da269d0925fca.jpg	0	2026-06-14 06:28:12.789982+00	checkpoints/e58851f4e53931a2c6429f5f3735c6f1/thumbnails/19c77c74570f55f1.jpg
8e7801a9-0ce5-4ac0-9745-07a57dfc6a02	743bdc55-eb93-4ced-ab5d-6debfa081ed8	checkpoints/ed32e77f2a938afa37dee625e55486ca/dcebaf2aad187e4d.jpg	0	2026-06-14 09:17:40.743538+00	checkpoints/ed32e77f2a938afa37dee625e55486ca/thumbnails/11326459fbe8c6db.jpg
09759f64-4919-481d-b938-81388a8ff2a3	4d123179-5094-445f-9e87-363475923d1c	checkpoints/8f53c65f26197d9a6ef99b9fbcb2871e/7193b3c5abf8b5ae.jpg	0	2026-06-14 09:35:21.292893+00	checkpoints/8f53c65f26197d9a6ef99b9fbcb2871e/thumbnails/813076d51d7f5b97.jpg
c2b93d0a-9a16-47ea-8466-61702f67b12e	678cbdd5-ece4-4cd2-9878-471de59a4242	checkpoints/6fc79667d5c974976d6f3b3e435be8cf/633ac579e681b6cb.jpg	0	2026-06-14 12:47:01.32722+00	checkpoints/6fc79667d5c974976d6f3b3e435be8cf/thumbnails/42c59e1f7fd76758.jpg
5db74a07-c690-4baa-b9aa-3525dda781de	678cbdd5-ece4-4cd2-9878-471de59a4242	checkpoints/6fc79667d5c974976d6f3b3e435be8cf/b975f27fbdc7e68b.jpg	1	2026-06-14 12:47:01.32722+00	checkpoints/6fc79667d5c974976d6f3b3e435be8cf/thumbnails/075ab9a80790ebd9.jpg
606e0d0e-d06c-48d9-953d-609fc3b03272	e0444098-7a84-4943-b71b-46a7d9f02d69	checkpoints/88bd9f5367a4eb32288f4d0682d36fda/277773f19dd50e88.jpg	0	2026-06-14 13:54:53.765035+00	checkpoints/88bd9f5367a4eb32288f4d0682d36fda/thumbnails/f1bb0f2accbf54fb.jpg
a57e6ec2-3e51-459e-b88f-0a703d7242cf	5528fa5a-26c2-417a-bf13-d7b027e9ffb3	checkpoints/c9a658b3d14f342767029a2fde44dfab/717cdbcfd3cf4ba4.jpg	0	2026-06-15 00:07:51.188813+00	checkpoints/c9a658b3d14f342767029a2fde44dfab/thumbnails/f1872c9f55e2cd3d.jpg
a3c7bd5c-6a86-4b91-9529-4f5b212d02a6	5528fa5a-26c2-417a-bf13-d7b027e9ffb3	checkpoints/c9a658b3d14f342767029a2fde44dfab/1a8139c09f171815.jpg	1	2026-06-15 00:07:51.188813+00	checkpoints/c9a658b3d14f342767029a2fde44dfab/thumbnails/f373f1e305c4a470.jpg
9541e8ff-f03e-431f-82cb-5351f139f49e	865809f4-8421-44ad-83bb-f4713fe069dd	checkpoints/a79d7a65e323d77e8e8546c9c3d8e751/178ae0a34c586d18.jpg	0	2026-06-15 01:12:51.90938+00	checkpoints/a79d7a65e323d77e8e8546c9c3d8e751/thumbnails/7734310b717361c4.jpg
\.


--
-- Data for Name: checkpoint_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."checkpoint_reactions" ("checkpoint_id", "user_id", "reaction", "created_at", "updated_at") FROM stdin;
6d3235f1-1afd-42a8-914d-63edef7a37ae	4f8f526b-cb59-411a-8689-bd75b8ad0138	love	2026-06-14 08:00:00.016756+00	2026-06-14 08:00:03.497798+00
6d3235f1-1afd-42a8-914d-63edef7a37ae	53d98013-bbd3-423a-84ae-3803a841f72c	fire	2026-06-14 09:01:19.78014+00	2026-06-14 09:05:01.654399+00
965ea106-0a95-42dd-b564-a45e697441f2	4f8f526b-cb59-411a-8689-bd75b8ad0138	like	2026-06-14 09:16:35.29494+00	2026-06-14 09:16:35.29494+00
4d123179-5094-445f-9e87-363475923d1c	cd64452e-ed42-49d8-902c-eeca68d455cd	sad	2026-06-14 10:21:45.208479+00	2026-06-14 10:26:04.59965+00
4d123179-5094-445f-9e87-363475923d1c	4f8f526b-cb59-411a-8689-bd75b8ad0138	haha	2026-06-14 10:23:58.100779+00	2026-06-14 10:28:31.71822+00
4d123179-5094-445f-9e87-363475923d1c	01364b6d-0292-47cc-8f5a-7054d3652276	sad	2026-06-14 10:30:42.103991+00	2026-06-14 10:33:49.018635+00
6e4f0460-7547-49f3-85d9-0c094586636d	4f8f526b-cb59-411a-8689-bd75b8ad0138	haha	2026-06-14 10:54:15.362727+00	2026-06-14 10:54:15.362727+00
c613718b-aa46-4b20-ae44-740071ccd596	4f8f526b-cb59-411a-8689-bd75b8ad0138	love	2026-06-14 10:41:35.10335+00	2026-06-14 12:46:54.376724+00
678cbdd5-ece4-4cd2-9878-471de59a4242	4f8f526b-cb59-411a-8689-bd75b8ad0138	love	2026-06-14 12:47:23.50976+00	2026-06-14 12:47:23.50976+00
678cbdd5-ece4-4cd2-9878-471de59a4242	821768a5-8bb9-464e-a083-6225736a26b5	like	2026-06-14 12:48:16.736072+00	2026-06-14 12:48:16.736072+00
678cbdd5-ece4-4cd2-9878-471de59a4242	543eb38c-7878-41b0-b2e6-a58cbeb0fa06	like	2026-06-14 13:37:59.529592+00	2026-06-14 13:37:59.529592+00
4d123179-5094-445f-9e87-363475923d1c	543eb38c-7878-41b0-b2e6-a58cbeb0fa06	like	2026-06-14 10:20:02.335582+00	2026-06-14 13:38:06.556097+00
e0444098-7a84-4943-b71b-46a7d9f02d69	4f8f526b-cb59-411a-8689-bd75b8ad0138	like	2026-06-14 13:58:58.585975+00	2026-06-14 13:58:58.585975+00
865809f4-8421-44ad-83bb-f4713fe069dd	520f96ef-7103-414c-8400-da6b60663eb8	haha	2026-06-15 01:57:22.840665+00	2026-06-15 01:57:22.840665+00
f4555e91-3e97-4bc3-8d05-38a880d3ab9b	520f96ef-7103-414c-8400-da6b60663eb8	love	2026-06-15 01:59:54.26663+00	2026-06-15 01:59:54.26663+00
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."follows" ("follower_id", "followee_id", "created_at") FROM stdin;
4f8f526b-cb59-411a-8689-bd75b8ad0138	520f96ef-7103-414c-8400-da6b60663eb8	2026-06-14 07:06:45.288897+00
4f8f526b-cb59-411a-8689-bd75b8ad0138	821768a5-8bb9-464e-a083-6225736a26b5	2026-06-14 13:53:52.833238+00
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."refresh_tokens" ("id", "user_id", "token_hash", "expires_at", "created_at", "revoked_at") FROM stdin;
7810de33-bffa-42dc-831e-71bb8aa69a48	4f8f526b-cb59-411a-8689-bd75b8ad0138	ab6059b7950d2865f39e1353cda5d32c5da5e0b1dc5fa259514e627b1d9d3ac4	2026-06-17 04:11:07.845273+00	2026-06-10 04:11:08.061777+00	\N
3a2b9fe2-3eab-4518-83d4-1d7aab4c0367	4f8f526b-cb59-411a-8689-bd75b8ad0138	74c3c836f7e90078d5e62c73222abe0545c1ee88d4521d4905af6932a137ddb6	2026-06-17 04:11:08.241144+00	2026-06-10 04:11:08.332381+00	2026-06-10 04:15:03.366595+00
0efec8c5-e621-4fe6-b4e8-306c1a8dd9c3	2e0bd89b-124e-47d5-9336-ea8f50d89950	4d00a24c4a0461fc228b83701f9c6988018f968ee0d15daf75d925274c42e469	2026-06-17 04:15:14.124096+00	2026-06-10 04:15:14.335867+00	\N
e296f72a-27a7-48d3-ad66-8448d4e44e76	2e0bd89b-124e-47d5-9336-ea8f50d89950	c80e02bfef53538519d73160584c1b6d31616aeef6908b10cd203d53ce10bbc3	2026-06-17 04:15:14.51729+00	2026-06-10 04:15:14.602733+00	\N
a1429a86-fd33-45ac-a9d8-7c9417a4c8bf	fae451b5-149e-4490-a50e-53cb946bd425	37609e0cfbe356aa60e1a0b60b9b46450adc2b2f770b144073c48ec41f751891	2026-06-17 04:34:04.945879+00	2026-06-10 04:34:05.086882+00	\N
18c65199-1328-4bf9-bd79-35f0b757d871	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	6c5aaed23d8eaf5b7514bd8757fe1eb929767139e23622d6f02e654a81f025a3	2026-06-17 04:38:53.672348+00	2026-06-10 04:38:53.716512+00	\N
4318965a-86d2-420b-a449-b12701762534	826d1485-378e-4a4a-b1a8-bb1f6425c6d7	e1f94de282dcc3cef3ead5da309bad8bd488a129593c960d8414493f6d8f2301	2026-06-17 04:42:31.280043+00	2026-06-10 04:42:31.324633+00	\N
fa941507-20c1-4c5c-ae71-ce87907f92b7	efd3fee0-fe7e-4917-943f-a401124ca5b6	01351bd7f797dfdc32f4db0bd485a2e3a0c76139c3bbe990bafb8006e00207d6	2026-06-17 04:42:44.348706+00	2026-06-10 04:42:44.393956+00	\N
5c0dc7c5-5711-4094-8e4e-9aad68d897a4	2e0bd89b-124e-47d5-9336-ea8f50d89950	4bfe389107162894f623183b94b35ddaf1369ae53fef727976d90678b177f204	2026-06-17 05:03:45.554087+00	2026-06-10 05:03:45.763799+00	\N
b2c09f7c-ef0f-4214-9db4-a249f6c737e4	2e0bd89b-124e-47d5-9336-ea8f50d89950	6d34f29c34aebc1972627567b541576b691e01fbe9a318c83d20c5cf398e04bb	2026-06-17 05:03:46.320593+00	2026-06-10 05:03:46.525882+00	2026-06-10 05:20:07.647871+00
9715b2d9-6d0f-43a0-93f6-139626a72e18	2e0bd89b-124e-47d5-9336-ea8f50d89950	8d3b9f4c28a5c5636e4e5ef364e517a1727eff65dc6b5cd5e418ebcba3484153	2026-06-17 05:20:07.966768+00	2026-06-10 05:20:08.174284+00	\N
59fdb3f2-6f3d-4a8d-a9fb-838b4cac2133	fae451b5-149e-4490-a50e-53cb946bd425	5a3aa0763ab7c7c9848277920719a4e8c6c898f5df833c69e680cc5c34c9b148	2026-06-17 04:34:20.985208+00	2026-06-10 04:34:21.029526+00	2026-06-10 05:33:12.614102+00
2a20891d-f302-41ab-9c45-649482ac9fb1	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	c78db4701d6f67c323f02a7c075fc26e7e345c4186d8d297a0edc20ed169673b	2026-06-17 04:38:54.156554+00	2026-06-10 04:38:54.200783+00	2026-06-10 05:33:49.792061+00
8aece13c-f935-43e5-9b4f-ac8e3b05cb34	2e0bd89b-124e-47d5-9336-ea8f50d89950	b1b041901caf256577cbe943c7004b9c51b772274db0269f147f4376cedc879b	2026-06-17 05:20:08.749688+00	2026-06-10 05:20:08.947884+00	2026-06-10 05:41:10.055488+00
d239af64-fc16-488a-886e-1bc39ab4c0b2	2e0bd89b-124e-47d5-9336-ea8f50d89950	d38bb9ae4ba075d8a1ed2c034802d8c38c087646e45d7ac26358ac6790bad234	2026-06-17 05:41:10.208851+00	2026-06-10 05:41:10.253771+00	\N
ef293f28-46e3-418d-8d5a-ed528eba5ddf	2e0bd89b-124e-47d5-9336-ea8f50d89950	8c9a54465fb089fad0cf1a3ffaf331049ca69d547c0e871910d997f6601771dc	2026-06-17 05:41:10.943623+00	2026-06-10 05:41:11.085683+00	2026-06-10 05:41:11.475416+00
0b77d688-ecbc-4d56-b48a-9e0c2ec6cb3f	fae451b5-149e-4490-a50e-53cb946bd425	ddb90d1b3e38046e0027fb45d47fa33831ac87548ba2378a069d770ec34f7b5b	2026-06-17 05:33:12.86013+00	2026-06-10 05:33:13.000491+00	2026-06-10 05:49:12.732445+00
daf8fcc1-9327-45c8-b731-74b03e9a3366	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	a6d583d8f211ff44d8e4fcb8259548e4f4ae9fd5961bb6d1f205f8d49758aa83	2026-06-17 05:33:49.938613+00	2026-06-10 05:33:49.983614+00	2026-06-10 05:49:31.29923+00
96fd0c43-5fca-4e09-a85a-144ea232ea87	f0629d87-0f29-41cb-bb8a-5417d3bfc630	deb2d8fc588e1f364fa188fa330cf72353c6bfa72f04e240e5dc24666cab61a1	2026-06-17 05:53:59.215709+00	2026-06-10 05:53:59.260607+00	\N
8189a31a-2056-45f8-80e1-5684ed4e941c	fae451b5-149e-4490-a50e-53cb946bd425	cd1f5b5f750d9f2f942209b27a56b41fb6ddc29a2330168cf284cafc1c9800b3	2026-06-17 05:49:12.883074+00	2026-06-10 05:49:12.927698+00	2026-06-10 05:54:30.912288+00
76b9e9cc-d885-48b2-971c-d2e9d6d1187b	76fedef6-be58-4708-96f8-f281b0c691c0	ea3f71d44d2578e5caa1e3aba53456d6a227e5e3b533720db0ac3534d9c8319c	2026-06-17 06:03:46.929263+00	2026-06-10 06:03:46.974232+00	\N
71811f6a-0b5b-4f00-bbe0-b2a1cdd9a604	efd3fee0-fe7e-4917-943f-a401124ca5b6	99baeb727b434433d4b9fba03df475a2dc17fc52f52616372d91da3da56f5344	2026-06-17 04:42:44.595766+00	2026-06-10 04:42:44.641389+00	2026-06-10 06:05:02.228107+00
d5c8a7f5-869a-4d54-9a3b-bd53bce558a9	9f7d5180-abe1-4c22-b640-1644c4f3640d	29e26a7eede1bd7fce67d4c272f8344d073f43e45dc9f68b5034c7c036c4348b	2026-06-17 06:12:42.582163+00	2026-06-10 06:12:42.627137+00	\N
955074f8-61c3-4d7c-99ba-a8c18b72b112	9f7d5180-abe1-4c22-b640-1644c4f3640d	eb7826e0f01862d6c8cb013f228ae21e8600f7c681320d0f7b5f0292e7623de0	2026-06-17 06:12:42.818096+00	2026-06-10 06:12:42.862737+00	\N
5fd29258-477c-4c3a-b841-7b66159cf15a	76fedef6-be58-4708-96f8-f281b0c691c0	9327fba47a0a87cdf8f139676777b515ceda8f48996a1cb14555920969c4cf56	2026-06-17 06:03:47.174166+00	2026-06-10 06:03:47.219141+00	2026-06-10 06:18:49.282034+00
8983eaa2-6474-4c80-96d4-0bf64eba79c8	76fedef6-be58-4708-96f8-f281b0c691c0	1bbeabaca191bf59160c17680508a95400fa1d32e25460dea9befd00a3c9c6de	2026-06-17 06:18:49.435137+00	2026-06-10 06:18:49.478891+00	\N
fc5b9d94-9262-4472-9af4-d96b0cd325fd	76fedef6-be58-4708-96f8-f281b0c691c0	6bb0bc3c4fbf65791133011fce0955cbdd24be35d4a568f38e9cba6ffc729930	2026-06-17 06:19:01.176174+00	2026-06-10 06:19:01.221073+00	\N
79592163-9f36-4dc7-8280-27e97b7599e3	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	c1c1a914eadc640e693d8f69ca42cc82656be87753b65a07bddf78e3f39ae1fc	2026-06-17 05:49:31.447477+00	2026-06-10 05:49:31.491716+00	2026-06-10 06:21:30.707344+00
bf254019-e52b-481a-83f3-4c5b1250125a	72983125-1336-4911-93f1-58817ccf8795	8503d92161af375ccbaecd4233806d67a8745b36d0ccc711dfe542cd1deda622	2026-06-17 06:36:34.800287+00	2026-06-10 06:36:34.846026+00	\N
1df58963-1422-4993-a099-c6d4025de860	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	d2163a03f5f1143d0ac44dd87a133cba0ba4cd824467b3cda14230976551feaa	2026-06-17 06:21:30.964168+00	2026-06-10 06:21:31.105793+00	2026-06-10 07:31:57.820529+00
6c215981-fc8b-4837-8074-6888b8233969	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	5dc8a5e29ef33d267e099e5f13363ae69e67957afa2a5d41800e81f9cfd39bf4	2026-06-17 07:31:58.074139+00	2026-06-10 07:31:58.215961+00	\N
ba58db0b-d391-4b14-8f8a-779f65f7b095	76fedef6-be58-4708-96f8-f281b0c691c0	1e2e1e14cb186a4f7fb589dab81986163e94990da7353332bfbee70c100a740f	2026-06-17 06:19:01.140922+00	2026-06-10 06:19:01.185035+00	2026-06-10 07:35:24.783593+00
c306e424-c0f0-4a16-8dc0-ca7f6828ad51	76fedef6-be58-4708-96f8-f281b0c691c0	a251d7fdd63782040eb301f095b53a9a7c04f66d83c64ac387bce9ef8929341c	2026-06-17 07:35:24.933642+00	2026-06-10 07:35:24.978205+00	2026-06-10 07:40:03.12266+00
f0f565ce-fc79-4f89-951d-b1d7f7828aa5	4f8f526b-cb59-411a-8689-bd75b8ad0138	b6cccff3b1852fa7254fb6076cb350e7714178212b051b96bc35a44bb4e2bba9	2026-06-17 07:40:13.163086+00	2026-06-10 07:40:13.210179+00	\N
9d5026db-19c9-49f5-9f07-1998be6f41c8	4f8f526b-cb59-411a-8689-bd75b8ad0138	be4e79ba0b9e9bdf109879d31ebd3c4673e7edfcbfb0b9f8079713c1ed0fa8c1	2026-06-17 07:40:13.260122+00	2026-06-10 07:40:13.306512+00	2026-06-10 07:40:24.17872+00
36081487-c801-4fa0-bd5a-c0e4c426c3eb	f03c0851-61bf-48e3-b074-73baedcc9a5e	8e64aa1662deb9463205f23738a54abcc73fbf6869ee43add5353978a896d775	2026-06-17 07:40:30.963686+00	2026-06-10 07:40:31.009613+00	\N
97a8fa38-9bc1-42c7-b6bc-f37ed7ba7843	f03c0851-61bf-48e3-b074-73baedcc9a5e	a4a02f4483cb2bc84d3e4195d352afa8cff51457fd0ad7c70484c38b3969219e	2026-06-17 07:40:31.198992+00	2026-06-10 07:40:31.244746+00	2026-06-10 07:40:52.571092+00
387e0f2c-d0cd-4fd2-8891-83aecd540e61	4f8f526b-cb59-411a-8689-bd75b8ad0138	f9fe9cd9960702fa2f6a0764456d4e84fa79f490633556f5c2c78fb775ee343e	2026-06-17 07:41:00.510501+00	2026-06-10 07:41:00.55751+00	\N
585ec56e-d0c8-4dd3-a078-ae5154052653	2e0bd89b-124e-47d5-9336-ea8f50d89950	9a8767fafc4390e6bad8329a930c71af05a3b32238aa2f7a916a47d616dae7cc	2026-06-17 05:41:11.71923+00	2026-06-10 05:41:11.764651+00	2026-06-10 07:44:57.606084+00
49cf2918-4b64-4d3a-8646-61b38ba679ad	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	18e00bd840de92ef57523f1901cf60cf34dffa81504ddac7467ed6d21d0a0de8	2026-06-17 07:32:00.559129+00	2026-06-10 07:32:00.701701+00	2026-06-10 07:53:27.943215+00
35e3e398-e24d-47bd-a3dd-0bd362930f65	2e0bd89b-124e-47d5-9336-ea8f50d89950	2f05882485f7249bd2556137eee64800b706baab99ea510f89a8a9795596f6b7	2026-06-17 07:44:57.754192+00	2026-06-10 07:44:57.800213+00	2026-06-10 08:01:12.508106+00
2fd9be1d-e71f-4105-be76-c3c58829e134	2e0bd89b-124e-47d5-9336-ea8f50d89950	a55fa5ec7b9f1a671eee2f8bd1e3eb287785839aad7a1ab6eaa2bd52de89b341	2026-06-17 08:01:12.654901+00	2026-06-10 08:01:12.701196+00	2026-06-10 08:16:31.532199+00
3c74c5fd-afdd-4a99-bc6a-f90c31e9bb16	efd3fee0-fe7e-4917-943f-a401124ca5b6	c06f614d0bfa1e5e469e0858ee2394a5d9f35735444160b2e1a6a8b6f1af629e	2026-06-17 06:05:02.380879+00	2026-06-10 06:05:02.426436+00	2026-06-10 08:40:13.638874+00
1315f1ac-e32e-4024-bf9e-bb1571f0ac4e	efd3fee0-fe7e-4917-943f-a401124ca5b6	e2f18dde9bad1188efa9455f3d96c9813cc7e1c27cdb62b40c1770adaf9efe39	2026-07-10 08:40:13.792831+00	2026-06-10 08:40:13.933563+00	\N
88f19e95-7301-477d-8ba8-1003cf0e7fd4	4f8f526b-cb59-411a-8689-bd75b8ad0138	43b81a4e46d4e99379c61f6547a64185e8564e8381bd2049d4ebb9d7bb9e9c12	2026-06-17 07:41:00.510915+00	2026-06-10 07:41:00.557012+00	2026-06-10 09:51:59.216198+00
40e1a313-7d7b-4dfc-ada5-c9178189674c	4f8f526b-cb59-411a-8689-bd75b8ad0138	4d6db989c9a73fa93eff530f0ba985decfd4de2b750fee9f47cac61b51534c70	2026-07-10 09:51:59.463632+00	2026-06-10 09:51:59.602669+00	\N
7532548d-c1e8-4e96-9b8e-d0ec90e6e683	d782bf6e-51ea-4f57-931f-5135650029fb	611ef4d052a540eba248bf46471dee9751023bc63786ac786a64d458d09decbf	2026-07-10 10:01:07.922488+00	2026-06-10 10:01:07.96573+00	\N
e93118d3-e353-461b-bbab-42597ba66fca	2e0bd89b-124e-47d5-9336-ea8f50d89950	54af8a8f731dcd049b5adc7d0f5671b5e6334d494c60e2c8444c5937fc0a8220	2026-06-17 08:16:31.682254+00	2026-06-10 08:16:31.72681+00	2026-06-10 10:17:06.556005+00
106f8e07-2dcc-42cf-853c-4e18681251b7	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	5e34de8beffbdb3c8a6b580fc7abbbcde842ad17002ed627303ed5f968dc9fb6	2026-06-17 07:53:28.092177+00	2026-06-10 07:53:28.138867+00	2026-06-10 10:26:53.627206+00
48b79ad1-7791-41b3-98f8-f55c1b1acbba	826d1485-378e-4a4a-b1a8-bb1f6425c6d7	ce6859aa5c4f2a2239d2555fe540638f6d0884e1161a3ac2dff4061984798d85	2026-06-17 04:42:31.574502+00	2026-06-10 04:42:31.619333+00	2026-06-10 13:08:49.602661+00
38cb21ca-b66a-4b47-9c60-4e84697d2738	72983125-1336-4911-93f1-58817ccf8795	9581b7c7469188ebd6c860fff2d6b1d00b90259d4b3cf536b10d88029b97aa00	2026-06-17 06:36:35.061956+00	2026-06-10 06:36:35.10745+00	2026-06-11 08:54:12.868288+00
e89e9f8b-b1e6-4234-9833-2fd372ed8cba	d782bf6e-51ea-4f57-931f-5135650029fb	e3c4388907bbb0e633294e4b39ea06f9f4d9913af5618168bc73a0f4ee9b89bc	2026-07-10 10:01:08.187124+00	2026-06-10 10:01:08.230571+00	\N
165c1b98-bc7e-4204-a085-4580898c132a	2e0bd89b-124e-47d5-9336-ea8f50d89950	5bc4469f8526e22e6e7bf9cc8bd65d222b0e600a4de0fc7dc4990034744fc75b	2026-07-10 10:17:06.726668+00	2026-06-10 10:17:07.078851+00	\N
cf77a36f-c40b-4ee6-9b9b-e608b8faef4a	0342e751-0cee-4e4b-8724-3650c6d0d0ae	f1b1c6a0ec15038b94435f59ab0b376a8e35a89bfd8861d8fad44165fa135a0f	2026-07-10 10:32:12.210581+00	2026-06-10 10:32:12.354488+00	\N
4706f079-e6e8-4c59-abc8-949fe4a76c6a	826d1485-378e-4a4a-b1a8-bb1f6425c6d7	70c2def85cc94b5d237de73679505caf71b0de5f8b38c4b7266b7fac9c9865a7	2026-07-10 13:08:49.847947+00	2026-06-10 13:08:49.988942+00	\N
c2c2a29d-ddf9-445f-a72e-96c11cb7fb9b	335c2b65-8f3e-471e-9369-9ad607f08444	b56413d92686d0b50ed476f680b39e6c218784a94b162911cc0445b779fa8afc	2026-07-10 13:33:26.402509+00	2026-06-10 13:33:26.674034+00	\N
0f28f5fb-7b11-46f8-b0c0-13d8852c77e9	335c2b65-8f3e-471e-9369-9ad607f08444	80f6991615f255e5fb64f20f102917160e1b2183cf821464325ecb3f08c822c9	2026-07-10 13:33:26.913417+00	2026-06-10 13:33:27.038607+00	\N
4106222d-3b1e-4116-974a-c6d77e22850f	4fe46da0-ef42-4d2a-ab95-7e580c1583f3	fcb24b437573a0d9b55152de3572022ffc8d88599dcced03ffcb2937555b396b	2026-07-10 13:35:55.996333+00	2026-06-10 13:35:56.327732+00	\N
8b5102a5-3f75-402b-b871-137373826eda	4fe46da0-ef42-4d2a-ab95-7e580c1583f3	752544b42502d3edaaf358afdbf17b07eaa396551d7e5fe46dfc0fb2acb2af0f	2026-07-10 13:35:56.507574+00	2026-06-10 13:35:56.645177+00	\N
d1c4163f-b799-46bf-a8dc-133f9b556a99	4f8f526b-cb59-411a-8689-bd75b8ad0138	98659093e33c06d26ecfe4eb106cbb13d48ee073d60163bee1880cf9e27fc53b	2026-07-10 13:44:47.322366+00	2026-06-10 13:44:47.587033+00	\N
df2492dd-6ffb-40c7-ac8c-852a5bd9d30a	4f8f526b-cb59-411a-8689-bd75b8ad0138	4d6efa2e7c0c04893679c5f325867836d4c2de03751eeb338302423965899b1d	2026-07-10 13:44:47.961893+00	2026-06-10 13:44:48.199754+00	\N
1d7e735c-8184-4838-a12c-ceb3d722da79	4f8f526b-cb59-411a-8689-bd75b8ad0138	900b306db7afd8c305c766ae8c94b7d9889049c81f3f04f08ab98c85c76cbaeb	2026-07-10 13:44:47.971857+00	2026-06-10 13:44:48.216142+00	\N
4e38aeac-1175-49fb-a060-4284578156a2	4f8f526b-cb59-411a-8689-bd75b8ad0138	361c454d4abf30590c44c66796a7253f78a1e704782ac377a000a628a3a1457a	2026-07-10 13:54:25.897828+00	2026-06-10 13:54:26.232109+00	\N
ca453363-46e4-4a2f-88c3-3d2c04501590	4f8f526b-cb59-411a-8689-bd75b8ad0138	1b9085de2183621401386c43ad1598fd284386238cf293b983daded9a520dd0c	2026-07-10 13:54:26.401015+00	2026-06-10 13:54:26.513604+00	\N
03f6a945-04c5-4846-b67f-a9fd158067ad	6620f2dd-d8d6-4b8b-93b2-e6a705eaec2f	17e426165b65d794b49a97e7439933500af43e5a13e0db81cd589a1dca4b5a97	2026-07-10 10:26:53.873672+00	2026-06-10 10:26:54.017326+00	2026-06-10 14:07:18.706203+00
451e2415-7145-4a44-bd84-2aa86ba2a629	4f8f526b-cb59-411a-8689-bd75b8ad0138	907ec0ea577ef0a543ea9288f3d66d9df60b71f1ee879b3963cd476c8bb44412	2026-07-10 14:07:43.123706+00	2026-06-10 14:07:43.263755+00	\N
cc709402-b4a7-49d3-a339-c9b43aad3c18	4f8f526b-cb59-411a-8689-bd75b8ad0138	c185d039ae5de2543d5286bfedf14b6c05efc5219bdafa321c6a558bf45f4241	2026-07-10 14:07:43.524121+00	2026-06-10 14:07:43.568701+00	\N
200225af-8ae6-48ea-9d84-942a855269f4	4f8f526b-cb59-411a-8689-bd75b8ad0138	96b5d1b513118805a6623f5f841d6b1ce4d339da21e2408ffcd7234faeeb8334	2026-07-10 14:27:06.031984+00	2026-06-10 14:27:06.169801+00	\N
e4e033ad-8223-4358-8dc9-78989ee77fa9	4f8f526b-cb59-411a-8689-bd75b8ad0138	ed97f998e71ba5241fd35e51dda527f71e0b078ea1a72d94379f6747a7921f8e	2026-07-10 14:27:06.556548+00	2026-06-10 14:27:06.691812+00	\N
30f71dc7-2733-408b-bea6-60d132e13b4d	97d054d6-7db3-41cb-9f76-342d9d9bcae9	40c2eccfc2ed254ae4cd7b5671b9be1123d69dfb418fd721652c378e4177d600	2026-07-10 14:59:28.717773+00	2026-06-10 14:59:28.85164+00	\N
35add9b7-c3ed-45bd-8d00-060f6e9182f8	97d054d6-7db3-41cb-9f76-342d9d9bcae9	15e42fe6c39588ed1e5580a8349f92174551253ee3b2936a707ec099fd24a9cc	2026-07-10 14:59:29.104701+00	2026-06-10 14:59:29.142111+00	\N
4d8ee270-635a-43d2-9b2c-c587fadbbeee	5696e3cd-2e5c-4fb4-8f62-34ae80033475	7c4781631e2e738ed254549d1bb16d0cd20055a8e27fb0b7a1ef553bbd5cda3a	2026-07-10 15:53:39.464852+00	2026-06-10 15:53:39.598682+00	\N
7c85bbc6-cd4d-4798-9996-c6034d448a66	1c53f958-a9df-4a58-8fee-232970396c7a	38d97290f7a7375e36703f0c04b1b3e0e02d92b44292c77adcfa7363645fc667	2026-07-11 01:45:59.56919+00	2026-06-11 01:45:59.850527+00	\N
4e45e51e-e113-451e-b8c4-aa0ed2d083d3	1c53f958-a9df-4a58-8fee-232970396c7a	750add9e41ccb6946a61a4c7ca3721d067c0719f10c62089e5048d2099dbde7b	2026-07-11 01:46:00.408855+00	2026-06-11 01:46:00.499547+00	\N
1440195e-c16d-4761-af66-3f2ffb31b275	4f8f526b-cb59-411a-8689-bd75b8ad0138	c8ad45c60fab942b4dffca37be6189e4011baed8fdd290ed36948190825cb807	2026-07-11 01:46:57.055941+00	2026-06-11 01:46:57.339325+00	\N
ecdc217d-c91b-4988-884c-6d75492e0fab	d782bf6e-51ea-4f57-931f-5135650029fb	5cafdc053eb355e27be8a2b47d5e328bba68f5c5d2119442573015b8f7e889f3	2026-07-11 01:56:51.47727+00	2026-06-11 01:56:51.568922+00	2026-06-11 03:02:43.932866+00
a35b16ac-6412-4731-aaa2-7b47b011f402	520f96ef-7103-414c-8400-da6b60663eb8	e02808b0b707aa0b30ddc28f1b7b80f67ebe3a7dd931583ce77739db89e184f1	2026-07-11 03:02:53.901964+00	2026-06-11 03:02:54.180936+00	\N
029b6f3f-7c74-4678-abad-44c7db8d780d	520f96ef-7103-414c-8400-da6b60663eb8	b8b2b37f781d3dc8926efb8ac898b13231ccdf7e627f2b120841eb3c9c7c2231	2026-07-11 03:02:54.307804+00	2026-06-11 03:02:54.590217+00	\N
5c6d6796-200e-42bb-b0ea-b17322f089ac	520f96ef-7103-414c-8400-da6b60663eb8	47785dd34068170bf049d0f95503873b0d286f84d048d08e510f6f3681cd062e	2026-07-11 03:15:37.088652+00	2026-06-11 03:15:37.367893+00	\N
f28c8286-9644-4d29-b267-2646f852fc62	4f8f526b-cb59-411a-8689-bd75b8ad0138	f1aa41a50a41095511ca086c7943b0b8daa952dc2949345c4b5572d1d4437ae3	2026-07-11 03:43:33.92961+00	2026-06-11 03:43:34.019752+00	\N
ddef2bdf-b37e-480f-8024-5faa1fe38e03	4f8f526b-cb59-411a-8689-bd75b8ad0138	951511381f6955e7685b978276bf045a11674046fad51e5054f6009ef532e619	2026-07-11 03:43:34.656897+00	2026-06-11 03:43:34.746557+00	\N
f16f8e2e-ffef-4593-a49c-1e7cefb60612	b2c86793-5da0-4967-919b-0d3753ea7d83	8f0f403e54db5470cc17308831e424ad77680245441dcba1c3b283af8ffe1369	2026-07-11 04:21:44.666062+00	2026-06-11 04:21:44.951278+00	\N
dc8373a8-056c-432d-a54e-214a2ee8d26e	b2c86793-5da0-4967-919b-0d3753ea7d83	e625cd9c250e16b5acc3d1fbecd2c5a84a1b91d1f2d1b585053a292e4a25e913	2026-07-11 04:21:45.607209+00	2026-06-11 04:21:45.695895+00	\N
d3f2db5e-a058-4fcd-9968-7e939c42e40f	4f8f526b-cb59-411a-8689-bd75b8ad0138	662eca1b3fe345e224fdd3e29cd9f56979d1ee8b24a86208b291968ae7f91cb8	2026-07-11 06:05:44.816364+00	2026-06-11 06:05:45.090686+00	\N
e81cf393-17ca-41ee-b289-ab5209dcc8b3	4f8f526b-cb59-411a-8689-bd75b8ad0138	e010f23adacf3b71f500680fe262ee781097dd4c89d4e77c6752c036ad321037	2026-07-11 06:17:15.637108+00	2026-06-11 06:17:15.723572+00	\N
906def30-9366-4a3d-9552-16b160598725	4f8f526b-cb59-411a-8689-bd75b8ad0138	ff5f9cdf032fce82f73940af6e8d15aea7afd4d55e2d59dcf900bb6f300e2c59	2026-07-11 06:17:39.784479+00	2026-06-11 06:17:39.871129+00	\N
b1a16237-548b-445d-ac3f-062f3f77f09e	4f8f526b-cb59-411a-8689-bd75b8ad0138	41157e99b4b5a78f2a2662664bb29b71de0f829d6411d6211a750c27085033e5	2026-07-11 06:18:04.11939+00	2026-06-11 06:18:04.399045+00	\N
3dc3009d-49e6-4683-a550-39e06d459ae8	86c8251c-6780-46dc-9cde-30554403b8ca	30ee3e7d6310c7dd68da7c8f441b640dbc5005e22cff511c778430f1039ee58e	2026-07-11 06:43:44.702381+00	2026-06-11 06:43:45.083118+00	\N
4b7f1aae-cf49-4c17-8acd-8183beb3b1e5	86c8251c-6780-46dc-9cde-30554403b8ca	264cb004e012e2009048710e5182f3b20bb9679bd143f4172631252667f0d4de	2026-07-11 06:43:45.103864+00	2026-06-11 06:43:45.35326+00	\N
3ef31288-9ed8-48ec-a591-0f8be9c7beab	5508302b-91a6-477e-9a30-295a658630de	f43f81963976485222cf2edbd67d0ddc9f26b23216bf20e6a4c965bf0de47587	2026-07-11 06:50:51.579042+00	2026-06-11 06:50:51.67457+00	\N
68e07fda-8362-4b9b-8df0-b3b41ce933a7	d7ad428b-4598-43a0-a2dc-0c651b3933c4	acadd4506981e89ea3cf875814b5839f3cdeddf3e0c1ce9ce4219b0fb3e4e5fc	2026-07-11 06:56:33.808077+00	2026-06-11 06:56:33.902009+00	\N
c3fcd24f-8339-4943-94c3-12c02fd361f7	d7ad428b-4598-43a0-a2dc-0c651b3933c4	7ef7b11ffcf8d3e987cc070c38da8c77ef3babe6f3b13ddefe35f4dd0fe4a153	2026-07-11 06:56:34.429194+00	2026-06-11 06:56:34.523724+00	\N
d8e62aeb-11ab-4bd8-a2dc-48123335bb58	520f96ef-7103-414c-8400-da6b60663eb8	d19b8f91ef85d1a3eb2a9813d508066f45efd789f80699134bc770e67b7827c1	2026-07-11 03:15:37.088538+00	2026-06-11 03:15:37.367894+00	2026-06-11 07:16:01.690601+00
7cf32510-50a4-4cc3-b72a-b087e5483dec	ab399319-768d-4f8b-b3d2-a77e76a9ca58	0bab286d71bc228437d7d58e8b4755beb381aedd093297f6abe69e19442ecc06	2026-07-11 07:16:06.349448+00	2026-06-11 07:16:06.641074+00	\N
f2e3cf27-afa6-4b40-8391-e4aeef332ccf	c61b8ed0-2bfc-4793-8572-0542dc529050	dcd69f69e2954f521c52a32b7431ab2c8fbb024904f413febebf23b373821491	2026-07-11 08:41:25.47284+00	2026-06-11 08:41:25.754902+00	\N
4a0f62d1-e4c4-475e-be8f-3b97c353c382	c61b8ed0-2bfc-4793-8572-0542dc529050	8fdd6afa4ac389a953a6584c0e9174b6f8c403e24b566897cc2df54d74b7cf5b	2026-07-11 08:41:25.875639+00	2026-06-11 08:41:26.156015+00	\N
2c04596f-1843-4fb2-9afb-25b9740ab01e	4f8f526b-cb59-411a-8689-bd75b8ad0138	bd84601de367cb685b798fa714d05a2bc71d920dd257a010e52bde0fc0b2e408	2026-07-11 06:05:46.173308+00	2026-06-11 06:05:46.447105+00	2026-06-12 04:59:41.974484+00
dba24396-bb72-460b-a529-d1cd88251980	4f8f526b-cb59-411a-8689-bd75b8ad0138	9692cba9c1bcd25bab02ad87c0a1ace45cc24a74855c1ad5ca26ce4f747fffe8	2026-07-11 06:17:16.322698+00	2026-06-11 06:17:16.408926+00	2026-06-12 06:18:53.801182+00
52724af7-e5b1-42f2-a3e7-eddbc69341f9	ab399319-768d-4f8b-b3d2-a77e76a9ca58	9828f605087d434ee5d0820a4bdc3c61c3f78f6d28791625b91a1ec0d3ef5172	2026-07-11 07:16:07.179849+00	2026-06-11 07:16:07.279743+00	2026-06-12 06:24:52.555375+00
77bae5fe-4290-4bf6-9ba7-e207e1410b5c	4f8f526b-cb59-411a-8689-bd75b8ad0138	8470d48b8eecc581a7e428c102b519068ab37f26487c1d619c9290c9599cd4af	2026-07-11 06:18:04.984326+00	2026-06-11 06:18:05.073695+00	2026-06-12 07:35:26.571062+00
3ca0070d-efbf-4970-bfb5-678067fb40b7	4f8f526b-cb59-411a-8689-bd75b8ad0138	da12c47b225dbb878c255207d0586a16b584a43e91021c252fecd5e165eb0d1e	2026-07-11 06:17:39.619555+00	2026-06-11 06:17:39.70604+00	2026-06-12 08:40:57.611975+00
3a401700-2a40-4bda-b0f1-7b1c3f4354e4	0342e751-0cee-4e4b-8724-3650c6d0d0ae	f9fea4d451d28f91bd7b6211eecd845db0b87d540fa1ee9eef90afdf8a0d79c6	2026-07-10 10:32:12.527252+00	2026-06-10 10:32:12.671042+00	2026-06-13 14:56:42.491405+00
4ae7849e-85cf-4f0f-b486-af83aa8765c1	5696e3cd-2e5c-4fb4-8f62-34ae80033475	270bb0179228b0fcf0de2eb82a3a76224071483825a6e8f5718cc20f4c8d9075	2026-07-10 15:53:39.840853+00	2026-06-10 15:53:39.878279+00	2026-06-13 16:12:17.680074+00
be6b0207-3c9f-4e37-83c7-9d5e5fca0164	5508302b-91a6-477e-9a30-295a658630de	3c7f86f6e0f9cb73f7416eb5c97c71a4b8dd9616af70ab4599151c4ca4a15054	2026-07-11 06:50:52.336799+00	2026-06-11 06:50:52.432219+00	2026-06-15 01:55:50.488771+00
8d1d422e-960e-4bb7-b9f0-c2278fde700c	0342e751-0cee-4e4b-8724-3650c6d0d0ae	e77ceaafce830db62527cddab29cfa54481cc1101896b3cb4be88365edb1ee22	2026-07-12 02:37:09.804549+00	2026-06-12 02:37:10.08673+00	\N
34891653-eaeb-419e-a1af-1df3d4cd735f	4f8f526b-cb59-411a-8689-bd75b8ad0138	e8653a5045ff79d1e3f2c5f2beeb0ce719ffb5cd1bb9cdafa1307431db253909	2026-07-12 04:59:46.363927+00	2026-06-12 04:59:46.659836+00	\N
2a50c6a6-8a46-4e8c-819a-f99d15a4bec1	4f8f526b-cb59-411a-8689-bd75b8ad0138	756cba17bb6ca5d2e14d073521de668f19aba34bfc1c8edac32fb8afd9876896	2026-07-12 04:59:47.242657+00	2026-06-12 04:59:47.33113+00	\N
6b571366-b60f-468e-ad42-c58b673ded36	2f62ff6f-3ea7-40bd-b97d-a3c72ceadf5e	c18f7a9998251cfbaba93f9c7106f724a19d8812f4b60152cca74af2f76cb3d3	2026-07-12 05:21:58.619216+00	2026-06-12 05:21:58.898461+00	\N
1f2dde3b-22ca-4ebd-ab59-a9399f1940e2	9f7d5180-abe1-4c22-b640-1644c4f3640d	d0b901480719e0f8a724d8c4cc4900cdd1c7214c70a5b8c79d85817b0ac85b02	2026-07-12 06:14:01.013338+00	2026-06-12 06:14:01.296465+00	\N
65ba983a-c9dd-48a3-9676-b16883cb9431	520f96ef-7103-414c-8400-da6b60663eb8	b1a46f10c16559916657eeededf69f6f3fd3c6d78c5fea1b122878ed98dd05a6	2026-07-12 06:25:02.468664+00	2026-06-12 06:25:02.561564+00	\N
09bba410-9a3f-4248-9856-4b5efe3654d9	821768a5-8bb9-464e-a083-6225736a26b5	c64dee23f916d919913e95d88a85feb3a1097c2d6488deb7e9aea508ffa975fd	2026-07-12 06:34:57.884956+00	2026-06-12 06:34:57.977966+00	\N
655aac99-6255-4aa1-b045-d6a89ab068fe	821768a5-8bb9-464e-a083-6225736a26b5	e46462e4fd0190624fc2cec7e7e60bfb86ff61f8351158240bb1b16d71228a46	2026-07-12 06:38:05.714577+00	2026-06-12 06:38:05.999497+00	\N
99353145-f846-4bd5-bb27-ab78a68be018	821768a5-8bb9-464e-a083-6225736a26b5	6272e8b90edb5e4bc845b421194176855585e5f157a3a94deeddb1c412fd43ba	2026-07-12 06:38:05.925809+00	2026-06-12 06:38:06.020836+00	\N
19a63ee4-60d2-49fa-a1e9-42670615236f	4a49a532-f103-4ab1-87d7-427dc79a6f3c	2a8e2be3264fbfa5b7b4a3d7c687d09ac965009c7386db78bc1971a9485a9470	2026-07-12 06:44:26.08514+00	2026-06-12 06:44:26.177376+00	\N
a4a14c39-886b-4316-aa91-816d2d69fb36	4a49a532-f103-4ab1-87d7-427dc79a6f3c	9e76ff8e53ba290bfe662e605c8b9fa1643feca41cce1a8cfb8c70bbed2ffe9d	2026-07-12 06:44:26.821787+00	2026-06-12 06:44:26.913911+00	\N
716390cb-10f2-4e56-8a03-8db8ccfffad6	1555459e-6a2f-49d8-b281-8ee5223a2072	068aba690349f43f44d04ee4305e170245716804088039426e536b9928a91126	2026-07-12 06:45:00.052499+00	2026-06-12 06:45:00.144617+00	\N
b32e5339-6782-4b86-be5c-e5d27e8d9c3f	1555459e-6a2f-49d8-b281-8ee5223a2072	404f2894742e9250983d80ef9c0bdeca8ccbdfdf10ef56d1ef434415445704d7	2026-07-12 06:45:00.805453+00	2026-06-12 06:45:00.897438+00	\N
97a68d7b-b67a-4361-8929-9f8a12c9c49d	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	b4d50641c370a8805df32f8f7d051558757492f57407bd1b9dd33f4856360434	2026-07-12 06:49:07.728665+00	2026-06-12 06:49:07.817643+00	\N
2538700b-a9d1-495d-ae2d-0eee8feea318	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	0dc6d54ed26eb9757d52dc12b2a659a8bd4d0dbcff298edfcec765be51465ef6	2026-07-12 06:49:08.394338+00	2026-06-12 06:49:08.483589+00	\N
b8ab0bb5-faa9-492a-913d-462b16238347	dd01bb6f-ef9c-47bc-b316-7d7ab98b0352	9389d333a053caa74814660ea59bbfda7ae5c670cad5ee463cf2090e45c17928	2026-07-12 07:34:48.267992+00	2026-06-12 07:34:48.536732+00	\N
38b6d9a7-b848-49af-955a-675393de0b66	dd01bb6f-ef9c-47bc-b316-7d7ab98b0352	54ad6e3a3a5cc20d2245c8cca55c582a8a781cff95455cf24818f6fd864a1fcf	2026-07-12 07:34:48.653404+00	2026-06-12 07:34:48.79544+00	2026-06-12 07:42:07.019457+00
6cbc772d-438e-4e51-abf4-053cde57b08e	37566c0e-3816-471a-8072-78adda056c22	6e7e3020661d8a68fa9fb5d0dc102e197a522d2c253c755cc9deb2d07dd068d4	2026-07-12 07:42:10.644819+00	2026-06-12 07:42:11.069974+00	\N
20524283-ef42-4a00-adc7-2911b1ac9293	37566c0e-3816-471a-8072-78adda056c22	f15a0133184805d7667a99acb9954c652f8e61b07887ac8f4216ca9df67db865	2026-07-12 07:42:11.165574+00	2026-06-12 07:42:11.361008+00	\N
91f71d8a-14b0-4d9b-9667-287196337201	26231d99-a413-420f-8f92-3a4e6f3fcd1d	5a52307bbac830a03177ec3811b68495a6c1fe98760411d56009f02417953807	2026-07-12 08:03:53.871661+00	2026-06-12 08:03:54.18372+00	\N
8d32aacd-1f95-49e9-8ee6-5f0ec7434e73	26231d99-a413-420f-8f92-3a4e6f3fcd1d	9558b09cca5d8c28ba18abf709d472609d74a51dbe2f273b4f2f69bca4c2e1d1	2026-07-12 08:03:54.271291+00	2026-06-12 08:03:54.453254+00	2026-06-12 08:04:08.761969+00
915e3534-a999-4b8d-aec4-56ab121c4f69	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	9d12c8e274088ed244dfa8c4c24240c6b426df5b3514cad1916b884707ac1010	2026-07-12 08:04:10.910487+00	2026-06-12 08:04:11.228497+00	\N
8fcba9f7-f4a7-4356-b61d-6b0d5306c99c	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	7931433f3ba2c8a215c5c344c5e0e4b6783ec7b632e0f5be4e7c2a047afa4733	2026-07-12 08:04:11.306976+00	2026-06-12 08:04:11.494348+00	\N
745a0510-dda5-4732-96e5-27b1f3a33c76	fd6e1226-381e-4430-a479-e8fda6be7ef2	615f62a360365cba2376780d82abea483a35a513c56fbcbde8eade2a3fff3e87	2026-07-12 08:04:40.157818+00	2026-06-12 08:04:40.499949+00	\N
afb03d05-ce9a-4658-a595-4989a2c661a0	fd6e1226-381e-4430-a479-e8fda6be7ef2	0a6cbbb15d5652d970e0442736f8d3a0ad499662b5069931ca3b4f716b4c267c	2026-07-12 08:04:40.588169+00	2026-06-12 08:04:40.787964+00	\N
e227f5d5-918f-4c9c-9b02-5c87d4e4ef96	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	72d858a19eadf0e2a09167bf4d074817f1bb0f3d86c4cda07e84b564240e6499	2026-07-12 08:11:03.34633+00	2026-06-12 08:11:03.53088+00	\N
382377fa-5fd6-4289-8632-cc6a8007ccc4	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	bb0ab04458d8d2878c2088e0ab4314b42e04fd4b86681254a27566fd91abae62	2026-07-12 08:11:03.376987+00	2026-06-12 08:11:03.578006+00	\N
367ffd4a-77d2-4097-817f-43ef8a1bfbc1	38b58a35-ff9c-4ab6-b505-4a51d2244f51	04a950834e0c7d8737873726e4599b08775bdfeddc17deb22b42575857415fd5	2026-07-12 08:11:41.143518+00	2026-06-12 08:11:41.331607+00	\N
5fa7fbbd-4f37-427d-bb43-2c486260e246	38b58a35-ff9c-4ab6-b505-4a51d2244f51	0f62557758e455a80025687fba5d9c56026dc3b49e3284c1e99dd8de32200c17	2026-07-12 08:11:41.670832+00	2026-06-12 08:11:41.992687+00	\N
ccb1032c-f914-4aa9-842a-6bba5414fde5	4f8f526b-cb59-411a-8689-bd75b8ad0138	3c980fa15f2088c4e53cfe042804c7a933ac88f386c5591ca673c297de383a19	2026-07-12 08:25:09.282727+00	2026-06-12 08:25:09.451824+00	\N
4ba55364-f3ce-4def-9ffd-d0172c24a51e	4f8f526b-cb59-411a-8689-bd75b8ad0138	db1568663ca2a4af3eebf6b20e8215071ec55eec75c4ff6af492b3b20396d340	2026-07-12 08:25:09.637901+00	2026-06-12 08:25:09.808429+00	\N
5d93acb9-7eb5-4c71-8054-a3353d71b25a	4f8f526b-cb59-411a-8689-bd75b8ad0138	986963c7bbefa9d7321f963fd86ee181b1caaffd0fa99a5ed962a7b65434efb2	2026-07-12 08:26:39.268835+00	2026-06-12 08:26:39.439682+00	\N
8f408b37-79e4-40ba-9da8-583c295913c2	4f8f526b-cb59-411a-8689-bd75b8ad0138	2e227cd10edb9d5b364a52f6a653cf40356949c54f4feecd9c282b2b54cd0b10	2026-07-12 08:26:39.415752+00	2026-06-12 08:26:39.576975+00	\N
f36a9b11-8928-49e0-81e4-cc8f7b184581	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	47d146eab85db77f870c1dd637a93fd4a8d50932caa513e74169f09538dfeb15	2026-07-12 08:29:34.818802+00	2026-06-12 08:29:35.22399+00	\N
5957f868-db62-428e-9bf8-c525cb9fb31e	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	774637853cd559354cc8d211dc2a8041df2d111320628d57aea48e21bb8ea41a	2026-07-12 08:29:39.419949+00	2026-06-12 08:29:39.726401+00	\N
e6cc53e2-6b0b-428f-8189-013dae94051c	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	d763c1f445b14ac706ef77bc4d452f2f589f181a331731f694eabb4100950790	2026-07-12 08:30:39.876398+00	2026-06-12 08:30:40.056995+00	\N
d12df793-da95-4024-af38-5534bc48595c	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	836c3d89c4e90b12874c2de83d2389b867e653ea4f7eb519e1f8a145aed5c6b8	2026-07-12 08:30:39.839015+00	2026-06-12 08:30:40.057989+00	\N
24fd37fa-4a3c-46ab-965c-1ba0cccf528f	4f8f526b-cb59-411a-8689-bd75b8ad0138	2494e5e41aab1e8421c320f0a844ea32ad927d04590a551a64efb53984bc0568	2026-07-12 08:31:15.236931+00	2026-06-12 08:31:15.416382+00	\N
41dcca38-f680-43fb-9afe-f03c41b6e759	4f8f526b-cb59-411a-8689-bd75b8ad0138	827dbd26fa58741f1d757ab500ed470e43dc1d130f281a3a2ff2cc22923fe7b0	2026-07-12 08:31:15.237403+00	2026-06-12 08:31:15.417751+00	\N
fa3c17bd-ec26-4f51-afe2-4000ffb3ef20	4f8f526b-cb59-411a-8689-bd75b8ad0138	00f0ad81fc0c434b3cb0aaf03789fb4245ed5db46daa679e31c4b6c56fecdbad	2026-07-12 08:31:34.367648+00	2026-06-12 08:31:34.548998+00	\N
51a52788-db36-44ef-a088-c5dea0cc5cc7	4f8f526b-cb59-411a-8689-bd75b8ad0138	92d7206aa3df08d3f4933f2e85814ac2b6f9b097c55d57abebbdbf24edbf96d7	2026-07-12 08:31:34.368085+00	2026-06-12 08:31:34.549739+00	\N
fadf4d21-ae0b-4c8a-bb0a-42b05b0a4a03	4f8f526b-cb59-411a-8689-bd75b8ad0138	a18fd2f68846c7a50159caed5de343a19798a7ca6541a8001a512d70704431e8	2026-07-12 08:32:06.360003+00	2026-06-12 08:32:06.539623+00	\N
51996bd2-0309-404e-bb29-5451c5b5c22e	4f8f526b-cb59-411a-8689-bd75b8ad0138	2dc6490ce8057cbf21400b17d01642c6718487ef3506c1b70b6ab4358041859f	2026-07-12 08:32:06.359995+00	2026-06-12 08:32:06.541416+00	\N
5737e9cc-1882-4d75-8535-1aafc77eb148	4f8f526b-cb59-411a-8689-bd75b8ad0138	241f601618b33d1fe18a81527491989208b320c778acf5e9bfdec6a4fc86f56e	2026-07-12 08:32:21.760685+00	2026-06-12 08:32:21.940779+00	\N
c7751973-28a5-4a60-89b0-36a26f9a0df2	4f8f526b-cb59-411a-8689-bd75b8ad0138	fc703b9b7a7800d9346376ddaa6a5475a90250d5eab63968b1dc5acd60a545a4	2026-07-12 08:32:21.763479+00	2026-06-12 08:32:21.944219+00	\N
fa9195d7-89e5-4fc8-aced-efe79614d445	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	d7bfdc8d1a713347ef8fe1d9aa74f767a968fff21dfe1928910595f8189ac01a	2026-07-12 08:32:31.181197+00	2026-06-12 08:32:31.359509+00	\N
cc465b34-bf7f-4523-aa9f-e70440ae4085	4f8f526b-cb59-411a-8689-bd75b8ad0138	7ad58e9f1ec35a35d00a8597b5814226bd9dbb3addbd93485c2a331e68191000	2026-07-12 06:18:54.100921+00	2026-06-12 06:18:54.383682+00	2026-06-13 06:44:29.664522+00
6f0f9b41-995d-465d-9eac-86c4371ab422	821768a5-8bb9-464e-a083-6225736a26b5	4495e287a2b5ada6cbf3d96e9001bbd0a997148137c3fb997a5ac81aeb188e1b	2026-07-12 06:34:58.475617+00	2026-06-12 06:34:58.567652+00	2026-06-13 07:59:52.096278+00
399920eb-9f89-4617-841d-c35b02e760d8	520f96ef-7103-414c-8400-da6b60663eb8	92508b8a2191632c177cb6a9d31b98038324b1e80760743e24a6b98e1670e867	2026-07-12 06:25:02.651578+00	2026-06-12 06:25:02.931914+00	2026-06-13 09:10:58.0667+00
06ffca61-5cc2-4a4e-8995-10c0dd9f5afc	4f8f526b-cb59-411a-8689-bd75b8ad0138	77832014ab2c281ae492a4cfc34d67289bd57d065b87afba61cb2075fb33a16f	2026-07-12 07:35:26.872087+00	2026-06-12 07:35:27.153182+00	2026-06-13 11:03:24.482718+00
4fd199ae-7560-428a-bded-757d1f52051f	72983125-1336-4911-93f1-58817ccf8795	8b9cb7329552c6cfa6f4e35d04f9df8f4041cad17b68d4ab783583fb2a7d73ac	2026-07-11 08:54:13.167379+00	2026-06-11 08:54:13.25681+00	2026-06-13 12:37:24.870149+00
408e1e6b-f32e-47d2-947a-b46ed7d9f941	2f62ff6f-3ea7-40bd-b97d-a3c72ceadf5e	c50f4c5d0bb29f4fb2f3a0db1c97f5477ce1f02ff014be195d7304fe44c2716c	2026-07-12 05:21:59.536673+00	2026-06-12 05:21:59.624582+00	2026-06-13 18:16:47.80237+00
69cc4437-2bba-4c82-8782-5217a54843b2	0342e751-0cee-4e4b-8724-3650c6d0d0ae	139f6d7709049701fa9780ff52a64f7f4b51eb7cb4e6222e74ef93ca186a383e	2026-07-12 02:37:10.970185+00	2026-06-12 02:37:11.246539+00	2026-06-14 08:42:10.554337+00
e23c8216-9ec0-46e1-bee6-a09e2bc13c39	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	81f77f69e796d6fb74059f66d761267dc6894594f1263c77482a9adadbe7a697	2026-07-12 08:32:31.181317+00	2026-06-12 08:32:31.360178+00	\N
48223839-7277-4a79-b432-46b7112128a6	4f8f526b-cb59-411a-8689-bd75b8ad0138	ffaff9431c346a2a87cca2c909249b84de1d444fe09bdab410e96e1f9b040ab2	2026-07-12 08:32:40.09278+00	2026-06-12 08:32:40.273736+00	\N
52131e2e-78ec-4d15-9d7c-7b2e37bbd87c	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	f2d8cef3e9106e5bea135370e339f7eac67568af5a0c846e30c59b6087b79633	2026-07-12 08:33:27.803974+00	2026-06-12 08:33:28.185941+00	\N
5a4e0c4f-1c78-4a00-a5fc-6e230a295247	4f8f526b-cb59-411a-8689-bd75b8ad0138	2e73fe49ae563c9a831608f01e21fcdb38860482313e6a93efd6cc7cba94996a	2026-07-12 08:32:40.092703+00	2026-06-12 08:32:40.272874+00	\N
e12903b3-64e0-4c78-84a8-3597c7602d23	c1cf6e32-5d6a-4d3c-be10-f2d66653c45d	a2bb7abafbdfbb9a0c397efd9d5ab175eec58c25207a68e60ccaceb557c1bddc	2026-07-12 08:33:28.854236+00	2026-06-12 08:33:29.235156+00	\N
8f6add5f-dd51-452f-8a56-dd3f655d889b	4f8f526b-cb59-411a-8689-bd75b8ad0138	c36c8693a2aadd0599894012697c71ea84aa0dbbd15adcc8ca617611f4794b13	2026-07-12 08:40:57.915415+00	2026-06-12 08:40:58.199+00	\N
de40a124-6c49-412c-b80a-982ae2be0caa	337f5196-baa4-4f2c-80ad-64d9f55529c8	723d199dff3c28585b3033ca4f3d676d38f88a64c22bb45eea236436dcee9d61	2026-07-12 09:42:26.289031+00	2026-06-12 09:42:26.608287+00	\N
9953f9e0-9b58-499e-a500-d4a27c13c5d8	337f5196-baa4-4f2c-80ad-64d9f55529c8	338b0f3379c23ea6c384e849f0981d7e22e6fd7a3b386d539f6d1ddc7eada6e7	2026-07-12 09:42:26.813984+00	2026-06-12 09:42:26.991395+00	\N
fbaa0c49-5169-4540-ba8f-48ddaafded3a	8c08b6ef-d71f-45f3-9d3a-5e673e162a90	ef947a41778cf7730813c5926dc4700dfea786e9c14e61024c5a4b59739c5b97	2026-07-12 09:47:47.554852+00	2026-06-12 09:47:47.833778+00	\N
cd6e9bd2-e93f-48c7-85c3-5e3b08e7dcde	8c08b6ef-d71f-45f3-9d3a-5e673e162a90	9ba6ebaf729634932979bd270270fa3c15fd7f625579b3307282e578d3115f11	2026-07-12 09:47:47.938952+00	2026-06-12 09:47:48.216892+00	\N
df5f8d1c-3699-4ff2-9dee-d5c89f0b43c9	3d23104b-dce2-4205-833b-fa2c003e89f2	67a1288ffa09b95d265d52c391f7293069927954c68aef111a85122e0c502957	2026-07-12 09:49:59.586072+00	2026-06-12 09:50:00.063697+00	\N
c28e669e-f1d1-4a43-8758-e9b213c4e78e	3d23104b-dce2-4205-833b-fa2c003e89f2	75bd24236f838edeb200992353bff8e18f217b8b1fed2baa3b85bdfad6c6debd	2026-07-12 09:49:59.92641+00	2026-06-12 09:50:00.339665+00	\N
574778b5-6037-46d5-940f-810bfd98ba27	7ff5f595-3918-47a2-9ab1-75c57d56ce1e	da473fab63f48b7e0f143730e26fbdd97bb20033100482c76b648ef86b04c2bb	2026-07-13 00:12:54.073993+00	2026-06-13 00:12:54.358637+00	\N
067bd1e0-83b7-42c1-a911-9fe6ab540d14	7ff5f595-3918-47a2-9ab1-75c57d56ce1e	357c11d0aa7619d73eaa1d84c8ab2db40b5e3ccda83c59d8043d83989dfe18fc	2026-07-13 00:12:54.960455+00	2026-06-13 00:12:55.053536+00	\N
ee7b461b-985a-43ae-842d-16b4d9a45320	375f09b8-8450-4732-ae97-33fffcd95477	9578084917d4d4070cd64760ebaab36a186e2cd6845435f5838265844ea6b7dc	2026-07-13 00:12:59.485119+00	2026-06-13 00:12:59.577909+00	\N
b74d2882-34ce-4f4d-a38e-4639438f7284	375f09b8-8450-4732-ae97-33fffcd95477	cdcbce020762004072fbcf77baa246476c3943764f2ca75e0405ad575602ad51	2026-07-13 00:13:00.161619+00	2026-06-13 00:13:00.254445+00	\N
eceecacf-c8e7-4b59-942f-4c071ed39670	53d98013-bbd3-423a-84ae-3803a841f72c	425e3b37e3adb41cea012d9630733d3e873497fee7e7ca3a8fbe289c7963cbc3	2026-07-13 04:08:30.915269+00	2026-06-13 04:08:31.359319+00	\N
9ec8d52b-e834-4b29-ba42-5e57fa1bc19b	4f8f526b-cb59-411a-8689-bd75b8ad0138	66537c2a807d5b09301a048c86dec000a913bdfcb799186b8e85c4607bb093fc	2026-07-13 04:13:50.351401+00	2026-06-13 04:13:50.634514+00	\N
c85d4ee0-8278-4f99-851c-9dce0c1bf8a5	4f8f526b-cb59-411a-8689-bd75b8ad0138	09f0cc5dd0bfe53e9e5eadbd8261b24c022bba713c3de5d1ad39e1ed91b73473	2026-07-13 04:13:51.50041+00	2026-06-13 04:13:51.783484+00	\N
cb66ebf7-a397-4993-a2ff-383f70248e91	4f8f526b-cb59-411a-8689-bd75b8ad0138	bb542a559f13e9f005dc3e2db6239f12c9473ab66b54320e6044c95155bc27f3	2026-07-13 04:13:51.495601+00	2026-06-13 04:13:51.780165+00	\N
1a36ce1c-c672-4f7b-80ea-629a8accf9b3	821768a5-8bb9-464e-a083-6225736a26b5	f47d19dc427f707515b1dfc80a6672441ca9638f4e7535455e6b0d098be7fa01	2026-07-13 05:37:18.633771+00	2026-06-13 05:37:18.915393+00	\N
e97981f0-9946-460c-9a98-c72b6db063ac	4f8f526b-cb59-411a-8689-bd75b8ad0138	a0507b509928a22271d8791b7c490940056419085d2b316a1ab66b5c8d5f96de	2026-07-13 06:44:30.149444+00	2026-06-13 06:44:30.429831+00	\N
bf71cf1d-d955-4c96-95bb-f589e4ccd208	821768a5-8bb9-464e-a083-6225736a26b5	0af37e91b436cdb04c21bb8a6760405634289b7fdccda2af0f83f7276b922123	2026-07-13 07:59:52.582932+00	2026-06-13 07:59:52.864079+00	\N
ebbb704c-b2e8-4b0e-aa12-ca9ad3101dfc	4f8f526b-cb59-411a-8689-bd75b8ad0138	d384638afc32ef536336881e0a0488982bf85d3e1e55578a18ed283ee6c9a2ab	2026-07-13 09:19:41.154792+00	2026-06-13 09:19:41.435064+00	\N
8aceefbf-588f-491b-ab77-9161c785dc1b	4f8f526b-cb59-411a-8689-bd75b8ad0138	eef153d2d85a2613dc885d9ce67d5f3b671ed4fb553609d4fdc29c3db75e4eff	2026-07-13 09:32:23.998087+00	2026-06-13 09:32:24.085285+00	\N
4e331c15-d68c-4c8c-85e9-886132fc04de	c6987c3a-694a-4546-a3c9-35bd5a6912a2	20eee96d498a4c7d644f89fb51a6b0976bbddc4d4de19b5dd40369b7666e3a4b	2026-07-13 09:57:30.620259+00	2026-06-13 09:57:30.901405+00	\N
2a1bae6e-d588-4f35-a009-b8f11b88c13b	c6987c3a-694a-4546-a3c9-35bd5a6912a2	f8e1e08bc7f0f8a436cc662e713c1e4c3e1420b32ce42c79a479d68999a01903	2026-07-13 09:57:31.036185+00	2026-06-13 09:57:31.320794+00	\N
51667110-6741-41ca-b6b7-5903053cb772	3775fc8d-a27d-44a4-8919-d87cbb6cc99d	53bec34d1b9bab88e7ce197c5311128509a43ccc585672e6eaae5945b78b569c	2026-07-13 10:30:59.652838+00	2026-06-13 10:30:59.744397+00	\N
67f944dc-a774-4106-b0a0-1b971dde1094	4f8f526b-cb59-411a-8689-bd75b8ad0138	ba4c4bf70465d1da06b5a69cec0f106079885bc65d393991054d645414dd2eae	2026-07-13 10:30:59.93752+00	2026-06-13 10:31:00.218805+00	\N
0832065e-b79e-48fa-ba8e-14877f5d504f	3f97bffb-d279-4536-8597-69622e964815	cce98f4afc41f25c62ae86c99894627e7767c97123520f237bd9b227ecc02645	2026-07-13 11:06:16.354911+00	2026-06-13 11:06:16.447761+00	\N
1980736b-8b3b-4630-b0df-adf25be6f0fe	3f97bffb-d279-4536-8597-69622e964815	4b000fbf942ec66491db861d5f7056dbaa3f982ea08ba0606806dbcbfb7a07ee	2026-07-13 11:06:16.933698+00	2026-06-13 11:06:17.022792+00	\N
b9bf00b0-693d-4a8d-b5e9-26bb87427371	7fac5feb-a2e6-4902-8941-8f14eadf8c7c	0f1f090b41a4234d55f2158bf6ed7b7c2b9d3baf871e2b5b8fe62e1a2d4977bc	2026-07-13 11:30:46.291687+00	2026-06-13 11:30:46.571954+00	\N
613c879e-7918-4f51-bccf-026e007f6175	7fac5feb-a2e6-4902-8941-8f14eadf8c7c	bb470079b5354e7f1031944f911c614eb6ddaeb26b33c59aca2a64dc71195076	2026-07-13 11:30:46.879909+00	2026-06-13 11:30:47.159907+00	\N
8b875e6f-7b37-43b2-a988-7b2b69426ab3	4f8f526b-cb59-411a-8689-bd75b8ad0138	23054ba2361671bff0fd28458c1963c56ffeea72ff6cc3b4da9b80afaa4e0747	2026-07-13 11:40:35.546162+00	2026-06-13 11:40:35.635002+00	\N
76bfc73e-b6dd-47ec-957a-0c935c156663	7fac5feb-a2e6-4902-8941-8f14eadf8c7c	8b7d518235459aedbe9f3fe325371b0eaa0a7dfc117e4ad6d99455fdcd01a955	2026-07-13 11:57:29.391108+00	2026-06-13 11:57:29.483427+00	\N
95d45e8f-84b1-4f08-855a-6353469d20de	7fac5feb-a2e6-4902-8941-8f14eadf8c7c	1f904dd6449c9037e826975603edb9846d5183edfb0b4f30f0ff50b435463045	2026-07-13 11:57:29.585091+00	2026-06-13 11:57:29.866633+00	\N
f7f5b562-a232-483e-a6d5-7c3e490c8ee0	72983125-1336-4911-93f1-58817ccf8795	f785eb501c8b01d7b731dcb026d9aa270d6f71230999867ab2f0c63d50c2cfb1	2026-07-13 12:37:25.365674+00	2026-06-13 12:37:25.647567+00	\N
de5498ae-88b7-47c1-96ae-fb0778c5fd5f	977cefb0-c1dc-4586-857b-efbce2509f04	20480abba279b21e0f2bc54534419e4521d619c14272067e171784310353bfab	2026-07-13 15:28:58.69995+00	2026-06-13 15:28:58.789671+00	\N
7951da62-0a22-48ee-b19a-5b518851ff89	4f8f526b-cb59-411a-8689-bd75b8ad0138	47524e35fa07cb6d514f70c924c153756993217396fbd915379cb037a6a1d730	2026-07-13 11:03:24.974031+00	2026-06-13 11:03:25.252174+00	2026-06-13 15:33:36.297923+00
e2875f34-55ba-43e5-9441-ae164f8f0e30	543eb38c-7878-41b0-b2e6-a58cbeb0fa06	ea7535dca0929759ee2ee1bf5a48cebd2b36562efd37f570361df3c98013bc58	2026-07-13 15:33:49.558283+00	2026-06-13 15:33:49.647421+00	\N
829b036c-97cd-4345-953d-0fe6e077f29a	543eb38c-7878-41b0-b2e6-a58cbeb0fa06	07234a01e9f1d70f11fd5a1e1062ee7630a74b6451b3f65431da2a3a47b8891f	2026-07-13 15:33:50.331319+00	2026-06-13 15:33:50.611631+00	\N
cb25ea46-7063-43f5-87bb-7400c0a9e7d4	830dd861-36c0-4702-a433-81210387fff2	f518a367299fe5b4915bb9d8fa1e1652f3d4ca9684bbd587e240ad5f45b8e570	2026-07-13 15:56:22.157418+00	2026-06-13 15:56:22.447885+00	\N
22297fef-05d8-4f27-8337-6dfb2488b207	830dd861-36c0-4702-a433-81210387fff2	e3e1ecb5ae4fcfdb47fdb9f05c941755c459702e28facbeb4606d93a5909a5fa	2026-07-13 15:56:23.085447+00	2026-06-13 15:56:23.174835+00	\N
9f03ad68-37b5-4b77-9413-fad347833856	5696e3cd-2e5c-4fb4-8f62-34ae80033475	cf8b04d163930cf4c5faa51e357d642dbd685c5d93affe2cdf762fa94397724e	2026-07-13 16:12:18.184007+00	2026-06-13 16:12:18.466261+00	\N
b022d785-6ce9-49a4-8c1c-d34c56dede3e	2f62ff6f-3ea7-40bd-b97d-a3c72ceadf5e	e2218fa1caf12ad67d1033e33773ebe11c199b8cc0302c3f2ffe2a1e9c65487d	2026-07-13 18:16:48.285861+00	2026-06-13 18:16:48.564264+00	\N
b4468248-8053-495b-b338-7d100b4b5066	821768a5-8bb9-464e-a083-6225736a26b5	7adcacc9d78cd99aa09d831fb255065e58a774cc31eb9fdfaaf3030cea96e30c	2026-07-13 05:37:18.640406+00	2026-06-13 05:37:18.919208+00	2026-06-14 06:27:47.475475+00
840e69b3-f599-4cd7-85e5-9a1930cbba00	821768a5-8bb9-464e-a083-6225736a26b5	3793698da3a4c259024e3e37a5b24fa714b35650cbf37e4aaae3ee66caebc475	2026-07-14 06:27:47.766162+00	2026-06-14 06:27:48.040074+00	\N
286fadaa-0147-420a-b4ba-90b2d5284db7	f0629d87-0f29-41cb-bb8a-5417d3bfc630	231edf61d292f9efafd205746db70aa0b577cf85ebed116690391b2c09fcc675	2026-06-17 05:53:59.533977+00	2026-06-10 05:53:59.578695+00	2026-06-14 08:52:33.400767+00
c3a0a6f1-69fb-40ec-af7d-e6c1fd5fe8ae	f0629d87-0f29-41cb-bb8a-5417d3bfc630	74bb57ccdcbeb5100293339c2110c2a7aae1c54a016055208e5653c609c83f96	2026-07-14 08:52:33.695633+00	2026-06-14 08:52:33.970705+00	\N
29c1a523-7a89-4936-94b2-51d4305aa37e	53d98013-bbd3-423a-84ae-3803a841f72c	721de06d86697d80cee8596b1b05168e9f62901a6a50980f55f808b7162ce978	2026-07-13 04:08:31.353311+00	2026-06-13 04:08:31.656341+00	2026-06-14 09:01:11.099079+00
f445e87f-dc38-470d-93d8-86119d67a1d7	4f8f526b-cb59-411a-8689-bd75b8ad0138	09f2ee63b5cfd12ba4bbd32a320bcb94c4e04732abaadba625daadd6f564c96f	2026-07-13 09:19:41.183988+00	2026-06-13 09:19:41.460339+00	2026-06-14 09:21:02.294506+00
62f5bb30-e767-4069-bf94-fd07397dd0f7	4f8f526b-cb59-411a-8689-bd75b8ad0138	015f9fb6e4a123f09bf9ef133ca037ff62a3c9a541f8eef8bac435e0cd7a4005	2026-07-13 09:32:24.65696+00	2026-06-13 09:32:24.743773+00	2026-06-14 09:32:38.18432+00
872a16b0-17e0-425d-86b4-f448e65ece1e	4f8f526b-cb59-411a-8689-bd75b8ad0138	24355d544b0c1d2e649c6205c5437ef68132eb8f580d30e0fe28d24b828c27df	2026-07-13 10:30:58.628811+00	2026-06-13 10:30:58.920314+00	2026-06-14 10:21:31.204001+00
7555ffa1-418b-4850-a90c-a4ff70e0f76e	520f96ef-7103-414c-8400-da6b60663eb8	0ca2f673bb17e93a0167aba048ecd9fa4fac773f51ac49a969f2824e3e081186	2026-07-13 09:10:58.360452+00	2026-06-13 09:10:58.635319+00	2026-06-14 10:24:25.897796+00
4a5e8b20-a84f-4af7-bf77-02ca63563b33	4f8f526b-cb59-411a-8689-bd75b8ad0138	2108af0d986405ed33e2a75eb1ef209103261a2d963603aca1116a2e96ac106e	2026-07-13 11:40:36.201652+00	2026-06-13 11:40:36.290369+00	2026-06-15 00:09:16.853913+00
e3110c01-1cfc-447e-bb9e-6237b12a93e1	0342e751-0cee-4e4b-8724-3650c6d0d0ae	a92d9838dd0f8df655e53b9371836f4c8f3db73c343877dc7e12b5b0cad556a8	2026-07-13 14:56:42.788976+00	2026-06-13 14:56:43.073339+00	2026-06-15 01:44:37.656571+00
57129efe-385b-4c20-ab32-8a5c4db07954	0342e751-0cee-4e4b-8724-3650c6d0d0ae	101d60d4412e8c300b763afc33dc532170b9a5bad870211f0eefb4a3c20d3f58	2026-07-14 08:42:11.033038+00	2026-06-14 08:42:11.304064+00	2026-06-14 08:52:51.746106+00
ab34e508-d576-4433-ba74-bee01ae3f4df	0342e751-0cee-4e4b-8724-3650c6d0d0ae	0c8b0649808a321a4f106b5e243d17c846866e6f2ea52fb18f1458bd44ed5cc5	2026-07-14 09:09:32.384148+00	2026-06-14 09:09:32.661612+00	\N
5a0f057b-a7c1-4d96-a240-10a1d91b2186	4f8f526b-cb59-411a-8689-bd75b8ad0138	bf676f407ac2864bf90815c00cb3d1be10331da7946601c6bf6de5299bd8f4aa	2026-07-14 09:32:38.481117+00	2026-06-14 09:32:38.569368+00	\N
93873530-540f-4705-b4a4-e98c5bae074d	53d98013-bbd3-423a-84ae-3803a841f72c	004b8cbdce948b8fddd3ba8c783924ab93500f1c56d1caf8230a3b933509dcdb	2026-07-14 09:01:11.393284+00	2026-06-14 09:01:11.479785+00	\N
603a9c41-b28d-4627-abf0-27a810cc8b89	0342e751-0cee-4e4b-8724-3650c6d0d0ae	86c8703d64f20d3db2ef4376e03a8aa046f4f94d30feb61eb44c10fe56427776	2026-07-14 09:09:32.385502+00	2026-06-14 09:09:32.472699+00	\N
ee63796f-4609-4d33-86de-fd82c56fd0fb	4f8f526b-cb59-411a-8689-bd75b8ad0138	3792f6158f94660622591386349370fbb4d74e0a27104e5e502b8baeda9e14e5	2026-07-14 09:21:02.588872+00	2026-06-14 09:21:02.675355+00	2026-06-14 10:29:56.128172+00
e7e5665c-1957-4045-aa4e-7b921d351c61	0342e751-0cee-4e4b-8724-3650c6d0d0ae	7bf0d402c661182b451ab76e9b60655fe863c4256bba850ad95b18edb48bc123	2026-07-14 09:09:32.376727+00	2026-06-14 09:09:32.462368+00	\N
f044710c-6913-483d-8e6e-64749e5c0355	543eb38c-7878-41b0-b2e6-a58cbeb0fa06	b11661dbd4172b2e44d0269d4710150c87ae5e7f4f8a338887b3842e4e6b3bd4	2026-07-14 10:12:49.79597+00	2026-06-14 10:12:50.077694+00	\N
6e5faa70-6bbd-47cf-996e-ec27e882e60a	543eb38c-7878-41b0-b2e6-a58cbeb0fa06	478c10a4d77bda75f729f2f67b6988f34635b7178070a08e65e4ecfe81217381	2026-07-14 10:12:50.557215+00	2026-06-14 10:12:50.838277+00	\N
ef1711fc-95ce-4788-bfb8-3285836d17fc	cd64452e-ed42-49d8-902c-eeca68d455cd	971e62d8c2081dfe67cfa88252bf68e4221a175be3dbe41df75a775d9d4eee58	2026-07-14 10:21:37.716415+00	2026-06-14 10:21:38.001876+00	\N
6367393f-341e-43ef-8abd-0a583ba1a515	520f96ef-7103-414c-8400-da6b60663eb8	b1a4d248635a525c59e05606b79bcb58119d5fab08b2e44228713e659a593f56	2026-07-14 10:24:26.193347+00	2026-06-14 10:24:26.284289+00	\N
aa631345-f3ab-4cb5-9782-845c9cfe5bac	4f8f526b-cb59-411a-8689-bd75b8ad0138	a3d09cf4e68f1d6acecc49955a449cdb3c5254d3d07ed46288d0a2eb64e6fa91	2026-07-14 10:30:10.247343+00	2026-06-14 10:30:10.526412+00	\N
f2c41330-60d2-41b8-b9e8-d872e7a54933	4f8f526b-cb59-411a-8689-bd75b8ad0138	c582a5d454e20e5ad9e870fc71832295d9d7b45b8cd052884a03040b4426d350	2026-07-14 10:30:11.076508+00	2026-06-14 10:30:11.16582+00	\N
da9f3aa9-b58c-4ba9-8ff5-45ac1a562f71	01364b6d-0292-47cc-8f5a-7054d3652276	7095d59ca4dc06a5de8841022508df3c9d8f8f42e0913902b9c8e18ef4d30a66	2026-07-14 10:30:30.724378+00	2026-06-14 10:30:30.813558+00	\N
e0bad0ef-c04b-4c5d-bee8-a328d3a16aea	01364b6d-0292-47cc-8f5a-7054d3652276	fb413fc3c7de17051f131cf34332c754b0524d0564297e1cb4c6e96ed4fdd83d	2026-07-14 10:30:31.366786+00	2026-06-14 10:30:31.45635+00	\N
527d8279-5914-4930-a5fc-d2c91d76ea6c	4f8f526b-cb59-411a-8689-bd75b8ad0138	3d480651e04da9698f23217081a4644489e15d3cf665f21343eda50678d5afc5	2026-07-15 00:09:17.339221+00	2026-06-15 00:09:17.619203+00	\N
24d58710-7e62-432d-97db-13a7b3006ff8	cd64452e-ed42-49d8-902c-eeca68d455cd	a70256047dd68af4f75c7eea5f91dc9ead397e49663ae48c4420feec5d0c8cf3	2026-07-14 10:21:38.550468+00	2026-06-14 10:21:38.642418+00	2026-06-15 00:55:18.522709+00
5b689ce1-2668-447d-99cb-a2d5b5d57757	0342e751-0cee-4e4b-8724-3650c6d0d0ae	7437ff1035f9e44ae6f7ae21d8eb04f82b4a31c22a358cb98117e79e40ebcc6b	2026-07-15 01:44:38.149207+00	2026-06-15 01:44:38.432706+00	\N
6488a3a1-d625-499a-bbb2-58eac2250f7a	5508302b-91a6-477e-9a30-295a658630de	f7b0362eb01436857dfbb5c7e560c3d6c550f19118efd71931a46a2a957bda00	2026-07-15 01:55:50.786011+00	2026-06-15 01:55:51.069278+00	\N
cd8fff52-711c-418f-9005-dd5d5702268e	4f8f526b-cb59-411a-8689-bd75b8ad0138	c4d46ee048a8ca6e8208e3e472c47580a61a7412e0f7e5d254863fdc2d673279	2026-07-15 02:30:45.49418+00	2026-06-15 02:30:45.784791+00	\N
cc473ff1-6fcc-45ca-8b7f-cef17651fcf5	4f8f526b-cb59-411a-8689-bd75b8ad0138	eb56098b8e9288065ead0ca45550737166aa936911284f6bd2a3436120e01a45	2026-07-15 02:30:46.339464+00	2026-06-15 02:30:46.425988+00	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."schema_migrations" ("version", "dirty") FROM stdin;
17	f
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY "public"."spatial_ref_sys" ("srid", "auth_name", "auth_srid", "srtext", "proj4text") FROM stdin;
\.


--
-- Data for Name: user_badges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."user_badges" ("user_id", "badge_key", "awarded_at") FROM stdin;
4f8f526b-cb59-411a-8689-bd75b8ad0138	first_checkin	2026-06-11 03:17:10.45139+00
520f96ef-7103-414c-8400-da6b60663eb8	first_checkin	2026-06-11 06:52:22.284961+00
520f96ef-7103-414c-8400-da6b60663eb8	journey_starter	2026-06-11 06:52:22.284961+00
5508302b-91a6-477e-9a30-295a658630de	first_checkin	2026-06-11 06:54:04.798039+00
72983125-1336-4911-93f1-58817ccf8795	first_checkin	2026-06-11 08:54:47.431608+00
ab399319-768d-4f8b-b3d2-a77e76a9ca58	first_checkin	2026-06-12 06:09:58.66914+00
9f7d5180-abe1-4c22-b640-1644c4f3640d	first_checkin	2026-06-12 06:15:08.832733+00
821768a5-8bb9-464e-a083-6225736a26b5	first_checkin	2026-06-12 06:38:43.549114+00
1555459e-6a2f-49d8-b281-8ee5223a2072	first_checkin	2026-06-12 06:53:02.926191+00
b5fb73dd-67f9-443b-b6db-68fd94f4bc93	first_checkin	2026-06-12 08:06:36.77677+00
b5fb73dd-67f9-443b-b6db-68fd94f4bc93	explorer_10	2026-06-12 08:14:48.141717+00
4f8f526b-cb59-411a-8689-bd75b8ad0138	explorer_10	2026-06-13 00:25:08.650713+00
4f8f526b-cb59-411a-8689-bd75b8ad0138	journey_starter	2026-06-13 00:25:08.650713+00
3d23104b-dce2-4205-833b-fa2c003e89f2	first_checkin	2026-06-13 03:54:13.486253+00
520f96ef-7103-414c-8400-da6b60663eb8	explorer_10	2026-06-13 09:19:38.630877+00
7fac5feb-a2e6-4902-8941-8f14eadf8c7c	first_checkin	2026-06-13 11:58:35.98258+00
4f8f526b-cb59-411a-8689-bd75b8ad0138	provinces_5	2026-06-13 14:57:47.528905+00
977cefb0-c1dc-4586-857b-efbce2509f04	first_checkin	2026-06-13 15:30:35.399311+00
543eb38c-7878-41b0-b2e6-a58cbeb0fa06	first_checkin	2026-06-13 15:34:33.707464+00
4f8f526b-cb59-411a-8689-bd75b8ad0138	night_owl	2026-06-13 18:04:01.433371+00
0342e751-0cee-4e4b-8724-3650c6d0d0ae	first_checkin	2026-06-14 02:20:15.075773+00
\.


--
-- Data for Name: xp_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."xp_events" ("id", "user_id", "type", "xp", "ref_id", "created_at") FROM stdin;
d52b85c6-e40c-42ba-9db5-4f4990ee5fc7	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	0c0d28cd-de2d-44ec-a224-609384b7e428	2026-06-11 03:17:10.45139+00
c48c2b9d-29c6-4e45-ad89-60a0a1caf0c4	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	028e2b7a-a25e-40c6-9712-8b6ebb9a4f22	2026-06-11 04:04:01.105565+00
b1b8fae5-b92c-415e-83fa-b59ac502b118	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	1f7208a7-66e1-4127-84b0-115416a5f07f	2026-06-11 06:52:22.284961+00
c8f34371-a96d-447d-a0e3-e163a7d3ca82	5508302b-91a6-477e-9a30-295a658630de	checkin	10	8d2454b9-8793-4b41-af8c-94eed86e8510	2026-06-11 06:54:04.798039+00
552acebf-62e9-4207-8bea-f25e7b4f177a	72983125-1336-4911-93f1-58817ccf8795	checkin	10	dffbaf2c-ccdc-42c3-ae7a-0d70df60120e	2026-06-11 08:54:47.431608+00
6e171115-d87e-4e4c-9483-e8136bee2663	72983125-1336-4911-93f1-58817ccf8795	checkin	10	9dfbaad5-c798-4eba-828d-ed003326747f	2026-06-11 08:55:37.611256+00
91b9d927-86c4-484f-9fd4-6d1e1c752ea0	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	5a109816-6593-402e-b9fd-294e5f90cb13	2026-06-11 10:13:36.272071+00
35b8a943-6abf-44a0-8454-09a0223aae61	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	62c659d6-3e4f-452b-af6b-b028586092d2	2026-06-11 10:17:35.99789+00
63e7137b-51ee-462a-a00a-9c143f4ab7b5	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	da27aa92-8e31-4b82-b7b7-82689764736f	2026-06-11 14:55:45.383131+00
6acd7e20-3d49-4686-8e36-642524f16d68	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	0d215a15-4c24-4204-9cfb-0b108bf1b2d9	2026-06-12 05:16:55.201382+00
0a1cf32e-30d2-404f-af0d-188731c6230e	ab399319-768d-4f8b-b3d2-a77e76a9ca58	checkin	10	ae5e536d-4f06-45e3-95ab-7268c7a6bc96	2026-06-12 06:09:58.66914+00
df7d0b1f-c28b-430b-95f8-713ff8f31c08	9f7d5180-abe1-4c22-b640-1644c4f3640d	checkin	10	68a1c99f-67cf-4502-8901-176b96231b16	2026-06-12 06:15:08.832733+00
e45ba54c-900a-44ae-80b7-d96fea3dfe61	821768a5-8bb9-464e-a083-6225736a26b5	checkin	10	6b7d65d1-73c8-46d1-aa20-8f3b734b3798	2026-06-12 06:38:43.549114+00
5eba61bd-83d9-445f-bb5b-fe33ff7945d1	1555459e-6a2f-49d8-b281-8ee5223a2072	checkin	10	6ab89b60-82b8-497b-9728-375ec6c8630b	2026-06-12 06:53:02.926191+00
08d897aa-b29e-471d-85ac-519b7506dc2c	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	db60f53b-9169-4e36-870a-dff93df31076	2026-06-12 07:05:28.222873+00
9bb7da9c-9872-4e2b-9e4a-1c5c9f780c8b	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	0686654a-e550-47d5-b1ba-653184eb52a3	2026-06-12 08:06:36.77677+00
38a2bb69-5699-403d-bba0-d756a909d67a	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	827b2990-1bbe-44b2-b680-bb9f2c8f40e9	2026-06-12 08:08:46.187046+00
966a0964-6163-4347-ab0e-50ce5283a49f	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	32ec1d29-54d1-4cd1-8cf8-eef8373be8bb	2026-06-12 08:10:16.109526+00
f3dee570-ed79-493a-a05b-ed6aa703ca2a	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	d4329687-1501-4c5c-813f-cf09dadd2043	2026-06-12 08:14:29.368034+00
5cb7644d-7f73-46f0-87b6-e90d8afc1494	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	4a44cc81-a918-41af-a302-09f5081c3e87	2026-06-12 08:14:32.545991+00
8960a90e-abba-4496-adf7-3463620c42c2	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	8438ab0f-6606-4bbc-abf8-78faa6ce2197	2026-06-12 08:14:35.746039+00
3a48fb1b-ad07-478d-9d04-41d15075612f	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	5ab64077-3de2-45bd-b809-ca654c9ce1f1	2026-06-12 08:14:38.878129+00
054dfaaa-7680-4dd0-9cdd-4999b93bdb90	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	9e630cf1-eaa8-46ea-a657-6a96757b77f3	2026-06-12 08:14:41.882882+00
0c5ad594-f5ab-4a3a-ad4c-2fb8067bbbe9	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	c5d3ccde-c420-4b50-9149-4f32cf706a40	2026-06-12 08:14:44.928648+00
54bee04b-5d01-44dd-a457-8bb0fee2fac1	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	a4a0fc9d-7338-454d-9735-bd0800fc997b	2026-06-12 08:14:48.141717+00
d488fbbc-e43b-43f3-bf2e-eb2fbd19b803	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	f9a23192-e0a4-433a-8a18-43ad9b0798a5	2026-06-12 08:14:51.089055+00
059b10a9-efc1-4204-adf1-0d52e371729b	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	c1bb2a89-a3a0-4ccf-82cf-e48fe7930842	2026-06-12 08:14:54.182072+00
34408a4f-3442-4ddf-bbf3-a21b41188935	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	d77df17c-7887-4c59-8375-2498eec6c92d	2026-06-12 08:14:57.356708+00
669b0c23-e244-447d-bdd5-d87c2450f14c	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	80380f69-bf8e-4394-b55e-a36825abb8d8	2026-06-12 08:15:00.532559+00
664f493a-fb19-48ae-aef4-b5292c9c22c1	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	03cb539c-81b7-43c7-bd19-0aca47986a52	2026-06-12 08:15:03.721306+00
e7e7f24b-8335-4fd4-9b35-8f4f3c53586b	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	e2b4b0ce-7a45-4d21-836c-7afae4244cd3	2026-06-12 08:15:07.015908+00
1b235781-b817-4c71-9806-c279f797d9b6	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	7f174c27-14d4-4f7e-98f2-a282051cc771	2026-06-12 08:15:10.052289+00
c3934ec8-63e9-4196-a2ca-ea3137226542	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	55e11c06-b329-4f5a-a0f9-a11e8b8a31ee	2026-06-12 08:15:13.253039+00
7d591f7e-ce6b-4fa2-b3ac-28558baaabf9	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	5acc393c-18a1-4108-91d7-5250991010e9	2026-06-12 08:15:16.414262+00
426b2835-0b09-4c76-9d2c-94b67a968405	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	fb22833a-57a0-414b-96a0-cb7e3b6a36b6	2026-06-12 08:15:19.546133+00
74e5f300-0252-405e-8e00-5a3260288565	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	370107af-32a4-46c2-9762-f4a410926a38	2026-06-12 08:15:22.718958+00
11c1a4b1-5429-4a32-928c-ed335d6029a3	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	83ecaa98-4528-4eee-a6a8-e69c01c34f77	2026-06-12 08:15:25.766012+00
35616a0f-43a6-4e5d-bba1-4f2b56b2f3d3	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	aebdf2b1-a91c-463c-97f3-b7a70e2ec88c	2026-06-12 08:15:28.926316+00
59cfdfaa-b7b2-43cc-8c7b-3b0dda8146d4	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	2d3d6fc8-a771-4dfa-8e8e-6bebbe6be665	2026-06-12 08:15:31.948365+00
7d12759b-2c44-44d3-b253-2a470c20b7b8	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	8454c5d3-2276-4ed8-a994-d07c3ba8319e	2026-06-12 08:15:35.087881+00
5cf8de40-368c-48dd-80d1-3db8da083111	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	3f672486-2a89-4f07-a2a6-972b0789fed0	2026-06-12 08:15:38.130394+00
448c188e-0db5-4359-82b1-432b019c9139	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	ab4e634f-17a8-4f8c-b3af-729b5995de4f	2026-06-12 08:15:41.148661+00
8e339615-0b58-44eb-94e4-2e207bc73745	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	048ec11d-463c-4726-85af-7d374da4a3fc	2026-06-12 08:15:44.170934+00
82b6f343-1ba7-4019-8f9a-8484c52ab214	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	26840064-9362-4cd9-a5ad-f4c80d450174	2026-06-12 08:15:47.32381+00
3b0d2340-8463-408d-8a87-c46aba146b6a	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	b619c89d-35c7-4e85-abd7-ed51e151db7a	2026-06-12 08:15:50.243312+00
bb308d59-4e13-4c22-b2cb-976e874b5491	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	a427f787-875f-4175-813a-cd820c2f8370	2026-06-12 08:15:53.401065+00
43782d02-0e8f-4c99-9d48-1b0c315e557b	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	d73704a5-4bbf-4c08-9384-4d4e88d2c1ec	2026-06-12 08:15:56.590915+00
a01f4b99-d6d4-43cc-9280-715775f169b7	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	ee870e27-5a70-4868-86bd-94b6aaaca37c	2026-06-12 08:15:59.474903+00
1cbb27b7-9558-4335-8d97-336e1b285329	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	55277348-f9c4-4cad-b7d8-a783b0701be4	2026-06-12 08:16:02.604244+00
ca4a9c98-5890-457d-a44d-686a9f855ef2	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	458dd412-28bf-45fc-a055-0221b73d8413	2026-06-12 08:16:05.733823+00
807debc1-b44a-49b8-8ff7-7839ceca6ddf	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	50f107d5-1f8f-4b56-a309-f9af0dd9c051	2026-06-12 08:16:08.889661+00
324424b1-671b-491e-8eb0-672be9adf943	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	7021ecc3-f54c-4d78-b250-f4e3cab27c5d	2026-06-12 08:16:12.054565+00
d905def3-4484-4264-8ed7-3cc793d33c0c	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	b120e36b-56ff-459f-840e-bb02505f84d7	2026-06-12 08:16:15.098072+00
c2b1d356-3f5c-4aef-b59b-8d78f489b099	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	aa64446b-60e2-4119-b7a1-288bf3ea66ee	2026-06-12 08:16:18.240586+00
9b78711f-74ac-470c-b9e5-dc9ec76e1fbd	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	8544bc11-4488-423d-af26-bd521364c8c2	2026-06-12 08:16:21.27225+00
bbe4a595-c24c-4c23-a508-f1227992bc33	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	49dd4063-746b-41bd-85ac-a614cdbe02a6	2026-06-12 08:16:24.226775+00
0243c004-2e33-48eb-a037-9373e7972366	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	4c6eccb6-6a8b-4f78-8ed3-bbfb636ff393	2026-06-12 08:16:27.128199+00
bd2a4f5c-b613-41b5-afcf-51111c62510f	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	016dee0a-3788-417d-969f-c9dce145a8f1	2026-06-12 08:16:30.05569+00
894051a0-afc4-4174-b56e-a6a41c4a61c8	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	be4387d6-abfc-43b9-b8cf-2cf3fe787924	2026-06-12 08:16:33.061337+00
9140d1f0-b505-4079-8497-48c8ed38b033	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	92f9213e-af75-4932-bcd6-bb0391873580	2026-06-12 08:16:36.041758+00
e10051bd-3473-48ad-8633-d1114714644b	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	fbc49628-633a-435e-918d-662f16823314	2026-06-12 08:16:39.179698+00
25d227b3-6221-4bab-85f8-a17a3fc29930	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	dd01fa04-b494-47c4-b0f7-71f538558c75	2026-06-12 08:16:42.194086+00
274ed31d-7be5-4a07-97da-c0bac4eca8b9	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	4375a5ae-1d69-4d47-83c7-461ce9ae470e	2026-06-12 08:16:45.351376+00
089670a9-cae9-4894-83ea-05b62cfa1153	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	62d2307b-9d41-4706-9ad4-c02a5b7709a1	2026-06-12 08:16:48.493028+00
90c94f4d-ac14-4e65-9a8c-c1f7d348adfb	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	dc0a6f16-b401-420d-b322-4d7f1e9e7b45	2026-06-12 08:16:51.645999+00
89377e06-b69c-40d2-b5cc-c1f4e5dbcf11	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	ad1422a6-61cc-4408-9b85-9a9e13cff416	2026-06-12 08:16:54.769688+00
a08a67d6-ea26-4db0-a71f-390e2349ec0e	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	4274d24a-a4ad-4cd1-9239-3ce092ef3a63	2026-06-12 08:16:57.947377+00
daa4d87c-41d8-48f5-916d-6afeae527579	b5fb73dd-67f9-443b-b6db-68fd94f4bc93	checkin	10	66eb6eb9-feef-48b9-8a18-1d9964a4672a	2026-06-12 08:17:01.080656+00
3288f412-b647-4fe4-a16e-c596e76b8d34	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	0f23717b-991b-486a-b900-cd7c3a658560	2026-06-13 00:04:08.768212+00
07c10ddc-ecd1-4c05-9101-5dbe59d53002	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	5ac8049d-6e73-4256-83fe-735670ebc85f	2026-06-13 00:09:07.374413+00
b8763154-9eb9-4810-a3b6-6a5543afc6a4	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	d2d21695-e680-45cf-b808-3f7e656412ba	2026-06-13 00:10:54.476098+00
06c9c6d1-7749-4df6-aa72-ba3b557de246	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	e3bdc6c2-da4a-4e34-89a7-b3e76e7ec740	2026-06-13 00:20:05.275938+00
03fb6862-0af7-4c21-8d13-58164c74401e	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	30f2aaa2-8ed4-481e-adb1-2cb92e4616c1	2026-06-13 00:25:08.650713+00
a69e69f9-bfd6-454e-ae85-8880c128f3cf	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	0ac5a013-8318-4bd8-bbc5-d05419a46837	2026-06-13 00:31:58.289398+00
1613d94e-63e1-45a4-a742-71e9bfb95daa	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	397921c2-fa25-46c0-8cf3-f2e83f74c9d0	2026-06-13 00:51:10.948132+00
f5fbab81-20db-4cdc-860d-48d104557ce9	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	ab51e919-723c-4a4b-8168-bc0357af2cff	2026-06-13 01:57:38.300542+00
ae039ef5-d337-4fe9-8387-d9c1028d2181	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	55cc89e6-0a8a-46a7-8ae6-f385e857ca15	2026-06-13 02:23:29.457635+00
e3b8804c-2419-498b-adcf-d64c50eb6c68	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	e528e9a5-0c83-4bca-882f-b275a229fb07	2026-06-13 02:43:45.083023+00
84e30d6a-eea5-453d-8775-736c652a195b	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	73b152a9-eff3-4a27-8b39-58e195e5398a	2026-06-13 03:37:43.527982+00
bf3e271b-cb2c-4c29-9a7c-74a340bc5ba4	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	f31b78ce-4905-4230-8e22-89eca78e2473	2026-06-13 03:44:20.797477+00
81716fba-bca2-4609-bdeb-e1a9064631d6	3d23104b-dce2-4205-833b-fa2c003e89f2	checkin	10	9746dc15-86da-40be-b076-e14d65cc6557	2026-06-13 03:54:13.486253+00
199f93bf-f04e-47a9-938d-9bd4f142ef1d	3d23104b-dce2-4205-833b-fa2c003e89f2	checkin	10	3e30c7e3-c071-45e1-bc52-0eb348c23aa8	2026-06-13 03:54:30.417862+00
5afe9ade-ed5a-4c49-8c23-ea6c24bf87dd	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	666739ff-00d9-49d2-b5be-ce2063d5acd3	2026-06-13 04:46:14.171615+00
a7b22d83-f368-42c9-8f92-017f0de64f91	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	6bc5ca62-d292-4aff-85bc-b70febd8dfb4	2026-06-13 05:30:52.280531+00
7dbb2308-3e81-42d2-bed2-3113ef173d2c	821768a5-8bb9-464e-a083-6225736a26b5	checkin	10	442a4d2f-6b82-4fbf-b2ad-a1d70da166d5	2026-06-13 05:37:54.390696+00
e420cf2b-f334-42dc-a98b-7731af994b83	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	3b6194e0-640b-4db8-b155-209615c9a050	2026-06-13 05:38:34.312155+00
8b199cd8-fbef-477e-906d-e491642f045c	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	7b991662-972c-463a-ab7a-b6affd287f61	2026-06-13 05:38:47.381877+00
4b7910b2-9299-4334-8c85-808972b2edb7	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	6f0929c7-b33f-47e4-8ef3-7121d4ccd560	2026-06-13 05:47:26.781935+00
f83a6c15-42a3-4629-bb7a-05f8b26e3ad4	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	6f0929c7-b33f-47e4-8ef3-7121d4ccd560	2026-06-13 05:48:29.635918+00
44f07118-23cc-4174-9254-a597bf2111b6	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	6bc5ca62-d292-4aff-85bc-b70febd8dfb4	2026-06-13 05:49:19.774367+00
b0441b64-2d4d-451b-9094-15f009272926	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	5ef8ce8a-0408-42e3-b65b-14b21658501a	2026-06-13 05:50:13.986477+00
7bb8a3d2-e9db-44d5-9efd-1fa983978dad	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	88ff9f74-2894-46d8-8910-7473b2df53fc	2026-06-13 06:44:42.530814+00
7f9a82f5-90a0-42ac-b10d-fa20820cdbf6	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	efc69860-0fa4-44ea-b697-bfa47db463be	2026-06-13 07:19:07.446902+00
f779a54d-6536-4e1a-8066-51913d6999e0	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	934a21eb-a015-4f68-b3de-99a277c2a4b6	2026-06-13 08:57:28.337631+00
754c2d76-c8da-44cd-b073-075bf31c4222	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	ef5cab98-9347-4e46-8255-af57df1e7106	2026-06-13 09:12:12.454422+00
f2846b46-832b-4abf-8b96-e2c04e6b4959	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	1e591d97-6bf5-45de-89d4-a6d87e028a9a	2026-06-13 09:18:00.560335+00
31f54a92-4281-4940-a683-78b35412805b	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	80c95747-b97e-44f2-bf12-01737c722370	2026-06-13 09:19:38.630877+00
38460228-e77f-4fd4-b2d5-670f52a853c3	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	38dac9e2-f37b-43b5-a909-9dffee8c0da2	2026-06-13 09:19:58.441414+00
b2f43003-d7c5-45d5-8ac6-06bc81520ecc	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	1b1a4e61-c170-4530-9067-f347e2a069fc	2026-06-13 09:33:24.622556+00
56648ffb-53f6-4fbb-88e6-aaeae0596ce9	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	b65b8b61-316e-42db-a288-aac4805f8aca	2026-06-13 09:45:50.874101+00
25919426-598b-49dd-b9a1-6177ba302595	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	65e65feb-aab7-41d2-bee9-37fc1b04223d	2026-06-13 09:48:06.455425+00
747709c9-9b0f-4c0f-a8e2-6df523ea8e3a	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	fc9ef34d-ce3e-4cbc-97dc-a5a7a7310820	2026-06-13 09:57:10.826654+00
68572db8-1653-4c89-b4f1-2be819c8a2ef	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	5ed40ac8-ad29-4a99-9f37-f9aecc71eaa8	2026-06-13 10:10:27.942766+00
2b29a3f4-47b9-487d-b756-25a4029ae045	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	a87b5659-72a2-4c47-9b32-e6c8e8e460de	2026-06-13 10:11:24.236127+00
34ed337c-16d7-44a8-a559-6baef543622b	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	cbe9e96b-c7bd-4227-ab7d-46495aa98691	2026-06-13 10:11:46.639799+00
9ceee116-e0ef-4cd8-8cc9-559d87cc7113	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	0afece2b-dc4e-4eef-9cda-fe70083641ef	2026-06-13 10:14:20.872575+00
fc021c25-6a9c-44ca-9680-be194229d2c9	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	836d4d23-e5b5-491c-93fe-c09535a844a1	2026-06-13 10:23:26.436017+00
7d9c6778-1f10-4c17-a6a4-3deb012e8e40	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	135f06b2-7a4c-453d-af79-860c2a380bd4	2026-06-13 10:23:54.867309+00
641fce8a-88aa-44c7-8b99-569e0ef9a32c	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	bd7cc9a7-ddc4-4254-8994-f6fc771a6b64	2026-06-13 10:25:38.644323+00
c988ef04-938a-4280-b6d3-848a9d6e7634	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	9f5c3860-8443-42a1-8334-9896cc30e3cd	2026-06-13 10:41:16.258817+00
24840fa0-4e7c-43db-8ccb-2eece0b29059	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	9f5c3860-8443-42a1-8334-9896cc30e3cd	2026-06-13 10:41:24.382037+00
f542e6b6-d763-4046-8876-469688a68066	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	bae5d237-bd56-499a-b65b-f3de20b30d55	2026-06-13 10:41:48.710227+00
6ba8bb6a-505c-4af0-8bd0-2b468161fbef	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	bae5d237-bd56-499a-b65b-f3de20b30d55	2026-06-13 10:41:56.89246+00
1ea65e4b-c54c-497b-9bf9-9fd20e8f6d31	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	2594bd69-b389-49b0-9357-45462bf70c82	2026-06-13 10:43:26.024617+00
cca2874f-d674-4dce-b527-dc29664f34c9	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	d5199ae6-77ca-45e5-9546-3a5f5c7f874e	2026-06-13 10:44:16.076915+00
4b604db2-e744-49e7-b8a7-1ed77bd358b9	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	e1575567-e47d-4c77-8ceb-33acd6b7b18e	2026-06-13 10:51:08.827432+00
25a8cd44-d944-4b60-b157-141ea1131ad9	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	198caa71-c383-45e1-ba15-92a6e106f82b	2026-06-13 10:57:06.149215+00
9a0c09ec-c1cb-40ac-a269-a9c095a6e79b	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	22358dcd-0cd5-437d-b680-42f69b96c21d	2026-06-13 11:06:06.000929+00
3f05bf8e-e539-4049-9395-2a5209be17ce	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	23a66b75-6379-424c-beee-7ca1b67f88d8	2026-06-13 11:42:51.043761+00
9d4c8eb5-de5a-402c-9e77-afbf0334b5ae	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	c49833d6-f57a-490f-9dba-498512a50ece	2026-06-13 11:50:48.744631+00
6d5900bd-d059-4ded-be73-cac3249458d4	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	229f2b25-a925-4b3a-97ed-df0fb47c77fb	2026-06-13 11:51:06.746641+00
477ee580-7c48-4ebf-9937-eec915a40096	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	bdcdac6a-9985-4f70-b849-ac2c970097e0	2026-06-13 11:52:27.054817+00
f3e7c5c8-c9a0-4560-8ba4-f6fbf2425aff	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	716227d6-44f0-4bb3-b747-fdbf18710977	2026-06-13 11:52:48.48794+00
8ae20174-bd81-42cb-ae44-7fe0da8cce48	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	40af0117-3d4a-4efc-adb9-23e8801ae6fe	2026-06-13 11:53:12.608465+00
519af62e-bb98-48c4-81eb-e9db81e26392	7fac5feb-a2e6-4902-8941-8f14eadf8c7c	checkin	10	33a46cbf-f94b-4415-aa03-95be955c15e5	2026-06-13 11:58:35.98258+00
607a22d6-3b4c-4f32-90ac-51fd52ec0dc7	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	ead3baa7-a131-42c8-9685-e8848b5a6fe4	2026-06-13 12:43:21.781056+00
b4cf46a8-66f1-4700-8d48-67ee7f3d202a	821768a5-8bb9-464e-a083-6225736a26b5	checkin	10	d94b23ab-bae4-46c7-a3c2-631389b61a9f	2026-06-13 12:44:25.751701+00
a775fad1-a644-4e18-8c82-8057d7394748	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	5f9404df-0712-42c8-9c28-bcc79af469f4	2026-06-13 12:44:27.626505+00
37493e87-2902-4262-924d-740eb26957da	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	01a1e767-e0ff-4fe6-92e0-ef7c429d2146	2026-06-13 12:44:45.216893+00
a7b55128-20c9-44f7-b888-802987d0c94c	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	1121689a-e495-470b-acfa-dcfff9052bfa	2026-06-13 12:45:48.258892+00
99e42e2e-9e47-49f5-b724-41a3492acc8a	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	1da89fc4-97b6-4216-82ab-32af5a21189c	2026-06-13 12:46:00.261546+00
9ddb86eb-6ba6-4814-bcc5-84e9d1768b21	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	21f92c63-d5e2-4657-a131-223cae91d25c	2026-06-13 12:46:55.741181+00
5bbf71a9-5a83-4beb-a9b0-559046fb0966	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	f8bb7c1e-13fa-4d93-8027-749a599ca4d2	2026-06-13 13:03:19.697583+00
6cecdfa3-8a22-4fd1-9e9c-c549451ede84	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	75cfbc96-e4c5-46af-a3b8-a3a07695eed5	2026-06-13 14:19:28.004552+00
90453683-e9d7-4e02-8c68-746ded108e9d	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	f12b1483-d695-4115-9e9e-d179ae1e9efd	2026-06-13 14:19:56.884073+00
ed485e4a-f802-4926-8f28-64e1ba69918c	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	919c7081-87b7-4a22-91a3-efe52abb824e	2026-06-13 14:20:14.338765+00
3b83cd95-f43a-4735-a145-b8240bdaf17b	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	0f4299d0-8d64-4316-a42c-347de07d7c9d	2026-06-13 14:40:05.073618+00
46cdd547-1c7a-438d-b2f1-bba0f2fa42e6	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	703acff7-ee10-48e1-bbe9-31804de951b0	2026-06-13 14:40:12.234655+00
cd0f86a8-2817-4a68-92df-75aa8d95fbfa	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	1db10b22-6e66-4b83-b68c-f6069d8bb46b	2026-06-13 14:45:53.781815+00
ff37a0d7-2636-49b9-bb3f-8c87c3946ac1	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	abfb5933-ba04-4122-9af4-8a8b9b3b1989	2026-06-13 14:46:00.210862+00
87600844-1723-43fb-a1a8-ff8e69c2781e	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	2b504bd1-3fa3-4883-a92c-0be5744b2f95	2026-06-13 14:57:47.528905+00
346dc3d7-28d4-45b2-a30a-db672af33f7e	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	6e4f0460-7547-49f3-85d9-0c094586636d	2026-06-13 14:58:50.963197+00
590cc1f8-f37f-45c9-b7fe-54e8b05f6a7e	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	2b26e607-a208-472b-999a-388fb69f4ad8	2026-06-13 14:59:57.576271+00
72aa1597-9cc5-4ac8-bcc6-e76900765e0e	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	9c9ad02b-0ed1-478f-986b-653c3dd1ac3b	2026-06-13 15:22:37.078623+00
aa2e406d-849e-44f3-a685-4064c21aac90	821768a5-8bb9-464e-a083-6225736a26b5	checkin	10	c113752c-5282-4fbd-ad74-d4d279ca9ccc	2026-06-13 15:23:05.951005+00
05cdc3ae-6c32-410e-8588-8e47ab6f7e3d	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	1db10b22-6e66-4b83-b68c-f6069d8bb46b	2026-06-13 15:27:31.526394+00
5a6354b8-e6ea-4322-a2fd-d8875ba455ba	977cefb0-c1dc-4586-857b-efbce2509f04	checkin	10	84e72417-977b-4f43-bbff-b61880aae25d	2026-06-13 15:30:35.399311+00
81bebf11-a8d0-41a4-b494-611a649f7510	543eb38c-7878-41b0-b2e6-a58cbeb0fa06	checkin	10	51da2bc0-75fd-407e-a4c8-7dcb9bdb8935	2026-06-13 15:34:33.707464+00
8030502b-0ddc-4372-9f81-1a9b41bdf99e	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	cea21473-bd93-40f5-a8c3-5e7ea62c9e90	2026-06-13 18:04:01.433371+00
3c55a05b-972d-4ba6-8d94-841937c9d9de	0342e751-0cee-4e4b-8724-3650c6d0d0ae	checkin	10	965ea106-0a95-42dd-b564-a45e697441f2	2026-06-14 02:20:15.075773+00
71bf7009-8771-4275-87f0-dfaa0416f2bd	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	3b71097d-02da-4811-a348-8f4185234713	2026-06-14 02:23:14.844405+00
91937dba-5ebd-4e4b-aca2-0bf96cf80d54	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	b089a495-2a03-409b-bf09-8c5a2d76d689	2026-06-14 02:23:41.102704+00
8b2a14c6-7929-47de-a7de-99838b3b43a3	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	4057ff11-0ea4-4dc3-8c1e-c1a76afc50b4	2026-06-14 02:51:03.458637+00
ac7150a2-2e75-42b8-b632-f49d9d12c9bd	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	f1f41aeb-2212-4d43-b8b7-8de89432ac81	2026-06-14 02:56:02.00918+00
e20f3682-8fad-44af-9338-e362056f8b9b	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	0e255bd8-44d8-4703-bed5-69eebed796c1	2026-06-14 02:56:03.870432+00
3149f5aa-2d86-4739-89e2-7b25310bfef9	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	abf90d1d-8ba5-44cc-9eae-64cea7062804	2026-06-14 03:06:55.390651+00
4aabbd5c-65e8-4f90-802a-c7e4ee5e4e9f	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	1ccc8fab-ec81-4763-a2e5-2f5095768c52	2026-06-14 03:07:00.045307+00
44700f41-e88e-47c8-a317-9c6bf1a62efb	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	1ccc8fab-ec81-4763-a2e5-2f5095768c52	2026-06-14 03:07:20.017451+00
47e6f0d8-cb11-4baa-9846-d63007ba46d7	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	abf90d1d-8ba5-44cc-9eae-64cea7062804	2026-06-14 03:07:27.065102+00
d55b8425-d5fe-47f5-a767-6ee595bf1b89	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	a27eae81-f2df-4095-a9ba-4ab19e49b25e	2026-06-14 03:07:36.748822+00
677843fc-94e8-4843-aa6c-c65364d192a1	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	a27eae81-f2df-4095-a9ba-4ab19e49b25e	2026-06-14 03:07:53.473222+00
e2b7fe11-3ffd-40ac-9d4a-efc1dcf4d870	520f96ef-7103-414c-8400-da6b60663eb8	checkin	10	c613718b-aa46-4b20-ae44-740071ccd596	2026-06-14 05:17:14.741574+00
d053499f-a78f-4ae2-ba14-637a54049648	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	f4555e91-3e97-4bc3-8d05-38a880d3ab9b	2026-06-14 06:13:45.499523+00
f9c28d09-073e-426d-8174-d41451cadc94	821768a5-8bb9-464e-a083-6225736a26b5	checkin	10	6d3235f1-1afd-42a8-914d-63edef7a37ae	2026-06-14 06:28:12.789982+00
25616ed1-5d7c-41e3-b498-957aea195e41	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	743bdc55-eb93-4ced-ab5d-6debfa081ed8	2026-06-14 09:17:40.743538+00
251b2070-4b49-412d-a485-985af06f1753	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	4d123179-5094-445f-9e87-363475923d1c	2026-06-14 09:35:21.292893+00
e53ae2c6-393e-4040-a346-9fe430210c28	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	603df105-092b-4b93-92e6-82a510d06eb1	2026-06-14 12:27:39.784607+00
33387de1-a10b-453e-9142-be684f10b1be	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	cbc5a52e-de37-4809-94a3-54c49a5c27ee	2026-06-14 12:33:52.290777+00
2e545fa5-c196-419b-85d7-9bd8db80dec3	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	e5d7164b-b6b6-45c1-ab4a-fa50ba66039e	2026-06-14 12:45:17.369352+00
cb246e8b-3137-4211-b781-7e395df3b775	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	e5d7164b-b6b6-45c1-ab4a-fa50ba66039e	2026-06-14 12:45:23.92691+00
79b3befd-f593-4b79-a09b-f1bb8a32430e	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	cbc5a52e-de37-4809-94a3-54c49a5c27ee	2026-06-14 12:45:32.150101+00
fcd86261-d220-4255-8a29-6de4d47ea287	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin_deleted	-10	603df105-092b-4b93-92e6-82a510d06eb1	2026-06-14 12:45:38.583462+00
0d728a7f-46e6-4c72-9e0c-7a00d55263a9	821768a5-8bb9-464e-a083-6225736a26b5	checkin	10	678cbdd5-ece4-4cd2-9878-471de59a4242	2026-06-14 12:47:01.32722+00
200f7723-b0bd-4f9a-b598-ce44d51782f7	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	e0444098-7a84-4943-b71b-46a7d9f02d69	2026-06-14 13:54:53.765035+00
aafff400-0ae9-4e39-b032-2c80e72e5729	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	5528fa5a-26c2-417a-bf13-d7b027e9ffb3	2026-06-15 00:07:51.188813+00
afd34044-7796-42bb-bcb7-1ae3175d4551	4f8f526b-cb59-411a-8689-bd75b8ad0138	checkin	10	865809f4-8421-44ad-83bb-f4713fe069dd	2026-06-15 01:12:51.90938+00
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type") FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets_analytics" ("name", "type", "format", "created_at", "updated_at", "id", "deleted_at") FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets_vectors" ("id", "type", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads" ("id", "in_progress_size", "upload_signature", "bucket_id", "key", "version", "owner_id", "created_at", "user_metadata", "metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads_parts" ("id", "upload_id", "size", "part_number", "bucket_id", "key", "etag", "owner_id", "version", "created_at") FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."vector_indexes" ("id", "name", "bucket_id", "data_type", "dimension", "distance_metric", "metadata_configuration", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 384, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict xhPVemKith3S79fOSxoOlF0m6n5YHOQapwHTi0iHkOSESMF8LwMRZIIegTa56OR

RESET ALL;
