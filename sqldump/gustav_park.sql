--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customers (
    id integer NOT NULL,
    paymentid integer,
    customername character varying(100),
    hasnewsletter boolean
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: d_customers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE d_customers (
    id integer NOT NULL,
    has_app boolean,
    has_newsletter boolean,
    is_child boolean
);


--
-- Name: d_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE d_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: d_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE d_customers_id_seq OWNED BY d_customers.id;


--
-- Name: d_products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE d_products (
    id integer NOT NULL,
    productname character varying(300),
    price integer
);


--
-- Name: d_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE d_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: d_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE d_products_id_seq OWNED BY d_products.id;


--
-- Name: d_stores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE d_stores (
    id integer NOT NULL,
    storename character varying(100)
);


--
-- Name: d_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE d_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: d_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE d_stores_id_seq OWNED BY d_stores.id;


--
-- Name: f_entrances; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE f_entrances (
    id integer NOT NULL,
    timeofentrance time without time zone,
    customerid integer
);


--
-- Name: f_entrances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE f_entrances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: f_entrances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE f_entrances_id_seq OWNED BY f_entrances.id;


--
-- Name: f_purchases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE f_purchases (
    id integer NOT NULL,
    customerid integer,
    paymenttype character varying(100),
    productid integer,
    storeid integer,
    timeofpurchase time without time zone,
    profit integer
);


--
-- Name: f_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE f_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: f_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE f_purchases_id_seq OWNED BY f_purchases.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    productid integer,
    price integer,
    size integer
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: paymenttypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE paymenttypes (
    id integer NOT NULL,
    pmttype character varying(100)
);


--
-- Name: paymenttypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE paymenttypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: paymenttypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE paymenttypes_id_seq OWNED BY paymenttypes.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    productname character varying(300),
    price integer
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE purchases (
    id integer NOT NULL,
    customerid integer,
    paymentid integer,
    productid integer,
    storeid integer,
    timeofpurchase time without time zone DEFAULT ('now'::text)::time with time zone NOT NULL
);


--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE purchases_id_seq OWNED BY purchases.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stores (
    id integer NOT NULL,
    storename character varying(100)
);


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: table_updates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE table_updates (
    update_id text NOT NULL,
    target_table text,
    inserted timestamp without time zone DEFAULT now()
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY d_customers ALTER COLUMN id SET DEFAULT nextval('d_customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY d_products ALTER COLUMN id SET DEFAULT nextval('d_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY d_stores ALTER COLUMN id SET DEFAULT nextval('d_stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY f_entrances ALTER COLUMN id SET DEFAULT nextval('f_entrances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY f_purchases ALTER COLUMN id SET DEFAULT nextval('f_purchases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY paymenttypes ALTER COLUMN id SET DEFAULT nextval('paymenttypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases ALTER COLUMN id SET DEFAULT nextval('purchases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY customers (id, paymentid, customername, hasnewsletter) FROM stdin;
1	2	Monte Bruen	f
2	3	Tod Bradtke	f
3	1	Christa Kessler PhD	f
4	3	Dr. Amaya Ortiz	f
5	1	Hans Walker I	f
6	1	Aurelio Crona II	f
7	1	Horacio Schulist	f
8	1	Destany Schaden	f
9	1	Skye Kling I	f
10	2	Nicholas Bradtke	t
11	2	Milan Zemlak	f
12	2	Magdalena Jacobson	f
13	3	Mr. Danyka Morissette	f
14	2	Sally Christiansen MD	t
15	2	Glenda Beahan	f
16	1	Lucinda Marquardt	t
17	1	Jayme White	f
18	3	Marilyne Pagac	f
19	1	Enola Nitzsche	f
20	2	Alexa Hegmann	f
21	1	Skyla Schmitt	f
22	4	Dereck Sanford	f
23	3	Everette Barton	f
24	3	Payton Schaefer	f
25	2	Cynthia Miller	f
26	1	Daren Volkman	f
27	2	Marion Armstrong	f
28	4	Berenice Bailey	f
29	1	Forest Upton	f
30	2	Ms. Monty Auer	f
31	1	Florian Ondricka	f
32	3	Beau Douglas PhD	t
33	3	Dr. Rex Ledner	f
34	2	Arlene Metz	f
35	3	Sanford Hauck DDS	t
36	3	Alexander Johnston	f
37	2	Golden Vandervort	f
38	3	Shayna Glover	f
39	3	Cassandre Heathcote	f
40	3	Miss Vivienne Conroy	f
41	2	Ms. Mohamed Friesen	t
42	1	Randal Rice	t
43	1	Karianne Cummings	f
44	3	Marley Hessel	f
45	2	Rebekah Predovic	f
46	1	Gregg Ward V	f
47	1	Ms. Kelsi Macejkovic	f
48	1	Rickie Keebler	f
49	1	David Grimes	f
50	1	Corbin Moore	f
51	1	Rosina Bogisich	f
52	1	Aric Collier	f
53	2	Ezequiel VonRueden	f
54	1	Ms. Dejuan Bernhard	f
55	3	Sim Schinner	t
56	2	Meghan Prosacco	f
57	3	Mr. Litzy Wiza	f
58	1	Baylee Rutherford	f
59	2	Mrs. Camryn Wisozk	f
60	4	Mr. Thaddeus Rice	f
61	2	Mrs. Jonatan Marquardt	f
62	2	Letha Yost	f
63	1	Miss Tobin Gislason	f
64	1	Hassan Hauck	f
65	1	Rhoda White	f
66	1	Kiarra Reilly	f
67	2	Selmer Kerluke	f
68	1	Ara O'Kon	f
69	3	Jo Bernhard	f
70	3	Gail Brakus MD	t
71	2	Willow Jacobi	f
72	4	Donato Bayer	f
73	4	Cassandra Torp	f
74	3	Kaitlin Brekke	f
75	4	Irma Rempel	f
76	3	Maddison Rempel	f
77	1	Broderick Hegmann	f
78	2	Alfonzo Krajcik II	f
79	3	Edythe Rohan	f
80	1	Germaine Blanda	f
81	3	Alphonso Feest	f
82	1	Mr. Euna Jacobson	f
83	1	Ashly Bashirian	t
84	2	Herman Schiller	f
85	3	Estefania Hintz	f
86	3	Jaylon Little	t
87	1	Kelli O'Conner	f
88	1	Kiara Schaden	f
89	1	Mrs. Patience Cassin	f
90	1	Ms. Rogelio Bergstrom	f
91	2	Kiley Rice	f
92	2	Erna Boehm	f
93	2	Juliana Macejkovic	f
94	1	Marcus Lehner	f
95	1	Lemuel Sanford	f
96	1	Geraldine Kihn PhD	f
97	2	Sienna Barrows	f
98	1	Miss Bart Tillman	f
99	1	Evan Reynolds PhD	f
100	1	Bill Tillman	f
101	2	Sylvan O'Kon	f
102	4	Althea Wisozk	f
103	1	Austen Kub	f
104	2	Christian Strosin	f
105	2	Meagan Pagac	f
106	1	Alycia Goyette	f
107	3	Dagmar Schumm PhD	f
108	1	Amy Little	f
109	2	Lamar Jacobson	f
110	1	Jamie Gerlach	f
111	3	Rudolph Terry	f
112	2	Jennie Effertz III	f
113	1	Ova Welch I	f
114	1	Brent Rogahn MD	t
115	3	Alize Gorczany	f
116	2	Lilian Cummings	f
117	1	Gus Barrows	f
118	1	Sydney Mann	f
119	1	Isabella Padberg III	f
120	1	Wilhelm Eichmann	f
121	3	Mrs. Delia Swift	f
122	3	Wallace Witting	f
123	2	Margie Gleason	f
124	1	Sam Rutherford	f
125	1	Mrs. Virgil Sauer	f
126	2	Ivah Stanton	f
127	2	Barry Jaskolski	f
128	2	Randal Lueilwitz MD	f
129	1	Jose Goldner	f
130	2	Trenton Lueilwitz	f
131	3	Savanna Shields	f
132	1	Ms. Pink McLaughlin	f
133	4	Carmine Breitenberg	f
134	1	Jaleel Nicolas	f
135	4	Hank Turner	f
136	1	Paxton Hilll	f
137	2	Richard Boehm	t
138	1	Willie Stroman III	f
139	3	Monserrate Hintz	f
140	3	Eda Stracke	t
141	1	Camylle Stanton	f
142	2	Geraldine Cruickshank	f
143	4	Kiara Effertz	f
144	1	Celestine Cremin	f
145	1	Oswald Larkin	f
146	1	Thelma Herman	f
147	1	Esther Ziemann	f
148	1	Watson Ritchie	t
149	4	Claudine Bogisich DDS	f
150	2	Armando Jacobs	f
151	1	Clinton Glover	f
152	2	Claire Spinka	f
153	2	Isadore Krajcik	f
154	1	Linwood Becker	f
155	1	Price Zboncak	f
156	1	Sean Morar	f
157	2	Maudie Stamm DDS	f
158	3	Giuseppe Hessel	t
159	1	Alessia Hansen	f
160	3	Heber Barrows III	t
161	2	Daryl Rempel	f
162	1	Madie Langworth	f
163	1	Mrs. Alessandro Hills	f
164	1	Mr. Jettie Torphy	f
165	2	Justice Lind	f
166	2	Willow Spinka	f
167	3	Miss Charley Mills	f
168	1	Sylvester Sanford	f
169	1	Vern Wilkinson	f
170	2	Delaney Watsica	f
171	2	Kurtis Monahan	f
172	2	Vivien Keeling	f
173	1	Ulises Huels II	f
174	1	Lester Lebsack	f
175	3	Shayna Nikolaus	f
176	3	Hank Mante	f
177	1	Dr. Kaden Koepp	f
178	1	Benjamin Jaskolski	f
179	3	Danielle Heathcote	f
180	1	Mr. Waino Lakin	f
181	1	Marcelina Tremblay	f
182	2	Jaquelin Roob	f
183	1	Brannon Mohr	f
184	1	Marcelle Sauer	f
185	1	Rhianna Monahan	f
186	1	Ms. Wava Stokes	f
187	2	Abner Hamill V	f
188	4	Wade Franecki	f
189	1	Nash Wiegand	f
190	3	Abraham Hane	f
191	2	Louisa Dickinson	t
192	1	Miss Bridgette Harris	f
193	1	Rocky Wyman I	f
194	3	Tracey Beatty	f
195	1	Vince Kerluke	f
196	3	Estevan Towne	f
197	1	Amber Crist	f
198	4	Rosendo Hintz	f
199	1	Mr. Garrison Batz	f
200	2	Quincy Kunze IV	f
201	3	Kaitlyn Lakin	f
202	1	Daija Gerhold I	f
203	4	Audie Ziemann	f
204	2	Reid Jenkins	f
205	1	Olga Hegmann	f
206	2	Heath Schmitt	f
207	1	Mr. Raleigh Schaefer	f
208	1	Dominic Ankunding	t
209	3	Rollin Grady	f
210	2	Zella Bosco	f
211	1	Glennie Windler	t
212	4	Godfrey Parker	f
213	3	Giovanna Feil	f
214	1	Estefania Kautzer	f
215	4	Julien Lind	f
216	1	Derick Russel	t
217	4	Yasmin Koss	f
218	2	Dahlia Terry	t
219	2	Abe Rowe	f
220	1	Tressa Turcotte	t
221	2	Hans Crist	f
222	4	Jo Will	f
223	1	Vallie Huel	f
224	2	Oswald Torphy	t
225	2	Nelson Reynolds	f
226	1	Emerson Deckow	f
227	2	Zora Franecki	f
228	1	Sydni Klein	f
229	1	Tremayne Schiller	f
230	2	Cordell Kling	f
231	1	Mr. Florencio O'Reilly	f
232	1	Bo Johnston	f
233	2	Abdul Bartell IV	f
234	4	Andy Smitham	t
235	1	Sam Ernser	f
236	1	Nelda Hammes	f
237	1	Dr. Adaline Reichel	f
238	1	Brice Mohr	f
239	1	Maximo Blanda	f
240	1	Zena Mueller	f
241	2	Otilia Bogan	f
242	2	Terrill Goyette II	f
243	1	Van Kozey	f
244	2	Dakota Medhurst	f
245	2	Anahi McCullough	f
246	1	Vern Wolf	f
247	2	Garrett Windler	f
248	1	Dr. Chasity Rodriguez	f
249	1	Arch Trantow	f
250	3	Monserrat Heaney	f
251	2	Zoey Hagenes	f
252	1	Bartholome Hessel IV	f
253	1	Colt Rau	t
254	2	Bria Goyette	f
255	2	Elbert Durgan	f
256	1	Reva Langosh	f
257	2	Ms. Sylvia Rodriguez	t
258	3	Fiona Bechtelar	f
259	1	Anabel Hills	f
260	2	Demarco Fay I	f
261	3	Francesco Hartmann	t
262	2	Leonie Hessel	f
263	2	Irma Hane	f
264	3	Miles Wunsch	f
265	4	Alexandre Douglas PhD	f
266	1	Mr. Carmen O'Reilly	f
267	1	Mr. Eldora Haag	f
268	2	Elva Rogahn	f
269	1	Liana Koepp Sr.	f
270	1	Giovanni Schmeler	t
271	4	Retha Ward	f
272	2	Talia Walsh	f
273	1	Ms. Retha Weber	f
274	2	Kevon O'Connell	f
275	1	Robbie Mayer	f
276	3	Denis D'Amore	f
277	4	Coty Murray	f
278	2	Obie Hand	f
279	1	Pearline Conn DVM	f
280	3	Buddy Jast	f
281	2	Rosetta Frami	f
282	3	Easter Legros	f
283	1	Mr. Tad Fay	f
284	2	Reta Shields IV	f
285	1	Ramon Eichmann	f
286	3	Maurice Spinka	f
287	3	Cornell Blanda Sr.	f
288	3	Ignatius O'Keefe	f
289	1	Alycia Bahringer	f
290	1	Christa Shields	f
291	3	Prudence Goodwin	f
292	1	Nathanial Lakin DDS	f
293	1	Adah Abbott	f
294	3	Dedrick Orn	f
295	4	Alexandria Kilback V	t
296	2	Ms. Donna Thiel	f
297	3	Julie Goodwin	f
298	3	Angie Tillman	f
299	2	Mr. Elmore Towne	f
300	4	Amara Zboncak	f
301	4	Susanna Schoen Sr.	f
302	1	Laron Hammes	f
303	2	Freeman Windler	f
304	1	Dina Hammes	t
305	3	Theresa Rutherford	f
306	3	Ariel Greenholt Sr.	f
307	1	Beatrice Ledner	f
308	2	Emmanuelle O'Conner III	f
309	1	Dr. Jennie Kub	f
310	1	Maci Daniel	f
311	1	Leola Runte	f
312	2	Kenyon Abshire DDS	f
313	4	Kiarra Gibson	f
314	2	Gregorio Kuvalis	f
315	2	Orrin Schmeler	f
316	1	Tyra Wuckert	f
317	1	River Krajcik	f
318	2	Alexanne Durgan	f
319	2	Roel Jast	f
320	2	Tyrique Schuster IV	f
321	3	Muriel Huel	f
322	2	Brianne Bahringer	f
323	3	Zachary Bashirian	f
324	3	Brendan Waelchi	f
325	1	Noble Runolfsson	f
326	3	Garry Kuhic	f
327	2	Delphia Dickinson	f
328	2	Brad White	f
329	1	Favian Kuhn	f
330	1	Rocio Waters	f
331	4	King Leuschke	f
332	3	Donato Murphy	f
333	1	Dagmar Simonis	f
334	4	Estelle Schmitt	f
335	1	Alycia Kiehn	f
336	3	Amari Hansen	f
337	1	Betsy Nolan	f
338	3	Nathaniel Jones PhD	f
339	1	Jennie Prohaska I	f
340	4	Mrs. Sam Breitenberg	f
341	1	Albin Kiehn	f
342	3	Colt Hammes	f
343	2	Elroy Huels	f
344	1	Emelie Towne	f
345	2	Drew Towne	f
346	1	Christ Hegmann	f
347	2	Nona Grady DDS	f
348	3	Carmen Mosciski	f
349	1	Francesco Mertz	t
350	2	Dusty White	f
351	4	Gideon Grant	f
352	2	Josephine Auer	f
353	1	Kyler Conn	f
354	3	Kole Pagac	f
355	1	Elda Haley	f
356	1	Mr. Omer Wilkinson	f
357	2	Crystel Littel	f
358	2	Dennis Prohaska	f
359	1	Timmothy Hirthe Jr.	f
360	1	April Davis	t
361	1	Chadd Gorczany	f
362	2	Nakia Gerhold	f
363	1	Kailee Anderson	f
364	2	Mafalda Murray	f
365	4	Elsa Weber	f
366	1	Adrian Marks	f
367	1	Ashleigh Jast	f
368	1	Ms. Althea Metz	f
369	1	Elisabeth Cassin	f
370	2	Verda Schowalter	f
371	3	Wilhelmine Baumbach	t
372	2	Jaylin Durgan	f
373	1	Margot Hickle	f
374	3	Ron Bauch	t
375	4	Issac Price II	f
376	1	Hubert Fisher	f
377	1	Leanne Gutkowski	f
378	3	Maria Rodriguez	t
379	1	Lauriane Weber	f
380	3	Fannie Stracke	t
381	1	Karen Mraz	f
382	1	Charley Zulauf	f
383	2	Earl Hand	f
384	2	Deborah Morar	f
385	2	Delfina Marvin Sr.	f
386	2	Antonette Abbott	f
387	2	Justine Fahey DVM	f
388	1	Shanelle Toy	f
389	2	Arvid Waters	f
390	2	Manley Schuppe	f
391	2	Columbus Marvin	f
392	1	Shane Legros	f
393	1	Chandler Considine	f
394	4	Mavis Wilderman	f
395	4	Jon Schroeder I	f
396	2	Elisabeth Strosin	f
397	3	Chester Lowe	f
398	3	Dannie Kassulke	f
399	3	Jonathon Schamberger	f
400	1	Houston Pagac	t
401	4	June Mayer	f
402	1	Dessie Sanford	t
403	2	Madalyn Weissnat	f
404	2	Jameson Kihn	f
405	2	Korbin Baumbach	f
406	1	Ms. Gregorio Feil	f
407	3	Marlon Moen	f
408	4	Uriel Haag	f
409	3	Mrs. Henderson Hahn	f
410	2	Jocelyn Franecki	t
411	1	Rowland Hodkiewicz III	f
412	3	Miss Israel Mante	f
413	1	Rolando King	f
414	4	Augustus Gislason	f
415	3	Marilyne Hagenes	f
416	2	Suzanne O'Conner	f
417	1	Amira Hansen	f
418	4	Austin Treutel	f
419	1	Ryley Blanda	f
420	1	Pasquale Marquardt	f
421	1	Filiberto Dare	f
422	1	Alejandrin Miller III	t
423	1	Karina Bergstrom	f
424	1	Lemuel Beahan	f
425	1	Rebekah Turcotte	f
426	3	Santina Rath	t
427	1	Judah Auer	f
428	1	Keely Spinka	f
429	3	Olga Haag	f
430	1	Khalil Friesen	f
431	2	Durward Reinger	f
432	1	Rosalinda Tremblay	f
433	3	Regan Runolfsson I	f
434	4	Collin Yundt II	f
435	1	Jack Schumm	f
436	2	Gage Abshire	f
437	4	Devyn Doyle	f
438	2	Deron Pacocha	f
439	3	Mr. Beau Bartoletti	f
440	1	Dasia Hagenes	f
441	2	Josiah Greenfelder	t
442	2	Sonny Schroeder	f
443	2	Quinton Beer	f
444	2	Mckayla Oberbrunner	f
445	2	Marge Volkman	f
446	1	Jazmin Strosin	f
447	3	Ruth Cummerata	f
448	3	Sanford Huel	f
449	2	Erica Hamill	t
450	2	Mr. Raphael Wisoky	f
451	3	Miss Izabella Wolff	f
452	1	Kelton Rau	f
453	2	Lucienne Schmidt	f
454	1	Alden Jerde	f
455	1	Edmund Kertzmann	f
456	1	Kevin Leffler	f
457	1	Mckenzie Heller	f
458	3	Gerardo Cole V	f
459	2	Remington Hartmann	f
460	1	Vance Turner	f
461	3	Annetta Morar	f
462	1	Aubree Murray	f
463	1	Coleman Fritsch	f
464	1	Toney Price	t
465	2	Dora Goyette DVM	f
466	1	Shea Streich	f
467	3	Darryl Hyatt	f
468	2	Austyn Howell	f
469	1	Elinor Kassulke	f
470	3	Kariane Bailey Jr.	f
471	2	Stephon Turner	f
472	2	Jimmy Pfeffer	f
473	1	Otto Gibson	f
474	1	George Kiehn	f
475	2	Marianne Hilpert	f
476	1	Trisha Lehner	f
477	2	Aaron Lemke V	f
478	3	Lauriane Marvin	f
479	2	Eric Ortiz	f
480	3	Jameson Cruickshank	t
481	2	Derrick Dach	t
482	1	Saige Kemmer	f
483	3	Lacey Thompson	f
484	1	Hobart Waelchi	f
485	2	Dr. Julie Stracke	f
486	1	Justyn Weissnat	t
487	1	Ms. Judge Gaylord	f
488	1	Pauline Kunze	f
489	1	Gennaro Hartmann	f
490	1	Emerald Shanahan	t
491	2	Corine Luettgen	f
492	4	Ms. Stephanie Eichmann	f
493	1	Jack Collier	f
494	1	Katherine Grady	f
495	4	Maryse Dietrich	f
496	2	Bryana Crooks	t
497	4	Neha Reynolds	f
498	1	Zoey Kling	t
499	4	Junius Weber	f
500	2	Moriah Satterfield	f
501	1	Kelsie Herman	f
502	2	Ms. Kathleen Hoeger	f
503	1	Frankie Jacobson MD	f
504	1	Ms. Anibal Heaney	f
505	2	Curtis Keeling	f
506	2	Angelina Hamill PhD	f
507	1	Corrine Stamm	f
508	2	Jerrell Powlowski	f
509	1	Taylor Connelly	f
510	1	Wilfredo Paucek	f
511	1	Aniyah Kozey	f
512	3	Louvenia Jast	f
513	2	Leanne McCullough	f
514	2	Lillie Upton Sr.	f
515	3	Mrs. Sydnie Brekke	f
516	3	Susana Balistreri	f
517	1	Miss Kody Lang	f
518	2	Karolann Will	f
519	1	Duane Swift	f
520	2	Marlene Schaden	f
521	2	Louie Boyer	f
522	4	Gilbert Cole	f
523	1	Ms. Gaetano McKenzie	t
524	2	Ebony Jakubowski	f
525	2	Brennon Kutch	f
526	1	Jonathan Jakubowski	f
527	2	Lucie Medhurst	f
528	2	Mrs. Bernadine Rodriguez	f
529	3	Amelia Leannon	f
530	2	Martina Cummerata	t
531	1	Tatyana Haag	f
532	1	Marley Schultz	f
533	1	Jaida Brown	t
534	3	Mossie Murphy	f
535	1	Coty McClure	f
536	1	Virginie Schuppe	f
537	1	Kaitlin Harber	f
538	3	Janis Maggio	f
539	2	Hertha Cummerata	f
540	1	Armani Mraz	f
541	1	Janet Mueller	f
542	4	Eve Sauer	f
543	1	Dr. Hassan Nolan	f
544	1	Mr. Emmanuel Orn	t
545	1	Augustine Doyle	f
546	1	Adella Kertzmann DDS	t
547	2	Carmine Friesen	f
548	3	Lawson Nitzsche	f
549	1	Jarod Vandervort	f
550	1	Tyrell Gulgowski	f
551	1	Mohamed Strosin	f
552	2	Lawrence Gorczany	f
553	3	Wilfrid Haag PhD	f
554	1	Grace Larkin	f
555	3	Madisyn VonRueden	f
556	3	Carol Witting	t
557	4	Mr. Elisha Jacobson	f
558	1	Drew Kuphal	f
559	1	Dena Spinka DDS	f
560	3	Eden Mertz	f
561	3	Lindsay Kuhn	f
562	4	Dylan Hansen	f
563	1	Sasha Metz	t
564	1	Eli Koch MD	f
565	4	Mr. Talia Buckridge	f
566	1	Carter Wilkinson III	f
567	2	Tina Runolfsson	f
568	1	Magnolia Lindgren	f
569	2	Miss Rod Jacobs	f
570	4	Mrs. Kaylah Hintz	f
571	1	Jon O'Kon	f
572	3	Jaeden Durgan	t
573	2	Kayleigh Waters	f
574	2	Freddy Pagac	f
575	1	Jesus Beer	f
576	2	Loma Wehner	f
577	1	Ray Rau	f
578	2	Kaya Russel	f
579	2	Ramiro Conroy II	f
580	1	Nola Ritchie	f
581	1	Lavern Wolff	t
582	2	Eda Crona	t
583	2	Palma Schiller	f
584	2	Rubie Rosenbaum	f
585	2	Otilia Goyette	f
586	2	Serena Heidenreich	f
587	2	Reyna Prosacco	f
588	4	Mr. William Simonis	f
589	1	Gust Langosh	f
590	1	Micah Wilkinson	f
591	3	Gennaro Schneider	f
592	3	Jess Emard III	f
593	1	Austyn Pfeffer	f
594	2	Caroline Schmidt	f
595	2	Jessika Rice II	f
596	1	Obie Jakubowski	f
597	1	Ethel O'Reilly	f
598	2	Caroline Muller	f
599	3	Seth Schaden	f
600	3	Jeff Bernier	f
601	1	Carter Farrell PhD	f
602	1	Lauriane Lynch	f
603	2	Garret Gerhold	t
604	3	Brandon Kerluke	f
605	1	Amalia Johnson	f
606	4	Madelynn McGlynn	f
607	1	Victor Mayert	f
608	2	Adelbert Graham Jr.	f
609	1	Vickie Batz Sr.	f
610	1	Aisha Crooks	f
611	2	Nola Crooks	f
612	2	Modesta Blanda	f
613	2	Kevin Stanton	f
614	3	Brendan Schmidt	t
615	1	Stevie Rau	f
616	3	Whitney McDermott	f
617	1	Tyson Buckridge	f
618	2	Delta Marvin	f
619	1	Deja Runolfsson	f
620	1	Dovie Bogisich	f
621	2	Mallie Grant	f
622	3	Casandra Welch DDS	f
623	2	Rory Macejkovic PhD	f
624	3	Dandre Collins IV	t
625	2	Enrico Buckridge	f
626	2	Bettie Thiel	f
627	2	Mercedes Nolan	f
628	1	Kacie Bosco	f
629	2	Mrs. Bridie Jones	f
630	4	Bianka Hamill	f
631	1	Nathan Sauer	f
632	1	Hermann Nitzsche	f
633	1	Enrique Kulas	f
634	2	Sherwood Bernier	f
635	2	Ettie Pouros III	f
636	3	Archibald Kris	t
637	4	Miss Rhett Gottlieb	f
638	2	Mrs. Rosalia Rohan	f
639	1	Kailyn Kemmer	f
640	1	Leonora Sauer	f
641	1	Leonie Goyette Sr.	f
642	2	Rick Ortiz	f
643	2	Jaquelin Spinka	f
644	1	Golda Harvey	f
645	3	Kiley Deckow	f
646	4	Josiane Ziemann	f
647	1	Dax Stamm	f
648	1	Sonny Watsica III	f
649	2	Ara Rath DDS	f
650	1	Lee Torp	f
651	2	Isaiah Prosacco II	f
652	1	Francesca Runolfsson	f
653	3	Dr. Willis Eichmann	f
654	1	Ryder Rogahn	f
655	1	Miss Bonita Kuvalis	f
656	2	Alexandrea Block	f
657	1	Alfredo Fahey	f
658	1	Virgil Bauch	f
659	1	Jamir Schmitt DVM	f
660	4	Damion Smitham	t
661	4	Ofelia Koch	f
662	4	Mariano Howe	f
663	2	Agustin O'Reilly	f
664	2	Tristian McDermott	t
665	3	Carleton Boehm	f
666	1	Flossie Runolfsdottir IV	f
667	1	Maximillia Feeney	f
668	3	Khalil Bashirian	f
669	4	Miss Irving Lynch	f
670	1	Rahsaan Anderson	f
671	1	Fannie Reynolds	f
672	1	Joseph Padberg	f
673	1	Marques Hauck	t
674	3	Jaycee Zieme	f
675	3	Priscilla Baumbach	f
676	1	Zelda O'Connell Sr.	f
677	1	Macie Kassulke	f
678	4	Elroy Moen II	f
679	3	Lizeth Howell	f
680	1	Jayda Kulas	f
681	2	Aurelio Schuster	f
682	1	Kenyon Purdy	f
683	2	Bernita Lubowitz	f
684	1	Tyrel Tromp	f
685	1	Victoria Doyle	f
686	4	Dorothy Torp	f
687	1	Lourdes Shanahan	f
688	1	Molly Willms	f
689	1	Orrin Zulauf	f
690	1	Sadie Ortiz I	f
691	2	Ms. Floy Steuber	f
692	1	Arnoldo Sipes	f
693	2	Leif Kuhlman	t
694	1	Trycia Eichmann	f
695	2	Dr. Melany Lang	f
696	1	Mr. Rocio Mante	f
697	2	Mr. Modesta Gislason	t
698	1	Aubrey Fritsch	f
699	1	Kali Langworth	f
700	1	Kellie Klocko	f
701	1	Leo Kulas I	f
702	1	Julie Bartoletti	f
703	2	Jovany Abbott	f
704	1	Gabriella Greenfelder	f
705	1	Marcia Schneider	f
706	1	Alvera Borer	f
707	1	Federico Feeney	f
708	1	Fay Stoltenberg	f
709	1	Jade McKenzie	t
710	1	Chauncey Cartwright	f
711	2	Lorenza Gibson	f
712	3	Adell Nitzsche	f
713	2	Mr. Nella Kassulke	f
714	1	Flo Gleichner	t
715	1	Thelma Conroy	f
716	2	Dr. Elijah Morar	f
717	3	Oran Nicolas	f
718	2	Tre Heaney IV	f
719	1	Orland Simonis	f
720	1	Reva Schaden	f
721	1	Marge Mann	f
722	1	Camren Pouros	f
723	2	Carson Donnelly III	f
724	1	Lazaro Rutherford	f
725	4	Lavina Herzog	f
726	1	Elta Jaskolski	f
727	1	Chase Kautzer	t
728	4	Lourdes Yundt	f
729	1	Trystan Heller	f
730	2	Willy Fahey PhD	t
731	1	Jedidiah Kiehn	f
732	4	Kirsten Feil	f
733	4	Carolanne Walsh	f
734	4	Connie Windler	t
735	1	Orland Hauck	t
736	1	Ms. Solon Hintz	f
737	1	Jovani Smith	t
738	1	Eliza Mills	f
739	1	Alexanne Hahn	t
740	1	Myrna Casper	f
741	2	Frankie Volkman	f
742	1	Buster Predovic	f
743	2	Kirstin Batz	f
744	1	Linnie Schinner	f
745	2	Tristin Kiehn	f
746	1	Rocio Yundt	f
747	4	Kraig Mills	f
748	2	Augustus Nader	f
749	1	Beverly Ledner	f
750	4	Kurtis Funk	f
751	1	Yasmine White	f
752	3	Armand Skiles I	f
753	1	Glenda Daugherty	f
754	1	Ebba Howe	f
755	2	Dr. Elliott Walker	f
756	2	Vivienne Ullrich	f
757	2	Kamille Stiedemann III	f
758	1	Kirk Hamill	f
759	3	Sonia Denesik	f
760	1	Mrs. Isabell Grady	f
761	1	Ruben Ortiz	f
762	2	Madison D'Amore	f
763	2	Mrs. Herminia Hand	f
764	1	Mr. Hugh Gislason	t
765	1	Ms. Nat Mann	f
766	3	Shirley Klein	f
767	2	Therese Maggio	f
768	1	Jairo Marks IV	f
769	2	Annamae Nader	f
770	2	Nickolas Cruickshank	f
771	3	Bernice Reichert	f
772	2	Madisen Mayer V	f
773	1	Josiane Reilly	f
774	1	Lavada Rowe	f
775	2	Antone Kunze	f
776	1	Ruthe Lockman	f
777	4	Lambert Champlin	f
778	2	Angelita Skiles DVM	f
779	1	Jacynthe Rodriguez	f
780	1	Dean Vandervort	t
781	2	Nichole Beer Jr.	f
782	2	Macie Dickinson	f
783	3	Casimir Smitham	f
784	2	Neva Gislason	f
785	1	Aric Anderson	f
786	3	Genoveva Walsh	f
787	1	Zella Zieme IV	f
788	3	Zaria Stokes	f
789	2	Gwendolyn Kozey	f
790	2	Cecilia Hagenes	f
791	2	Garland Harvey	f
792	2	Kaci Blanda	f
793	2	Marcelle Satterfield	f
794	1	Sadie Dickens	f
795	2	Ms. Eugene Parisian	f
796	2	Immanuel Williamson	f
797	1	Mr. Florian Stark	f
798	1	Clotilde Weber	f
799	2	Jonathan Herman	f
800	1	Jayce Swift	f
801	1	Joesph Wiza Jr.	f
802	3	Everardo Lindgren	f
803	1	Mrs. Luigi West	f
804	1	Casimir Volkman	f
805	3	Dillon Dicki IV	f
806	1	Meredith Klocko	f
807	1	Scotty Murazik	f
808	2	Corrine Greenfelder	t
809	2	Willy Dickens	f
810	1	Perry Bradtke	f
811	4	Miss Citlalli Zboncak	f
812	1	Cara Smitham V	f
813	1	Irwin Reichel	f
814	3	Erna Walter	f
815	2	Rickey Marquardt	f
816	3	Verdie Jast	f
817	1	Cedrick Halvorson	f
818	1	Mrs. Junior Bahringer	f
819	1	Violette Gleichner	f
820	3	Robert Armstrong	t
821	1	Brad Friesen	t
822	4	Delaney Farrell	f
823	1	Jane Zulauf PhD	f
824	1	Quinn Collier	f
825	1	Brannon VonRueden	f
826	2	Mr. Myra Boyle	f
827	1	Enola Emard MD	f
828	3	Luisa Turner Jr.	f
829	1	Brooke Stokes III	f
830	1	Miss Ramiro Spencer	f
831	4	Andre Shanahan	f
832	1	Cleve Corwin	f
833	2	Miss Luis Beier	f
834	1	Ms. Jerel Murray	f
835	2	Colleen Quigley	f
836	1	Kameron Franecki	f
837	3	Adriel Haley	f
838	2	Gisselle Farrell	t
839	3	Ms. Emmet Fay	f
840	2	Rodrigo Mitchell	f
841	1	Adah Nolan	f
842	1	Dr. Garret Bernhard	f
843	2	Mr. Ola Nienow	f
844	2	Arlie DuBuque	f
845	1	Asia Doyle	f
846	2	Brandi Lynch	f
847	1	Aylin Casper	f
848	1	Mr. Isabel Hamill	f
849	4	Doug Jerde	f
850	1	Miss Patricia Auer	f
851	1	Dr. Gillian Feil	f
852	1	Jo Cruickshank	f
853	3	Isaac Okuneva	f
854	3	Christiana Hammes	f
855	1	Rogelio Farrell	f
856	1	Cecelia Hilpert	f
857	3	Merle Pfeffer	f
858	2	Amira Senger	f
859	3	Sibyl Reichert	f
860	3	Jaqueline Welch	f
861	1	Aurelia Altenwerth	f
862	2	Billy Abshire MD	f
863	1	Amani Conn IV	f
864	1	London Fay I	f
865	4	Kim Collier	f
866	2	Coy Gleason	f
867	3	Dr. Lori Kovacek	f
868	1	Kamren Beahan	f
869	3	Brandi Bosco	f
870	4	Gregg Ritchie	f
871	1	Iva Braun	f
872	1	Micaela Bechtelar	f
873	3	Cecile Botsford DVM	f
874	2	Rhianna Konopelski	f
875	3	Constantin Jast	f
876	1	Treva Lemke	f
877	1	Luna Dickens	f
878	4	Burley Boehm	f
879	2	Ronaldo Hegmann	f
880	4	Claudie Schoen	f
881	2	Hettie Altenwerth	t
882	1	Miss Melyna Lesch	f
883	2	Charlie Pfannerstill	f
884	3	Reginald Bechtelar	f
885	4	Bryce Johns	f
886	1	Hulda Prosacco	f
887	4	Bret Hackett	f
888	3	Germaine Crona	f
889	1	Mackenzie Predovic	f
890	1	Dr. Jermey Hegmann	t
891	2	Ethan Schaden	f
892	1	William Sawayn	f
893	1	Dallas Schaden	f
894	2	Enid O'Kon	f
895	1	Nellie Sporer	f
896	1	Julia Ebert	f
897	1	Carol Koss	f
898	2	Eduardo Kling	f
899	1	Danial Brekke	f
900	2	Michaela Schowalter MD	f
901	2	Zoie Murray	f
902	1	Meta Okuneva	f
903	1	Mrs. Gavin Nitzsche	f
904	1	Delphine Hodkiewicz	f
905	2	Dr. Wilmer Blick	f
906	3	Phyllis McCullough	f
907	1	Angelica Gulgowski	f
908	3	Vicenta Krajcik	f
909	4	Mrs. Jerry Dietrich	f
910	2	Garret Wintheiser	f
911	2	Filomena Wyman	f
912	1	Shad Raynor	t
913	1	Ashleigh Boyle	f
914	1	Ms. Kathryn Russel	f
915	1	Chadd Klein	f
916	3	Dr. Flavie Kemmer	t
917	1	Euna Leffler	t
918	1	Herta Trantow	f
919	1	Lucile Pfeffer	f
920	1	Percival Hintz	f
921	3	Brigitte Medhurst	t
922	3	Fredy Schuppe	f
923	2	Jane McDermott	f
924	2	Miss Halle Corkery	f
925	1	Jeffry Schimmel	f
926	2	Reagan Kautzer	f
927	3	Linda Barrows	f
928	1	Miss Mohamed Skiles	f
929	2	Lue Dooley	f
930	3	Pedro Botsford	f
931	4	Mr. Tanya Kub	f
932	4	Cordia Cummerata	f
933	3	Estelle Dach	f
934	2	Lenna Wilkinson	f
935	1	Dylan Casper	f
936	2	Chester Crona	f
937	2	Kenyatta Vandervort	f
938	1	Demario Swaniawski	f
939	1	Xander Senger	f
940	1	Cooper Walter	f
941	1	Haley Balistreri	f
942	1	Brain Conn	f
943	1	Robbie Nienow	f
944	2	Francesco Schulist	f
945	4	Verner Brakus	f
946	2	Carlee Skiles	f
947	1	Mrs. Ettie Von	f
948	2	Joy Dibbert	f
949	1	Ernie Sporer	f
950	2	Elvie Von	f
951	3	Mr. Cecilia O'Hara	f
952	3	Braxton Aufderhar	f
953	1	Elvie Spinka	f
954	1	Nichole Collins	f
955	3	Elisabeth Jacobs	f
956	2	Brooks Paucek	f
957	1	Rupert McClure	f
958	3	Domenico Bogisich	f
959	4	Frederik Conn	f
960	1	Winona Towne	f
961	3	Fidel Rutherford	f
962	2	Geo Fahey	f
963	2	Rod Baumbach	t
964	2	Baby Rempel	f
965	2	Santos Hagenes	f
966	2	Cecile Eichmann	f
967	1	Tomas Denesik	f
968	3	Maryse Senger	f
969	1	Neoma Frami	f
970	3	Alexandro Marquardt	f
971	1	Tyshawn Block	f
972	2	Jacques Bashirian	f
973	1	Abdullah Hermiston PhD	f
974	2	Domenica McLaughlin	f
975	1	Claud Gutkowski	f
976	1	Joany Maggio	f
977	4	Ceasar Waters	f
978	2	Turner Cruickshank	f
979	2	Era Berge	f
980	1	William Gusikowski	f
981	4	Camden Dare	f
982	1	Tristin Welch	f
983	2	Jose Padberg	f
984	3	Mrs. Tressie Strosin	f
985	3	Mr. Adell Stanton	f
986	3	Adolphus Schmeler	t
987	1	Elsie Davis	f
988	1	Larue Bradtke	f
989	3	Braeden Kling I	f
990	1	Shaylee Krajcik	f
991	1	Cielo Brekke	f
992	2	Piper Swift	f
993	2	Ivah Bradtke	f
994	1	Arielle Kuphal	f
995	3	Kelvin Nikolaus	f
996	3	Waino Stiedemann	t
997	3	Kaden Kunde	t
998	1	Karine Zboncak	f
999	2	Chance Greenfelder	f
1000	3	Ms. Rhiannon Hickle	f
1001	1	Jamey Kertzmann	f
1002	1	Billy Thiel	t
1003	1	Laury Schoen	f
1004	3	Zechariah Beahan PhD	f
1005	1	Marcellus Bashirian	f
1006	3	Manuela Lakin	f
1007	1	Chadd Frami	f
1008	1	Grace Jones	f
1009	1	Ms. Jerald Carter	f
1010	1	Bridie Little	f
1011	4	Louie Von	f
1012	3	Enrico Jacobi	f
1013	1	Amelia Ruecker	f
1014	3	Keith Kuhn	f
1015	3	Miss Sofia Bernhard	f
1016	2	Xzavier Koss	f
1017	4	Audie Reinger	f
1018	4	Dr. Eliseo Heaney	f
1019	3	Margie Gislason	f
1020	1	Shawna Hoeger	f
1021	2	Stacey Armstrong	f
1022	2	Rhea Swift	f
1023	2	Stephanie Hilpert	f
1024	2	Hardy Kutch	f
1025	2	Josianne Schroeder	f
1026	4	Adriana Little	f
1027	1	Mrs. Valentina Hyatt	f
1028	3	Charlotte Brown	f
1029	1	Dell Rosenbaum III	f
1030	3	Collin Green	f
1031	1	Abdiel Okuneva	f
1032	2	Bernard Zboncak I	t
1033	1	Mrs. Annalise Prosacco	f
1034	2	Miss Nicolas Predovic	f
1035	2	Mrs. Anissa Strosin	f
1036	2	Aidan Kihn III	f
1037	1	Korey Smitham	t
1038	2	Manley Johnson	f
1039	4	Arnaldo Vandervort	f
1040	3	Rita Muller	f
1041	3	Florence Lang	f
1042	4	Teresa Mayert	f
1043	1	Demario Morissette	f
1044	3	Dr. Cecile Rutherford	f
1045	3	Pietro Wyman	f
1046	1	Winnifred Reilly	f
1047	3	Destin Barton	f
1048	1	Catalina Bahringer	f
1049	1	Brice Hintz Jr.	f
1050	2	Mrs. Kathlyn Littel	f
1051	1	Kaylee Wolff	f
1052	4	Jesus Gulgowski	f
1053	1	Garry Grant	f
1054	2	Lisa Russel	f
1055	3	Merl McDermott	f
1056	2	Claudine Windler	f
1057	2	Abigale Adams	t
1058	2	Mercedes Cole	f
1059	1	Loyce Wiegand	f
1060	3	Miss Josiah Rau	f
1061	1	Jerry Cormier	f
1062	4	Jaden Littel	f
1063	2	Darrion Mills	f
1064	1	Devon Gerhold	f
1065	1	Miss Kayley Bruen	t
1066	1	Petra Rowe	f
1067	3	Brooke Schowalter	f
1068	3	Libbie Dickens	f
1069	1	Cristobal Goldner	f
1070	1	Aglae Hand	f
1071	3	Levi Barrows	f
1072	3	Kavon Olson III	f
1073	3	Barry Green	f
1074	1	Douglas Ferry	f
1075	2	Antonio Stehr	f
1076	1	Florence Kub	f
1077	1	Alana Pacocha	f
1078	2	Jacinthe Larson	f
1079	2	Alice Veum	f
1080	2	Erica Beier	f
1081	4	Lucile Kshlerin	f
1082	2	Angel Abshire	f
1083	1	Neha Corkery	f
1084	3	Kenyon Labadie	t
1085	1	Jorge Raynor	f
1086	1	Oswald Streich V	f
1087	4	Jermaine Bauch	f
1088	1	Jensen Howell	f
1089	1	Keshaun Ernser	f
1090	3	Mrs. Jolie Ritchie	f
1091	1	Chandler Hauck	f
1092	1	Kiera Lesch	t
1093	1	Cristobal Marquardt	f
1094	3	Sherwood Breitenberg	f
1095	1	Jeanette Willms	f
1096	2	Rocio Veum	f
1097	1	Mr. Adonis Kessler	f
1098	2	Juston Kiehn	f
1099	2	Josue Veum	f
1100	3	Kamille Hahn	f
1101	3	Dan Moen Jr.	f
1102	3	Emile Kuvalis	f
1103	2	Yadira Harris	f
1104	2	Carlie Blanda	t
1105	2	Blake Bogisich	f
1106	1	Dovie Heaney	f
1107	1	Paxton Terry	f
1108	2	Kaya Gleichner	f
1109	2	Dallin DuBuque	f
1110	4	Reinhold Gibson	f
1111	1	Tracey Vandervort	f
1112	1	Sandra Hahn PhD	t
1113	1	Chanelle Murazik	f
1114	2	Neha Zboncak MD	f
1115	2	Wilfrid Vandervort I	f
1116	4	Dana Weber	t
1117	1	Benjamin Beatty	f
1118	1	Dr. Vallie Ledner	f
1119	1	Sienna Hettinger	f
1120	1	Jewell Spencer II	t
1121	3	Lilian Wolff	f
1122	1	Richie Kris	f
1123	1	Yasmin Brakus	f
1124	1	Muriel Herzog	f
1125	1	Alysha Yost	f
1126	3	Anya Tillman	f
1127	2	Ellie Ritchie	f
1128	2	Ms. Gordon Stark	f
1129	2	Holly Bins	f
1130	2	Bradford Powlowski	f
1131	1	Cassie Glover	f
1132	1	Halie Schumm	f
1133	3	Dulce Davis	f
1134	3	Darrin Wolff	f
1135	1	Clotilde Smitham I	f
1136	2	Jacynthe Erdman	f
1137	1	Mr. Avis Bosco	f
1138	3	Yadira Bailey	f
1139	1	Abbie MacGyver I	f
1140	3	Ryleigh Stracke III	f
1141	2	Katelin Prohaska	f
1142	1	Leonora Emmerich	f
1143	1	Mr. Rhett Huel	f
1144	3	Myrtie Windler	f
1145	3	Vito Kunze	f
1146	1	Xander Bradtke	f
1147	1	Elizabeth Blick	f
1148	1	Michelle Hudson	f
1149	3	Laney Herman	f
1150	2	Bernice Welch	f
1151	2	Mr. Breanne Crona	f
1152	2	Gerardo Bashirian	f
1153	2	Elfrieda Murazik	f
1154	1	Emmy Herzog	f
1155	4	Gabe Mraz	f
1156	2	Mallory Schuppe	f
1157	2	Josie Labadie	f
1158	3	Jorge Ernser Jr.	f
1159	1	Deonte Leuschke	f
1160	1	Frankie Terry	f
1161	2	Frederique Bernhard	f
1162	2	Celestino Bauch	f
1163	3	Bette Upton	f
1164	3	Clemens Skiles	f
1165	1	Mrs. Neoma Jacobs	f
1166	3	Dino Wilderman	f
1167	4	Michele Walsh	f
1168	4	Vilma Rolfson	f
1169	2	Caterina Spinka	f
1170	4	Kareem Hermann	f
1171	3	Jamarcus Kunde	f
1172	2	Antonina Weissnat	f
1173	2	Mrs. Jayde Ryan	f
1174	1	Brisa King	f
1175	3	Dario Nader	f
1176	3	Brent Paucek	f
1177	4	Christine Emmerich	f
1178	2	Adrienne Johns	f
1179	3	Marcelo Conroy	t
1180	1	Heidi Murray	f
1181	3	Laury Bailey Sr.	t
1182	2	Brendon Moore	f
1183	4	Nicolette Kertzmann	f
1184	1	Pasquale Walsh	f
1185	3	Rebeca Schultz V	f
1186	3	Mavis Schuster	f
1187	1	Julien Swift	f
1188	4	Jamar Sipes	f
1189	2	Dorthy Hessel	f
1190	1	Michelle Fritsch	f
1191	1	Ozella Schaden	f
1192	1	Mrs. Madalyn Kuhn	f
1193	2	Rae Gutmann	f
1194	4	Bernard Green	f
1195	2	Dr. Breanna Schuster	f
1196	2	Berry Terry	f
1197	1	Berniece Schinner	f
1198	1	Nina Will	f
1199	1	Miss Shanel Halvorson	f
1200	4	Mr. Tommie Nitzsche	t
1201	4	Maryjane Kutch	f
1202	2	Felix Lesch Sr.	t
1203	4	Hobart Pouros	f
1204	1	Athena Schuppe	f
1205	1	Jazmin Herman	f
1206	1	Van Kub	t
1207	2	Enoch Powlowski	f
1208	3	Theresia Towne	f
1209	3	Dr. Armand Grimes	f
1210	4	Dr. Kiara Bergstrom	f
1211	1	Shanny Powlowski MD	f
1212	1	Jaden Aufderhar	f
1213	2	Carli Pacocha	f
1214	1	Aric Kautzer	f
1215	2	Kenneth Homenick	f
1216	1	Miss Kayden Doyle	t
1217	1	Piper Klein	f
1218	2	Amara Hammes II	f
1219	2	Hassie Schroeder	f
1220	1	Dominique Wilkinson	f
1221	4	Reynold Gerlach	f
1222	3	Allison Rolfson	f
1223	1	Sabrina Morissette	f
1224	2	Emiliano Larkin	f
1225	2	Marielle Fadel	f
1226	3	Eula Romaguera Sr.	f
1227	2	Casey Glover IV	f
1228	2	Mr. Houston Beer	f
1229	2	Ilene Deckow IV	f
1230	2	Kellie O'Hara	t
1231	1	Geovanni Feeney Sr.	f
1232	3	Ebba Herzog PhD	t
1233	4	Alivia Hermiston	f
1234	1	Amparo Gleichner V	f
1235	1	Amara Flatley	f
1236	2	Walker Herzog	t
1237	2	Theresia Beier	f
1238	3	Willie Skiles	f
1239	1	Pearlie Mayert	f
1240	1	Dr. Tamara Volkman	f
1241	1	Erik Spinka	f
1242	2	Chelsea Hilll	f
1243	2	Hannah Hilpert I	f
1244	1	Amelie Hansen	f
1245	4	Anjali Kuvalis	f
1246	3	Mr. Caleb Abshire	f
1247	3	Magali Jast	f
1248	2	Reta Walsh I	f
1249	2	Chelsea Gutmann	f
1250	1	Gene Lockman	f
1251	2	Katelyn Mayer	f
1252	2	Mr. Gabe McKenzie	t
1253	1	Jacinthe Cronin	f
1254	3	Alberto Bednar Sr.	f
1255	1	Timothy Kozey	f
1256	3	Arturo Kirlin	t
1257	1	Dr. Reanna Hermann	f
1258	3	Lamar Wisozk	f
1259	1	Karlie Ledner	t
1260	3	Roy Parisian	f
1261	4	Emile Homenick	f
1262	3	Margaret Mayert	f
1263	3	Albert Macejkovic	f
1264	3	Troy Hilpert	f
1265	1	Bert Schimmel	f
1266	2	Ms. Jedediah Daniel	t
1267	1	Adrien Langosh	f
1268	1	Sabryna Yundt	f
1269	3	Ahmed Graham	f
1270	3	Madelynn Torp I	f
1271	2	Maiya Koelpin	t
1272	1	Tyrell Wuckert IV	f
1273	2	Ms. Anibal Hirthe	f
1274	2	Clarabelle Bayer	f
1275	2	Osborne Quitzon	f
1276	2	Watson Emard	f
1277	2	Wilburn Kerluke	f
1278	3	Steve Marvin	f
1279	3	Roderick Collins	f
1280	1	Furman Wilkinson	f
1281	3	Aisha Volkman	f
1282	1	Buster Hagenes	f
1283	3	Jermey Hansen	f
1284	1	Christy Upton MD	f
1285	2	Milo Pfannerstill	f
1286	1	Ray Konopelski	f
1287	1	Alexanne Cartwright	f
1288	4	Lizzie D'Amore	f
1289	2	Citlalli Maggio	f
1290	1	Hildegard Streich	f
1291	3	Romaine Ondricka	f
1292	3	Meda Gibson	t
1293	3	Dominic Hauck	f
1294	2	Skyla Feest	f
1295	3	Ms. Deangelo Price	f
1296	2	Adrienne Schulist	f
1297	2	Dr. Else Zieme	f
1298	2	Johathan Bailey	f
1299	1	Mireya Gerhold	f
1300	2	Chadrick Yost V	f
1301	2	Cornelius Strosin	f
1302	4	Cicero Carter	f
1303	1	Corine Thompson	t
1304	1	Alycia Schulist	f
1305	2	Matt Lynch	f
1306	3	Monique Kassulke	f
1307	2	Watson Grimes	f
1308	2	Daisha Ernser	f
1309	3	Brandon Stamm	f
1310	1	Lera Cremin DDS	f
1311	2	Hillary Veum	f
1312	1	Eldred Smitham	f
1313	1	Celestine Kuphal	f
1314	4	Hans Runte	f
1315	2	Rae Leffler	f
1316	1	Tatyana Robel Jr.	f
1317	3	Tatum Franecki	f
1318	2	Alessandra Paucek	f
1319	2	Brian Rohan	t
1320	1	Taylor Mosciski	f
1321	3	Oma Spencer	t
1322	2	Chesley Renner	f
1323	1	Cecelia Gleason DVM	f
1324	1	Dr. Giles Buckridge	f
1325	1	Lawrence Kris	f
1326	1	Manuela Fahey	f
1327	1	Geo Bernhard V	f
1328	3	Kaylin Kshlerin	f
1329	2	Vance Koelpin	f
1330	3	Savannah Collier	f
1331	1	Julio Turner	f
1332	1	Jimmy Johns	f
1333	2	Emmet Greenholt	f
1334	2	Allen Lueilwitz	f
1335	1	Mrs. Kip Weimann	f
1336	2	Kimberly Kub	f
1337	1	Kelly Predovic	f
1338	2	Luella Wehner	f
1339	3	Melisa Roberts	f
1340	2	Urban Walker MD	f
1341	1	Fletcher Ledner	f
1342	1	Dale Leffler	f
1343	2	Mrs. Eladio Towne	f
1344	2	Miss Audrey Berge	f
1345	1	Reed D'Amore	f
1346	2	Hilbert Schmeler	f
1347	1	Sherwood Harvey	f
1348	3	Donnie White	f
1349	1	Ms. Grayce Mante	f
1350	1	Alfredo Pfeffer	f
1351	1	Litzy Howell	f
1352	1	Deven Goldner	f
1353	2	Eduardo Dickinson	f
1354	2	Ms. Daija Pollich	f
1355	4	Wendy Kohler IV	f
1356	1	Kianna Schamberger	f
1357	3	Michale Leannon	f
1358	1	Lemuel Tromp	f
1359	3	Jarod Smith	f
1360	1	Ebony Monahan III	f
1361	3	Shemar Mante III	f
1362	1	Lorenz Leannon II	f
1363	1	Grace Cummings	f
1364	2	Sylvester Price I	f
1365	1	Lucienne Pagac	f
1366	1	Ms. Travon Crooks	f
1367	2	Edwardo Powlowski	f
1368	1	Mr. Quincy Moen	f
1369	1	Lucienne Mayert	f
1370	2	Summer Upton	t
1371	4	Arvid Treutel	f
1372	4	Brooklyn Fisher	f
1373	2	Ms. Giovanny Rath	f
1374	1	Alvis Moen	f
1375	1	Tomas Towne	f
1376	3	Miss Milo DuBuque	t
1377	3	Isaiah Wisoky	f
1378	4	Aiden Hansen	f
1379	1	Rene Spencer DVM	f
1380	1	Rhianna Goyette	f
1381	2	Dr. Allan Stanton	f
1382	3	Tom Gerhold	f
1383	1	Kadin Johnston	t
1384	1	Estell Fisher	f
1385	2	Bryce Pfannerstill	f
1386	3	Alvena Dietrich	t
1387	2	Barney Champlin	f
1388	2	Delmer Hermann	f
1389	4	Gretchen Mayert MD	f
1390	1	Virginia Stamm	f
1391	1	Delfina Tromp	f
1392	3	Maryam Toy Jr.	f
1393	2	Kaitlin Satterfield DDS	f
1394	3	Rubie Schmeler	f
1395	1	Jo Crist	f
1396	1	Kirsten Dickinson	f
1397	3	Rosario McCullough	f
1398	1	Al Haag DDS	f
1399	1	Elisabeth Stanton	f
1400	1	Geoffrey Gulgowski DDS	f
1401	2	Rosina Zboncak	f
1402	3	Angelina Lehner	f
1403	1	Mr. Krystel Watsica	f
1404	1	Lula Klocko	f
1405	2	Ms. Jayde Hilll	f
1406	1	Quinten Douglas	f
1407	2	Buster Labadie MD	f
1408	1	Efren Bruen	f
1409	1	Leonor Torphy	f
1410	1	Ms. Dalton Crona	f
1411	1	Liam McDermott	f
1412	1	Ms. Annabelle Bailey	f
1413	2	Seth Ward	f
1414	3	Herta Armstrong	f
1415	1	Ryan Littel	f
1416	2	Sunny Daniel	f
1417	1	Skye Bogisich PhD	f
1418	1	Carlotta Mills	f
1419	2	Dr. Arnulfo Johns	f
1420	4	Christ Fay	f
1421	1	Orland VonRueden	f
1422	3	Vita Johns	f
1423	3	Braulio Hartmann	f
1424	1	Ephraim Kautzer	f
1425	2	Natasha Collins	f
1426	2	Erick Krajcik	t
1427	1	Heidi Schneider V	f
1428	3	Rory Beatty	f
1429	1	Teresa Moore	f
1430	1	Bert Cassin	f
1431	3	Makenna Braun	f
1432	4	Caleigh Pfeffer	f
1433	1	Lucie Lubowitz	f
1434	1	Colin Mann	f
1435	3	Arnold Lind	f
1436	1	Ruthie Lueilwitz	f
1437	4	Maiya Roob	f
1438	2	Dariana Bernhard	f
1439	1	Sigurd Greenholt	f
1440	1	Marina Corwin	f
1441	2	Fausto Kihn	f
1442	1	Micheal Hills IV	f
1443	2	Samanta Hansen	f
1444	3	Oliver Schaefer	f
1445	3	Geovanni MacGyver	f
1446	1	Mrs. Leola Kris	f
1447	1	Patrick Kiehn	f
1448	1	Ayla Roob	f
1449	1	Leanne Grimes	f
1450	1	Danial Hessel	t
1451	1	Angelina Vandervort	f
1452	2	Gayle Marquardt	f
1453	1	Annamarie Stark	f
1454	1	Cyril Barrows	f
1455	3	Enid Bailey	f
1456	3	Korbin Murphy	f
1457	4	Cullen Smith	f
1458	1	Jay Witting	f
1459	1	Ms. Enos VonRueden	f
1460	1	Granville Rath PhD	f
1461	1	Clark Senger	f
1462	3	Aurelie Schiller	f
1463	2	Bonnie Lowe	f
1464	2	Dr. Felicity Kuhlman	f
1465	3	Elwin Ritchie	f
1466	2	Veda O'Kon	f
1467	2	Shanelle MacGyver	f
1468	2	Jerel Langworth	f
1469	1	Walker Jaskolski	f
1470	4	Russ Senger	f
1471	2	Ezra Schroeder	f
1472	1	Christian Jaskolski	t
1473	1	Mark Fahey	f
1474	1	Howell Bernier	f
1475	3	Brycen Mertz	f
1476	2	Amiya Macejkovic V	f
1477	2	Elza Wiegand	f
1478	2	Elisabeth Morar	f
1479	1	Adolphus Green	f
1480	1	Myrtie Cruickshank	t
1481	2	Glennie Roberts	f
1482	1	Delaney Rippin	t
1483	3	Miss Tremayne Rogahn	f
1484	2	Joelle Howe	f
1485	3	Dahlia Runolfsdottir	f
1486	1	Ms. Anastacio Collins	f
1487	1	Jennings Bogan DVM	f
1488	3	Annabell Kshlerin	f
1489	1	Concepcion Stanton	f
1490	1	Celia Hirthe	f
1491	2	Christ Rodriguez	t
1492	3	Brody Ledner	f
1493	2	Tess Quigley	t
1494	3	Viva Boehm	t
1495	1	Parker O'Connell	f
1496	2	Freida Prohaska I	f
1497	1	Madaline Jenkins	f
1498	2	Mrs. Cathryn Heaney	f
1499	1	Miss Darion Collier	f
1500	4	Nicolette Rolfson	f
1501	2	Kali Brown	f
1502	4	Jordan Weimann II	f
1503	3	Mrs. Brenden Osinski	f
1504	4	Buck Sauer	f
1505	1	Breanne Rempel	f
1506	2	Caitlyn Wiza	f
1507	1	Herminio Ryan	f
1508	3	Miss Nannie Bruen	f
1509	2	Tamara Nienow	f
1510	1	Miss Juwan Kerluke	f
1511	1	Kadin Schuppe	f
1512	1	Felicia Nitzsche	f
1513	2	Mozell Metz	f
1514	1	Aliyah Dickens	f
1515	1	Miss Antonietta Hodkiewicz	f
1516	4	Bonnie Simonis	t
1517	1	Anjali Breitenberg II	f
1518	3	Julian Anderson	f
1519	1	Laverne Jacobson	f
1520	3	Lucy Kunde	f
1521	2	Renee Reynolds II	f
1522	2	Mrs. Owen Lueilwitz	f
1523	2	Ms. Annalise Sauer	f
1524	2	Garrick Hackett	f
1525	1	Dr. Treva Marquardt	f
1526	1	Nannie Prohaska	f
1527	1	Erica Koelpin	f
1528	1	Marta Halvorson	t
1529	4	Willa Parker	f
1530	1	Sonya King	t
1531	2	Greg Leuschke	f
1532	2	Fletcher Wintheiser	f
1533	3	Autumn Adams	f
1534	4	Matteo Pouros	f
1535	3	Arlo Eichmann	t
1536	1	Guadalupe Johnson	t
1537	1	Olga Mitchell	f
1538	1	Adolfo Orn	t
1539	1	Bartholome Kessler	f
1540	2	Israel Robel	f
1541	4	Lucio Murphy	f
1542	1	Marielle Murray	f
1543	2	Carolanne Johnston	f
1544	1	Faye Kshlerin	f
1545	1	June Kovacek	f
1546	3	Donald Nicolas	f
1547	2	Evelyn Bernhard Sr.	f
1548	2	Aiden Padberg PhD	f
1549	1	Marcia Walsh	f
1550	1	Dr. Myles Keeling	f
1551	1	Arlie Torp	f
1552	1	Favian Miller	f
1553	2	Dangelo Runolfsdottir	f
1554	1	Dr. Kayden Murphy	t
1555	1	Brandon Lemke	f
1556	1	Malinda Walsh	f
1557	1	Shyann Huel	f
1558	2	Mckayla Hintz	f
1559	1	Bettie Hintz MD	f
1560	4	Mrs. Yasmeen Halvorson	f
1561	3	Rebecca Kris	f
1562	4	Elsa Schneider	f
1563	3	Belle Kulas	f
1564	1	Cesar O'Keefe	f
1565	1	Meghan Braun DDS	t
1566	1	Cameron Smith	t
1567	3	Diamond Crooks	f
1568	1	Alysson Emard	f
1569	3	Erin Armstrong	f
1570	3	Mertie Keeling	f
1571	1	Hubert Shields	f
1572	2	Nova Satterfield	f
1573	1	Kavon Ritchie	f
1574	2	Waldo Jacobson	t
1575	1	Ulises Quitzon	f
1576	1	Armando Durgan	t
1577	2	Noemie Hamill IV	f
1578	3	Hayley Murray	f
1579	2	Jovany Schroeder	f
1580	1	Cole Ziemann	f
1581	2	Kavon McGlynn	f
1582	4	Jessica O'Kon	f
1583	2	Belle Boyer V	f
1584	2	Ms. Loyal Dibbert	f
1585	3	Geo Durgan Sr.	f
1586	2	Margarita Fisher	f
1587	1	Herta McGlynn	f
1588	1	Roscoe Kulas	f
1589	2	Nickolas Grant	f
1590	2	Nannie Quitzon	f
1591	1	Frederic Hansen	f
1592	3	Savanna Jenkins	f
1593	2	Berenice Pacocha	f
1594	1	Mr. Aliza Stokes	f
1595	3	Ibrahim Lindgren	f
1596	1	Myrtie Kovacek	f
1597	1	Candice Abernathy	f
1598	1	Miss Cade Lowe	f
1599	4	Zakary O'Hara Sr.	f
1600	1	Mrs. Juliana O'Keefe	f
1601	2	Jay Zulauf	f
1602	2	Gwendolyn Smith	f
1603	1	Eleazar Hoeger	t
1604	3	Geoffrey Lakin	f
1605	1	Damion Aufderhar	f
1606	2	Nola Turner	f
1607	1	Cyril Kirlin	f
1608	3	Josephine Mann	f
1609	1	Coty Lemke	f
1610	1	Alexandria Flatley	f
1611	3	Dr. Forrest Dietrich	f
1612	3	Golden Metz	f
1613	1	Ms. Zoie Bernier	t
1614	3	Neoma Mante	f
1615	4	Tobin Jerde	f
1616	1	Christ Sawayn	f
1617	4	Selmer Borer	f
1618	3	Lexie Kutch	f
1619	1	Reed Howell	f
1620	3	Cesar Legros	f
1621	1	Victoria Fisher	f
1622	1	Dayton Goyette	f
1623	2	Oswaldo Botsford	f
1624	1	Zaria Lang PhD	f
1625	4	Caroline Upton	f
1626	2	Charlotte Hyatt	f
1627	3	Mya Hilpert	f
1628	2	Kailyn Feil	t
1629	2	Erich Bartell V	f
1630	2	Wilhelm Frami	f
1631	1	Jaycee Hyatt	t
1632	2	Garrett Feest	f
1633	4	D'angelo Jacobs II	f
1634	1	Ramon Hoppe	f
1635	2	Guillermo Langosh	f
1636	2	Carter White	f
1637	4	Hipolito Mohr	f
1638	3	Mr. Alycia Schaefer	f
1639	4	Rubye Hermann II	t
1640	1	Dr. Eliane Herman	f
1641	1	Lela Predovic	f
1642	1	Laisha Greenholt MD	t
1643	3	Boyd Cole	f
1644	3	Geraldine Fadel	f
1645	2	Lillian Johnston	f
1646	2	Alec Kling	f
1647	4	Letitia Schiller	f
1648	3	Dameon Thompson	f
1649	1	Vaughn Reichel DDS	f
1650	1	Nasir Hessel	f
1651	1	Virginie Schulist	t
1652	3	Virgie Farrell	f
1653	1	Myrtle Hegmann	f
1654	4	Mrs. Ettie Cummings	f
1655	1	Nia Goldner	t
1656	3	Selena Witting	f
1657	2	Albertha Hermann	f
1658	1	Drew Klocko V	f
1659	2	Roxanne Crist	f
1660	3	Braeden Dibbert	f
1661	2	Keagan Bosco	f
1662	1	Kamren Weber	f
1663	1	Abelardo Hintz	f
1664	2	Joelle Jaskolski Jr.	f
1665	1	Wallace Armstrong	t
1666	4	Maymie Ortiz	f
1667	3	Marion Senger II	f
1668	2	Eveline Willms	f
1669	2	Clifton Rogahn	f
1670	1	Adolphus Wunsch	t
1671	1	Jermain Hermann	f
1672	2	General Quitzon	t
1673	2	Sabrina Schmitt	f
1674	2	Julie Keebler	f
1675	2	Samantha Yundt	f
1676	2	Woodrow Aufderhar	f
1677	1	Candice Borer	f
1678	1	Antonietta Considine	f
1679	2	Clementina Little	f
1680	1	Morgan Kuhic II	f
1681	4	Efren Volkman	f
1682	3	Torrey Collins	f
1683	1	Tate Swaniawski	f
1684	2	Bailey Gottlieb	f
1685	1	Martin Mann	f
1686	2	Rafaela Grady	f
1687	2	Kiley Kuhlman	f
1688	2	Emerald Hegmann	f
1689	3	Francesca Durgan	f
1690	4	Keyshawn Farrell	f
1691	2	Erika Pollich	f
1692	1	Reece Bergstrom I	f
1693	2	Brendon Bahringer	f
1694	1	Granville Collins	f
1695	2	Mr. Alayna Hamill	f
1696	4	Miss Joseph Huel	f
1697	2	Dayna Hills	f
1698	1	Bettye Volkman	f
1699	1	Greg Johnston Sr.	f
1700	1	Otha Wilderman	f
1701	3	Austen Shanahan	f
1702	4	Ms. Anahi Kertzmann	f
1703	4	Ms. Joaquin Kilback	f
1704	3	Nelda Ullrich	f
1705	1	Katlyn Schultz	f
1706	3	Viviane Ferry	f
1707	3	Hyman Powlowski	f
1708	2	Alanis Dare I	f
1709	3	Johnpaul Marvin	f
1710	1	Chanel Kulas	f
1711	4	Darren Kovacek	f
1712	2	Kattie Botsford	f
1713	1	Adriel Skiles PhD	f
1714	1	Vincent Wiza	f
1715	4	Jordan Langosh I	f
1716	3	Dixie MacGyver I	f
1717	1	Pedro Ondricka	f
1718	2	Eliza Moen	f
1719	4	Cathryn Bayer	f
1720	1	Hulda Hegmann	f
1721	2	Mrs. Murray O'Connell	f
1722	1	Carey Cassin	f
1723	3	Rachelle Rice	f
1724	2	Dr. Amina Skiles	f
1725	3	Cristian D'Amore	f
1726	1	Elena Considine	f
1727	1	Dameon Keeling	f
1728	2	Edna Hegmann	f
1729	2	Donato Volkman	f
1730	1	Elisabeth Mraz PhD	f
1731	1	Beverly Williamson	f
1732	1	Mrs. Ilene Predovic	t
1733	2	Alphonso Mertz	f
1734	1	Kaylee Powlowski	f
1735	4	Wendell Swift	f
1736	4	Kyla Kreiger	f
1737	3	Karelle Durgan	t
1738	1	Amya Murphy	f
1739	3	Jacklyn Hodkiewicz	f
1740	1	Elaina Gusikowski	f
1741	1	Mireille Powlowski	f
1742	1	Terrance Rice	f
1743	2	Carmella Mayert	f
1744	1	Leonie Lynch	f
1745	1	Lambert West	t
1746	1	Cecile Auer	f
1747	2	Ms. Willy Mueller	f
1748	1	Harmon Swift II	t
1749	2	Dakota Mosciski	f
1750	1	Lacey Blanda	f
1751	3	Vivian Shields	f
1752	1	Mr. Jaycee Treutel	f
1753	1	Salvador Harvey	f
1754	2	Celine Kemmer	f
1755	1	Jairo Kreiger	f
1756	1	Gennaro Fritsch	f
1757	3	Abigayle Kilback	f
1758	3	Clotilde Witting	f
1759	4	Jaquan Schinner	f
1760	2	Dr. Muhammad Orn	t
1761	1	Mrs. Ulices Balistreri	f
1762	1	Marjory Bergstrom	f
1763	3	Rocky Blanda	f
1764	4	Elvie Halvorson	f
1765	1	Michele Goodwin	f
1766	3	Blanca Pfeffer	t
1767	1	Ms. Anabel Bode	f
1768	3	Roel Franecki	f
1769	1	Edgar Schaden	f
1770	2	Tremaine Lueilwitz	f
1771	1	Ms. Roel Homenick	f
1772	2	Anabelle Ruecker IV	f
1773	2	June Leffler DDS	f
1774	1	Lavina Kuhn	f
1775	2	Regan Lakin	f
1776	2	Lauriane Legros	f
1777	2	Moses Stiedemann	f
1778	1	Abdul Cormier	f
1779	2	Micheal Hilll	f
1780	1	Mr. Milan Okuneva	t
1781	2	Bria Gusikowski	f
1782	4	Kariane Gerlach	f
1783	1	Osborne Moen	f
1784	1	Mr. Marcelina Boyer	f
1785	1	Mrs. Everette Treutel	t
1786	2	Carmelo Rau	f
1787	1	Roberto Prosacco	f
1788	3	Cristina Veum	f
1789	1	Brian Casper	f
1790	1	Madalyn Pouros	t
1791	1	Mr. Jamey Kunze	t
1792	3	Uriah Smitham	f
1793	2	Geoffrey Cronin	f
1794	1	Erica Aufderhar	f
1795	3	Vernice Mraz	f
1796	1	Marguerite Hirthe	f
1797	4	Demarco Reynolds	f
1798	2	Joana Barton PhD	f
1799	2	Amaya Schultz	f
1800	3	Sandra Kreiger Jr.	f
1801	2	Darien Batz	f
1802	2	Gregorio Paucek	f
1803	3	Ms. Lionel Emmerich	f
1804	1	Guy Swaniawski	f
1805	1	Burley Gibson Sr.	t
1806	3	Olen Koelpin	f
1807	2	Lera Lakin	f
1808	1	Oliver Rosenbaum III	f
1809	3	Ethyl Rutherford	f
1810	2	Rudy Kirlin	f
1811	3	Maymie Nitzsche	f
1812	1	Marc Cormier	f
1813	3	Laurel Frami	f
1814	2	Estevan Jacobs II	f
1815	2	Tomasa Schmidt	f
1816	3	Jimmy Kozey	t
1817	3	Amy Schneider	f
1818	1	Janet Gottlieb	f
1819	1	Alice Sawayn	f
1820	1	Mariana Zboncak	t
1821	3	Dr. Laverna Paucek	f
1822	3	Mrs. Aisha Fritsch	f
1823	3	Tia Bayer	f
1824	4	Jonathan Walker	f
1825	1	Kayli Nolan	f
1826	1	Tyrell Rath	f
1827	2	Jeromy Jacobson	f
1828	3	Manuel Corwin	f
1829	1	Viviane Ledner	f
1830	1	Letitia Howell Jr.	f
1831	1	Toy Keeling	f
1832	2	Bertrand Lebsack	f
1833	1	Araceli Wolf	t
1834	1	Ms. Luigi Bechtelar	f
1835	3	Erica Rohan	f
1836	1	Kaylin Rutherford	f
1837	3	Gabe Jakubowski	f
1838	1	Rylan Beier	f
1839	2	Jarrett Emard	t
1840	2	Teagan Gutkowski	f
1841	1	Bruce Orn	f
1842	3	Miss Claire Wehner	f
1843	1	Lysanne Grant	f
1844	1	Javier Walsh	f
1845	3	Pauline Koelpin	f
1846	3	Jordi Ferry	f
1847	3	Raphael Block	f
1848	1	Dejon Boyer II	t
1849	1	Mr. Barton Reinger	f
1850	1	Colin Shanahan	f
1851	4	Dr. Jonathan Gleason	f
1852	3	Lillian Corwin	f
1853	2	Erika Murphy	t
1854	2	Laron Hagenes II	f
1855	2	Marley Frami	f
1856	2	Bart Pfannerstill	f
1857	2	Mrs. Maximus Pfannerstill	t
1858	1	Rosemary Hills	f
1859	2	Citlalli Buckridge DVM	t
1860	1	Whitney Kohler	t
1861	2	Dr. Shaina Gorczany	f
1862	3	Mrs. Hudson Ward	f
1863	2	Christopher Dickens	f
1864	3	Nickolas Moore	f
1865	2	Mrs. Raleigh Collins	f
1866	2	Watson Ratke V	f
1867	1	Kyla West	f
1868	2	Dr. Frances Grady	f
1869	1	Lonie Hegmann	f
1870	1	Chaya Wehner	f
1871	3	Lupe Herman	f
1872	3	Palma Yundt	f
1873	1	Mrs. Bernita Haag	f
1874	1	Aurelia Bins	t
1875	1	Odie Effertz I	f
1876	1	Zachary Boyle	f
1877	2	Roger Lubowitz	f
1878	1	Ernie Flatley PhD	t
1879	1	Alize Kassulke	f
1880	1	Sincere Walter Sr.	f
1881	4	Elna Hartmann	f
1882	2	Ofelia Goyette V	f
1883	1	Shane Wolf	f
1884	1	Fabiola Cartwright MD	f
1885	1	Mafalda Stanton	f
1886	1	Wilber Russel	f
1887	2	Ceasar Wolff	f
1888	2	Salvatore Breitenberg	f
1889	2	Beaulah Haley	f
1890	1	Shaylee Weissnat	f
1891	3	Effie MacGyver	f
1892	2	Lottie Harris	f
1893	3	Dalton Douglas	f
1894	1	Boris Hodkiewicz	f
1895	2	Arnaldo Wuckert V	f
1896	1	Alisha Hagenes	f
1897	1	Conner Hermann	f
1898	2	Charity Walter	t
1899	3	Simone Kris	f
1900	1	Natasha Satterfield I	t
1901	3	Ahmed Predovic	f
1902	3	Luella Marquardt	f
1903	1	Savion Considine	f
1904	3	Garth Sawayn	t
1905	2	Carlotta Lockman IV	f
1906	2	Josephine Auer IV	t
1907	1	Taurean Jaskolski	f
1908	1	Malcolm Russel	f
1909	1	Casey Rodriguez	f
1910	1	Elda Luettgen	f
1911	4	Dr. Louvenia Windler	f
1912	3	Nikita Torp	f
1913	1	Emmanuelle Legros	t
1914	1	Andre Cremin	f
1915	1	Shawn Reynolds DVM	f
1916	3	Dr. Wilburn Parisian	f
1917	3	Mrs. Alvah Jacobs	t
1918	3	Reece Schmidt	f
1919	1	Alberto Ernser	f
1920	4	Kelvin Stiedemann I	f
1921	1	Isaiah Morar	f
1922	1	Marcelino Leuschke	f
1923	3	Blanca Collins III	f
1924	3	Viola Batz	f
1925	3	Lenna Brown	f
1926	2	Lorenz Schmitt	f
1927	2	Libby Champlin	f
1928	1	Keon Bechtelar	f
1929	1	Steve Leffler I	f
1930	3	Jayne Walsh MD	f
1931	3	Domenick Adams V	f
1932	1	Vivianne Fahey	t
1933	1	Piper Rice	f
1934	2	Margie Ebert	f
1935	2	Nichole Bartell	f
1936	1	Obie Cartwright	f
1937	2	Laila Lemke	f
1938	1	Savannah Conn	f
1939	1	Cierra Dickinson	f
1940	1	Damaris Stanton	f
1941	1	Leo Tillman	f
1942	2	Irma Gutmann	f
1943	2	Reilly Swift	t
1944	2	Sunny Pacocha	f
1945	1	Laurine Hudson	f
1946	1	Omer Cummings MD	f
1947	2	Leslie Krajcik	f
1948	2	Brady Pacocha	f
1949	2	Lawson McCullough Jr.	f
1950	1	Adelia Turner	f
1951	1	Linda Wolf	f
1952	1	Rosendo Stark	t
1953	1	Dr. Piper Schmidt	f
1954	2	Jairo Jerde	f
1955	1	Khalil Haley	f
1956	3	Genevieve Streich	f
1957	1	Ronny Renner MD	f
1958	1	Lisa Bartell	f
1959	4	Dolores Roberts	f
1960	4	Arlie Purdy DVM	f
1961	3	Osborne Sawayn	f
1962	1	Stanton Becker	f
1963	2	Ms. Shanny Hartmann	f
1964	3	Abner O'Connell	f
1965	1	Wava Mohr	t
1966	1	Janick Goldner	f
1967	4	Veda Bauch	f
1968	2	Kyra Pacocha	f
1969	1	Marge Romaguera DVM	f
1970	1	Mrs. Sonya Strosin	f
1971	4	Melody Metz V	f
1972	4	Elvis Walker	t
1973	1	Giuseppe Dare	f
1974	1	Buster Stamm	f
1975	2	Josefina Rodriguez	t
1976	3	Ella Sauer	f
1977	2	Isadore Pouros	f
1978	1	Katelynn Sawayn	f
1979	1	Lilla Reilly	f
1980	4	Keyshawn Wiegand	t
1981	4	Randy Boehm	f
1982	2	Jameson Stracke	f
1983	2	Garnett Lakin DVM	f
1984	1	Paolo Fisher	f
1985	3	Josefa Russel	f
1986	1	Ms. Erling Green	f
1987	4	Roman Bruen	f
1988	2	Dolly Koepp	f
1989	2	Kevin Williamson	f
1990	1	August Nikolaus	f
1991	1	Bernita Sipes	f
1992	1	Bertrand Quigley	f
1993	2	Beatrice Turner I	f
1994	1	Grayce Spencer	f
1995	2	Wyatt Batz	f
1996	3	Maggie Cummerata DDS	f
1997	2	Gabrielle Purdy	f
1998	1	Arden Nienow	f
1999	3	Rickey Torp	f
2000	3	Bethany Hayes	f
2001	4	Brett Bayer	f
2002	2	Lillie Powlowski III	t
2003	3	Mrs. Emilia Schmidt	f
2004	1	Joy Koss	f
2005	4	Freddy Bins	f
2006	4	Tate Padberg	f
2007	4	Aniya Oberbrunner	f
2008	1	Rhea Cremin	f
2009	3	Mr. Rosario Schroeder	t
2010	1	Lew Strosin	f
2011	1	Lela Stokes	f
2012	3	Keenan Zulauf	f
2013	1	Ms. Kamren Koepp	f
2014	2	Peggie Miller	f
2015	1	Dorris Stiedemann	f
2016	1	Annie Wolff	f
2017	3	Royce Hyatt	f
2018	1	Austin Stehr	f
2019	2	Gaston Gleason	f
2020	2	Ella Ratke	f
2021	1	Georgette Kuvalis	t
2022	1	Hayley Dicki	f
2023	1	Hermina Bauch	f
2024	1	Tyrell Spencer	f
2025	3	Delmer Watsica	f
2026	2	Reymundo Konopelski II	t
2027	1	Lesly Jenkins	f
2028	3	Bridgette Dicki	f
2029	4	Janice Stark DVM	f
2030	1	Gia Bayer V	f
2031	1	Brando Huel	f
2032	4	Marques Boehm	f
2033	2	Lois Abshire	t
2034	3	Miss Jessy Bernhard	f
2035	2	Dejon Murray	f
2036	1	Einar Hirthe	f
2037	2	Esther Gutmann MD	f
2038	2	Linwood Konopelski	f
2039	1	Kristina Rippin	f
2040	3	Lauryn Hammes	f
2041	1	Cathryn Harvey	t
2042	1	Jack Torp	f
2043	3	Lupe Kautzer MD	f
2044	2	Emma Cummings	f
2045	1	Mr. Jamir Funk	f
2046	1	Dexter Reilly	f
2047	3	Miss Anika Ernser	f
2048	3	Rodrick Berge	t
2049	2	Michale Witting	f
2050	1	Ayden O'Hara	f
2051	1	Ralph Turcotte IV	f
2052	3	Otilia Rempel II	f
2053	1	Adrienne Dibbert	f
2054	1	Lempi Gislason	f
2055	1	Kristofer Bergstrom	f
2056	2	Mrs. Kimberly Carroll	f
2057	1	Royce Hammes	f
2058	1	Sherman Metz	f
2059	1	Gudrun Keebler	f
2060	3	Trey Shields	f
2061	2	Gabriel Hickle	f
2062	1	Clarissa Dickinson PhD	f
2063	4	Nickolas Kuphal	f
2064	2	Oswald Terry MD	f
2065	3	Fredrick Price	f
2066	2	Hershel Parisian	f
2067	2	Hassie Ratke	f
2068	3	Ms. Asa Bayer	f
2069	1	Cory Mohr Sr.	f
2070	1	Fritz Hartmann	f
2071	2	Carlos Lehner	f
2072	2	Renee Prosacco	f
2073	2	Raina Brekke	f
2074	1	Karen Lakin	f
2075	2	Else Kassulke	f
2076	1	Shane Wuckert DVM	f
2077	1	Theodore D'Amore	f
2078	3	Roderick Schroeder	f
2079	2	Hilbert Berge Sr.	f
2080	2	Levi Hayes	f
2081	1	Jayson Stroman	f
2082	1	May Runte	t
2083	1	Jerry Rempel	f
2084	3	Roxane Osinski	t
2085	2	Rebekah Smith	f
2086	2	Liliane Cronin	f
2087	3	Lane Weber MD	f
2088	1	Rosie Auer	f
2089	2	Ms. Mariam Frami	f
2090	1	Marjory Smith	f
2091	3	Felipa Olson DDS	f
2092	1	Joseph Johnson	f
2093	1	Alivia Dickens	f
2094	2	Flo Lesch	f
2095	1	Ashley Stokes DVM	f
2096	1	Jessika Lesch	f
2097	1	Brett Oberbrunner	f
2098	3	Jakob Rath	f
2099	3	Teagan Huels	f
2100	2	Leif Walsh	f
2101	1	Sabina Bernhard	f
2102	2	Odessa Christiansen	f
2103	1	Jamie Larkin	f
2104	2	Alaina Pfeffer	f
2105	3	Aurelia McClure	f
2106	2	Dayne Kessler	f
2107	3	Tristin Williamson	f
2108	2	Tomasa Streich	f
2109	1	Princess Koss	f
2110	3	Osborne Cummings	t
2111	2	Layne Kassulke Sr.	f
2112	2	Misael Ernser	f
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('customers_id_seq', 2112, true);


--
-- Data for Name: d_customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY d_customers (id, has_app, has_newsletter, is_child) FROM stdin;
1	f	f	t
2	t	f	t
3	f	f	f
4	t	f	t
5	f	f	f
6	f	f	t
7	f	f	t
8	f	f	t
9	f	f	f
10	f	t	t
11	f	f	t
12	f	f	f
13	t	f	t
14	f	t	t
15	f	f	f
16	f	t	f
17	f	f	t
18	t	f	t
19	f	f	t
20	f	f	t
21	f	f	t
22	t	f	f
23	t	f	f
24	t	f	t
25	f	f	t
26	f	f	t
27	f	f	f
28	t	f	t
29	f	f	t
30	f	f	t
31	f	f	t
32	t	t	t
33	t	f	f
34	f	f	t
35	t	t	f
36	t	f	t
37	f	f	t
38	t	f	t
39	t	f	t
40	t	f	f
41	f	t	t
42	f	t	t
43	f	f	t
44	t	f	f
45	f	f	t
46	f	f	f
47	f	f	f
48	f	f	f
49	f	f	t
50	f	f	f
51	f	f	t
52	f	f	t
53	f	f	t
54	f	f	t
55	t	t	f
56	f	f	t
57	t	f	f
58	f	f	f
59	f	f	t
60	t	f	f
61	f	f	t
62	f	f	t
63	f	f	f
64	f	f	f
65	f	f	f
66	f	f	t
67	f	f	t
68	f	f	f
69	t	f	f
70	t	t	t
71	f	f	t
72	t	f	t
73	t	f	f
74	t	f	t
75	t	f	f
76	t	f	f
77	f	f	t
78	f	f	t
79	t	f	t
80	f	f	f
81	t	f	f
82	f	f	t
83	f	t	t
84	f	f	f
85	t	f	t
86	t	t	t
87	f	f	t
88	f	f	t
89	f	f	f
90	f	f	f
91	f	f	t
92	f	f	t
93	f	f	t
94	f	f	f
95	f	f	t
96	f	f	t
97	f	f	f
98	f	f	t
99	f	f	f
100	f	f	f
101	f	f	t
102	t	f	t
103	f	f	f
104	f	f	f
105	f	f	t
106	f	f	t
107	t	f	t
108	f	f	t
109	f	f	f
110	f	f	t
111	t	f	t
112	f	f	t
113	f	f	t
114	f	t	t
115	t	f	t
116	f	f	t
117	f	f	f
118	f	f	f
119	f	f	t
120	f	f	t
121	t	f	f
122	t	f	t
123	f	f	t
124	f	f	f
125	f	f	t
126	f	f	f
127	f	f	t
128	f	f	t
129	f	f	t
130	f	f	t
131	t	f	f
132	f	f	t
133	t	f	t
134	f	f	f
135	t	f	f
136	f	f	t
137	f	t	f
138	f	f	t
139	t	f	t
140	t	t	t
141	f	f	t
142	f	f	f
143	t	f	f
144	f	f	t
145	f	f	f
146	f	f	t
147	f	f	f
148	f	t	f
149	t	f	f
150	f	f	t
151	f	f	t
152	f	f	t
153	f	f	f
154	f	f	f
155	f	f	f
156	f	f	t
157	f	f	f
158	t	t	t
159	f	f	t
160	t	t	f
161	f	f	t
162	f	f	t
163	f	f	t
164	f	f	t
165	f	f	t
166	f	f	t
167	t	f	t
168	f	f	t
169	f	f	t
170	f	f	f
171	f	f	t
172	f	f	t
173	f	f	t
174	f	f	f
175	t	f	t
176	t	f	f
177	f	f	t
178	f	f	t
179	t	f	t
180	f	f	t
181	f	f	t
182	f	f	t
183	f	f	f
184	f	f	t
185	f	f	f
186	f	f	t
187	f	f	t
188	t	f	t
189	f	f	f
190	t	f	t
191	f	t	f
192	f	f	t
193	f	f	t
194	t	f	f
195	f	f	t
196	t	f	t
197	f	f	t
198	t	f	t
199	f	f	f
200	f	f	t
201	t	f	t
202	f	f	f
203	t	f	t
204	f	f	f
205	f	f	t
206	f	f	t
207	f	f	f
208	f	t	t
209	t	f	t
210	f	f	f
211	f	t	f
212	t	f	t
213	t	f	t
214	f	f	f
215	t	f	t
216	f	t	t
217	t	f	t
218	f	t	t
219	f	f	f
220	f	t	t
221	f	f	f
222	t	f	t
223	f	f	t
224	f	t	f
225	f	f	t
226	f	f	f
227	f	f	f
228	f	f	f
229	f	f	t
230	f	f	t
231	f	f	t
232	f	f	t
233	f	f	t
234	t	t	f
235	f	f	f
236	f	f	f
237	f	f	t
238	f	f	t
239	f	f	t
240	f	f	t
241	f	f	t
242	f	f	f
243	f	f	t
244	f	f	t
245	f	f	t
246	f	f	t
247	f	f	f
248	f	f	t
249	f	f	t
250	t	f	t
251	f	f	t
252	f	f	f
253	f	t	t
254	f	f	t
255	f	f	t
256	f	f	t
257	f	t	t
258	t	f	t
259	f	f	t
260	f	f	t
261	t	t	f
262	f	f	t
263	f	f	t
264	t	f	t
265	t	f	t
266	f	f	t
267	f	f	f
268	f	f	f
269	f	f	f
270	f	t	f
271	t	f	t
272	f	f	f
273	f	f	t
274	f	f	t
275	f	f	f
276	t	f	t
277	t	f	t
278	f	f	t
279	f	f	t
280	t	f	f
281	f	f	f
282	t	f	t
283	f	f	t
284	f	f	f
285	f	f	f
286	t	f	f
287	t	f	t
288	t	f	t
289	f	f	t
290	f	f	t
291	t	f	t
292	f	f	f
293	f	f	t
294	t	f	t
295	t	t	f
296	f	f	f
297	t	f	t
298	t	f	t
299	f	f	f
300	t	f	f
301	t	f	t
302	f	f	f
303	f	f	f
304	f	t	f
305	t	f	f
306	t	f	f
307	f	f	f
308	f	f	t
309	f	f	f
310	f	f	f
311	f	f	t
312	f	f	f
313	t	f	t
314	f	f	f
315	f	f	f
316	f	f	t
317	f	f	t
318	f	f	f
319	f	f	t
320	f	f	t
321	t	f	f
322	f	f	f
323	t	f	t
324	t	f	t
325	f	f	t
326	t	f	t
327	f	f	f
328	f	f	t
329	f	f	f
330	f	f	t
331	t	f	f
332	t	f	t
333	f	f	t
334	t	f	t
335	f	f	t
336	t	f	t
337	f	f	t
338	t	f	t
339	f	f	f
340	t	f	f
341	f	f	f
342	t	f	t
343	f	f	t
344	f	f	t
345	f	f	f
346	f	f	t
347	f	f	t
348	t	f	f
349	f	t	t
350	f	f	f
351	t	f	f
352	f	f	f
353	f	f	f
354	t	f	t
355	f	f	f
356	f	f	t
357	f	f	t
358	f	f	f
359	f	f	t
360	f	t	f
361	f	f	f
362	f	f	f
363	f	f	t
364	f	f	f
365	t	f	f
366	f	f	t
367	f	f	t
368	f	f	f
369	f	f	t
370	f	f	t
371	t	t	t
372	f	f	t
373	f	f	t
374	t	t	t
375	t	f	t
376	f	f	t
377	f	f	f
378	t	t	t
379	f	f	f
380	t	t	t
381	f	f	t
382	f	f	t
383	f	f	f
384	f	f	t
385	f	f	t
386	f	f	t
387	f	f	f
388	f	f	f
389	f	f	t
390	f	f	t
391	f	f	f
392	f	f	t
393	f	f	t
394	t	f	t
395	t	f	t
396	f	f	t
397	t	f	t
398	t	f	t
399	t	f	t
400	f	t	t
401	t	f	f
402	f	t	f
403	f	f	f
404	f	f	f
405	f	f	t
406	f	f	f
407	t	f	t
408	t	f	t
409	t	f	f
410	f	t	f
411	f	f	t
412	t	f	t
413	f	f	t
414	t	f	t
415	t	f	f
416	f	f	f
417	f	f	f
418	t	f	t
419	f	f	t
420	f	f	t
421	f	f	f
422	f	t	f
423	f	f	f
424	f	f	f
425	f	f	f
426	t	t	t
427	f	f	t
428	f	f	f
429	t	f	f
430	f	f	f
431	f	f	t
432	f	f	t
433	t	f	f
434	t	f	t
435	f	f	f
436	f	f	f
437	t	f	f
438	f	f	f
439	t	f	f
440	f	f	f
441	f	t	t
442	f	f	f
443	f	f	t
444	f	f	f
445	f	f	t
446	f	f	t
447	t	f	f
448	t	f	f
449	f	t	t
450	f	f	t
451	t	f	f
452	f	f	t
453	f	f	t
454	f	f	t
455	f	f	f
456	f	f	t
457	f	f	t
458	t	f	f
459	f	f	t
460	f	f	f
461	t	f	t
462	f	f	t
463	f	f	f
464	f	t	t
465	f	f	f
466	f	f	t
467	t	f	f
468	f	f	f
469	f	f	t
470	t	f	t
471	f	f	t
472	f	f	f
473	f	f	f
474	f	f	f
475	f	f	t
476	f	f	f
477	f	f	t
478	t	f	f
479	f	f	t
480	t	t	t
481	f	t	f
482	f	f	t
483	t	f	t
484	f	f	f
485	f	f	t
486	f	t	f
487	f	f	t
488	f	f	t
489	f	f	t
490	f	t	f
491	f	f	f
492	t	f	f
493	f	f	t
494	f	f	f
495	t	f	f
496	f	t	t
497	t	f	t
498	f	t	f
499	t	f	t
500	f	f	t
501	f	f	f
502	f	f	t
503	f	f	f
504	f	f	t
505	f	f	t
506	f	f	f
507	f	f	f
508	f	f	t
509	f	f	f
510	f	f	f
511	f	f	t
512	t	f	f
513	f	f	f
514	f	f	t
515	t	f	t
516	t	f	f
517	f	f	t
518	f	f	f
519	f	f	t
520	f	f	t
521	f	f	t
522	t	f	t
523	f	t	t
524	f	f	t
525	f	f	t
526	f	f	t
527	f	f	t
528	f	f	t
529	t	f	f
530	f	t	t
531	f	f	f
532	f	f	f
533	f	t	f
534	t	f	t
535	f	f	t
536	f	f	t
537	f	f	t
538	t	f	f
539	f	f	t
540	f	f	f
541	f	f	f
542	t	f	f
543	f	f	f
544	f	t	f
545	f	f	t
546	f	t	f
547	f	f	t
548	t	f	f
549	f	f	f
550	f	f	t
551	f	f	f
552	f	f	t
553	t	f	t
554	f	f	t
555	t	f	t
556	t	t	t
557	t	f	t
558	f	f	t
559	f	f	t
560	t	f	t
561	t	f	t
562	t	f	t
563	f	t	f
564	f	f	f
565	t	f	f
566	f	f	t
567	f	f	t
568	f	f	f
569	f	f	f
570	t	f	f
571	f	f	f
572	t	t	t
573	f	f	t
574	f	f	t
575	f	f	t
576	f	f	f
577	f	f	t
578	f	f	f
579	f	f	t
580	f	f	t
581	f	t	t
582	f	t	f
583	f	f	t
584	f	f	f
585	f	f	f
586	f	f	t
587	f	f	f
588	t	f	t
589	f	f	t
590	f	f	t
591	t	f	t
592	t	f	t
593	f	f	t
594	f	f	t
595	f	f	t
596	f	f	t
597	f	f	f
598	f	f	f
599	t	f	t
600	t	f	t
601	f	f	f
602	f	f	t
603	f	t	f
604	t	f	f
605	f	f	f
606	t	f	t
607	f	f	t
608	f	f	t
609	f	f	t
610	f	f	f
611	f	f	f
612	f	f	t
613	f	f	f
614	t	t	t
615	f	f	t
616	t	f	t
617	f	f	f
618	f	f	f
619	f	f	f
620	f	f	t
621	f	f	t
622	t	f	t
623	f	f	t
624	t	t	t
625	f	f	f
626	f	f	t
627	f	f	t
628	f	f	f
629	f	f	t
630	t	f	f
631	f	f	t
632	f	f	t
633	f	f	t
634	f	f	t
635	f	f	t
636	t	t	t
637	t	f	f
638	f	f	t
639	f	f	t
640	f	f	t
641	f	f	t
642	f	f	t
643	f	f	f
644	f	f	t
645	t	f	f
646	t	f	f
647	f	f	t
648	f	f	t
649	f	f	t
650	f	f	t
651	f	f	t
652	f	f	f
653	t	f	f
654	f	f	f
655	f	f	t
656	f	f	f
657	f	f	t
658	f	f	t
659	f	f	f
660	t	t	t
661	t	f	t
662	t	f	f
663	f	f	f
664	f	t	f
665	t	f	t
666	f	f	f
667	f	f	t
668	t	f	f
669	t	f	f
670	f	f	f
671	f	f	t
672	f	f	t
673	f	t	f
674	t	f	t
675	t	f	t
676	f	f	t
677	f	f	f
678	t	f	t
679	t	f	t
680	f	f	t
681	f	f	f
682	f	f	f
683	f	f	t
684	f	f	t
685	f	f	f
686	t	f	f
687	f	f	t
688	f	f	t
689	f	f	t
690	f	f	f
691	f	f	t
692	f	f	f
693	f	t	t
694	f	f	t
695	f	f	t
696	f	f	t
697	f	t	t
698	f	f	t
699	f	f	t
700	f	f	f
701	f	f	f
702	f	f	f
703	f	f	f
704	f	f	f
705	f	f	t
706	f	f	t
707	f	f	t
708	f	f	f
709	f	t	t
710	f	f	t
711	f	f	t
712	t	f	t
713	f	f	t
714	f	t	t
715	f	f	t
716	f	f	t
717	t	f	t
718	f	f	t
719	f	f	t
720	f	f	t
721	f	f	t
722	f	f	t
723	f	f	f
724	f	f	t
725	t	f	f
726	f	f	t
727	f	t	t
728	t	f	t
729	f	f	f
730	f	t	t
731	f	f	f
732	t	f	f
733	t	f	t
734	t	t	f
735	f	t	t
736	f	f	f
737	f	t	f
738	f	f	t
739	f	t	t
740	f	f	t
741	f	f	t
742	f	f	t
743	f	f	f
744	f	f	f
745	f	f	t
746	f	f	f
747	t	f	t
748	f	f	t
749	f	f	f
750	t	f	f
751	f	f	f
752	t	f	f
753	f	f	f
754	f	f	f
755	f	f	t
756	f	f	t
757	f	f	f
758	f	f	f
759	t	f	t
760	f	f	t
761	f	f	f
762	f	f	t
763	f	f	f
764	f	t	f
765	f	f	t
766	t	f	f
767	f	f	t
768	f	f	t
769	f	f	t
770	f	f	f
771	t	f	t
772	f	f	f
773	f	f	f
774	f	f	f
775	f	f	f
776	f	f	t
777	t	f	f
778	f	f	t
779	f	f	f
780	f	t	f
781	f	f	f
782	f	f	f
783	t	f	f
784	f	f	t
785	f	f	f
786	t	f	f
787	f	f	f
788	t	f	t
789	f	f	t
790	f	f	t
791	f	f	t
792	f	f	t
793	f	f	t
794	f	f	f
795	f	f	f
796	f	f	t
797	f	f	t
798	f	f	f
799	f	f	f
800	f	f	t
801	f	f	f
802	t	f	f
803	f	f	t
804	f	f	f
805	t	f	f
806	f	f	f
807	f	f	f
808	f	t	f
809	f	f	t
810	f	f	f
811	t	f	t
812	f	f	t
813	f	f	t
814	t	f	t
815	f	f	t
816	t	f	f
817	f	f	f
818	f	f	t
819	f	f	f
820	t	t	t
821	f	t	t
822	t	f	t
823	f	f	t
824	f	f	t
825	f	f	t
826	f	f	t
827	f	f	f
828	t	f	t
829	f	f	t
830	f	f	f
831	t	f	t
832	f	f	t
833	f	f	f
834	f	f	t
835	f	f	t
836	f	f	t
837	t	f	t
838	f	t	t
839	t	f	f
840	f	f	t
841	f	f	t
842	f	f	t
843	f	f	t
844	f	f	f
845	f	f	t
846	f	f	t
847	f	f	t
848	f	f	f
849	t	f	f
850	f	f	t
851	f	f	t
852	f	f	f
853	t	f	t
854	t	f	t
855	f	f	f
856	f	f	t
857	t	f	f
858	f	f	f
859	t	f	t
860	t	f	f
861	f	f	f
862	f	f	f
863	f	f	f
864	f	f	t
865	t	f	t
866	f	f	t
867	t	f	t
868	f	f	t
869	t	f	f
870	t	f	t
871	f	f	f
872	f	f	t
873	t	f	f
874	f	f	f
875	t	f	f
876	f	f	f
877	f	f	t
878	t	f	t
879	f	f	t
880	t	f	t
881	f	t	t
882	f	f	t
883	f	f	t
884	t	f	t
885	t	f	t
886	f	f	t
887	t	f	t
888	t	f	t
889	f	f	f
890	f	t	f
891	f	f	f
892	f	f	t
893	f	f	t
894	f	f	f
895	f	f	f
896	f	f	t
897	f	f	f
898	f	f	t
899	f	f	f
900	f	f	t
901	f	f	t
902	f	f	t
903	f	f	t
904	f	f	t
905	f	f	t
906	t	f	t
907	f	f	f
908	t	f	t
909	t	f	t
910	f	f	f
911	f	f	t
912	f	t	f
913	f	f	f
914	f	f	t
915	f	f	f
916	t	t	f
917	f	t	t
918	f	f	t
919	f	f	f
920	f	f	t
921	t	t	f
922	t	f	t
923	f	f	f
924	f	f	t
925	f	f	t
926	f	f	t
927	t	f	t
928	f	f	t
929	f	f	t
930	t	f	t
931	t	f	t
932	t	f	t
933	t	f	t
934	f	f	t
935	f	f	f
936	f	f	t
937	f	f	t
938	f	f	t
939	f	f	t
940	f	f	f
941	f	f	f
942	f	f	f
943	f	f	t
944	f	f	f
945	t	f	t
946	f	f	t
947	f	f	t
948	f	f	t
949	f	f	f
950	f	f	t
951	t	f	f
952	t	f	t
953	f	f	t
954	f	f	t
955	t	f	t
956	f	f	f
957	f	f	t
958	t	f	f
959	t	f	t
960	f	f	t
961	t	f	f
962	f	f	f
963	f	t	t
964	f	f	t
965	f	f	t
966	f	f	t
967	f	f	f
968	t	f	t
969	f	f	t
970	t	f	t
971	f	f	t
972	f	f	f
973	f	f	f
974	f	f	t
975	f	f	f
976	f	f	t
977	t	f	t
978	f	f	t
979	f	f	t
980	f	f	f
981	t	f	t
982	f	f	f
983	f	f	t
984	t	f	t
985	t	f	t
986	t	t	f
987	f	f	f
988	f	f	t
989	t	f	t
990	f	f	t
991	f	f	t
992	f	f	f
993	f	f	f
994	f	f	t
995	t	f	t
996	t	t	f
997	t	t	f
998	f	f	t
999	f	f	t
1000	t	f	f
1001	f	f	t
1002	f	t	f
1003	f	f	t
1004	t	f	f
1005	f	f	t
1006	t	f	t
1007	f	f	f
1008	f	f	t
1009	f	f	f
1010	f	f	f
1011	t	f	t
1012	t	f	t
1013	f	f	f
1014	t	f	f
1015	t	f	t
1016	f	f	t
1017	t	f	f
1018	t	f	f
1019	t	f	t
1020	f	f	t
1021	f	f	t
1022	f	f	t
1023	f	f	t
1024	f	f	t
1025	f	f	t
1026	t	f	t
1027	f	f	f
1028	t	f	t
1029	f	f	f
1030	t	f	t
1031	f	f	f
1032	f	t	t
1033	f	f	f
1034	f	f	t
1035	f	f	t
1036	f	f	f
1037	f	t	t
1038	f	f	t
1039	t	f	t
1040	t	f	t
1041	t	f	t
1042	t	f	t
1043	f	f	f
1044	t	f	f
1045	t	f	f
1046	f	f	t
1047	t	f	t
1048	f	f	f
1049	f	f	f
1050	f	f	t
1051	f	f	f
1052	t	f	t
1053	f	f	t
1054	f	f	f
1055	t	f	f
1056	f	f	f
1057	f	t	f
1058	f	f	t
1059	f	f	f
1060	t	f	t
1061	f	f	t
1062	t	f	t
1063	f	f	f
1064	f	f	t
1065	f	t	t
1066	f	f	f
1067	t	f	f
1068	t	f	f
1069	f	f	f
1070	f	f	t
1071	t	f	t
1072	t	f	t
1073	t	f	t
1074	f	f	t
1075	f	f	t
1076	f	f	t
1077	f	f	t
1078	f	f	t
1079	f	f	t
1080	f	f	t
1081	t	f	t
1082	f	f	t
1083	f	f	f
1084	t	t	t
1085	f	f	f
1086	f	f	t
1087	t	f	t
1088	f	f	f
1089	f	f	t
1090	t	f	f
1091	f	f	f
1092	f	t	f
1093	f	f	t
1094	t	f	f
1095	f	f	f
1096	f	f	t
1097	f	f	f
1098	f	f	f
1099	f	f	f
1100	t	f	t
1101	t	f	t
1102	t	f	t
1103	f	f	f
1104	f	t	f
1105	f	f	f
1106	f	f	t
1107	f	f	t
1108	f	f	t
1109	f	f	t
1110	t	f	t
1111	f	f	t
1112	f	t	f
1113	f	f	f
1114	f	f	t
1115	f	f	t
1116	t	t	t
1117	f	f	f
1118	f	f	f
1119	f	f	t
1120	f	t	f
1121	t	f	f
1122	f	f	t
1123	f	f	f
1124	f	f	t
1125	f	f	t
1126	t	f	f
1127	f	f	t
1128	f	f	f
1129	f	f	f
1130	f	f	t
1131	f	f	t
1132	f	f	f
1133	t	f	f
1134	t	f	f
1135	f	f	t
1136	f	f	t
1137	f	f	t
1138	t	f	t
1139	f	f	t
1140	t	f	f
1141	f	f	t
1142	f	f	f
1143	f	f	t
1144	t	f	t
1145	t	f	t
1146	f	f	f
1147	f	f	t
1148	f	f	t
1149	t	f	t
1150	f	f	t
1151	f	f	f
1152	f	f	f
1153	f	f	f
1154	f	f	t
1155	t	f	t
1156	f	f	t
1157	f	f	f
1158	t	f	t
1159	f	f	f
1160	f	f	f
1161	f	f	t
1162	f	f	f
1163	t	f	t
1164	t	f	t
1165	f	f	t
1166	t	f	f
1167	t	f	t
1168	t	f	f
1169	f	f	t
1170	t	f	t
1171	t	f	t
1172	f	f	t
1173	f	f	t
1174	f	f	t
1175	t	f	t
1176	t	f	t
1177	t	f	t
1178	f	f	t
1179	t	t	f
1180	f	f	f
1181	t	t	t
1182	f	f	f
1183	t	f	t
1184	f	f	t
1185	t	f	t
1186	t	f	t
1187	f	f	t
1188	t	f	f
1189	f	f	t
1190	f	f	f
1191	f	f	f
1192	f	f	t
1193	f	f	t
1194	t	f	f
1195	f	f	t
1196	f	f	f
1197	f	f	t
1198	f	f	t
1199	f	f	t
1200	t	t	f
1201	t	f	t
1202	f	t	f
1203	t	f	t
1204	f	f	f
1205	f	f	f
1206	f	t	t
1207	f	f	f
1208	t	f	t
1209	t	f	f
1210	t	f	t
1211	f	f	t
1212	f	f	t
1213	f	f	f
1214	f	f	f
1215	f	f	t
1216	f	t	f
1217	f	f	t
1218	f	f	t
1219	f	f	t
1220	f	f	t
1221	t	f	t
1222	t	f	t
1223	f	f	f
1224	f	f	t
1225	f	f	f
1226	t	f	t
1227	f	f	t
1228	f	f	f
1229	f	f	f
1230	f	t	t
1231	f	f	t
1232	t	t	f
1233	t	f	t
1234	f	f	t
1235	f	f	f
1236	f	t	f
1237	f	f	t
1238	t	f	t
1239	f	f	t
1240	f	f	t
1241	f	f	t
1242	f	f	t
1243	f	f	t
1244	f	f	f
1245	t	f	f
1246	t	f	t
1247	t	f	t
1248	f	f	t
1249	f	f	t
1250	f	f	f
1251	f	f	t
1252	f	t	t
1253	f	f	f
1254	t	f	t
1255	f	f	f
1256	t	t	t
1257	f	f	f
1258	t	f	t
1259	f	t	t
1260	t	f	f
1261	t	f	t
1262	t	f	t
1263	t	f	t
1264	t	f	f
1265	f	f	t
1266	f	t	t
1267	f	f	t
1268	f	f	t
1269	t	f	t
1270	t	f	t
1271	f	t	f
1272	f	f	t
1273	f	f	f
1274	f	f	t
1275	f	f	f
1276	f	f	f
1277	f	f	f
1278	t	f	t
1279	t	f	f
1280	f	f	f
1281	t	f	t
1282	f	f	t
1283	t	f	t
1284	f	f	t
1285	f	f	t
1286	f	f	t
1287	f	f	t
1288	t	f	t
1289	f	f	t
1290	f	f	f
1291	t	f	f
1292	t	t	f
1293	t	f	t
1294	f	f	f
1295	t	f	f
1296	f	f	t
1297	f	f	f
1298	f	f	t
1299	f	f	t
1300	f	f	f
1301	f	f	f
1302	t	f	t
1303	f	t	t
1304	f	f	t
1305	f	f	f
1306	t	f	f
1307	f	f	f
1308	f	f	f
1309	t	f	t
1310	f	f	t
1311	f	f	f
1312	f	f	f
1313	f	f	f
1314	t	f	f
1315	f	f	t
1316	f	f	t
1317	t	f	f
1318	f	f	f
1319	f	t	t
1320	f	f	t
1321	t	t	t
1322	f	f	f
1323	f	f	t
1324	f	f	t
1325	f	f	t
1326	f	f	t
1327	f	f	t
1328	t	f	f
1329	f	f	f
1330	t	f	t
1331	f	f	f
1332	f	f	t
1333	f	f	f
1334	f	f	t
1335	f	f	f
1336	f	f	t
1337	f	f	t
1338	f	f	f
1339	t	f	t
1340	f	f	f
1341	f	f	t
1342	f	f	f
1343	f	f	t
1344	f	f	f
1345	f	f	t
1346	f	f	t
1347	f	f	f
1348	t	f	f
1349	f	f	t
1350	f	f	f
1351	f	f	f
1352	f	f	t
1353	f	f	f
1354	f	f	t
1355	t	f	t
1356	f	f	t
1357	t	f	f
1358	f	f	t
1359	t	f	t
1360	f	f	t
1361	t	f	t
1362	f	f	t
1363	f	f	t
1364	f	f	f
1365	f	f	t
1366	f	f	t
1367	f	f	t
1368	f	f	f
1369	f	f	f
1370	f	t	t
1371	t	f	f
1372	t	f	t
1373	f	f	t
1374	f	f	t
1375	f	f	t
1376	t	t	t
1377	t	f	f
1378	t	f	f
1379	f	f	f
1380	f	f	f
1381	f	f	f
1382	t	f	t
1383	f	t	f
1384	f	f	f
1385	f	f	t
1386	t	t	t
1387	f	f	t
1388	f	f	t
1389	t	f	f
1390	f	f	t
1391	f	f	f
1392	t	f	t
1393	f	f	t
1394	t	f	f
1395	f	f	f
1396	f	f	t
1397	t	f	f
1398	f	f	t
1399	f	f	t
1400	f	f	t
1401	f	f	t
1402	t	f	t
1403	f	f	t
1404	f	f	t
1405	f	f	t
1406	f	f	f
1407	f	f	f
1408	f	f	t
1409	f	f	t
1410	f	f	t
1411	f	f	f
1412	f	f	f
1413	f	f	t
1414	t	f	t
1415	f	f	t
1416	f	f	f
1417	f	f	f
1418	f	f	f
1419	f	f	t
1420	t	f	t
1421	f	f	t
1422	t	f	f
1423	t	f	t
1424	f	f	t
1425	f	f	t
1426	f	t	f
1427	f	f	f
1428	t	f	f
1429	f	f	f
1430	f	f	t
1431	t	f	t
1432	t	f	f
1433	f	f	t
1434	f	f	f
1435	t	f	f
1436	f	f	t
1437	t	f	t
1438	f	f	f
1439	f	f	t
1440	f	f	t
1441	f	f	t
1442	f	f	t
1443	f	f	t
1444	t	f	t
1445	t	f	t
1446	f	f	f
1447	f	f	f
1448	f	f	t
1449	f	f	t
1450	f	t	t
1451	f	f	f
1452	f	f	t
1453	f	f	f
1454	f	f	t
1455	t	f	t
1456	t	f	t
1457	t	f	f
1458	f	f	f
1459	f	f	t
1460	f	f	t
1461	f	f	t
1462	t	f	f
1463	f	f	f
1464	f	f	f
1465	t	f	t
1466	f	f	f
1467	f	f	f
1468	f	f	t
1469	f	f	f
1470	t	f	t
1471	f	f	t
1472	f	t	f
1473	f	f	t
1474	f	f	t
1475	t	f	t
1476	f	f	t
1477	f	f	t
1478	f	f	t
1479	f	f	t
1480	f	t	f
1481	f	f	t
1482	f	t	f
1483	t	f	t
1484	f	f	t
1485	t	f	t
1486	f	f	f
1487	f	f	f
1488	t	f	t
1489	f	f	f
1490	f	f	f
1491	f	t	t
1492	t	f	f
1493	f	t	f
1494	t	t	t
1495	f	f	t
1496	f	f	f
1497	f	f	t
1498	f	f	t
1499	f	f	f
1500	t	f	t
1501	f	f	t
1502	t	f	f
1503	t	f	f
1504	t	f	t
1505	f	f	t
1506	f	f	t
1507	f	f	t
1508	t	f	f
1509	f	f	f
1510	f	f	t
1511	f	f	t
1512	f	f	t
1513	f	f	t
1514	f	f	t
1515	f	f	t
1516	t	t	t
1517	f	f	f
1518	t	f	f
1519	f	f	f
1520	t	f	t
1521	f	f	t
1522	f	f	f
1523	f	f	f
1524	f	f	f
1525	f	f	f
1526	f	f	t
1527	f	f	f
1528	f	t	t
1529	t	f	f
1530	f	t	t
1531	f	f	f
1532	f	f	f
1533	t	f	t
1534	t	f	t
1535	t	t	t
1536	f	t	f
1537	f	f	f
1538	f	t	f
1539	f	f	f
1540	f	f	t
1541	t	f	f
1542	f	f	f
1543	f	f	t
1544	f	f	t
1545	f	f	f
1546	t	f	t
1547	f	f	f
1548	f	f	t
1549	f	f	t
1550	f	f	t
1551	f	f	t
1552	f	f	f
1553	f	f	f
1554	f	t	f
1555	f	f	f
1556	f	f	f
1557	f	f	t
1558	f	f	f
1559	f	f	f
1560	t	f	t
1561	t	f	t
1562	t	f	t
1563	t	f	t
1564	f	f	t
1565	f	t	t
1566	f	t	f
1567	t	f	t
1568	f	f	f
1569	t	f	f
1570	t	f	f
1571	f	f	t
1572	f	f	t
1573	f	f	f
1574	f	t	f
1575	f	f	t
1576	f	t	t
1577	f	f	t
1578	t	f	t
1579	f	f	t
1580	f	f	f
1581	f	f	t
1582	t	f	t
1583	f	f	t
1584	f	f	f
1585	t	f	f
1586	f	f	f
1587	f	f	t
1588	f	f	f
1589	f	f	f
1590	f	f	t
1591	f	f	f
1592	t	f	t
1593	f	f	t
1594	f	f	f
1595	t	f	t
1596	f	f	f
1597	f	f	t
1598	f	f	t
1599	t	f	t
1600	f	f	t
1601	f	f	f
1602	f	f	f
1603	f	t	t
1604	t	f	t
1605	f	f	f
1606	f	f	t
1607	f	f	t
1608	t	f	t
1609	f	f	f
1610	f	f	f
1611	t	f	f
1612	t	f	f
1613	f	t	t
1614	t	f	f
1615	t	f	f
1616	f	f	t
1617	t	f	t
1618	t	f	f
1619	f	f	t
1620	t	f	t
1621	f	f	t
1622	f	f	t
1623	f	f	t
1624	f	f	f
1625	t	f	t
1626	f	f	t
1627	t	f	f
1628	f	t	t
1629	f	f	f
1630	f	f	f
1631	f	t	t
1632	f	f	f
1633	t	f	f
1634	f	f	t
1635	f	f	t
1636	f	f	t
1637	t	f	t
1638	t	f	f
1639	t	t	t
1640	f	f	f
1641	f	f	t
1642	f	t	t
1643	t	f	t
1644	t	f	t
1645	f	f	t
1646	f	f	f
1647	t	f	f
1648	t	f	f
1649	f	f	f
1650	f	f	t
1651	f	t	t
1652	t	f	f
1653	f	f	t
1654	t	f	t
1655	f	t	f
1656	t	f	t
1657	f	f	t
1658	f	f	t
1659	f	f	t
1660	t	f	t
1661	f	f	f
1662	f	f	f
1663	f	f	f
1664	f	f	t
1665	f	t	t
1666	t	f	f
1667	t	f	t
1668	f	f	t
1669	f	f	f
1670	f	t	f
1671	f	f	t
1672	f	t	t
1673	f	f	t
1674	f	f	f
1675	f	f	t
1676	f	f	f
1677	f	f	t
1678	f	f	t
1679	f	f	t
1680	f	f	t
1681	t	f	t
1682	t	f	f
1683	f	f	t
1684	f	f	t
1685	f	f	f
1686	f	f	f
1687	f	f	t
1688	f	f	t
1689	t	f	t
1690	t	f	t
1691	f	f	f
1692	f	f	t
1693	f	f	f
1694	f	f	t
1695	f	f	f
1696	t	f	t
1697	f	f	t
1698	f	f	t
1699	f	f	t
1700	f	f	t
1701	t	f	t
1702	t	f	f
1703	t	f	t
1704	t	f	f
1705	f	f	f
1706	t	f	f
1707	t	f	t
1708	f	f	t
1709	t	f	f
1710	f	f	f
1711	t	f	f
1712	f	f	t
1713	f	f	t
1714	f	f	f
1715	t	f	f
1716	t	f	t
1717	f	f	t
1718	f	f	f
1719	t	f	t
1720	f	f	f
1721	f	f	t
1722	f	f	t
1723	t	f	t
1724	f	f	f
1725	t	f	t
1726	f	f	f
1727	f	f	t
1728	f	f	f
1729	f	f	t
1730	f	f	t
1731	f	f	t
1732	f	t	t
1733	f	f	f
1734	f	f	t
1735	t	f	t
1736	t	f	t
1737	t	t	f
1738	f	f	t
1739	t	f	f
1740	f	f	t
1741	f	f	f
1742	f	f	f
1743	f	f	t
1744	f	f	f
1745	f	t	f
1746	f	f	f
1747	f	f	t
1748	f	t	f
1749	f	f	t
1750	f	f	t
1751	t	f	f
1752	f	f	t
1753	f	f	t
1754	f	f	t
1755	f	f	t
1756	f	f	t
1757	t	f	t
1758	t	f	t
1759	t	f	t
1760	f	t	f
1761	f	f	t
1762	f	f	t
1763	t	f	f
1764	t	f	f
1765	f	f	t
1766	t	t	f
1767	f	f	t
1768	t	f	f
1769	f	f	t
1770	f	f	f
1771	f	f	t
1772	f	f	t
1773	f	f	f
1774	f	f	f
1775	f	f	f
1776	f	f	t
1777	f	f	f
1778	f	f	f
1779	f	f	f
1780	f	t	f
1781	f	f	f
1782	t	f	t
1783	f	f	t
1784	f	f	t
1785	f	t	f
1786	f	f	f
1787	f	f	t
1788	t	f	t
1789	f	f	f
1790	f	t	t
1791	f	t	t
1792	t	f	t
1793	f	f	f
1794	f	f	t
1795	t	f	f
1796	f	f	f
1797	t	f	t
1798	f	f	f
1799	f	f	t
1800	t	f	f
1801	f	f	f
1802	f	f	f
1803	t	f	f
1804	f	f	t
1805	f	t	t
1806	t	f	t
1807	f	f	f
1808	f	f	f
1809	t	f	f
1810	f	f	t
1811	t	f	t
1812	f	f	t
1813	t	f	f
1814	f	f	t
1815	f	f	f
1816	t	t	f
1817	t	f	t
1818	f	f	f
1819	f	f	f
1820	f	t	t
1821	t	f	t
1822	t	f	f
1823	t	f	t
1824	t	f	t
1825	f	f	t
1826	f	f	f
1827	f	f	f
1828	t	f	f
1829	f	f	f
1830	f	f	f
1831	f	f	t
1832	f	f	f
1833	f	t	t
1834	f	f	f
1835	t	f	t
1836	f	f	f
1837	t	f	t
1838	f	f	t
1839	f	t	t
1840	f	f	f
1841	f	f	t
1842	t	f	t
1843	f	f	t
1844	f	f	t
1845	t	f	t
1846	t	f	f
1847	t	f	f
1848	f	t	t
1849	f	f	t
1850	f	f	f
1851	t	f	t
1852	t	f	t
1853	f	t	f
1854	f	f	t
1855	f	f	t
1856	f	f	t
1857	f	t	t
1858	f	f	t
1859	f	t	f
1860	f	t	f
1861	f	f	f
1862	t	f	t
1863	f	f	t
1864	t	f	f
1865	f	f	t
1866	f	f	t
1867	f	f	f
1868	f	f	f
1869	f	f	f
1870	f	f	t
1871	t	f	t
1872	t	f	f
1873	f	f	t
1874	f	t	t
1875	f	f	t
1876	f	f	t
1877	f	f	f
1878	f	t	f
1879	f	f	t
1880	f	f	t
1881	t	f	t
1882	f	f	f
1883	f	f	f
1884	f	f	t
1885	f	f	t
1886	f	f	f
1887	f	f	f
1888	f	f	f
1889	f	f	t
1890	f	f	t
1891	t	f	f
1892	f	f	t
1893	t	f	t
1894	f	f	f
1895	f	f	f
1896	f	f	f
1897	f	f	t
1898	f	t	t
1899	t	f	t
1900	f	t	f
1901	t	f	f
1902	t	f	t
1903	f	f	f
1904	t	t	f
1905	f	f	t
1906	f	t	t
1907	f	f	f
1908	f	f	t
1909	f	f	t
1910	f	f	f
1911	t	f	t
1912	t	f	f
1913	f	t	t
1914	f	f	t
1915	f	f	f
1916	t	f	t
1917	t	t	t
1918	t	f	t
1919	f	f	f
1920	t	f	f
1921	f	f	t
1922	f	f	f
1923	t	f	f
1924	t	f	t
1925	t	f	f
1926	f	f	f
1927	f	f	t
1928	f	f	t
1929	f	f	t
1930	t	f	t
1931	t	f	t
1932	f	t	f
1933	f	f	f
1934	f	f	t
1935	f	f	f
1936	f	f	f
1937	f	f	f
1938	f	f	f
1939	f	f	f
1940	f	f	f
1941	f	f	f
1942	f	f	t
1943	f	t	t
1944	f	f	t
1945	f	f	t
1946	f	f	f
1947	f	f	t
1948	f	f	t
1949	f	f	t
1950	f	f	t
1951	f	f	t
1952	f	t	t
1953	f	f	f
1954	f	f	f
1955	f	f	t
1956	t	f	t
1957	f	f	f
1958	f	f	t
1959	t	f	f
1960	t	f	t
1961	t	f	t
1962	f	f	t
1963	f	f	f
1964	t	f	f
1965	f	t	t
1966	f	f	t
1967	t	f	f
1968	f	f	t
1969	f	f	t
1970	f	f	f
1971	t	f	f
1972	t	t	t
1973	f	f	f
1974	f	f	t
1975	f	t	f
1976	t	f	t
1977	f	f	t
1978	f	f	f
1979	f	f	f
1980	t	t	f
1981	t	f	t
1982	f	f	t
1983	f	f	t
1984	f	f	t
1985	t	f	f
1986	f	f	f
1987	t	f	f
1988	f	f	f
1989	f	f	f
1990	f	f	f
1991	f	f	f
1992	f	f	t
1993	f	f	t
1994	f	f	t
1995	f	f	f
1996	t	f	t
1997	f	f	f
1998	f	f	f
1999	t	f	t
2000	t	f	t
2001	t	f	t
2002	f	t	f
2003	t	f	t
2004	f	f	t
2005	t	f	f
2006	t	f	t
2007	t	f	t
2008	f	f	f
2009	t	t	t
2010	f	f	t
2011	f	f	f
2012	t	f	t
2013	f	f	t
2014	f	f	t
2015	f	f	t
2016	f	f	f
2017	t	f	t
2018	f	f	f
2019	f	f	t
2020	f	f	t
2021	f	t	f
2022	f	f	t
2023	f	f	t
2024	f	f	t
2025	t	f	f
2026	f	t	t
2027	f	f	f
2028	t	f	f
2029	t	f	f
2030	f	f	f
2031	f	f	f
2032	t	f	f
2033	f	t	t
2034	t	f	f
2035	f	f	f
2036	f	f	t
2037	f	f	t
2038	f	f	t
2039	f	f	t
2040	t	f	t
2041	f	t	f
2042	f	f	t
2043	t	f	t
2044	f	f	t
2045	f	f	t
2046	f	f	t
2047	t	f	f
2048	t	t	t
2049	f	f	t
2050	f	f	t
2051	f	f	t
2052	t	f	t
2053	f	f	f
2054	f	f	t
2055	f	f	t
2056	f	f	f
2057	f	f	f
2058	f	f	f
2059	f	f	t
2060	t	f	t
2061	f	f	t
2062	f	f	t
2063	t	f	t
2064	f	f	t
2065	t	f	f
2066	f	f	f
2067	f	f	f
2068	t	f	t
2069	f	f	t
2070	f	f	t
2071	f	f	t
2072	f	f	f
2073	f	f	t
2074	f	f	t
2075	f	f	t
2076	f	f	t
2077	f	f	f
2078	t	f	t
2079	f	f	t
2080	f	f	t
2081	f	f	t
2082	f	t	t
2083	f	f	f
2084	t	t	t
2085	f	f	t
2086	f	f	t
2087	t	f	f
2088	f	f	t
2089	f	f	t
2090	f	f	f
2091	t	f	t
2092	f	f	f
2093	f	f	t
2094	f	f	f
2095	f	f	f
2096	f	f	t
2097	f	f	t
2098	t	f	f
2099	t	f	t
2100	f	f	t
2101	f	f	t
2102	f	f	t
2103	f	f	t
2104	f	f	t
2105	t	f	t
2106	f	f	f
2107	t	f	f
2108	f	f	t
2109	f	f	t
2110	t	t	f
2111	f	f	f
2112	f	f	f
\.


--
-- Name: d_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('d_customers_id_seq', 1, false);


--
-- Data for Name: d_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY d_products (id, productname, price) FROM stdin;
1	Cotton Candy	300
2	Soft Pretzel	300
3	SUPERMEGA SODA CUP	450
4	Prank-o-rama funbag	1000
5	Postcard 5-pak	700
6	T-shirt	1500
\.


--
-- Name: d_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('d_products_id_seq', 1, false);


--
-- Data for Name: d_stores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY d_stores (id, storename) FROM stdin;
1	Valentina's Wacky Funhaus
2	Jeb's Cantina
3	Bill's iShop
4	Bob's Gift Store
5	Front Gate
\.


--
-- Name: d_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('d_stores_id_seq', 1, false);


--
-- Data for Name: f_entrances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY f_entrances (id, timeofentrance, customerid) FROM stdin;
1	09:12:46	1
4	15:15:26	2
7	09:23:39	3
10	09:40:07	4
15	09:16:15	5
16	15:33:17	6
18	09:41:53	7
21	11:46:13	8
25	09:46:17	9
30	15:51:58	10
31	18:34:42	11
33	16:03:03	12
36	13:15:22	13
39	09:25:56	14
42	16:18:15	15
46	09:19:05	16
49	16:41:47	17
52	10:58:18	18
56	09:51:02	19
59	14:35:55	20
62	14:39:36	21
65	13:23:45	22
66	09:37:38	23
71	15:52:33	24
75	09:37:40	25
78	12:07:32	26
79	09:52:56	27
83	12:37:03	28
85	16:17:14	29
89	17:13:37	30
93	15:42:47	31
97	11:50:22	32
100	14:25:21	33
102	09:46:02	34
106	11:38:43	35
110	13:32:41	36
117	16:56:08	37
120	14:33:48	38
121	09:14:36	39
124	09:30:21	40
127	09:32:55	41
130	11:15:07	42
134	18:41:52	43
137	09:17:49	44
142	14:18:13	45
145	09:43:15	46
150	09:48:57	47
153	09:32:01	48
155	09:25:16	49
157	17:15:39	50
158	13:30:16	51
162	15:14:44	52
164	10:07:30	53
167	15:51:02	54
170	17:11:27	55
176	09:26:44	56
179	11:20:36	57
184	11:47:50	58
187	14:38:06	59
194	09:58:04	60
198	10:46:33	61
201	15:09:14	62
203	09:46:11	63
206	13:53:35	64
208	16:28:40	65
214	09:07:12	66
215	14:58:12	67
218	10:44:26	68
220	16:42:33	69
224	16:58:58	70
228	16:46:36	71
232	10:41:15	72
233	13:51:19	73
235	12:44:19	74
238	13:14:33	75
241	17:11:15	76
244	13:23:25	77
247	14:36:14	78
251	13:29:43	79
257	10:30:51	80
260	14:20:13	81
264	09:02:45	82
268	10:51:54	83
269	17:32:07	84
271	17:24:13	85
275	09:08:36	86
277	09:30:56	87
279	09:14:43	88
281	16:02:22	89
284	10:09:54	90
286	16:55:48	91
289	09:09:17	92
290	09:55:11	93
293	09:09:35	94
294	15:02:43	95
296	17:29:17	96
300	09:09:39	97
301	10:29:31	98
306	09:05:44	99
309	10:06:35	100
312	09:49:37	101
316	09:33:30	102
320	09:05:34	103
325	09:17:21	104
327	13:30:26	105
328	09:49:00	106
329	11:39:44	107
330	09:31:46	108
333	09:57:52	109
335	12:24:39	110
337	18:10:02	111
341	14:47:02	112
344	10:36:44	113
348	09:00:40	114
352	09:34:40	115
356	18:39:09	116
357	12:48:25	117
359	10:19:22	118
361	14:22:08	119
364	11:39:45	120
367	18:22:08	121
369	09:25:40	122
370	16:58:41	123
371	11:27:10	124
374	09:42:07	125
376	10:27:45	126
378	14:39:38	127
383	17:26:08	128
386	17:13:25	129
388	12:06:13	130
389	09:08:48	131
392	09:03:58	132
396	09:14:32	133
397	14:10:19	134
398	17:57:28	135
402	11:43:26	136
405	11:12:06	137
406	11:58:36	138
407	09:27:15	139
409	09:38:46	140
413	13:03:40	141
414	16:50:15	142
418	09:13:44	143
421	14:59:26	144
425	09:59:05	145
429	12:20:46	146
432	15:24:52	147
433	16:42:27	148
434	15:18:27	149
440	09:05:53	150
441	09:07:18	151
445	11:13:25	152
448	09:12:31	153
453	09:48:50	154
455	10:53:49	155
456	09:58:12	156
459	09:10:35	157
463	16:35:22	158
467	09:32:53	159
468	09:46:35	160
471	12:33:16	161
473	11:12:42	162
476	09:33:55	163
480	12:39:52	164
483	15:51:59	165
486	13:09:03	166
491	09:28:45	167
494	09:30:10	168
496	09:36:31	169
500	12:25:28	170
503	13:04:12	171
505	11:10:07	172
508	13:32:46	173
510	16:50:45	174
514	09:28:12	175
517	16:28:56	176
523	11:34:58	177
527	16:36:55	178
530	09:53:54	179
535	09:02:06	180
536	15:18:40	181
537	13:50:31	182
539	17:09:29	183
542	09:35:09	184
543	09:20:39	185
547	09:55:56	186
550	09:30:34	187
552	16:13:23	188
557	09:28:40	189
559	09:27:46	190
560	09:04:28	191
562	11:54:19	192
565	10:39:50	193
567	17:10:24	194
568	09:01:31	195
571	09:05:58	196
573	09:39:51	197
576	09:17:41	198
577	16:33:39	199
579	09:17:59	200
583	16:10:35	201
586	12:31:06	202
589	14:16:02	203
590	11:35:17	204
591	15:31:42	205
592	11:56:17	206
597	09:47:48	207
602	16:10:45	208
604	09:20:47	209
607	09:59:49	210
608	09:48:17	211
612	18:45:49	212
614	16:42:11	213
615	09:56:00	214
620	09:31:16	215
622	09:55:47	216
624	17:55:02	217
626	09:19:38	218
627	09:38:23	219
631	09:03:49	220
636	10:51:27	221
638	09:54:22	222
639	16:19:33	223
642	14:12:34	224
646	11:19:56	225
648	09:23:10	226
651	09:03:51	227
654	11:12:42	228
659	15:17:12	229
661	12:01:28	230
665	09:40:45	231
668	09:36:45	232
671	16:41:52	233
672	09:26:33	234
677	09:20:33	235
678	09:20:39	236
684	18:23:53	237
687	11:43:48	238
690	14:35:58	239
693	13:43:25	240
695	09:22:57	241
698	09:48:06	242
702	09:04:44	243
707	14:40:13	244
709	09:41:48	245
713	12:19:41	246
715	09:51:24	247
717	09:13:25	248
722	09:26:12	249
725	09:36:12	250
727	09:41:17	251
729	14:32:38	252
732	14:26:08	253
734	17:18:00	254
736	09:14:09	255
739	12:45:15	256
742	09:40:40	257
743	09:37:55	258
746	17:09:12	259
747	09:14:40	260
749	16:51:54	261
753	09:26:41	262
756	18:03:37	263
758	17:41:34	264
762	17:03:04	265
765	15:33:41	266
769	09:26:13	267
772	09:41:48	268
776	15:58:48	269
779	12:32:40	270
781	16:09:43	271
785	09:24:33	272
788	11:12:37	273
789	17:44:40	274
792	12:49:02	275
797	09:05:15	276
802	09:41:01	277
805	09:27:55	278
808	14:33:28	279
810	09:47:04	280
814	09:09:32	281
817	09:50:35	282
821	15:14:22	283
822	09:44:01	284
823	13:05:10	285
824	17:45:38	286
829	13:31:59	287
832	09:23:27	288
835	11:13:24	289
838	09:51:42	290
843	09:33:53	291
844	09:39:25	292
847	09:27:58	293
849	15:36:26	294
853	16:04:10	295
856	09:32:15	296
859	13:07:06	297
862	09:50:01	298
867	11:25:00	299
870	09:28:31	300
875	18:08:23	301
878	09:32:51	302
881	14:32:45	303
882	09:19:40	304
885	09:47:58	305
888	13:37:26	306
891	14:28:45	307
894	09:10:28	308
898	15:19:12	309
899	09:32:23	310
903	10:22:54	311
906	09:53:53	312
910	13:54:25	313
915	18:14:54	314
916	13:58:38	315
920	09:22:48	316
923	09:05:08	317
925	14:14:51	318
928	17:08:19	319
931	12:02:19	320
934	11:12:11	321
937	09:52:50	322
939	13:24:17	323
943	14:58:40	324
945	17:48:54	325
950	15:27:32	326
951	12:31:09	327
957	15:56:00	328
963	16:00:37	329
965	09:02:33	330
968	11:23:37	331
972	18:33:32	332
975	14:16:39	333
978	13:15:26	334
982	15:28:09	335
984	09:10:36	336
988	09:01:47	337
991	12:51:35	338
993	14:23:22	339
996	09:43:01	340
1000	11:17:39	341
1002	10:38:21	342
1006	14:25:36	343
1008	10:27:43	344
1010	13:50:02	345
1013	12:14:53	346
1015	17:07:20	347
1017	15:55:19	348
1019	13:25:50	349
1022	09:34:12	350
1024	14:23:03	351
1026	14:45:58	352
1030	09:03:56	353
1032	09:28:34	354
1033	16:50:49	355
1034	15:18:15	356
1038	10:16:22	357
1040	17:04:17	358
1042	13:07:19	359
1045	16:19:14	360
1048	09:50:05	361
1050	12:35:47	362
1055	17:37:22	363
1059	09:39:53	364
1062	16:56:30	365
1065	13:33:33	366
1070	11:32:49	367
1074	10:21:24	368
1075	09:46:25	369
1078	09:39:44	370
1080	09:17:22	371
1082	15:13:26	372
1085	10:10:08	373
1088	09:34:40	374
1092	13:29:14	375
1093	09:24:39	376
1095	09:47:46	377
1098	13:42:34	378
1101	15:23:38	379
1104	09:14:34	380
1105	09:29:41	381
1106	11:08:13	382
1107	13:38:44	383
1111	09:09:11	384
1115	17:25:46	385
1118	12:11:14	386
1120	09:19:42	387
1122	16:05:10	388
1128	14:27:10	389
1131	09:48:53	390
1137	17:32:27	391
1141	09:58:44	392
1145	09:24:33	393
1146	09:01:30	394
1149	09:03:56	395
1150	12:39:43	396
1151	09:23:28	397
1157	09:59:05	398
1159	13:47:47	399
1162	16:41:46	400
1164	10:49:29	401
1166	09:06:10	402
1170	14:08:30	403
1172	14:13:36	404
1174	15:12:16	405
1175	10:02:54	406
1178	16:03:12	407
1180	09:21:40	408
1183	12:57:02	409
1186	09:02:56	410
1190	17:32:07	411
1193	17:47:24	412
1195	17:05:34	413
1196	17:29:22	414
1198	09:10:02	415
1201	10:32:23	416
1205	09:30:36	417
1208	13:31:30	418
1210	18:22:21	419
1213	09:11:48	420
1216	10:05:15	421
1220	12:02:26	422
1221	13:16:35	423
1225	11:58:05	424
1227	09:08:48	425
1230	14:34:05	426
1234	09:50:08	427
1237	13:14:56	428
1239	13:37:55	429
1241	11:13:27	430
1242	11:00:51	431
1246	09:54:18	432
1249	09:33:54	433
1250	09:09:04	434
1254	18:53:24	435
1257	10:36:56	436
1258	09:07:53	437
1262	12:20:35	438
1263	15:46:32	439
1267	12:35:20	440
1270	16:51:51	441
1273	11:04:17	442
1276	17:23:37	443
1279	13:51:21	444
1280	09:56:05	445
1282	09:53:54	446
1284	09:18:17	447
1287	09:07:24	448
1292	09:55:38	449
1296	11:36:03	450
1298	09:27:31	451
1302	09:39:21	452
1304	13:09:44	453
1308	15:28:03	454
1312	17:50:07	455
1316	13:20:55	456
1318	09:01:07	457
1319	09:32:04	458
1322	14:55:03	459
1324	09:07:19	460
1326	09:43:16	461
1328	09:06:48	462
1330	11:30:26	463
1333	15:18:12	464
1336	17:45:57	465
1339	13:22:53	466
1341	12:09:49	467
1345	09:15:43	468
1348	13:32:47	469
1349	09:22:50	470
1352	13:51:25	471
1353	09:11:31	472
1354	09:46:21	473
1356	10:33:22	474
1360	09:25:04	475
1364	09:20:12	476
1365	16:11:40	477
1368	13:49:04	478
1372	12:12:58	479
1375	18:55:30	480
1379	09:05:15	481
1380	12:10:02	482
1384	09:31:44	483
1386	09:39:41	484
1390	17:38:57	485
1394	13:22:18	486
1397	09:49:14	487
1401	17:25:23	488
1404	09:42:29	489
1405	15:24:49	490
1408	18:11:18	491
1410	09:06:05	492
1414	09:50:07	493
1415	16:51:23	494
1418	15:57:34	495
1420	11:48:09	496
1423	09:27:07	497
1424	09:42:17	498
1425	09:14:01	499
1429	09:44:06	500
1433	16:26:28	501
1436	14:58:30	502
1439	09:11:04	503
1441	13:36:07	504
1446	09:18:33	505
1448	09:52:20	506
1450	09:44:17	507
1455	12:32:35	508
1459	09:03:38	509
1462	09:32:47	510
1468	09:52:17	511
1473	18:04:45	512
1475	16:16:39	513
1478	18:30:38	514
1480	09:40:08	515
1481	09:46:01	516
1484	09:34:10	517
1486	14:11:25	518
1488	17:42:48	519
1491	16:53:36	520
1495	09:54:26	521
1496	09:48:30	522
1500	14:06:10	523
1503	16:34:01	524
1506	12:23:35	525
1509	09:18:18	526
1510	13:12:25	527
1511	17:37:49	528
1514	11:46:33	529
1518	11:14:53	530
1521	17:38:40	531
1525	09:58:05	532
1526	15:51:51	533
1529	13:34:41	534
1531	11:46:08	535
1534	14:11:58	536
1538	09:48:30	537
1539	09:39:25	538
1542	16:34:04	539
1543	18:12:07	540
1546	18:44:16	541
1547	12:48:17	542
1549	09:05:20	543
1552	09:36:55	544
1554	09:35:01	545
1555	17:41:38	546
1559	09:15:40	547
1562	15:57:04	548
1568	09:51:31	549
1571	16:44:28	550
1574	16:55:09	551
1576	16:40:28	552
1579	09:26:32	553
1583	13:13:27	554
1584	11:20:20	555
1588	14:58:47	556
1590	16:14:54	557
1593	14:57:05	558
1597	09:03:46	559
1598	09:03:34	560
1602	11:34:57	561
1606	14:11:36	562
1607	17:15:38	563
1608	09:07:26	564
1612	10:44:33	565
1616	10:04:41	566
1620	09:48:52	567
1623	18:58:12	568
1627	15:58:11	569
1632	10:41:11	570
1635	11:34:11	571
1639	09:13:12	572
1642	12:43:24	573
1645	14:40:23	574
1648	12:02:55	575
1651	15:14:22	576
1653	10:23:36	577
1656	09:21:36	578
1659	12:27:06	579
1665	18:40:46	580
1669	10:48:48	581
1673	09:16:24	582
1676	16:22:27	583
1677	09:54:09	584
1678	11:12:40	585
1683	12:57:32	586
1684	09:10:54	587
1686	09:49:58	588
1690	15:21:52	589
1693	18:47:12	590
1696	13:46:07	591
1698	09:31:26	592
1704	14:13:58	593
1708	09:49:02	594
1711	09:51:23	595
1714	09:53:12	596
1715	13:35:33	597
1717	09:08:54	598
1718	09:19:44	599
1720	09:24:29	600
1724	09:53:06	601
1726	09:28:55	602
1727	16:34:18	603
1731	09:18:46	604
1736	15:10:27	605
1740	14:08:43	606
1744	13:10:41	607
1747	13:35:21	608
1750	12:01:33	609
1754	12:17:53	610
1756	09:33:17	611
1758	10:07:07	612
1762	14:55:52	613
1765	09:08:45	614
1766	09:36:24	615
1769	09:43:49	616
1772	09:26:16	617
1775	14:04:02	618
1778	15:47:08	619
1781	16:34:54	620
1785	16:16:02	621
1786	12:42:46	622
1788	09:22:23	623
1789	16:45:50	624
1795	12:13:07	625
1797	09:05:14	626
1801	09:49:16	627
1805	09:13:28	628
1808	09:12:54	629
1811	18:19:32	630
1817	13:17:30	631
1819	17:36:32	632
1822	09:36:36	633
1825	11:22:50	634
1828	16:37:03	635
1832	15:51:27	636
1837	13:39:27	637
1838	15:10:29	638
1839	09:16:44	639
1842	09:31:19	640
1845	10:18:35	641
1848	13:43:28	642
1850	14:46:01	643
1855	09:35:50	644
1860	09:00:17	645
1862	09:46:06	646
1865	16:02:39	647
1868	13:40:54	648
1869	17:26:27	649
1870	14:45:48	650
1871	09:02:16	651
1873	16:24:18	652
1879	13:39:32	653
1883	15:12:34	654
1884	12:43:04	655
1887	17:05:23	656
1889	11:30:51	657
1891	17:35:58	658
1893	11:11:57	659
1897	09:57:22	660
1899	15:29:56	661
1901	17:14:21	662
1903	13:17:38	663
1906	16:49:08	664
1910	09:26:05	665
1913	12:40:07	666
1916	16:59:50	667
1919	09:16:25	668
1921	09:13:17	669
1927	09:35:27	670
1928	09:48:12	671
1930	14:50:06	672
1932	17:06:08	673
1936	09:27:01	674
1939	17:03:48	675
1943	12:25:43	676
1944	13:01:35	677
1947	14:03:28	678
1949	09:56:07	679
1955	09:56:58	680
1958	17:34:50	681
1961	17:52:31	682
1964	09:50:11	683
1967	14:38:48	684
1969	12:01:12	685
1972	09:55:28	686
1976	12:48:39	687
1978	14:42:14	688
1982	09:36:24	689
1984	09:29:48	690
1986	09:44:27	691
1990	14:21:17	692
1992	13:13:52	693
1994	14:38:31	694
1995	15:58:51	695
1998	11:14:41	696
2001	11:55:04	697
2003	09:02:31	698
2007	09:50:51	699
2010	13:26:10	700
2011	09:28:56	701
2014	16:24:43	702
2015	11:47:15	703
2018	10:20:22	704
2020	09:12:38	705
2022	09:54:07	706
2024	16:35:07	707
2029	09:18:32	708
2030	11:23:32	709
2033	15:53:52	710
2035	09:10:32	711
2036	17:49:34	712
2038	11:37:12	713
2039	14:41:39	714
2041	09:49:36	715
2044	09:18:18	716
2046	09:36:21	717
2050	14:47:43	718
2053	09:41:06	719
2054	09:57:26	720
2056	09:09:05	721
2061	14:53:02	722
2062	09:25:10	723
2066	09:53:01	724
2069	12:29:47	725
2073	09:52:36	726
2074	09:47:48	727
2076	09:25:32	728
2079	13:50:37	729
2080	09:27:19	730
2084	17:56:52	731
2086	14:11:54	732
2091	12:08:03	733
2093	09:12:12	734
2095	11:50:16	735
2099	09:13:55	736
2101	09:46:53	737
2104	15:50:26	738
2108	14:21:37	739
2111	13:29:20	740
2113	13:26:17	741
2114	13:08:15	742
2117	09:27:25	743
2121	09:51:30	744
2122	13:47:01	745
2123	16:30:35	746
2126	16:48:16	747
2128	09:03:37	748
2132	15:58:08	749
2137	09:03:03	750
2142	09:50:16	751
2145	14:58:41	752
2147	11:12:38	753
2151	13:31:32	754
2152	09:15:52	755
2156	09:41:37	756
2159	11:43:02	757
2160	10:56:23	758
2164	12:53:17	759
2168	09:51:16	760
2171	09:22:22	761
2175	09:02:10	762
2178	09:00:26	763
2181	09:58:15	764
2182	16:35:49	765
2184	09:31:25	766
2187	16:46:11	767
2188	09:39:41	768
2190	11:38:56	769
2194	16:19:38	770
2199	10:57:05	771
2202	14:27:44	772
2204	11:07:24	773
2207	14:18:55	774
2209	13:17:18	775
2213	17:32:54	776
2215	10:17:45	777
2220	11:38:09	778
2222	09:11:31	779
2226	15:52:34	780
2228	11:22:00	781
2231	09:53:39	782
2232	13:51:39	783
2236	11:49:19	784
2237	15:39:08	785
2239	15:54:04	786
2242	09:41:40	787
2245	09:12:00	788
2249	18:23:22	789
2252	09:04:12	790
2254	14:27:25	791
2257	15:19:50	792
2262	12:45:34	793
2266	11:05:38	794
2271	09:57:08	795
2274	17:27:42	796
2277	11:51:54	797
2280	09:24:31	798
2284	17:07:55	799
2287	09:24:54	800
2290	14:11:25	801
2295	18:31:31	802
2298	13:42:54	803
2299	17:43:40	804
2300	12:09:02	805
2304	12:02:01	806
2307	16:45:18	807
2311	12:17:45	808
2317	09:02:18	809
2321	09:12:36	810
2322	14:44:56	811
2327	15:45:14	812
2330	12:11:31	813
2332	09:22:51	814
2337	09:12:52	815
2339	09:28:42	816
2343	14:18:02	817
2345	16:48:09	818
2348	09:11:49	819
2351	13:30:35	820
2354	17:01:11	821
2356	09:44:12	822
2360	09:18:57	823
2361	15:24:08	824
2362	09:18:38	825
2363	14:56:13	826
2365	17:39:29	827
2370	15:03:06	828
2374	18:40:30	829
2376	11:46:44	830
2377	09:19:53	831
2383	09:20:33	832
2384	09:01:54	833
2385	16:44:43	834
2387	17:30:11	835
2389	15:44:07	836
2390	12:52:34	837
2395	09:39:34	838
2398	09:17:31	839
2400	10:53:46	840
2404	16:57:12	841
2406	09:41:20	842
2410	14:40:45	843
2412	09:56:45	844
2416	09:43:53	845
2420	12:25:53	846
2422	14:25:02	847
2426	14:50:30	848
2430	15:08:36	849
2434	09:11:55	850
2435	17:35:32	851
2439	14:22:24	852
2443	09:40:09	853
2445	09:19:13	854
2449	09:18:33	855
2452	09:07:27	856
2455	12:20:56	857
2459	15:24:40	858
2462	16:18:35	859
2465	11:40:53	860
2469	09:15:05	861
2473	12:02:00	862
2475	13:12:27	863
2482	14:00:13	864
2486	09:05:10	865
2488	11:20:43	866
2491	18:53:40	867
2495	10:17:04	868
2498	09:31:22	869
2503	15:45:28	870
2506	09:29:54	871
2510	13:07:23	872
2511	12:12:45	873
2513	09:50:00	874
2516	13:57:06	875
2519	14:20:28	876
2523	13:41:12	877
2524	15:04:10	878
2526	16:15:51	879
2528	09:36:36	880
2531	10:11:07	881
2532	11:18:32	882
2535	15:40:45	883
2538	17:36:26	884
2541	09:55:35	885
2544	09:46:52	886
2547	09:38:55	887
2550	09:26:23	888
2552	18:25:54	889
2556	17:54:44	890
2560	09:42:13	891
2564	09:45:58	892
2567	09:49:31	893
2570	09:57:05	894
2574	09:32:33	895
2576	16:45:33	896
2578	12:31:06	897
2579	09:42:38	898
2586	18:06:56	899
2587	17:50:20	900
2590	10:46:49	901
2591	15:25:07	902
2593	09:36:01	903
2595	18:03:09	904
2598	16:17:42	905
2600	14:02:03	906
2602	10:53:36	907
2605	09:53:47	908
2607	09:28:17	909
2610	09:51:01	910
2615	09:46:26	911
2617	11:47:17	912
2620	14:43:22	913
2621	09:18:58	914
2623	10:19:47	915
2625	10:33:31	916
2632	11:15:05	917
2634	11:08:47	918
2636	17:19:23	919
2639	11:49:44	920
2641	11:11:18	921
2645	09:50:47	922
2647	09:16:31	923
2649	15:13:37	924
2651	15:12:56	925
2655	18:12:31	926
2657	14:24:51	927
2661	15:14:39	928
2665	17:14:40	929
2666	18:53:53	930
2669	09:12:38	931
2672	15:13:25	932
2673	09:29:24	933
2675	09:02:20	934
2676	17:52:40	935
2680	17:24:29	936
2684	09:49:14	937
2685	09:36:47	938
2687	09:31:31	939
2689	09:39:30	940
2691	09:47:07	941
2695	09:42:10	942
2700	09:20:11	943
2703	09:21:15	944
2706	15:44:04	945
2709	09:52:39	946
2712	12:46:20	947
2713	12:00:34	948
2714	09:29:21	949
2717	09:06:52	950
2722	09:22:49	951
2725	15:51:43	952
2726	09:39:53	953
2728	09:46:57	954
2730	11:19:08	955
2732	09:03:05	956
2736	14:29:12	957
2739	14:39:25	958
2743	11:19:03	959
2746	15:25:57	960
2748	11:18:53	961
2750	09:06:57	962
2755	14:04:46	963
2757	17:16:16	964
2760	15:46:33	965
2764	11:08:21	966
2767	12:17:18	967
2769	10:43:47	968
2773	09:09:49	969
2776	09:48:08	970
2778	09:17:26	971
2781	10:55:26	972
2785	11:55:20	973
2789	17:21:06	974
2790	15:35:35	975
2794	12:07:28	976
2797	16:21:51	977
2798	10:18:43	978
2802	15:38:20	979
2807	16:15:18	980
2811	13:06:48	981
2812	09:22:36	982
2813	13:04:36	983
2817	09:28:41	984
2822	14:48:48	985
2824	13:08:26	986
2827	10:19:28	987
2829	11:07:32	988
2833	09:33:33	989
2838	10:47:22	990
2842	16:07:14	991
2843	13:54:09	992
2845	11:38:31	993
2848	12:18:42	994
2852	13:04:21	995
2857	09:54:19	996
2863	12:52:17	997
2866	17:30:43	998
2869	11:29:32	999
2870	09:14:33	1000
2874	09:39:57	1001
2877	15:08:51	1002
2880	13:49:18	1003
2884	09:39:48	1004
2887	15:57:06	1005
2892	12:28:44	1006
2895	10:25:15	1007
2900	09:46:31	1008
2901	13:58:39	1009
2902	11:44:39	1010
2904	16:05:31	1011
2906	09:57:17	1012
2908	09:28:00	1013
2911	16:23:22	1014
2913	09:57:23	1015
2915	13:53:04	1016
2918	09:33:04	1017
2919	09:58:35	1018
2923	17:53:40	1019
2927	18:44:30	1020
2930	09:26:08	1021
2934	10:05:19	1022
2936	16:18:07	1023
2937	09:38:24	1024
2941	11:57:00	1025
2944	17:30:32	1026
2947	13:50:57	1027
2950	09:08:51	1028
2953	09:47:01	1029
2958	14:32:21	1030
2962	09:40:58	1031
2966	09:24:40	1032
2969	16:37:50	1033
2972	17:01:05	1034
2973	14:49:27	1035
2976	16:42:01	1036
2978	17:20:49	1037
2982	17:23:05	1038
2987	10:23:49	1039
2991	09:13:42	1040
2994	09:08:36	1041
2998	11:46:39	1042
3000	13:53:16	1043
3003	11:09:58	1044
3007	15:36:30	1045
3013	12:22:25	1046
3016	09:24:19	1047
3018	09:53:27	1048
3019	17:48:43	1049
3022	15:30:52	1050
3025	09:16:15	1051
3026	18:06:31	1052
3029	17:51:22	1053
3030	12:17:27	1054
3034	12:15:11	1055
3039	09:08:16	1056
3043	11:50:48	1057
3045	09:36:39	1058
3047	09:05:26	1059
3049	12:52:54	1060
3051	09:19:10	1061
3054	12:11:24	1062
3059	15:49:33	1063
3065	13:44:24	1064
3070	18:13:24	1065
3073	15:24:09	1066
3076	09:27:54	1067
3079	09:24:12	1068
3080	09:02:36	1069
3081	14:07:24	1070
3083	15:06:57	1071
3086	09:57:31	1072
3089	13:56:17	1073
3091	17:29:26	1074
3092	16:12:57	1075
3095	16:33:13	1076
3098	09:10:59	1077
3100	09:34:50	1078
3103	10:36:24	1079
3105	13:20:15	1080
3107	15:28:04	1081
3110	09:22:44	1082
3111	09:41:21	1083
3114	12:56:01	1084
3118	18:25:47	1085
3122	14:42:22	1086
3123	09:18:57	1087
3125	09:22:24	1088
3127	13:07:52	1089
3130	09:08:46	1090
3132	09:01:43	1091
3133	11:42:30	1092
3137	11:21:28	1093
3139	09:50:28	1094
3140	10:29:48	1095
3143	09:46:22	1096
3146	18:23:55	1097
3147	09:16:39	1098
3152	09:17:26	1099
3156	09:45:55	1100
3160	09:38:43	1101
3162	16:46:14	1102
3164	09:32:09	1103
3167	18:31:54	1104
3168	09:54:34	1105
3173	16:33:38	1106
3175	12:46:10	1107
3176	09:41:29	1108
3178	09:25:40	1109
3179	18:06:48	1110
3184	09:04:38	1111
3186	15:57:18	1112
3189	13:12:44	1113
3190	14:41:07	1114
3194	14:22:53	1115
3195	10:01:17	1116
3198	09:10:33	1117
3199	11:26:35	1118
3202	15:45:39	1119
3206	09:51:05	1120
3210	15:24:51	1121
3214	16:47:16	1122
3215	13:15:28	1123
3218	11:34:18	1124
3222	09:47:33	1125
3226	11:19:16	1126
3230	10:21:07	1127
3233	18:02:45	1128
3236	17:32:49	1129
3237	09:03:33	1130
3238	09:39:51	1131
3239	18:43:36	1132
3244	17:43:42	1133
3248	13:03:39	1134
3252	15:46:16	1135
3254	17:12:47	1136
3255	16:55:17	1137
3257	17:38:14	1138
3259	09:11:01	1139
3263	15:35:17	1140
3267	11:18:47	1141
3271	14:34:03	1142
3277	12:47:23	1143
3281	13:03:35	1144
3283	12:32:05	1145
3286	15:26:36	1146
3288	11:18:29	1147
3289	09:38:34	1148
3293	13:49:25	1149
3298	09:35:50	1150
3302	09:24:13	1151
3304	09:55:21	1152
3307	09:52:56	1153
3311	16:38:39	1154
3315	15:38:16	1155
3317	09:00:26	1156
3322	16:24:03	1157
3327	17:19:57	1158
3331	17:57:13	1159
3335	09:54:41	1160
3339	09:04:53	1161
3341	09:55:22	1162
3344	09:26:36	1163
3347	11:47:43	1164
3350	12:53:36	1165
3352	18:26:46	1166
3355	18:47:29	1167
3357	13:18:07	1168
3361	14:30:14	1169
3365	12:41:10	1170
3369	10:15:50	1171
3371	09:40:49	1172
3374	17:07:25	1173
3378	14:12:21	1174
3380	18:02:53	1175
3385	09:06:22	1176
3389	12:46:16	1177
3390	09:56:44	1178
3391	12:20:37	1179
3393	12:58:46	1180
3397	09:50:12	1181
3400	10:33:57	1182
3402	09:18:11	1183
3403	09:40:03	1184
3406	12:06:12	1185
3411	14:51:50	1186
3414	09:29:28	1187
3417	15:09:45	1188
3419	15:28:45	1189
3423	15:57:45	1190
3426	14:17:18	1191
3430	12:17:53	1192
3433	09:50:58	1193
3437	15:34:22	1194
3442	10:48:40	1195
3445	12:42:35	1196
3452	09:27:13	1197
3454	12:29:44	1198
3458	12:34:29	1199
3459	09:28:27	1200
3463	09:47:07	1201
3466	15:34:44	1202
3469	12:36:19	1203
3473	17:40:35	1204
3476	12:01:06	1205
3477	16:03:39	1206
3479	12:46:14	1207
3482	11:37:14	1208
3483	15:00:36	1209
3486	18:33:08	1210
3489	14:45:02	1211
3492	12:36:14	1212
3494	11:47:18	1213
3497	09:20:54	1214
3498	09:16:59	1215
3501	11:38:30	1216
3505	18:58:55	1217
3507	13:41:17	1218
3510	18:37:28	1219
3513	11:46:27	1220
3516	10:33:49	1221
3519	18:48:04	1222
3521	09:17:18	1223
3524	13:41:21	1224
3528	09:33:56	1225
3532	09:26:47	1226
3535	09:43:56	1227
3537	11:51:56	1228
3540	09:35:16	1229
3545	09:22:27	1230
3547	09:22:30	1231
3549	12:47:59	1232
3553	15:46:23	1233
3557	16:58:52	1234
3560	09:17:51	1235
3562	15:47:07	1236
3565	09:45:06	1237
3568	16:32:05	1238
3571	09:56:28	1239
3576	09:19:56	1240
3580	09:38:06	1241
3582	11:37:12	1242
3585	17:32:52	1243
3588	09:39:18	1244
3592	09:13:46	1245
3595	09:37:55	1246
3597	13:11:47	1247
3601	10:02:14	1248
3602	10:44:18	1249
3604	11:15:59	1250
3607	09:37:54	1251
3609	09:06:21	1252
3611	15:45:31	1253
3613	16:40:36	1254
3616	10:44:30	1255
3617	09:57:50	1256
3621	13:40:13	1257
3623	10:41:44	1258
3628	13:05:19	1259
3632	09:28:10	1260
3634	14:47:43	1261
3637	15:49:56	1262
3640	13:33:20	1263
3645	11:14:14	1264
3650	09:29:56	1265
3652	11:30:10	1266
3654	10:21:58	1267
3656	15:27:21	1268
3658	12:00:22	1269
3661	09:40:24	1270
3665	18:49:25	1271
3666	14:34:55	1272
3667	09:42:16	1273
3671	09:47:13	1274
3672	17:30:53	1275
3675	14:02:11	1276
3678	09:19:41	1277
3681	18:29:37	1278
3684	12:48:10	1279
3686	17:26:39	1280
3688	11:01:50	1281
3694	10:11:53	1282
3697	09:35:55	1283
3702	09:15:25	1284
3703	14:10:46	1285
3708	09:49:53	1286
3710	09:24:57	1287
3712	09:17:20	1288
3715	09:16:40	1289
3722	09:27:49	1290
3725	09:15:07	1291
3729	09:35:39	1292
3731	13:12:44	1293
3736	14:05:03	1294
3742	09:28:08	1295
3746	09:56:22	1296
3750	16:56:30	1297
3752	15:28:53	1298
3753	13:58:29	1299
3754	09:52:31	1300
3755	13:39:28	1301
3758	09:50:09	1302
3760	11:14:48	1303
3763	14:05:28	1304
3766	10:24:26	1305
3767	17:03:08	1306
3770	09:24:56	1307
3773	17:11:16	1308
3778	09:09:10	1309
3781	12:06:10	1310
3785	10:33:53	1311
3787	16:53:39	1312
3788	09:08:37	1313
3793	09:55:50	1314
3797	09:28:13	1315
3800	09:32:28	1316
3803	15:54:22	1317
3809	09:51:35	1318
3812	15:30:00	1319
3815	09:55:09	1320
3816	09:29:08	1321
3818	09:17:32	1322
3822	09:43:32	1323
3826	18:53:09	1324
3828	13:54:48	1325
3829	11:55:13	1326
3831	10:04:25	1327
3834	16:38:01	1328
3837	15:58:40	1329
3843	14:50:58	1330
3848	09:32:23	1331
3852	09:13:06	1332
3854	09:21:05	1333
3855	13:00:47	1334
3860	11:27:09	1335
3865	14:04:55	1336
3868	15:16:30	1337
3870	17:08:22	1338
3873	11:05:44	1339
3875	11:21:38	1340
3879	09:27:13	1341
3882	17:48:01	1342
3888	09:37:24	1343
3890	09:43:28	1344
3894	09:07:02	1345
3896	17:32:49	1346
3901	13:27:51	1347
3906	16:39:10	1348
3910	13:14:13	1349
3912	09:20:25	1350
3915	09:16:32	1351
3916	09:10:40	1352
3920	11:27:46	1353
3922	17:09:15	1354
3925	11:24:38	1355
3926	09:23:17	1356
3928	18:40:04	1357
3931	09:45:51	1358
3932	18:32:22	1359
3935	09:20:55	1360
3939	09:58:01	1361
3944	09:49:21	1362
3947	09:41:33	1363
3949	09:43:16	1364
3950	11:03:43	1365
3953	09:08:05	1366
3954	09:34:55	1367
3956	15:28:52	1368
3959	09:06:49	1369
3963	18:39:33	1370
3965	09:57:53	1371
3967	09:44:29	1372
3969	15:17:42	1373
3972	14:57:18	1374
3973	09:47:05	1375
3974	17:10:32	1376
3976	14:39:57	1377
3981	15:37:07	1378
3982	09:16:15	1379
3983	18:57:47	1380
3985	13:38:27	1381
3989	16:11:07	1382
3990	13:56:43	1383
3991	09:10:11	1384
3994	16:04:23	1385
3999	11:32:54	1386
4002	14:46:56	1387
4006	09:36:32	1388
4009	14:28:29	1389
4012	09:18:13	1390
4013	09:18:47	1391
4016	09:09:29	1392
4022	09:39:36	1393
4024	13:18:50	1394
4028	13:39:09	1395
4030	09:52:52	1396
4031	14:36:47	1397
4033	09:49:15	1398
4037	16:41:16	1399
4039	09:35:43	1400
4041	09:48:44	1401
4045	15:36:05	1402
4048	09:58:11	1403
4051	09:31:11	1404
4054	09:51:35	1405
4057	15:04:30	1406
4060	09:45:25	1407
4061	09:14:00	1408
4064	09:02:32	1409
4067	14:56:24	1410
4071	09:17:27	1411
4073	18:14:45	1412
4077	13:55:28	1413
4080	15:43:31	1414
4083	09:34:29	1415
4088	10:47:36	1416
4090	13:50:02	1417
4094	09:29:06	1418
4098	16:40:05	1419
4099	09:39:28	1420
4102	09:20:29	1421
4105	09:33:51	1422
4108	09:21:22	1423
4110	11:04:36	1424
4112	09:04:25	1425
4116	15:28:34	1426
4121	09:04:51	1427
4124	09:29:04	1428
4127	09:08:11	1429
4129	13:26:25	1430
4133	17:33:26	1431
4137	09:40:53	1432
4143	14:54:53	1433
4144	09:51:35	1434
4148	10:29:18	1435
4149	12:52:09	1436
4151	11:32:43	1437
4154	11:08:32	1438
4158	09:25:32	1439
4163	09:44:16	1440
4166	16:09:09	1441
4168	09:01:11	1442
4171	09:00:53	1443
4173	13:20:58	1444
4176	16:13:44	1445
4177	09:31:37	1446
4180	09:59:10	1447
4183	15:33:13	1448
4187	09:17:52	1449
4192	15:15:25	1450
4195	10:58:18	1451
4197	09:13:21	1452
4201	18:02:21	1453
4204	16:44:43	1454
4207	11:02:15	1455
4210	10:57:28	1456
4213	09:37:12	1457
4217	11:55:27	1458
4219	09:22:11	1459
4223	14:21:08	1460
4226	09:14:28	1461
4228	09:42:04	1462
4232	16:23:41	1463
4235	11:24:27	1464
4237	09:28:28	1465
4239	16:26:31	1466
4244	16:45:20	1467
4247	11:30:53	1468
4250	16:45:04	1469
4256	16:11:21	1470
4260	18:29:28	1471
4266	17:03:16	1472
4270	14:47:45	1473
4275	09:40:51	1474
4276	09:21:26	1475
4278	14:24:16	1476
4283	18:06:02	1477
4284	18:11:33	1478
4289	09:23:50	1479
4291	11:18:09	1480
4295	09:37:29	1481
4298	15:48:50	1482
4299	09:12:07	1483
4302	12:27:25	1484
4303	15:40:39	1485
4308	09:54:06	1486
4311	09:20:07	1487
4315	15:11:32	1488
4320	16:23:33	1489
4323	16:51:27	1490
4326	09:12:48	1491
4329	09:59:26	1492
4332	17:24:52	1493
4334	09:09:55	1494
4340	15:26:57	1495
4345	16:46:15	1496
4348	12:03:50	1497
4349	13:41:37	1498
4354	09:46:50	1499
4355	17:05:20	1500
4356	09:30:43	1501
4359	09:43:17	1502
4362	13:04:56	1503
4365	11:50:02	1504
4366	09:54:06	1505
4370	18:17:10	1506
4373	09:17:40	1507
4375	15:28:23	1508
4380	11:23:56	1509
4382	17:38:34	1510
4386	17:53:28	1511
4387	14:23:54	1512
4390	14:33:45	1513
4393	09:28:19	1514
4396	18:56:14	1515
4400	18:07:19	1516
4401	09:51:17	1517
4403	17:07:37	1518
4407	16:25:17	1519
4409	13:46:52	1520
4411	12:49:12	1521
4413	10:44:28	1522
4416	15:42:51	1523
4419	12:30:11	1524
4421	09:20:19	1525
4424	13:14:54	1526
4427	09:28:36	1527
4429	12:24:44	1528
4431	14:30:58	1529
4434	09:11:20	1530
4436	14:22:19	1531
4439	10:49:20	1532
4440	09:36:01	1533
4442	11:53:09	1534
4445	12:54:48	1535
4447	09:13:02	1536
4448	09:32:43	1537
4451	12:07:16	1538
4452	14:15:22	1539
4458	15:52:24	1540
4461	09:49:07	1541
4464	11:50:21	1542
4467	15:09:15	1543
4469	09:39:30	1544
4472	18:51:02	1545
4476	14:08:18	1546
4479	09:54:32	1547
4481	16:41:13	1548
4484	09:07:54	1549
4486	09:44:46	1550
4488	15:26:02	1551
4491	09:56:39	1552
4494	11:52:35	1553
4496	14:02:45	1554
4499	12:29:57	1555
4503	15:03:34	1556
4505	17:32:30	1557
4508	13:58:27	1558
4513	12:25:26	1559
4516	09:28:52	1560
4519	13:54:19	1561
4522	11:26:53	1562
4524	10:55:50	1563
4526	14:12:46	1564
4527	13:06:26	1565
4530	10:25:37	1566
4532	09:14:27	1567
4535	09:10:21	1568
4537	09:45:24	1569
4540	09:43:25	1570
4544	09:15:11	1571
4548	09:22:48	1572
4551	17:05:11	1573
4556	09:14:35	1574
4558	10:11:02	1575
4561	13:05:27	1576
4562	09:05:47	1577
4569	12:44:17	1578
4572	16:26:15	1579
4574	09:52:13	1580
4578	09:18:27	1581
4581	11:10:42	1582
4584	09:26:04	1583
4585	12:54:17	1584
4590	09:09:58	1585
4593	10:55:52	1586
4597	15:13:49	1587
4600	15:04:11	1588
4602	09:53:25	1589
4606	13:24:56	1590
4608	13:08:56	1591
4611	18:26:57	1592
4613	13:49:06	1593
4616	12:44:49	1594
4620	15:16:18	1595
4622	13:28:39	1596
4626	18:40:17	1597
4628	11:58:11	1598
4630	12:32:57	1599
4634	15:07:57	1600
4637	09:06:27	1601
4641	09:05:46	1602
4645	09:39:13	1603
4648	15:41:19	1604
4652	09:15:26	1605
4654	09:04:40	1606
4656	16:02:33	1607
4658	09:50:09	1608
4663	15:46:54	1609
4666	11:34:04	1610
4667	11:59:27	1611
4670	14:23:25	1612
4676	09:17:51	1613
4678	09:48:13	1614
4680	09:08:18	1615
4681	09:15:22	1616
4687	15:29:16	1617
4689	09:53:38	1618
4690	09:57:37	1619
4693	13:26:29	1620
4695	09:13:44	1621
4699	09:15:12	1622
4701	18:04:36	1623
4702	17:14:06	1624
4706	09:33:54	1625
4710	09:48:42	1626
4713	09:09:56	1627
4716	15:19:38	1628
4719	17:41:51	1629
4723	09:32:42	1630
4727	11:54:09	1631
4728	09:50:51	1632
4731	13:00:59	1633
4736	09:13:17	1634
4739	09:02:17	1635
4740	09:34:53	1636
4745	09:15:37	1637
4748	11:15:03	1638
4752	13:02:43	1639
4755	09:16:16	1640
4757	16:16:57	1641
4760	16:50:30	1642
4762	11:48:54	1643
4765	09:40:43	1644
4769	09:49:36	1645
4770	09:40:54	1646
4771	10:05:17	1647
4773	15:37:15	1648
4778	16:17:27	1649
4783	16:47:50	1650
4785	09:07:33	1651
4790	14:00:08	1652
4793	09:32:46	1653
4798	09:40:38	1654
4800	13:21:22	1655
4803	09:20:04	1656
4806	11:46:45	1657
4808	14:19:07	1658
4812	14:31:40	1659
4816	13:34:37	1660
4819	09:13:40	1661
4823	17:11:25	1662
4825	17:54:23	1663
4826	09:32:46	1664
4829	09:45:33	1665
4830	09:17:50	1666
4836	09:27:39	1667
4839	14:48:47	1668
4841	10:32:22	1669
4846	17:47:23	1670
4850	15:54:51	1671
4853	16:17:46	1672
4854	11:47:52	1673
4857	11:20:01	1674
4862	09:13:22	1675
4864	14:08:39	1676
4867	09:31:52	1677
4869	09:43:09	1678
4871	09:49:10	1679
4873	09:23:38	1680
4875	14:25:41	1681
4880	09:09:49	1682
4884	09:35:50	1683
4885	09:28:40	1684
4890	09:04:32	1685
4892	09:13:03	1686
4896	09:50:22	1687
4899	09:35:43	1688
4904	09:28:36	1689
4907	16:50:15	1690
4911	09:48:14	1691
4913	13:48:34	1692
4915	10:15:10	1693
4919	09:40:43	1694
4922	11:37:49	1695
4923	17:16:01	1696
4926	16:30:50	1697
4927	17:21:38	1698
4928	12:58:04	1699
4929	18:36:46	1700
4931	17:05:06	1701
4934	09:14:12	1702
4937	15:32:39	1703
4940	18:13:51	1704
4945	09:43:59	1705
4946	11:33:11	1706
4948	15:17:01	1707
4951	16:49:10	1708
4954	18:38:03	1709
4956	16:35:50	1710
4958	17:46:34	1711
4961	09:50:47	1712
4965	09:15:28	1713
4970	12:48:07	1714
4972	09:27:07	1715
4974	09:27:51	1716
4976	13:54:14	1717
4979	09:20:57	1718
4983	09:14:39	1719
4990	14:42:18	1720
4991	14:29:39	1721
4994	09:12:25	1722
4996	10:30:55	1723
4998	16:12:01	1724
4999	14:41:24	1725
5002	09:27:19	1726
5005	09:45:38	1727
5006	11:28:08	1728
5007	13:45:28	1729
5010	09:56:57	1730
5012	12:08:40	1731
5015	16:43:28	1732
5016	09:32:34	1733
5019	09:41:27	1734
5022	09:05:49	1735
5024	09:41:20	1736
5027	09:46:02	1737
5030	09:02:26	1738
5031	15:57:56	1739
5034	09:40:23	1740
5037	12:49:29	1741
5038	11:18:20	1742
5042	14:13:58	1743
5044	09:30:07	1744
5049	17:08:01	1745
5055	12:56:18	1746
5058	09:50:16	1747
5061	16:06:04	1748
5065	15:31:34	1749
5071	12:20:44	1750
5076	09:38:45	1751
5080	12:10:10	1752
5084	09:27:32	1753
5086	16:31:50	1754
5087	09:54:02	1755
5092	15:28:42	1756
5093	09:47:44	1757
5096	09:40:17	1758
5100	09:01:19	1759
5104	14:24:41	1760
5107	12:07:52	1761
5108	09:05:25	1762
5110	16:56:42	1763
5114	09:58:40	1764
5117	15:57:33	1765
5118	09:04:21	1766
5122	14:09:45	1767
5123	09:18:48	1768
5126	11:31:26	1769
5128	09:46:06	1770
5131	09:47:50	1771
5134	16:13:35	1772
5137	12:53:48	1773
5139	09:18:15	1774
5143	18:43:02	1775
5145	09:14:30	1776
5146	09:13:11	1777
5147	11:21:41	1778
5152	15:25:59	1779
5156	09:01:21	1780
5161	13:12:19	1781
5162	13:35:42	1782
5165	16:40:22	1783
5166	17:03:56	1784
5169	13:10:54	1785
5170	11:09:33	1786
5172	14:02:51	1787
5177	09:35:24	1788
5179	13:51:02	1789
5182	09:07:50	1790
5184	15:11:16	1791
5186	09:37:29	1792
5190	10:45:02	1793
5191	09:02:20	1794
5194	17:33:10	1795
5198	09:03:40	1796
5201	12:31:08	1797
5202	11:38:40	1798
5204	09:16:31	1799
5207	09:34:20	1800
5211	12:44:55	1801
5216	12:01:41	1802
5220	13:57:01	1803
5224	16:15:13	1804
5225	13:47:43	1805
5227	18:00:44	1806
5231	09:08:13	1807
5234	09:40:20	1808
5236	09:40:15	1809
5241	09:57:44	1810
5244	09:00:54	1811
5245	17:47:44	1812
5250	09:49:52	1813
5254	18:12:20	1814
5256	15:09:51	1815
5259	09:31:33	1816
5262	15:58:44	1817
5265	13:24:35	1818
5270	09:14:05	1819
5275	17:38:03	1820
5277	11:04:09	1821
5279	09:32:57	1822
5283	09:29:38	1823
5285	16:39:03	1824
5287	09:16:56	1825
5289	10:48:46	1826
5291	17:44:52	1827
5294	13:52:49	1828
5298	11:55:56	1829
5300	09:38:33	1830
5303	16:19:25	1831
5305	15:53:13	1832
5308	09:55:11	1833
5309	13:55:42	1834
5314	16:48:30	1835
5318	16:12:53	1836
5319	09:48:01	1837
5323	17:13:25	1838
5325	11:14:08	1839
5326	14:48:49	1840
5332	09:35:43	1841
5334	09:27:07	1842
5337	15:56:51	1843
5339	14:32:11	1844
5340	12:16:50	1845
5342	11:37:37	1846
5343	13:51:45	1847
5346	14:11:28	1848
5347	09:15:54	1849
5349	09:56:01	1850
5353	13:45:20	1851
5357	11:37:52	1852
5358	09:53:20	1853
5361	17:57:41	1854
5363	09:52:04	1855
5366	11:16:53	1856
5368	14:33:32	1857
5370	09:17:00	1858
5372	18:50:52	1859
5377	09:06:29	1860
5381	12:05:11	1861
5382	09:00:31	1862
5383	17:51:26	1863
5386	11:38:30	1864
5387	14:57:47	1865
5390	09:42:15	1866
5393	16:59:27	1867
5398	17:29:52	1868
5401	09:48:35	1869
5404	14:06:55	1870
5408	13:09:23	1871
5411	09:47:42	1872
5414	14:48:18	1873
5417	09:27:59	1874
5422	15:41:44	1875
5428	09:12:10	1876
5430	18:24:43	1877
5431	14:53:19	1878
5436	09:40:48	1879
5439	09:43:41	1880
5441	09:28:20	1881
5443	12:49:03	1882
5447	09:09:12	1883
5452	16:04:49	1884
5453	09:43:53	1885
5455	11:32:57	1886
5457	16:46:52	1887
5459	16:11:19	1888
5462	09:04:46	1889
5464	16:28:11	1890
5468	10:03:14	1891
5471	11:44:54	1892
5473	09:02:49	1893
5477	09:58:10	1894
5480	09:32:16	1895
5486	14:41:44	1896
5487	17:17:20	1897
5488	09:17:58	1898
5489	13:46:06	1899
5491	10:46:55	1900
5494	09:31:31	1901
5499	09:51:12	1902
5502	09:09:29	1903
5505	09:01:22	1904
5509	09:10:56	1905
5511	09:14:05	1906
5514	09:31:49	1907
5518	09:49:39	1908
5523	14:49:56	1909
5526	09:10:15	1910
5529	11:53:37	1911
5530	17:44:18	1912
5533	09:26:05	1913
5536	09:00:28	1914
5537	09:56:39	1915
5540	09:45:40	1916
5543	13:00:52	1917
5546	09:20:05	1918
5549	09:43:31	1919
5550	10:43:23	1920
5554	09:11:50	1921
5557	11:09:51	1922
5562	16:19:06	1923
5563	09:28:16	1924
5569	09:07:25	1925
5574	09:14:52	1926
5576	09:18:31	1927
5579	09:45:49	1928
5582	10:25:19	1929
5584	12:19:03	1930
5590	09:39:06	1931
5596	11:22:46	1932
5597	15:52:18	1933
5598	11:24:50	1934
5601	14:57:15	1935
5604	16:24:48	1936
5607	16:42:58	1937
5610	11:31:22	1938
5613	15:55:49	1939
5616	09:19:58	1940
5620	09:14:02	1941
5624	09:39:11	1942
5627	16:39:54	1943
5628	12:45:50	1944
5631	16:57:37	1945
5634	17:01:37	1946
5635	09:45:48	1947
5637	09:23:20	1948
5642	09:07:42	1949
5643	17:45:02	1950
5644	14:48:30	1951
5645	15:05:24	1952
5649	11:17:29	1953
5652	09:45:51	1954
5656	14:43:52	1955
5661	11:22:44	1956
5663	14:34:25	1957
5664	15:02:21	1958
5666	10:29:46	1959
5668	17:58:15	1960
5669	11:10:39	1961
5671	14:18:48	1962
5673	09:50:41	1963
5676	11:41:32	1964
5680	10:55:00	1965
5684	13:50:47	1966
5685	16:10:50	1967
5687	15:34:34	1968
5688	13:12:39	1969
5690	14:34:28	1970
5694	15:46:58	1971
5697	18:20:50	1972
5701	14:58:48	1973
5704	15:12:52	1974
5707	11:54:16	1975
5708	09:27:47	1976
5711	13:14:49	1977
5716	09:51:03	1978
5718	17:30:46	1979
5719	18:20:37	1980
5721	09:04:54	1981
5722	14:35:55	1982
5726	09:17:55	1983
5727	09:45:48	1984
5730	09:52:03	1985
5733	09:47:48	1986
5737	17:53:36	1987
5740	09:49:29	1988
5744	10:00:24	1989
5745	09:18:44	1990
5747	15:21:44	1991
5750	11:10:06	1992
5752	09:51:19	1993
5754	11:48:15	1994
5756	15:00:03	1995
5758	09:24:37	1996
5761	17:41:27	1997
5764	13:08:31	1998
5765	10:19:37	1999
5768	16:56:27	2000
5770	09:28:33	2001
5774	14:24:28	2002
5776	17:49:39	2003
5779	18:53:46	2004
5782	16:54:29	2005
5785	09:22:24	2006
5790	09:52:17	2007
5794	16:42:17	2008
5797	11:22:07	2009
5800	11:29:41	2010
5801	15:02:40	2011
5802	17:38:51	2012
5805	12:21:50	2013
5807	09:42:10	2014
5809	16:20:12	2015
5813	15:02:30	2016
5815	11:18:42	2017
5819	09:50:34	2018
5821	09:33:29	2019
5822	16:13:11	2020
5825	16:42:14	2021
5830	09:15:10	2022
5833	09:52:10	2023
5836	10:45:30	2024
5839	15:58:17	2025
5843	09:01:32	2026
5846	09:16:19	2027
5851	16:45:42	2028
5854	12:19:04	2029
5858	09:39:29	2030
5861	12:37:24	2031
5865	09:40:44	2032
5868	18:11:29	2033
5873	11:16:30	2034
5876	15:14:44	2035
5878	17:07:54	2036
5881	16:37:33	2037
5887	09:22:03	2038
5892	09:15:38	2039
5896	15:11:46	2040
5899	14:56:58	2041
5904	10:00:53	2042
5906	17:33:21	2043
5911	14:10:40	2044
5914	11:05:51	2045
5917	13:52:31	2046
5920	18:55:58	2047
5925	18:57:25	2048
5929	14:34:27	2049
5932	09:54:16	2050
5934	13:01:44	2051
5935	11:25:40	2052
5939	09:30:48	2053
5940	13:44:52	2054
5944	10:01:03	2055
5946	09:42:40	2056
5949	09:02:18	2057
5950	09:12:33	2058
5952	12:04:09	2059
5956	09:21:01	2060
5960	09:56:16	2061
5963	15:09:43	2062
5967	09:33:55	2063
5968	10:57:13	2064
5969	15:00:22	2065
5972	12:17:36	2066
5976	09:31:33	2067
5978	15:32:53	2068
5979	09:57:42	2069
5982	09:45:22	2070
5986	09:06:16	2071
5989	12:02:23	2072
5992	09:50:35	2073
5995	12:38:50	2074
5997	09:23:34	2075
6001	09:35:33	2076
6003	15:53:43	2077
6006	12:11:15	2078
6010	12:39:41	2079
6014	09:19:47	2080
6018	09:49:50	2081
6024	09:14:14	2082
6028	09:10:50	2083
6031	14:32:09	2084
6033	09:15:53	2085
6034	13:47:44	2086
6037	16:26:35	2087
6040	16:27:58	2088
6043	14:04:13	2089
6047	16:17:08	2090
6050	15:34:02	2091
6053	11:46:50	2092
6056	09:05:03	2093
6060	17:15:11	2094
6063	13:06:39	2095
6066	09:01:19	2096
6069	12:12:58	2097
6072	09:15:32	2098
6076	09:14:02	2099
6080	12:25:10	2100
6083	10:08:38	2101
6086	12:34:05	2102
6090	14:34:17	2103
6093	15:25:33	2104
6096	17:58:35	2105
6098	16:49:17	2106
6100	18:36:12	2107
6104	09:32:22	2108
6107	13:22:43	2109
6109	13:51:34	2110
6113	12:58:29	2111
6119	09:15:56	2112
\.


--
-- Name: f_entrances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('f_entrances_id_seq', 1, false);


--
-- Data for Name: f_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY f_purchases (id, customerid, paymenttype, productid, storeid, timeofpurchase, profit) FROM stdin;
3002	1043	Credit Card	1	2	12:14:32	250
4055	1405	Debit Card	1	1	17:33:10	250
3181	1110	Android app	1	3	07:37:15	250
4050	1403	Android app	1	1	17:22:04	250
1119	386	Android app	1	1	08:07:49	250
3188	1112	Credit Card	1	3	04:08:10	250
1121	387	Debit Card	1	2	06:33:40	250
3192	1114	Debit Card	1	1	09:49:43	250
4043	1401	Debit Card	1	3	10:48:11	250
4038	1399	Credit Card	1	3	07:13:47	250
129	41	Debit Card	1	3	09:20:27	250
4035	1398	Credit Card	1	4	08:52:26	250
1124	388	Credit Card	1	2	10:52:25	250
3204	1119	Credit Card	1	2	11:47:38	250
3208	1120	Credit Card	1	4	13:17:48	250
3212	1121	iOS app	1	1	13:16:16	250
394	132	Credit Card	1	2	10:48:10	250
3220	1124	Credit Card	1	3	11:05:00	250
1130	389	Debit Card	1	2	09:10:34	250
3224	1125	Credit Card	1	1	09:13:11	250
4029	1395	Credit Card	1	2	10:43:06	250
3228	1126	iOS app	1	3	14:25:50	250
1133	390	Android app	1	1	15:17:17	250
3234	1128	Debit Card	1	3	04:50:43	250
4026	1394	iOS app	1	4	12:48:05	250
4023	1393	Debit Card	1	3	03:48:29	250
5316	1835	iOS app	1	1	14:09:09	250
3246	1133	iOS app	1	1	07:28:51	250
3250	1134	iOS app	1	2	06:50:50	250
4018	1392	iOS app	1	2	08:10:44	250
3256	1137	Credit Card	1	2	16:11:45	250
6030	2083	Android app	1	1	07:51:50	250
3261	1139	Credit Card	1	3	18:11:30	250
5311	1834	Credit Card	1	3	07:08:33	250
4008	1388	Debit Card	1	4	09:58:08	250
4004	1387	iOS app	1	1	03:36:33	250
3273	1142	Credit Card	1	3	09:30:55	250
4001	1386	iOS app	1	4	09:14:24	250
3996	1385	Debit Card	1	2	07:19:14	250
1143	392	Credit Card	1	2	06:55:41	250
3279	1143	Credit Card	1	2	06:11:24	250
3282	1144	iOS app	1	4	13:47:28	250
3285	1145	iOS app	1	1	18:44:39	250
1147	394	Android app	1	3	10:53:56	250
3295	1149	iOS app	1	2	10:52:48	250
3987	1381	Debit Card	1	3	12:53:55	250
5845	2026	Debit Card	1	2	10:38:07	250
3300	1150	Debit Card	1	3	17:47:07	250
1153	397	iOS app	1	4	17:48:11	250
3961	1369	Credit Card	1	2	16:11:48	250
3313	1154	Credit Card	1	4	06:27:19	250
3952	1365	Credit Card	1	2	14:45:25	250
3316	1155	Android app	1	1	15:42:17	250
5301	1830	Credit Card	1	3	10:56:31	250
3319	1156	Debit Card	1	3	07:24:28	250
6026	2082	Credit Card	1	3	08:35:02	250
404	136	Credit Card	1	3	10:49:31	250
3937	1360	Credit Card	1	3	09:58:23	250
1161	399	iOS app	1	1	05:30:43	250
3934	1359	iOS app	1	1	08:13:55	250
12	4	iOS app	1	3	10:33:23	250
3337	1160	Credit Card	1	1	08:50:55	250
136	43	Credit Card	1	3	11:11:13	250
3346	1163	iOS app	1	3	05:05:52	250
3349	1164	iOS app	1	3	03:45:49	250
411	140	iOS app	1	2	10:51:11	250
3358	1168	Android app	1	1	06:24:31	250
3924	1354	Debit Card	1	1	12:59:49	250
3362	1169	Debit Card	1	3	14:30:11	250
3918	1352	Credit Card	1	3	10:12:15	250
3367	1170	Android app	1	4	11:24:25	250
3898	1346	Debit Card	1	3	13:17:38	250
3373	1172	iOS app	1	1	15:15:45	250
1179	407	iOS app	1	2	10:30:39	250
3376	1173	iOS app	1	1	10:05:10	250
3382	1175	iOS app	1	1	05:38:10	250
3892	1344	Debit Card	1	2	05:26:21	250
1182	408	Android app	1	3	11:36:30	250
3387	1176	iOS app	1	3	13:26:18	250
416	142	Debit Card	1	3	10:35:15	250
3395	1180	Credit Card	1	2	10:52:56	250
3884	1342	Credit Card	1	3	16:43:51	250
3881	1341	iOS app	1	1	10:47:04	250
3405	1184	Credit Card	1	3	15:07:07	250
5293	1827	Android app	1	1	17:11:15	250
3408	1185	iOS app	1	3	10:06:08	250
3413	1186	iOS app	1	3	14:17:50	250
1192	411	Credit Card	1	2	10:40:31	250
3416	1187	Android app	1	1	09:17:27	250
3421	1189	Debit Card	1	3	05:03:47	250
422	144	Credit Card	1	2	10:08:11	250
3425	1190	Credit Card	1	2	06:43:26	250
3432	1192	Credit Card	1	2	08:15:21	250
1203	416	Debit Card	1	4	07:10:48	250
3435	1193	Debit Card	1	2	10:55:06	250
3439	1194	Android app	1	4	09:48:40	250
5290	1826	Credit Card	1	2	06:02:32	250
3867	1336	Debit Card	1	1	04:12:12	250
5288	1825	Credit Card	1	2	05:22:53	250
3447	1196	Debit Card	1	2	08:11:53	250
3857	1334	Debit Card	1	2	10:02:49	250
3453	1197	Credit Card	1	3	12:42:04	250
1209	418	Android app	1	2	14:26:27	250
3456	1198	Credit Card	1	3	10:41:35	250
5824	2020	Debit Card	1	2	13:50:56	250
1212	419	Credit Card	1	2	05:33:44	250
3465	1201	Android app	1	3	17:18:12	250
1215	420	Credit Card	1	2	07:04:52	250
3471	1203	Android app	1	1	12:04:29	250
3845	1330	iOS app	1	1	14:04:33	250
3833	1327	Credit Card	1	3	10:22:17	250
427	145	Credit Card	1	3	04:37:42	250
3824	1323	Credit Card	1	3	11:33:33	250
3491	1211	Credit Card	1	2	06:08:48	250
3820	1322	Android app	1	1	11:08:26	250
3496	1213	Debit Card	1	2	10:52:07	250
5281	1822	iOS app	1	2	04:21:46	250
3503	1216	Credit Card	1	4	18:16:05	250
3506	1217	Credit Card	1	2	09:13:27	250
6019	2081	Credit Card	1	3	12:00:58	250
1232	426	iOS app	1	3	13:28:23	250
3512	1219	Debit Card	1	3	06:37:58	250
431	146	Credit Card	1	3	08:14:31	250
3814	1319	Debit Card	1	2	12:39:15	250
1236	427	Credit Card	1	3	06:21:28	250
3518	1221	Android app	1	2	04:47:26	250
3520	1222	iOS app	1	1	12:09:41	250
5278	1821	iOS app	1	1	04:48:07	250
6115	2111	Debit Card	1	4	10:24:56	250
3526	1224	Debit Card	1	3	14:08:53	250
1244	431	Debit Card	1	4	08:18:04	250
3530	1225	Debit Card	1	3	09:18:33	250
3534	1226	iOS app	1	3	04:57:08	250
1248	432	Credit Card	1	1	11:37:32	250
5811	2015	iOS app	1	1	06:03:09	250
3802	1316	iOS app	1	1	09:08:47	250
1252	434	Android app	1	1	17:48:46	250
5272	1819	Credit Card	1	3	12:01:29	250
3551	1232	iOS app	1	2	06:33:01	250
5799	2009	iOS app	1	2	15:37:55	250
3795	1314	Android app	1	4	12:04:00	250
3786	1311	Debit Card	1	1	04:49:17	250
3783	1310	Credit Card	1	3	06:26:21	250
3563	1236	Debit Card	1	2	14:02:22	250
5796	2008	Credit Card	1	4	04:36:06	250
3567	1237	Debit Card	1	3	08:39:34	250
3570	1238	iOS app	1	3	11:25:18	250
5258	1815	iOS app	1	1	17:51:14	250
3573	1239	Credit Card	1	3	10:37:25	250
3780	1309	iOS app	1	3	14:53:28	250
144	45	Debit Card	1	3	06:21:46	250
3578	1240	Android app	1	1	09:06:49	250
3581	1241	Credit Card	1	3	17:09:18	250
1265	439	iOS app	1	3	04:36:50	250
3584	1242	Debit Card	1	2	08:11:51	250
443	151	Credit Card	1	4	15:01:52	250
3775	1308	Debit Card	1	3	11:18:10	250
3599	1247	iOS app	1	4	13:19:45	250
51	17	Android app	1	1	12:53:36	250
3605	1250	Credit Card	1	3	16:34:36	250
3610	1252	Debit Card	1	2	12:10:29	250
447	152	Debit Card	1	3	04:58:08	250
3615	1254	iOS app	1	2	05:36:15	250
1278	443	Android app	1	1	08:19:07	250
3622	1257	Credit Card	1	3	04:50:50	250
3765	1304	Credit Card	1	3	05:35:30	250
3762	1303	Credit Card	1	3	14:30:43	250
1283	446	Android app	1	1	10:36:52	250
3630	1259	Credit Card	1	2	04:06:40	250
450	153	Debit Card	1	3	15:39:05	250
3636	1261	Android app	1	2	17:59:03	250
3639	1262	iOS app	1	2	07:52:06	250
3642	1263	iOS app	1	1	15:45:58	250
3756	1301	iOS app	1	1	10:22:41	250
3647	1264	iOS app	1	2	06:07:58	250
3748	1296	Debit Card	1	3	10:53:44	250
5252	1813	iOS app	1	4	16:08:06	250
5247	1812	Credit Card	1	3	15:07:02	250
1293	449	Debit Card	1	2	15:20:33	250
3663	1270	iOS app	1	1	04:27:08	250
5792	2007	Android app	1	3	05:37:10	250
3738	1294	Debit Card	1	4	05:50:11	250
6016	2080	Debit Card	1	3	12:55:20	250
3733	1293	iOS app	1	2	18:31:48	250
1300	451	iOS app	1	1	09:41:19	250
3682	1278	iOS app	1	1	08:02:35	250
457	156	Credit Card	1	2	17:55:44	250
3727	1291	iOS app	1	1	18:10:42	250
1305	453	iOS app	1	1	05:40:50	250
3696	1282	Credit Card	1	2	04:26:39	250
5229	1806	iOS app	1	3	05:56:43	250
3699	1283	iOS app	1	3	12:37:14	250
3717	1289	Android app	1	1	08:32:00	250
3705	1285	Android app	1	1	14:37:13	250
3714	1288	Android app	1	3	11:33:12	250
1310	454	Credit Card	1	1	07:39:56	250
6012	2079	iOS app	1	1	15:09:01	250
1314	455	Credit Card	1	3	05:21:13	250
461	157	iOS app	1	1	11:58:05	250
6111	2110	iOS app	1	1	18:27:23	250
5213	1801	Debit Card	1	2	07:23:50	250
5209	1800	iOS app	1	4	04:03:59	250
1334	464	Credit Card	1	3	08:23:59	250
1340	466	Credit Card	1	3	15:59:13	250
5206	1799	Debit Card	1	2	06:58:01	250
154	48	Credit Card	1	3	09:55:47	250
54	18	iOS app	1	2	07:34:10	250
1351	470	iOS app	1	2	11:12:37	250
475	162	Credit Card	1	4	10:04:14	250
6071	2097	Credit Card	1	3	10:04:43	250
1358	474	Credit Card	1	3	04:47:53	250
478	163	Credit Card	1	2	07:18:03	250
1362	475	Android app	1	1	07:13:38	250
481	164	iOS app	1	1	05:21:03	250
5196	1795	iOS app	1	3	06:03:24	250
5193	1794	Credit Card	1	3	05:08:07	250
5188	1792	iOS app	1	2	09:07:26	250
160	51	Credit Card	1	3	15:11:26	250
1382	482	Credit Card	1	3	04:03:55	250
6008	2078	iOS app	1	3	07:18:03	250
1388	484	Android app	1	1	05:23:44	250
488	166	Debit Card	1	3	17:24:54	250
1392	485	Debit Card	1	4	15:35:01	250
5174	1787	Credit Card	1	3	11:37:01	250
1399	487	Credit Card	1	4	13:42:08	250
493	167	iOS app	1	2	10:32:17	250
1403	488	Credit Card	1	3	16:43:32	250
6108	2109	Credit Card	1	4	04:19:45	250
166	53	iOS app	1	1	04:07:15	250
5167	1784	Credit Card	1	3	03:55:20	250
498	169	Credit Card	1	4	08:11:10	250
1417	494	Credit Card	1	2	17:23:12	250
5778	2003	iOS app	1	3	07:01:18	250
5999	2075	Debit Card	1	4	12:56:18	250
1422	496	Debit Card	1	3	10:31:35	250
1427	499	Android app	1	3	06:28:31	250
5772	2001	Android app	1	3	05:54:04	250
1431	500	Android app	1	1	03:33:32	250
5158	1780	Credit Card	1	2	07:48:35	250
5994	2073	Debit Card	1	1	11:06:20	250
1438	502	Debit Card	1	2	09:47:16	250
171	55	iOS app	1	2	03:25:19	250
1443	504	Credit Card	1	4	16:44:14	250
5154	1779	Debit Card	1	3	07:36:08	250
512	174	Credit Card	1	2	18:17:11	250
5149	1778	iOS app	1	1	13:48:44	250
1457	508	Debit Card	1	2	12:51:33	250
515	175	iOS app	1	1	15:49:22	250
1461	509	Credit Card	1	4	08:51:55	250
5760	1996	iOS app	1	1	04:42:28	250
5133	1771	Credit Card	1	3	03:25:30	250
5991	2072	Debit Card	1	3	16:39:13	250
1470	511	Credit Card	1	2	06:16:30	250
5125	1768	iOS app	1	3	04:26:50	250
5753	1993	Debit Card	1	3	04:06:18	250
5106	1760	Debit Card	1	3	03:18:04	250
525	177	Credit Card	1	3	07:15:40	250
1498	522	Android app	1	3	11:07:35	250
1502	523	iOS app	1	1	08:09:30	250
1504	524	Debit Card	1	2	05:09:21	250
177	56	Debit Card	1	4	17:28:28	250
1508	525	Debit Card	1	2	17:32:28	250
529	178	iOS app	1	1	14:38:11	250
1513	528	Debit Card	1	2	17:36:00	250
1516	529	iOS app	1	3	11:22:28	250
532	179	iOS app	1	3	09:08:49	250
1520	530	Debit Card	1	2	15:49:12	250
5742	1988	Debit Card	1	3	11:51:42	250
1523	531	Credit Card	1	2	07:20:17	250
5102	1759	Android app	1	4	11:22:17	250
58	19	Android app	1	1	05:10:38	250
1533	535	Credit Card	1	3	07:37:53	250
5098	1758	iOS app	1	3	09:56:14	250
5735	1986	Credit Card	1	3	11:23:58	250
181	57	iOS app	1	4	05:40:54	250
549	186	Credit Card	1	2	15:50:32	250
1557	546	iOS app	1	1	17:54:09	250
5987	2071	Debit Card	1	2	13:03:55	250
1561	547	iOS app	1	1	09:41:50	250
1563	548	iOS app	1	1	13:29:38	250
5094	1757	iOS app	1	2	05:55:58	250
5089	1755	Credit Card	1	2	04:45:50	250
185	58	Credit Card	1	4	10:27:55	250
5082	1752	iOS app	1	1	08:04:19	250
554	188	Android app	1	4	17:29:22	250
1578	552	Debit Card	1	4	18:38:45	250
5731	1985	iOS app	1	3	10:02:58	250
1581	553	iOS app	1	4	05:48:19	250
1586	555	iOS app	1	2	07:42:54	250
5984	2070	iOS app	1	1	12:48:22	250
1595	558	Credit Card	1	3	08:54:34	250
564	192	Credit Card	1	4	05:44:35	250
1600	560	iOS app	1	2	07:29:15	250
1603	561	iOS app	1	3	05:07:15	250
5073	1750	Credit Card	1	3	10:06:47	250
5067	1749	iOS app	1	1	10:24:38	250
5	2	iOS app	1	2	09:19:13	250
1610	564	Android app	1	1	15:53:03	250
189	59	Debit Card	1	2	04:23:34	250
1618	566	Credit Card	1	3	18:39:52	250
5728	1984	Credit Card	1	3	13:22:11	250
1622	567	Debit Card	1	3	04:24:03	250
578	199	Credit Card	1	3	10:30:48	250
5051	1745	Credit Card	1	4	10:08:05	250
581	200	iOS app	1	1	09:23:01	250
1637	571	Android app	1	1	10:48:15	250
5040	1742	Credit Card	1	4	15:03:41	250
1641	572	iOS app	1	2	09:57:07	250
1644	573	Debit Card	1	3	04:17:43	250
585	201	iOS app	1	3	09:54:39	250
1647	574	Debit Card	1	1	03:29:43	250
5713	1977	Debit Card	1	4	15:14:30	250
5962	2061	Debit Card	1	1	09:11:06	250
1655	577	Credit Card	1	4	09:34:08	250
594	206	Debit Card	1	3	05:15:07	250
1661	579	Debit Card	1	4	10:15:37	250
5036	1740	Credit Card	1	3	08:47:53	250
5028	1737	iOS app	1	4	14:01:35	250
5710	1976	iOS app	1	3	06:57:33	250
1667	580	Credit Card	1	3	03:31:59	250
5025	1736	Android app	1	1	08:40:02	250
61	20	Debit Card	1	3	10:32:49	250
1671	581	Credit Card	1	2	18:22:46	250
5021	1734	Credit Card	1	3	07:55:15	250
599	207	Credit Card	1	4	12:13:38	250
1680	585	Debit Card	1	3	06:30:41	250
5706	1974	Credit Card	1	4	17:23:10	250
1688	588	Android app	1	1	10:19:39	250
5014	1731	Credit Card	1	1	12:57:03	250
1692	589	Credit Card	1	3	17:45:25	250
1695	590	Credit Card	1	3	06:46:16	250
606	209	iOS app	1	3	14:01:28	250
20	7	Credit Card	1	2	05:46:58	250
1700	592	iOS app	1	1	10:34:20	250
5009	1729	Debit Card	1	2	09:35:35	250
5000	1725	iOS app	1	4	13:36:20	250
610	211	Credit Card	1	2	09:47:39	250
1706	593	Credit Card	1	2	06:42:14	250
4997	1723	iOS app	1	2	13:56:10	250
200	61	Debit Card	1	4	18:06:01	250
4993	1721	Debit Card	1	2	09:22:17	250
1719	599	iOS app	1	3	08:29:47	250
617	214	Credit Card	1	3	11:51:34	250
1722	600	iOS app	1	1	04:05:26	250
5703	1973	Credit Card	1	2	13:10:15	250
204	63	Credit Card	1	2	16:52:35	250
4981	1718	Debit Card	1	2	10:35:51	250
1738	605	Android app	1	1	07:42:41	250
207	64	Credit Card	1	3	10:18:29	250
1742	606	Android app	1	1	10:46:41	250
4978	1717	Credit Card	1	2	18:47:33	250
1745	607	Credit Card	1	3	05:32:04	250
629	219	Debit Card	1	2	05:39:02	250
1752	609	Credit Card	1	3	11:35:34	250
4967	1713	Credit Card	1	2	09:04:10	250
4963	1712	Debit Card	1	2	09:25:38	250
1760	612	Debit Card	1	2	04:09:29	250
1763	613	Debit Card	1	2	05:29:34	250
1768	615	Credit Card	1	3	04:07:42	250
633	220	Credit Card	1	3	09:18:57	250
5699	1972	Android app	1	3	04:44:22	250
4953	1708	Android app	1	1	16:47:25	250
5696	1971	Android app	1	2	07:51:22	250
1783	620	Credit Card	1	3	04:37:12	250
5958	2060	iOS app	1	2	15:36:39	250
4942	1704	iOS app	1	2	09:12:49	250
4939	1703	Android app	1	2	05:45:52	250
641	223	Credit Card	1	3	10:21:48	250
1799	626	iOS app	1	1	10:12:23	250
1802	627	Debit Card	1	4	16:57:54	250
4935	1702	Android app	1	3	10:32:23	250
4925	1696	Android app	1	2	08:10:35	250
5954	2059	Credit Card	1	3	05:24:53	250
1810	629	Debit Card	1	3	17:14:15	250
4920	1694	Android app	1	1	11:02:10	250
68	23	iOS app	1	3	04:47:48	250
1821	632	Credit Card	1	3	07:50:05	250
217	67	Debit Card	1	4	04:46:36	250
1824	633	Android app	1	1	12:30:31	250
653	227	Debit Card	1	3	12:54:55	250
1827	634	iOS app	1	1	12:37:17	250
4909	1690	Android app	1	3	11:17:09	250
5682	1965	iOS app	1	1	08:37:28	250
1834	636	iOS app	1	1	10:25:43	250
1840	639	Credit Card	1	1	08:50:25	250
4901	1688	Debit Card	1	3	04:22:26	250
1844	640	Credit Card	1	3	04:45:27	250
5675	1963	iOS app	1	1	10:46:05	250
1847	641	Credit Card	1	2	17:25:57	250
1852	643	Android app	1	1	16:33:00	250
4898	1687	Debit Card	1	3	07:57:33	250
663	230	Debit Card	1	2	12:26:07	250
1857	644	Credit Card	1	3	07:06:32	250
4894	1686	Debit Card	1	4	14:14:15	250
5670	1961	iOS app	1	1	18:22:52	250
1867	647	iOS app	1	1	04:31:41	250
667	231	iOS app	1	1	08:59:50	250
1874	652	Credit Card	1	3	10:57:37	250
4887	1684	Debit Card	1	2	04:24:32	250
4882	1682	iOS app	1	3	08:57:23	250
1880	653	iOS app	1	3	09:23:51	250
5662	1956	iOS app	1	1	06:58:15	250
1886	655	Credit Card	1	2	10:32:04	250
5658	1955	Credit Card	1	3	04:44:23	250
23	8	Credit Card	1	2	06:32:18	250
674	234	Android app	1	3	05:32:53	250
4863	1675	Debit Card	1	3	08:43:42	250
1898	660	Android app	1	1	12:36:40	250
226	70	iOS app	1	3	08:14:21	250
680	236	Credit Card	1	1	11:23:02	250
1908	664	Debit Card	1	4	08:20:25	250
4856	1673	iOS app	1	1	11:11:12	250
1914	666	Credit Card	1	3	11:33:44	250
1918	667	Credit Card	1	2	11:34:38	250
4851	1671	Credit Card	1	2	17:22:03	250
5653	1954	Debit Card	1	4	10:45:55	250
4848	1670	Android app	1	1	10:08:29	250
1931	672	Credit Card	1	3	09:09:54	250
6067	2096	Credit Card	1	3	09:39:47	250
1938	674	iOS app	1	1	09:17:13	250
5647	1952	Credit Card	1	2	08:23:27	250
1941	675	iOS app	1	3	08:00:01	250
4840	1668	Debit Card	1	3	05:50:59	250
4838	1667	iOS app	1	1	05:47:23	250
230	71	Debit Card	1	2	10:41:09	250
1951	679	iOS app	1	3	12:43:07	250
4832	1666	Android app	1	2	15:08:45	250
236	74	iOS app	1	3	04:17:17	250
4820	1661	Android app	1	1	09:43:48	250
5633	1945	Android app	1	1	11:37:39	250
694	240	iOS app	1	1	06:06:49	250
1966	683	Debit Card	1	3	04:58:56	250
697	241	Debit Card	1	2	17:19:48	250
1973	686	Android app	1	2	17:58:30	250
5942	2054	Credit Card	1	4	06:10:12	250
700	242	Debit Card	1	2	05:19:00	250
4814	1659	Debit Card	1	3	03:18:00	250
5937	2052	iOS app	1	3	10:38:39	250
1988	691	Debit Card	1	2	10:44:25	250
704	243	Credit Card	1	3	04:08:28	250
1993	693	Debit Card	1	3	13:05:36	250
1997	695	Debit Card	1	4	07:23:23	250
5630	1944	iOS app	1	1	08:08:20	250
2000	696	Credit Card	1	3	09:20:57	250
2005	698	Credit Card	1	3	10:54:25	250
711	245	iOS app	1	1	04:56:12	250
2009	699	Credit Card	1	3	06:28:43	250
5626	1942	Debit Card	1	2	11:15:07	250
2019	704	Credit Card	1	2	14:26:49	250
6105	2108	Debit Card	1	2	11:25:04	250
2023	706	Credit Card	1	3	10:04:08	250
246	77	Credit Card	1	4	10:10:51	250
2026	707	Credit Card	1	3	11:19:05	250
4810	1658	Credit Card	1	3	10:53:55	250
719	248	Credit Card	1	2	17:33:14	250
2032	709	Android app	1	1	03:30:02	250
4805	1656	iOS app	1	4	11:35:34	250
2040	714	Credit Card	1	4	17:18:12	250
2042	715	Credit Card	1	3	10:04:17	250
2045	716	Debit Card	1	3	11:31:40	250
723	249	Credit Card	1	3	13:23:40	250
2052	718	Debit Card	1	2	13:37:34	250
4799	1654	Android app	1	3	16:05:33	250
77	25	Debit Card	1	2	11:47:38	250
2058	721	Credit Card	1	3	09:14:47	250
4795	1653	Credit Card	1	2	17:38:38	250
4791	1652	iOS app	1	4	09:32:13	250
2064	723	Debit Card	1	4	10:24:38	250
249	78	Debit Card	1	4	12:41:35	250
4787	1651	Android app	1	1	10:44:29	250
5931	2049	Android app	1	1	09:39:09	250
4784	1650	Credit Card	1	3	06:51:25	250
735	254	Debit Card	1	2	10:40:26	250
4775	1648	iOS app	1	2	04:22:47	250
4767	1644	iOS app	1	3	10:54:28	250
4764	1643	iOS app	1	3	05:10:51	250
4754	1639	Android app	1	3	07:40:30	250
2092	733	Android app	1	2	08:58:43	250
738	255	Android app	1	1	16:42:01	250
253	79	iOS app	1	2	11:00:33	250
2097	735	Credit Card	1	3	07:06:56	250
741	256	Credit Card	1	3	05:32:02	250
5603	1935	Debit Card	1	4	14:59:03	250
2106	738	Credit Card	1	3	16:33:44	250
2109	739	iOS app	1	1	14:03:07	250
748	260	Android app	1	1	17:41:31	250
5916	2045	Android app	1	1	12:48:12	250
2116	742	Credit Card	1	3	05:59:19	250
4750	1638	iOS app	1	1	13:07:42	250
5600	1934	Debit Card	1	3	09:07:19	250
2125	746	Credit Card	1	2	08:59:00	250
2127	747	Android app	1	4	10:01:32	250
2130	748	Debit Card	1	4	17:17:47	250
4742	1636	Debit Card	1	4	04:14:16	250
755	262	Debit Card	1	3	05:25:56	250
4738	1634	Credit Card	1	2	12:12:07	250
4721	1629	Debit Card	1	2	15:21:36	250
4718	1628	Debit Card	1	2	04:22:59	250
2143	751	Credit Card	1	2	09:53:34	250
261	81	iOS app	1	1	10:48:25	250
2149	753	Credit Card	1	4	07:21:03	250
760	264	iOS app	1	4	08:27:30	250
4714	1627	iOS app	1	2	05:31:56	250
4712	1626	Debit Card	1	3	13:17:11	250
764	265	Android app	1	4	03:14:46	250
2166	759	iOS app	1	4	11:15:58	250
4708	1625	Android app	1	2	12:50:06	250
4700	1622	Credit Card	1	4	05:48:13	250
6095	2104	Debit Card	1	3	11:56:36	250
5592	1931	iOS app	1	2	16:11:02	250
5586	1930	iOS app	1	4	17:55:26	250
2183	765	Credit Card	1	4	08:42:57	250
4697	1621	Credit Card	1	3	16:35:15	250
2192	769	Debit Card	1	2	10:54:03	250
4694	1620	iOS app	1	1	12:51:57	250
5908	2043	iOS app	1	3	17:53:34	250
2196	770	Debit Card	1	3	15:55:57	250
4677	1613	Credit Card	1	2	13:34:14	250
2210	775	iOS app	1	1	12:41:49	250
2214	776	Credit Card	1	3	13:15:12	250
5581	1928	iOS app	1	1	17:53:37	250
2217	777	Android app	1	1	17:48:16	250
4672	1612	iOS app	1	3	04:38:23	250
4665	1609	Credit Card	1	2	04:36:10	250
2224	779	Credit Card	1	3	16:32:20	250
87	29	Credit Card	1	3	08:31:18	250
2234	783	iOS app	1	2	17:36:52	250
273	85	iOS app	1	3	16:16:52	250
783	271	Android app	1	3	10:24:47	250
5578	1927	Debit Card	1	3	05:19:24	250
4660	1608	iOS app	1	3	09:17:59	250
2247	788	iOS app	1	2	08:19:58	250
276	86	iOS app	1	3	09:36:01	250
2251	789	Debit Card	1	1	04:53:00	250
791	274	Debit Card	1	4	10:27:05	250
4655	1606	Debit Card	1	4	14:04:36	250
2259	792	Debit Card	1	4	05:28:59	250
4650	1604	iOS app	1	2	09:01:49	250
2264	793	Debit Card	1	2	12:44:52	250
5571	1925	iOS app	1	3	12:34:52	250
280	88	Credit Card	1	3	03:09:13	250
799	276	iOS app	1	1	08:19:17	250
4642	1602	Debit Card	1	3	11:38:07	250
2279	797	Credit Card	1	3	09:19:35	250
5565	1924	iOS app	1	1	05:59:35	250
6088	2102	Debit Card	1	2	11:08:30	250
2286	799	Debit Card	1	4	14:47:11	250
804	277	Android app	1	2	09:26:07	250
2289	800	Credit Card	1	1	06:08:50	250
4639	1601	Debit Card	1	3	12:16:46	250
4636	1600	Credit Card	1	2	04:04:33	250
807	278	Debit Card	1	4	16:35:28	250
4632	1599	Android app	1	1	09:59:01	250
4618	1594	Credit Card	1	1	03:39:10	250
4615	1593	Debit Card	1	3	08:32:46	250
2309	807	Credit Card	1	3	04:27:24	250
2313	808	Debit Card	1	3	05:09:22	250
4604	1589	Debit Card	1	4	11:15:03	250
812	280	iOS app	1	3	14:09:25	250
2319	809	Debit Card	1	2	18:05:43	250
2324	811	Android app	1	4	16:48:06	250
91	30	Debit Card	1	2	17:02:31	250
2329	812	Credit Card	1	2	10:48:18	250
288	91	Android app	1	1	09:08:12	250
2334	814	iOS app	1	1	16:51:52	250
2338	815	Debit Card	1	1	11:28:32	250
5559	1922	Credit Card	1	3	10:02:33	250
4594	1586	iOS app	1	1	05:39:23	250
2347	818	Credit Card	1	3	11:23:00	250
2352	820	iOS app	1	3	10:21:11	250
5552	1920	Android app	1	2	11:42:35	250
5545	1917	iOS app	1	4	16:05:32	250
4587	1584	Debit Card	1	3	08:02:42	250
292	93	Debit Card	1	3	06:43:47	250
831	287	iOS app	1	1	06:10:14	250
4583	1582	Android app	1	2	14:41:18	250
4580	1581	Debit Card	1	4	07:24:37	250
32	11	Debit Card	1	1	10:14:15	250
5539	1915	Credit Card	1	3	04:23:47	250
95	31	Credit Card	1	2	15:04:26	250
2379	831	Android app	1	3	08:25:36	250
4576	1580	Credit Card	1	3	10:56:50	250
4564	1577	Debit Card	1	3	03:25:31	250
2386	834	Credit Card	1	3	06:04:45	250
4560	1575	Credit Card	1	4	09:44:01	250
837	289	Credit Card	1	3	09:02:21	250
2392	837	iOS app	1	1	15:56:17	250
298	96	Credit Card	1	3	04:20:05	250
2397	838	iOS app	1	1	14:37:56	250
840	290	Credit Card	1	3	10:40:00	250
5535	1913	Credit Card	1	2	05:20:48	250
2402	840	Debit Card	1	3	04:34:37	250
5901	2041	Credit Card	1	3	14:09:06	250
2408	842	Credit Card	1	1	04:45:27	250
4550	1572	Debit Card	1	2	04:35:33	250
4546	1571	Credit Card	1	3	17:24:27	250
2418	845	Credit Card	1	3	12:53:12	250
4529	1565	Android app	1	1	16:54:04	250
4525	1563	iOS app	1	2	10:06:35	250
851	294	iOS app	1	1	14:34:17	250
2428	848	Android app	1	1	15:10:05	250
4521	1561	iOS app	1	2	10:43:02	250
2437	851	Credit Card	1	3	17:23:14	250
5520	1908	Credit Card	1	3	07:23:50	250
303	98	iOS app	1	1	08:36:11	250
2447	854	iOS app	1	2	11:15:44	250
2454	856	Credit Card	1	1	08:48:52	250
4507	1557	Credit Card	1	4	05:53:18	250
2464	859	iOS app	1	3	11:01:11	250
5510	1905	Android app	1	1	12:18:02	250
4501	1555	Android app	1	1	13:22:46	250
8	3	Credit Card	1	3	03:03:07	250
2477	863	iOS app	1	1	17:55:35	250
4490	1551	Credit Card	1	4	06:20:44	250
4487	1550	Credit Card	1	2	09:04:36	250
2484	864	Credit Card	1	2	15:55:06	250
4483	1548	Debit Card	1	2	05:14:50	250
2490	866	Debit Card	1	2	09:04:34	250
5506	1904	iOS app	1	1	08:52:34	250
5504	1903	Credit Card	1	4	13:08:51	250
2497	868	Credit Card	1	2	05:02:01	250
5501	1902	iOS app	1	3	04:49:12	250
2500	869	iOS app	1	2	17:57:55	250
2507	871	Credit Card	1	2	11:02:02	250
4474	1545	Credit Card	1	3	04:19:22	250
99	32	iOS app	1	1	11:15:11	250
2518	875	iOS app	1	2	06:42:42	250
2521	876	Android app	1	1	08:21:15	250
2525	878	Android app	1	2	08:13:30	250
2530	880	Android app	1	2	12:34:22	250
4463	1541	Android app	1	1	08:27:32	250
35	12	Debit Card	1	3	17:30:03	250
2537	883	Debit Card	1	2	16:44:04	250
5490	1899	iOS app	1	1	11:10:52	250
4460	1540	Android app	1	1	06:24:04	250
889	306	iOS app	1	3	12:49:07	250
2543	885	Android app	1	1	06:12:22	250
2546	886	Credit Card	1	3	15:39:53	250
314	101	Debit Card	1	4	08:01:08	250
2549	887	Android app	1	2	10:01:54	250
2551	888	iOS app	1	2	03:35:16	250
2554	889	Credit Card	1	2	10:06:18	250
6085	2101	Credit Card	1	3	16:16:18	250
2558	890	Credit Card	1	1	09:27:37	250
896	308	Debit Card	1	3	15:07:38	250
2562	891	Debit Card	1	3	17:33:10	250
5482	1895	Android app	1	1	14:49:51	250
2566	892	Credit Card	1	4	15:53:16	250
900	310	iOS app	1	1	07:10:11	250
2569	893	Credit Card	1	1	11:05:19	250
2577	896	Credit Card	1	2	10:50:34	250
2581	898	Debit Card	1	2	08:10:27	250
4454	1539	iOS app	1	1	17:30:24	250
318	102	Android app	1	1	16:10:02	250
2589	900	Android app	1	1	06:07:48	250
905	311	Credit Card	1	2	08:16:25	250
5894	2039	Credit Card	1	3	14:31:22	250
2597	904	Android app	1	1	18:24:09	250
2601	906	iOS app	1	1	18:33:36	250
2606	908	iOS app	1	1	11:00:05	250
4426	1526	Credit Card	1	3	06:45:49	250
2611	910	iOS app	1	1	10:21:47	250
104	34	iOS app	1	1	05:16:53	250
4405	1518	iOS app	1	3	11:38:10	250
912	313	Android app	1	3	16:17:37	250
4395	1514	Android app	1	1	11:22:02	250
2627	916	iOS app	1	1	17:19:28	250
4392	1513	iOS app	1	1	16:27:32	250
4389	1512	Credit Card	1	1	07:49:27	250
5475	1893	iOS app	1	4	12:48:39	250
322	103	Credit Card	1	3	05:56:57	250
918	315	Debit Card	1	3	17:28:00	250
2638	919	Android app	1	1	07:37:19	250
4384	1510	Credit Card	1	3	17:06:25	250
2646	922	iOS app	1	3	14:00:48	250
2650	924	Debit Card	1	3	10:58:44	250
5889	2038	Debit Card	1	2	12:57:18	250
2653	925	Credit Card	1	3	11:06:45	250
4377	1508	iOS app	1	4	10:36:43	250
927	318	Debit Card	1	2	13:42:37	250
2659	927	iOS app	1	4	10:40:57	250
6082	2100	Debit Card	1	3	13:21:33	250
2663	928	Credit Card	1	3	10:46:53	250
5472	1892	Debit Card	1	3	17:35:32	250
2668	930	iOS app	1	2	06:53:22	250
2671	931	Android app	1	3	05:24:00	250
2674	933	iOS app	1	2	05:15:43	250
933	320	Android app	1	1	15:50:19	250
2678	935	Credit Card	1	3	18:40:45	250
4372	1506	iOS app	1	1	08:02:17	250
4368	1505	Credit Card	1	3	10:20:00	250
332	108	Credit Card	1	3	17:38:08	250
2688	939	Credit Card	1	4	10:58:27	250
936	321	iOS app	1	3	09:15:30	250
2693	941	Credit Card	1	3	15:08:47	250
2696	942	Credit Card	1	4	12:12:19	250
4358	1501	iOS app	1	1	15:54:35	250
5883	2037	Debit Card	1	3	07:03:09	250
2702	943	Credit Card	1	3	17:14:25	250
944	324	iOS app	1	1	04:02:18	250
6048	2090	Credit Card	1	4	08:58:55	250
2711	946	Debit Card	1	4	09:44:23	250
947	325	Android app	1	1	05:31:53	250
2719	950	Debit Card	1	3	16:51:06	250
4342	1495	Android app	1	1	11:33:27	250
5469	1891	iOS app	1	1	10:12:49	250
4336	1494	iOS app	1	3	04:47:31	250
339	111	iOS app	1	3	11:34:39	250
953	327	Debit Card	1	3	11:52:52	250
2734	956	Debit Card	1	4	10:04:15	250
2738	957	iOS app	1	1	17:44:06	250
4331	1492	iOS app	1	3	05:00:37	250
2745	959	Android app	1	3	09:58:32	250
2747	960	Credit Card	1	3	07:22:15	250
5466	1890	Android app	1	1	04:20:35	250
2752	962	Debit Card	1	4	11:03:28	250
4317	1488	iOS app	1	1	18:46:28	250
959	328	Debit Card	1	3	12:16:41	250
2758	964	iOS app	1	1	16:54:55	250
2762	965	Debit Card	1	4	16:28:37	250
5460	1888	Debit Card	1	1	17:16:28	250
2766	966	Debit Card	1	2	09:53:40	250
4313	1487	Android app	1	1	09:34:38	250
343	112	Debit Card	1	3	11:37:40	250
967	330	Android app	1	1	06:34:40	250
2779	971	Android app	1	1	06:36:02	250
4305	1485	iOS app	1	3	05:50:03	250
112	36	iOS app	1	2	05:37:54	250
2783	972	Debit Card	1	2	17:01:10	250
2787	973	iOS app	1	1	06:39:35	250
346	113	Credit Card	1	3	09:40:52	250
4301	1483	iOS app	1	3	10:42:14	250
4297	1481	Debit Card	1	2	08:17:45	250
974	332	iOS app	1	2	10:15:28	250
2800	978	Android app	1	1	13:02:03	250
2804	979	Debit Card	1	1	10:25:22	250
4286	1478	Debit Card	1	3	12:32:11	250
4280	1476	Debit Card	1	2	07:05:03	250
977	333	Credit Card	1	3	09:27:22	250
4277	1475	iOS app	1	1	09:03:48	250
350	114	Credit Card	1	4	08:17:59	250
2815	983	Debit Card	1	4	16:25:32	250
980	334	Android app	1	3	16:41:59	250
2819	984	iOS app	1	3	07:28:57	250
4272	1473	Credit Card	1	3	08:43:57	250
983	335	Credit Card	1	2	04:37:15	250
5870	2033	Debit Card	1	2	12:25:28	250
4258	1470	Android app	1	3	11:28:07	250
2835	989	iOS app	1	4	17:35:00	250
5449	1883	iOS app	1	1	11:18:04	250
2840	990	Credit Card	1	3	17:58:16	250
5445	1882	Debit Card	1	2	17:57:17	250
2850	994	Credit Card	1	2	08:17:28	250
6042	2088	Credit Card	1	3	11:17:53	250
2854	995	iOS app	1	3	11:08:04	250
4252	1469	Credit Card	1	1	09:24:22	250
4249	1468	Debit Card	1	3	16:33:56	250
998	340	Android app	1	1	06:25:47	250
4241	1466	Debit Card	1	1	04:25:49	250
354	115	iOS app	1	1	13:43:34	250
2868	998	Credit Card	1	3	07:37:23	250
1004	342	iOS app	1	3	09:38:04	250
2876	1001	iOS app	1	1	09:40:58	250
5438	1879	iOS app	1	1	13:22:45	250
1007	343	iOS app	1	1	11:15:35	250
2882	1003	Credit Card	1	2	18:46:00	250
2889	1005	iOS app	1	1	10:36:28	250
4229	1462	iOS app	1	3	03:37:10	250
2893	1006	iOS app	1	3	04:37:08	250
4225	1460	Android app	1	1	07:41:24	250
5860	2030	Credit Card	1	2	12:29:31	250
4221	1459	Credit Card	1	2	17:58:29	250
5424	1875	iOS app	1	1	11:16:03	250
2905	1011	Android app	1	2	07:20:27	250
1018	348	iOS app	1	1	06:42:29	250
362	119	Credit Card	1	2	11:08:48	250
1021	349	iOS app	1	1	08:10:11	250
2914	1015	iOS app	1	4	08:37:55	250
2917	1016	Debit Card	1	2	04:14:09	250
5419	1874	Android app	1	1	07:41:22	250
2921	1018	Android app	1	2	05:17:25	250
2925	1019	iOS app	1	1	08:29:29	250
4215	1457	Android app	1	4	07:33:11	250
4206	1454	Android app	1	1	10:49:27	250
1028	352	Debit Card	1	4	08:07:59	250
2939	1024	Android app	1	1	15:08:36	250
2942	1025	Debit Card	1	2	06:26:18	250
4194	1450	Credit Card	1	2	13:32:09	250
2946	1026	Android app	1	1	11:05:57	250
5416	1873	Credit Card	1	3	09:30:20	250
2949	1027	Credit Card	1	2	15:32:38	250
366	120	Android app	1	1	05:35:19	250
4189	1449	Credit Card	1	2	06:31:47	250
5410	1871	iOS app	1	4	13:46:30	250
2955	1029	Credit Card	1	2	10:06:07	250
2959	1030	iOS app	1	2	07:35:07	250
4185	1448	Credit Card	1	4	08:04:21	250
4182	1447	Credit Card	1	2	04:41:31	250
41	14	Debit Card	1	4	17:54:31	250
2968	1032	Debit Card	1	3	16:24:45	250
1043	359	Credit Card	1	2	10:41:49	250
2975	1035	Debit Card	1	3	04:18:40	250
2979	1037	Credit Card	1	2	15:04:09	250
4175	1444	iOS app	1	1	04:10:47	250
4170	1442	Credit Card	1	3	15:28:48	250
5394	1867	Credit Card	1	2	10:29:13	250
2984	1038	Debit Card	1	3	14:09:44	250
4167	1441	Debit Card	1	2	06:51:50	250
4165	1440	Credit Card	1	2	04:32:00	250
5392	1866	Debit Card	1	3	08:27:21	250
5385	1863	Debit Card	1	3	16:43:16	250
4153	1437	Android app	1	3	05:09:31	250
2999	1042	Android app	1	2	15:14:39	250
1051	362	Debit Card	1	4	10:49:47	250
846	292	Credit Card	1	4	06:54:14	250
3005	1044	iOS app	1	2	10:00:02	250
3009	1045	iOS app	1	3	11:25:45	250
4150	1436	Credit Card	1	3	12:22:54	250
5379	1860	Credit Card	1	3	13:48:34	250
6035	2086	Debit Card	1	3	09:55:29	250
1057	363	Android app	1	1	05:52:41	250
373	124	Credit Card	1	3	18:15:01	250
3024	1050	Debit Card	1	3	16:01:16	250
3	1	Debit Card	1	2	09:41:18	250
4146	1434	Android app	1	1	10:16:32	250
4139	1432	Android app	1	2	07:01:09	250
3041	1056	Debit Card	1	2	09:05:54	250
377	126	Debit Card	1	2	07:34:55	250
1067	366	Credit Card	1	3	05:07:44	250
4135	1431	iOS app	1	1	08:32:01	250
3050	1060	iOS app	1	3	08:22:32	250
3053	1061	Credit Card	1	2	03:27:46	250
3056	1062	Android app	1	3	07:05:33	250
4131	1430	Credit Card	1	3	15:45:56	250
44	15	Debit Card	1	4	13:04:38	250
1072	367	Credit Card	1	1	08:57:29	250
3067	1064	Credit Card	1	4	17:50:33	250
4109	1423	iOS app	1	2	04:11:40	250
4107	1422	iOS app	1	2	16:14:17	250
5365	1855	iOS app	1	1	05:26:34	250
4104	1421	Credit Card	1	2	10:56:13	250
4101	1420	Android app	1	3	05:55:12	250
3085	1071	iOS app	1	2	14:49:13	250
3088	1072	iOS app	1	3	16:51:20	250
3093	1075	Debit Card	1	3	14:10:41	250
1087	373	Credit Card	1	4	04:32:38	250
3097	1076	Credit Card	1	3	10:22:50	250
5355	1851	Android app	1	3	08:37:20	250
3102	1078	iOS app	1	1	05:05:21	250
3104	1079	iOS app	1	1	07:06:56	250
1094	376	Credit Card	1	3	17:15:20	250
3109	1081	Android app	1	3	05:01:54	250
3116	1084	iOS app	1	3	13:46:47	250
4096	1418	Credit Card	1	3	15:09:03	250
3124	1087	Android app	1	1	08:48:44	250
3126	1088	Credit Card	1	2	09:24:20	250
3129	1089	Credit Card	1	3	17:32:56	250
4085	1415	Credit Card	1	2	05:21:23	250
3138	1093	Credit Card	1	1	07:34:44	250
3141	1095	iOS app	1	1	14:31:16	250
4082	1414	iOS app	1	1	06:37:33	250
3149	1098	Debit Card	1	4	07:27:13	250
4079	1413	Debit Card	1	3	11:43:32	250
5351	1850	Credit Card	1	3	09:43:54	250
3154	1099	Debit Card	1	1	15:47:28	250
3157	1100	iOS app	1	1	12:03:16	250
4068	1410	Credit Card	1	3	08:38:02	250
4066	1409	Credit Card	1	3	06:07:27	250
3161	1101	iOS app	1	3	08:41:35	250
5336	1842	iOS app	1	1	05:56:45	250
4063	1408	Credit Card	1	3	06:49:40	250
4058	1406	Credit Card	1	2	15:56:43	250
1116	385	iOS app	1	1	13:24:01	250
2414	844	iOS app	2	1	06:25:05	212
4542	1570	iOS app	2	3	17:39:13	212
5528	1910	Credit Card	2	3	07:37:01	212
182	57	iOS app	2	4	05:40:54	212
4538	1569	iOS app	2	3	11:22:35	212
6051	2091	iOS app	2	4	09:13:26	212
4536	1568	Credit Card	2	3	10:18:47	212
3893	1344	Debit Card	2	2	05:26:21	212
6074	2098	iOS app	2	3	17:52:17	212
1551	543	Android app	2	1	08:48:26	212
1875	652	Credit Card	2	3	10:57:37	212
2429	848	Android app	2	1	15:10:05	212
852	294	iOS app	2	1	14:34:17	212
4523	1562	Android app	2	2	07:20:09	212
3885	1342	Credit Card	2	3	16:43:51	212
854	295	Android app	2	1	08:34:39	212
4557	1574	Debit Card	2	4	06:24:37	212
4518	1560	Android app	2	2	15:17:17	212
1558	546	iOS app	2	1	17:54:09	212
2441	852	Credit Card	2	3	06:24:23	212
4510	1558	Android app	2	1	09:24:07	212
3388	1176	iOS app	2	3	13:26:18	212
5902	2041	Credit Card	2	3	14:09:06	212
2448	854	iOS app	2	2	11:15:44	212
858	296	Debit Card	2	3	07:55:50	212
2451	855	Credit Card	2	2	04:01:55	212
304	98	iOS app	2	1	08:36:11	212
1185	409	iOS app	2	2	10:21:33	212
861	297	iOS app	2	3	05:52:09	212
2457	857	iOS app	2	4	10:55:23	212
4633	1599	Android app	2	1	09:59:01	212
5895	2039	Credit Card	2	3	14:31:22	212
2461	858	Debit Card	2	2	11:07:47	212
5516	1907	Credit Card	2	2	14:12:50	212
3396	1180	Credit Card	2	2	10:52:56	212
1881	653	iOS app	2	3	09:23:51	212
2467	860	iOS app	2	2	08:54:19	212
4502	1555	Android app	2	1	13:22:46	212
5507	1904	iOS app	2	1	08:52:34	212
2471	861	Credit Card	2	3	08:07:53	212
1564	548	iOS app	2	1	13:29:38	212
4498	1554	Credit Card	2	4	10:41:45	212
3401	1182	Debit Card	2	2	13:59:42	212
1187	410	Debit Card	2	3	17:37:16	212
2478	863	iOS app	2	1	17:55:35	212
2225	779	Credit Card	2	3	16:32:20	212
2227	780	Credit Card	2	4	18:53:49	212
869	299	Debit Card	2	1	03:49:23	212
5083	1752	iOS app	2	1	08:04:19	212
3877	1340	Debit Card	2	3	08:56:26	212
308	99	iOS app	2	1	13:18:51	212
872	300	Android app	2	3	07:01:23	212
417	142	Debit Card	2	3	10:35:15	212
4877	1681	Android app	2	3	14:55:14	212
4480	1547	Debit Card	2	1	12:56:54	212
4475	1545	Credit Card	2	3	04:19:22	212
778	269	Credit Card	2	3	18:39:49	212
2098	735	Credit Card	2	3	07:06:56	212
139	44	iOS app	2	1	16:16:28	212
420	143	Android app	2	3	04:55:39	212
2501	869	iOS app	2	2	17:57:55	212
5496	1901	iOS app	2	3	11:56:08	212
2505	870	Android app	2	3	14:20:30	212
5732	1985	iOS app	2	3	10:02:58	212
2508	871	Credit Card	2	2	11:02:02	212
2230	781	iOS app	2	1	15:26:55	212
2512	873	iOS app	2	4	13:28:11	212
2514	874	Android app	2	1	10:07:50	212
4866	1676	Debit Card	2	3	09:09:47	212
1200	415	iOS app	2	1	06:53:11	212
880	302	Credit Card	2	3	08:45:19	212
3428	1191	Android app	2	1	16:10:42	212
4466	1542	Android app	2	1	09:11:33	212
5827	2021	Android app	2	1	09:51:05	212
311	100	iOS app	2	1	17:08:18	212
5922	2047	iOS app	2	1	15:52:36	212
5493	1900	Credit Card	2	3	10:42:11	212
1582	553	iOS app	2	4	05:48:19	212
561	191	Debit Card	2	4	07:43:46	212
1204	416	Debit Card	2	4	07:10:48	212
2103	737	Credit Card	2	2	09:06:52	212
3872	1338	Android app	2	1	14:46:44	212
5078	1751	iOS app	2	4	07:18:38	212
5654	1954	Debit Card	2	4	10:45:55	212
5483	1895	Android app	2	1	14:49:51	212
283	89	Credit Card	2	3	10:04:30	212
1905	663	Debit Card	2	2	08:42:33	212
3448	1196	Debit Card	2	2	08:11:53	212
3862	1335	Credit Card	2	4	06:14:58	212
893	307	iOS app	2	1	04:01:19	212
2297	802	iOS app	2	3	10:48:05	212
2555	889	Credit Card	2	2	10:06:18	212
5074	1750	Credit Card	2	3	10:06:47	212
2235	783	iOS app	2	2	17:36:52	212
2559	890	Credit Card	2	1	09:27:37	212
1909	664	Debit Card	2	4	08:20:25	212
3850	1331	Credit Card	2	1	15:07:15	212
2563	891	Debit Card	2	3	17:33:10	212
4859	1674	Android app	2	1	12:41:11	212
3461	1200	Android app	2	3	11:03:28	212
3846	1330	iOS app	2	1	14:04:33	212
2335	814	iOS app	2	1	16:51:52	212
901	310	iOS app	2	1	07:10:11	212
2572	894	Debit Card	2	3	10:44:45	212
4455	1539	iOS app	2	1	17:30:24	212
4595	1586	iOS app	2	1	05:39:23	212
5479	1894	Credit Card	2	3	07:36:55	212
6020	2081	Credit Card	2	3	12:00:58	212
2582	898	Debit Card	2	2	08:10:27	212
3468	1202	Debit Card	2	2	07:30:57	212
4444	1534	Android app	2	3	11:56:17	212
1611	564	Android app	2	1	15:53:03	212
1915	666	Credit Card	2	3	11:33:44	212
4438	1531	Debit Card	2	3	07:18:06	212
5063	1748	Credit Card	2	3	08:10:35	212
3839	1329	Debit Card	2	1	05:05:25	212
5060	1747	Android app	2	1	11:55:30	212
570	195	Credit Card	2	2	15:49:12	212
908	312	Debit Card	2	3	07:13:08	212
2604	907	Credit Card	2	3	04:41:16	212
1218	421	Credit Card	2	3	10:44:19	212
3481	1207	Debit Card	2	2	09:25:52	212
428	145	Credit Card	2	3	04:37:42	212
4423	1525	Credit Card	2	1	18:06:09	212
4418	1523	Debit Card	2	2	04:18:10	212
4408	1519	Credit Card	2	3	09:51:00	212
2616	911	Debit Card	2	3	09:09:06	212
3485	1209	iOS app	2	2	10:01:05	212
3825	1323	Credit Card	2	3	11:33:33	212
681	236	Credit Card	2	1	11:23:02	212
1223	423	Credit Card	2	2	13:25:19	212
913	313	Android app	2	3	16:17:37	212
5057	1746	Credit Card	2	4	08:02:22	212
2628	916	iOS app	2	1	17:19:28	212
2241	786	iOS app	2	3	14:10:01	212
5282	1822	iOS app	2	2	04:21:46	212
751	261	iOS app	2	1	09:32:44	212
1228	425	Credit Card	2	2	06:17:48	212
190	59	Debit Card	2	2	04:23:34	212
1625	568	Credit Card	2	3	06:47:55	212
919	315	Debit Card	2	3	17:28:00	212
323	103	Credit Card	2	3	05:56:57	212
3504	1216	Credit Card	2	4	18:16:05	212
4381	1509	Android app	2	1	10:08:43	212
5052	1745	Credit Card	2	4	10:08:05	212
922	316	iOS app	2	1	03:48:52	212
4624	1596	Credit Card	2	4	15:31:18	212
1923	669	Android app	2	3	15:26:18	212
5046	1744	Android app	2	1	14:35:41	212
4378	1508	iOS app	2	4	10:36:43	212
5977	2067	Debit Card	2	2	06:50:35	212
1634	570	Android app	2	2	10:43:33	212
4849	1670	Android app	2	1	10:08:29	212
4743	1636	Debit Card	2	4	04:14:16	212
4588	1584	Debit Card	2	3	08:02:42	212
5724	1982	Debit Card	2	3	08:39:06	212
3523	1223	iOS app	2	1	06:18:55	212
108	35	iOS app	2	4	08:45:11	212
5650	1953	Credit Card	2	2	06:57:58	212
5974	2066	iOS app	2	1	11:23:27	212
3811	1318	Debit Card	2	3	04:16:32	212
1934	673	Credit Card	2	3	17:08:16	212
2679	935	Credit Card	2	3	18:40:45	212
4842	1669	Debit Card	2	2	08:06:28	212
3531	1225	Debit Card	2	3	09:18:33	212
5273	1819	Credit Card	2	3	12:01:29	212
786	272	Debit Card	2	2	17:46:08	212
436	149	Android app	2	1	06:19:06	212
5884	2037	Debit Card	2	3	07:03:09	212
5714	1977	Debit Card	2	4	15:14:30	212
4364	1503	iOS app	2	1	04:05:34	212
3539	1228	Debit Card	2	3	08:04:19	212
2697	942	Credit Card	2	4	12:12:19	212
4361	1502	Android app	2	1	16:32:11	212
1650	575	Credit Card	2	2	13:04:34	212
3805	1317	iOS app	2	4	05:17:30	212
5532	1912	iOS app	2	3	03:37:51	212
5470	1891	iOS app	2	1	10:12:49	212
2705	944	Debit Card	2	3	15:31:46	212
3796	1314	Android app	2	4	12:04:00	212
4347	1496	Debit Card	2	3	07:12:32	212
81	27	Debit Card	2	3	10:54:34	212
5560	1922	Credit Card	2	3	10:02:33	212
2341	816	iOS app	2	3	13:41:16	212
4343	1495	Android app	2	1	11:33:27	212
948	325	Android app	2	1	05:31:53	212
3552	1232	iOS app	2	2	06:33:01	212
2720	950	Debit Card	2	3	16:51:06	212
1658	578	iOS app	2	1	09:17:11	212
4337	1494	iOS app	2	3	04:47:31	212
595	206	Debit Card	2	3	05:15:07	212
3790	1313	iOS app	2	1	04:30:13	212
5267	1818	Credit Card	2	2	11:55:08	212
2310	807	Credit Card	2	3	04:27:24	212
1662	579	Debit Card	2	4	10:15:37	212
2735	956	Debit Card	2	4	10:04:15	212
954	327	Debit Card	2	3	11:52:52	212
4833	1666	Android app	2	2	15:08:45	212
2740	958	iOS app	2	1	04:02:11	212
3564	1236	Debit Card	2	2	14:02:22	212
4322	1489	Credit Card	2	2	13:16:19	212
5467	1890	Android app	2	1	04:20:35	212
88	29	Credit Card	2	3	08:31:18	212
4733	1633	Android app	2	4	18:47:02	212
1260	437	Android app	2	3	10:36:08	212
5875	2034	iOS app	2	3	13:47:57	212
1952	679	iOS app	2	3	12:43:07	212
2753	962	Debit Card	2	4	11:03:28	212
4730	1632	iOS app	2	1	05:52:44	212
4821	1661	Android app	2	1	09:43:48	212
3574	1239	Credit Card	2	3	10:37:25	212
2759	964	iOS app	2	1	16:54:55	212
5461	1888	Debit Card	2	1	17:16:28	212
259	80	Credit Card	2	3	09:34:02	212
4314	1487	Android app	2	1	09:34:38	212
1957	680	Credit Card	2	2	10:40:35	212
1959	681	Debit Card	2	3	16:14:34	212
1675	582	Debit Card	2	1	05:39:18	212
9	3	Credit Card	2	3	03:03:07	212
2771	968	iOS app	2	3	06:36:26	212
4310	1486	Credit Card	2	3	06:50:57	212
600	207	Credit Card	2	4	12:13:38	212
2775	969	Credit Card	2	2	07:20:39	212
4722	1629	Debit Card	2	2	15:21:36	212
1266	439	iOS app	2	3	04:36:50	212
3587	1243	Debit Card	2	2	16:43:24	212
1681	585	Debit Card	2	3	06:30:41	212
3590	1244	Credit Card	2	3	12:47:33	212
2784	972	Debit Card	2	2	17:01:10	212
970	331	Android app	2	3	05:55:54	212
5018	1733	Debit Card	2	3	16:17:20	212
2788	973	iOS app	2	1	06:39:35	212
5253	1813	iOS app	2	4	16:08:06	212
2792	975	iOS app	2	1	04:15:02	212
3594	1245	Android app	2	3	10:50:27	212
444	151	Credit Card	2	4	15:01:52	212
4287	1478	Debit Card	2	3	12:32:11	212
1272	441	Debit Card	2	3	10:59:58	212
285	90	iOS app	2	1	10:28:17	212
2801	978	Android app	2	1	13:02:03	212
113	36	iOS app	2	2	05:37:54	212
1963	682	Credit Card	2	3	10:00:27	212
794	275	Credit Card	2	4	04:41:12	212
3606	1250	Credit Card	2	3	16:34:36	212
1275	442	Debit Card	2	2	13:30:24	212
2809	980	Credit Card	2	3	14:37:05	212
603	208	Credit Card	2	2	17:31:58	212
3772	1307	Debit Card	2	2	12:13:17	212
4577	1580	Credit Card	2	3	10:56:50	212
4273	1473	Credit Card	2	3	08:43:57	212
196	60	Android app	2	2	05:36:40	212
237	74	iOS app	2	3	04:17:17	212
3619	1256	iOS app	2	1	08:22:25	212
4268	1472	Android app	2	1	06:32:49	212
4715	1627	iOS app	2	2	05:31:56	212
2826	986	iOS app	2	3	10:14:40	212
147	46	Credit Card	2	3	09:41:14	212
4262	1471	Debit Card	2	3	15:32:58	212
3769	1306	iOS app	2	3	13:53:48	212
5450	1883	iOS app	2	1	11:18:04	212
1971	685	Credit Card	2	1	09:40:29	212
2836	989	iOS app	2	4	17:35:00	212
2146	752	iOS app	2	1	16:04:36	212
1974	686	Android app	2	2	17:58:30	212
4253	1469	Credit Card	2	1	09:24:22	212
5446	1882	Debit Card	2	2	17:57:17	212
4653	1605	Credit Card	2	4	08:53:01	212
2847	993	Debit Card	2	2	10:04:08	212
994	339	Credit Card	2	3	10:47:28	212
3631	1259	Credit Card	2	2	04:06:40	212
3633	1260	iOS app	2	4	04:06:38	212
2314	808	Debit Card	2	3	05:09:22	212
4815	1659	Debit Card	2	3	03:18:00	212
1286	447	iOS app	2	3	17:47:44	212
2150	753	Credit Card	2	4	07:21:03	212
2859	996	iOS app	2	1	15:22:38	212
4242	1466	Debit Card	2	1	04:25:49	212
451	153	Debit Card	2	3	15:39:05	212
4234	1463	Debit Card	2	3	10:17:42	212
999	340	Android app	2	1	06:25:47	212
2865	997	iOS app	2	2	04:50:34	212
611	211	Credit Card	2	2	09:47:39	212
3757	1301	iOS app	2	1	10:22:41	212
5867	2032	Android app	2	3	05:02:26	212
2872	1000	iOS app	2	3	11:01:15	212
1983	689	Credit Card	2	2	10:24:28	212
1289	448	iOS app	2	4	05:24:46	212
701	242	Debit Card	2	2	05:19:00	212
2879	1002	Credit Card	2	3	05:01:35	212
3648	1264	iOS app	2	2	06:07:58	212
64	21	Credit Card	2	4	07:43:09	212
358	117	Credit Card	2	3	10:25:47	212
2886	1004	iOS app	2	3	10:15:37	212
5433	1878	Credit Card	2	4	03:09:10	212
3651	1265	Credit Card	2	3	16:28:05	212
2890	1005	iOS app	2	1	10:36:28	212
5572	1925	iOS app	2	3	12:34:52	212
2154	755	Debit Card	2	2	11:17:46	212
4610	1591	Android app	2	1	12:39:44	212
1294	449	Debit Card	2	2	15:20:33	212
2897	1007	Credit Card	2	3	14:26:25	212
4222	1459	Credit Card	2	2	17:58:29	212
3660	1269	iOS app	2	4	06:08:31	212
5238	1809	iOS app	2	1	14:07:48	212
1723	600	iOS app	2	1	04:05:26	212
3744	1295	iOS app	2	2	05:39:58	212
618	214	Credit Card	2	3	11:51:34	212
2910	1013	Credit Card	2	3	09:13:40	212
3739	1294	Debit Card	2	4	05:50:11	212
761	264	iOS app	2	4	08:27:30	212
363	119	Credit Card	2	2	11:08:48	212
1729	603	Debit Card	2	2	07:32:37	212
3674	1275	Debit Card	2	3	03:33:57	212
3676	1276	Debit Card	2	2	16:50:05	212
2922	1018	Android app	2	2	05:17:25	212
6039	2087	iOS app	2	1	14:20:40	212
4985	1719	Android app	2	2	10:32:05	212
4216	1457	Android app	2	4	07:33:11	212
2928	1020	Credit Card	2	3	04:13:51	212
705	243	Credit Card	2	3	04:08:28	212
4212	1456	iOS app	2	3	10:50:32	212
4209	1455	iOS app	2	1	11:01:42	212
3680	1277	Debit Card	2	3	18:06:23	212
4196	1451	Credit Card	2	4	18:12:53	212
1733	604	iOS app	2	1	10:37:04	212
3683	1278	iOS app	2	1	08:02:35	212
5233	1807	Debit Card	2	2	08:47:49	212
4982	1718	Debit Card	2	2	10:35:51	212
1029	352	Debit Card	2	4	08:07:59	212
3690	1281	iOS app	2	3	07:57:03	212
2265	793	Debit Card	2	2	12:44:52	212
3724	1290	Credit Card	2	2	10:17:18	212
3718	1289	Android app	2	1	08:32:00	212
205	63	Credit Card	2	2	16:52:35	212
262	81	iOS app	2	1	10:48:25	212
1739	605	Android app	2	1	07:42:41	212
2956	1029	Credit Card	2	2	10:06:07	212
2162	758	Credit Card	2	2	08:26:51	212
4186	1448	Credit Card	2	4	08:04:21	212
3700	1283	iOS app	2	3	12:37:14	212
5400	1868	Android app	2	1	09:44:57	212
2964	1031	Android app	2	1	10:05:49	212
6055	2092	Credit Card	2	4	07:22:16	212
5222	1803	iOS app	2	2	15:52:19	212
243	76	iOS app	2	1	09:41:30	212
1041	358	Debit Card	2	2	10:21:35	212
2971	1033	Credit Card	2	2	05:06:53	212
3706	1285	Android app	2	1	14:37:13	212
5553	1920	Android app	2	2	11:42:35	212
1044	359	Credit Card	2	2	10:41:49	212
458	156	Credit Card	2	2	17:55:44	212
4973	1715	Android app	2	3	17:01:24	212
5218	1802	Debit Card	2	4	10:56:00	212
6116	2111	Debit Card	2	4	10:24:56	212
1749	608	Debit Card	2	4	12:58:03	212
1315	455	Credit Card	2	3	05:21:13	212
2268	794	iOS app	2	1	15:47:40	212
462	157	iOS app	2	1	11:58:05	212
2989	1039	Android app	2	3	06:48:36	212
4160	1439	Credit Card	2	3	09:58:29	212
1321	458	iOS app	2	4	09:36:40	212
4156	1438	Debit Card	2	3	09:09:27	212
5214	1801	Debit Card	2	2	07:23:50	212
4647	1603	Credit Card	2	3	11:29:35	212
4643	1602	Debit Card	2	3	11:38:07	212
5210	1800	iOS app	2	4	04:03:59	212
1052	362	Debit Card	2	4	10:49:47	212
465	158	iOS app	2	3	11:41:11	212
3006	1044	iOS app	2	2	10:00:02	212
5380	1860	Credit Card	2	3	13:48:34	212
2013	701	Credit Card	2	2	17:57:58	212
3010	1045	iOS app	2	3	11:25:45	212
1757	611	Debit Card	2	3	04:25:17	212
4147	1434	Android app	2	1	10:16:32	212
1335	464	Credit Card	2	3	08:23:59	212
152	47	Android app	2	1	07:02:07	212
1338	465	Android app	2	1	13:55:09	212
630	219	Debit Card	2	2	05:39:02	212
470	160	iOS app	2	2	13:58:39	212
1061	364	Debit Card	2	3	18:57:42	212
3028	1052	Android app	2	3	10:49:05	212
1343	467	iOS app	2	2	07:14:08	212
3032	1054	Debit Card	2	3	12:15:56	212
5622	1941	Credit Card	2	4	08:22:51	212
3035	1055	iOS app	2	1	12:45:39	212
4140	1432	Android app	2	2	07:01:09	212
2017	703	Debit Card	2	3	14:04:29	212
1064	365	Android app	2	3	05:40:58	212
1347	468	iOS app	2	1	06:30:47	212
3042	1056	Debit Card	2	2	09:05:54	212
1764	613	Debit Card	2	2	05:29:34	212
210	65	Credit Card	2	4	05:53:27	212
92	30	Debit Card	2	2	17:02:31	212
2173	761	iOS app	2	1	09:20:20	212
5374	1859	Debit Card	2	4	04:22:49	212
1771	616	iOS app	2	3	10:08:16	212
5367	1856	Debit Card	2	2	09:36:53	212
5200	1796	Credit Card	2	2	14:10:45	212
3057	1062	Android app	2	3	07:05:33	212
5700	1972	Android app	2	3	04:44:22	212
1774	617	Credit Card	2	2	07:16:41	212
3061	1063	Debit Card	2	3	10:43:58	212
4126	1428	iOS app	2	3	13:39:50	212
4123	1427	Credit Card	2	2	12:41:12	212
4118	1426	Android app	2	1	08:52:34	212
5197	1795	iOS app	2	3	06:03:24	212
2273	795	Debit Card	2	2	03:56:27	212
1369	478	iOS app	2	3	04:12:30	212
1777	618	Debit Card	2	3	18:55:58	212
4960	1711	Android app	2	2	09:55:26	212
2177	762	Debit Card	2	3	03:13:44	212
5856	2029	Android app	2	2	09:38:30	212
3075	1066	Credit Card	2	4	04:20:55	212
3077	1067	iOS app	2	4	07:20:16	212
5181	1789	Credit Card	2	3	10:28:57	212
1077	369	Credit Card	2	3	17:55:38	212
5784	2005	Android app	2	1	08:06:03	212
5360	1853	Debit Card	2	3	08:23:11	212
1377	480	iOS app	2	1	04:38:54	212
5853	2028	iOS app	2	1	07:11:40	212
4553	1573	Credit Card	2	3	04:53:55	212
3094	1075	Debit Card	2	3	14:10:41	212
4811	1658	Credit Card	2	3	10:53:55	212
5175	1787	Credit Card	2	3	11:37:01	212
5356	1851	Android app	2	3	08:37:20	212
485	165	iOS app	2	1	04:37:26	212
4943	1704	iOS app	2	2	09:12:49	212
2180	763	Debit Card	2	3	09:35:48	212
5352	1850	Credit Card	2	3	09:43:54	212
1389	484	Android app	2	1	05:23:44	212
1791	624	iOS app	2	3	10:50:20	212
5848	2027	Credit Card	2	2	06:21:36	212
3113	1083	Android app	2	1	08:38:51	212
1097	377	Credit Card	2	3	04:27:00	212
4599	1587	Credit Card	2	4	07:46:30	212
5913	2044	Debit Card	2	1	11:45:14	212
126	40	iOS app	2	3	17:06:20	212
3120	1085	Credit Card	2	4	10:01:35	212
4092	1417	Credit Card	2	1	10:11:19	212
489	166	Debit Card	2	3	17:24:54	212
1396	486	Credit Card	2	3	07:18:44	212
45	15	Debit Card	2	4	13:04:38	212
6005	2077	Credit Card	2	4	07:58:36	212
4089	1416	Android app	2	1	16:24:17	212
1103	379	Android app	2	1	07:58:05	212
3135	1092	Credit Card	2	3	11:48:06	212
4936	1702	Android app	2	3	10:32:23	212
1796	625	Debit Card	2	2	06:25:08	212
5618	1940	Credit Card	2	3	04:28:22	212
3142	1095	iOS app	2	1	14:31:16	212
391	131	iOS app	2	3	03:53:38	212
2186	766	iOS app	2	3	11:29:29	212
1109	383	Android app	2	1	15:20:31	212
1407	490	Credit Card	2	3	07:46:50	212
3150	1098	Debit Card	2	4	07:27:13	212
1409	491	Debit Card	2	3	16:11:24	212
1800	626	iOS app	2	1	10:12:23	212
1412	492	Android app	2	3	10:45:41	212
3155	1099	Debit Card	2	1	15:47:28	212
5566	1924	iOS app	2	1	05:59:35	212
771	267	Credit Card	2	3	11:53:12	212
2043	715	Credit Card	2	3	10:04:17	212
813	280	iOS app	2	3	14:09:25	212
5345	1847	iOS app	2	1	06:03:43	212
1807	628	Credit Card	2	3	11:29:25	212
3166	1103	Android app	2	1	09:25:56	212
5333	1841	Credit Card	2	2	18:25:24	212
3170	1105	Debit Card	2	2	15:14:58	212
644	224	Android app	2	1	18:46:02	212
502	170	Debit Card	2	2	10:02:26	212
5609	1937	Android app	2	1	09:30:43	212
5159	1780	Credit Card	2	2	07:48:35	212
1117	385	iOS app	2	1	13:24:01	212
5692	1970	Credit Card	2	4	10:34:09	212
1813	630	Android app	2	3	09:32:19	212
3185	1111	Credit Card	2	3	10:48:48	212
4921	1694	Android app	2	1	11:02:10	212
4802	1655	Credit Card	2	4	16:58:40	212
1435	501	Credit Card	2	2	15:14:31	212
5763	1997	Debit Card	2	4	07:33:31	212
3193	1114	Debit Card	2	1	09:49:43	212
4916	1693	Debit Card	2	3	10:04:30	212
826	286	iOS app	2	4	08:31:10	212
172	55	iOS app	2	2	03:25:19	212
650	226	Credit Card	2	3	08:04:16	212
5155	1779	Debit Card	2	3	07:36:08	212
2282	798	Credit Card	2	3	08:08:22	212
3205	1119	Credit Card	2	2	11:47:38	212
1125	388	Credit Card	2	2	10:52:25	212
1449	506	Debit Card	2	3	10:01:02	212
3209	1120	Credit Card	2	4	13:17:48	212
5328	1840	Debit Card	2	2	04:33:29	212
4640	1601	Debit Card	2	3	12:16:46	212
3213	1121	iOS app	2	1	13:16:16	212
5321	1837	iOS app	2	3	13:45:45	212
3217	1123	Credit Card	2	3	18:50:28	212
1452	507	Credit Card	2	1	10:58:52	212
5150	1778	iOS app	2	1	13:48:44	212
4032	1397	iOS app	2	2	04:51:23	212
2197	770	Debit Card	2	3	15:55:57	212
513	174	Credit Card	2	2	18:17:11	212
4692	1619	iOS app	2	1	05:57:48	212
395	132	Credit Card	2	2	10:48:10	212
1458	508	Debit Card	2	2	12:51:33	212
3229	1126	iOS app	2	3	14:25:50	212
774	268	Debit Card	2	3	04:53:29	212
3232	1127	Debit Card	2	3	10:42:32	212
69	23	iOS app	2	3	04:47:48	212
3235	1128	Debit Card	2	3	04:50:43	212
5317	1835	iOS app	2	1	14:09:09	212
3241	1132	Credit Card	2	2	05:06:25	212
4683	1616	Android app	2	1	11:54:17	212
1464	510	Credit Card	2	3	10:49:11	212
5141	1774	iOS app	2	1	03:02:29	212
4906	1689	iOS app	2	3	13:34:37	212
3247	1133	iOS app	2	1	07:28:51	212
5312	1834	Credit Card	2	3	07:08:33	212
5606	1936	Credit Card	2	3	15:45:54	212
4679	1614	iOS app	2	2	14:07:12	212
1835	636	iOS app	2	1	10:25:43	212
5120	1766	iOS app	2	1	04:53:49	212
1139	391	Debit Card	2	2	09:18:08	212
519	176	iOS app	2	3	14:37:35	212
4015	1391	Credit Card	2	2	13:58:48	212
2065	723	Debit Card	2	4	10:24:38	212
3265	1140	iOS app	2	1	17:41:57	212
4011	1389	Android app	2	4	10:44:24	212
1477	513	Debit Card	2	1	09:56:01	212
4005	1387	iOS app	2	1	03:36:33	212
5116	1764	Android app	2	4	09:21:52	212
400	135	Android app	2	3	17:37:30	212
5749	1991	Android app	2	1	08:54:14	212
3274	1142	Credit Card	2	3	09:30:55	212
1483	516	iOS app	2	3	14:16:47	212
5746	1990	Credit Card	2	3	11:57:44	212
5111	1763	iOS app	2	1	12:13:08	212
2325	811	Android app	2	4	16:48:06	212
3992	1384	iOS app	2	1	10:26:39	212
5988	2071	Debit Card	2	2	13:03:55	212
1144	392	Credit Card	2	2	06:55:41	212
5103	1759	Android app	2	4	11:22:17	212
3988	1381	Debit Card	2	3	12:53:55	212
5678	1964	iOS app	2	1	12:15:40	212
3291	1148	Credit Card	2	3	07:23:19	212
5307	1832	Android app	2	1	08:04:12	212
731	252	Credit Card	2	3	07:12:50	212
1499	522	Android app	2	3	11:07:35	212
3978	1377	iOS app	2	2	07:05:48	212
5743	1988	Debit Card	2	3	11:51:42	212
2071	725	Android app	2	3	09:33:31	212
3962	1369	Credit Card	2	2	16:11:48	212
4788	1651	Android app	2	1	10:44:29	212
6068	2096	Credit Card	2	3	09:39:47	212
1154	397	iOS app	2	4	17:48:11	212
3309	1153	Debit Card	2	2	10:37:19	212
5302	1830	Credit Card	2	3	10:56:31	212
222	69	iOS app	2	3	04:08:09	212
2350	819	Credit Card	2	3	15:22:30	212
2211	775	iOS app	2	1	12:41:49	212
178	56	Debit Card	2	4	17:28:28	212
4895	1686	Debit Card	2	4	14:14:15	212
850	294	iOS app	3	1	14:34:17	440
3320	1156	Debit Card	2	3	07:24:28	212
1517	529	iOS app	2	3	11:22:28	212
3324	1157	Debit Card	2	3	08:27:32	212
3946	1362	Credit Card	2	3	15:31:56	212
3941	1361	iOS app	2	1	09:56:20	212
2367	827	Credit Card	2	4	13:16:44	212
816	281	Debit Card	2	1	04:40:07	212
4780	1649	Credit Card	2	1	13:52:06	212
4891	1685	iOS app	2	1	15:52:42	212
3930	1357	iOS app	2	3	10:51:52	212
1524	531	Credit Card	2	2	07:20:17	212
5736	1986	Credit Card	2	3	11:23:58	212
3338	1160	Credit Card	2	1	08:50:55	212
1528	533	Credit Card	2	3	06:20:57	212
1168	402	Credit Card	2	2	09:19:13	212
2291	801	Credit Card	2	3	16:31:04	212
5296	1828	iOS app	2	3	11:48:30	212
1864	646	Android app	2	3	09:43:35	212
5948	2056	Android app	2	1	04:03:00	212
3354	1166	iOS app	2	3	05:35:40	212
3927	1356	Credit Card	2	3	06:30:32	212
540	183	Credit Card	2	4	07:27:54	212
3359	1168	Android app	2	1	06:24:31	212
2393	837	iOS app	2	1	15:56:17	212
5095	1757	iOS app	2	2	05:55:58	212
6102	2107	iOS app	2	1	08:50:47	212
3907	1348	iOS app	2	1	09:17:07	212
5841	2025	iOS app	2	1	16:22:04	212
1541	538	iOS app	2	1	17:49:09	212
3903	1347	Credit Card	2	4	06:37:29	212
2088	732	Android app	2	3	06:39:25	212
1177	406	iOS app	2	1	09:51:48	212
1545	540	Credit Card	2	2	04:05:07	212
545	185	Credit Card	2	4	10:39:32	212
2	1	Debit Card	3	2	09:41:18	440
11	4	iOS app	3	3	10:33:23	440
19	7	Credit Card	3	2	05:46:58	440
22	8	Credit Card	3	2	06:32:18	440
34	12	Debit Card	3	3	17:30:03	440
40	14	Debit Card	3	4	17:54:31	440
43	15	Debit Card	3	4	13:04:38	440
47	16	Credit Card	3	2	16:26:44	440
50	17	Android app	3	1	12:53:36	440
53	18	iOS app	3	2	07:34:10	440
57	19	Android app	3	1	05:10:38	440
60	20	Debit Card	3	3	10:32:49	440
63	21	Credit Card	3	4	07:43:09	440
67	23	iOS app	3	3	04:47:48	440
72	24	iOS app	3	1	10:11:40	440
76	25	Debit Card	3	2	11:47:38	440
80	27	Debit Card	3	3	10:54:34	440
86	29	Credit Card	3	3	08:31:18	440
90	30	Debit Card	3	2	17:02:31	440
94	31	Credit Card	3	2	15:04:26	440
98	32	iOS app	3	1	11:15:11	440
101	33	iOS app	3	1	17:41:00	440
103	34	iOS app	3	1	05:16:53	440
107	35	iOS app	3	4	08:45:11	440
111	36	iOS app	3	2	05:37:54	440
118	37	Debit Card	3	3	13:49:29	440
122	39	iOS app	3	2	09:55:29	440
125	40	iOS app	3	3	17:06:20	440
128	41	Debit Card	3	3	09:20:27	440
135	43	Credit Card	3	3	11:11:13	440
138	44	iOS app	3	1	16:16:28	440
143	45	Debit Card	3	3	06:21:46	440
146	46	Credit Card	3	3	09:41:14	440
151	47	Android app	3	1	07:02:07	440
156	49	Credit Card	3	4	04:05:39	440
159	51	Credit Card	3	3	15:11:26	440
165	53	iOS app	3	1	04:07:15	440
180	57	iOS app	3	4	05:40:54	440
188	59	Debit Card	3	2	04:23:34	440
195	60	Android app	3	2	05:36:40	440
199	61	Debit Card	3	4	18:06:01	440
202	62	Debit Card	3	3	14:27:53	440
209	65	Credit Card	3	4	05:53:27	440
216	67	Debit Card	3	4	04:46:36	440
219	68	Credit Card	3	2	04:58:29	440
221	69	iOS app	3	3	04:08:09	440
225	70	iOS app	3	3	08:14:21	440
229	71	Debit Card	3	2	10:41:09	440
242	76	iOS app	3	1	09:41:30	440
245	77	Credit Card	3	4	10:10:51	440
248	78	Debit Card	3	4	12:41:35	440
252	79	iOS app	3	2	11:00:33	440
258	80	Credit Card	3	3	09:34:02	440
265	82	iOS app	3	1	12:23:56	440
272	85	iOS app	3	3	16:16:52	440
278	87	Credit Card	3	2	09:26:12	440
282	89	Credit Card	3	3	10:04:30	440
287	91	Android app	3	1	09:08:12	440
291	93	Debit Card	3	3	06:43:47	440
295	95	Credit Card	3	3	07:18:22	440
297	96	Credit Card	3	3	04:20:05	440
302	98	iOS app	3	1	08:36:11	440
307	99	iOS app	3	1	13:18:51	440
310	100	iOS app	3	1	17:08:18	440
313	101	Debit Card	3	4	08:01:08	440
317	102	Android app	3	1	16:10:02	440
321	103	Credit Card	3	3	05:56:57	440
326	104	Debit Card	3	2	08:25:29	440
331	108	Credit Card	3	3	17:38:08	440
338	111	iOS app	3	3	11:34:39	440
342	112	Debit Card	3	3	11:37:40	440
345	113	Credit Card	3	3	09:40:52	440
349	114	Credit Card	3	4	08:17:59	440
353	115	iOS app	3	1	13:43:34	440
365	120	Android app	3	1	05:35:19	440
368	121	iOS app	3	2	17:06:49	440
372	124	Credit Card	3	3	18:15:01	440
375	125	Credit Card	3	3	17:24:22	440
379	127	Debit Card	3	4	07:27:00	440
387	129	Credit Card	3	2	06:02:26	440
390	131	iOS app	3	3	03:53:38	440
393	132	Credit Card	3	2	10:48:10	440
399	135	Android app	3	3	17:37:30	440
403	136	Credit Card	3	3	10:49:31	440
408	139	iOS app	3	2	03:47:56	440
410	140	iOS app	3	2	10:51:11	440
415	142	Debit Card	3	3	10:35:15	440
419	143	Android app	3	3	04:55:39	440
426	145	Credit Card	3	3	04:37:42	440
430	146	Credit Card	3	3	08:14:31	440
435	149	Android app	3	1	06:19:06	440
442	151	Credit Card	3	4	15:01:52	440
446	152	Debit Card	3	3	04:58:08	440
449	153	Debit Card	3	3	15:39:05	440
454	154	Credit Card	3	3	09:44:49	440
460	157	iOS app	3	1	11:58:05	440
464	158	iOS app	3	3	11:41:11	440
469	160	iOS app	3	2	13:58:39	440
472	161	Debit Card	3	3	06:24:22	440
474	162	Credit Card	3	4	10:04:14	440
477	163	Credit Card	3	2	07:18:03	440
484	165	iOS app	3	1	04:37:26	440
487	166	Debit Card	3	3	17:24:54	440
492	167	iOS app	3	2	10:32:17	440
495	168	Credit Card	3	3	17:50:30	440
497	169	Credit Card	3	4	08:11:10	440
501	170	Debit Card	3	2	10:02:26	440
506	172	Debit Card	3	2	16:42:35	440
509	173	Android app	3	1	11:02:14	440
511	174	Credit Card	3	2	18:17:11	440
518	176	iOS app	3	3	14:37:35	440
524	177	Credit Card	3	3	07:15:40	440
528	178	iOS app	3	1	14:38:11	440
531	179	iOS app	3	3	09:08:49	440
538	182	Android app	3	1	07:40:51	440
544	185	Credit Card	3	4	10:39:32	440
548	186	Credit Card	3	2	15:50:32	440
551	187	Debit Card	3	4	10:48:48	440
553	188	Android app	3	4	17:29:22	440
563	192	Credit Card	3	4	05:44:35	440
566	193	Credit Card	3	3	16:03:14	440
569	195	Credit Card	3	2	15:49:12	440
574	197	Credit Card	3	3	05:44:17	440
580	200	iOS app	3	1	09:23:01	440
584	201	iOS app	3	3	09:54:39	440
593	206	Debit Card	3	3	05:15:07	440
598	207	Credit Card	3	4	12:13:38	440
605	209	iOS app	3	3	14:01:28	440
609	211	Credit Card	3	2	09:47:39	440
613	212	Android app	3	4	04:30:11	440
616	214	Credit Card	3	3	11:51:34	440
621	215	Android app	3	3	11:08:20	440
623	216	Credit Card	3	2	07:26:07	440
625	217	Android app	3	4	11:17:35	440
628	219	Debit Card	3	2	05:39:02	440
632	220	Credit Card	3	3	09:18:57	440
640	223	Credit Card	3	3	10:21:48	440
643	224	Android app	3	1	18:46:02	440
649	226	Credit Card	3	3	08:04:16	440
652	227	Debit Card	3	3	12:54:55	440
655	228	Credit Card	3	3	08:09:14	440
660	229	iOS app	3	1	09:28:57	440
662	230	Debit Card	3	2	12:26:07	440
666	231	iOS app	3	1	08:59:50	440
673	234	Android app	3	3	05:32:53	440
679	236	Credit Card	3	1	11:23:02	440
685	237	Credit Card	3	3	10:54:57	440
688	238	iOS app	3	1	03:33:31	440
691	239	Credit Card	3	2	09:04:29	440
696	241	Debit Card	3	2	17:19:48	440
699	242	Debit Card	3	2	05:19:00	440
703	243	Credit Card	3	3	04:08:28	440
708	244	Debit Card	3	3	05:14:36	440
710	245	iOS app	3	1	04:56:12	440
716	247	Debit Card	3	3	07:36:21	440
718	248	Credit Card	3	2	17:33:14	440
726	250	iOS app	3	4	08:36:40	440
730	252	Credit Card	3	3	07:12:50	440
733	253	Android app	3	1	09:31:34	440
737	255	Android app	3	1	16:42:01	440
740	256	Credit Card	3	3	05:32:02	440
744	258	iOS app	3	1	07:54:53	440
750	261	iOS app	3	1	09:32:44	440
754	262	Debit Card	3	3	05:25:56	440
757	263	Debit Card	3	2	05:05:12	440
759	264	iOS app	3	4	08:27:30	440
763	265	Android app	3	4	03:14:46	440
766	266	Android app	3	1	11:07:45	440
770	267	Credit Card	3	3	11:53:12	440
773	268	Debit Card	3	3	04:53:29	440
777	269	Credit Card	3	3	18:39:49	440
780	270	Credit Card	3	2	06:12:10	440
782	271	Android app	3	3	10:24:47	440
790	274	Debit Card	3	4	10:27:05	440
793	275	Credit Card	3	4	04:41:12	440
798	276	iOS app	3	1	08:19:17	440
803	277	Android app	3	2	09:26:07	440
806	278	Debit Card	3	4	16:35:28	440
811	280	iOS app	3	3	14:09:25	440
815	281	Debit Card	3	1	04:40:07	440
818	282	iOS app	3	2	13:11:33	440
825	286	iOS app	3	4	08:31:10	440
830	287	iOS app	3	1	06:10:14	440
833	288	iOS app	3	1	18:50:24	440
836	289	Credit Card	3	3	09:02:21	440
839	290	Credit Card	3	3	10:40:00	440
845	292	Credit Card	3	4	06:54:14	440
857	296	Debit Card	3	3	07:55:50	440
860	297	iOS app	3	3	05:52:09	440
863	298	iOS app	3	3	14:55:13	440
868	299	Debit Card	3	1	03:49:23	440
871	300	Android app	3	3	07:01:23	440
879	302	Credit Card	3	3	08:45:19	440
883	304	Credit Card	3	2	05:15:32	440
886	305	iOS app	3	3	09:01:43	440
892	307	iOS app	3	1	04:01:19	440
895	308	Debit Card	3	3	15:07:38	440
904	311	Credit Card	3	2	08:16:25	440
907	312	Debit Card	3	3	07:13:08	440
911	313	Android app	3	3	16:17:37	440
917	315	Debit Card	3	3	17:28:00	440
921	316	iOS app	3	1	03:48:52	440
926	318	Debit Card	3	2	13:42:37	440
929	319	iOS app	3	1	05:14:32	440
932	320	Android app	3	1	15:50:19	440
935	321	iOS app	3	3	09:15:30	440
938	322	Debit Card	3	2	17:31:31	440
940	323	iOS app	3	3	10:12:48	440
946	325	Android app	3	1	05:31:53	440
952	327	Debit Card	3	3	11:52:52	440
958	328	Debit Card	3	3	12:16:41	440
964	329	Credit Card	3	4	03:53:44	440
966	330	Android app	3	1	06:34:40	440
969	331	Android app	3	3	05:55:54	440
973	332	iOS app	3	2	10:15:28	440
976	333	Credit Card	3	3	09:27:22	440
979	334	Android app	3	3	16:41:59	440
985	336	iOS app	3	2	08:47:01	440
997	340	Android app	3	1	06:25:47	440
1001	341	Credit Card	3	2	07:49:19	440
1003	342	iOS app	3	3	09:38:04	440
1009	344	Credit Card	3	4	11:24:04	440
1014	346	Credit Card	3	1	05:21:30	440
1020	349	iOS app	3	1	08:10:11	440
1023	350	Debit Card	3	3	06:07:24	440
1027	352	Debit Card	3	4	08:07:59	440
1035	356	Credit Card	3	3	14:44:16	440
1039	357	Debit Card	3	3	15:02:05	440
1056	363	Android app	3	1	05:52:41	440
1060	364	Debit Card	3	3	18:57:42	440
1063	365	Android app	3	3	05:40:58	440
1066	366	Credit Card	3	3	05:07:44	440
1071	367	Credit Card	3	1	08:57:29	440
1076	369	Credit Card	3	3	17:55:38	440
1086	373	Credit Card	3	4	04:32:38	440
1096	377	Credit Card	3	3	04:27:00	440
1099	378	iOS app	3	1	11:52:52	440
1102	379	Android app	3	1	07:58:05	440
1108	383	Android app	3	1	15:20:31	440
1123	388	Credit Card	3	2	10:52:25	440
1129	389	Debit Card	3	2	09:10:34	440
1132	390	Android app	3	1	15:17:17	440
1138	391	Debit Card	3	2	09:18:08	440
1142	392	Credit Card	3	2	06:55:41	440
1152	397	iOS app	3	4	17:48:11	440
1158	398	iOS app	3	2	05:12:42	440
1160	399	iOS app	3	1	05:30:43	440
1165	401	Android app	3	2	07:01:39	440
1167	402	Credit Card	3	2	09:19:13	440
1173	404	Debit Card	3	2	03:57:41	440
1176	406	iOS app	3	1	09:51:48	440
1181	408	Android app	3	3	11:36:30	440
1184	409	iOS app	3	2	10:21:33	440
1191	411	Credit Card	3	2	10:40:31	440
1194	412	iOS app	3	2	14:47:06	440
1197	414	Android app	3	2	10:11:18	440
1199	415	iOS app	3	1	06:53:11	440
1202	416	Debit Card	3	4	07:10:48	440
1211	419	Credit Card	3	2	05:33:44	440
1214	420	Credit Card	3	2	07:04:52	440
1217	421	Credit Card	3	3	10:44:19	440
1222	423	Credit Card	3	2	13:25:19	440
1231	426	iOS app	3	3	13:28:23	440
1235	427	Credit Card	3	3	06:21:28	440
1243	431	Debit Card	3	4	08:18:04	440
1247	432	Credit Card	3	1	11:37:32	440
1251	434	Android app	3	1	17:48:46	440
1255	435	iOS app	3	1	05:04:08	440
1259	437	Android app	3	3	10:36:08	440
1264	439	iOS app	3	3	04:36:50	440
1268	440	Credit Card	3	4	09:17:46	440
1271	441	Debit Card	3	3	10:59:58	440
1274	442	Debit Card	3	2	13:30:24	440
1277	443	Android app	3	1	08:19:07	440
1281	445	Debit Card	3	1	05:05:07	440
1285	447	iOS app	3	3	17:47:44	440
1288	448	iOS app	3	4	05:24:46	440
1297	450	Android app	3	1	11:31:17	440
1299	451	iOS app	3	1	09:41:19	440
1303	452	Credit Card	3	2	09:48:48	440
1309	454	Credit Card	3	1	07:39:56	440
1313	455	Credit Card	3	3	05:21:13	440
1317	456	Credit Card	3	2	14:13:54	440
1320	458	iOS app	3	4	09:36:40	440
1325	460	Credit Card	3	3	14:54:36	440
1331	463	Credit Card	3	3	10:11:22	440
1337	465	Android app	3	1	13:55:09	440
1342	467	iOS app	3	2	07:14:08	440
1346	468	iOS app	3	1	06:30:47	440
1350	470	iOS app	3	2	11:12:37	440
1355	473	iOS app	3	1	11:07:09	440
1357	474	Credit Card	3	3	04:47:53	440
1361	475	Android app	3	1	07:13:38	440
1366	477	Debit Card	3	3	16:34:12	440
1376	480	iOS app	3	1	04:38:54	440
1381	482	Credit Card	3	3	04:03:55	440
1385	483	iOS app	3	3	04:19:01	440
1866	647	iOS app	3	1	04:31:41	440
1387	484	Android app	3	1	05:23:44	440
1391	485	Debit Card	3	4	15:35:01	440
1395	486	Credit Card	3	3	07:18:44	440
1398	487	Credit Card	3	4	13:42:08	440
1402	488	Credit Card	3	3	16:43:32	440
1406	490	Credit Card	3	3	07:46:50	440
1411	492	Android app	3	3	10:45:41	440
1416	494	Credit Card	3	2	17:23:12	440
1419	495	Android app	3	1	10:24:10	440
1421	496	Debit Card	3	3	10:31:35	440
1426	499	Android app	3	3	06:28:31	440
1430	500	Android app	3	1	03:33:32	440
1434	501	Credit Card	3	2	15:14:31	440
1437	502	Debit Card	3	2	09:47:16	440
1440	503	Credit Card	3	3	07:31:29	440
1442	504	Credit Card	3	4	16:44:14	440
1451	507	Credit Card	3	1	10:58:52	440
1456	508	Debit Card	3	2	12:51:33	440
1460	509	Credit Card	3	4	08:51:55	440
1463	510	Credit Card	3	3	10:49:11	440
1469	511	Credit Card	3	2	06:16:30	440
1474	512	iOS app	3	2	16:50:35	440
1476	513	Debit Card	3	1	09:56:01	440
1482	516	iOS app	3	3	14:16:47	440
1487	518	Debit Card	3	3	05:11:11	440
1492	520	Debit Card	3	2	09:30:18	440
1497	522	Android app	3	3	11:07:35	440
1501	523	iOS app	3	1	08:09:30	440
1507	525	Debit Card	3	2	17:32:28	440
1512	528	Debit Card	3	2	17:36:00	440
1515	529	iOS app	3	3	11:22:28	440
1519	530	Debit Card	3	2	15:49:12	440
1522	531	Credit Card	3	2	07:20:17	440
1527	533	Credit Card	3	3	06:20:57	440
1532	535	Credit Card	3	3	07:37:53	440
1535	536	Credit Card	3	4	04:54:48	440
1540	538	iOS app	3	1	17:49:09	440
1544	540	Credit Card	3	2	04:05:07	440
1548	542	Android app	3	3	06:44:29	440
1550	543	Android app	3	1	08:48:26	440
1556	546	iOS app	3	1	17:54:09	440
1560	547	iOS app	3	1	09:41:50	440
1569	549	Credit Card	3	3	17:15:01	440
1575	551	Credit Card	3	3	09:15:09	440
1577	552	Debit Card	3	4	18:38:45	440
1580	553	iOS app	3	4	05:48:19	440
1585	555	iOS app	3	2	07:42:54	440
1594	558	Credit Card	3	3	08:54:34	440
1599	560	iOS app	3	2	07:29:15	440
1609	564	Android app	3	1	15:53:03	440
1613	565	Android app	3	3	05:39:35	440
1617	566	Credit Card	3	3	18:39:52	440
1621	567	Debit Card	3	3	04:24:03	440
1624	568	Credit Card	3	3	06:47:55	440
1628	569	Debit Card	3	3	05:48:22	440
1633	570	Android app	3	2	10:43:33	440
1636	571	Android app	3	1	10:48:15	440
1640	572	iOS app	3	2	09:57:07	440
1643	573	Debit Card	3	3	04:17:43	440
1646	574	Debit Card	3	1	03:29:43	440
1649	575	Credit Card	3	2	13:04:34	440
1652	576	Debit Card	3	2	11:09:54	440
1654	577	Credit Card	3	4	09:34:08	440
1657	578	iOS app	3	1	09:17:11	440
1660	579	Debit Card	3	4	10:15:37	440
1666	580	Credit Card	3	3	03:31:59	440
1670	581	Credit Card	3	2	18:22:46	440
1674	582	Debit Card	3	1	05:39:18	440
1679	585	Debit Card	3	3	06:30:41	440
1687	588	Android app	3	1	10:19:39	440
1691	589	Credit Card	3	3	17:45:25	440
1694	590	Credit Card	3	3	06:46:16	440
1697	591	iOS app	3	3	17:45:04	440
1699	592	iOS app	3	1	10:34:20	440
1705	593	Credit Card	3	2	06:42:14	440
1709	594	Debit Card	3	2	07:49:58	440
1712	595	Debit Card	3	3	06:37:15	440
1716	597	Credit Card	3	3	09:28:45	440
1721	600	iOS app	3	1	04:05:26	440
1725	601	Credit Card	3	3	06:51:40	440
1728	603	Debit Card	3	2	07:32:37	440
1732	604	iOS app	3	1	10:37:04	440
1737	605	Android app	3	1	07:42:41	440
1741	606	Android app	3	1	10:46:41	440
1748	608	Debit Card	3	4	12:58:03	440
1751	609	Credit Card	3	3	11:35:34	440
1759	612	Debit Card	3	2	04:09:29	440
1767	615	Credit Card	3	3	04:07:42	440
1770	616	iOS app	3	3	10:08:16	440
1773	617	Credit Card	3	2	07:16:41	440
1776	618	Debit Card	3	3	18:55:58	440
1782	620	Credit Card	3	3	04:37:12	440
1790	624	iOS app	3	3	10:50:20	440
1798	626	iOS app	3	1	10:12:23	440
1806	628	Credit Card	3	3	11:29:25	440
1809	629	Debit Card	3	3	17:14:15	440
1812	630	Android app	3	3	09:32:19	440
1818	631	Credit Card	3	3	06:16:43	440
1820	632	Credit Card	3	3	07:50:05	440
1823	633	Android app	3	1	12:30:31	440
1826	634	iOS app	3	1	12:37:17	440
1829	635	Debit Card	3	4	17:36:30	440
1833	636	iOS app	3	1	10:25:43	440
1843	640	Credit Card	3	3	04:45:27	440
1846	641	Credit Card	3	2	17:25:57	440
1849	642	Debit Card	3	1	11:33:31	440
1851	643	Android app	3	1	16:33:00	440
1856	644	Credit Card	3	3	07:06:32	440
1863	646	Android app	3	3	09:43:35	440
1872	651	Debit Card	3	2	14:22:36	440
1885	655	Credit Card	3	2	10:32:04	440
1890	657	Credit Card	3	3	10:39:46	440
1892	658	Credit Card	3	2	10:37:39	440
1894	659	Credit Card	3	2	14:21:36	440
1900	661	Android app	3	3	09:33:29	440
1904	663	Debit Card	3	2	08:42:33	440
1907	664	Debit Card	3	4	08:20:25	440
1917	667	Credit Card	3	2	11:34:38	440
1922	669	Android app	3	3	15:26:18	440
1933	673	Credit Card	3	3	17:08:16	440
1937	674	iOS app	3	1	09:17:13	440
1940	675	iOS app	3	3	08:00:01	440
1950	679	iOS app	3	3	12:43:07	440
1956	680	Credit Card	3	2	10:40:35	440
1962	682	Credit Card	3	3	10:00:27	440
1965	683	Debit Card	3	3	04:58:56	440
1968	684	iOS app	3	1	09:07:39	440
1970	685	Credit Card	3	1	09:40:29	440
1977	687	iOS app	3	1	07:56:39	440
1979	688	Credit Card	3	2	04:15:31	440
1985	690	Credit Card	3	2	09:45:33	440
1987	691	Debit Card	3	2	10:44:25	440
1991	692	Credit Card	3	3	14:44:49	440
1996	695	Debit Card	3	4	07:23:23	440
1999	696	Credit Card	3	3	09:20:57	440
2002	697	Debit Card	3	3	05:28:20	440
2004	698	Credit Card	3	3	10:54:25	440
2008	699	Credit Card	3	3	06:28:43	440
2012	701	Credit Card	3	2	17:57:58	440
2016	703	Debit Card	3	3	14:04:29	440
2021	705	Credit Card	3	2	12:54:52	440
2025	707	Credit Card	3	3	11:19:05	440
2031	709	Android app	3	1	03:30:02	440
2034	710	Credit Card	3	3	06:36:48	440
2047	717	iOS app	3	3	07:26:45	440
2051	718	Debit Card	3	2	13:37:34	440
2057	721	Credit Card	3	3	09:14:47	440
2063	723	Debit Card	3	4	10:24:38	440
2067	724	Credit Card	3	4	15:01:02	440
2070	725	Android app	3	3	09:33:31	440
2077	728	Android app	3	1	06:44:05	440
2081	730	Debit Card	3	3	11:32:10	440
2087	732	Android app	3	3	06:39:25	440
2094	734	Android app	3	3	16:20:19	440
2096	735	Credit Card	3	3	07:06:56	440
2100	736	Android app	3	1	11:49:04	440
2102	737	Credit Card	3	2	09:06:52	440
2105	738	Credit Card	3	3	16:33:44	440
2112	740	Credit Card	3	2	04:20:05	440
2115	742	Credit Card	3	3	05:59:19	440
2118	743	Debit Card	3	3	14:59:02	440
2124	746	Credit Card	3	2	08:59:00	440
2129	748	Debit Card	3	4	17:17:47	440
2133	749	Credit Card	3	4	15:43:34	440
2138	750	Android app	3	4	12:44:13	440
2148	753	Credit Card	3	4	07:21:03	440
2153	755	Debit Card	3	2	11:17:46	440
2157	756	Debit Card	3	2	07:58:36	440
2161	758	Credit Card	3	2	08:26:51	440
2165	759	iOS app	3	4	11:15:58	440
2172	761	iOS app	3	1	09:20:20	440
2176	762	Debit Card	3	3	03:13:44	440
2179	763	Debit Card	3	3	09:35:48	440
2185	766	iOS app	3	3	11:29:29	440
2191	769	Debit Card	3	2	10:54:03	440
2195	770	Debit Card	3	3	15:55:57	440
2200	771	iOS app	3	3	05:58:52	440
2216	777	Android app	3	1	17:48:16	440
2223	779	Credit Card	3	3	16:32:20	440
2229	781	iOS app	3	1	15:26:55	440
2233	783	iOS app	3	2	17:36:52	440
2238	785	Credit Card	3	3	13:20:39	440
2240	786	iOS app	3	3	14:10:01	440
2243	787	Credit Card	3	3	14:35:53	440
2246	788	iOS app	3	2	08:19:58	440
2250	789	Debit Card	3	1	04:53:00	440
2253	790	Debit Card	3	3	10:27:23	440
2255	791	Debit Card	3	3	05:41:39	440
2258	792	Debit Card	3	4	05:28:59	440
2263	793	Debit Card	3	2	12:44:52	440
2267	794	iOS app	3	1	15:47:40	440
2272	795	Debit Card	3	2	03:56:27	440
2275	796	iOS app	3	1	17:02:30	440
2278	797	Credit Card	3	3	09:19:35	440
2281	798	Credit Card	3	3	08:08:22	440
2285	799	Debit Card	3	4	14:47:11	440
2288	800	Credit Card	3	1	06:08:50	440
2296	802	iOS app	3	3	10:48:05	440
2301	805	iOS app	3	2	07:47:33	440
2308	807	Credit Card	3	3	04:27:24	440
2312	808	Debit Card	3	3	05:09:22	440
2318	809	Debit Card	3	2	18:05:43	440
2323	811	Android app	3	4	16:48:06	440
2328	812	Credit Card	3	2	10:48:18	440
2331	813	Credit Card	3	2	11:56:20	440
2333	814	iOS app	3	1	16:51:52	440
2340	816	iOS app	3	3	13:41:16	440
2344	817	Credit Card	3	3	06:02:05	440
2346	818	Credit Card	3	3	11:23:00	440
2349	819	Credit Card	3	3	15:22:30	440
2355	821	iOS app	3	1	09:37:20	440
2357	822	Android app	3	1	05:18:11	440
2364	826	Debit Card	3	2	09:20:07	440
2366	827	Credit Card	3	4	13:16:44	440
2371	828	iOS app	3	3	05:58:39	440
2375	829	Credit Card	3	2	15:03:56	440
2378	831	Android app	3	3	08:25:36	440
2391	837	iOS app	3	1	15:56:17	440
2396	838	iOS app	3	1	14:37:56	440
2399	839	iOS app	3	4	03:36:46	440
2401	840	Debit Card	3	3	04:34:37	440
2405	841	Credit Card	3	2	14:30:46	440
2407	842	Credit Card	3	1	04:45:27	440
2413	844	iOS app	3	1	06:25:05	440
2417	845	Credit Card	3	3	12:53:12	440
2421	846	iOS app	3	1	14:58:34	440
2427	848	Android app	3	1	15:10:05	440
2431	849	Android app	3	4	10:57:50	440
2436	851	Credit Card	3	3	17:23:14	440
2440	852	Credit Card	3	3	06:24:23	440
2446	854	iOS app	3	2	11:15:44	440
2450	855	Credit Card	3	2	04:01:55	440
2453	856	Credit Card	3	1	08:48:52	440
2456	857	iOS app	3	4	10:55:23	440
2460	858	Debit Card	3	2	11:07:47	440
2463	859	iOS app	3	3	11:01:11	440
2466	860	iOS app	3	2	08:54:19	440
2470	861	Credit Card	3	3	08:07:53	440
2476	863	iOS app	3	1	17:55:35	440
2483	864	Credit Card	3	2	15:55:06	440
2487	865	Android app	3	3	03:52:27	440
2489	866	Debit Card	3	2	09:04:34	440
2492	867	iOS app	3	1	10:06:34	440
2496	868	Credit Card	3	2	05:02:01	440
2499	869	iOS app	3	2	17:57:55	440
2504	870	Android app	3	3	14:20:30	440
2517	875	iOS app	3	2	06:42:42	440
2520	876	Android app	3	1	08:21:15	440
2529	880	Android app	3	2	12:34:22	440
2533	882	Credit Card	3	2	11:42:18	440
2536	883	Debit Card	3	2	16:44:04	440
2539	884	iOS app	3	2	11:57:17	440
2542	885	Android app	3	1	06:12:22	440
2545	886	Credit Card	3	3	15:39:53	440
2548	887	Android app	3	2	10:01:54	440
2553	889	Credit Card	3	2	10:06:18	440
2557	890	Credit Card	3	1	09:27:37	440
2561	891	Debit Card	3	3	17:33:10	440
2565	892	Credit Card	3	4	15:53:16	440
2568	893	Credit Card	3	1	11:05:19	440
2571	894	Debit Card	3	3	10:44:45	440
2580	898	Debit Card	3	2	08:10:27	440
2588	900	Android app	3	1	06:07:48	440
2594	903	iOS app	3	1	07:57:42	440
2596	904	Android app	3	1	18:24:09	440
2603	907	Credit Card	3	3	04:41:16	440
2618	912	Credit Card	3	3	03:28:12	440
2622	914	Credit Card	3	3	07:56:38	440
2626	916	iOS app	3	1	17:19:28	440
2633	917	Credit Card	3	2	10:33:47	440
2635	918	Credit Card	3	3	17:16:53	440
2637	919	Android app	3	1	07:37:19	440
2640	920	iOS app	3	1	08:09:04	440
2642	921	iOS app	3	1	10:27:20	440
2648	923	Debit Card	3	2	15:11:25	440
2652	925	Credit Card	3	3	11:06:45	440
2658	927	iOS app	3	4	10:40:57	440
2662	928	Credit Card	3	3	10:46:53	440
2667	930	iOS app	3	2	06:53:22	440
2670	931	Android app	3	3	05:24:00	440
2677	935	Credit Card	3	3	18:40:45	440
2686	938	Credit Card	3	2	09:50:58	440
2690	940	Credit Card	3	3	04:06:55	440
2692	941	Credit Card	3	3	15:08:47	440
2701	943	Credit Card	3	3	17:14:25	440
2704	944	Debit Card	3	3	15:31:46	440
2707	945	Android app	3	1	03:22:28	440
2710	946	Debit Card	3	4	09:44:23	440
2715	949	Credit Card	3	2	08:46:02	440
2718	950	Debit Card	3	3	16:51:06	440
2727	953	Android app	3	1	05:05:26	440
2731	955	iOS app	3	3	17:03:01	440
2733	956	Debit Card	3	4	10:04:15	440
2737	957	iOS app	3	1	17:44:06	440
2744	959	Android app	3	3	09:58:32	440
2749	961	iOS app	3	3	06:54:01	440
2751	962	Debit Card	3	4	11:03:28	440
2756	963	Debit Card	3	3	05:38:06	440
2761	965	Debit Card	3	4	16:28:37	440
2765	966	Debit Card	3	2	09:53:40	440
2770	968	iOS app	3	3	06:36:26	440
2774	969	Credit Card	3	2	07:20:39	440
2777	970	iOS app	3	3	06:51:51	440
2782	972	Debit Card	3	2	17:01:10	440
2786	973	iOS app	3	1	06:39:35	440
2791	975	iOS app	3	1	04:15:02	440
2799	978	Android app	3	1	13:02:03	440
2803	979	Debit Card	3	1	10:25:22	440
2808	980	Credit Card	3	3	14:37:05	440
2814	983	Debit Card	3	4	16:25:32	440
2818	984	iOS app	3	3	07:28:57	440
2825	986	iOS app	3	3	10:14:40	440
2828	987	Credit Card	3	3	11:21:52	440
2834	989	iOS app	3	4	17:35:00	440
2839	990	Credit Card	3	3	17:58:16	440
2844	992	Debit Card	3	4	11:23:47	440
2846	993	Debit Card	3	2	10:04:08	440
2849	994	Credit Card	3	2	08:17:28	440
2853	995	iOS app	3	3	11:08:04	440
2858	996	iOS app	3	1	15:22:38	440
2864	997	iOS app	3	2	04:50:34	440
2867	998	Credit Card	3	3	07:37:23	440
2871	1000	iOS app	3	3	11:01:15	440
2875	1001	iOS app	3	1	09:40:58	440
2878	1002	Credit Card	3	3	05:01:35	440
2881	1003	Credit Card	3	2	18:46:00	440
2885	1004	iOS app	3	3	10:15:37	440
2888	1005	iOS app	3	1	10:36:28	440
2896	1007	Credit Card	3	3	14:26:25	440
2903	1010	Credit Card	3	2	10:22:07	440
2907	1012	iOS app	3	1	06:42:28	440
2909	1013	Credit Card	3	3	09:13:40	440
2912	1014	iOS app	3	4	10:19:19	440
2916	1016	Debit Card	3	2	04:14:09	440
2920	1018	Android app	3	2	05:17:25	440
2924	1019	iOS app	3	1	08:29:29	440
2938	1024	Android app	3	1	15:08:36	440
2945	1026	Android app	3	1	11:05:57	440
2948	1027	Credit Card	3	2	15:32:38	440
2951	1028	iOS app	3	2	10:15:48	440
2954	1029	Credit Card	3	2	10:06:07	440
2963	1031	Android app	3	1	10:05:49	440
2967	1032	Debit Card	3	3	16:24:45	440
2970	1033	Credit Card	3	2	05:06:53	440
2974	1035	Debit Card	3	3	04:18:40	440
2977	1036	Debit Card	3	2	04:09:15	440
2983	1038	Debit Card	3	3	14:09:44	440
2988	1039	Android app	3	3	06:48:36	440
2992	1040	iOS app	3	3	16:09:43	440
3001	1043	Credit Card	3	2	12:14:32	440
3004	1044	iOS app	3	2	10:00:02	440
3008	1045	iOS app	3	3	11:25:45	440
3014	1046	Credit Card	3	3	05:59:54	440
3017	1047	iOS app	3	3	09:54:44	440
3020	1049	Credit Card	3	2	13:14:03	440
3023	1050	Debit Card	3	3	16:01:16	440
3027	1052	Android app	3	3	10:49:05	440
3031	1054	Debit Card	3	3	12:15:56	440
3040	1056	Debit Card	3	2	09:05:54	440
3044	1057	iOS app	3	1	09:41:52	440
3046	1058	Debit Card	3	3	18:42:37	440
3052	1061	Credit Card	3	2	03:27:46	440
3055	1062	Android app	3	3	07:05:33	440
3060	1063	Debit Card	3	3	10:43:58	440
3066	1064	Credit Card	3	4	17:50:33	440
3071	1065	Credit Card	3	3	08:42:26	440
3074	1066	Credit Card	3	4	04:20:55	440
3084	1071	iOS app	3	2	14:49:13	440
3087	1072	iOS app	3	3	16:51:20	440
3090	1073	iOS app	3	3	10:46:11	440
3096	1076	Credit Card	3	3	10:22:50	440
3099	1077	Credit Card	3	3	12:32:55	440
3101	1078	iOS app	3	1	05:05:21	440
3106	1080	Debit Card	3	4	06:38:42	440
3108	1081	Android app	3	3	05:01:54	440
3112	1083	Android app	3	1	08:38:51	440
3115	1084	iOS app	3	3	13:46:47	440
3119	1085	Credit Card	3	4	10:01:35	440
3128	1089	Credit Card	3	3	17:32:56	440
3134	1092	Credit Card	3	3	11:48:06	440
3144	1096	Debit Card	3	2	08:32:44	440
3148	1098	Debit Card	3	4	07:27:13	440
3153	1099	Debit Card	3	1	15:47:28	440
3163	1102	iOS app	3	1	16:47:33	440
3165	1103	Android app	3	1	09:25:56	440
3169	1105	Debit Card	3	2	15:14:58	440
3174	1106	Credit Card	3	2	04:18:05	440
3180	1110	Android app	3	3	07:37:15	440
3187	1112	Credit Card	3	3	04:08:10	440
3191	1114	Debit Card	3	1	09:49:43	440
3200	1118	Android app	3	1	14:06:39	440
3203	1119	Credit Card	3	2	11:47:38	440
3207	1120	Credit Card	3	4	13:17:48	440
3211	1121	iOS app	3	1	13:16:16	440
3216	1123	Credit Card	3	3	18:50:28	440
3219	1124	Credit Card	3	3	11:05:00	440
3223	1125	Credit Card	3	1	09:13:11	440
3227	1126	iOS app	3	3	14:25:50	440
3231	1127	Debit Card	3	3	10:42:32	440
3240	1132	Credit Card	3	2	05:06:25	440
3245	1133	iOS app	3	1	07:28:51	440
3249	1134	iOS app	3	2	06:50:50	440
3258	1138	iOS app	3	1	14:04:22	440
3260	1139	Credit Card	3	3	18:11:30	440
3264	1140	iOS app	3	1	17:41:57	440
3272	1142	Credit Card	3	3	09:30:55	440
3278	1143	Credit Card	3	2	06:11:24	440
3284	1145	iOS app	3	1	18:44:39	440
3290	1148	Credit Card	3	3	07:23:19	440
3294	1149	iOS app	3	2	10:52:48	440
3299	1150	Debit Card	3	3	17:47:07	440
3305	1152	Debit Card	3	2	12:48:19	440
3308	1153	Debit Card	3	2	10:37:19	440
3312	1154	Credit Card	3	4	06:27:19	440
3318	1156	Debit Card	3	3	07:24:28	440
3323	1157	Debit Card	3	3	08:27:32	440
3328	1158	iOS app	3	2	16:52:45	440
3332	1159	Credit Card	3	4	10:24:31	440
3336	1160	Credit Card	3	1	08:50:55	440
3342	1162	Debit Card	3	1	06:27:42	440
3345	1163	iOS app	3	3	05:05:52	440
3348	1164	iOS app	3	3	03:45:49	440
3353	1166	iOS app	3	3	05:35:40	440
3366	1170	Android app	3	4	11:24:25	440
3372	1172	iOS app	3	1	15:15:45	440
3375	1173	iOS app	3	1	10:05:10	440
3381	1175	iOS app	3	1	05:38:10	440
3386	1176	iOS app	3	3	13:26:18	440
3392	1179	iOS app	3	1	11:57:26	440
3394	1180	Credit Card	3	2	10:52:56	440
3404	1184	Credit Card	3	3	15:07:07	440
3407	1185	iOS app	3	3	10:06:08	440
3412	1186	iOS app	3	3	14:17:50	440
3415	1187	Android app	3	1	09:17:27	440
3418	1188	Android app	3	2	06:25:12	440
3420	1189	Debit Card	3	3	05:03:47	440
3424	1190	Credit Card	3	2	06:43:26	440
3427	1191	Android app	3	1	16:10:42	440
3431	1192	Credit Card	3	2	08:15:21	440
3434	1193	Debit Card	3	2	10:55:06	440
3438	1194	Android app	3	4	09:48:40	440
3443	1195	iOS app	3	1	12:18:37	440
3446	1196	Debit Card	3	2	08:11:53	440
3455	1198	Credit Card	3	3	10:41:35	440
3460	1200	Android app	3	3	11:03:28	440
3464	1201	Android app	3	3	17:18:12	440
3467	1202	Debit Card	3	2	07:30:57	440
3470	1203	Android app	3	1	12:04:29	440
3478	1206	Credit Card	3	4	09:42:33	440
3480	1207	Debit Card	3	2	09:25:52	440
3484	1209	iOS app	3	2	10:01:05	440
3490	1211	Credit Card	3	2	06:08:48	440
3495	1213	Debit Card	3	2	10:52:07	440
3499	1215	Android app	3	1	10:05:51	440
3502	1216	Credit Card	3	4	18:16:05	440
3508	1218	Debit Card	3	2	18:54:02	440
3511	1219	Debit Card	3	3	06:37:58	440
3514	1220	Credit Card	3	2	14:55:03	440
3517	1221	Android app	3	2	04:47:26	440
3522	1223	iOS app	3	1	06:18:55	440
3525	1224	Debit Card	3	3	14:08:53	440
3529	1225	Debit Card	3	3	09:18:33	440
3533	1226	iOS app	3	3	04:57:08	440
3536	1227	Debit Card	3	2	11:15:58	440
3538	1228	Debit Card	3	3	08:04:19	440
3541	1229	Debit Card	3	2	17:11:17	440
3546	1230	Debit Card	3	2	10:32:26	440
3550	1232	iOS app	3	2	06:33:01	440
3554	1233	Android app	3	1	16:28:40	440
3558	1234	iOS app	3	1	04:51:46	440
3566	1237	Debit Card	3	3	08:39:34	440
3569	1238	iOS app	3	3	11:25:18	440
3572	1239	Credit Card	3	3	10:37:25	440
3577	1240	Android app	3	1	09:06:49	440
3583	1242	Debit Card	3	2	08:11:51	440
3586	1243	Debit Card	3	2	16:43:24	440
3589	1244	Credit Card	3	3	12:47:33	440
3593	1245	Android app	3	3	10:50:27	440
3596	1246	iOS app	3	4	10:16:08	440
3598	1247	iOS app	3	4	13:19:45	440
3603	1249	Debit Card	3	3	11:18:38	440
3608	1251	iOS app	3	1	06:12:44	440
3614	1254	iOS app	3	2	05:36:15	440
3618	1256	iOS app	3	1	08:22:25	440
3624	1258	iOS app	3	2	13:39:18	440
3629	1259	Credit Card	3	2	04:06:40	440
3635	1261	Android app	3	2	17:59:03	440
3638	1262	iOS app	3	2	07:52:06	440
3641	1263	iOS app	3	1	15:45:58	440
3646	1264	iOS app	3	2	06:07:58	440
3653	1266	Debit Card	3	3	04:48:18	440
3655	1267	Android app	3	1	07:04:51	440
3657	1268	iOS app	3	1	09:58:56	440
3659	1269	iOS app	3	4	06:08:31	440
3662	1270	iOS app	3	1	04:27:08	440
3668	1273	Debit Card	3	4	10:28:07	440
3673	1275	Debit Card	3	3	03:33:57	440
3679	1277	Debit Card	3	3	18:06:23	440
3685	1279	iOS app	3	1	13:33:23	440
3689	1281	iOS app	3	3	07:57:03	440
3695	1282	Credit Card	3	2	04:26:39	440
3698	1283	iOS app	3	3	12:37:14	440
3704	1285	Android app	3	1	14:37:13	440
3709	1286	Credit Card	3	3	08:04:24	440
3711	1287	Credit Card	3	2	08:33:00	440
3713	1288	Android app	3	3	11:33:12	440
3716	1289	Android app	3	1	08:32:00	440
3723	1290	Credit Card	3	2	10:17:18	440
3726	1291	iOS app	3	1	18:10:42	440
3732	1293	iOS app	3	2	18:31:48	440
3737	1294	Debit Card	3	4	05:50:11	440
3743	1295	iOS app	3	2	05:39:58	440
3747	1296	Debit Card	3	3	10:53:44	440
3751	1297	iOS app	3	1	11:39:57	440
3759	1302	Android app	3	1	06:10:01	440
3761	1303	Credit Card	3	3	14:30:43	440
3764	1304	Credit Card	3	3	05:35:30	440
3768	1306	iOS app	3	3	13:53:48	440
3771	1307	Debit Card	3	2	12:13:17	440
3774	1308	Debit Card	3	3	11:18:10	440
3779	1309	iOS app	3	3	14:53:28	440
3782	1310	Credit Card	3	3	06:26:21	440
3789	1313	iOS app	3	1	04:30:13	440
3794	1314	Android app	3	4	12:04:00	440
3801	1316	iOS app	3	1	09:08:47	440
3804	1317	iOS app	3	4	05:17:30	440
3810	1318	Debit Card	3	3	04:16:32	440
3813	1319	Debit Card	3	2	12:39:15	440
3817	1321	iOS app	3	3	13:19:41	440
3819	1322	Android app	3	1	11:08:26	440
3823	1323	Credit Card	3	3	11:33:33	440
3830	1326	Credit Card	3	2	04:08:35	440
3832	1327	Credit Card	3	3	10:22:17	440
3838	1329	Debit Card	3	1	05:05:25	440
3844	1330	iOS app	3	1	14:04:33	440
3849	1331	Credit Card	3	1	15:07:15	440
3856	1334	Debit Card	3	2	10:02:49	440
3861	1335	Credit Card	3	4	06:14:58	440
3866	1336	Debit Card	3	1	04:12:12	440
3869	1337	iOS app	3	1	08:24:19	440
3871	1338	Android app	3	1	14:46:44	440
3876	1340	Debit Card	3	3	08:56:26	440
3880	1341	iOS app	3	1	10:47:04	440
3883	1342	Credit Card	3	3	16:43:51	440
3891	1344	Debit Card	3	2	05:26:21	440
3897	1346	Debit Card	3	3	13:17:38	440
3902	1347	Credit Card	3	4	06:37:29	440
3911	1349	iOS app	3	1	06:34:02	440
3917	1352	Credit Card	3	3	10:12:15	440
3921	1353	Android app	3	1	11:20:48	440
3923	1354	Debit Card	3	1	12:59:49	440
3929	1357	iOS app	3	3	10:51:52	440
3933	1359	iOS app	3	1	08:13:55	440
3936	1360	Credit Card	3	3	09:58:23	440
3940	1361	iOS app	3	1	09:56:20	440
3945	1362	Credit Card	3	3	15:31:56	440
3951	1365	Credit Card	3	2	14:45:25	440
3957	1368	Credit Card	3	3	04:08:20	440
3960	1369	Credit Card	3	2	16:11:48	440
3964	1370	Debit Card	3	4	14:07:26	440
3970	1373	Debit Card	3	2	11:19:07	440
3975	1376	iOS app	3	1	11:22:44	440
3977	1377	iOS app	3	2	07:05:48	440
3986	1381	Debit Card	3	3	12:53:55	440
3995	1385	Debit Card	3	2	07:19:14	440
4000	1386	iOS app	3	4	09:14:24	440
4003	1387	iOS app	3	1	03:36:33	440
4007	1388	Debit Card	3	4	09:58:08	440
4010	1389	Android app	3	4	10:44:24	440
4014	1391	Credit Card	3	2	13:58:48	440
4017	1392	iOS app	3	2	08:10:44	440
4025	1394	iOS app	3	4	12:48:05	440
4034	1398	Credit Card	3	4	08:52:26	440
4040	1400	Credit Card	3	3	11:51:19	440
4042	1401	Debit Card	3	3	10:48:11	440
4046	1402	iOS app	3	1	05:01:05	440
4049	1403	Android app	3	1	17:22:04	440
4062	1408	Credit Card	3	3	06:49:40	440
4065	1409	Credit Card	3	3	06:07:27	440
4072	1411	Credit Card	3	3	09:32:24	440
4074	1412	Credit Card	3	4	06:37:39	440
4078	1413	Debit Card	3	3	11:43:32	440
4081	1414	iOS app	3	1	06:37:33	440
4084	1415	Credit Card	3	2	05:21:23	440
4091	1417	Credit Card	3	1	10:11:19	440
4095	1418	Credit Card	3	3	15:09:03	440
4100	1420	Android app	3	3	05:55:12	440
4103	1421	Credit Card	3	2	10:56:13	440
4106	1422	iOS app	3	2	16:14:17	440
4111	1424	Credit Card	3	3	15:22:05	440
4117	1426	Android app	3	1	08:52:34	440
4122	1427	Credit Card	3	2	12:41:12	440
4125	1428	iOS app	3	3	13:39:50	440
4130	1430	Credit Card	3	3	15:45:56	440
4134	1431	iOS app	3	1	08:32:01	440
4138	1432	Android app	3	2	07:01:09	440
4145	1434	Android app	3	1	10:16:32	440
4152	1437	Android app	3	3	05:09:31	440
4155	1438	Debit Card	3	3	09:09:27	440
4159	1439	Credit Card	3	3	09:58:29	440
4164	1440	Credit Card	3	2	04:32:00	440
4169	1442	Credit Card	3	3	15:28:48	440
4174	1444	iOS app	3	1	04:10:47	440
4178	1446	Android app	3	1	15:07:21	440
4181	1447	Credit Card	3	2	04:41:31	440
4184	1448	Credit Card	3	4	08:04:21	440
4188	1449	Credit Card	3	2	06:31:47	440
4193	1450	Credit Card	3	2	13:32:09	440
4198	1452	Debit Card	3	3	04:41:35	440
4202	1453	Credit Card	3	3	16:17:37	440
4205	1454	Android app	3	1	10:49:27	440
4208	1455	iOS app	3	1	11:01:42	440
4211	1456	iOS app	3	3	10:50:32	440
4214	1457	Android app	3	4	07:33:11	440
4218	1458	Credit Card	3	2	04:07:43	440
4220	1459	Credit Card	3	2	17:58:29	440
4224	1460	Android app	3	1	07:41:24	440
4233	1463	Debit Card	3	3	10:17:42	440
4236	1464	Debit Card	3	4	15:58:08	440
4238	1465	iOS app	3	3	16:27:45	440
4240	1466	Debit Card	3	1	04:25:49	440
4245	1467	Debit Card	3	2	09:11:57	440
4248	1468	Debit Card	3	3	16:33:56	440
4251	1469	Credit Card	3	1	09:24:22	440
4257	1470	Android app	3	3	11:28:07	440
4261	1471	Debit Card	3	3	15:32:58	440
4267	1472	Android app	3	1	06:32:49	440
4271	1473	Credit Card	3	3	08:43:57	440
4279	1476	Debit Card	3	2	07:05:03	440
4285	1478	Debit Card	3	3	12:32:11	440
4290	1479	Credit Card	3	4	09:42:42	440
4292	1480	Credit Card	3	2	08:16:25	440
4296	1481	Debit Card	3	2	08:17:45	440
4300	1483	iOS app	3	3	10:42:14	440
4304	1485	iOS app	3	3	05:50:03	440
4309	1486	Credit Card	3	3	06:50:57	440
4312	1487	Android app	3	1	09:34:38	440
4316	1488	iOS app	3	1	18:46:28	440
4321	1489	Credit Card	3	2	13:16:19	440
4324	1490	Credit Card	3	2	10:29:35	440
4327	1491	Debit Card	3	2	11:22:29	440
4330	1492	iOS app	3	3	05:00:37	440
4335	1494	iOS app	3	3	04:47:31	440
4341	1495	Android app	3	1	11:33:27	440
4346	1496	Debit Card	3	3	07:12:32	440
4350	1498	Debit Card	3	2	07:24:30	440
4357	1501	iOS app	3	1	15:54:35	440
4360	1502	Android app	3	1	16:32:11	440
4363	1503	iOS app	3	1	04:05:34	440
4367	1505	Credit Card	3	3	10:20:00	440
4371	1506	iOS app	3	1	08:02:17	440
4374	1507	Credit Card	3	4	05:23:36	440
4376	1508	iOS app	3	4	10:36:43	440
4383	1510	Credit Card	3	3	17:06:25	440
4388	1512	Credit Card	3	1	07:49:27	440
4391	1513	iOS app	3	1	16:27:32	440
4394	1514	Android app	3	1	11:22:02	440
4397	1515	Credit Card	3	4	11:17:40	440
4402	1517	Credit Card	3	3	09:12:07	440
4404	1518	iOS app	3	3	11:38:10	440
4410	1520	iOS app	3	2	13:56:12	440
4414	1522	iOS app	3	1	16:50:34	440
4417	1523	Debit Card	3	2	04:18:10	440
4420	1524	iOS app	3	1	07:18:21	440
4422	1525	Credit Card	3	1	18:06:09	440
4425	1526	Credit Card	3	3	06:45:49	440
4428	1527	Credit Card	3	3	03:34:56	440
4432	1529	Android app	3	3	04:18:19	440
4437	1531	Debit Card	3	3	07:18:06	440
4441	1533	iOS app	3	3	17:22:56	440
4443	1534	Android app	3	3	11:56:17	440
4446	1535	iOS app	3	4	07:52:03	440
4449	1537	Credit Card	3	3	15:02:34	440
4453	1539	iOS app	3	1	17:30:24	440
4459	1540	Android app	3	1	06:24:04	440
4462	1541	Android app	3	1	08:27:32	440
4465	1542	Android app	3	1	09:11:33	440
4468	1543	Debit Card	3	3	09:23:21	440
4473	1545	Credit Card	3	3	04:19:22	440
4477	1546	iOS app	3	1	08:41:44	440
4482	1548	Debit Card	3	2	05:14:50	440
4485	1549	Credit Card	3	4	17:18:28	440
4489	1551	Credit Card	3	4	06:20:44	440
4492	1552	Credit Card	3	3	09:08:58	440
4495	1553	Android app	3	1	10:53:53	440
4497	1554	Credit Card	3	4	10:41:45	440
4500	1555	Android app	3	1	13:22:46	440
4504	1556	Credit Card	3	2	12:39:14	440
4506	1557	Credit Card	3	4	05:53:18	440
4509	1558	Android app	3	1	09:24:07	440
4514	1559	Credit Card	3	3	06:06:20	440
4517	1560	Android app	3	2	15:17:17	440
4520	1561	iOS app	3	2	10:43:02	440
4528	1565	Android app	3	1	16:54:04	440
4533	1567	iOS app	3	3	13:05:32	440
4541	1570	iOS app	3	3	17:39:13	440
4545	1571	Credit Card	3	3	17:24:27	440
4549	1572	Debit Card	3	2	04:35:33	440
4552	1573	Credit Card	3	3	04:53:55	440
4559	1575	Credit Card	3	4	09:44:01	440
4563	1577	Debit Card	3	3	03:25:31	440
4570	1578	iOS app	3	2	15:28:52	440
4573	1579	Debit Card	3	3	16:04:51	440
4575	1580	Credit Card	3	3	10:56:50	440
4579	1581	Debit Card	3	4	07:24:37	440
4582	1582	Android app	3	2	14:41:18	440
4586	1584	Debit Card	3	3	08:02:42	440
4591	1585	iOS app	3	2	05:21:18	440
4598	1587	Credit Card	3	4	07:46:30	440
4603	1589	Debit Card	3	4	11:15:03	440
4609	1591	Android app	3	1	12:39:44	440
4612	1592	iOS app	3	3	15:08:09	440
4614	1593	Debit Card	3	3	08:32:46	440
4617	1594	Credit Card	3	1	03:39:10	440
4621	1595	iOS app	3	2	14:56:34	440
4623	1596	Credit Card	3	4	15:31:18	440
4627	1597	Credit Card	3	3	07:02:24	440
4629	1598	iOS app	3	1	17:41:44	440
4631	1599	Android app	3	1	09:59:01	440
4635	1600	Credit Card	3	2	04:04:33	440
4638	1601	Debit Card	3	3	12:16:46	440
4646	1603	Credit Card	3	3	11:29:35	440
4649	1604	iOS app	3	2	09:01:49	440
4659	1608	iOS app	3	3	09:17:59	440
4664	1609	Credit Card	3	2	04:36:10	440
4671	1612	iOS app	3	3	04:38:23	440
4682	1616	Android app	3	1	11:54:17	440
4688	1617	Android app	3	1	17:09:55	440
4691	1619	iOS app	3	1	05:57:48	440
4696	1621	Credit Card	3	3	16:35:15	440
4703	1624	Android app	3	1	09:22:29	440
4707	1625	Android app	3	2	12:50:06	440
4711	1626	Debit Card	3	3	13:17:11	440
4717	1628	Debit Card	3	2	04:22:59	440
4720	1629	Debit Card	3	2	15:21:36	440
4724	1630	Debit Card	3	3	05:12:49	440
4729	1632	iOS app	3	1	05:52:44	440
4732	1633	Android app	3	4	18:47:02	440
4737	1634	Credit Card	3	2	12:12:07	440
4741	1636	Debit Card	3	4	04:14:16	440
4746	1637	Android app	3	4	04:24:45	440
4749	1638	iOS app	3	1	13:07:42	440
4753	1639	Android app	3	3	07:40:30	440
4758	1641	Credit Card	3	4	03:37:06	440
4761	1642	iOS app	3	1	05:06:14	440
4763	1643	iOS app	3	3	05:10:51	440
4766	1644	iOS app	3	3	10:54:28	440
4772	1647	Android app	3	4	10:35:55	440
4774	1648	iOS app	3	2	04:22:47	440
4779	1649	Credit Card	3	1	13:52:06	440
4786	1651	Android app	3	1	10:44:29	440
4794	1653	Credit Card	3	2	17:38:38	440
4801	1655	Credit Card	3	4	16:58:40	440
4804	1656	iOS app	3	4	11:35:34	440
4807	1657	iOS app	3	1	04:29:44	440
4809	1658	Credit Card	3	3	10:53:55	440
4813	1659	Debit Card	3	3	03:18:00	440
4817	1660	iOS app	3	2	13:20:16	440
4824	1662	Android app	3	1	06:04:55	440
4827	1664	Debit Card	3	3	08:39:17	440
4831	1666	Android app	3	2	15:08:45	440
4837	1667	iOS app	3	1	05:47:23	440
4847	1670	Android app	3	1	10:08:29	440
4855	1673	iOS app	3	1	11:11:12	440
4858	1674	Android app	3	1	12:41:11	440
4865	1676	Debit Card	3	3	09:09:47	440
4868	1677	iOS app	3	1	10:24:36	440
4870	1678	Credit Card	3	3	10:45:14	440
4872	1679	Debit Card	3	3	08:34:38	440
4874	1680	Credit Card	3	2	04:50:00	440
4876	1681	Android app	3	3	14:55:14	440
4881	1682	iOS app	3	3	08:57:23	440
4886	1684	Debit Card	3	2	04:24:32	440
4893	1686	Debit Card	3	4	14:14:15	440
4897	1687	Debit Card	3	3	07:57:33	440
4900	1688	Debit Card	3	3	04:22:26	440
4905	1689	iOS app	3	3	13:34:37	440
4908	1690	Android app	3	3	11:17:09	440
4912	1691	Debit Card	3	3	17:51:34	440
4914	1692	iOS app	3	1	04:38:58	440
4924	1696	Android app	3	2	08:10:35	440
4930	1700	Credit Card	3	3	09:30:29	440
4932	1701	iOS app	3	3	12:21:11	440
4938	1703	Android app	3	2	05:45:52	440
4941	1704	iOS app	3	2	09:12:49	440
4952	1708	Android app	3	1	16:47:25	440
4955	1709	iOS app	3	2	11:07:20	440
4957	1710	Android app	3	1	09:43:49	440
4959	1711	Android app	3	2	09:55:26	440
4962	1712	Debit Card	3	2	09:25:38	440
4966	1713	Credit Card	3	2	09:04:10	440
4971	1714	Android app	3	1	14:58:01	440
4977	1717	Credit Card	3	2	18:47:33	440
4980	1718	Debit Card	3	2	10:35:51	440
4984	1719	Android app	3	2	10:32:05	440
4992	1721	Debit Card	3	2	09:22:17	440
4995	1722	Credit Card	3	3	09:39:54	440
5008	1729	Debit Card	3	2	09:35:35	440
5011	1730	Credit Card	3	3	15:42:29	440
5013	1731	Credit Card	3	1	12:57:03	440
5017	1733	Debit Card	3	3	16:17:20	440
5020	1734	Credit Card	3	3	07:55:15	440
5023	1735	Android app	3	1	17:30:40	440
5032	1739	iOS app	3	1	16:28:24	440
5035	1740	Credit Card	3	3	08:47:53	440
5039	1742	Credit Card	3	4	15:03:41	440
5043	1743	Debit Card	3	3	04:20:15	440
5045	1744	Android app	3	1	14:35:41	440
5050	1745	Credit Card	3	4	10:08:05	440
5056	1746	Credit Card	3	4	08:02:22	440
5059	1747	Android app	3	1	11:55:30	440
5062	1748	Credit Card	3	3	08:10:35	440
5066	1749	iOS app	3	1	10:24:38	440
5072	1750	Credit Card	3	3	10:06:47	440
5077	1751	iOS app	3	4	07:18:38	440
5081	1752	iOS app	3	1	08:04:19	440
5085	1753	Credit Card	3	3	17:51:23	440
5088	1755	Credit Card	3	2	04:45:50	440
5097	1758	iOS app	3	3	09:56:14	440
5101	1759	Android app	3	4	11:22:17	440
5105	1760	Debit Card	3	3	03:18:04	440
5115	1764	Android app	3	4	09:21:52	440
5119	1766	iOS app	3	1	04:53:49	440
5124	1768	iOS app	3	3	04:26:50	440
5132	1771	Credit Card	3	3	03:25:30	440
5138	1773	Debit Card	3	3	09:29:45	440
5140	1774	iOS app	3	1	03:02:29	440
5148	1778	iOS app	3	1	13:48:44	440
5153	1779	Debit Card	3	3	07:36:08	440
5157	1780	Credit Card	3	2	07:48:35	440
5163	1782	Android app	3	2	04:07:11	440
5173	1787	Credit Card	3	3	11:37:01	440
5178	1788	iOS app	3	1	15:24:17	440
5180	1789	Credit Card	3	3	10:28:57	440
5187	1792	iOS app	3	2	09:07:26	440
5192	1794	Credit Card	3	3	05:08:07	440
5195	1795	iOS app	3	3	06:03:24	440
5199	1796	Credit Card	3	2	14:10:45	440
5203	1798	Debit Card	3	2	11:02:30	440
5205	1799	Debit Card	3	2	06:58:01	440
5208	1800	iOS app	3	4	04:03:59	440
5212	1801	Debit Card	3	2	07:23:50	440
5217	1802	Debit Card	3	4	10:56:00	440
5221	1803	iOS app	3	2	15:52:19	440
5226	1805	Credit Card	3	3	10:15:05	440
5228	1806	iOS app	3	3	05:56:43	440
5232	1807	Debit Card	3	2	08:47:49	440
5235	1808	iOS app	3	1	07:36:39	440
5237	1809	iOS app	3	1	14:07:48	440
5242	1810	Debit Card	3	3	17:05:15	440
5246	1812	Credit Card	3	3	15:07:02	440
5251	1813	iOS app	3	4	16:08:06	440
5257	1815	iOS app	3	1	17:51:14	440
5266	1818	Credit Card	3	2	11:55:08	440
5271	1819	Credit Card	3	3	12:01:29	440
5276	1820	Credit Card	3	3	03:44:09	440
5280	1822	iOS app	3	2	04:21:46	440
5284	1823	iOS app	3	4	08:43:16	440
5286	1824	Android app	3	3	14:42:00	440
5292	1827	Android app	3	1	17:11:15	440
5295	1828	iOS app	3	3	11:48:30	440
5299	1829	Credit Card	3	3	04:54:54	440
5304	1831	Credit Card	3	2	12:38:33	440
5306	1832	Android app	3	1	08:04:12	440
5310	1834	Credit Card	3	3	07:08:33	440
5315	1835	iOS app	3	1	14:09:09	440
5320	1837	iOS app	3	3	13:45:45	440
5327	1840	Debit Card	3	2	04:33:29	440
5335	1842	iOS app	3	1	05:56:45	440
5338	1843	Credit Card	3	2	07:15:28	440
5341	1845	iOS app	3	1	08:42:01	440
5344	1847	iOS app	3	1	06:03:43	440
5348	1849	Android app	3	1	14:51:18	440
5350	1850	Credit Card	3	3	09:43:54	440
5354	1851	Android app	3	3	08:37:20	440
5359	1853	Debit Card	3	3	08:23:11	440
5362	1854	Debit Card	3	4	17:28:19	440
5364	1855	iOS app	3	1	05:26:34	440
5369	1857	Debit Card	3	4	10:45:32	440
5371	1858	Credit Card	3	4	11:18:50	440
5373	1859	Debit Card	3	4	04:22:49	440
5378	1860	Credit Card	3	3	13:48:34	440
1953	679	iOS app	4	1	13:43:47	450
5384	1863	Debit Card	3	3	16:43:16	440
5388	1865	Debit Card	3	3	10:27:17	440
5391	1866	Debit Card	3	3	08:27:21	440
5399	1868	Android app	3	1	09:44:57	440
5402	1869	Android app	3	1	11:08:34	440
5405	1870	Android app	3	1	03:25:53	440
5409	1871	iOS app	3	4	13:46:30	440
5412	1872	iOS app	3	3	04:03:44	440
5415	1873	Credit Card	3	3	09:30:20	440
5418	1874	Android app	3	1	07:41:22	440
5423	1875	iOS app	3	1	11:16:03	440
5429	1876	iOS app	3	1	04:27:49	440
5432	1878	Credit Card	3	4	03:09:10	440
5437	1879	iOS app	3	1	13:22:45	440
5440	1880	Credit Card	3	3	15:43:32	440
5442	1881	Android app	3	2	09:22:52	440
5444	1882	Debit Card	3	2	17:57:17	440
5448	1883	iOS app	3	1	11:18:04	440
5454	1885	Credit Card	3	2	07:55:30	440
5456	1886	iOS app	3	1	10:42:53	440
5458	1887	Debit Card	3	4	07:41:08	440
5465	1890	Android app	3	1	04:20:35	440
5474	1893	iOS app	3	4	12:48:39	440
5478	1894	Credit Card	3	3	07:36:55	440
5481	1895	Android app	3	1	14:49:51	440
5492	1900	Credit Card	3	3	10:42:11	440
5495	1901	iOS app	3	3	11:56:08	440
5500	1902	iOS app	3	3	04:49:12	440
5503	1903	Credit Card	3	4	13:08:51	440
5512	1906	Debit Card	3	3	03:18:07	440
5515	1907	Credit Card	3	2	14:12:50	440
5519	1908	Credit Card	3	3	07:23:50	440
5527	1910	Credit Card	3	3	07:37:01	440
5531	1912	iOS app	3	3	03:37:51	440
5534	1913	Credit Card	3	2	05:20:48	440
5538	1915	Credit Card	3	3	04:23:47	440
5544	1917	iOS app	3	4	16:05:32	440
5551	1920	Android app	3	2	11:42:35	440
5558	1922	Credit Card	3	3	10:02:33	440
5564	1924	iOS app	3	1	05:59:35	440
5570	1925	iOS app	3	3	12:34:52	440
5577	1927	Debit Card	3	3	05:19:24	440
5580	1928	iOS app	3	1	17:53:37	440
5583	1929	Credit Card	3	4	09:25:18	440
5585	1930	iOS app	3	4	17:55:26	440
5591	1931	iOS app	3	2	16:11:02	440
5599	1934	Debit Card	3	3	09:07:19	440
5602	1935	Debit Card	3	4	14:59:03	440
5605	1936	Credit Card	3	3	15:45:54	440
5608	1937	Android app	3	1	09:30:43	440
5614	1939	Credit Card	3	3	10:41:49	440
5617	1940	Credit Card	3	3	04:28:22	440
5621	1941	Credit Card	3	4	08:22:51	440
5625	1942	Debit Card	3	2	11:15:07	440
5629	1944	iOS app	3	1	08:08:20	440
5632	1945	Android app	3	1	11:37:39	440
5638	1948	Debit Card	3	3	14:48:04	440
5646	1952	Credit Card	3	2	08:23:27	440
5657	1955	Credit Card	3	3	04:44:23	440
5665	1958	iOS app	3	1	04:28:53	440
5672	1962	Android app	3	1	12:22:03	440
5674	1963	iOS app	3	1	10:46:05	440
5677	1964	iOS app	3	1	12:15:40	440
5681	1965	iOS app	3	1	08:37:28	440
5689	1969	Credit Card	3	2	10:13:03	440
5691	1970	Credit Card	3	4	10:34:09	440
5695	1971	Android app	3	2	07:51:22	440
5698	1972	Android app	3	3	04:44:22	440
5702	1973	Credit Card	3	2	13:10:15	440
5705	1974	Credit Card	3	4	17:23:10	440
5709	1976	iOS app	3	3	06:57:33	440
5712	1977	Debit Card	3	4	15:14:30	440
5720	1980	Android app	3	2	10:46:22	440
5723	1982	Debit Card	3	3	08:39:06	440
5734	1986	Credit Card	3	3	11:23:58	440
5738	1987	Android app	3	2	12:50:57	440
5741	1988	Debit Card	3	3	11:51:42	440
5748	1991	Android app	3	1	08:54:14	440
5757	1995	Debit Card	3	3	05:08:48	440
5759	1996	iOS app	3	1	04:42:28	440
5762	1997	Debit Card	3	4	07:33:31	440
5766	1999	iOS app	3	2	08:49:29	440
5769	2000	iOS app	3	3	13:37:14	440
5771	2001	Android app	3	3	05:54:04	440
5775	2002	Debit Card	3	4	12:01:39	440
5777	2003	iOS app	3	3	07:01:18	440
5780	2004	Credit Card	3	3	16:53:53	440
5783	2005	Android app	3	1	08:06:03	440
5786	2006	Android app	3	1	13:56:06	440
5791	2007	Android app	3	3	05:37:10	440
5795	2008	Credit Card	3	4	04:36:06	440
5798	2009	iOS app	3	2	15:37:55	440
5803	2012	iOS app	3	3	07:47:45	440
5808	2014	Debit Card	3	1	12:42:04	440
5810	2015	iOS app	3	1	06:03:09	440
5816	2017	iOS app	3	4	18:00:18	440
5823	2020	Debit Card	3	2	13:50:56	440
5826	2021	Android app	3	1	09:51:05	440
5837	2024	Credit Card	3	3	09:37:15	440
5840	2025	iOS app	3	1	16:22:04	440
5844	2026	Debit Card	3	2	10:38:07	440
5847	2027	Credit Card	3	2	06:21:36	440
5852	2028	iOS app	3	1	07:11:40	440
5855	2029	Android app	3	2	09:38:30	440
5859	2030	Credit Card	3	2	12:29:31	440
5862	2031	Credit Card	3	2	16:07:34	440
5866	2032	Android app	3	3	05:02:26	440
5869	2033	Debit Card	3	2	12:25:28	440
5874	2034	iOS app	3	3	13:47:57	440
5882	2037	Debit Card	3	3	07:03:09	440
5888	2038	Debit Card	3	2	12:57:18	440
5893	2039	Credit Card	3	3	14:31:22	440
5897	2040	iOS app	3	1	10:14:50	440
5900	2041	Credit Card	3	3	14:09:06	440
5905	2042	Credit Card	3	3	05:18:17	440
5907	2043	iOS app	3	3	17:53:34	440
5912	2044	Debit Card	3	1	11:45:14	440
5915	2045	Android app	3	1	12:48:12	440
5918	2046	Android app	3	1	09:25:59	440
5921	2047	iOS app	3	1	15:52:36	440
5926	2048	iOS app	3	1	17:10:58	440
5930	2049	Android app	3	1	09:39:09	440
5933	2050	Credit Card	3	4	05:54:44	440
5936	2052	iOS app	3	3	10:38:39	440
5941	2054	Credit Card	3	4	06:10:12	440
5945	2055	Credit Card	3	2	04:33:15	440
5947	2056	Android app	3	1	04:03:00	440
5953	2059	Credit Card	3	3	05:24:53	440
5957	2060	iOS app	3	2	15:36:39	440
5961	2061	Debit Card	3	1	09:11:06	440
5964	2062	Credit Card	3	2	05:06:30	440
5970	2065	iOS app	3	2	10:47:55	440
5973	2066	iOS app	3	1	11:23:27	440
5980	2069	Android app	3	1	16:41:11	440
5983	2070	iOS app	3	1	12:48:22	440
5990	2072	Debit Card	3	3	16:39:13	440
5993	2073	Debit Card	3	1	11:06:20	440
5998	2075	Debit Card	3	4	12:56:18	440
6002	2076	Credit Card	3	3	16:09:57	440
6004	2077	Credit Card	3	4	07:58:36	440
6007	2078	iOS app	3	3	07:18:03	440
6011	2079	iOS app	3	1	15:09:01	440
6015	2080	Debit Card	3	3	12:55:20	440
6025	2082	Credit Card	3	3	08:35:02	440
6029	2083	Android app	3	1	07:51:50	440
6032	2084	iOS app	3	3	15:54:25	440
6038	2087	iOS app	3	1	14:20:40	440
6041	2088	Credit Card	3	3	11:17:53	440
6044	2089	Debit Card	3	2	09:08:11	440
6054	2092	Credit Card	3	4	07:22:16	440
6057	2093	Credit Card	3	4	06:33:47	440
6061	2094	Android app	3	1	16:34:55	440
6064	2095	Android app	3	1	04:25:34	440
6070	2097	Credit Card	3	3	10:04:43	440
6073	2098	iOS app	3	3	17:52:17	440
6077	2099	iOS app	3	1	09:46:47	440
6081	2100	Debit Card	3	3	13:21:33	440
6084	2101	Credit Card	3	3	16:16:18	440
6087	2102	Debit Card	3	2	11:08:30	440
6094	2104	Debit Card	3	3	11:56:36	440
6097	2105	iOS app	3	2	14:33:12	440
6101	2107	iOS app	3	1	08:50:47	440
6110	2110	iOS app	3	1	18:27:23	440
6114	2111	Debit Card	3	4	10:24:56	440
5965	2062	Credit Card	4	2	10:49:44	450
795	275	Credit Card	4	3	11:17:52	450
2342	816	iOS app	4	2	17:47:25	450
2336	814	iOS app	4	2	12:48:13	450
4596	1586	iOS app	4	3	12:57:11	450
2320	809	Debit Card	4	3	12:29:02	450
784	271	Android app	4	4	17:54:27	450
2315	808	Debit Card	4	3	17:49:15	450
775	268	Debit Card	4	4	15:24:26	450
2305	806	Credit Card	4	4	10:09:28	450
4619	1594	Credit Card	4	4	15:42:02	450
5923	2047	iOS app	4	4	10:31:24	450
5587	1930	iOS app	4	4	17:53:22	450
2302	805	iOS app	4	4	17:24:27	450
767	266	Android app	4	1	12:21:46	450
2292	801	Credit Card	4	4	13:03:19	450
2283	798	Android app	4	1	10:48:20	450
5593	1931	iOS app	4	3	15:39:50	450
2269	794	iOS app	4	4	15:19:35	450
2260	792	Debit Card	4	3	18:39:12	450
2218	777	Android app	4	4	17:52:19	450
4673	1612	iOS app	4	4	15:15:39	450
2205	773	iOS app	4	1	13:08:00	450
4684	1616	Android app	4	3	13:08:55	450
109	35	iOS app	4	2	14:41:09	450
4704	1624	Android app	4	3	16:54:35	450
2169	760	Credit Card	4	4	17:31:31	450
4709	1625	Android app	4	3	13:58:24	450
2158	756	Debit Card	4	4	13:35:05	450
2144	751	Credit Card	4	2	15:01:37	450
2139	750	Android app	4	4	12:53:05	450
96	31	Credit Card	4	3	17:34:44	450
720	248	Credit Card	4	4	13:36:18	450
5619	1940	iOS app	4	1	16:09:01	450
4734	1633	Android app	4	4	11:35:37	450
6052	2091	iOS app	4	2	15:04:52	450
2134	749	Credit Card	4	4	10:30:46	450
2119	743	Debit Card	4	4	11:17:27	450
706	243	Credit Card	4	2	15:08:13	450
2089	732	Android app	4	4	17:01:43	450
2085	731	Credit Card	4	4	13:49:27	450
239	75	Android app	4	1	12:12:34	450
5639	1948	Debit Card	4	2	18:09:05	450
2082	730	Android app	4	1	15:14:33	450
2075	727	Credit Card	4	4	11:01:12	450
4789	1651	Android app	4	3	11:39:14	450
2059	721	Credit Card	4	4	18:47:29	450
4796	1653	Credit Card	4	2	17:24:50	450
2055	720	Credit Card	4	3	12:50:45	450
686	237	Credit Card	4	3	12:36:13	450
5648	1952	Credit Card	4	2	18:26:18	450
2027	707	Credit Card	4	2	11:11:07	450
682	236	Credit Card	4	4	17:39:27	450
675	234	Android app	4	4	13:43:13	450
1960	681	Debit Card	4	3	15:21:48	450
5655	1954	Debit Card	4	3	14:20:21	450
4828	1664	Debit Card	4	3	10:41:45	450
4834	1666	Android app	4	3	17:03:12	450
1945	677	Credit Card	4	4	17:43:12	450
669	232	Credit Card	4	3	15:24:48	450
13	4	iOS app	4	1	11:52:55	450
4860	1674	Android app	4	3	14:53:54	450
664	230	Debit Card	4	4	13:57:56	450
1895	659	Credit Card	4	2	10:43:56	450
223	69	iOS app	4	2	18:44:05	450
5951	2058	Credit Card	4	3	12:11:48	450
6058	2093	Credit Card	4	2	10:21:25	450
4878	1681	Android app	4	4	11:57:36	450
1876	652	Credit Card	4	4	17:49:34	450
4888	1684	Debit Card	4	2	12:55:16	450
656	228	Credit Card	4	4	14:59:03	450
1858	644	Credit Card	4	3	09:41:29	450
1853	643	Android app	4	4	13:50:22	450
1841	639	Credit Card	4	4	16:11:11	450
6099	2106	Debit Card	4	4	10:22:41	450
1830	635	Debit Card	4	2	13:45:43	450
5693	1970	Credit Card	4	4	09:49:01	450
4917	1693	Debit Card	4	3	16:01:21	450
1814	630	Android app	4	3	11:12:01	450
211	65	Credit Card	4	3	13:52:10	450
637	221	Debit Card	4	3	13:55:09	450
1803	627	Debit Card	4	2	11:35:27	450
634	220	Credit Card	4	4	10:17:19	450
1792	624	iOS app	4	4	17:28:30	450
4949	1707	iOS app	4	4	17:11:41	450
619	214	iOS app	4	1	14:53:03	450
6065	2095	Android app	4	4	14:08:06	450
1779	619	Credit Card	4	3	11:49:01	450
5567	1924	iOS app	4	2	13:26:09	450
1746	607	Credit Card	4	3	15:38:24	450
587	202	Credit Card	4	4	17:29:16	450
1734	604	iOS app	4	3	17:25:16	450
5715	1977	Debit Card	4	2	14:50:06	450
4986	1719	Android app	4	4	12:04:38	450
73	24	iOS app	4	4	18:06:37	450
5001	1725	iOS app	4	2	18:25:54	450
1701	592	iOS app	4	4	17:28:35	450
1685	587	Debit Card	4	3	15:02:48	450
70	23	iOS app	4	3	09:47:10	450
5029	1737	iOS app	4	4	16:49:05	450
5041	1742	Credit Card	4	2	12:41:09	450
533	179	iOS app	4	2	09:38:32	450
1629	569	Debit Card	4	4	09:18:02	450
191	59	Debit Card	4	3	17:25:24	450
1614	565	Android app	4	1	16:28:55	450
5064	1748	Credit Card	4	3	14:22:16	450
5068	1749	iOS app	4	3	17:05:47	450
5751	1992	Android app	4	3	18:43:07	450
520	176	iOS app	4	1	14:16:39	450
1591	557	Android app	4	2	10:03:49	450
1572	550	Credit Card	4	2	09:11:54	450
26	9	Credit Card	4	2	17:14:18	450
55	18	iOS app	4	3	14:09:31	450
5090	1755	Credit Card	4	3	13:18:54	450
1565	548	iOS app	4	4	11:46:42	450
516	175	iOS app	4	3	12:21:45	450
1536	536	Credit Card	4	2	15:15:44	450
186	58	Credit Card	4	3	17:08:17	450
1530	534	iOS app	4	1	14:48:45	450
1493	520	Debit Card	4	2	13:22:33	450
1489	519	Credit Card	4	4	11:33:43	450
5112	1763	iOS app	4	4	16:49:07	450
5985	2070	iOS app	4	4	11:43:56	450
1479	514	Debit Card	4	4	17:29:49	450
1471	511	Credit Card	4	4	16:55:07	450
1465	510	Credit Card	4	3	09:26:55	450
6103	2107	iOS app	4	4	17:38:28	450
1453	507	Credit Card	4	4	12:38:56	450
173	55	iOS app	4	1	14:42:40	450
499	169	Credit Card	4	3	14:44:36	450
1428	499	Android app	4	4	17:28:40	450
48	16	Credit Card	4	4	12:04:02	450
1413	492	Android app	4	4	12:17:15	450
5168	1784	Credit Card	4	4	14:23:58	450
1393	485	Debit Card	4	3	10:43:25	450
5185	1791	Credit Card	4	2	15:49:22	450
5996	2074	Credit Card	4	4	13:42:05	450
1373	479	Debit Card	4	2	14:02:27	450
5189	1792	iOS app	4	4	14:35:03	450
5787	2006	Android app	4	3	10:54:05	450
1370	478	iOS app	4	3	17:51:43	450
1363	475	Android app	4	3	13:13:31	450
1359	474	Credit Card	4	4	17:42:34	450
24	8	Credit Card	4	3	15:31:10	450
1344	467	iOS app	4	3	11:18:15	450
5793	2007	Android app	4	2	18:21:39	450
1332	463	Credit Card	4	4	16:22:11	450
168	54	Credit Card	4	3	12:18:46	450
1327	461	iOS app	4	3	12:51:36	450
6078	2099	iOS app	4	4	16:35:18	450
1306	453	iOS app	4	4	15:43:39	450
1295	449	Debit Card	4	4	12:29:31	450
17	6	Credit Card	4	3	09:01:24	450
5243	1810	Debit Card	4	4	18:45:08	450
437	149	Android app	4	2	09:57:22	450
3707	1285	Android app	4	4	17:05:52	450
1290	448	iOS app	4	4	11:56:35	450
3701	1283	iOS app	4	4	12:43:11	450
5255	1814	Debit Card	4	3	18:42:35	450
3691	1281	iOS app	4	4	17:17:06	450
3734	1293	iOS app	4	3	14:12:08	450
3669	1273	Debit Card	4	4	12:08:53	450
5260	1816	iOS app	4	1	17:07:47	450
3664	1270	iOS app	4	4	12:54:08	450
3649	1264	iOS app	4	4	17:04:47	450
3625	1258	iOS app	4	1	10:25:31	450
5817	2017	iOS app	4	4	14:06:54	450
1253	434	Android app	4	3	13:44:04	450
3575	1239	Credit Card	4	4	15:28:14	450
3559	1234	iOS app	4	2	12:07:32	450
5820	2018	Credit Card	4	2	11:54:27	450
3542	1229	Debit Card	4	1	17:42:09	450
3806	1317	iOS app	4	3	12:58:23	450
3821	1322	Android app	4	2	16:56:31	450
3487	1210	Android app	4	3	17:42:43	450
3474	1204	Credit Card	4	2	13:03:45	450
3840	1329	Debit Card	4	2	16:09:47	450
3457	1198	Credit Card	4	4	10:57:15	450
5828	2021	Android app	4	1	11:20:49	450
3858	1334	Debit Card	4	3	12:55:05	450
3449	1196	Debit Card	4	4	17:43:49	450
5831	2022	Credit Card	4	1	16:05:09	450
3440	1194	Android app	4	3	15:30:04	450
3398	1181	iOS app	4	3	16:23:54	450
3886	1342	Credit Card	4	4	15:31:27	450
3383	1175	iOS app	4	4	10:23:09	450
5313	1834	Credit Card	4	3	10:54:38	450
3899	1346	Debit Card	4	3	13:21:46	450
5834	2023	Credit Card	4	2	11:19:33	450
3913	1350	Credit Card	4	4	18:17:14	450
1134	390	Android app	4	4	16:00:35	450
3356	1167	Android app	4	4	10:31:07	450
5324	1838	Credit Card	4	3	10:53:10	450
1126	388	Credit Card	4	4	18:08:25	450
3938	1360	Credit Card	4	4	12:53:27	450
5329	1840	Debit Card	4	3	11:53:52	450
3942	1361	iOS app	4	3	18:59:32	450
3325	1157	Debit Card	4	4	17:04:01	450
5838	2024	Credit Card	4	4	15:51:55	450
3968	1372	Android app	4	4	10:47:57	450
6117	2111	Debit Card	4	2	14:47:19	450
412	140	iOS app	4	1	11:49:05	450
1112	384	Debit Card	4	4	10:10:51	450
3296	1149	iOS app	4	1	10:54:33	450
148	46	Credit Card	4	3	12:15:10	450
3997	1385	Debit Card	4	3	11:39:03	450
3268	1141	Debit Card	4	3	16:13:40	450
6017	2080	Debit Card	4	3	17:05:07	450
1089	374	iOS app	4	1	10:08:38	450
4019	1392	iOS app	4	4	12:35:28	450
3242	1132	Credit Card	4	3	11:05:27	450
3225	1125	Credit Card	4	3	12:45:33	450
3221	1124	Credit Card	4	3	12:47:28	450
1083	372	Debit Card	4	4	11:48:06	450
5849	2027	Credit Card	4	3	13:10:01	450
3196	1116	Android app	4	4	17:34:19	450
4059	1406	Credit Card	4	4	15:35:33	450
3171	1105	Debit Card	4	3	15:26:00	450
140	44	iOS app	4	3	13:58:17	450
3158	1100	iOS app	4	3	11:28:00	450
4069	1410	Credit Card	4	3	16:15:06	450
380	127	Debit Card	4	4	16:28:44	450
1068	366	Credit Card	4	4	12:19:41	450
4075	1412	Credit Card	4	4	12:07:13	450
5375	1859	Debit Card	4	3	14:09:26	450
3145	1096	Debit Card	4	2	15:57:36	450
5857	2029	Android app	4	1	17:37:13	450
1053	362	Debit Card	4	3	12:22:09	450
4097	1418	Credit Card	4	3	13:51:57	450
6021	2081	Credit Card	4	4	12:36:05	450
1049	361	Credit Card	4	4	16:50:10	450
3072	1065	Credit Card	4	3	15:04:26	450
4113	1425	Debit Card	4	4	12:07:02	450
4119	1426	Android app	4	4	17:10:56	450
1046	360	Credit Card	4	2	16:47:36	450
3062	1063	Debit Card	4	4	15:27:09	450
4128	1429	Credit Card	4	4	10:30:08	450
5395	1867	Credit Card	4	3	13:49:33	450
3058	1062	Android app	4	4	15:26:48	450
4132	1430	Credit Card	4	2	13:45:01	450
4141	1432	Android app	4	2	15:36:12	450
3033	1054	Debit Card	4	4	15:50:37	450
3011	1045	iOS app	4	3	12:04:55	450
2990	1039	Android app	4	4	18:45:53	450
4161	1439	iOS app	4	1	16:37:12	450
5406	1870	Android app	4	4	16:44:37	450
2985	1038	Debit Card	4	3	09:30:06	450
4172	1443	Debit Card	4	2	15:36:26	450
5413	1872	iOS app	4	3	11:55:04	450
5871	2033	Debit Card	4	3	10:16:51	450
2935	1022	iOS app	4	1	15:29:02	450
1025	351	Android app	4	4	13:27:20	450
4199	1452	Debit Card	4	4	12:19:44	450
5420	1874	Android app	4	4	10:11:47	450
340	111	iOS app	4	3	14:27:33	450
2931	1021	Debit Card	4	4	10:39:32	450
5425	1875	iOS app	4	2	18:30:19	450
2898	1007	Credit Card	4	3	17:23:21	450
5877	2035	Debit Card	4	2	10:44:30	450
4227	1461	Credit Card	4	4	17:46:15	450
5434	1878	Credit Card	4	2	15:02:15	450
2860	996	iOS app	4	4	13:20:45	450
2855	995	iOS app	4	4	09:36:23	450
2841	990	Android app	4	1	18:45:31	450
4254	1469	Credit Card	4	2	16:36:21	450
4259	1470	Android app	4	3	16:07:15	450
2830	988	Credit Card	4	2	14:37:05	450
4263	1471	iOS app	4	1	13:47:45	450
992	338	iOS app	4	4	11:56:55	450
989	337	Credit Card	4	2	18:21:17	450
4274	1473	iOS app	4	1	09:20:01	450
5885	2037	Debit Card	4	4	13:50:08	450
2805	979	Debit Card	4	4	12:31:33	450
986	336	iOS app	4	2	14:02:30	450
324	103	Credit Card	4	2	13:20:36	450
2780	971	Android app	4	4	12:13:55	450
4306	1485	iOS app	4	2	17:40:02	450
960	328	Debit Card	4	3	14:50:30	450
5890	2038	Debit Card	4	2	18:01:04	450
941	323	iOS app	4	1	13:46:13	450
2741	958	iOS app	4	3	18:39:53	450
2716	949	Credit Card	4	3	17:22:30	450
5476	1893	iOS app	4	4	15:56:59	450
4351	1498	Debit Card	4	3	17:47:49	450
902	310	iOS app	4	2	12:31:09	450
2698	942	Credit Card	4	3	15:01:53	450
2694	941	Android app	4	1	10:55:40	450
897	308	Debit Card	4	4	17:14:57	450
4369	1505	Credit Card	4	4	13:07:01	450
2681	936	Debit Card	4	3	10:58:15	450
5484	1895	Android app	4	4	16:20:53	450
2656	926	iOS app	4	1	13:31:59	450
887	305	iOS app	4	3	11:39:56	450
2643	921	iOS app	4	4	16:11:49	450
4385	1510	Credit Card	4	3	13:02:49	450
2629	916	iOS app	4	4	10:18:04	450
4398	1515	Credit Card	4	3	13:31:20	450
5497	1901	iOS app	4	4	13:11:59	450
2619	912	Credit Card	4	4	11:45:44	450
4415	1522	iOS app	4	2	12:19:47	450
873	300	Android app	4	2	09:08:40	450
2612	910	iOS app	4	4	17:38:14	450
5508	1904	iOS app	4	2	12:12:17	450
4433	1529	Android app	4	4	10:44:39	450
864	298	iOS app	4	4	14:29:57	450
5517	1907	Credit Card	4	3	17:10:48	450
6089	2102	Debit Card	4	2	13:53:54	450
2583	898	Debit Card	4	4	11:20:33	450
2540	884	iOS app	4	4	17:48:06	450
2534	882	Credit Card	4	4	10:43:43	450
5524	1909	Credit Card	4	2	14:21:10	450
2522	876	Android app	4	4	14:09:21	450
4470	1544	Credit Card	4	3	18:38:18	450
848	293	Credit Card	4	4	15:14:03	450
4478	1546	iOS app	4	3	09:41:09	450
2493	867	iOS app	4	3	17:45:46	450
5909	2043	iOS app	4	3	14:14:54	450
2479	863	iOS app	4	3	10:01:32	450
2474	862	Debit Card	4	2	14:05:40	450
5541	1916	iOS app	4	3	15:30:44	450
2472	861	Credit Card	4	4	18:55:15	450
2468	860	iOS app	4	4	11:28:15	450
4511	1558	Android app	4	3	11:12:52	450
266	82	iOS app	4	2	10:33:30	450
827	286	iOS app	4	3	17:18:41	450
4534	1567	iOS app	4	3	09:08:28	450
2423	847	Credit Card	4	3	16:21:36	450
2419	845	Credit Card	4	4	16:02:39	450
4543	1570	iOS app	4	3	10:30:21	450
114	36	iOS app	4	3	16:24:56	450
819	282	iOS app	4	3	18:48:38	450
2403	840	Debit Card	4	3	16:10:11	450
2394	837	iOS app	4	4	13:11:48	450
2388	835	Debit Card	4	4	13:25:26	450
5561	1922	Credit Card	4	4	14:22:11	450
4565	1577	Debit Card	4	4	15:23:38	450
4571	1578	iOS app	4	4	14:36:54	450
800	276	iOS app	4	3	12:54:47	450
2372	828	iOS app	4	3	11:20:11	450
5879	2036	iOS app	5	1	12:56:26	525
5127	1769	Android app	5	3	13:10:04	525
5129	1770	Debit Card	5	2	13:36:07	525
5248	1812	iOS app	5	1	12:44:41	525
5812	2015	iOS app	5	3	10:10:39	525
115	36	iOS app	5	3	16:24:56	525
2806	979	Debit Card	5	4	12:31:33	525
3719	1289	Android app	5	1	16:31:43	525
1269	440	Credit Card	5	3	10:06:31	525
3692	1281	iOS app	5	4	17:17:06	525
4281	1476	Debit Card	5	3	16:24:07	525
3677	1276	Debit Card	5	4	16:45:23	525
3735	1293	iOS app	5	3	14:12:08	525
3670	1273	Debit Card	5	4	12:08:53	525
3740	1294	Debit Card	5	3	15:28:53	525
3745	1295	iOS app	5	4	16:15:13	525
5261	1816	iOS app	5	1	17:07:47	525
4293	1480	Credit Card	5	2	14:45:09	525
5263	1817	iOS app	5	4	11:45:12	525
3643	1263	iOS app	5	4	09:53:22	525
1256	435	iOS app	5	3	14:37:37	525
5268	1818	Credit Card	5	2	15:27:45	525
3626	1258	iOS app	5	1	10:25:31	525
3612	1253	Credit Card	5	4	10:58:49	525
2795	976	Credit Card	5	2	13:40:08	525
3591	1244	Credit Card	5	3	13:54:24	525
3776	1308	Debit Card	5	3	12:44:32	525
1245	431	Debit Card	5	4	16:42:30	525
5555	1921	Android app	5	4	10:06:09	525
5274	1819	Credit Card	5	3	09:46:36	525
5818	2017	iOS app	5	4	14:06:54	525
1238	428	Android app	5	1	16:34:36	525
3555	1233	Android app	5	4	17:55:03	525
3798	1315	Debit Card	5	4	12:57:32	525
961	328	Debit Card	5	3	14:50:30	525
3543	1229	Debit Card	5	1	17:42:09	525
2380	831	Android app	5	4	17:59:30	525
3807	1317	iOS app	5	3	12:58:23	525
3527	1224	Debit Card	5	3	10:15:12	525
267	82	iOS app	5	2	10:33:30	525
1206	417	Credit Card	5	3	12:57:39	525
3488	1210	Android app	5	3	17:42:43	525
2772	968	iOS app	5	1	11:17:06	525
1188	410	Debit Card	5	4	14:44:31	525
3475	1204	Credit Card	5	2	13:03:45	525
3835	1328	iOS app	5	1	09:21:29	525
423	144	Credit Card	5	2	11:25:39	525
2768	967	Credit Card	5	4	16:30:58	525
3841	1329	Debit Card	5	2	16:09:47	525
1169	402	Credit Card	5	3	13:30:59	525
3462	1200	Android app	5	4	18:52:07	525
2763	965	Debit Card	5	4	16:53:43	525
3851	1331	Credit Card	5	2	11:16:43	525
2485	864	Credit Card	5	4	12:29:20	525
3450	1196	Debit Card	5	4	17:43:49	525
2754	962	Debit Card	5	4	12:25:46	525
3859	1334	Debit Card	5	3	12:55:05	525
4318	1488	iOS app	5	4	13:44:53	525
3863	1335	Credit Card	5	2	13:20:25	525
1155	397	iOS app	5	3	17:36:33	525
5829	2021	Android app	5	1	11:20:49	525
3874	1339	iOS app	5	4	15:12:11	525
1148	394	Android app	5	2	14:10:04	525
3409	1185	iOS app	5	4	11:12:46	525
5832	2022	Credit Card	5	1	16:05:09	525
1140	391	Debit Card	5	4	14:46:20	525
2742	958	iOS app	5	3	18:39:53	525
3384	1175	iOS app	5	4	10:23:09	525
955	327	Debit Card	5	4	17:29:38	525
3887	1342	Credit Card	5	4	15:31:27	525
4325	1490	Credit Card	5	3	13:04:47	525
3370	1171	iOS app	5	3	17:37:35	525
3900	1346	Debit Card	5	3	13:21:46	525
3368	1170	Android app	5	4	16:06:01	525
3904	1347	Credit Card	5	3	11:24:40	525
3908	1348	iOS app	5	4	14:19:43	525
1135	390	Android app	5	4	16:00:35	525
3363	1169	Debit Card	5	2	14:06:05	525
3919	1352	Credit Card	5	4	11:33:23	525
5835	2023	Credit Card	5	2	11:19:33	525
3360	1168	Android app	5	4	16:03:14	525
930	319	iOS app	5	1	11:54:38	525
2729	954	Credit Card	5	2	17:57:26	525
3333	1159	Credit Card	5	3	14:25:16	525
2723	951	iOS app	5	4	10:28:06	525
3943	1361	iOS app	5	3	18:59:32	525
5330	1840	Debit Card	5	3	11:53:52	525
3948	1363	Credit Card	5	4	15:26:58	525
3955	1367	iOS app	5	4	11:54:42	525
914	313	Android app	5	3	17:26:22	525
3301	1150	Debit Card	5	2	10:39:24	525
1113	384	Debit Card	5	4	10:10:51	525
3966	1371	Android app	5	2	11:43:59	525
2411	843	Debit Card	5	3	17:22:20	525
841	290	iOS app	5	1	18:51:27	525
5842	2025	iOS app	5	4	17:04:08	525
3979	1377	iOS app	5	2	14:28:21	525
3984	1380	Credit Card	5	3	14:01:49	525
4352	1498	Debit Card	5	3	17:47:49	525
3287	1146	Credit Card	5	3	18:32:34	525
3280	1143	iOS app	5	1	17:32:34	525
131	42	Android app	5	1	10:43:11	525
2699	942	Credit Card	5	3	15:01:53	525
3275	1142	Credit Card	5	4	16:08:16	525
3269	1141	Debit Card	5	3	16:13:40	525
4493	1552	Credit Card	5	4	14:48:02	525
5910	2043	iOS app	5	3	14:14:54	525
1090	374	iOS app	5	1	10:08:38	525
319	102	Android app	5	2	15:34:13	525
3253	1135	Credit Card	5	2	15:01:55	525
4020	1392	iOS app	5	4	12:35:28	525
890	306	iOS app	5	4	14:44:23	525
3201	1118	Android app	5	4	13:50:57	525
4036	1398	Credit Card	5	4	17:10:39	525
2409	842	Credit Card	5	3	12:38:29	525
6118	2111	Debit Card	5	2	14:47:19	525
2368	827	Credit Card	5	4	12:20:22	525
796	275	Credit Card	5	3	11:17:52	525
2358	822	Android app	5	4	12:57:29	525
141	44	iOS app	5	3	13:58:17	525
4592	1585	iOS app	5	3	16:15:12	525
4044	1401	Debit Card	5	3	17:55:08	525
1073	367	Credit Card	5	3	15:39:54	525
5919	2046	Android app	5	4	13:37:40	525
2316	808	Debit Card	5	3	17:49:15	525
4605	1589	Debit Card	5	2	18:51:33	525
4607	1590	Debit Card	5	3	10:39:43	525
3182	1110	Android app	5	4	12:36:35	525
4052	1404	Credit Card	5	3	15:21:00	525
6045	2089	Debit Card	5	3	17:42:52	525
254	79	iOS app	5	2	12:03:55	525
3172	1105	Debit Card	5	3	15:26:00	525
768	266	Android app	5	1	12:21:46	525
4625	1596	iOS app	5	1	09:41:58	525
381	127	Debit Card	5	4	16:28:44	525
5588	1930	iOS app	5	4	17:53:22	525
5542	1916	iOS app	5	3	15:30:44	525
5924	2047	iOS app	5	4	10:31:24	525
2293	801	Credit Card	5	4	13:03:19	525
2276	796	iOS app	5	3	13:39:57	525
4644	1602	Debit Card	5	3	15:19:24	525
4070	1410	Credit Card	5	3	16:15:06	525
5594	1931	iOS app	5	3	15:39:50	525
4657	1607	Credit Card	5	2	16:47:05	525
2244	787	Credit Card	5	3	09:55:31	525
4661	1608	iOS app	5	3	12:40:10	525
2219	777	Android app	5	4	17:52:19	525
752	261	iOS app	5	4	13:07:17	525
4674	1612	iOS app	5	4	15:15:39	525
2206	773	iOS app	5	1	13:08:00	525
5927	2048	iOS app	5	3	17:55:42	525
2630	916	iOS app	5	4	10:18:04	525
745	258	iOS app	5	4	13:22:23	525
2198	770	iOS app	5	1	10:35:37	525
2193	769	Debit Card	5	3	15:42:11	525
728	251	Debit Card	5	4	12:33:34	525
2189	768	Credit Card	5	3	11:14:07	525
4698	1621	Credit Card	5	3	18:40:13	525
4705	1624	Android app	5	3	16:54:35	525
884	304	Credit Card	5	4	15:33:08	525
2444	853	iOS app	5	3	14:12:54	525
5611	1938	Credit Card	5	2	17:41:23	525
3136	1092	Credit Card	5	2	09:58:41	525
2155	755	Debit Card	5	3	16:43:17	525
4086	1415	Android app	5	1	15:31:29	525
250	78	Debit Card	5	2	17:03:32	525
5615	1939	Credit Card	5	3	17:56:10	525
2140	750	Android app	5	4	12:53:05	525
4725	1630	Debit Card	5	3	14:30:57	525
1054	362	Debit Card	5	3	12:22:09	525
3121	1085	Credit Card	5	4	09:30:51	525
2135	749	Credit Card	5	4	10:30:46	525
2624	915	Android app	5	1	17:08:34	525
4744	1636	Debit Card	5	3	11:30:19	525
5623	1941	Credit Card	5	2	15:54:37	525
240	75	Android app	5	1	12:12:34	525
5938	2052	iOS app	5	3	11:52:43	525
3078	1067	iOS app	5	4	18:46:58	525
27	9	Credit Card	5	2	17:14:18	525
4566	1577	Debit Card	5	4	15:23:38	525
692	239	Credit Card	5	3	16:23:55	525
4399	1515	Credit Card	5	3	13:31:20	525
5636	1947	iOS app	5	1	17:16:53	525
3068	1064	Credit Card	5	3	15:07:37	525
4781	1649	Credit Card	5	2	16:49:07	525
5640	1948	Debit Card	5	2	18:09:05	525
2072	725	Android app	5	4	15:26:09	525
4512	1558	Android app	5	3	11:12:52	525
4114	1425	Debit Card	5	4	12:07:02	525
6022	2081	Credit Card	5	4	12:36:05	525
2037	712	iOS app	5	3	17:53:34	525
1047	360	Credit Card	5	2	16:47:36	525
1980	688	Credit Card	5	4	10:48:44	525
3063	1063	Debit Card	5	4	15:27:09	525
4818	1660	iOS app	5	2	09:25:45	525
5547	1918	iOS app	5	1	14:06:06	525
1954	679	iOS app	5	1	13:43:47	525
4406	1518	iOS app	5	4	17:49:09	525
74	24	iOS app	5	4	18:06:37	525
670	232	Credit Card	5	3	15:24:48	525
876	301	Android app	5	1	14:55:08	525
5659	1955	Credit Card	5	3	14:29:36	525
1942	675	iOS app	5	1	14:53:15	525
1935	673	Credit Card	5	4	10:58:22	525
4843	1669	Debit Card	5	4	13:47:12	525
1924	669	Android app	5	3	14:31:04	525
1920	668	iOS app	5	4	12:55:43	525
4852	1671	Credit Card	5	4	18:40:24	525
5396	1867	Credit Card	5	3	13:49:33	525
1911	665	iOS app	5	3	17:44:43	525
4861	1674	Android app	5	3	14:53:54	525
1896	659	Credit Card	5	2	10:43:56	525
3036	1055	iOS app	5	3	11:03:01	525
657	228	Credit Card	5	4	14:59:03	525
2613	910	iOS app	5	4	17:38:14	525
1877	652	Credit Card	5	4	17:49:34	525
212	65	Credit Card	5	3	13:52:10	525
874	300	Android app	5	2	09:08:40	525
1859	644	Credit Card	5	3	09:41:29	525
5683	1965	iOS app	5	2	13:56:55	525
2995	1041	iOS app	5	3	14:25:05	525
4902	1688	Debit Card	5	4	14:17:23	525
1831	635	Debit Card	5	2	13:45:43	525
355	115	iOS app	5	3	17:12:49	525
2438	851	Credit Card	5	3	13:42:38	525
4918	1693	Debit Card	5	3	16:01:21	525
1815	630	Android app	5	3	11:12:01	525
1804	627	Debit Card	5	2	11:35:27	525
2986	1038	Debit Card	5	3	09:30:06	525
6	2	iOS app	5	3	15:22:56	525
635	220	Credit Card	5	4	10:17:19	525
1793	624	iOS app	5	4	17:28:30	525
37	13	iOS app	5	2	17:15:02	525
1784	620	Credit Card	5	2	16:45:46	525
4944	1704	iOS app	5	4	10:24:47	525
4554	1573	Android app	5	1	17:37:43	525
4950	1707	iOS app	5	4	17:11:41	525
1780	619	Credit Card	5	3	11:49:01	525
1036	356	Credit Card	5	4	12:08:52	525
2980	1037	iOS app	5	1	11:33:58	525
351	114	Credit Card	5	3	13:23:06	525
4179	1446	Android app	5	1	16:42:07	525
1755	610	Credit Card	5	2	10:24:36	525
596	206	Debit Card	5	3	14:43:40	525
1753	609	Credit Card	5	4	16:37:20	525
5966	2062	Credit Card	5	2	10:49:44	525
865	298	iOS app	5	4	14:29:57	525
588	202	Credit Card	5	4	17:29:16	525
1743	606	Android app	5	2	18:15:07	525
2965	1031	Android app	5	3	12:55:45	525
1735	604	iOS app	5	3	17:25:16	525
2960	1030	iOS app	5	2	16:25:32	525
4987	1719	Android app	5	4	12:04:38	525
1031	353	Android app	5	1	14:33:20	525
5971	2065	iOS app	5	4	12:52:33	525
1707	593	Credit Card	5	3	11:41:30	525
5003	1726	Credit Card	5	4	17:57:20	525
582	200	iOS app	5	4	14:38:34	525
4190	1449	Credit Card	5	4	09:51:52	525
1672	581	Credit Card	5	4	17:26:17	525
1668	580	Credit Card	5	4	17:51:04	525
5033	1739	iOS app	5	3	13:59:35	525
1663	579	Debit Card	5	4	17:56:01	525
192	59	Debit Card	5	3	17:25:24	525
1638	571	Android app	5	2	15:28:14	525
5739	1987	Android app	5	3	10:24:21	525
5047	1744	Android app	5	4	10:17:31	525
2592	902	Credit Card	5	3	11:44:52	525
5053	1745	Credit Card	5	2	15:56:07	525
526	177	Credit Card	5	3	15:49:46	525
1619	566	Credit Card	5	4	12:56:33	525
2432	849	Android app	5	3	11:26:42	525
4203	1453	Credit Card	5	3	17:28:09	525
521	176	iOS app	5	1	14:16:39	525
5069	1749	iOS app	5	3	17:05:47	525
2584	898	Debit Card	5	4	11:20:33	525
1604	561	iOS app	5	4	10:45:18	525
2932	1021	Debit Card	5	4	10:39:32	525
1016	347	Debit Card	5	4	17:46:20	525
2929	1020	Credit Card	5	4	11:28:55	525
1566	548	iOS app	5	4	11:46:42	525
2926	1019	iOS app	5	3	15:17:30	525
5426	1875	iOS app	5	2	18:30:19	525
855	295	Android app	5	4	17:29:44	525
507	172	Debit Card	5	3	12:17:02	525
1490	519	Credit Card	5	4	11:33:43	525
2424	847	Credit Card	5	3	16:21:36	525
2891	1005	iOS app	5	2	14:12:37	525
4230	1462	iOS app	5	4	11:58:25	525
5767	1999	iOS app	5	4	12:33:57	525
1472	511	Credit Card	5	4	16:55:07	525
5121	1766	iOS app	5	3	12:27:15	525
174	55	iOS app	5	1	14:42:40	525
1466	510	Credit Card	5	3	09:26:55	525
5135	1772	Debit Card	5	2	10:57:41	525
1011	345	Debit Card	5	3	15:10:29	525
1444	504	Credit Card	5	4	14:22:52	525
2861	996	iOS app	5	4	13:20:45	525
5160	1780	Credit Card	5	2	13:32:16	525
5164	1782	Android app	5	1	15:42:52	525
1005	342	iOS app	5	3	13:56:43	525
2856	995	iOS app	5	4	09:36:23	525
1383	482	Credit Card	5	2	15:38:13	525
482	164	iOS app	5	4	16:11:23	525
1374	479	Debit Card	5	2	14:02:27	525
5521	1908	Credit Card	5	3	10:40:26	525
820	282	iOS app	5	3	18:48:38	525
4255	1469	Credit Card	5	2	16:36:21	525
1371	478	iOS app	5	3	17:51:43	525
5788	2006	Android app	5	3	10:54:05	525
334	109	Debit Card	5	3	10:13:13	525
452	153	Debit Card	5	3	16:42:47	525
809	279	Credit Card	5	3	16:30:45	525
4264	1471	iOS app	5	1	13:47:45	525
1329	462	Credit Card	5	3	12:16:41	525
5525	1909	Credit Card	5	2	14:21:10	525
1323	459	Android app	5	1	16:54:18	525
1307	453	iOS app	5	4	15:43:39	525
5223	1803	iOS app	5	3	16:28:29	525
438	149	Android app	5	2	09:57:22	525
4269	1472	Android app	5	3	09:22:12	525
5806	2013	Credit Card	5	2	10:37:37	525
4539	1569	iOS app	5	3	13:50:31	525
5239	1809	iOS app	5	3	15:45:42	525
2820	984	iOS app	5	2	14:39:23	525
2816	983	Debit Card	5	3	10:10:01	525
4471	1544	Credit Card	5	3	18:38:18	525
1291	448	iOS app	5	4	11:56:35	525
5130	1770	Debit Card	6	2	13:36:07	750
1615	565	Android app	6	1	16:28:55	750
5113	1763	iOS app	6	4	16:49:07	750
4988	1719	Android app	6	4	12:04:38	750
5136	1772	Debit Card	6	2	10:57:41	750
504	171	Debit Card	6	3	18:43:22	750
5773	2001	Android app	6	3	09:12:42	750
2862	996	iOS app	6	4	13:20:45	750
5142	1774	iOS app	6	4	11:06:42	750
1912	665	iOS app	6	3	17:44:43	750
1454	507	Credit Card	6	4	12:38:56	750
2575	895	iOS app	6	4	16:03:53	750
5151	1778	iOS app	6	3	12:18:55	750
5435	1878	Credit Card	6	2	15:02:15	750
1445	504	Credit Card	6	4	14:22:52	750
3048	1059	Credit Card	6	4	16:26:08	750
5091	1755	Credit Card	6	3	13:18:54	750
1432	500	Android app	6	2	17:02:44	750
4456	1539	iOS app	6	4	16:33:59	750
5397	1867	Credit Card	6	3	13:49:33	750
5880	2036	iOS app	6	1	12:56:26	750
4053	1404	Credit Card	6	3	15:21:00	750
4246	1467	Debit Card	6	3	11:03:22	750
2306	806	Credit Card	6	4	10:09:28	750
5171	1786	Debit Card	6	4	11:34:03	750
5781	2004	Credit Card	6	3	15:05:05	750
1713	595	Debit Card	6	2	15:50:22	750
3177	1108	Debit Card	6	2	18:07:34	750
169	54	Credit Card	6	3	12:18:46	750
5421	1874	Android app	6	4	10:11:47	750
5485	1895	Android app	6	4	16:20:53	750
5183	1790	Credit Card	6	3	17:13:51	750
6027	2082	Credit Card	6	2	13:54:21	750
3037	1055	iOS app	6	3	11:03:01	750
2303	805	iOS app	6	4	17:24:27	750
5522	1908	Credit Card	6	3	10:40:26	750
5109	1762	Credit Card	6	3	13:28:16	750
299	96	Android app	6	1	13:23:29	750
4142	1432	Android app	6	2	15:36:12	750
336	110	Credit Card	6	4	10:54:35	750
2831	988	Credit Card	6	2	14:37:05	750
5789	2006	Android app	6	3	10:54:05	750
4567	1577	Debit Card	6	4	15:23:38	750
5589	1930	iOS app	6	4	17:53:22	750
658	228	Credit Card	6	4	14:59:03	750
2294	801	Credit Card	6	4	13:03:19	750
255	79	iOS app	6	2	12:03:55	750
5863	2031	Credit Card	6	2	17:26:20	750
1702	592	iOS app	6	4	17:28:35	750
4265	1471	iOS app	6	1	13:47:45	750
2654	925	iOS app	6	1	10:20:23	750
3159	1100	iOS app	6	3	11:28:00	750
5215	1801	Debit Card	6	4	10:16:46	750
439	149	Android app	6	2	09:57:22	750
1311	454	Credit Card	6	3	16:01:57	750
2821	984	iOS app	6	2	14:39:23	750
2644	921	iOS app	6	4	16:11:49	750
1888	656	Debit Card	6	4	14:54:59	750
2270	794	iOS app	6	4	15:19:35	750
6079	2099	iOS app	6	4	16:35:18	750
2952	1028	iOS app	6	3	11:18:42	750
5804	2012	iOS app	6	1	12:53:09	750
1301	451	iOS app	6	3	16:35:09	750
6091	2103	Android app	6	1	17:08:40	750
163	52	Credit Card	6	3	16:31:40	750
4879	1681	Android app	6	4	11:57:36	750
5679	1964	iOS app	6	4	13:24:03	750
2261	792	Debit Card	6	3	18:39:12	750
2458	857	iOS app	6	3	15:39:49	750
2256	791	Debit Card	6	3	18:27:38	750
1605	561	iOS app	6	4	10:45:18	750
5595	1931	iOS app	6	3	15:39:50	750
5249	1812	iOS app	6	1	12:44:41	750
5004	1726	Credit Card	6	4	17:57:20	750
2810	980	Credit Card	6	4	16:55:57	750
3012	1045	iOS app	6	3	12:04:55	750
6046	2089	Debit Card	6	3	17:42:52	750
3693	1281	iOS app	6	4	17:17:06	750
2933	1021	Debit Card	6	4	10:39:32	750
3720	1289	Android app	6	1	16:31:43	750
4668	1611	iOS app	6	2	12:49:08	750
4889	1684	Debit Card	6	2	12:55:16	750
828	286	iOS app	6	3	17:18:41	750
987	336	iOS app	6	2	14:02:30	750
3730	1292	iOS app	6	3	16:16:06	750
5814	2016	Credit Card	6	3	14:01:04	750
305	98	iOS app	6	3	09:25:01	750
2509	871	Credit Card	6	4	15:25:22	750
1537	536	Credit Card	6	2	15:15:44	750
1261	437	Android app	6	3	14:31:14	750
4675	1612	iOS app	6	4	15:15:39	750
2796	976	Credit Card	6	2	13:40:08	750
1037	356	Credit Card	6	4	12:08:52	750
3741	1294	Debit Card	6	3	15:28:53	750
2494	867	iOS app	6	3	17:45:46	750
5886	2037	Debit Card	6	4	13:50:08	750
4076	1412	Credit Card	6	4	12:07:13	750
2996	1041	iOS app	6	3	14:25:05	750
2201	771	iOS app	6	4	16:30:23	750
1854	643	Android app	6	4	13:50:22	750
3644	1263	iOS app	6	4	09:53:22	750
4685	1616	Android app	6	3	13:08:55	750
161	51	iOS app	6	1	10:31:36	750
572	196	iOS app	6	2	11:30:59	750
3627	1258	iOS app	6	1	10:25:31	750
5928	2048	iOS app	6	3	17:55:42	750
6023	2081	Credit Card	6	4	12:36:05	750
5269	1818	Credit Card	6	2	15:27:45	750
4294	1480	Credit Card	6	2	14:45:09	750
14	4	iOS app	6	1	11:52:55	750
5686	1967	Android app	6	4	12:42:14	750
5729	1984	Android app	6	1	09:49:33	750
1689	588	Android app	6	3	09:10:47	750
5955	2059	Credit Card	6	4	10:10:44	750
2170	760	Credit Card	6	4	17:31:31	750
3151	1098	Android app	6	1	15:14:40	750
5376	1859	Debit Card	6	3	14:09:26	750
3561	1235	Android app	6	1	11:59:57	750
2793	975	iOS app	6	3	11:16:17	750
558	189	Credit Card	6	1	17:24:46	750
3556	1233	Android app	6	4	17:55:03	750
3791	1313	iOS app	6	4	17:20:45	750
721	248	Credit Card	6	4	13:36:18	750
4157	1438	Debit Card	6	4	17:40:32	750
3544	1229	Debit Card	6	1	17:42:09	750
4191	1449	Credit Card	6	4	09:51:52	750
3799	1315	Debit Card	6	4	12:57:32	750
4910	1690	Android app	6	4	16:23:09	750
645	224	Android app	6	4	16:30:57	750
1229	425	Credit Card	6	3	14:49:07	750
2415	844	iOS app	6	4	14:58:32	750
5548	1918	iOS app	6	1	14:06:06	750
1816	630	Android app	6	3	11:12:01	750
3808	1317	iOS app	6	3	12:58:23	750
1226	424	Credit Card	6	1	18:20:18	750
555	188	Android app	6	2	14:28:49	750
38	13	iOS app	6	2	17:15:02	750
3515	1220	Credit Card	6	3	18:40:03	750
424	144	Credit Card	6	2	11:25:39	750
1207	417	Credit Card	6	3	12:57:39	750
3493	1212	Credit Card	6	2	13:27:24	750
2141	750	Android app	6	4	12:53:05	750
5427	1875	iOS app	6	2	18:30:19	750
132	42	Android app	6	1	10:43:11	750
4087	1415	Android app	6	1	15:31:29	750
149	46	Credit Card	6	3	12:15:10	750
3131	1090	iOS app	6	4	13:38:57	750
4162	1439	iOS app	6	1	16:37:12	750
4726	1630	Debit Card	6	3	14:30:57	750
866	298	iOS app	6	4	14:29:57	750
5463	1889	iOS app	6	1	10:06:34	750
2136	749	Credit Card	6	4	10:30:46	750
2899	1007	Credit Card	6	3	17:23:21	750
5026	1736	Android app	6	4	14:38:44	750
3472	1203	Android app	6	2	10:38:18	750
28	9	Credit Card	6	2	17:14:18	750
3847	1330	iOS app	6	3	10:11:16	750
5297	1828	iOS app	6	4	13:14:23	750
4735	1633	Android app	6	4	11:35:37	750
3117	1084	iOS app	6	2	15:17:24	750
3853	1332	Credit Card	6	3	17:30:22	750
1664	579	Debit Card	6	4	17:56:01	750
714	246	Credit Card	6	4	11:36:50	750
2131	748	Debit Card	6	4	14:10:22	750
2120	743	Debit Card	6	4	11:17:27	750
1156	397	iOS app	6	3	17:36:33	750
2608	909	Android app	6	4	12:36:22	750
1794	624	iOS app	6	4	17:28:30	750
3864	1335	Credit Card	6	2	13:20:25	750
4747	1637	Android app	6	1	12:12:27	750
3444	1195	iOS app	6	3	10:04:14	750
2943	1025	Debit Card	6	3	11:20:08	750
4319	1488	iOS app	6	4	13:44:53	750
956	327	Debit Card	6	4	17:29:38	750
877	301	Android app	6	1	14:55:08	750
4751	1638	iOS app	6	3	11:52:22	750
712	245	iOS app	6	4	16:35:10	750
3878	1340	Android app	6	1	17:50:12	750
2090	732	Android app	6	4	17:01:43	750
3399	1181	iOS app	6	3	16:23:54	750
4756	1640	Credit Card	6	4	14:30:31	750
541	183	Credit Card	6	4	16:29:58	750
1601	560	iOS app	6	4	15:50:27	750
2981	1037	iOS app	6	1	11:33:58	750
534	179	iOS app	6	2	09:38:32	750
1136	390	Android app	6	4	16:00:35	750
4450	1537	Credit Card	6	3	10:20:31	750
3377	1173	iOS app	6	4	17:47:50	750
3895	1345	Credit Card	6	4	14:57:53	750
949	325	Android app	6	3	10:41:38	750
4947	1706	iOS app	6	2	12:09:16	750
4328	1491	Debit Card	6	3	11:02:08	750
4768	1644	iOS app	6	4	14:20:19	750
842	290	iOS app	6	1	18:51:27	750
183	57	iOS app	6	3	11:19:19	750
360	118	Credit Card	6	3	11:46:31	750
3905	1347	Credit Card	6	3	11:24:40	750
3364	1169	Debit Card	6	2	14:06:05	750
2083	730	Android app	6	1	15:14:33	750
4776	1648	iOS app	6	4	13:08:25	750
2480	863	iOS app	6	3	10:01:32	750
3914	1350	Credit Card	6	4	18:17:14	750
4333	1493	Debit Card	6	4	12:24:14	750
3069	1064	Credit Card	6	3	15:07:37	750
5079	1751	iOS app	6	4	13:39:27	750
193	59	Debit Card	6	3	17:25:24	750
1127	388	Credit Card	6	4	18:08:25	750
2078	728	Android app	6	4	12:48:03	750
270	84	Debit Card	6	3	16:32:49	750
5389	1865	Debit Card	6	2	17:40:46	750
3334	1159	Credit Card	6	3	14:25:16	750
6013	2079	iOS app	6	3	16:35:14	750
5755	1994	Credit Card	6	4	16:30:32	750
2724	951	iOS app	6	4	10:28:06	750
3329	1158	iOS app	6	1	12:08:50	750
4338	1494	iOS app	6	4	15:11:59	750
5891	2038	Debit Card	6	2	18:01:04	750
3326	1157	Debit Card	6	4	17:04:01	750
5975	2066	iOS app	6	4	18:25:23	750
2060	721	Credit Card	6	4	18:47:29	750
5641	1948	Debit Card	6	2	18:09:05	750
5556	1921	Android app	6	4	10:06:09	750
601	207	iOS app	6	1	11:44:57	750
5331	1840	Debit Card	6	3	11:53:52	750
3314	1154	Credit Card	6	2	13:05:18	750
4115	1425	Debit Card	6	4	12:07:02	750
1114	384	Debit Card	6	4	10:10:51	750
4797	1653	Credit Card	6	2	17:24:50	750
3306	1152	Debit Card	6	4	11:49:32	750
1630	569	Debit Card	6	4	09:18:02	750
5943	2054	Credit Card	6	3	11:32:56	750
2048	717	iOS app	6	4	15:12:14	750
2708	945	Android app	6	2	10:04:28	750
3064	1063	Debit Card	6	4	15:27:09	750
2425	847	Credit Card	6	3	16:21:36	750
5498	1901	iOS app	6	4	13:11:59	750
3297	1149	iOS app	6	1	10:54:33	750
683	236	Credit Card	6	4	17:39:27	750
3980	1377	iOS app	6	2	14:28:21	750
2028	707	Credit Card	6	2	11:11:07	750
4120	1426	Android app	6	4	17:10:56	750
4353	1498	Debit Card	6	3	17:47:49	750
5048	1744	Android app	6	4	10:17:31	750
1981	688	Credit Card	6	4	10:48:44	750
3993	1384	iOS app	6	3	14:58:40	750
4964	1712	Debit Card	6	4	10:48:25	750
3276	1142	Credit Card	6	4	16:08:16	750
1567	548	iOS app	6	4	11:46:42	750
3998	1385	Debit Card	6	3	11:39:03	750
401	135	Android app	6	2	15:17:42	750
5903	2041	Credit Card	6	3	14:12:10	750
1110	383	Android app	6	4	18:33:32	750
3270	1141	Debit Card	6	3	16:13:40	750
4968	1713	Credit Card	6	4	15:20:15	750
1091	374	iOS app	6	1	10:08:38	750
1626	568	Credit Card	6	3	14:54:57	750
4555	1573	Android app	6	1	17:37:43	750
3266	1140	iOS app	6	3	13:14:11	750
4975	1716	iOS app	6	4	11:00:50	750
3262	1139	Credit Card	6	2	16:21:47	750
2614	910	iOS app	6	4	17:38:14	750
5054	1745	Credit Card	6	2	15:56:07	750
834	288	iOS app	6	4	10:09:36	750
119	37	Debit Card	6	3	16:50:38	750
3243	1132	Credit Card	6	3	11:05:27	750
384	128	Debit Card	6	2	11:17:34	750
4547	1571	Credit Card	6	4	10:07:07	750
4027	1394	iOS app	6	4	12:44:00	750
2682	936	Debit Card	6	3	10:58:15	750
2381	831	Android app	6	4	17:59:30	750
1946	677	Credit Card	6	4	17:43:12	750
2894	1006	iOS app	6	3	11:42:11	750
4835	1666	Android app	6	3	17:03:12	750
3197	1116	Android app	6	4	17:34:19	750
4231	1462	iOS app	6	4	11:58:25	750
2369	827	Credit Card	6	4	12:20:22	750
4515	1559	Credit Card	6	3	13:55:41	750
522	176	iOS app	6	1	14:16:39	750
2433	849	Android app	6	3	11:26:42	750
2359	822	Android app	6	4	12:57:29	750
2961	1030	iOS app	6	2	16:25:32	750
4844	1669	Debit Card	6	4	13:47:12	750
5660	1955	Credit Card	6	3	14:29:36	750
801	276	iOS app	6	3	12:54:47	750
1925	669	Android app	6	3	14:31:04	750
1730	603	iOS app	6	1	15:12:24	750
5573	1925	iOS app	6	3	10:47:36	750
1069	366	Credit Card	6	4	12:19:41	750
4601	1588	Credit Card	6	2	15:32:06	750
\.


--
-- Name: f_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('f_purchases_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orders (id, productid, price, size) FROM stdin;
1	1	25000	500
2	2	44000	500
3	3	5000	500
4	4	275000	500
5	5	87500	500
6	6	375000	500
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('orders_id_seq', 6, true);


--
-- Data for Name: paymenttypes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY paymenttypes (id, pmttype) FROM stdin;
1	Credit Card
2	Debit Card
3	iOS app
4	Android app
\.


--
-- Name: paymenttypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('paymenttypes_id_seq', 4, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY products (id, productname, price) FROM stdin;
1	Cotton Candy	300
2	Soft Pretzel	300
3	SUPERMEGA SODA CUP	450
4	Prank-o-rama funbag	1000
5	Postcard 5-pak	700
6	T-shirt	1500
7	Day ticket	7500
8	Season Pass	30000
9	Day ticket (child)	65000
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('products_id_seq', 9, true);


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY purchases (id, customerid, paymentid, productid, storeid, timeofpurchase) FROM stdin;
1	1	2	9	5	09:12:46
2	1	2	3	2	09:41:18
3	1	2	1	2	09:41:18
4	2	3	9	5	15:15:26
5	2	3	1	2	09:19:13
6	2	3	5	3	15:22:56
7	3	1	7	5	09:23:39
8	3	1	1	3	03:03:07
9	3	1	2	3	03:03:07
10	4	3	9	5	09:40:07
11	4	3	3	3	10:33:23
12	4	3	1	3	10:33:23
13	4	3	4	1	11:52:55
14	4	3	6	1	11:52:55
15	5	1	7	5	09:16:15
16	6	1	9	5	15:33:17
17	6	1	4	3	09:01:24
18	7	1	9	5	09:41:53
19	7	1	3	2	05:46:58
20	7	1	1	2	05:46:58
21	8	1	9	5	11:46:13
22	8	1	3	2	06:32:18
23	8	1	1	2	06:32:18
24	8	1	4	3	15:31:10
25	9	1	7	5	09:46:17
26	9	1	4	2	17:14:18
27	9	1	5	2	17:14:18
28	9	1	6	2	17:14:18
29	9	1	8	2	12:20:04
30	10	2	9	5	15:51:58
31	11	2	9	5	18:34:42
32	11	2	1	1	10:14:15
33	12	2	7	5	16:03:03
34	12	2	3	3	17:30:03
35	12	2	1	3	17:30:03
36	13	3	9	5	13:15:22
37	13	3	5	2	17:15:02
38	13	3	6	2	17:15:02
39	14	2	9	5	09:25:56
40	14	2	3	4	17:54:31
41	14	2	1	4	17:54:31
42	15	2	7	5	16:18:15
43	15	2	3	4	13:04:38
44	15	2	1	4	13:04:38
45	15	2	2	4	13:04:38
46	16	1	7	5	09:19:05
47	16	1	3	2	16:26:44
48	16	1	4	4	12:04:02
49	17	1	9	5	16:41:47
50	17	4	3	1	12:53:36
51	17	4	1	1	12:53:36
52	18	3	9	5	10:58:18
53	18	3	3	2	07:34:10
54	18	3	1	2	07:34:10
55	18	3	4	3	14:09:31
56	19	1	9	5	09:51:02
57	19	4	3	1	05:10:38
58	19	4	1	1	05:10:38
59	20	2	9	5	14:35:55
60	20	2	3	3	10:32:49
61	20	2	1	3	10:32:49
62	21	1	9	5	14:39:36
63	21	1	3	4	07:43:09
64	21	1	2	4	07:43:09
65	22	4	7	5	13:23:45
66	23	3	7	5	09:37:38
67	23	3	3	3	04:47:48
68	23	3	1	3	04:47:48
69	23	3	2	3	04:47:48
70	23	3	4	3	09:47:10
71	24	3	9	5	15:52:33
72	24	3	3	1	10:11:40
73	24	3	4	4	18:06:37
74	24	3	5	4	18:06:37
75	25	2	9	5	09:37:40
76	25	2	3	2	11:47:38
77	25	2	1	2	11:47:38
78	26	1	9	5	12:07:32
79	27	2	7	5	09:52:56
80	27	2	3	3	10:54:34
81	27	2	2	3	10:54:34
82	27	2	8	3	09:47:18
83	28	4	9	5	12:37:03
84	28	4	8	4	17:42:38
85	29	1	9	5	16:17:14
86	29	1	3	3	08:31:18
87	29	1	1	3	08:31:18
88	29	1	2	3	08:31:18
89	30	2	9	5	17:13:37
90	30	2	3	2	17:02:31
91	30	2	1	2	17:02:31
92	30	2	2	2	17:02:31
93	31	1	9	5	15:42:47
94	31	1	3	2	15:04:26
95	31	1	1	2	15:04:26
96	31	1	4	3	17:34:44
97	32	3	9	5	11:50:22
98	32	3	3	1	11:15:11
99	32	3	1	1	11:15:11
100	33	3	7	5	14:25:21
101	33	3	3	1	17:41:00
102	34	2	9	5	09:46:02
103	34	3	3	1	05:16:53
104	34	3	1	1	05:16:53
105	34	3	8	3	17:00:44
106	35	3	7	5	11:38:43
107	35	3	3	4	08:45:11
108	35	3	2	4	08:45:11
109	35	3	4	2	14:41:09
110	36	3	9	5	13:32:41
111	36	3	3	2	05:37:54
112	36	3	1	2	05:37:54
113	36	3	2	2	05:37:54
114	36	3	4	3	16:24:56
115	36	3	5	3	16:24:56
116	36	3	8	3	15:12:41
117	37	2	9	5	16:56:08
118	37	2	3	3	13:49:29
119	37	2	6	3	16:50:38
120	38	3	9	5	14:33:48
121	39	3	9	5	09:14:36
122	39	3	3	2	09:55:29
123	39	3	8	4	13:29:29
124	40	3	7	5	09:30:21
125	40	3	3	3	17:06:20
126	40	3	2	3	17:06:20
127	41	2	9	5	09:32:55
128	41	2	3	3	09:20:27
129	41	2	1	3	09:20:27
130	42	1	9	5	11:15:07
131	42	4	5	1	10:43:11
132	42	4	6	1	10:43:11
133	42	4	8	3	18:42:15
134	43	1	9	5	18:41:52
135	43	1	3	3	11:11:13
136	43	1	1	3	11:11:13
137	44	3	7	5	09:17:49
138	44	3	3	1	16:16:28
139	44	3	2	1	16:16:28
140	44	3	4	3	13:58:17
141	44	3	5	3	13:58:17
142	45	2	9	5	14:18:13
143	45	2	3	3	06:21:46
144	45	2	1	3	06:21:46
145	46	1	7	5	09:43:15
146	46	1	3	3	09:41:14
147	46	1	2	3	09:41:14
148	46	1	4	3	12:15:10
149	46	1	6	3	12:15:10
150	47	1	7	5	09:48:57
151	47	4	3	1	07:02:07
152	47	4	2	1	07:02:07
153	48	1	7	5	09:32:01
154	48	1	1	3	09:55:47
155	49	1	9	5	09:25:16
156	49	1	3	4	04:05:39
157	50	1	7	5	17:15:39
158	51	1	9	5	13:30:16
159	51	1	3	3	15:11:26
160	51	1	1	3	15:11:26
161	51	3	6	1	10:31:36
162	52	1	9	5	15:14:44
163	52	1	6	3	16:31:40
164	53	2	9	5	10:07:30
165	53	3	3	1	04:07:15
166	53	3	1	1	04:07:15
167	54	1	9	5	15:51:02
168	54	1	4	3	12:18:46
169	54	1	6	3	12:18:46
170	55	3	7	5	17:11:27
171	55	3	1	2	03:25:19
172	55	3	2	2	03:25:19
173	55	3	4	1	14:42:40
174	55	3	5	1	14:42:40
175	55	3	8	2	16:36:27
176	56	2	9	5	09:26:44
177	56	2	1	4	17:28:28
178	56	2	2	4	17:28:28
179	57	3	7	5	11:20:36
180	57	3	3	4	05:40:54
181	57	3	1	4	05:40:54
182	57	3	2	4	05:40:54
183	57	3	6	3	11:19:19
184	58	1	7	5	11:47:50
185	58	1	1	4	10:27:55
186	58	1	4	3	17:08:17
187	59	2	9	5	14:38:06
188	59	2	3	2	04:23:34
189	59	2	1	2	04:23:34
190	59	2	2	2	04:23:34
191	59	2	4	3	17:25:24
192	59	2	5	3	17:25:24
193	59	2	6	3	17:25:24
194	60	4	7	5	09:58:04
195	60	4	3	2	05:36:40
196	60	4	2	2	05:36:40
197	60	4	8	1	15:04:08
198	61	2	9	5	10:46:33
199	61	2	3	4	18:06:01
200	61	2	1	4	18:06:01
201	62	2	9	5	15:09:14
202	62	2	3	3	14:27:53
203	63	1	7	5	09:46:11
204	63	1	1	2	16:52:35
205	63	1	2	2	16:52:35
206	64	1	7	5	13:53:35
207	64	1	1	3	10:18:29
208	65	1	7	5	16:28:40
209	65	1	3	4	05:53:27
210	65	1	2	4	05:53:27
211	65	1	4	3	13:52:10
212	65	1	5	3	13:52:10
213	65	1	8	3	17:34:46
214	66	1	9	5	09:07:12
215	67	2	9	5	14:58:12
216	67	2	3	4	04:46:36
217	67	2	1	4	04:46:36
218	68	1	7	5	10:44:26
219	68	1	3	2	04:58:29
220	69	3	7	5	16:42:33
221	69	3	3	3	04:08:09
222	69	3	2	3	04:08:09
223	69	3	4	2	18:44:05
224	70	3	9	5	16:58:58
225	70	3	3	3	08:14:21
226	70	3	1	3	08:14:21
227	70	3	8	2	16:04:29
228	71	2	9	5	16:46:36
229	71	2	3	2	10:41:09
230	71	2	1	2	10:41:09
231	71	2	8	1	16:32:49
232	72	4	9	5	10:41:15
233	73	4	7	5	13:51:19
234	73	4	8	3	13:45:11
235	74	3	9	5	12:44:19
236	74	3	1	3	04:17:17
237	74	3	2	3	04:17:17
238	75	4	7	5	13:14:33
239	75	4	4	1	12:12:34
240	75	4	5	1	12:12:34
241	76	3	7	5	17:11:15
242	76	3	3	1	09:41:30
243	76	3	2	1	09:41:30
244	77	1	9	5	13:23:25
245	77	1	3	4	10:10:51
246	77	1	1	4	10:10:51
247	78	2	9	5	14:36:14
248	78	2	3	4	12:41:35
249	78	2	1	4	12:41:35
250	78	2	5	2	17:03:32
251	79	3	9	5	13:29:43
252	79	3	3	2	11:00:33
253	79	3	1	2	11:00:33
254	79	3	5	2	12:03:55
255	79	3	6	2	12:03:55
256	79	3	8	3	11:19:27
257	80	1	7	5	10:30:51
258	80	1	3	3	09:34:02
259	80	1	2	3	09:34:02
260	81	3	7	5	14:20:13
261	81	3	1	1	10:48:25
262	81	3	2	1	10:48:25
263	81	3	8	1	10:27:05
264	82	1	9	5	09:02:45
265	82	3	3	1	12:23:56
266	82	3	4	2	10:33:30
267	82	3	5	2	10:33:30
268	83	1	9	5	10:51:54
269	84	2	7	5	17:32:07
270	84	2	6	3	16:32:49
271	85	3	9	5	17:24:13
272	85	3	3	3	16:16:52
273	85	3	1	3	16:16:52
274	85	3	8	4	15:13:38
275	86	3	9	5	09:08:36
276	86	3	1	3	09:36:01
277	87	1	9	5	09:30:56
278	87	1	3	2	09:26:12
279	88	1	9	5	09:14:43
280	88	1	1	3	03:09:13
281	89	1	7	5	16:02:22
282	89	1	3	3	10:04:30
283	89	1	2	3	10:04:30
284	90	1	7	5	10:09:54
285	90	3	2	1	10:28:17
286	91	2	9	5	16:55:48
287	91	4	3	1	09:08:12
288	91	4	1	1	09:08:12
289	92	2	9	5	09:09:17
290	93	2	9	5	09:55:11
291	93	2	3	3	06:43:47
292	93	2	1	3	06:43:47
293	94	1	7	5	09:09:35
294	95	1	9	5	15:02:43
295	95	1	3	3	07:18:22
296	96	1	9	5	17:29:17
297	96	1	3	3	04:20:05
298	96	1	1	3	04:20:05
299	96	4	6	1	13:23:29
300	97	2	7	5	09:09:39
301	98	1	9	5	10:29:31
302	98	3	3	1	08:36:11
303	98	3	1	1	08:36:11
304	98	3	2	1	08:36:11
305	98	3	6	3	09:25:01
306	99	1	7	5	09:05:44
307	99	3	3	1	13:18:51
308	99	3	2	1	13:18:51
309	100	1	7	5	10:06:35
310	100	3	3	1	17:08:18
311	100	3	2	1	17:08:18
312	101	2	9	5	09:49:37
313	101	2	3	4	08:01:08
314	101	2	1	4	08:01:08
315	101	2	8	2	13:43:09
316	102	4	9	5	09:33:30
317	102	4	3	1	16:10:02
318	102	4	1	1	16:10:02
319	102	4	5	2	15:34:13
320	103	1	7	5	09:05:34
321	103	1	3	3	05:56:57
322	103	1	1	3	05:56:57
323	103	1	2	3	05:56:57
324	103	1	4	2	13:20:36
325	104	2	7	5	09:17:21
326	104	2	3	2	08:25:29
327	105	2	9	5	13:30:26
328	106	1	9	5	09:49:00
329	107	3	9	5	11:39:44
330	108	1	9	5	09:31:46
331	108	1	3	3	17:38:08
332	108	1	1	3	17:38:08
333	109	2	7	5	09:57:52
334	109	2	5	3	10:13:13
335	110	1	9	5	12:24:39
336	110	1	6	4	10:54:35
337	111	3	9	5	18:10:02
338	111	3	3	3	11:34:39
339	111	3	1	3	11:34:39
340	111	3	4	3	14:27:33
341	112	2	9	5	14:47:02
342	112	2	3	3	11:37:40
343	112	2	1	3	11:37:40
344	113	1	9	5	10:36:44
345	113	1	3	3	09:40:52
346	113	1	1	3	09:40:52
347	113	1	8	4	16:13:50
348	114	1	9	5	09:00:40
349	114	1	3	4	08:17:59
350	114	1	1	4	08:17:59
351	114	1	5	3	13:23:06
352	115	3	9	5	09:34:40
353	115	3	3	1	13:43:34
354	115	3	1	1	13:43:34
355	115	3	5	3	17:12:49
356	116	2	9	5	18:39:09
357	117	1	7	5	12:48:25
358	117	1	2	3	10:25:47
359	118	1	7	5	10:19:22
360	118	1	6	3	11:46:31
361	119	1	9	5	14:22:08
362	119	1	1	2	11:08:48
363	119	1	2	2	11:08:48
364	120	1	9	5	11:39:45
365	120	4	3	1	05:35:19
366	120	4	1	1	05:35:19
367	121	3	7	5	18:22:08
368	121	3	3	2	17:06:49
369	122	3	9	5	09:25:40
370	123	2	9	5	16:58:41
371	124	1	7	5	11:27:10
372	124	1	3	3	18:15:01
373	124	1	1	3	18:15:01
374	125	1	9	5	09:42:07
375	125	1	3	3	17:24:22
376	126	2	7	5	10:27:45
377	126	2	1	2	07:34:55
378	127	2	9	5	14:39:38
379	127	2	3	4	07:27:00
380	127	2	4	4	16:28:44
381	127	2	5	4	16:28:44
382	127	2	8	4	11:42:52
383	128	2	9	5	17:26:08
384	128	2	6	2	11:17:34
385	128	2	8	3	11:18:01
386	129	1	9	5	17:13:25
387	129	1	3	2	06:02:26
388	130	2	9	5	12:06:13
389	131	3	7	5	09:08:48
390	131	3	3	3	03:53:38
391	131	3	2	3	03:53:38
392	132	1	9	5	09:03:58
393	132	1	3	2	10:48:10
394	132	1	1	2	10:48:10
395	132	1	2	2	10:48:10
396	133	4	9	5	09:14:32
397	134	1	7	5	14:10:19
398	135	4	7	5	17:57:28
399	135	4	3	3	17:37:30
400	135	4	2	3	17:37:30
401	135	4	6	2	15:17:42
402	136	1	9	5	11:43:26
403	136	1	3	3	10:49:31
404	136	1	1	3	10:49:31
405	137	2	7	5	11:12:06
406	138	1	9	5	11:58:36
407	139	3	9	5	09:27:15
408	139	3	3	2	03:47:56
409	140	3	9	5	09:38:46
410	140	3	3	2	10:51:11
411	140	3	1	2	10:51:11
412	140	3	4	1	11:49:05
413	141	1	9	5	13:03:40
414	142	2	7	5	16:50:15
415	142	2	3	3	10:35:15
416	142	2	1	3	10:35:15
417	142	2	2	3	10:35:15
418	143	4	7	5	09:13:44
419	143	4	3	3	04:55:39
420	143	4	2	3	04:55:39
421	144	1	9	5	14:59:26
422	144	1	1	2	10:08:11
423	144	1	5	2	11:25:39
424	144	1	6	2	11:25:39
425	145	1	7	5	09:59:05
426	145	1	3	3	04:37:42
427	145	1	1	3	04:37:42
428	145	1	2	3	04:37:42
429	146	1	9	5	12:20:46
430	146	1	3	3	08:14:31
431	146	1	1	3	08:14:31
432	147	1	7	5	15:24:52
433	148	1	7	5	16:42:27
434	149	4	7	5	15:18:27
435	149	4	3	1	06:19:06
436	149	4	2	1	06:19:06
437	149	4	4	2	09:57:22
438	149	4	5	2	09:57:22
439	149	4	6	2	09:57:22
440	150	2	9	5	09:05:53
441	151	1	9	5	09:07:18
442	151	1	3	4	15:01:52
443	151	1	1	4	15:01:52
444	151	1	2	4	15:01:52
445	152	2	9	5	11:13:25
446	152	2	3	3	04:58:08
447	152	2	1	3	04:58:08
448	153	2	7	5	09:12:31
449	153	2	3	3	15:39:05
450	153	2	1	3	15:39:05
451	153	2	2	3	15:39:05
452	153	2	5	3	16:42:47
453	154	1	7	5	09:48:50
454	154	1	3	3	09:44:49
455	155	1	7	5	10:53:49
456	156	1	9	5	09:58:12
457	156	1	1	2	17:55:44
458	156	1	2	2	17:55:44
459	157	2	7	5	09:10:35
460	157	3	3	1	11:58:05
461	157	3	1	1	11:58:05
462	157	3	2	1	11:58:05
463	158	3	9	5	16:35:22
464	158	3	3	3	11:41:11
465	158	3	2	3	11:41:11
466	158	3	8	4	11:36:07
467	159	1	9	5	09:32:53
468	160	3	7	5	09:46:35
469	160	3	3	2	13:58:39
470	160	3	2	2	13:58:39
471	161	2	9	5	12:33:16
472	161	2	3	3	06:24:22
473	162	1	9	5	11:12:42
474	162	1	3	4	10:04:14
475	162	1	1	4	10:04:14
476	163	1	9	5	09:33:55
477	163	1	3	2	07:18:03
478	163	1	1	2	07:18:03
479	163	1	8	3	11:44:35
480	164	1	9	5	12:39:52
481	164	3	1	1	05:21:03
482	164	3	5	4	16:11:23
483	165	2	9	5	15:51:59
484	165	3	3	1	04:37:26
485	165	3	2	1	04:37:26
486	166	2	9	5	13:09:03
487	166	2	3	3	17:24:54
488	166	2	1	3	17:24:54
489	166	2	2	3	17:24:54
490	166	2	8	4	12:18:27
491	167	3	9	5	09:28:45
492	167	3	3	2	10:32:17
493	167	3	1	2	10:32:17
494	168	1	9	5	09:30:10
495	168	1	3	3	17:50:30
496	169	1	9	5	09:36:31
497	169	1	3	4	08:11:10
498	169	1	1	4	08:11:10
499	169	1	4	3	14:44:36
500	170	2	7	5	12:25:28
501	170	2	3	2	10:02:26
502	170	2	2	2	10:02:26
503	171	2	9	5	13:04:12
504	171	2	6	3	18:43:22
505	172	2	9	5	11:10:07
506	172	2	3	2	16:42:35
507	172	2	5	3	12:17:02
508	173	1	9	5	13:32:46
509	173	4	3	1	11:02:14
510	174	1	7	5	16:50:45
511	174	1	3	2	18:17:11
512	174	1	1	2	18:17:11
513	174	1	2	2	18:17:11
514	175	3	9	5	09:28:12
515	175	3	1	1	15:49:22
516	175	3	4	3	12:21:45
517	176	3	7	5	16:28:56
518	176	3	3	3	14:37:35
519	176	3	2	3	14:37:35
520	176	3	4	1	14:16:39
521	176	3	5	1	14:16:39
522	176	3	6	1	14:16:39
523	177	1	9	5	11:34:58
524	177	1	3	3	07:15:40
525	177	1	1	3	07:15:40
526	177	1	5	3	15:49:46
527	178	1	9	5	16:36:55
528	178	3	3	1	14:38:11
529	178	3	1	1	14:38:11
530	179	3	9	5	09:53:54
531	179	3	3	3	09:08:49
532	179	3	1	3	09:08:49
533	179	3	4	2	09:38:32
534	179	3	6	2	09:38:32
535	180	1	9	5	09:02:06
536	181	1	9	5	15:18:40
537	182	2	9	5	13:50:31
538	182	4	3	1	07:40:51
539	183	1	7	5	17:09:29
540	183	1	2	4	07:27:54
541	183	1	6	4	16:29:58
542	184	1	9	5	09:35:09
543	185	1	7	5	09:20:39
544	185	1	3	4	10:39:32
545	185	1	2	4	10:39:32
546	185	1	8	4	11:21:12
547	186	1	9	5	09:55:56
548	186	1	3	2	15:50:32
549	186	1	1	2	15:50:32
550	187	2	9	5	09:30:34
551	187	2	3	4	10:48:48
552	188	4	9	5	16:13:23
553	188	4	3	4	17:29:22
554	188	4	1	4	17:29:22
555	188	4	6	2	14:28:49
556	188	4	8	3	17:04:15
557	189	1	7	5	09:28:40
558	189	1	6	1	17:24:46
559	190	3	9	5	09:27:46
560	191	2	7	5	09:04:28
561	191	2	2	4	07:43:46
562	192	1	9	5	11:54:19
563	192	1	3	4	05:44:35
564	192	1	1	4	05:44:35
565	193	1	9	5	10:39:50
566	193	1	3	3	16:03:14
567	194	3	7	5	17:10:24
568	195	1	9	5	09:01:31
569	195	1	3	2	15:49:12
570	195	1	2	2	15:49:12
571	196	3	9	5	09:05:58
572	196	3	6	2	11:30:59
573	197	1	9	5	09:39:51
574	197	1	3	3	05:44:17
575	197	1	8	2	12:35:19
576	198	4	9	5	09:17:41
577	199	1	7	5	16:33:39
578	199	1	1	3	10:30:48
579	200	2	9	5	09:17:59
580	200	3	3	1	09:23:01
581	200	3	1	1	09:23:01
582	200	3	5	4	14:38:34
583	201	3	9	5	16:10:35
584	201	3	3	3	09:54:39
585	201	3	1	3	09:54:39
586	202	1	7	5	12:31:06
587	202	1	4	4	17:29:16
588	202	1	5	4	17:29:16
589	203	4	9	5	14:16:02
590	204	2	7	5	11:35:17
591	205	1	9	5	15:31:42
592	206	2	9	5	11:56:17
593	206	2	3	3	05:15:07
594	206	2	1	3	05:15:07
595	206	2	2	3	05:15:07
596	206	2	5	3	14:43:40
597	207	1	7	5	09:47:48
598	207	1	3	4	12:13:38
599	207	1	1	4	12:13:38
600	207	1	2	4	12:13:38
601	207	3	6	1	11:44:57
602	208	1	9	5	16:10:45
603	208	1	2	2	17:31:58
604	209	3	9	5	09:20:47
605	209	3	3	3	14:01:28
606	209	3	1	3	14:01:28
607	210	2	7	5	09:59:49
608	211	1	7	5	09:48:17
609	211	1	3	2	09:47:39
610	211	1	1	2	09:47:39
611	211	1	2	2	09:47:39
612	212	4	9	5	18:45:49
613	212	4	3	4	04:30:11
614	213	3	9	5	16:42:11
615	214	1	7	5	09:56:00
616	214	1	3	3	11:51:34
617	214	1	1	3	11:51:34
618	214	1	2	3	11:51:34
619	214	3	4	1	14:53:03
620	215	4	9	5	09:31:16
621	215	4	3	3	11:08:20
622	216	1	9	5	09:55:47
623	216	1	3	2	07:26:07
624	217	4	9	5	17:55:02
625	217	4	3	4	11:17:35
626	218	2	9	5	09:19:38
627	219	2	7	5	09:38:23
628	219	2	3	2	05:39:02
629	219	2	1	2	05:39:02
630	219	2	2	2	05:39:02
631	220	1	9	5	09:03:49
632	220	1	3	3	09:18:57
633	220	1	1	3	09:18:57
634	220	1	4	4	10:17:19
635	220	1	5	4	10:17:19
636	221	2	7	5	10:51:27
637	221	2	4	3	13:55:09
638	222	4	9	5	09:54:22
639	223	1	9	5	16:19:33
640	223	1	3	3	10:21:48
641	223	1	1	3	10:21:48
642	224	2	7	5	14:12:34
643	224	4	3	1	18:46:02
644	224	4	2	1	18:46:02
645	224	4	6	4	16:30:57
646	225	2	9	5	11:19:56
647	225	2	8	4	11:45:03
648	226	1	7	5	09:23:10
649	226	1	3	3	08:04:16
650	226	1	2	3	08:04:16
651	227	2	7	5	09:03:51
652	227	2	3	3	12:54:55
653	227	2	1	3	12:54:55
654	228	1	7	5	11:12:42
655	228	1	3	3	08:09:14
656	228	1	4	4	14:59:03
657	228	1	5	4	14:59:03
658	228	1	6	4	14:59:03
659	229	1	9	5	15:17:12
660	229	3	3	1	09:28:57
661	230	2	9	5	12:01:28
662	230	2	3	2	12:26:07
663	230	2	1	2	12:26:07
664	230	2	4	4	13:57:56
665	231	1	9	5	09:40:45
666	231	3	3	1	08:59:50
667	231	3	1	1	08:59:50
668	232	1	9	5	09:36:45
669	232	1	4	3	15:24:48
670	232	1	5	3	15:24:48
671	233	2	9	5	16:41:52
672	234	4	7	5	09:26:33
673	234	4	3	3	05:32:53
674	234	4	1	3	05:32:53
675	234	4	4	4	13:43:13
676	234	4	8	4	14:30:12
677	235	1	7	5	09:20:33
678	236	1	7	5	09:20:39
679	236	1	3	1	11:23:02
680	236	1	1	1	11:23:02
681	236	1	2	1	11:23:02
682	236	1	4	4	17:39:27
683	236	1	6	4	17:39:27
684	237	1	9	5	18:23:53
685	237	1	3	3	10:54:57
686	237	1	4	3	12:36:13
687	238	1	9	5	11:43:48
688	238	3	3	1	03:33:31
689	238	3	8	2	11:22:38
690	239	1	9	5	14:35:58
691	239	1	3	2	09:04:29
692	239	1	5	3	16:23:55
693	240	1	9	5	13:43:25
694	240	3	1	1	06:06:49
695	241	2	9	5	09:22:57
696	241	2	3	2	17:19:48
697	241	2	1	2	17:19:48
698	242	2	7	5	09:48:06
699	242	2	3	2	05:19:00
700	242	2	1	2	05:19:00
701	242	2	2	2	05:19:00
702	243	1	9	5	09:04:44
703	243	1	3	3	04:08:28
704	243	1	1	3	04:08:28
705	243	1	2	3	04:08:28
706	243	1	4	2	15:08:13
707	244	2	9	5	14:40:13
708	244	2	3	3	05:14:36
709	245	2	9	5	09:41:48
710	245	3	3	1	04:56:12
711	245	3	1	1	04:56:12
712	245	3	6	4	16:35:10
713	246	1	9	5	12:19:41
714	246	1	6	4	11:36:50
715	247	2	7	5	09:51:24
716	247	2	3	3	07:36:21
717	248	1	9	5	09:13:25
718	248	1	3	2	17:33:14
719	248	1	1	2	17:33:14
720	248	1	4	4	13:36:18
721	248	1	6	4	13:36:18
722	249	1	9	5	09:26:12
723	249	1	1	3	13:23:40
724	249	1	8	2	13:38:37
725	250	3	9	5	09:36:12
726	250	3	3	4	08:36:40
727	251	2	9	5	09:41:17
728	251	2	5	4	12:33:34
729	252	1	7	5	14:32:38
730	252	1	3	3	07:12:50
731	252	1	2	3	07:12:50
732	253	1	9	5	14:26:08
733	253	4	3	1	09:31:34
734	254	2	9	5	17:18:00
735	254	2	1	2	10:40:26
736	255	2	9	5	09:14:09
737	255	4	3	1	16:42:01
738	255	4	1	1	16:42:01
739	256	1	9	5	12:45:15
740	256	1	3	3	05:32:02
741	256	1	1	3	05:32:02
742	257	2	9	5	09:40:40
743	258	3	9	5	09:37:55
744	258	3	3	1	07:54:53
745	258	3	5	4	13:22:23
746	259	1	9	5	17:09:12
747	260	2	9	5	09:14:40
748	260	4	1	1	17:41:31
749	261	3	7	5	16:51:54
750	261	3	3	1	09:32:44
751	261	3	2	1	09:32:44
752	261	3	5	4	13:07:17
753	262	2	9	5	09:26:41
754	262	2	3	3	05:25:56
755	262	2	1	3	05:25:56
756	263	2	9	5	18:03:37
757	263	2	3	2	05:05:12
758	264	3	9	5	17:41:34
759	264	3	3	4	08:27:30
760	264	3	1	4	08:27:30
761	264	3	2	4	08:27:30
762	265	4	9	5	17:03:04
763	265	4	3	4	03:14:46
764	265	4	1	4	03:14:46
765	266	1	9	5	15:33:41
766	266	4	3	1	11:07:45
767	266	4	4	1	12:21:46
768	266	4	5	1	12:21:46
769	267	1	7	5	09:26:13
770	267	1	3	3	11:53:12
771	267	1	2	3	11:53:12
772	268	2	7	5	09:41:48
773	268	2	3	3	04:53:29
774	268	2	2	3	04:53:29
775	268	2	4	4	15:24:26
776	269	1	7	5	15:58:48
777	269	1	3	3	18:39:49
778	269	1	2	3	18:39:49
779	270	1	7	5	12:32:40
780	270	1	3	2	06:12:10
781	271	4	9	5	16:09:43
782	271	4	3	3	10:24:47
783	271	4	1	3	10:24:47
784	271	4	4	4	17:54:27
785	272	2	7	5	09:24:33
786	272	2	2	2	17:46:08
787	272	2	8	3	10:28:05
788	273	1	9	5	11:12:37
789	274	2	9	5	17:44:40
790	274	2	3	4	10:27:05
791	274	2	1	4	10:27:05
792	275	1	7	5	12:49:02
793	275	1	3	4	04:41:12
794	275	1	2	4	04:41:12
795	275	1	4	3	11:17:52
796	275	1	5	3	11:17:52
797	276	3	9	5	09:05:15
798	276	3	3	1	08:19:17
799	276	3	1	1	08:19:17
800	276	3	4	3	12:54:47
801	276	3	6	3	12:54:47
802	277	4	9	5	09:41:01
803	277	4	3	2	09:26:07
804	277	4	1	2	09:26:07
805	278	2	9	5	09:27:55
806	278	2	3	4	16:35:28
807	278	2	1	4	16:35:28
808	279	1	9	5	14:33:28
809	279	1	5	3	16:30:45
810	280	3	7	5	09:47:04
811	280	3	3	3	14:09:25
812	280	3	1	3	14:09:25
813	280	3	2	3	14:09:25
814	281	2	7	5	09:09:32
815	281	2	3	1	04:40:07
816	281	2	2	1	04:40:07
817	282	3	9	5	09:50:35
818	282	3	3	2	13:11:33
819	282	3	4	3	18:48:38
820	282	3	5	3	18:48:38
821	283	1	9	5	15:14:22
822	284	2	7	5	09:44:01
823	285	1	7	5	13:05:10
824	286	3	7	5	17:45:38
825	286	3	3	4	08:31:10
826	286	3	2	4	08:31:10
827	286	3	4	3	17:18:41
828	286	3	6	3	17:18:41
829	287	3	9	5	13:31:59
830	287	3	3	1	06:10:14
831	287	3	1	1	06:10:14
832	288	3	9	5	09:23:27
833	288	3	3	1	18:50:24
834	288	3	6	4	10:09:36
835	289	1	9	5	11:13:24
836	289	1	3	3	09:02:21
837	289	1	1	3	09:02:21
838	290	1	9	5	09:51:42
839	290	1	3	3	10:40:00
840	290	1	1	3	10:40:00
841	290	3	5	1	18:51:27
842	290	3	6	1	18:51:27
843	291	3	9	5	09:33:53
844	292	1	7	5	09:39:25
845	292	1	3	4	06:54:14
846	292	1	1	4	06:54:14
847	293	1	9	5	09:27:58
848	293	1	4	4	15:14:03
849	294	3	9	5	15:36:26
850	294	3	3	1	14:34:17
851	294	3	1	1	14:34:17
852	294	3	2	1	14:34:17
853	295	4	7	5	16:04:10
854	295	4	2	1	08:34:39
855	295	4	5	4	17:29:44
856	296	2	7	5	09:32:15
857	296	2	3	3	07:55:50
858	296	2	2	3	07:55:50
859	297	3	9	5	13:07:06
860	297	3	3	3	05:52:09
861	297	3	2	3	05:52:09
862	298	3	9	5	09:50:01
863	298	3	3	3	14:55:13
864	298	3	4	4	14:29:57
865	298	3	5	4	14:29:57
866	298	3	6	4	14:29:57
867	299	2	7	5	11:25:00
868	299	2	3	1	03:49:23
869	299	2	2	1	03:49:23
870	300	4	7	5	09:28:31
871	300	4	3	3	07:01:23
872	300	4	2	3	07:01:23
873	300	4	4	2	09:08:40
874	300	4	5	2	09:08:40
875	301	4	9	5	18:08:23
876	301	4	5	1	14:55:08
877	301	4	6	1	14:55:08
878	302	1	7	5	09:32:51
879	302	1	3	3	08:45:19
880	302	1	2	3	08:45:19
881	303	2	7	5	14:32:45
882	304	1	7	5	09:19:40
883	304	1	3	2	05:15:32
884	304	1	5	4	15:33:08
885	305	3	7	5	09:47:58
886	305	3	3	3	09:01:43
887	305	3	4	3	11:39:56
888	306	3	7	5	13:37:26
889	306	3	1	3	12:49:07
890	306	3	5	4	14:44:23
891	307	1	7	5	14:28:45
892	307	3	3	1	04:01:19
893	307	3	2	1	04:01:19
894	308	2	9	5	09:10:28
895	308	2	3	3	15:07:38
896	308	2	1	3	15:07:38
897	308	2	4	4	17:14:57
898	309	1	7	5	15:19:12
899	310	1	7	5	09:32:23
900	310	3	1	1	07:10:11
901	310	3	2	1	07:10:11
902	310	3	4	2	12:31:09
903	311	1	9	5	10:22:54
904	311	1	3	2	08:16:25
905	311	1	1	2	08:16:25
906	312	2	7	5	09:53:53
907	312	2	3	3	07:13:08
908	312	2	2	3	07:13:08
909	312	2	8	4	11:52:57
910	313	4	9	5	13:54:25
911	313	4	3	3	16:17:37
912	313	4	1	3	16:17:37
913	313	4	2	3	16:17:37
914	313	4	5	3	17:26:22
915	314	2	7	5	18:14:54
916	315	2	7	5	13:58:38
917	315	2	3	3	17:28:00
918	315	2	1	3	17:28:00
919	315	2	2	3	17:28:00
920	316	1	9	5	09:22:48
921	316	3	3	1	03:48:52
922	316	3	2	1	03:48:52
923	317	1	9	5	09:05:08
924	317	1	8	1	14:46:00
925	318	2	7	5	14:14:51
926	318	2	3	2	13:42:37
927	318	2	1	2	13:42:37
928	319	2	9	5	17:08:19
929	319	3	3	1	05:14:32
930	319	3	5	1	11:54:38
931	320	2	9	5	12:02:19
932	320	4	3	1	15:50:19
933	320	4	1	1	15:50:19
934	321	3	7	5	11:12:11
935	321	3	3	3	09:15:30
936	321	3	1	3	09:15:30
937	322	2	7	5	09:52:50
938	322	2	3	2	17:31:31
939	323	3	9	5	13:24:17
940	323	3	3	3	10:12:48
941	323	3	4	1	13:46:13
942	323	3	8	4	12:33:32
943	324	3	9	5	14:58:40
944	324	3	1	1	04:02:18
945	325	1	9	5	17:48:54
946	325	4	3	1	05:31:53
947	325	4	1	1	05:31:53
948	325	4	2	1	05:31:53
949	325	4	6	3	10:41:38
950	326	3	9	5	15:27:32
951	327	2	7	5	12:31:09
952	327	2	3	3	11:52:52
953	327	2	1	3	11:52:52
954	327	2	2	3	11:52:52
955	327	2	5	4	17:29:38
956	327	2	6	4	17:29:38
957	328	2	9	5	15:56:00
958	328	2	3	3	12:16:41
959	328	2	1	3	12:16:41
960	328	2	4	3	14:50:30
961	328	2	5	3	14:50:30
962	328	2	8	3	15:32:30
963	329	1	7	5	16:00:37
964	329	1	3	4	03:53:44
965	330	1	9	5	09:02:33
966	330	4	3	1	06:34:40
967	330	4	1	1	06:34:40
968	331	4	7	5	11:23:37
969	331	4	3	3	05:55:54
970	331	4	2	3	05:55:54
971	331	4	8	3	10:19:30
972	332	3	9	5	18:33:32
973	332	3	3	2	10:15:28
974	332	3	1	2	10:15:28
975	333	1	9	5	14:16:39
976	333	1	3	3	09:27:22
977	333	1	1	3	09:27:22
978	334	4	9	5	13:15:26
979	334	4	3	3	16:41:59
980	334	4	1	3	16:41:59
981	334	4	8	3	13:41:52
982	335	1	9	5	15:28:09
983	335	1	1	2	04:37:15
984	336	3	9	5	09:10:36
985	336	3	3	2	08:47:01
986	336	3	4	2	14:02:30
987	336	3	6	2	14:02:30
988	337	1	9	5	09:01:47
989	337	1	4	2	18:21:17
990	337	1	8	3	16:35:07
991	338	3	9	5	12:51:35
992	338	3	4	4	11:56:55
993	339	1	7	5	14:23:22
994	339	1	2	3	10:47:28
995	339	3	8	4	13:33:48
996	340	4	7	5	09:43:01
997	340	4	3	1	06:25:47
998	340	4	1	1	06:25:47
999	340	4	2	1	06:25:47
1000	341	1	7	5	11:17:39
1001	341	1	3	2	07:49:19
1002	342	3	9	5	10:38:21
1003	342	3	3	3	09:38:04
1004	342	3	1	3	09:38:04
1005	342	3	5	3	13:56:43
1006	343	2	9	5	14:25:36
1007	343	3	1	1	11:15:35
1008	344	1	9	5	10:27:43
1009	344	1	3	4	11:24:04
1010	345	2	7	5	13:50:02
1011	345	2	5	3	15:10:29
1012	345	2	8	2	17:10:46
1013	346	1	9	5	12:14:53
1014	346	1	3	1	05:21:30
1015	347	2	9	5	17:07:20
1016	347	2	5	4	17:46:20
1017	348	3	7	5	15:55:19
1018	348	3	1	1	06:42:29
1019	349	1	9	5	13:25:50
1020	349	3	3	1	08:10:11
1021	349	3	1	1	08:10:11
1022	350	2	7	5	09:34:12
1023	350	2	3	3	06:07:24
1024	351	4	7	5	14:23:03
1025	351	4	4	4	13:27:20
1026	352	2	7	5	14:45:58
1027	352	2	3	4	08:07:59
1028	352	2	1	4	08:07:59
1029	352	2	2	4	08:07:59
1030	353	1	7	5	09:03:56
1031	353	4	5	1	14:33:20
1032	354	3	9	5	09:28:34
1033	355	1	7	5	16:50:49
1034	356	1	9	5	15:18:15
1035	356	1	3	3	14:44:16
1036	356	1	5	4	12:08:52
1037	356	1	6	4	12:08:52
1038	357	2	9	5	10:16:22
1039	357	2	3	3	15:02:05
1040	358	2	7	5	17:04:17
1041	358	2	2	2	10:21:35
1042	359	1	9	5	13:07:19
1043	359	1	1	2	10:41:49
1044	359	1	2	2	10:41:49
1045	360	1	7	5	16:19:14
1046	360	1	4	2	16:47:36
1047	360	1	5	2	16:47:36
1048	361	1	7	5	09:50:05
1049	361	1	4	4	16:50:10
1050	362	2	7	5	12:35:47
1051	362	2	1	4	10:49:47
1052	362	2	2	4	10:49:47
1053	362	2	4	3	12:22:09
1054	362	2	5	3	12:22:09
1055	363	1	9	5	17:37:22
1056	363	4	3	1	05:52:41
1057	363	4	1	1	05:52:41
1058	363	4	8	3	10:10:28
1059	364	2	7	5	09:39:53
1060	364	2	3	3	18:57:42
1061	364	2	2	3	18:57:42
1062	365	4	7	5	16:56:30
1063	365	4	3	3	05:40:58
1064	365	4	2	3	05:40:58
1065	366	1	9	5	13:33:33
1066	366	1	3	3	05:07:44
1067	366	1	1	3	05:07:44
1068	366	1	4	4	12:19:41
1069	366	1	6	4	12:19:41
1070	367	1	9	5	11:32:49
1071	367	1	3	1	08:57:29
1072	367	1	1	1	08:57:29
1073	367	1	5	3	15:39:54
1074	368	1	7	5	10:21:24
1075	369	1	9	5	09:46:25
1076	369	1	3	3	17:55:38
1077	369	1	2	3	17:55:38
1078	370	2	9	5	09:39:44
1079	370	2	8	1	17:38:46
1080	371	3	9	5	09:17:22
1081	371	3	8	4	12:12:14
1082	372	2	9	5	15:13:26
1083	372	2	4	4	11:48:06
1084	372	2	8	1	16:01:30
1085	373	1	9	5	10:10:08
1086	373	1	3	4	04:32:38
1087	373	1	1	4	04:32:38
1088	374	3	9	5	09:34:40
1089	374	3	4	1	10:08:38
1090	374	3	5	1	10:08:38
1091	374	3	6	1	10:08:38
1092	375	4	9	5	13:29:14
1093	376	1	9	5	09:24:39
1094	376	1	1	3	17:15:20
1095	377	1	7	5	09:47:46
1096	377	1	3	3	04:27:00
1097	377	1	2	3	04:27:00
1098	378	3	9	5	13:42:34
1099	378	3	3	1	11:52:52
1100	378	3	8	3	18:32:53
1101	379	1	7	5	15:23:38
1102	379	4	3	1	07:58:05
1103	379	4	2	1	07:58:05
1104	380	3	9	5	09:14:34
1105	381	1	9	5	09:29:41
1106	382	1	9	5	11:08:13
1107	383	2	7	5	13:38:44
1108	383	4	3	1	15:20:31
1109	383	4	2	1	15:20:31
1110	383	4	6	4	18:33:32
1111	384	2	9	5	09:09:11
1112	384	2	4	4	10:10:51
1113	384	2	5	4	10:10:51
1114	384	2	6	4	10:10:51
1115	385	2	9	5	17:25:46
1116	385	3	1	1	13:24:01
1117	385	3	2	1	13:24:01
1118	386	2	9	5	12:11:14
1119	386	4	1	1	08:07:49
1120	387	2	7	5	09:19:42
1121	387	2	1	2	06:33:40
1122	388	1	7	5	16:05:10
1123	388	1	3	2	10:52:25
1124	388	1	1	2	10:52:25
1125	388	1	2	2	10:52:25
1126	388	1	4	4	18:08:25
1127	388	1	6	4	18:08:25
1128	389	2	9	5	14:27:10
1129	389	2	3	2	09:10:34
1130	389	2	1	2	09:10:34
1131	390	2	9	5	09:48:53
1132	390	4	3	1	15:17:17
1133	390	4	1	1	15:17:17
1134	390	4	4	4	16:00:35
1135	390	4	5	4	16:00:35
1136	390	4	6	4	16:00:35
1137	391	2	7	5	17:32:27
1138	391	2	3	2	09:18:08
1139	391	2	2	2	09:18:08
1140	391	2	5	4	14:46:20
1141	392	1	9	5	09:58:44
1142	392	1	3	2	06:55:41
1143	392	1	1	2	06:55:41
1144	392	1	2	2	06:55:41
1145	393	1	9	5	09:24:33
1146	394	4	9	5	09:01:30
1147	394	4	1	3	10:53:56
1148	394	4	5	2	14:10:04
1149	395	4	9	5	09:03:56
1150	396	2	9	5	12:39:43
1151	397	3	9	5	09:23:28
1152	397	3	3	4	17:48:11
1153	397	3	1	4	17:48:11
1154	397	3	2	4	17:48:11
1155	397	3	5	3	17:36:33
1156	397	3	6	3	17:36:33
1157	398	3	9	5	09:59:05
1158	398	3	3	2	05:12:42
1159	399	3	9	5	13:47:47
1160	399	3	3	1	05:30:43
1161	399	3	1	1	05:30:43
1162	400	1	9	5	16:41:46
1163	400	4	8	4	14:43:41
1164	401	4	7	5	10:49:29
1165	401	4	3	2	07:01:39
1166	402	1	7	5	09:06:10
1167	402	1	3	2	09:19:13
1168	402	1	2	2	09:19:13
1169	402	1	5	3	13:30:59
1170	403	2	7	5	14:08:30
1171	403	2	8	1	11:34:01
1172	404	2	7	5	14:13:36
1173	404	2	3	2	03:57:41
1174	405	2	9	5	15:12:16
1175	406	1	7	5	10:02:54
1176	406	3	3	1	09:51:48
1177	406	3	2	1	09:51:48
1178	407	3	9	5	16:03:12
1179	407	3	1	2	10:30:39
1180	408	4	9	5	09:21:40
1181	408	4	3	3	11:36:30
1182	408	4	1	3	11:36:30
1183	409	3	7	5	12:57:02
1184	409	3	3	2	10:21:33
1185	409	3	2	2	10:21:33
1186	410	2	7	5	09:02:56
1187	410	2	2	3	17:37:16
1188	410	2	5	4	14:44:31
1189	410	2	8	3	16:50:10
1190	411	1	9	5	17:32:07
1191	411	1	3	2	10:40:31
1192	411	1	1	2	10:40:31
1193	412	3	9	5	17:47:24
1194	412	3	3	2	14:47:06
1195	413	1	9	5	17:05:34
1196	414	4	9	5	17:29:22
1197	414	4	3	2	10:11:18
1198	415	3	7	5	09:10:02
1199	415	3	3	1	06:53:11
1200	415	3	2	1	06:53:11
1201	416	2	7	5	10:32:23
1202	416	2	3	4	07:10:48
1203	416	2	1	4	07:10:48
1204	416	2	2	4	07:10:48
1205	417	1	7	5	09:30:36
1206	417	1	5	3	12:57:39
1207	417	1	6	3	12:57:39
1208	418	4	9	5	13:31:30
1209	418	4	1	2	14:26:27
1210	419	1	9	5	18:22:21
1211	419	1	3	2	05:33:44
1212	419	1	1	2	05:33:44
1213	420	1	9	5	09:11:48
1214	420	1	3	2	07:04:52
1215	420	1	1	2	07:04:52
1216	421	1	7	5	10:05:15
1217	421	1	3	3	10:44:19
1218	421	1	2	3	10:44:19
1219	421	1	8	4	16:26:19
1220	422	1	7	5	12:02:26
1221	423	1	7	5	13:16:35
1222	423	1	3	2	13:25:19
1223	423	1	2	2	13:25:19
1224	423	1	8	4	10:06:05
1225	424	1	7	5	11:58:05
1226	424	1	6	1	18:20:18
1227	425	1	7	5	09:08:48
1228	425	1	2	2	06:17:48
1229	425	1	6	3	14:49:07
1230	426	3	9	5	14:34:05
1231	426	3	3	3	13:28:23
1232	426	3	1	3	13:28:23
1233	426	3	8	4	10:16:15
1234	427	1	9	5	09:50:08
1235	427	1	3	3	06:21:28
1236	427	1	1	3	06:21:28
1237	428	1	7	5	13:14:56
1238	428	4	5	1	16:34:36
1239	429	3	7	5	13:37:55
1240	429	3	8	4	17:19:10
1241	430	1	7	5	11:13:27
1242	431	2	9	5	11:00:51
1243	431	2	3	4	08:18:04
1244	431	2	1	4	08:18:04
1245	431	2	5	4	16:42:30
1246	432	1	9	5	09:54:18
1247	432	1	3	1	11:37:32
1248	432	1	1	1	11:37:32
1249	433	3	7	5	09:33:54
1250	434	4	9	5	09:09:04
1251	434	4	3	1	17:48:46
1252	434	4	1	1	17:48:46
1253	434	4	4	3	13:44:04
1254	435	1	7	5	18:53:24
1255	435	3	3	1	05:04:08
1256	435	3	5	3	14:37:37
1257	436	2	7	5	10:36:56
1258	437	4	7	5	09:07:53
1259	437	4	3	3	10:36:08
1260	437	4	2	3	10:36:08
1261	437	4	6	3	14:31:14
1262	438	2	7	5	12:20:35
1263	439	3	7	5	15:46:32
1264	439	3	3	3	04:36:50
1265	439	3	1	3	04:36:50
1266	439	3	2	3	04:36:50
1267	440	1	7	5	12:35:20
1268	440	1	3	4	09:17:46
1269	440	1	5	3	10:06:31
1270	441	2	9	5	16:51:51
1271	441	2	3	3	10:59:58
1272	441	2	2	3	10:59:58
1273	442	2	7	5	11:04:17
1274	442	2	3	2	13:30:24
1275	442	2	2	2	13:30:24
1276	443	2	9	5	17:23:37
1277	443	4	3	1	08:19:07
1278	443	4	1	1	08:19:07
1279	444	2	7	5	13:51:21
1280	445	2	9	5	09:56:05
1281	445	2	3	1	05:05:07
1282	446	1	9	5	09:53:54
1283	446	4	1	1	10:36:52
1284	447	3	7	5	09:18:17
1285	447	3	3	3	17:47:44
1286	447	3	2	3	17:47:44
1287	448	3	7	5	09:07:24
1288	448	3	3	4	05:24:46
1289	448	3	2	4	05:24:46
1290	448	3	4	4	11:56:35
1291	448	3	5	4	11:56:35
1292	449	2	9	5	09:55:38
1293	449	2	1	2	15:20:33
1294	449	2	2	2	15:20:33
1295	449	2	4	4	12:29:31
1296	450	2	9	5	11:36:03
1297	450	4	3	1	11:31:17
1298	451	3	7	5	09:27:31
1299	451	3	3	1	09:41:19
1300	451	3	1	1	09:41:19
1301	451	3	6	3	16:35:09
1302	452	1	9	5	09:39:21
1303	452	1	3	2	09:48:48
1304	453	2	9	5	13:09:44
1305	453	3	1	1	05:40:50
1306	453	3	4	4	15:43:39
1307	453	3	5	4	15:43:39
1308	454	1	9	5	15:28:03
1309	454	1	3	1	07:39:56
1310	454	1	1	1	07:39:56
1311	454	1	6	3	16:01:57
1312	455	1	7	5	17:50:07
1313	455	1	3	3	05:21:13
1314	455	1	1	3	05:21:13
1315	455	1	2	3	05:21:13
1316	456	1	9	5	13:20:55
1317	456	1	3	2	14:13:54
1318	457	1	9	5	09:01:07
1319	458	3	7	5	09:32:04
1320	458	3	3	4	09:36:40
1321	458	3	2	4	09:36:40
1322	459	2	9	5	14:55:03
1323	459	4	5	1	16:54:18
1324	460	1	7	5	09:07:19
1325	460	1	3	3	14:54:36
1326	461	3	9	5	09:43:16
1327	461	3	4	3	12:51:36
1328	462	1	9	5	09:06:48
1329	462	1	5	3	12:16:41
1330	463	1	7	5	11:30:26
1331	463	1	3	3	10:11:22
1332	463	1	4	4	16:22:11
1333	464	1	9	5	15:18:12
1334	464	1	1	3	08:23:59
1335	464	1	2	3	08:23:59
1336	465	2	7	5	17:45:57
1337	465	4	3	1	13:55:09
1338	465	4	2	1	13:55:09
1339	466	1	9	5	13:22:53
1340	466	1	1	3	15:59:13
1341	467	3	7	5	12:09:49
1342	467	3	3	2	07:14:08
1343	467	3	2	2	07:14:08
1344	467	3	4	3	11:18:15
1345	468	2	7	5	09:15:43
1346	468	3	3	1	06:30:47
1347	468	3	2	1	06:30:47
1348	469	1	9	5	13:32:47
1349	470	3	9	5	09:22:50
1350	470	3	3	2	11:12:37
1351	470	3	1	2	11:12:37
1352	471	2	9	5	13:51:25
1353	472	2	7	5	09:11:31
1354	473	1	7	5	09:46:21
1355	473	3	3	1	11:07:09
1356	474	1	7	5	10:33:22
1357	474	1	3	3	04:47:53
1358	474	1	1	3	04:47:53
1359	474	1	4	4	17:42:34
1360	475	2	9	5	09:25:04
1361	475	4	3	1	07:13:38
1362	475	4	1	1	07:13:38
1363	475	4	4	3	13:13:31
1364	476	1	7	5	09:20:12
1365	477	2	9	5	16:11:40
1366	477	2	3	3	16:34:12
1367	477	2	8	3	18:29:29
1368	478	3	7	5	13:49:04
1369	478	3	2	3	04:12:30
1370	478	3	4	3	17:51:43
1371	478	3	5	3	17:51:43
1372	479	2	9	5	12:12:58
1373	479	2	4	2	14:02:27
1374	479	2	5	2	14:02:27
1375	480	3	9	5	18:55:30
1376	480	3	3	1	04:38:54
1377	480	3	2	1	04:38:54
1378	480	3	8	2	15:10:25
1379	481	2	7	5	09:05:15
1380	482	1	9	5	12:10:02
1381	482	1	3	3	04:03:55
1382	482	1	1	3	04:03:55
1383	482	1	5	2	15:38:13
1384	483	3	9	5	09:31:44
1385	483	3	3	3	04:19:01
1386	484	1	7	5	09:39:41
1387	484	4	3	1	05:23:44
1388	484	4	1	1	05:23:44
1389	484	4	2	1	05:23:44
1390	485	2	9	5	17:38:57
1391	485	2	3	4	15:35:01
1392	485	2	1	4	15:35:01
1393	485	2	4	3	10:43:25
1394	486	1	7	5	13:22:18
1395	486	1	3	3	07:18:44
1396	486	1	2	3	07:18:44
1397	487	1	9	5	09:49:14
1398	487	1	3	4	13:42:08
1399	487	1	1	4	13:42:08
1400	487	1	8	4	09:18:23
1401	488	1	9	5	17:25:23
1402	488	1	3	3	16:43:32
1403	488	1	1	3	16:43:32
1404	489	1	9	5	09:42:29
1405	490	1	7	5	15:24:49
1406	490	1	3	3	07:46:50
1407	490	1	2	3	07:46:50
1408	491	2	7	5	18:11:18
1409	491	2	2	3	16:11:24
1410	492	4	7	5	09:06:05
1411	492	4	3	3	10:45:41
1412	492	4	2	3	10:45:41
1413	492	4	4	4	12:17:15
1414	493	1	9	5	09:50:07
1415	494	1	7	5	16:51:23
1416	494	1	3	2	17:23:12
1417	494	1	1	2	17:23:12
1418	495	4	7	5	15:57:34
1419	495	4	3	1	10:24:10
1420	496	2	9	5	11:48:09
1421	496	2	3	3	10:31:35
1422	496	2	1	3	10:31:35
1423	497	4	9	5	09:27:07
1424	498	1	7	5	09:42:17
1425	499	4	9	5	09:14:01
1426	499	4	3	3	06:28:31
1427	499	4	1	3	06:28:31
1428	499	4	4	4	17:28:40
1429	500	2	9	5	09:44:06
1430	500	4	3	1	03:33:32
1431	500	4	1	1	03:33:32
1432	500	4	6	2	17:02:44
1433	501	1	7	5	16:26:28
1434	501	1	3	2	15:14:31
1435	501	1	2	2	15:14:31
1436	502	2	9	5	14:58:30
1437	502	2	3	2	09:47:16
1438	502	2	1	2	09:47:16
1439	503	1	7	5	09:11:04
1440	503	1	3	3	07:31:29
1441	504	1	9	5	13:36:07
1442	504	1	3	4	16:44:14
1443	504	1	1	4	16:44:14
1444	504	1	5	4	14:22:52
1445	504	1	6	4	14:22:52
1446	505	2	9	5	09:18:33
1447	505	2	8	3	11:08:57
1448	506	2	7	5	09:52:20
1449	506	2	2	3	10:01:02
1450	507	1	7	5	09:44:17
1451	507	1	3	1	10:58:52
1452	507	1	2	1	10:58:52
1453	507	1	4	4	12:38:56
1454	507	1	6	4	12:38:56
1455	508	2	9	5	12:32:35
1456	508	2	3	2	12:51:33
1457	508	2	1	2	12:51:33
1458	508	2	2	2	12:51:33
1459	509	1	7	5	09:03:38
1460	509	1	3	4	08:51:55
1461	509	1	1	4	08:51:55
1462	510	1	7	5	09:32:47
1463	510	1	3	3	10:49:11
1464	510	1	2	3	10:49:11
1465	510	1	4	3	09:26:55
1466	510	1	5	3	09:26:55
1467	510	1	8	3	12:51:54
1468	511	1	9	5	09:52:17
1469	511	1	3	2	06:16:30
1470	511	1	1	2	06:16:30
1471	511	1	4	4	16:55:07
1472	511	1	5	4	16:55:07
1473	512	3	7	5	18:04:45
1474	512	3	3	2	16:50:35
1475	513	2	7	5	16:16:39
1476	513	2	3	1	09:56:01
1477	513	2	2	1	09:56:01
1478	514	2	9	5	18:30:38
1479	514	2	4	4	17:29:49
1480	515	3	9	5	09:40:08
1481	516	3	7	5	09:46:01
1482	516	3	3	3	14:16:47
1483	516	3	2	3	14:16:47
1484	517	1	9	5	09:34:10
1485	517	1	8	3	10:49:11
1486	518	2	7	5	14:11:25
1487	518	2	3	3	05:11:11
1488	519	1	9	5	17:42:48
1489	519	1	4	4	11:33:43
1490	519	1	5	4	11:33:43
1491	520	2	9	5	16:53:36
1492	520	2	3	2	09:30:18
1493	520	2	4	2	13:22:33
1494	520	2	8	3	16:57:14
1495	521	2	9	5	09:54:26
1496	522	4	9	5	09:48:30
1497	522	4	3	3	11:07:35
1498	522	4	1	3	11:07:35
1499	522	4	2	3	11:07:35
1500	523	1	9	5	14:06:10
1501	523	3	3	1	08:09:30
1502	523	3	1	1	08:09:30
1503	524	2	9	5	16:34:01
1504	524	2	1	2	05:09:21
1505	524	2	8	3	14:07:38
1506	525	2	9	5	12:23:35
1507	525	2	3	2	17:32:28
1508	525	2	1	2	17:32:28
1509	526	1	9	5	09:18:18
1510	527	2	9	5	13:12:25
1511	528	2	9	5	17:37:49
1512	528	2	3	2	17:36:00
1513	528	2	1	2	17:36:00
1514	529	3	7	5	11:46:33
1515	529	3	3	3	11:22:28
1516	529	3	1	3	11:22:28
1517	529	3	2	3	11:22:28
1518	530	2	9	5	11:14:53
1519	530	2	3	2	15:49:12
1520	530	2	1	2	15:49:12
1521	531	1	7	5	17:38:40
1522	531	1	3	2	07:20:17
1523	531	1	1	2	07:20:17
1524	531	1	2	2	07:20:17
1525	532	1	7	5	09:58:05
1526	533	1	7	5	15:51:51
1527	533	1	3	3	06:20:57
1528	533	1	2	3	06:20:57
1529	534	3	9	5	13:34:41
1530	534	3	4	1	14:48:45
1531	535	1	9	5	11:46:08
1532	535	1	3	3	07:37:53
1533	535	1	1	3	07:37:53
1534	536	1	9	5	14:11:58
1535	536	1	3	4	04:54:48
1536	536	1	4	2	15:15:44
1537	536	1	6	2	15:15:44
1538	537	1	9	5	09:48:30
1539	538	3	7	5	09:39:25
1540	538	3	3	1	17:49:09
1541	538	3	2	1	17:49:09
1542	539	2	9	5	16:34:04
1543	540	1	7	5	18:12:07
1544	540	1	3	2	04:05:07
1545	540	1	2	2	04:05:07
1546	541	1	7	5	18:44:16
1547	542	4	7	5	12:48:17
1548	542	4	3	3	06:44:29
1549	543	1	7	5	09:05:20
1550	543	4	3	1	08:48:26
1551	543	4	2	1	08:48:26
1552	544	1	7	5	09:36:55
1553	544	1	8	3	11:53:45
1554	545	1	9	5	09:35:01
1555	546	1	7	5	17:41:38
1556	546	3	3	1	17:54:09
1557	546	3	1	1	17:54:09
1558	546	3	2	1	17:54:09
1559	547	2	9	5	09:15:40
1560	547	3	3	1	09:41:50
1561	547	3	1	1	09:41:50
1562	548	3	7	5	15:57:04
1563	548	3	1	1	13:29:38
1564	548	3	2	1	13:29:38
1565	548	3	4	4	11:46:42
1566	548	3	5	4	11:46:42
1567	548	3	6	4	11:46:42
1568	549	1	7	5	09:51:31
1569	549	1	3	3	17:15:01
1570	549	1	8	4	11:35:29
1571	550	1	9	5	16:44:28
1572	550	1	4	2	09:11:54
1573	550	1	8	3	12:19:19
1574	551	1	7	5	16:55:09
1575	551	1	3	3	09:15:09
1576	552	2	9	5	16:40:28
1577	552	2	3	4	18:38:45
1578	552	2	1	4	18:38:45
1579	553	3	9	5	09:26:32
1580	553	3	3	4	05:48:19
1581	553	3	1	4	05:48:19
1582	553	3	2	4	05:48:19
1583	554	1	9	5	13:13:27
1584	555	3	9	5	11:20:20
1585	555	3	3	2	07:42:54
1586	555	3	1	2	07:42:54
1587	555	3	8	3	18:01:11
1588	556	3	9	5	14:58:47
1589	556	3	8	3	17:21:08
1590	557	4	9	5	16:14:54
1591	557	4	4	2	10:03:49
1592	557	4	8	3	13:47:01
1593	558	1	9	5	14:57:05
1594	558	1	3	3	08:54:34
1595	558	1	1	3	08:54:34
1596	558	1	8	4	10:01:52
1597	559	1	9	5	09:03:46
1598	560	3	9	5	09:03:34
1599	560	3	3	2	07:29:15
1600	560	3	1	2	07:29:15
1601	560	3	6	4	15:50:27
1602	561	3	9	5	11:34:57
1603	561	3	1	3	05:07:15
1604	561	3	5	4	10:45:18
1605	561	3	6	4	10:45:18
1606	562	4	9	5	14:11:36
1607	563	1	7	5	17:15:38
1608	564	1	7	5	09:07:26
1609	564	4	3	1	15:53:03
1610	564	4	1	1	15:53:03
1611	564	4	2	1	15:53:03
1612	565	4	7	5	10:44:33
1613	565	4	3	3	05:39:35
1614	565	4	4	1	16:28:55
1615	565	4	6	1	16:28:55
1616	566	1	9	5	10:04:41
1617	566	1	3	3	18:39:52
1618	566	1	1	3	18:39:52
1619	566	1	5	4	12:56:33
1620	567	2	9	5	09:48:52
1621	567	2	3	3	04:24:03
1622	567	2	1	3	04:24:03
1623	568	1	7	5	18:58:12
1624	568	1	3	3	06:47:55
1625	568	1	2	3	06:47:55
1626	568	1	6	3	14:54:57
1627	569	2	7	5	15:58:11
1628	569	2	3	3	05:48:22
1629	569	2	4	4	09:18:02
1630	569	2	6	4	09:18:02
1631	569	2	8	3	14:37:11
1632	570	4	7	5	10:41:11
1633	570	4	3	2	10:43:33
1634	570	4	2	2	10:43:33
1635	571	1	7	5	11:34:11
1636	571	4	3	1	10:48:15
1637	571	4	1	1	10:48:15
1638	571	4	5	2	15:28:14
1639	572	3	9	5	09:13:12
1640	572	3	3	2	09:57:07
1641	572	3	1	2	09:57:07
1642	573	2	9	5	12:43:24
1643	573	2	3	3	04:17:43
1644	573	2	1	3	04:17:43
1645	574	2	9	5	14:40:23
1646	574	2	3	1	03:29:43
1647	574	2	1	1	03:29:43
1648	575	1	9	5	12:02:55
1649	575	1	3	2	13:04:34
1650	575	1	2	2	13:04:34
1651	576	2	7	5	15:14:22
1652	576	2	3	2	11:09:54
1653	577	1	9	5	10:23:36
1654	577	1	3	4	09:34:08
1655	577	1	1	4	09:34:08
1656	578	2	7	5	09:21:36
1657	578	3	3	1	09:17:11
1658	578	3	2	1	09:17:11
1659	579	2	9	5	12:27:06
1660	579	2	3	4	10:15:37
1661	579	2	1	4	10:15:37
1662	579	2	2	4	10:15:37
1663	579	2	5	4	17:56:01
1664	579	2	6	4	17:56:01
1665	580	1	9	5	18:40:46
1666	580	1	3	3	03:31:59
1667	580	1	1	3	03:31:59
1668	580	1	5	4	17:51:04
1669	581	1	9	5	10:48:48
1670	581	1	3	2	18:22:46
1671	581	1	1	2	18:22:46
1672	581	1	5	4	17:26:17
1673	582	2	7	5	09:16:24
1674	582	2	3	1	05:39:18
1675	582	2	2	1	05:39:18
1676	583	2	9	5	16:22:27
1677	584	2	7	5	09:54:09
1678	585	2	7	5	11:12:40
1679	585	2	3	3	06:30:41
1680	585	2	1	3	06:30:41
1681	585	2	2	3	06:30:41
1682	585	2	8	3	14:25:44
1683	586	2	9	5	12:57:32
1684	587	2	7	5	09:10:54
1685	587	2	4	3	15:02:48
1686	588	4	9	5	09:49:58
1687	588	4	3	1	10:19:39
1688	588	4	1	1	10:19:39
1689	588	4	6	3	09:10:47
1690	589	1	9	5	15:21:52
1691	589	1	3	3	17:45:25
1692	589	1	1	3	17:45:25
1693	590	1	9	5	18:47:12
1694	590	1	3	3	06:46:16
1695	590	1	1	3	06:46:16
1696	591	3	9	5	13:46:07
1697	591	3	3	3	17:45:04
1698	592	3	9	5	09:31:26
1699	592	3	3	1	10:34:20
1700	592	3	1	1	10:34:20
1701	592	3	4	4	17:28:35
1702	592	3	6	4	17:28:35
1703	592	3	8	4	13:33:49
1704	593	1	9	5	14:13:58
1705	593	1	3	2	06:42:14
1706	593	1	1	2	06:42:14
1707	593	1	5	3	11:41:30
1708	594	2	9	5	09:49:02
1709	594	2	3	2	07:49:58
1710	594	2	8	4	15:11:55
1711	595	2	9	5	09:51:23
1712	595	2	3	3	06:37:15
1713	595	2	6	2	15:50:22
1714	596	1	9	5	09:53:12
1715	597	1	7	5	13:35:33
1716	597	1	3	3	09:28:45
1717	598	2	7	5	09:08:54
1718	599	3	9	5	09:19:44
1719	599	3	1	3	08:29:47
1720	600	3	9	5	09:24:29
1721	600	3	3	1	04:05:26
1722	600	3	1	1	04:05:26
1723	600	3	2	1	04:05:26
1724	601	1	7	5	09:53:06
1725	601	1	3	3	06:51:40
1726	602	1	9	5	09:28:55
1727	603	2	7	5	16:34:18
1728	603	2	3	2	07:32:37
1729	603	2	2	2	07:32:37
1730	603	3	6	1	15:12:24
1731	604	3	7	5	09:18:46
1732	604	3	3	1	10:37:04
1733	604	3	2	1	10:37:04
1734	604	3	4	3	17:25:16
1735	604	3	5	3	17:25:16
1736	605	1	7	5	15:10:27
1737	605	4	3	1	07:42:41
1738	605	4	1	1	07:42:41
1739	605	4	2	1	07:42:41
1740	606	4	9	5	14:08:43
1741	606	4	3	1	10:46:41
1742	606	4	1	1	10:46:41
1743	606	4	5	2	18:15:07
1744	607	1	9	5	13:10:41
1745	607	1	1	3	05:32:04
1746	607	1	4	3	15:38:24
1747	608	2	9	5	13:35:21
1748	608	2	3	4	12:58:03
1749	608	2	2	4	12:58:03
1750	609	1	9	5	12:01:33
1751	609	1	3	3	11:35:34
1752	609	1	1	3	11:35:34
1753	609	1	5	4	16:37:20
1754	610	1	7	5	12:17:53
1755	610	1	5	2	10:24:36
1756	611	2	7	5	09:33:17
1757	611	2	2	3	04:25:17
1758	612	2	9	5	10:07:07
1759	612	2	3	2	04:09:29
1760	612	2	1	2	04:09:29
1761	612	2	8	3	16:18:57
1762	613	2	7	5	14:55:52
1763	613	2	1	2	05:29:34
1764	613	2	2	2	05:29:34
1765	614	3	9	5	09:08:45
1766	615	1	9	5	09:36:24
1767	615	1	3	3	04:07:42
1768	615	1	1	3	04:07:42
1769	616	3	9	5	09:43:49
1770	616	3	3	3	10:08:16
1771	616	3	2	3	10:08:16
1772	617	1	7	5	09:26:16
1773	617	1	3	2	07:16:41
1774	617	1	2	2	07:16:41
1775	618	2	7	5	14:04:02
1776	618	2	3	3	18:55:58
1777	618	2	2	3	18:55:58
1778	619	1	7	5	15:47:08
1779	619	1	4	3	11:49:01
1780	619	1	5	3	11:49:01
1781	620	1	9	5	16:34:54
1782	620	1	3	3	04:37:12
1783	620	1	1	3	04:37:12
1784	620	1	5	2	16:45:46
1785	621	2	9	5	16:16:02
1786	622	3	9	5	12:42:46
1787	622	3	8	3	16:36:48
1788	623	2	9	5	09:22:23
1789	624	3	9	5	16:45:50
1790	624	3	3	3	10:50:20
1791	624	3	2	3	10:50:20
1792	624	3	4	4	17:28:30
1793	624	3	5	4	17:28:30
1794	624	3	6	4	17:28:30
1795	625	2	7	5	12:13:07
1796	625	2	2	2	06:25:08
1797	626	2	9	5	09:05:14
1798	626	3	3	1	10:12:23
1799	626	3	1	1	10:12:23
1800	626	3	2	1	10:12:23
1801	627	2	9	5	09:49:16
1802	627	2	1	4	16:57:54
1803	627	2	4	2	11:35:27
1804	627	2	5	2	11:35:27
1805	628	1	7	5	09:13:28
1806	628	1	3	3	11:29:25
1807	628	1	2	3	11:29:25
1808	629	2	9	5	09:12:54
1809	629	2	3	3	17:14:15
1810	629	2	1	3	17:14:15
1811	630	4	7	5	18:19:32
1812	630	4	3	3	09:32:19
1813	630	4	2	3	09:32:19
1814	630	4	4	3	11:12:01
1815	630	4	5	3	11:12:01
1816	630	4	6	3	11:12:01
1817	631	1	9	5	13:17:30
1818	631	1	3	3	06:16:43
1819	632	1	9	5	17:36:32
1820	632	1	3	3	07:50:05
1821	632	1	1	3	07:50:05
1822	633	1	9	5	09:36:36
1823	633	4	3	1	12:30:31
1824	633	4	1	1	12:30:31
1825	634	2	9	5	11:22:50
1826	634	3	3	1	12:37:17
1827	634	3	1	1	12:37:17
1828	635	2	9	5	16:37:03
1829	635	2	3	4	17:36:30
1830	635	2	4	2	13:45:43
1831	635	2	5	2	13:45:43
1832	636	3	9	5	15:51:27
1833	636	3	3	1	10:25:43
1834	636	3	1	1	10:25:43
1835	636	3	2	1	10:25:43
1836	636	3	8	4	16:40:56
1837	637	4	7	5	13:39:27
1838	638	2	9	5	15:10:29
1839	639	1	9	5	09:16:44
1840	639	1	1	1	08:50:25
1841	639	1	4	4	16:11:11
1842	640	1	9	5	09:31:19
1843	640	1	3	3	04:45:27
1844	640	1	1	3	04:45:27
1845	641	1	9	5	10:18:35
1846	641	1	3	2	17:25:57
1847	641	1	1	2	17:25:57
1848	642	2	9	5	13:43:28
1849	642	2	3	1	11:33:31
1850	643	2	7	5	14:46:01
1851	643	4	3	1	16:33:00
1852	643	4	1	1	16:33:00
1853	643	4	4	4	13:50:22
1854	643	4	6	4	13:50:22
1855	644	1	9	5	09:35:50
1856	644	1	3	3	07:06:32
1857	644	1	1	3	07:06:32
1858	644	1	4	3	09:41:29
1859	644	1	5	3	09:41:29
1860	645	3	7	5	09:00:17
1861	645	3	8	3	16:52:04
1862	646	4	7	5	09:46:06
1863	646	4	3	3	09:43:35
1864	646	4	2	3	09:43:35
1865	647	1	9	5	16:02:39
1866	647	3	3	1	04:31:41
1867	647	3	1	1	04:31:41
1868	648	1	9	5	13:40:54
1869	649	2	9	5	17:26:27
1870	650	1	9	5	14:45:48
1871	651	2	9	5	09:02:16
1872	651	2	3	2	14:22:36
1873	652	1	7	5	16:24:18
1874	652	1	1	3	10:57:37
1875	652	1	2	3	10:57:37
1876	652	1	4	4	17:49:34
1877	652	1	5	4	17:49:34
1878	652	1	8	3	11:10:48
1879	653	3	7	5	13:39:32
1880	653	3	1	3	09:23:51
1881	653	3	2	3	09:23:51
1882	653	3	8	4	10:48:18
1883	654	1	7	5	15:12:34
1884	655	1	9	5	12:43:04
1885	655	1	3	2	10:32:04
1886	655	1	1	2	10:32:04
1887	656	2	7	5	17:05:23
1888	656	2	6	4	14:54:59
1889	657	1	9	5	11:30:51
1890	657	1	3	3	10:39:46
1891	658	1	9	5	17:35:58
1892	658	1	3	2	10:37:39
1893	659	1	7	5	11:11:57
1894	659	1	3	2	14:21:36
1895	659	1	4	2	10:43:56
1896	659	1	5	2	10:43:56
1897	660	4	9	5	09:57:22
1898	660	4	1	1	12:36:40
1899	661	4	9	5	15:29:56
1900	661	4	3	3	09:33:29
1901	662	4	7	5	17:14:21
1902	662	4	8	3	13:17:18
1903	663	2	7	5	13:17:38
1904	663	2	3	2	08:42:33
1905	663	2	2	2	08:42:33
1906	664	2	7	5	16:49:08
1907	664	2	3	4	08:20:25
1908	664	2	1	4	08:20:25
1909	664	2	2	4	08:20:25
1910	665	3	9	5	09:26:05
1911	665	3	5	3	17:44:43
1912	665	3	6	3	17:44:43
1913	666	1	7	5	12:40:07
1914	666	1	1	3	11:33:44
1915	666	1	2	3	11:33:44
1916	667	1	9	5	16:59:50
1917	667	1	3	2	11:34:38
1918	667	1	1	2	11:34:38
1919	668	3	7	5	09:16:25
1920	668	3	5	4	12:55:43
1921	669	4	7	5	09:13:17
1922	669	4	3	3	15:26:18
1923	669	4	2	3	15:26:18
1924	669	4	5	3	14:31:04
1925	669	4	6	3	14:31:04
1926	669	4	8	2	14:30:58
1927	670	1	7	5	09:35:27
1928	671	1	9	5	09:48:12
1929	671	1	8	3	13:29:28
1930	672	1	9	5	14:50:06
1931	672	1	1	3	09:09:54
1932	673	1	7	5	17:06:08
1933	673	1	3	3	17:08:16
1934	673	1	2	3	17:08:16
1935	673	1	5	4	10:58:22
1936	674	3	9	5	09:27:01
1937	674	3	3	1	09:17:13
1938	674	3	1	1	09:17:13
1939	675	3	9	5	17:03:48
1940	675	3	3	3	08:00:01
1941	675	3	1	3	08:00:01
1942	675	3	5	1	14:53:15
1943	676	1	9	5	12:25:43
1944	677	1	7	5	13:01:35
1945	677	1	4	4	17:43:12
1946	677	1	6	4	17:43:12
1947	678	4	9	5	14:03:28
1948	678	4	8	2	14:01:29
1949	679	3	9	5	09:56:07
1950	679	3	3	3	12:43:07
1951	679	3	1	3	12:43:07
1952	679	3	2	3	12:43:07
1953	679	3	4	1	13:43:47
1954	679	3	5	1	13:43:47
1955	680	1	9	5	09:56:58
1956	680	1	3	2	10:40:35
1957	680	1	2	2	10:40:35
1958	681	2	7	5	17:34:50
1959	681	2	2	3	16:14:34
1960	681	2	4	3	15:21:48
1961	682	1	7	5	17:52:31
1962	682	1	3	3	10:00:27
1963	682	1	2	3	10:00:27
1964	683	2	9	5	09:50:11
1965	683	2	3	3	04:58:56
1966	683	2	1	3	04:58:56
1967	684	1	9	5	14:38:48
1968	684	3	3	1	09:07:39
1969	685	1	7	5	12:01:12
1970	685	1	3	1	09:40:29
1971	685	1	2	1	09:40:29
1972	686	4	7	5	09:55:28
1973	686	4	1	2	17:58:30
1974	686	4	2	2	17:58:30
1975	686	4	8	3	12:27:51
1976	687	1	9	5	12:48:39
1977	687	3	3	1	07:56:39
1978	688	1	9	5	14:42:14
1979	688	1	3	2	04:15:31
1980	688	1	5	4	10:48:44
1981	688	1	6	4	10:48:44
1982	689	1	9	5	09:36:24
1983	689	1	2	2	10:24:28
1984	690	1	7	5	09:29:48
1985	690	1	3	2	09:45:33
1986	691	2	9	5	09:44:27
1987	691	2	3	2	10:44:25
1988	691	2	1	2	10:44:25
1989	691	2	8	2	13:18:12
1990	692	1	7	5	14:21:17
1991	692	1	3	3	14:44:49
1992	693	2	9	5	13:13:52
1993	693	2	1	3	13:05:36
1994	694	1	9	5	14:38:31
1995	695	2	9	5	15:58:51
1996	695	2	3	4	07:23:23
1997	695	2	1	4	07:23:23
1998	696	1	9	5	11:14:41
1999	696	1	3	3	09:20:57
2000	696	1	1	3	09:20:57
2001	697	2	9	5	11:55:04
2002	697	2	3	3	05:28:20
2003	698	1	9	5	09:02:31
2004	698	1	3	3	10:54:25
2005	698	1	1	3	10:54:25
2006	698	1	8	3	12:57:30
2007	699	1	9	5	09:50:51
2008	699	1	3	3	06:28:43
2009	699	1	1	3	06:28:43
2010	700	1	7	5	13:26:10
2011	701	1	7	5	09:28:56
2012	701	1	3	2	17:57:58
2013	701	1	2	2	17:57:58
2014	702	1	7	5	16:24:43
2015	703	2	7	5	11:47:15
2016	703	2	3	3	14:04:29
2017	703	2	2	3	14:04:29
2018	704	1	7	5	10:20:22
2019	704	1	1	2	14:26:49
2020	705	1	9	5	09:12:38
2021	705	1	3	2	12:54:52
2022	706	1	9	5	09:54:07
2023	706	1	1	3	10:04:08
2024	707	1	9	5	16:35:07
2025	707	1	3	3	11:19:05
2026	707	1	1	3	11:19:05
2027	707	1	4	2	11:11:07
2028	707	1	6	2	11:11:07
2029	708	1	7	5	09:18:32
2030	709	1	9	5	11:23:32
2031	709	4	3	1	03:30:02
2032	709	4	1	1	03:30:02
2033	710	1	9	5	15:53:52
2034	710	1	3	3	06:36:48
2035	711	2	9	5	09:10:32
2036	712	3	9	5	17:49:34
2037	712	3	5	3	17:53:34
2038	713	2	9	5	11:37:12
2039	714	1	9	5	14:41:39
2040	714	1	1	4	17:18:12
2041	715	1	9	5	09:49:36
2042	715	1	1	3	10:04:17
2043	715	1	2	3	10:04:17
2044	716	2	9	5	09:18:18
2045	716	2	1	3	11:31:40
2046	717	3	9	5	09:36:21
2047	717	3	3	3	07:26:45
2048	717	3	6	4	15:12:14
2049	717	3	8	3	09:33:23
2050	718	2	9	5	14:47:43
2051	718	2	3	2	13:37:34
2052	718	2	1	2	13:37:34
2053	719	1	9	5	09:41:06
2054	720	1	9	5	09:57:26
2055	720	1	4	3	12:50:45
2056	721	1	9	5	09:09:05
2057	721	1	3	3	09:14:47
2058	721	1	1	3	09:14:47
2059	721	1	4	4	18:47:29
2060	721	1	6	4	18:47:29
2061	722	1	9	5	14:53:02
2062	723	2	7	5	09:25:10
2063	723	2	3	4	10:24:38
2064	723	2	1	4	10:24:38
2065	723	2	2	4	10:24:38
2066	724	1	9	5	09:53:01
2067	724	1	3	4	15:01:02
2068	724	1	8	2	12:51:58
2069	725	4	7	5	12:29:47
2070	725	4	3	3	09:33:31
2071	725	4	2	3	09:33:31
2072	725	4	5	4	15:26:09
2073	726	1	9	5	09:52:36
2074	727	1	9	5	09:47:48
2075	727	1	4	4	11:01:12
2076	728	4	9	5	09:25:32
2077	728	4	3	1	06:44:05
2078	728	4	6	4	12:48:03
2079	729	1	7	5	13:50:37
2080	730	2	9	5	09:27:19
2081	730	2	3	3	11:32:10
2082	730	4	4	1	15:14:33
2083	730	4	6	1	15:14:33
2084	731	1	7	5	17:56:52
2085	731	1	4	4	13:49:27
2086	732	4	7	5	14:11:54
2087	732	4	3	3	06:39:25
2088	732	4	2	3	06:39:25
2089	732	4	4	4	17:01:43
2090	732	4	6	4	17:01:43
2091	733	4	9	5	12:08:03
2092	733	4	1	2	08:58:43
2093	734	4	7	5	09:12:12
2094	734	4	3	3	16:20:19
2095	735	1	9	5	11:50:16
2096	735	1	3	3	07:06:56
2097	735	1	1	3	07:06:56
2098	735	1	2	3	07:06:56
2099	736	1	7	5	09:13:55
2100	736	4	3	1	11:49:04
2101	737	1	7	5	09:46:53
2102	737	1	3	2	09:06:52
2103	737	1	2	2	09:06:52
2104	738	1	9	5	15:50:26
2105	738	1	3	3	16:33:44
2106	738	1	1	3	16:33:44
2107	738	1	8	2	14:47:41
2108	739	1	9	5	14:21:37
2109	739	3	1	1	14:03:07
2110	739	3	8	4	09:11:35
2111	740	1	9	5	13:29:20
2112	740	1	3	2	04:20:05
2113	741	2	9	5	13:26:17
2114	742	1	9	5	13:08:15
2115	742	1	3	3	05:59:19
2116	742	1	1	3	05:59:19
2117	743	2	7	5	09:27:25
2118	743	2	3	3	14:59:02
2119	743	2	4	4	11:17:27
2120	743	2	6	4	11:17:27
2121	744	1	7	5	09:51:30
2122	745	2	9	5	13:47:01
2123	746	1	7	5	16:30:35
2124	746	1	3	2	08:59:00
2125	746	1	1	2	08:59:00
2126	747	4	9	5	16:48:16
2127	747	4	1	4	10:01:32
2128	748	2	9	5	09:03:37
2129	748	2	3	4	17:17:47
2130	748	2	1	4	17:17:47
2131	748	2	6	4	14:10:22
2132	749	1	7	5	15:58:08
2133	749	1	3	4	15:43:34
2134	749	1	4	4	10:30:46
2135	749	1	5	4	10:30:46
2136	749	1	6	4	10:30:46
2137	750	4	7	5	09:03:03
2138	750	4	3	4	12:44:13
2139	750	4	4	4	12:53:05
2140	750	4	5	4	12:53:05
2141	750	4	6	4	12:53:05
2142	751	1	7	5	09:50:16
2143	751	1	1	2	09:53:34
2144	751	1	4	2	15:01:37
2145	752	3	7	5	14:58:41
2146	752	3	2	1	16:04:36
2147	753	1	7	5	11:12:38
2148	753	1	3	4	07:21:03
2149	753	1	1	4	07:21:03
2150	753	1	2	4	07:21:03
2151	754	1	7	5	13:31:32
2152	755	2	9	5	09:15:52
2153	755	2	3	2	11:17:46
2154	755	2	2	2	11:17:46
2155	755	2	5	3	16:43:17
2156	756	2	9	5	09:41:37
2157	756	2	3	2	07:58:36
2158	756	2	4	4	13:35:05
2159	757	2	7	5	11:43:02
2160	758	1	7	5	10:56:23
2161	758	1	3	2	08:26:51
2162	758	1	2	2	08:26:51
2163	758	1	8	3	10:23:48
2164	759	3	9	5	12:53:17
2165	759	3	3	4	11:15:58
2166	759	3	1	4	11:15:58
2167	759	3	8	4	12:45:32
2168	760	1	9	5	09:51:16
2169	760	1	4	4	17:31:31
2170	760	1	6	4	17:31:31
2171	761	1	7	5	09:22:22
2172	761	3	3	1	09:20:20
2173	761	3	2	1	09:20:20
2174	761	3	8	3	13:17:36
2175	762	2	9	5	09:02:10
2176	762	2	3	3	03:13:44
2177	762	2	2	3	03:13:44
2178	763	2	7	5	09:00:26
2179	763	2	3	3	09:35:48
2180	763	2	2	3	09:35:48
2181	764	1	7	5	09:58:15
2182	765	1	9	5	16:35:49
2183	765	1	1	4	08:42:57
2184	766	3	7	5	09:31:25
2185	766	3	3	3	11:29:29
2186	766	3	2	3	11:29:29
2187	767	2	9	5	16:46:11
2188	768	1	9	5	09:39:41
2189	768	1	5	3	11:14:07
2190	769	2	9	5	11:38:56
2191	769	2	3	2	10:54:03
2192	769	2	1	2	10:54:03
2193	769	2	5	3	15:42:11
2194	770	2	7	5	16:19:38
2195	770	2	3	3	15:55:57
2196	770	2	1	3	15:55:57
2197	770	2	2	3	15:55:57
2198	770	3	5	1	10:35:37
2199	771	3	9	5	10:57:05
2200	771	3	3	3	05:58:52
2201	771	3	6	4	16:30:23
2202	772	2	7	5	14:27:44
2203	772	2	8	3	10:21:10
2204	773	1	7	5	11:07:24
2205	773	3	4	1	13:08:00
2206	773	3	5	1	13:08:00
2207	774	1	7	5	14:18:55
2208	774	1	8	4	15:12:35
2209	775	2	7	5	13:17:18
2210	775	3	1	1	12:41:49
2211	775	3	2	1	12:41:49
2212	775	3	8	3	11:40:50
2213	776	1	9	5	17:32:54
2214	776	1	1	3	13:15:12
2215	777	4	7	5	10:17:45
2216	777	4	3	1	17:48:16
2217	777	4	1	1	17:48:16
2218	777	4	4	4	17:52:19
2219	777	4	5	4	17:52:19
2220	778	2	9	5	11:38:09
2221	778	2	8	3	15:32:36
2222	779	1	7	5	09:11:31
2223	779	1	3	3	16:32:20
2224	779	1	1	3	16:32:20
2225	779	1	2	3	16:32:20
2226	780	1	7	5	15:52:34
2227	780	1	2	4	18:53:49
2228	781	2	7	5	11:22:00
2229	781	3	3	1	15:26:55
2230	781	3	2	1	15:26:55
2231	782	2	7	5	09:53:39
2232	783	3	7	5	13:51:39
2233	783	3	3	2	17:36:52
2234	783	3	1	2	17:36:52
2235	783	3	2	2	17:36:52
2236	784	2	9	5	11:49:19
2237	785	1	7	5	15:39:08
2238	785	1	3	3	13:20:39
2239	786	3	7	5	15:54:04
2240	786	3	3	3	14:10:01
2241	786	3	2	3	14:10:01
2242	787	1	7	5	09:41:40
2243	787	1	3	3	14:35:53
2244	787	1	5	3	09:55:31
2245	788	3	9	5	09:12:00
2246	788	3	3	2	08:19:58
2247	788	3	1	2	08:19:58
2248	788	3	8	4	17:11:40
2249	789	2	9	5	18:23:22
2250	789	2	3	1	04:53:00
2251	789	2	1	1	04:53:00
2252	790	2	9	5	09:04:12
2253	790	2	3	3	10:27:23
2254	791	2	9	5	14:27:25
2255	791	2	3	3	05:41:39
2256	791	2	6	3	18:27:38
2257	792	2	9	5	15:19:50
2258	792	2	3	4	05:28:59
2259	792	2	1	4	05:28:59
2260	792	2	4	3	18:39:12
2261	792	2	6	3	18:39:12
2262	793	2	9	5	12:45:34
2263	793	2	3	2	12:44:52
2264	793	2	1	2	12:44:52
2265	793	2	2	2	12:44:52
2266	794	1	7	5	11:05:38
2267	794	3	3	1	15:47:40
2268	794	3	2	1	15:47:40
2269	794	3	4	4	15:19:35
2270	794	3	6	4	15:19:35
2271	795	2	7	5	09:57:08
2272	795	2	3	2	03:56:27
2273	795	2	2	2	03:56:27
2274	796	2	9	5	17:27:42
2275	796	3	3	1	17:02:30
2276	796	3	5	3	13:39:57
2277	797	1	9	5	11:51:54
2278	797	1	3	3	09:19:35
2279	797	1	1	3	09:19:35
2280	798	1	7	5	09:24:31
2281	798	1	3	3	08:08:22
2282	798	1	2	3	08:08:22
2283	798	4	4	1	10:48:20
2284	799	2	7	5	17:07:55
2285	799	2	3	4	14:47:11
2286	799	2	1	4	14:47:11
2287	800	1	9	5	09:24:54
2288	800	1	3	1	06:08:50
2289	800	1	1	1	06:08:50
2290	801	1	7	5	14:11:25
2291	801	1	2	3	16:31:04
2292	801	1	4	4	13:03:19
2293	801	1	5	4	13:03:19
2294	801	1	6	4	13:03:19
2295	802	3	7	5	18:31:31
2296	802	3	3	3	10:48:05
2297	802	3	2	3	10:48:05
2298	803	1	9	5	13:42:54
2299	804	1	7	5	17:43:40
2300	805	3	7	5	12:09:02
2301	805	3	3	2	07:47:33
2302	805	3	4	4	17:24:27
2303	805	3	6	4	17:24:27
2304	806	1	7	5	12:02:01
2305	806	1	4	4	10:09:28
2306	806	1	6	4	10:09:28
2307	807	1	7	5	16:45:18
2308	807	1	3	3	04:27:24
2309	807	1	1	3	04:27:24
2310	807	1	2	3	04:27:24
2311	808	2	7	5	12:17:45
2312	808	2	3	3	05:09:22
2313	808	2	1	3	05:09:22
2314	808	2	2	3	05:09:22
2315	808	2	4	3	17:49:15
2316	808	2	5	3	17:49:15
2317	809	2	9	5	09:02:18
2318	809	2	3	2	18:05:43
2319	809	2	1	2	18:05:43
2320	809	2	4	3	12:29:02
2321	810	1	7	5	09:12:36
2322	811	4	9	5	14:44:56
2323	811	4	3	4	16:48:06
2324	811	4	1	4	16:48:06
2325	811	4	2	4	16:48:06
2326	811	4	8	4	15:29:27
2327	812	1	9	5	15:45:14
2328	812	1	3	2	10:48:18
2329	812	1	1	2	10:48:18
2330	813	1	9	5	12:11:31
2331	813	1	3	2	11:56:20
2332	814	3	9	5	09:22:51
2333	814	3	3	1	16:51:52
2334	814	3	1	1	16:51:52
2335	814	3	2	1	16:51:52
2336	814	3	4	2	12:48:13
2337	815	2	9	5	09:12:52
2338	815	2	1	1	11:28:32
2339	816	3	7	5	09:28:42
2340	816	3	3	3	13:41:16
2341	816	3	2	3	13:41:16
2342	816	3	4	2	17:47:25
2343	817	1	7	5	14:18:02
2344	817	1	3	3	06:02:05
2345	818	1	9	5	16:48:09
2346	818	1	3	3	11:23:00
2347	818	1	1	3	11:23:00
2348	819	1	7	5	09:11:49
2349	819	1	3	3	15:22:30
2350	819	1	2	3	15:22:30
2351	820	3	9	5	13:30:35
2352	820	3	1	3	10:21:11
2353	820	3	8	3	14:39:34
2354	821	1	9	5	17:01:11
2355	821	3	3	1	09:37:20
2356	822	4	9	5	09:44:12
2357	822	4	3	1	05:18:11
2358	822	4	5	4	12:57:29
2359	822	4	6	4	12:57:29
2360	823	1	9	5	09:18:57
2361	824	1	9	5	15:24:08
2362	825	1	9	5	09:18:38
2363	826	2	9	5	14:56:13
2364	826	2	3	2	09:20:07
2365	827	1	7	5	17:39:29
2366	827	1	3	4	13:16:44
2367	827	1	2	4	13:16:44
2368	827	1	5	4	12:20:22
2369	827	1	6	4	12:20:22
2370	828	3	9	5	15:03:06
2371	828	3	3	3	05:58:39
2372	828	3	4	3	11:20:11
2373	828	3	8	4	17:28:56
2374	829	1	9	5	18:40:30
2375	829	1	3	2	15:03:56
2376	830	1	7	5	11:46:44
2377	831	4	9	5	09:19:53
2378	831	4	3	3	08:25:36
2379	831	4	1	3	08:25:36
2380	831	4	5	4	17:59:30
2381	831	4	6	4	17:59:30
2382	831	4	8	3	11:16:20
2383	832	1	9	5	09:20:33
2384	833	2	7	5	09:01:54
2385	834	1	9	5	16:44:43
2386	834	1	1	3	06:04:45
2387	835	2	9	5	17:30:11
2388	835	2	4	4	13:25:26
2389	836	1	9	5	15:44:07
2390	837	3	9	5	12:52:34
2391	837	3	3	1	15:56:17
2392	837	3	1	1	15:56:17
2393	837	3	2	1	15:56:17
2394	837	3	4	4	13:11:48
2395	838	2	9	5	09:39:34
2396	838	3	3	1	14:37:56
2397	838	3	1	1	14:37:56
2398	839	3	7	5	09:17:31
2399	839	3	3	4	03:36:46
2400	840	2	9	5	10:53:46
2401	840	2	3	3	04:34:37
2402	840	2	1	3	04:34:37
2403	840	2	4	3	16:10:11
2404	841	1	9	5	16:57:12
2405	841	1	3	2	14:30:46
2406	842	1	9	5	09:41:20
2407	842	1	3	1	04:45:27
2408	842	1	1	1	04:45:27
2409	842	1	5	3	12:38:29
2410	843	2	9	5	14:40:45
2411	843	2	5	3	17:22:20
2412	844	2	7	5	09:56:45
2413	844	3	3	1	06:25:05
2414	844	3	2	1	06:25:05
2415	844	3	6	4	14:58:32
2416	845	1	9	5	09:43:53
2417	845	1	3	3	12:53:12
2418	845	1	1	3	12:53:12
2419	845	1	4	4	16:02:39
2420	846	2	9	5	12:25:53
2421	846	3	3	1	14:58:34
2422	847	1	9	5	14:25:02
2423	847	1	4	3	16:21:36
2424	847	1	5	3	16:21:36
2425	847	1	6	3	16:21:36
2426	848	1	7	5	14:50:30
2427	848	4	3	1	15:10:05
2428	848	4	1	1	15:10:05
2429	848	4	2	1	15:10:05
2430	849	4	7	5	15:08:36
2431	849	4	3	4	10:57:50
2432	849	4	5	3	11:26:42
2433	849	4	6	3	11:26:42
2434	850	1	9	5	09:11:55
2435	851	1	9	5	17:35:32
2436	851	1	3	3	17:23:14
2437	851	1	1	3	17:23:14
2438	851	1	5	3	13:42:38
2439	852	1	7	5	14:22:24
2440	852	1	3	3	06:24:23
2441	852	1	2	3	06:24:23
2442	852	1	8	4	11:11:22
2443	853	3	9	5	09:40:09
2444	853	3	5	3	14:12:54
2445	854	3	9	5	09:19:13
2446	854	3	3	2	11:15:44
2447	854	3	1	2	11:15:44
2448	854	3	2	2	11:15:44
2449	855	1	7	5	09:18:33
2450	855	1	3	2	04:01:55
2451	855	1	2	2	04:01:55
2452	856	1	9	5	09:07:27
2453	856	1	3	1	08:48:52
2454	856	1	1	1	08:48:52
2455	857	3	7	5	12:20:56
2456	857	3	3	4	10:55:23
2457	857	3	2	4	10:55:23
2458	857	3	6	3	15:39:49
2459	858	2	7	5	15:24:40
2460	858	2	3	2	11:07:47
2461	858	2	2	2	11:07:47
2462	859	3	9	5	16:18:35
2463	859	3	3	3	11:01:11
2464	859	3	1	3	11:01:11
2465	860	3	7	5	11:40:53
2466	860	3	3	2	08:54:19
2467	860	3	2	2	08:54:19
2468	860	3	4	4	11:28:15
2469	861	1	7	5	09:15:05
2470	861	1	3	3	08:07:53
2471	861	1	2	3	08:07:53
2472	861	1	4	4	18:55:15
2473	862	2	7	5	12:02:00
2474	862	2	4	2	14:05:40
2475	863	1	7	5	13:12:27
2476	863	3	3	1	17:55:35
2477	863	3	1	1	17:55:35
2478	863	3	2	1	17:55:35
2479	863	3	4	3	10:01:32
2480	863	3	6	3	10:01:32
2481	863	3	8	1	10:37:14
2482	864	1	9	5	14:00:13
2483	864	1	3	2	15:55:06
2484	864	1	1	2	15:55:06
2485	864	1	5	4	12:29:20
2486	865	4	9	5	09:05:10
2487	865	4	3	3	03:52:27
2488	866	2	9	5	11:20:43
2489	866	2	3	2	09:04:34
2490	866	2	1	2	09:04:34
2491	867	3	9	5	18:53:40
2492	867	3	3	1	10:06:34
2493	867	3	4	3	17:45:46
2494	867	3	6	3	17:45:46
2495	868	1	9	5	10:17:04
2496	868	1	3	2	05:02:01
2497	868	1	1	2	05:02:01
2498	869	3	7	5	09:31:22
2499	869	3	3	2	17:57:55
2500	869	3	1	2	17:57:55
2501	869	3	2	2	17:57:55
2502	869	3	8	3	14:08:10
2503	870	4	9	5	15:45:28
2504	870	4	3	3	14:20:30
2505	870	4	2	3	14:20:30
2506	871	1	7	5	09:29:54
2507	871	1	1	2	11:02:02
2508	871	1	2	2	11:02:02
2509	871	1	6	4	15:25:22
2510	872	1	9	5	13:07:23
2511	873	3	7	5	12:12:45
2512	873	3	2	4	13:28:11
2513	874	2	7	5	09:50:00
2514	874	4	2	1	10:07:50
2515	874	4	8	2	14:24:16
2516	875	3	7	5	13:57:06
2517	875	3	3	2	06:42:42
2518	875	3	1	2	06:42:42
2519	876	1	7	5	14:20:28
2520	876	4	3	1	08:21:15
2521	876	4	1	1	08:21:15
2522	876	4	4	4	14:09:21
2523	877	1	9	5	13:41:12
2524	878	4	9	5	15:04:10
2525	878	4	1	2	08:13:30
2526	879	2	9	5	16:15:51
2527	879	2	8	3	10:52:13
2528	880	4	9	5	09:36:36
2529	880	4	3	2	12:34:22
2530	880	4	1	2	12:34:22
2531	881	2	9	5	10:11:07
2532	882	1	9	5	11:18:32
2533	882	1	3	2	11:42:18
2534	882	1	4	4	10:43:43
2535	883	2	9	5	15:40:45
2536	883	2	3	2	16:44:04
2537	883	2	1	2	16:44:04
2538	884	3	9	5	17:36:26
2539	884	3	3	2	11:57:17
2540	884	3	4	4	17:48:06
2541	885	4	9	5	09:55:35
2542	885	4	3	1	06:12:22
2543	885	4	1	1	06:12:22
2544	886	1	9	5	09:46:52
2545	886	1	3	3	15:39:53
2546	886	1	1	3	15:39:53
2547	887	4	9	5	09:38:55
2548	887	4	3	2	10:01:54
2549	887	4	1	2	10:01:54
2550	888	3	9	5	09:26:23
2551	888	3	1	2	03:35:16
2552	889	1	7	5	18:25:54
2553	889	1	3	2	10:06:18
2554	889	1	1	2	10:06:18
2555	889	1	2	2	10:06:18
2556	890	1	7	5	17:54:44
2557	890	1	3	1	09:27:37
2558	890	1	1	1	09:27:37
2559	890	1	2	1	09:27:37
2560	891	2	7	5	09:42:13
2561	891	2	3	3	17:33:10
2562	891	2	1	3	17:33:10
2563	891	2	2	3	17:33:10
2564	892	1	9	5	09:45:58
2565	892	1	3	4	15:53:16
2566	892	1	1	4	15:53:16
2567	893	1	9	5	09:49:31
2568	893	1	3	1	11:05:19
2569	893	1	1	1	11:05:19
2570	894	2	7	5	09:57:05
2571	894	2	3	3	10:44:45
2572	894	2	2	3	10:44:45
2573	894	2	8	2	14:51:52
2574	895	1	7	5	09:32:33
2575	895	3	6	4	16:03:53
2576	896	1	9	5	16:45:33
2577	896	1	1	2	10:50:34
2578	897	1	7	5	12:31:06
2579	898	2	9	5	09:42:38
2580	898	2	3	2	08:10:27
2581	898	2	1	2	08:10:27
2582	898	2	2	2	08:10:27
2583	898	2	4	4	11:20:33
2584	898	2	5	4	11:20:33
2585	898	2	8	1	18:38:15
2586	899	1	7	5	18:06:56
2587	900	2	9	5	17:50:20
2588	900	4	3	1	06:07:48
2589	900	4	1	1	06:07:48
2590	901	2	9	5	10:46:49
2591	902	1	9	5	15:25:07
2592	902	1	5	3	11:44:52
2593	903	1	9	5	09:36:01
2594	903	3	3	1	07:57:42
2595	904	1	9	5	18:03:09
2596	904	4	3	1	18:24:09
2597	904	4	1	1	18:24:09
2598	905	2	9	5	16:17:42
2599	905	2	8	3	10:43:32
2600	906	3	9	5	14:02:03
2601	906	3	1	1	18:33:36
2602	907	1	7	5	10:53:36
2603	907	1	3	3	04:41:16
2604	907	1	2	3	04:41:16
2605	908	3	9	5	09:53:47
2606	908	3	1	1	11:00:05
2607	909	4	9	5	09:28:17
2608	909	4	6	4	12:36:22
2609	909	4	8	4	15:40:10
2610	910	2	7	5	09:51:01
2611	910	3	1	1	10:21:47
2612	910	3	4	4	17:38:14
2613	910	3	5	4	17:38:14
2614	910	3	6	4	17:38:14
2615	911	2	9	5	09:46:26
2616	911	2	2	3	09:09:06
2617	912	1	7	5	11:47:17
2618	912	1	3	3	03:28:12
2619	912	1	4	4	11:45:44
2620	913	1	7	5	14:43:22
2621	914	1	9	5	09:18:58
2622	914	1	3	3	07:56:38
2623	915	1	7	5	10:19:47
2624	915	4	5	1	17:08:34
2625	916	3	7	5	10:33:31
2626	916	3	3	1	17:19:28
2627	916	3	1	1	17:19:28
2628	916	3	2	1	17:19:28
2629	916	3	4	4	10:18:04
2630	916	3	5	4	10:18:04
2631	916	3	8	1	16:26:53
2632	917	1	9	5	11:15:05
2633	917	1	3	2	10:33:47
2634	918	1	9	5	11:08:47
2635	918	1	3	3	17:16:53
2636	919	1	7	5	17:19:23
2637	919	4	3	1	07:37:19
2638	919	4	1	1	07:37:19
2639	920	1	9	5	11:49:44
2640	920	3	3	1	08:09:04
2641	921	3	7	5	11:11:18
2642	921	3	3	1	10:27:20
2643	921	3	4	4	16:11:49
2644	921	3	6	4	16:11:49
2645	922	3	9	5	09:50:47
2646	922	3	1	3	14:00:48
2647	923	2	7	5	09:16:31
2648	923	2	3	2	15:11:25
2649	924	2	9	5	15:13:37
2650	924	2	1	3	10:58:44
2651	925	1	9	5	15:12:56
2652	925	1	3	3	11:06:45
2653	925	1	1	3	11:06:45
2654	925	3	6	1	10:20:23
2655	926	2	9	5	18:12:31
2656	926	3	4	1	13:31:59
2657	927	3	9	5	14:24:51
2658	927	3	3	4	10:40:57
2659	927	3	1	4	10:40:57
2660	927	3	8	3	17:18:19
2661	928	1	9	5	15:14:39
2662	928	1	3	3	10:46:53
2663	928	1	1	3	10:46:53
2664	928	1	8	3	09:55:20
2665	929	2	9	5	17:14:40
2666	930	3	9	5	18:53:53
2667	930	3	3	2	06:53:22
2668	930	3	1	2	06:53:22
2669	931	4	9	5	09:12:38
2670	931	4	3	3	05:24:00
2671	931	4	1	3	05:24:00
2672	932	4	9	5	15:13:25
2673	933	3	9	5	09:29:24
2674	933	3	1	2	05:15:43
2675	934	2	9	5	09:02:20
2676	935	1	7	5	17:52:40
2677	935	1	3	3	18:40:45
2678	935	1	1	3	18:40:45
2679	935	1	2	3	18:40:45
2680	936	2	9	5	17:24:29
2681	936	2	4	3	10:58:15
2682	936	2	6	3	10:58:15
2683	936	2	8	1	09:58:44
2684	937	2	9	5	09:49:14
2685	938	1	9	5	09:36:47
2686	938	1	3	2	09:50:58
2687	939	1	9	5	09:31:31
2688	939	1	1	4	10:58:27
2689	940	1	7	5	09:39:30
2690	940	1	3	3	04:06:55
2691	941	1	7	5	09:47:07
2692	941	1	3	3	15:08:47
2693	941	1	1	3	15:08:47
2694	941	4	4	1	10:55:40
2695	942	1	7	5	09:42:10
2696	942	1	1	4	12:12:19
2697	942	1	2	4	12:12:19
2698	942	1	4	3	15:01:53
2699	942	1	5	3	15:01:53
2700	943	1	9	5	09:20:11
2701	943	1	3	3	17:14:25
2702	943	1	1	3	17:14:25
2703	944	2	7	5	09:21:15
2704	944	2	3	3	15:31:46
2705	944	2	2	3	15:31:46
2706	945	4	9	5	15:44:04
2707	945	4	3	1	03:22:28
2708	945	4	6	2	10:04:28
2709	946	2	9	5	09:52:39
2710	946	2	3	4	09:44:23
2711	946	2	1	4	09:44:23
2712	947	1	9	5	12:46:20
2713	948	2	9	5	12:00:34
2714	949	1	7	5	09:29:21
2715	949	1	3	2	08:46:02
2716	949	1	4	3	17:22:30
2717	950	2	9	5	09:06:52
2718	950	2	3	3	16:51:06
2719	950	2	1	3	16:51:06
2720	950	2	2	3	16:51:06
2721	950	2	8	3	17:37:58
2722	951	3	7	5	09:22:49
2723	951	3	5	4	10:28:06
2724	951	3	6	4	10:28:06
2725	952	3	9	5	15:51:43
2726	953	1	9	5	09:39:53
2727	953	4	3	1	05:05:26
2728	954	1	9	5	09:46:57
2729	954	1	5	2	17:57:26
2730	955	3	9	5	11:19:08
2731	955	3	3	3	17:03:01
2732	956	2	7	5	09:03:05
2733	956	2	3	4	10:04:15
2734	956	2	1	4	10:04:15
2735	956	2	2	4	10:04:15
2736	957	1	9	5	14:29:12
2737	957	3	3	1	17:44:06
2738	957	3	1	1	17:44:06
2739	958	3	7	5	14:39:25
2740	958	3	2	1	04:02:11
2741	958	3	4	3	18:39:53
2742	958	3	5	3	18:39:53
2743	959	4	9	5	11:19:03
2744	959	4	3	3	09:58:32
2745	959	4	1	3	09:58:32
2746	960	1	9	5	15:25:57
2747	960	1	1	3	07:22:15
2748	961	3	7	5	11:18:53
2749	961	3	3	3	06:54:01
2750	962	2	7	5	09:06:57
2751	962	2	3	4	11:03:28
2752	962	2	1	4	11:03:28
2753	962	2	2	4	11:03:28
2754	962	2	5	4	12:25:46
2755	963	2	9	5	14:04:46
2756	963	2	3	3	05:38:06
2757	964	2	9	5	17:16:16
2758	964	3	1	1	16:54:55
2759	964	3	2	1	16:54:55
2760	965	2	9	5	15:46:33
2761	965	2	3	4	16:28:37
2762	965	2	1	4	16:28:37
2763	965	2	5	4	16:53:43
2764	966	2	9	5	11:08:21
2765	966	2	3	2	09:53:40
2766	966	2	1	2	09:53:40
2767	967	1	7	5	12:17:18
2768	967	1	5	4	16:30:58
2769	968	3	9	5	10:43:47
2770	968	3	3	3	06:36:26
2771	968	3	2	3	06:36:26
2772	968	3	5	1	11:17:06
2773	969	1	9	5	09:09:49
2774	969	1	3	2	07:20:39
2775	969	1	2	2	07:20:39
2776	970	3	9	5	09:48:08
2777	970	3	3	3	06:51:51
2778	971	1	9	5	09:17:26
2779	971	4	1	1	06:36:02
2780	971	4	4	4	12:13:55
2781	972	2	7	5	10:55:26
2782	972	2	3	2	17:01:10
2783	972	2	1	2	17:01:10
2784	972	2	2	2	17:01:10
2785	973	1	7	5	11:55:20
2786	973	3	3	1	06:39:35
2787	973	3	1	1	06:39:35
2788	973	3	2	1	06:39:35
2789	974	2	9	5	17:21:06
2790	975	1	7	5	15:35:35
2791	975	3	3	1	04:15:02
2792	975	3	2	1	04:15:02
2793	975	3	6	3	11:16:17
2794	976	1	9	5	12:07:28
2795	976	1	5	2	13:40:08
2796	976	1	6	2	13:40:08
2797	977	4	9	5	16:21:51
2798	978	2	9	5	10:18:43
2799	978	4	3	1	13:02:03
2800	978	4	1	1	13:02:03
2801	978	4	2	1	13:02:03
2802	979	2	9	5	15:38:20
2803	979	2	3	1	10:25:22
2804	979	2	1	1	10:25:22
2805	979	2	4	4	12:31:33
2806	979	2	5	4	12:31:33
2807	980	1	7	5	16:15:18
2808	980	1	3	3	14:37:05
2809	980	1	2	3	14:37:05
2810	980	1	6	4	16:55:57
2811	981	4	9	5	13:06:48
2812	982	1	7	5	09:22:36
2813	983	2	9	5	13:04:36
2814	983	2	3	4	16:25:32
2815	983	2	1	4	16:25:32
2816	983	2	5	3	10:10:01
2817	984	3	9	5	09:28:41
2818	984	3	3	3	07:28:57
2819	984	3	1	3	07:28:57
2820	984	3	5	2	14:39:23
2821	984	3	6	2	14:39:23
2822	985	3	9	5	14:48:48
2823	985	3	8	3	10:09:05
2824	986	3	7	5	13:08:26
2825	986	3	3	3	10:14:40
2826	986	3	2	3	10:14:40
2827	987	1	7	5	10:19:28
2828	987	1	3	3	11:21:52
2829	988	1	9	5	11:07:32
2830	988	1	4	2	14:37:05
2831	988	1	6	2	14:37:05
2832	988	1	8	3	10:02:24
2833	989	3	9	5	09:33:33
2834	989	3	3	4	17:35:00
2835	989	3	1	4	17:35:00
2836	989	3	2	4	17:35:00
2837	989	3	8	1	13:58:31
2838	990	1	9	5	10:47:22
2839	990	1	3	3	17:58:16
2840	990	1	1	3	17:58:16
2841	990	4	4	1	18:45:31
2842	991	1	9	5	16:07:14
2843	992	2	7	5	13:54:09
2844	992	2	3	4	11:23:47
2845	993	2	7	5	11:38:31
2846	993	2	3	2	10:04:08
2847	993	2	2	2	10:04:08
2848	994	1	9	5	12:18:42
2849	994	1	3	2	08:17:28
2850	994	1	1	2	08:17:28
2851	994	1	8	3	15:48:28
2852	995	3	9	5	13:04:21
2853	995	3	3	3	11:08:04
2854	995	3	1	3	11:08:04
2855	995	3	4	4	09:36:23
2856	995	3	5	4	09:36:23
2857	996	3	7	5	09:54:19
2858	996	3	3	1	15:22:38
2859	996	3	2	1	15:22:38
2860	996	3	4	4	13:20:45
2861	996	3	5	4	13:20:45
2862	996	3	6	4	13:20:45
2863	997	3	7	5	12:52:17
2864	997	3	3	2	04:50:34
2865	997	3	2	2	04:50:34
2866	998	1	9	5	17:30:43
2867	998	1	3	3	07:37:23
2868	998	1	1	3	07:37:23
2869	999	2	9	5	11:29:32
2870	1000	3	7	5	09:14:33
2871	1000	3	3	3	11:01:15
2872	1000	3	2	3	11:01:15
2873	1000	3	8	3	13:54:33
2874	1001	1	9	5	09:39:57
2875	1001	3	3	1	09:40:58
2876	1001	3	1	1	09:40:58
2877	1002	1	7	5	15:08:51
2878	1002	1	3	3	05:01:35
2879	1002	1	2	3	05:01:35
2880	1003	1	9	5	13:49:18
2881	1003	1	3	2	18:46:00
2882	1003	1	1	2	18:46:00
2883	1003	1	8	1	15:07:08
2884	1004	3	7	5	09:39:48
2885	1004	3	3	3	10:15:37
2886	1004	3	2	3	10:15:37
2887	1005	1	9	5	15:57:06
2888	1005	3	3	1	10:36:28
2889	1005	3	1	1	10:36:28
2890	1005	3	2	1	10:36:28
2891	1005	3	5	2	14:12:37
2892	1006	3	9	5	12:28:44
2893	1006	3	1	3	04:37:08
2894	1006	3	6	3	11:42:11
2895	1007	1	7	5	10:25:15
2896	1007	1	3	3	14:26:25
2897	1007	1	2	3	14:26:25
2898	1007	1	4	3	17:23:21
2899	1007	1	6	3	17:23:21
2900	1008	1	9	5	09:46:31
2901	1009	1	7	5	13:58:39
2902	1010	1	7	5	11:44:39
2903	1010	1	3	2	10:22:07
2904	1011	4	9	5	16:05:31
2905	1011	4	1	2	07:20:27
2906	1012	3	9	5	09:57:17
2907	1012	3	3	1	06:42:28
2908	1013	1	7	5	09:28:00
2909	1013	1	3	3	09:13:40
2910	1013	1	2	3	09:13:40
2911	1014	3	7	5	16:23:22
2912	1014	3	3	4	10:19:19
2913	1015	3	9	5	09:57:23
2914	1015	3	1	4	08:37:55
2915	1016	2	9	5	13:53:04
2916	1016	2	3	2	04:14:09
2917	1016	2	1	2	04:14:09
2918	1017	4	7	5	09:33:04
2919	1018	4	7	5	09:58:35
2920	1018	4	3	2	05:17:25
2921	1018	4	1	2	05:17:25
2922	1018	4	2	2	05:17:25
2923	1019	3	9	5	17:53:40
2924	1019	3	3	1	08:29:29
2925	1019	3	1	1	08:29:29
2926	1019	3	5	3	15:17:30
2927	1020	1	9	5	18:44:30
2928	1020	1	2	3	04:13:51
2929	1020	1	5	4	11:28:55
2930	1021	2	9	5	09:26:08
2931	1021	2	4	4	10:39:32
2932	1021	2	5	4	10:39:32
2933	1021	2	6	4	10:39:32
2934	1022	2	9	5	10:05:19
2935	1022	3	4	1	15:29:02
2936	1023	2	9	5	16:18:07
2937	1024	2	9	5	09:38:24
2938	1024	4	3	1	15:08:36
2939	1024	4	1	1	15:08:36
2940	1024	4	8	3	15:36:33
2941	1025	2	9	5	11:57:00
2942	1025	2	1	2	06:26:18
2943	1025	2	6	3	11:20:08
2944	1026	4	9	5	17:30:32
2945	1026	4	3	1	11:05:57
2946	1026	4	1	1	11:05:57
2947	1027	1	7	5	13:50:57
2948	1027	1	3	2	15:32:38
2949	1027	1	1	2	15:32:38
2950	1028	3	9	5	09:08:51
2951	1028	3	3	2	10:15:48
2952	1028	3	6	3	11:18:42
2953	1029	1	7	5	09:47:01
2954	1029	1	3	2	10:06:07
2955	1029	1	1	2	10:06:07
2956	1029	1	2	2	10:06:07
2957	1029	1	8	3	17:43:08
2958	1030	3	9	5	14:32:21
2959	1030	3	1	2	07:35:07
2960	1030	3	5	2	16:25:32
2961	1030	3	6	2	16:25:32
2962	1031	1	7	5	09:40:58
2963	1031	4	3	1	10:05:49
2964	1031	4	2	1	10:05:49
2965	1031	4	5	3	12:55:45
2966	1032	2	9	5	09:24:40
2967	1032	2	3	3	16:24:45
2968	1032	2	1	3	16:24:45
2969	1033	1	7	5	16:37:50
2970	1033	1	3	2	05:06:53
2971	1033	1	2	2	05:06:53
2972	1034	2	9	5	17:01:05
2973	1035	2	9	5	14:49:27
2974	1035	2	3	3	04:18:40
2975	1035	2	1	3	04:18:40
2976	1036	2	7	5	16:42:01
2977	1036	2	3	2	04:09:15
2978	1037	1	9	5	17:20:49
2979	1037	1	1	2	15:04:09
2980	1037	3	5	1	11:33:58
2981	1037	3	6	1	11:33:58
2982	1038	2	9	5	17:23:05
2983	1038	2	3	3	14:09:44
2984	1038	2	1	3	14:09:44
2985	1038	2	4	3	09:30:06
2986	1038	2	5	3	09:30:06
2987	1039	4	9	5	10:23:49
2988	1039	4	3	3	06:48:36
2989	1039	4	2	3	06:48:36
2990	1039	4	4	4	18:45:53
2991	1040	3	9	5	09:13:42
2992	1040	3	3	3	16:09:43
2993	1040	3	8	1	17:03:45
2994	1041	3	9	5	09:08:36
2995	1041	3	5	3	14:25:05
2996	1041	3	6	3	14:25:05
2997	1041	3	8	2	14:32:58
2998	1042	4	9	5	11:46:39
2999	1042	4	1	2	15:14:39
3000	1043	1	7	5	13:53:16
3001	1043	1	3	2	12:14:32
3002	1043	1	1	2	12:14:32
3003	1044	3	7	5	11:09:58
3004	1044	3	3	2	10:00:02
3005	1044	3	1	2	10:00:02
3006	1044	3	2	2	10:00:02
3007	1045	3	7	5	15:36:30
3008	1045	3	3	3	11:25:45
3009	1045	3	1	3	11:25:45
3010	1045	3	2	3	11:25:45
3011	1045	3	4	3	12:04:55
3012	1045	3	6	3	12:04:55
3013	1046	1	9	5	12:22:25
3014	1046	1	3	3	05:59:54
3015	1046	1	8	2	10:04:49
3016	1047	3	9	5	09:24:19
3017	1047	3	3	3	09:54:44
3018	1048	1	7	5	09:53:27
3019	1049	1	7	5	17:48:43
3020	1049	1	3	2	13:14:03
3021	1049	1	8	2	10:36:09
3022	1050	2	9	5	15:30:52
3023	1050	2	3	3	16:01:16
3024	1050	2	1	3	16:01:16
3025	1051	1	7	5	09:16:15
3026	1052	4	9	5	18:06:31
3027	1052	4	3	3	10:49:05
3028	1052	4	2	3	10:49:05
3029	1053	1	9	5	17:51:22
3030	1054	2	7	5	12:17:27
3031	1054	2	3	3	12:15:56
3032	1054	2	2	3	12:15:56
3033	1054	2	4	4	15:50:37
3034	1055	3	7	5	12:15:11
3035	1055	3	2	1	12:45:39
3036	1055	3	5	3	11:03:01
3037	1055	3	6	3	11:03:01
3038	1055	3	8	3	15:56:13
3039	1056	2	7	5	09:08:16
3040	1056	2	3	2	09:05:54
3041	1056	2	1	2	09:05:54
3042	1056	2	2	2	09:05:54
3043	1057	2	7	5	11:50:48
3044	1057	3	3	1	09:41:52
3045	1058	2	9	5	09:36:39
3046	1058	2	3	3	18:42:37
3047	1059	1	7	5	09:05:26
3048	1059	1	6	4	16:26:08
3049	1060	3	9	5	12:52:54
3050	1060	3	1	3	08:22:32
3051	1061	1	9	5	09:19:10
3052	1061	1	3	2	03:27:46
3053	1061	1	1	2	03:27:46
3054	1062	4	9	5	12:11:24
3055	1062	4	3	3	07:05:33
3056	1062	4	1	3	07:05:33
3057	1062	4	2	3	07:05:33
3058	1062	4	4	4	15:26:48
3059	1063	2	7	5	15:49:33
3060	1063	2	3	3	10:43:58
3061	1063	2	2	3	10:43:58
3062	1063	2	4	4	15:27:09
3063	1063	2	5	4	15:27:09
3064	1063	2	6	4	15:27:09
3065	1064	1	9	5	13:44:24
3066	1064	1	3	4	17:50:33
3067	1064	1	1	4	17:50:33
3068	1064	1	5	3	15:07:37
3069	1064	1	6	3	15:07:37
3070	1065	1	9	5	18:13:24
3071	1065	1	3	3	08:42:26
3072	1065	1	4	3	15:04:26
3073	1066	1	7	5	15:24:09
3074	1066	1	3	4	04:20:55
3075	1066	1	2	4	04:20:55
3076	1067	3	7	5	09:27:54
3077	1067	3	2	4	07:20:16
3078	1067	3	5	4	18:46:58
3079	1068	3	7	5	09:24:12
3080	1069	1	7	5	09:02:36
3081	1070	1	9	5	14:07:24
3082	1070	1	8	4	16:45:20
3083	1071	3	9	5	15:06:57
3084	1071	3	3	2	14:49:13
3085	1071	3	1	2	14:49:13
3086	1072	3	9	5	09:57:31
3087	1072	3	3	3	16:51:20
3088	1072	3	1	3	16:51:20
3089	1073	3	9	5	13:56:17
3090	1073	3	3	3	10:46:11
3091	1074	1	9	5	17:29:26
3092	1075	2	9	5	16:12:57
3093	1075	2	1	3	14:10:41
3094	1075	2	2	3	14:10:41
3095	1076	1	9	5	16:33:13
3096	1076	1	3	3	10:22:50
3097	1076	1	1	3	10:22:50
3098	1077	1	9	5	09:10:59
3099	1077	1	3	3	12:32:55
3100	1078	2	9	5	09:34:50
3101	1078	3	3	1	05:05:21
3102	1078	3	1	1	05:05:21
3103	1079	2	9	5	10:36:24
3104	1079	3	1	1	07:06:56
3105	1080	2	9	5	13:20:15
3106	1080	2	3	4	06:38:42
3107	1081	4	9	5	15:28:04
3108	1081	4	3	3	05:01:54
3109	1081	4	1	3	05:01:54
3110	1082	2	9	5	09:22:44
3111	1083	1	7	5	09:41:21
3112	1083	4	3	1	08:38:51
3113	1083	4	2	1	08:38:51
3114	1084	3	9	5	12:56:01
3115	1084	3	3	3	13:46:47
3116	1084	3	1	3	13:46:47
3117	1084	3	6	2	15:17:24
3118	1085	1	7	5	18:25:47
3119	1085	1	3	4	10:01:35
3120	1085	1	2	4	10:01:35
3121	1085	1	5	4	09:30:51
3122	1086	1	9	5	14:42:22
3123	1087	4	9	5	09:18:57
3124	1087	4	1	1	08:48:44
3125	1088	1	7	5	09:22:24
3126	1088	1	1	2	09:24:20
3127	1089	1	9	5	13:07:52
3128	1089	1	3	3	17:32:56
3129	1089	1	1	3	17:32:56
3130	1090	3	7	5	09:08:46
3131	1090	3	6	4	13:38:57
3132	1091	1	7	5	09:01:43
3133	1092	1	7	5	11:42:30
3134	1092	1	3	3	11:48:06
3135	1092	1	2	3	11:48:06
3136	1092	1	5	2	09:58:41
3137	1093	1	9	5	11:21:28
3138	1093	1	1	1	07:34:44
3139	1094	3	7	5	09:50:28
3140	1095	1	7	5	10:29:48
3141	1095	3	1	1	14:31:16
3142	1095	3	2	1	14:31:16
3143	1096	2	9	5	09:46:22
3144	1096	2	3	2	08:32:44
3145	1096	2	4	2	15:57:36
3146	1097	1	7	5	18:23:55
3147	1098	2	7	5	09:16:39
3148	1098	2	3	4	07:27:13
3149	1098	2	1	4	07:27:13
3150	1098	2	2	4	07:27:13
3151	1098	4	6	1	15:14:40
3152	1099	2	7	5	09:17:26
3153	1099	2	3	1	15:47:28
3154	1099	2	1	1	15:47:28
3155	1099	2	2	1	15:47:28
3156	1100	3	9	5	09:45:55
3157	1100	3	1	1	12:03:16
3158	1100	3	4	3	11:28:00
3159	1100	3	6	3	11:28:00
3160	1101	3	9	5	09:38:43
3161	1101	3	1	3	08:41:35
3162	1102	3	9	5	16:46:14
3163	1102	3	3	1	16:47:33
3164	1103	2	7	5	09:32:09
3165	1103	4	3	1	09:25:56
3166	1103	4	2	1	09:25:56
3167	1104	2	7	5	18:31:54
3168	1105	2	7	5	09:54:34
3169	1105	2	3	2	15:14:58
3170	1105	2	2	2	15:14:58
3171	1105	2	4	3	15:26:00
3172	1105	2	5	3	15:26:00
3173	1106	1	9	5	16:33:38
3174	1106	1	3	2	04:18:05
3175	1107	1	9	5	12:46:10
3176	1108	2	9	5	09:41:29
3177	1108	2	6	2	18:07:34
3178	1109	2	9	5	09:25:40
3179	1110	4	9	5	18:06:48
3180	1110	4	3	3	07:37:15
3181	1110	4	1	3	07:37:15
3182	1110	4	5	4	12:36:35
3183	1110	4	8	3	16:09:36
3184	1111	1	9	5	09:04:38
3185	1111	1	2	3	10:48:48
3186	1112	1	7	5	15:57:18
3187	1112	1	3	3	04:08:10
3188	1112	1	1	3	04:08:10
3189	1113	1	7	5	13:12:44
3190	1114	2	9	5	14:41:07
3191	1114	2	3	1	09:49:43
3192	1114	2	1	1	09:49:43
3193	1114	2	2	1	09:49:43
3194	1115	2	9	5	14:22:53
3195	1116	4	9	5	10:01:17
3196	1116	4	4	4	17:34:19
3197	1116	4	6	4	17:34:19
3198	1117	1	7	5	09:10:33
3199	1118	1	7	5	11:26:35
3200	1118	4	3	1	14:06:39
3201	1118	4	5	4	13:50:57
3202	1119	1	9	5	15:45:39
3203	1119	1	3	2	11:47:38
3204	1119	1	1	2	11:47:38
3205	1119	1	2	2	11:47:38
3206	1120	1	7	5	09:51:05
3207	1120	1	3	4	13:17:48
3208	1120	1	1	4	13:17:48
3209	1120	1	2	4	13:17:48
3210	1121	3	7	5	15:24:51
3211	1121	3	3	1	13:16:16
3212	1121	3	1	1	13:16:16
3213	1121	3	2	1	13:16:16
3214	1122	1	9	5	16:47:16
3215	1123	1	7	5	13:15:28
3216	1123	1	3	3	18:50:28
3217	1123	1	2	3	18:50:28
3218	1124	1	9	5	11:34:18
3219	1124	1	3	3	11:05:00
3220	1124	1	1	3	11:05:00
3221	1124	1	4	3	12:47:28
3222	1125	1	9	5	09:47:33
3223	1125	1	3	1	09:13:11
3224	1125	1	1	1	09:13:11
3225	1125	1	4	3	12:45:33
3226	1126	3	7	5	11:19:16
3227	1126	3	3	3	14:25:50
3228	1126	3	1	3	14:25:50
3229	1126	3	2	3	14:25:50
3230	1127	2	9	5	10:21:07
3231	1127	2	3	3	10:42:32
3232	1127	2	2	3	10:42:32
3233	1128	2	7	5	18:02:45
3234	1128	2	1	3	04:50:43
3235	1128	2	2	3	04:50:43
3236	1129	2	7	5	17:32:49
3237	1130	2	9	5	09:03:33
3238	1131	1	9	5	09:39:51
3239	1132	1	7	5	18:43:36
3240	1132	1	3	2	05:06:25
3241	1132	1	2	2	05:06:25
3242	1132	1	4	3	11:05:27
3243	1132	1	6	3	11:05:27
3244	1133	3	7	5	17:43:42
3245	1133	3	3	1	07:28:51
3246	1133	3	1	1	07:28:51
3247	1133	3	2	1	07:28:51
3248	1134	3	7	5	13:03:39
3249	1134	3	3	2	06:50:50
3250	1134	3	1	2	06:50:50
3251	1134	3	8	3	11:51:54
3252	1135	1	9	5	15:46:16
3253	1135	1	5	2	15:01:55
3254	1136	2	9	5	17:12:47
3255	1137	1	9	5	16:55:17
3256	1137	1	1	2	16:11:45
3257	1138	3	9	5	17:38:14
3258	1138	3	3	1	14:04:22
3259	1139	1	9	5	09:11:01
3260	1139	1	3	3	18:11:30
3261	1139	1	1	3	18:11:30
3262	1139	1	6	2	16:21:47
3263	1140	3	7	5	15:35:17
3264	1140	3	3	1	17:41:57
3265	1140	3	2	1	17:41:57
3266	1140	3	6	3	13:14:11
3267	1141	2	9	5	11:18:47
3268	1141	2	4	3	16:13:40
3269	1141	2	5	3	16:13:40
3270	1141	2	6	3	16:13:40
3271	1142	1	7	5	14:34:03
3272	1142	1	3	3	09:30:55
3273	1142	1	1	3	09:30:55
3274	1142	1	2	3	09:30:55
3275	1142	1	5	4	16:08:16
3276	1142	1	6	4	16:08:16
3277	1143	1	9	5	12:47:23
3278	1143	1	3	2	06:11:24
3279	1143	1	1	2	06:11:24
3280	1143	3	5	1	17:32:34
3281	1144	3	9	5	13:03:35
3282	1144	3	1	4	13:47:28
3283	1145	3	9	5	12:32:05
3284	1145	3	3	1	18:44:39
3285	1145	3	1	1	18:44:39
3286	1146	1	7	5	15:26:36
3287	1146	1	5	3	18:32:34
3288	1147	1	9	5	11:18:29
3289	1148	1	9	5	09:38:34
3290	1148	1	3	3	07:23:19
3291	1148	1	2	3	07:23:19
3292	1148	1	8	3	17:33:45
3293	1149	3	9	5	13:49:25
3294	1149	3	3	2	10:52:48
3295	1149	3	1	2	10:52:48
3296	1149	3	4	1	10:54:33
3297	1149	3	6	1	10:54:33
3298	1150	2	9	5	09:35:50
3299	1150	2	3	3	17:47:07
3300	1150	2	1	3	17:47:07
3301	1150	2	5	2	10:39:24
3302	1151	2	7	5	09:24:13
3303	1151	2	8	3	13:00:15
3304	1152	2	7	5	09:55:21
3305	1152	2	3	2	12:48:19
3306	1152	2	6	4	11:49:32
3307	1153	2	7	5	09:52:56
3308	1153	2	3	2	10:37:19
3309	1153	2	2	2	10:37:19
3310	1153	2	8	3	12:51:58
3311	1154	1	9	5	16:38:39
3312	1154	1	3	4	06:27:19
3313	1154	1	1	4	06:27:19
3314	1154	1	6	2	13:05:18
3315	1155	4	9	5	15:38:16
3316	1155	4	1	1	15:42:17
3317	1156	2	9	5	09:00:26
3318	1156	2	3	3	07:24:28
3319	1156	2	1	3	07:24:28
3320	1156	2	2	3	07:24:28
3321	1156	2	8	2	11:45:16
3322	1157	2	7	5	16:24:03
3323	1157	2	3	3	08:27:32
3324	1157	2	2	3	08:27:32
3325	1157	2	4	4	17:04:01
3326	1157	2	6	4	17:04:01
3327	1158	3	9	5	17:19:57
3328	1158	3	3	2	16:52:45
3329	1158	3	6	1	12:08:50
3330	1158	3	8	4	15:09:56
3331	1159	1	7	5	17:57:13
3332	1159	1	3	4	10:24:31
3333	1159	1	5	3	14:25:16
3334	1159	1	6	3	14:25:16
3335	1160	1	7	5	09:54:41
3336	1160	1	3	1	08:50:55
3337	1160	1	1	1	08:50:55
3338	1160	1	2	1	08:50:55
3339	1161	2	9	5	09:04:53
3340	1161	2	8	2	13:26:34
3341	1162	2	7	5	09:55:22
3342	1162	2	3	1	06:27:42
3343	1162	2	8	1	17:16:04
3344	1163	3	9	5	09:26:36
3345	1163	3	3	3	05:05:52
3346	1163	3	1	3	05:05:52
3347	1164	3	9	5	11:47:43
3348	1164	3	3	3	03:45:49
3349	1164	3	1	3	03:45:49
3350	1165	1	9	5	12:53:36
3351	1165	1	8	3	16:30:05
3352	1166	3	7	5	18:26:46
3353	1166	3	3	3	05:35:40
3354	1166	3	2	3	05:35:40
3355	1167	4	9	5	18:47:29
3356	1167	4	4	4	10:31:07
3357	1168	4	7	5	13:18:07
3358	1168	4	1	1	06:24:31
3359	1168	4	2	1	06:24:31
3360	1168	4	5	4	16:03:14
3361	1169	2	9	5	14:30:14
3362	1169	2	1	3	14:30:11
3363	1169	2	5	2	14:06:05
3364	1169	2	6	2	14:06:05
3365	1170	4	9	5	12:41:10
3366	1170	4	3	4	11:24:25
3367	1170	4	1	4	11:24:25
3368	1170	4	5	4	16:06:01
3369	1171	3	9	5	10:15:50
3370	1171	3	5	3	17:37:35
3371	1172	2	9	5	09:40:49
3372	1172	3	3	1	15:15:45
3373	1172	3	1	1	15:15:45
3374	1173	2	9	5	17:07:25
3375	1173	3	3	1	10:05:10
3376	1173	3	1	1	10:05:10
3377	1173	3	6	4	17:47:50
3378	1174	1	9	5	14:12:21
3379	1174	1	8	3	09:04:14
3380	1175	3	9	5	18:02:53
3381	1175	3	3	1	05:38:10
3382	1175	3	1	1	05:38:10
3383	1175	3	4	4	10:23:09
3384	1175	3	5	4	10:23:09
3385	1176	3	9	5	09:06:22
3386	1176	3	3	3	13:26:18
3387	1176	3	1	3	13:26:18
3388	1176	3	2	3	13:26:18
3389	1177	4	9	5	12:46:16
3390	1178	2	9	5	09:56:44
3391	1179	3	7	5	12:20:37
3392	1179	3	3	1	11:57:26
3393	1180	1	7	5	12:58:46
3394	1180	1	3	2	10:52:56
3395	1180	1	1	2	10:52:56
3396	1180	1	2	2	10:52:56
3397	1181	3	9	5	09:50:12
3398	1181	3	4	3	16:23:54
3399	1181	3	6	3	16:23:54
3400	1182	2	7	5	10:33:57
3401	1182	2	2	2	13:59:42
3402	1183	4	9	5	09:18:11
3403	1184	1	9	5	09:40:03
3404	1184	1	3	3	15:07:07
3405	1184	1	1	3	15:07:07
3406	1185	3	9	5	12:06:12
3407	1185	3	3	3	10:06:08
3408	1185	3	1	3	10:06:08
3409	1185	3	5	4	11:12:46
3410	1185	3	8	4	12:19:31
3411	1186	3	9	5	14:51:50
3412	1186	3	3	3	14:17:50
3413	1186	3	1	3	14:17:50
3414	1187	1	9	5	09:29:28
3415	1187	4	3	1	09:17:27
3416	1187	4	1	1	09:17:27
3417	1188	4	7	5	15:09:45
3418	1188	4	3	2	06:25:12
3419	1189	2	9	5	15:28:45
3420	1189	2	3	3	05:03:47
3421	1189	2	1	3	05:03:47
3422	1189	2	8	4	16:49:33
3423	1190	1	7	5	15:57:45
3424	1190	1	3	2	06:43:26
3425	1190	1	1	2	06:43:26
3426	1191	1	7	5	14:17:18
3427	1191	4	3	1	16:10:42
3428	1191	4	2	1	16:10:42
3429	1191	4	8	1	13:24:23
3430	1192	1	9	5	12:17:53
3431	1192	1	3	2	08:15:21
3432	1192	1	1	2	08:15:21
3433	1193	2	9	5	09:50:58
3434	1193	2	3	2	10:55:06
3435	1193	2	1	2	10:55:06
3436	1193	2	8	4	10:40:53
3437	1194	4	7	5	15:34:22
3438	1194	4	3	4	09:48:40
3439	1194	4	1	4	09:48:40
3440	1194	4	4	3	15:30:04
3441	1194	4	8	3	10:34:39
3442	1195	2	9	5	10:48:40
3443	1195	3	3	1	12:18:37
3444	1195	3	6	3	10:04:14
3445	1196	2	7	5	12:42:35
3446	1196	2	3	2	08:11:53
3447	1196	2	1	2	08:11:53
3448	1196	2	2	2	08:11:53
3449	1196	2	4	4	17:43:49
3450	1196	2	5	4	17:43:49
3451	1196	2	8	4	12:12:06
3452	1197	1	9	5	09:27:13
3453	1197	1	1	3	12:42:04
3454	1198	1	9	5	12:29:44
3455	1198	1	3	3	10:41:35
3456	1198	1	1	3	10:41:35
3457	1198	1	4	4	10:57:15
3458	1199	1	9	5	12:34:29
3459	1200	4	7	5	09:28:27
3460	1200	4	3	3	11:03:28
3461	1200	4	2	3	11:03:28
3462	1200	4	5	4	18:52:07
3463	1201	4	9	5	09:47:07
3464	1201	4	3	3	17:18:12
3465	1201	4	1	3	17:18:12
3466	1202	2	7	5	15:34:44
3467	1202	2	3	2	07:30:57
3468	1202	2	2	2	07:30:57
3469	1203	4	9	5	12:36:19
3470	1203	4	3	1	12:04:29
3471	1203	4	1	1	12:04:29
3472	1203	4	6	2	10:38:18
3473	1204	1	7	5	17:40:35
3474	1204	1	4	2	13:03:45
3475	1204	1	5	2	13:03:45
3476	1205	1	7	5	12:01:06
3477	1206	1	9	5	16:03:39
3478	1206	1	3	4	09:42:33
3479	1207	2	7	5	12:46:14
3480	1207	2	3	2	09:25:52
3481	1207	2	2	2	09:25:52
3482	1208	3	9	5	11:37:14
3483	1209	3	7	5	15:00:36
3484	1209	3	3	2	10:01:05
3485	1209	3	2	2	10:01:05
3486	1210	4	9	5	18:33:08
3487	1210	4	4	3	17:42:43
3488	1210	4	5	3	17:42:43
3489	1211	1	9	5	14:45:02
3490	1211	1	3	2	06:08:48
3491	1211	1	1	2	06:08:48
3492	1212	1	9	5	12:36:14
3493	1212	1	6	2	13:27:24
3494	1213	2	7	5	11:47:18
3495	1213	2	3	2	10:52:07
3496	1213	2	1	2	10:52:07
3497	1214	1	7	5	09:20:54
3498	1215	2	9	5	09:16:59
3499	1215	4	3	1	10:05:51
3500	1215	4	8	4	10:49:26
3501	1216	1	7	5	11:38:30
3502	1216	1	3	4	18:16:05
3503	1216	1	1	4	18:16:05
3504	1216	1	2	4	18:16:05
3505	1217	1	9	5	18:58:55
3506	1217	1	1	2	09:13:27
3507	1218	2	9	5	13:41:17
3508	1218	2	3	2	18:54:02
3509	1218	2	8	3	15:02:16
3510	1219	2	9	5	18:37:28
3511	1219	2	3	3	06:37:58
3512	1219	2	1	3	06:37:58
3513	1220	1	9	5	11:46:27
3514	1220	1	3	2	14:55:03
3515	1220	1	6	3	18:40:03
3516	1221	4	9	5	10:33:49
3517	1221	4	3	2	04:47:26
3518	1221	4	1	2	04:47:26
3519	1222	3	9	5	18:48:04
3520	1222	3	1	1	12:09:41
3521	1223	1	7	5	09:17:18
3522	1223	3	3	1	06:18:55
3523	1223	3	2	1	06:18:55
3524	1224	2	9	5	13:41:21
3525	1224	2	3	3	14:08:53
3526	1224	2	1	3	14:08:53
3527	1224	2	5	3	10:15:12
3528	1225	2	7	5	09:33:56
3529	1225	2	3	3	09:18:33
3530	1225	2	1	3	09:18:33
3531	1225	2	2	3	09:18:33
3532	1226	3	9	5	09:26:47
3533	1226	3	3	3	04:57:08
3534	1226	3	1	3	04:57:08
3535	1227	2	9	5	09:43:56
3536	1227	2	3	2	11:15:58
3537	1228	2	7	5	11:51:56
3538	1228	2	3	3	08:04:19
3539	1228	2	2	3	08:04:19
3540	1229	2	7	5	09:35:16
3541	1229	2	3	2	17:11:17
3542	1229	2	4	1	17:42:09
3543	1229	2	5	1	17:42:09
3544	1229	2	6	1	17:42:09
3545	1230	2	9	5	09:22:27
3546	1230	2	3	2	10:32:26
3547	1231	1	9	5	09:22:30
3548	1231	1	8	3	10:00:09
3549	1232	3	7	5	12:47:59
3550	1232	3	3	2	06:33:01
3551	1232	3	1	2	06:33:01
3552	1232	3	2	2	06:33:01
3553	1233	4	9	5	15:46:23
3554	1233	4	3	1	16:28:40
3555	1233	4	5	4	17:55:03
3556	1233	4	6	4	17:55:03
3557	1234	1	9	5	16:58:52
3558	1234	3	3	1	04:51:46
3559	1234	3	4	2	12:07:32
3560	1235	1	7	5	09:17:51
3561	1235	4	6	1	11:59:57
3562	1236	2	7	5	15:47:07
3563	1236	2	1	2	14:02:22
3564	1236	2	2	2	14:02:22
3565	1237	2	9	5	09:45:06
3566	1237	2	3	3	08:39:34
3567	1237	2	1	3	08:39:34
3568	1238	3	9	5	16:32:05
3569	1238	3	3	3	11:25:18
3570	1238	3	1	3	11:25:18
3571	1239	1	9	5	09:56:28
3572	1239	1	3	3	10:37:25
3573	1239	1	1	3	10:37:25
3574	1239	1	2	3	10:37:25
3575	1239	1	4	4	15:28:14
3576	1240	1	9	5	09:19:56
3577	1240	4	3	1	09:06:49
3578	1240	4	1	1	09:06:49
3579	1240	4	8	3	12:40:28
3580	1241	1	9	5	09:38:06
3581	1241	1	1	3	17:09:18
3582	1242	2	9	5	11:37:12
3583	1242	2	3	2	08:11:51
3584	1242	2	1	2	08:11:51
3585	1243	2	9	5	17:32:52
3586	1243	2	3	2	16:43:24
3587	1243	2	2	2	16:43:24
3588	1244	1	7	5	09:39:18
3589	1244	1	3	3	12:47:33
3590	1244	1	2	3	12:47:33
3591	1244	1	5	3	13:54:24
3592	1245	4	7	5	09:13:46
3593	1245	4	3	3	10:50:27
3594	1245	4	2	3	10:50:27
3595	1246	3	9	5	09:37:55
3596	1246	3	3	4	10:16:08
3597	1247	3	9	5	13:11:47
3598	1247	3	3	4	13:19:45
3599	1247	3	1	4	13:19:45
3600	1247	3	8	1	15:04:33
3601	1248	2	9	5	10:02:14
3602	1249	2	9	5	10:44:18
3603	1249	2	3	3	11:18:38
3604	1250	1	7	5	11:15:59
3605	1250	1	1	3	16:34:36
3606	1250	1	2	3	16:34:36
3607	1251	2	9	5	09:37:54
3608	1251	3	3	1	06:12:44
3609	1252	2	9	5	09:06:21
3610	1252	2	1	2	12:10:29
3611	1253	1	7	5	15:45:31
3612	1253	1	5	4	10:58:49
3613	1254	3	9	5	16:40:36
3614	1254	3	3	2	05:36:15
3615	1254	3	1	2	05:36:15
3616	1255	1	7	5	10:44:30
3617	1256	3	9	5	09:57:50
3618	1256	3	3	1	08:22:25
3619	1256	3	2	1	08:22:25
3620	1256	3	8	1	11:33:54
3621	1257	1	7	5	13:40:13
3622	1257	1	1	3	04:50:50
3623	1258	3	9	5	10:41:44
3624	1258	3	3	2	13:39:18
3625	1258	3	4	1	10:25:31
3626	1258	3	5	1	10:25:31
3627	1258	3	6	1	10:25:31
3628	1259	1	9	5	13:05:19
3629	1259	1	3	2	04:06:40
3630	1259	1	1	2	04:06:40
3631	1259	1	2	2	04:06:40
3632	1260	3	7	5	09:28:10
3633	1260	3	2	4	04:06:38
3634	1261	4	9	5	14:47:43
3635	1261	4	3	2	17:59:03
3636	1261	4	1	2	17:59:03
3637	1262	3	9	5	15:49:56
3638	1262	3	3	2	07:52:06
3639	1262	3	1	2	07:52:06
3640	1263	3	9	5	13:33:20
3641	1263	3	3	1	15:45:58
3642	1263	3	1	1	15:45:58
3643	1263	3	5	4	09:53:22
3644	1263	3	6	4	09:53:22
3645	1264	3	7	5	11:14:14
3646	1264	3	3	2	06:07:58
3647	1264	3	1	2	06:07:58
3648	1264	3	2	2	06:07:58
3649	1264	3	4	4	17:04:47
3650	1265	1	9	5	09:29:56
3651	1265	1	2	3	16:28:05
3652	1266	2	9	5	11:30:10
3653	1266	2	3	3	04:48:18
3654	1267	1	9	5	10:21:58
3655	1267	4	3	1	07:04:51
3656	1268	1	9	5	15:27:21
3657	1268	3	3	1	09:58:56
3658	1269	3	9	5	12:00:22
3659	1269	3	3	4	06:08:31
3660	1269	3	2	4	06:08:31
3661	1270	3	9	5	09:40:24
3662	1270	3	3	1	04:27:08
3663	1270	3	1	1	04:27:08
3664	1270	3	4	4	12:54:08
3665	1271	2	7	5	18:49:25
3666	1272	1	9	5	14:34:55
3667	1273	2	7	5	09:42:16
3668	1273	2	3	4	10:28:07
3669	1273	2	4	4	12:08:53
3670	1273	2	5	4	12:08:53
3671	1274	2	9	5	09:47:13
3672	1275	2	7	5	17:30:53
3673	1275	2	3	3	03:33:57
3674	1275	2	2	3	03:33:57
3675	1276	2	7	5	14:02:11
3676	1276	2	2	2	16:50:05
3677	1276	2	5	4	16:45:23
3678	1277	2	7	5	09:19:41
3679	1277	2	3	3	18:06:23
3680	1277	2	2	3	18:06:23
3681	1278	3	9	5	18:29:37
3682	1278	3	1	1	08:02:35
3683	1278	3	2	1	08:02:35
3684	1279	3	7	5	12:48:10
3685	1279	3	3	1	13:33:23
3686	1280	1	7	5	17:26:39
3687	1280	1	8	4	16:22:46
3688	1281	3	9	5	11:01:50
3689	1281	3	3	3	07:57:03
3690	1281	3	2	3	07:57:03
3691	1281	3	4	4	17:17:06
3692	1281	3	5	4	17:17:06
3693	1281	3	6	4	17:17:06
3694	1282	1	9	5	10:11:53
3695	1282	1	3	2	04:26:39
3696	1282	1	1	2	04:26:39
3697	1283	3	9	5	09:35:55
3698	1283	3	3	3	12:37:14
3699	1283	3	1	3	12:37:14
3700	1283	3	2	3	12:37:14
3701	1283	3	4	4	12:43:11
3702	1284	1	9	5	09:15:25
3703	1285	2	9	5	14:10:46
3704	1285	4	3	1	14:37:13
3705	1285	4	1	1	14:37:13
3706	1285	4	2	1	14:37:13
3707	1285	4	4	4	17:05:52
3708	1286	1	9	5	09:49:53
3709	1286	1	3	3	08:04:24
3710	1287	1	9	5	09:24:57
3711	1287	1	3	2	08:33:00
3712	1288	4	9	5	09:17:20
3713	1288	4	3	3	11:33:12
3714	1288	4	1	3	11:33:12
3715	1289	2	9	5	09:16:40
3716	1289	4	3	1	08:32:00
3717	1289	4	1	1	08:32:00
3718	1289	4	2	1	08:32:00
3719	1289	4	5	1	16:31:43
3720	1289	4	6	1	16:31:43
3721	1289	4	8	2	18:45:54
3722	1290	1	7	5	09:27:49
3723	1290	1	3	2	10:17:18
3724	1290	1	2	2	10:17:18
3725	1291	3	7	5	09:15:07
3726	1291	3	3	1	18:10:42
3727	1291	3	1	1	18:10:42
3728	1291	3	8	2	10:37:20
3729	1292	3	7	5	09:35:39
3730	1292	3	6	3	16:16:06
3731	1293	3	9	5	13:12:44
3732	1293	3	3	2	18:31:48
3733	1293	3	1	2	18:31:48
3734	1293	3	4	3	14:12:08
3735	1293	3	5	3	14:12:08
3736	1294	2	7	5	14:05:03
3737	1294	2	3	4	05:50:11
3738	1294	2	1	4	05:50:11
3739	1294	2	2	4	05:50:11
3740	1294	2	5	3	15:28:53
3741	1294	2	6	3	15:28:53
3742	1295	3	7	5	09:28:08
3743	1295	3	3	2	05:39:58
3744	1295	3	2	2	05:39:58
3745	1295	3	5	4	16:15:13
3746	1296	2	9	5	09:56:22
3747	1296	2	3	3	10:53:44
3748	1296	2	1	3	10:53:44
3749	1296	2	8	4	13:54:31
3750	1297	2	7	5	16:56:30
3751	1297	3	3	1	11:39:57
3752	1298	2	9	5	15:28:53
3753	1299	1	9	5	13:58:29
3754	1300	2	7	5	09:52:31
3755	1301	2	7	5	13:39:28
3756	1301	3	1	1	10:22:41
3757	1301	3	2	1	10:22:41
3758	1302	4	9	5	09:50:09
3759	1302	4	3	1	06:10:01
3760	1303	1	9	5	11:14:48
3761	1303	1	3	3	14:30:43
3762	1303	1	1	3	14:30:43
3763	1304	1	9	5	14:05:28
3764	1304	1	3	3	05:35:30
3765	1304	1	1	3	05:35:30
3766	1305	2	7	5	10:24:26
3767	1306	3	7	5	17:03:08
3768	1306	3	3	3	13:53:48
3769	1306	3	2	3	13:53:48
3770	1307	2	7	5	09:24:56
3771	1307	2	3	2	12:13:17
3772	1307	2	2	2	12:13:17
3773	1308	2	7	5	17:11:16
3774	1308	2	3	3	11:18:10
3775	1308	2	1	3	11:18:10
3776	1308	2	5	3	12:44:32
3777	1308	2	8	4	13:19:30
3778	1309	3	9	5	09:09:10
3779	1309	3	3	3	14:53:28
3780	1309	3	1	3	14:53:28
3781	1310	1	9	5	12:06:10
3782	1310	1	3	3	06:26:21
3783	1310	1	1	3	06:26:21
3784	1310	1	8	3	13:54:22
3785	1311	2	7	5	10:33:53
3786	1311	2	1	1	04:49:17
3787	1312	1	7	5	16:53:39
3788	1313	1	7	5	09:08:37
3789	1313	3	3	1	04:30:13
3790	1313	3	2	1	04:30:13
3791	1313	3	6	4	17:20:45
3792	1313	3	8	4	12:33:50
3793	1314	4	7	5	09:55:50
3794	1314	4	3	4	12:04:00
3795	1314	4	1	4	12:04:00
3796	1314	4	2	4	12:04:00
3797	1315	2	9	5	09:28:13
3798	1315	2	5	4	12:57:32
3799	1315	2	6	4	12:57:32
3800	1316	1	9	5	09:32:28
3801	1316	3	3	1	09:08:47
3802	1316	3	1	1	09:08:47
3803	1317	3	7	5	15:54:22
3804	1317	3	3	4	05:17:30
3805	1317	3	2	4	05:17:30
3806	1317	3	4	3	12:58:23
3807	1317	3	5	3	12:58:23
3808	1317	3	6	3	12:58:23
3809	1318	2	7	5	09:51:35
3810	1318	2	3	3	04:16:32
3811	1318	2	2	3	04:16:32
3812	1319	2	9	5	15:30:00
3813	1319	2	3	2	12:39:15
3814	1319	2	1	2	12:39:15
3815	1320	1	9	5	09:55:09
3816	1321	3	9	5	09:29:08
3817	1321	3	3	3	13:19:41
3818	1322	2	7	5	09:17:32
3819	1322	4	3	1	11:08:26
3820	1322	4	1	1	11:08:26
3821	1322	4	4	2	16:56:31
3822	1323	1	9	5	09:43:32
3823	1323	1	3	3	11:33:33
3824	1323	1	1	3	11:33:33
3825	1323	1	2	3	11:33:33
3826	1324	1	9	5	18:53:09
3827	1324	1	8	3	11:44:20
3828	1325	1	9	5	13:54:48
3829	1326	1	9	5	11:55:13
3830	1326	1	3	2	04:08:35
3831	1327	1	9	5	10:04:25
3832	1327	1	3	3	10:22:17
3833	1327	1	1	3	10:22:17
3834	1328	3	7	5	16:38:01
3835	1328	3	5	1	09:21:29
3836	1328	3	8	3	10:10:51
3837	1329	2	7	5	15:58:40
3838	1329	2	3	1	05:05:25
3839	1329	2	2	1	05:05:25
3840	1329	2	4	2	16:09:47
3841	1329	2	5	2	16:09:47
3842	1329	2	8	1	10:05:35
3843	1330	3	9	5	14:50:58
3844	1330	3	3	1	14:04:33
3845	1330	3	1	1	14:04:33
3846	1330	3	2	1	14:04:33
3847	1330	3	6	3	10:11:16
3848	1331	1	7	5	09:32:23
3849	1331	1	3	1	15:07:15
3850	1331	1	2	1	15:07:15
3851	1331	1	5	2	11:16:43
3852	1332	1	9	5	09:13:06
3853	1332	1	6	3	17:30:22
3854	1333	2	7	5	09:21:05
3855	1334	2	9	5	13:00:47
3856	1334	2	3	2	10:02:49
3857	1334	2	1	2	10:02:49
3858	1334	2	4	3	12:55:05
3859	1334	2	5	3	12:55:05
3860	1335	1	7	5	11:27:09
3861	1335	1	3	4	06:14:58
3862	1335	1	2	4	06:14:58
3863	1335	1	5	2	13:20:25
3864	1335	1	6	2	13:20:25
3865	1336	2	9	5	14:04:55
3866	1336	2	3	1	04:12:12
3867	1336	2	1	1	04:12:12
3868	1337	1	9	5	15:16:30
3869	1337	3	3	1	08:24:19
3870	1338	2	7	5	17:08:22
3871	1338	4	3	1	14:46:44
3872	1338	4	2	1	14:46:44
3873	1339	3	9	5	11:05:44
3874	1339	3	5	4	15:12:11
3875	1340	2	7	5	11:21:38
3876	1340	2	3	3	08:56:26
3877	1340	2	2	3	08:56:26
3878	1340	4	6	1	17:50:12
3879	1341	1	9	5	09:27:13
3880	1341	3	3	1	10:47:04
3881	1341	3	1	1	10:47:04
3882	1342	1	7	5	17:48:01
3883	1342	1	3	3	16:43:51
3884	1342	1	1	3	16:43:51
3885	1342	1	2	3	16:43:51
3886	1342	1	4	4	15:31:27
3887	1342	1	5	4	15:31:27
3888	1343	2	9	5	09:37:24
3889	1343	2	8	3	16:46:42
3890	1344	2	7	5	09:43:28
3891	1344	2	3	2	05:26:21
3892	1344	2	1	2	05:26:21
3893	1344	2	2	2	05:26:21
3894	1345	1	9	5	09:07:02
3895	1345	1	6	4	14:57:53
3896	1346	2	9	5	17:32:49
3897	1346	2	3	3	13:17:38
3898	1346	2	1	3	13:17:38
3899	1346	2	4	3	13:21:46
3900	1346	2	5	3	13:21:46
3901	1347	1	7	5	13:27:51
3902	1347	1	3	4	06:37:29
3903	1347	1	2	4	06:37:29
3904	1347	1	5	3	11:24:40
3905	1347	1	6	3	11:24:40
3906	1348	3	7	5	16:39:10
3907	1348	3	2	1	09:17:07
3908	1348	3	5	4	14:19:43
3909	1348	3	8	3	13:39:22
3910	1349	1	9	5	13:14:13
3911	1349	3	3	1	06:34:02
3912	1350	1	7	5	09:20:25
3913	1350	1	4	4	18:17:14
3914	1350	1	6	4	18:17:14
3915	1351	1	7	5	09:16:32
3916	1352	1	9	5	09:10:40
3917	1352	1	3	3	10:12:15
3918	1352	1	1	3	10:12:15
3919	1352	1	5	4	11:33:23
3920	1353	2	7	5	11:27:46
3921	1353	4	3	1	11:20:48
3922	1354	2	9	5	17:09:15
3923	1354	2	3	1	12:59:49
3924	1354	2	1	1	12:59:49
3925	1355	4	9	5	11:24:38
3926	1356	1	9	5	09:23:17
3927	1356	1	2	3	06:30:32
3928	1357	3	7	5	18:40:04
3929	1357	3	3	3	10:51:52
3930	1357	3	2	3	10:51:52
3931	1358	1	9	5	09:45:51
3932	1359	3	9	5	18:32:22
3933	1359	3	3	1	08:13:55
3934	1359	3	1	1	08:13:55
3935	1360	1	9	5	09:20:55
3936	1360	1	3	3	09:58:23
3937	1360	1	1	3	09:58:23
3938	1360	1	4	4	12:53:27
3939	1361	3	9	5	09:58:01
3940	1361	3	3	1	09:56:20
3941	1361	3	2	1	09:56:20
3942	1361	3	4	3	18:59:32
3943	1361	3	5	3	18:59:32
3944	1362	1	9	5	09:49:21
3945	1362	1	3	3	15:31:56
3946	1362	1	2	3	15:31:56
3947	1363	1	9	5	09:41:33
3948	1363	1	5	4	15:26:58
3949	1364	2	7	5	09:43:16
3950	1365	1	9	5	11:03:43
3951	1365	1	3	2	14:45:25
3952	1365	1	1	2	14:45:25
3953	1366	1	9	5	09:08:05
3954	1367	2	9	5	09:34:55
3955	1367	3	5	4	11:54:42
3956	1368	1	7	5	15:28:52
3957	1368	1	3	3	04:08:20
3958	1368	1	8	3	14:55:34
3959	1369	1	7	5	09:06:49
3960	1369	1	3	2	16:11:48
3961	1369	1	1	2	16:11:48
3962	1369	1	2	2	16:11:48
3963	1370	2	9	5	18:39:33
3964	1370	2	3	4	14:07:26
3965	1371	4	7	5	09:57:53
3966	1371	4	5	2	11:43:59
3967	1372	4	9	5	09:44:29
3968	1372	4	4	4	10:47:57
3969	1373	2	9	5	15:17:42
3970	1373	2	3	2	11:19:07
3971	1373	2	8	3	15:36:09
3972	1374	1	9	5	14:57:18
3973	1375	1	9	5	09:47:05
3974	1376	3	9	5	17:10:32
3975	1376	3	3	1	11:22:44
3976	1377	3	7	5	14:39:57
3977	1377	3	3	2	07:05:48
3978	1377	3	2	2	07:05:48
3979	1377	3	5	2	14:28:21
3980	1377	3	6	2	14:28:21
3981	1378	4	7	5	15:37:07
3982	1379	1	7	5	09:16:15
3983	1380	1	7	5	18:57:47
3984	1380	1	5	3	14:01:49
3985	1381	2	7	5	13:38:27
3986	1381	2	3	3	12:53:55
3987	1381	2	1	3	12:53:55
3988	1381	2	2	3	12:53:55
3989	1382	3	9	5	16:11:07
3990	1383	1	7	5	13:56:43
3991	1384	1	7	5	09:10:11
3992	1384	3	2	1	10:26:39
3993	1384	3	6	3	14:58:40
3994	1385	2	9	5	16:04:23
3995	1385	2	3	2	07:19:14
3996	1385	2	1	2	07:19:14
3997	1385	2	4	3	11:39:03
3998	1385	2	6	3	11:39:03
3999	1386	3	9	5	11:32:54
4000	1386	3	3	4	09:14:24
4001	1386	3	1	4	09:14:24
4002	1387	2	9	5	14:46:56
4003	1387	3	3	1	03:36:33
4004	1387	3	1	1	03:36:33
4005	1387	3	2	1	03:36:33
4006	1388	2	9	5	09:36:32
4007	1388	2	3	4	09:58:08
4008	1388	2	1	4	09:58:08
4009	1389	4	7	5	14:28:29
4010	1389	4	3	4	10:44:24
4011	1389	4	2	4	10:44:24
4012	1390	1	9	5	09:18:13
4013	1391	1	7	5	09:18:47
4014	1391	1	3	2	13:58:48
4015	1391	1	2	2	13:58:48
4016	1392	3	9	5	09:09:29
4017	1392	3	3	2	08:10:44
4018	1392	3	1	2	08:10:44
4019	1392	3	4	4	12:35:28
4020	1392	3	5	4	12:35:28
4021	1392	3	8	4	16:41:35
4022	1393	2	9	5	09:39:36
4023	1393	2	1	3	03:48:29
4024	1394	3	7	5	13:18:50
4025	1394	3	3	4	12:48:05
4026	1394	3	1	4	12:48:05
4027	1394	3	6	4	12:44:00
4028	1395	1	7	5	13:39:09
4029	1395	1	1	2	10:43:06
4030	1396	1	9	5	09:52:52
4031	1397	3	7	5	14:36:47
4032	1397	3	2	2	04:51:23
4033	1398	1	9	5	09:49:15
4034	1398	1	3	4	08:52:26
4035	1398	1	1	4	08:52:26
4036	1398	1	5	4	17:10:39
4037	1399	1	9	5	16:41:16
4038	1399	1	1	3	07:13:47
4039	1400	1	9	5	09:35:43
4040	1400	1	3	3	11:51:19
4041	1401	2	9	5	09:48:44
4042	1401	2	3	3	10:48:11
4043	1401	2	1	3	10:48:11
4044	1401	2	5	3	17:55:08
4045	1402	3	9	5	15:36:05
4046	1402	3	3	1	05:01:05
4047	1402	3	8	3	18:34:23
4048	1403	1	9	5	09:58:11
4049	1403	4	3	1	17:22:04
4050	1403	4	1	1	17:22:04
4051	1404	1	9	5	09:31:11
4052	1404	1	5	3	15:21:00
4053	1404	1	6	3	15:21:00
4054	1405	2	9	5	09:51:35
4055	1405	2	1	1	17:33:10
4056	1405	2	8	4	16:28:41
4057	1406	1	7	5	15:04:30
4058	1406	1	1	2	15:56:43
4059	1406	1	4	4	15:35:33
4060	1407	2	7	5	09:45:25
4061	1408	1	9	5	09:14:00
4062	1408	1	3	3	06:49:40
4063	1408	1	1	3	06:49:40
4064	1409	1	9	5	09:02:32
4065	1409	1	3	3	06:07:27
4066	1409	1	1	3	06:07:27
4067	1410	1	9	5	14:56:24
4068	1410	1	1	3	08:38:02
4069	1410	1	4	3	16:15:06
4070	1410	1	5	3	16:15:06
4071	1411	1	7	5	09:17:27
4072	1411	1	3	3	09:32:24
4073	1412	1	7	5	18:14:45
4074	1412	1	3	4	06:37:39
4075	1412	1	4	4	12:07:13
4076	1412	1	6	4	12:07:13
4077	1413	2	9	5	13:55:28
4078	1413	2	3	3	11:43:32
4079	1413	2	1	3	11:43:32
4080	1414	3	9	5	15:43:31
4081	1414	3	3	1	06:37:33
4082	1414	3	1	1	06:37:33
4083	1415	1	9	5	09:34:29
4084	1415	1	3	2	05:21:23
4085	1415	1	1	2	05:21:23
4086	1415	4	5	1	15:31:29
4087	1415	4	6	1	15:31:29
4088	1416	2	7	5	10:47:36
4089	1416	4	2	1	16:24:17
4090	1417	1	7	5	13:50:02
4091	1417	1	3	1	10:11:19
4092	1417	1	2	1	10:11:19
4093	1417	1	8	3	13:54:33
4094	1418	1	7	5	09:29:06
4095	1418	1	3	3	15:09:03
4096	1418	1	1	3	15:09:03
4097	1418	1	4	3	13:51:57
4098	1419	2	9	5	16:40:05
4099	1420	4	9	5	09:39:28
4100	1420	4	3	3	05:55:12
4101	1420	4	1	3	05:55:12
4102	1421	1	9	5	09:20:29
4103	1421	1	3	2	10:56:13
4104	1421	1	1	2	10:56:13
4105	1422	3	7	5	09:33:51
4106	1422	3	3	2	16:14:17
4107	1422	3	1	2	16:14:17
4108	1423	3	9	5	09:21:22
4109	1423	3	1	2	04:11:40
4110	1424	1	9	5	11:04:36
4111	1424	1	3	3	15:22:05
4112	1425	2	9	5	09:04:25
4113	1425	2	4	4	12:07:02
4114	1425	2	5	4	12:07:02
4115	1425	2	6	4	12:07:02
4116	1426	2	7	5	15:28:34
4117	1426	4	3	1	08:52:34
4118	1426	4	2	1	08:52:34
4119	1426	4	4	4	17:10:56
4120	1426	4	6	4	17:10:56
4121	1427	1	7	5	09:04:51
4122	1427	1	3	2	12:41:12
4123	1427	1	2	2	12:41:12
4124	1428	3	7	5	09:29:04
4125	1428	3	3	3	13:39:50
4126	1428	3	2	3	13:39:50
4127	1429	1	7	5	09:08:11
4128	1429	1	4	4	10:30:08
4129	1430	1	9	5	13:26:25
4130	1430	1	3	3	15:45:56
4131	1430	1	1	3	15:45:56
4132	1430	1	4	2	13:45:01
4133	1431	3	9	5	17:33:26
4134	1431	3	3	1	08:32:01
4135	1431	3	1	1	08:32:01
4136	1431	3	8	4	17:52:56
4137	1432	4	7	5	09:40:53
4138	1432	4	3	2	07:01:09
4139	1432	4	1	2	07:01:09
4140	1432	4	2	2	07:01:09
4141	1432	4	4	2	15:36:12
4142	1432	4	6	2	15:36:12
4143	1433	1	9	5	14:54:53
4144	1434	1	7	5	09:51:35
4145	1434	4	3	1	10:16:32
4146	1434	4	1	1	10:16:32
4147	1434	4	2	1	10:16:32
4148	1435	3	7	5	10:29:18
4149	1436	1	9	5	12:52:09
4150	1436	1	1	3	12:22:54
4151	1437	4	9	5	11:32:43
4152	1437	4	3	3	05:09:31
4153	1437	4	1	3	05:09:31
4154	1438	2	7	5	11:08:32
4155	1438	2	3	3	09:09:27
4156	1438	2	2	3	09:09:27
4157	1438	2	6	4	17:40:32
4158	1439	1	9	5	09:25:32
4159	1439	1	3	3	09:58:29
4160	1439	1	2	3	09:58:29
4161	1439	3	4	1	16:37:12
4162	1439	3	6	1	16:37:12
4163	1440	1	9	5	09:44:16
4164	1440	1	3	2	04:32:00
4165	1440	1	1	2	04:32:00
4166	1441	2	9	5	16:09:09
4167	1441	2	1	2	06:51:50
4168	1442	1	9	5	09:01:11
4169	1442	1	3	3	15:28:48
4170	1442	1	1	3	15:28:48
4171	1443	2	9	5	09:00:53
4172	1443	2	4	2	15:36:26
4173	1444	3	9	5	13:20:58
4174	1444	3	3	1	04:10:47
4175	1444	3	1	1	04:10:47
4176	1445	3	9	5	16:13:44
4177	1446	1	7	5	09:31:37
4178	1446	4	3	1	15:07:21
4179	1446	4	5	1	16:42:07
4180	1447	1	7	5	09:59:10
4181	1447	1	3	2	04:41:31
4182	1447	1	1	2	04:41:31
4183	1448	1	9	5	15:33:13
4184	1448	1	3	4	08:04:21
4185	1448	1	1	4	08:04:21
4186	1448	1	2	4	08:04:21
4187	1449	1	9	5	09:17:52
4188	1449	1	3	2	06:31:47
4189	1449	1	1	2	06:31:47
4190	1449	1	5	4	09:51:52
4191	1449	1	6	4	09:51:52
4192	1450	1	9	5	15:15:25
4193	1450	1	3	2	13:32:09
4194	1450	1	1	2	13:32:09
4195	1451	1	7	5	10:58:18
4196	1451	1	2	4	18:12:53
4197	1452	2	9	5	09:13:21
4198	1452	2	3	3	04:41:35
4199	1452	2	4	4	12:19:44
4200	1452	2	8	3	10:18:43
4201	1453	1	7	5	18:02:21
4202	1453	1	3	3	16:17:37
4203	1453	1	5	3	17:28:09
4204	1454	1	9	5	16:44:43
4205	1454	4	3	1	10:49:27
4206	1454	4	1	1	10:49:27
4207	1455	3	9	5	11:02:15
4208	1455	3	3	1	11:01:42
4209	1455	3	2	1	11:01:42
4210	1456	3	9	5	10:57:28
4211	1456	3	3	3	10:50:32
4212	1456	3	2	3	10:50:32
4213	1457	4	7	5	09:37:12
4214	1457	4	3	4	07:33:11
4215	1457	4	1	4	07:33:11
4216	1457	4	2	4	07:33:11
4217	1458	1	7	5	11:55:27
4218	1458	1	3	2	04:07:43
4219	1459	1	9	5	09:22:11
4220	1459	1	3	2	17:58:29
4221	1459	1	1	2	17:58:29
4222	1459	1	2	2	17:58:29
4223	1460	1	9	5	14:21:08
4224	1460	4	3	1	07:41:24
4225	1460	4	1	1	07:41:24
4226	1461	1	9	5	09:14:28
4227	1461	1	4	4	17:46:15
4228	1462	3	7	5	09:42:04
4229	1462	3	1	3	03:37:10
4230	1462	3	5	4	11:58:25
4231	1462	3	6	4	11:58:25
4232	1463	2	7	5	16:23:41
4233	1463	2	3	3	10:17:42
4234	1463	2	2	3	10:17:42
4235	1464	2	7	5	11:24:27
4236	1464	2	3	4	15:58:08
4237	1465	3	9	5	09:28:28
4238	1465	3	3	3	16:27:45
4239	1466	2	7	5	16:26:31
4240	1466	2	3	1	04:25:49
4241	1466	2	1	1	04:25:49
4242	1466	2	2	1	04:25:49
4243	1466	2	8	3	15:40:57
4244	1467	2	7	5	16:45:20
4245	1467	2	3	2	09:11:57
4246	1467	2	6	3	11:03:22
4247	1468	2	9	5	11:30:53
4248	1468	2	3	3	16:33:56
4249	1468	2	1	3	16:33:56
4250	1469	1	7	5	16:45:04
4251	1469	1	3	1	09:24:22
4252	1469	1	1	1	09:24:22
4253	1469	1	2	1	09:24:22
4254	1469	1	4	2	16:36:21
4255	1469	1	5	2	16:36:21
4256	1470	4	9	5	16:11:21
4257	1470	4	3	3	11:28:07
4258	1470	4	1	3	11:28:07
4259	1470	4	4	3	16:07:15
4260	1471	2	9	5	18:29:28
4261	1471	2	3	3	15:32:58
4262	1471	2	2	3	15:32:58
4263	1471	3	4	1	13:47:45
4264	1471	3	5	1	13:47:45
4265	1471	3	6	1	13:47:45
4266	1472	1	7	5	17:03:16
4267	1472	4	3	1	06:32:49
4268	1472	4	2	1	06:32:49
4269	1472	4	5	3	09:22:12
4270	1473	1	9	5	14:47:45
4271	1473	1	3	3	08:43:57
4272	1473	1	1	3	08:43:57
4273	1473	1	2	3	08:43:57
4274	1473	3	4	1	09:20:01
4275	1474	1	9	5	09:40:51
4276	1475	3	9	5	09:21:26
4277	1475	3	1	1	09:03:48
4278	1476	2	9	5	14:24:16
4279	1476	2	3	2	07:05:03
4280	1476	2	1	2	07:05:03
4281	1476	2	5	3	16:24:07
4282	1476	2	8	3	10:10:46
4283	1477	2	9	5	18:06:02
4284	1478	2	9	5	18:11:33
4285	1478	2	3	3	12:32:11
4286	1478	2	1	3	12:32:11
4287	1478	2	2	3	12:32:11
4288	1478	2	8	4	12:52:25
4289	1479	1	9	5	09:23:50
4290	1479	1	3	4	09:42:42
4291	1480	1	7	5	11:18:09
4292	1480	1	3	2	08:16:25
4293	1480	1	5	2	14:45:09
4294	1480	1	6	2	14:45:09
4295	1481	2	9	5	09:37:29
4296	1481	2	3	2	08:17:45
4297	1481	2	1	2	08:17:45
4298	1482	1	7	5	15:48:50
4299	1483	3	9	5	09:12:07
4300	1483	3	3	3	10:42:14
4301	1483	3	1	3	10:42:14
4302	1484	2	9	5	12:27:25
4303	1485	3	9	5	15:40:39
4304	1485	3	3	3	05:50:03
4305	1485	3	1	3	05:50:03
4306	1485	3	4	2	17:40:02
4307	1485	3	8	3	13:54:46
4308	1486	1	7	5	09:54:06
4309	1486	1	3	3	06:50:57
4310	1486	1	2	3	06:50:57
4311	1487	1	7	5	09:20:07
4312	1487	4	3	1	09:34:38
4313	1487	4	1	1	09:34:38
4314	1487	4	2	1	09:34:38
4315	1488	3	9	5	15:11:32
4316	1488	3	3	1	18:46:28
4317	1488	3	1	1	18:46:28
4318	1488	3	5	4	13:44:53
4319	1488	3	6	4	13:44:53
4320	1489	1	7	5	16:23:33
4321	1489	1	3	2	13:16:19
4322	1489	1	2	2	13:16:19
4323	1490	1	7	5	16:51:27
4324	1490	1	3	2	10:29:35
4325	1490	1	5	3	13:04:47
4326	1491	2	9	5	09:12:48
4327	1491	2	3	2	11:22:29
4328	1491	2	6	3	11:02:08
4329	1492	3	7	5	09:59:26
4330	1492	3	3	3	05:00:37
4331	1492	3	1	3	05:00:37
4332	1493	2	7	5	17:24:52
4333	1493	2	6	4	12:24:14
4334	1494	3	9	5	09:09:55
4335	1494	3	3	3	04:47:31
4336	1494	3	1	3	04:47:31
4337	1494	3	2	3	04:47:31
4338	1494	3	6	4	15:11:59
4339	1494	3	8	3	17:23:19
4340	1495	1	9	5	15:26:57
4341	1495	4	3	1	11:33:27
4342	1495	4	1	1	11:33:27
4343	1495	4	2	1	11:33:27
4344	1495	4	8	4	15:32:15
4345	1496	2	7	5	16:46:15
4346	1496	2	3	3	07:12:32
4347	1496	2	2	3	07:12:32
4348	1497	1	9	5	12:03:50
4349	1498	2	9	5	13:41:37
4350	1498	2	3	2	07:24:30
4351	1498	2	4	3	17:47:49
4352	1498	2	5	3	17:47:49
4353	1498	2	6	3	17:47:49
4354	1499	1	7	5	09:46:50
4355	1500	4	9	5	17:05:20
4356	1501	2	9	5	09:30:43
4357	1501	3	3	1	15:54:35
4358	1501	3	1	1	15:54:35
4359	1502	4	7	5	09:43:17
4360	1502	4	3	1	16:32:11
4361	1502	4	2	1	16:32:11
4362	1503	3	7	5	13:04:56
4363	1503	3	3	1	04:05:34
4364	1503	3	2	1	04:05:34
4365	1504	4	9	5	11:50:02
4366	1505	1	9	5	09:54:06
4367	1505	1	3	3	10:20:00
4368	1505	1	1	3	10:20:00
4369	1505	1	4	4	13:07:01
4370	1506	2	9	5	18:17:10
4371	1506	3	3	1	08:02:17
4372	1506	3	1	1	08:02:17
4373	1507	1	9	5	09:17:40
4374	1507	1	3	4	05:23:36
4375	1508	3	7	5	15:28:23
4376	1508	3	3	4	10:36:43
4377	1508	3	1	4	10:36:43
4378	1508	3	2	4	10:36:43
4379	1508	3	8	3	14:16:12
4380	1509	2	7	5	11:23:56
4381	1509	4	2	1	10:08:43
4382	1510	1	9	5	17:38:34
4383	1510	1	3	3	17:06:25
4384	1510	1	1	3	17:06:25
4385	1510	1	4	3	13:02:49
4386	1511	1	9	5	17:53:28
4387	1512	1	9	5	14:23:54
4388	1512	1	3	1	07:49:27
4389	1512	1	1	1	07:49:27
4390	1513	2	9	5	14:33:45
4391	1513	3	3	1	16:27:32
4392	1513	3	1	1	16:27:32
4393	1514	1	9	5	09:28:19
4394	1514	4	3	1	11:22:02
4395	1514	4	1	1	11:22:02
4396	1515	1	9	5	18:56:14
4397	1515	1	3	4	11:17:40
4398	1515	1	4	3	13:31:20
4399	1515	1	5	3	13:31:20
4400	1516	4	9	5	18:07:19
4401	1517	1	7	5	09:51:17
4402	1517	1	3	3	09:12:07
4403	1518	3	7	5	17:07:37
4404	1518	3	3	3	11:38:10
4405	1518	3	1	3	11:38:10
4406	1518	3	5	4	17:49:09
4407	1519	1	7	5	16:25:17
4408	1519	1	2	3	09:51:00
4409	1520	3	9	5	13:46:52
4410	1520	3	3	2	13:56:12
4411	1521	2	9	5	12:49:12
4412	1521	2	8	3	13:14:59
4413	1522	2	7	5	10:44:28
4414	1522	3	3	1	16:50:34
4415	1522	3	4	2	12:19:47
4416	1523	2	7	5	15:42:51
4417	1523	2	3	2	04:18:10
4418	1523	2	2	2	04:18:10
4419	1524	2	7	5	12:30:11
4420	1524	3	3	1	07:18:21
4421	1525	1	7	5	09:20:19
4422	1525	1	3	1	18:06:09
4423	1525	1	2	1	18:06:09
4424	1526	1	9	5	13:14:54
4425	1526	1	3	3	06:45:49
4426	1526	1	1	3	06:45:49
4427	1527	1	7	5	09:28:36
4428	1527	1	3	3	03:34:56
4429	1528	1	9	5	12:24:44
4430	1528	1	8	3	15:27:48
4431	1529	4	7	5	14:30:58
4432	1529	4	3	3	04:18:19
4433	1529	4	4	4	10:44:39
4434	1530	1	9	5	09:11:20
4435	1530	1	8	3	13:19:20
4436	1531	2	7	5	14:22:19
4437	1531	2	3	3	07:18:06
4438	1531	2	2	3	07:18:06
4439	1532	2	7	5	10:49:20
4440	1533	3	9	5	09:36:01
4441	1533	3	3	3	17:22:56
4442	1534	4	9	5	11:53:09
4443	1534	4	3	3	11:56:17
4444	1534	4	2	3	11:56:17
4445	1535	3	9	5	12:54:48
4446	1535	3	3	4	07:52:03
4447	1536	1	7	5	09:13:02
4448	1537	1	7	5	09:32:43
4449	1537	1	3	3	15:02:34
4450	1537	1	6	3	10:20:31
4451	1538	1	7	5	12:07:16
4452	1539	1	7	5	14:15:22
4453	1539	3	3	1	17:30:24
4454	1539	3	1	1	17:30:24
4455	1539	3	2	1	17:30:24
4456	1539	3	6	4	16:33:59
4457	1539	3	8	1	12:01:33
4458	1540	2	9	5	15:52:24
4459	1540	4	3	1	06:24:04
4460	1540	4	1	1	06:24:04
4461	1541	4	7	5	09:49:07
4462	1541	4	3	1	08:27:32
4463	1541	4	1	1	08:27:32
4464	1542	1	7	5	11:50:21
4465	1542	4	3	1	09:11:33
4466	1542	4	2	1	09:11:33
4467	1543	2	9	5	15:09:15
4468	1543	2	3	3	09:23:21
4469	1544	1	9	5	09:39:30
4470	1544	1	4	3	18:38:18
4471	1544	1	5	3	18:38:18
4472	1545	1	7	5	18:51:02
4473	1545	1	3	3	04:19:22
4474	1545	1	1	3	04:19:22
4475	1545	1	2	3	04:19:22
4476	1546	3	9	5	14:08:18
4477	1546	3	3	1	08:41:44
4478	1546	3	4	3	09:41:09
4479	1547	2	7	5	09:54:32
4480	1547	2	2	1	12:56:54
4481	1548	2	9	5	16:41:13
4482	1548	2	3	2	05:14:50
4483	1548	2	1	2	05:14:50
4484	1549	1	9	5	09:07:54
4485	1549	1	3	4	17:18:28
4486	1550	1	9	5	09:44:46
4487	1550	1	1	2	09:04:36
4488	1551	1	9	5	15:26:02
4489	1551	1	3	4	06:20:44
4490	1551	1	1	4	06:20:44
4491	1552	1	7	5	09:56:39
4492	1552	1	3	3	09:08:58
4493	1552	1	5	4	14:48:02
4494	1553	2	7	5	11:52:35
4495	1553	4	3	1	10:53:53
4496	1554	1	7	5	14:02:45
4497	1554	1	3	4	10:41:45
4498	1554	1	2	4	10:41:45
4499	1555	1	7	5	12:29:57
4500	1555	4	3	1	13:22:46
4501	1555	4	1	1	13:22:46
4502	1555	4	2	1	13:22:46
4503	1556	1	7	5	15:03:34
4504	1556	1	3	2	12:39:14
4505	1557	1	9	5	17:32:30
4506	1557	1	3	4	05:53:18
4507	1557	1	1	4	05:53:18
4508	1558	2	7	5	13:58:27
4509	1558	4	3	1	09:24:07
4510	1558	4	2	1	09:24:07
4511	1558	4	4	3	11:12:52
4512	1558	4	5	3	11:12:52
4513	1559	1	7	5	12:25:26
4514	1559	1	3	3	06:06:20
4515	1559	1	6	3	13:55:41
4516	1560	4	9	5	09:28:52
4517	1560	4	3	2	15:17:17
4518	1560	4	2	2	15:17:17
4519	1561	3	9	5	13:54:19
4520	1561	3	3	2	10:43:02
4521	1561	3	1	2	10:43:02
4522	1562	4	9	5	11:26:53
4523	1562	4	2	2	07:20:09
4524	1563	3	9	5	10:55:50
4525	1563	3	1	2	10:06:35
4526	1564	1	9	5	14:12:46
4527	1565	1	9	5	13:06:26
4528	1565	4	3	1	16:54:04
4529	1565	4	1	1	16:54:04
4530	1566	1	7	5	10:25:37
4531	1566	1	8	4	16:23:35
4532	1567	3	9	5	09:14:27
4533	1567	3	3	3	13:05:32
4534	1567	3	4	3	09:08:28
4535	1568	1	7	5	09:10:21
4536	1568	1	2	3	10:18:47
4537	1569	3	7	5	09:45:24
4538	1569	3	2	3	11:22:35
4539	1569	3	5	3	13:50:31
4540	1570	3	7	5	09:43:25
4541	1570	3	3	3	17:39:13
4542	1570	3	2	3	17:39:13
4543	1570	3	4	3	10:30:21
4544	1571	1	9	5	09:15:11
4545	1571	1	3	3	17:24:27
4546	1571	1	1	3	17:24:27
4547	1571	1	6	4	10:07:07
4548	1572	2	9	5	09:22:48
4549	1572	2	3	2	04:35:33
4550	1572	2	1	2	04:35:33
4551	1573	1	7	5	17:05:11
4552	1573	1	3	3	04:53:55
4553	1573	1	2	3	04:53:55
4554	1573	4	5	1	17:37:43
4555	1573	4	6	1	17:37:43
4556	1574	2	7	5	09:14:35
4557	1574	2	2	4	06:24:37
4558	1575	1	9	5	10:11:02
4559	1575	1	3	4	09:44:01
4560	1575	1	1	4	09:44:01
4561	1576	1	9	5	13:05:27
4562	1577	2	9	5	09:05:47
4563	1577	2	3	3	03:25:31
4564	1577	2	1	3	03:25:31
4565	1577	2	4	4	15:23:38
4566	1577	2	5	4	15:23:38
4567	1577	2	6	4	15:23:38
4568	1577	2	8	4	12:24:46
4569	1578	3	9	5	12:44:17
4570	1578	3	3	2	15:28:52
4571	1578	3	4	4	14:36:54
4572	1579	2	9	5	16:26:15
4573	1579	2	3	3	16:04:51
4574	1580	1	7	5	09:52:13
4575	1580	1	3	3	10:56:50
4576	1580	1	1	3	10:56:50
4577	1580	1	2	3	10:56:50
4578	1581	2	9	5	09:18:27
4579	1581	2	3	4	07:24:37
4580	1581	2	1	4	07:24:37
4581	1582	4	9	5	11:10:42
4582	1582	4	3	2	14:41:18
4583	1582	4	1	2	14:41:18
4584	1583	2	9	5	09:26:04
4585	1584	2	7	5	12:54:17
4586	1584	2	3	3	08:02:42
4587	1584	2	1	3	08:02:42
4588	1584	2	2	3	08:02:42
4589	1584	2	8	2	12:52:35
4590	1585	3	7	5	09:09:58
4591	1585	3	3	2	05:21:18
4592	1585	3	5	3	16:15:12
4593	1586	2	7	5	10:55:52
4594	1586	3	1	1	05:39:23
4595	1586	3	2	1	05:39:23
4596	1586	3	4	3	12:57:11
4597	1587	1	9	5	15:13:49
4598	1587	1	3	4	07:46:30
4599	1587	1	2	4	07:46:30
4600	1588	1	7	5	15:04:11
4601	1588	1	6	2	15:32:06
4602	1589	2	7	5	09:53:25
4603	1589	2	3	4	11:15:03
4604	1589	2	1	4	11:15:03
4605	1589	2	5	2	18:51:33
4606	1590	2	9	5	13:24:56
4607	1590	2	5	3	10:39:43
4608	1591	1	7	5	13:08:56
4609	1591	4	3	1	12:39:44
4610	1591	4	2	1	12:39:44
4611	1592	3	9	5	18:26:57
4612	1592	3	3	3	15:08:09
4613	1593	2	9	5	13:49:06
4614	1593	2	3	3	08:32:46
4615	1593	2	1	3	08:32:46
4616	1594	1	7	5	12:44:49
4617	1594	1	3	1	03:39:10
4618	1594	1	1	1	03:39:10
4619	1594	1	4	4	15:42:02
4620	1595	3	9	5	15:16:18
4621	1595	3	3	2	14:56:34
4622	1596	1	7	5	13:28:39
4623	1596	1	3	4	15:31:18
4624	1596	1	2	4	15:31:18
4625	1596	3	5	1	09:41:58
4626	1597	1	9	5	18:40:17
4627	1597	1	3	3	07:02:24
4628	1598	1	9	5	11:58:11
4629	1598	3	3	1	17:41:44
4630	1599	4	9	5	12:32:57
4631	1599	4	3	1	09:59:01
4632	1599	4	1	1	09:59:01
4633	1599	4	2	1	09:59:01
4634	1600	1	9	5	15:07:57
4635	1600	1	3	2	04:04:33
4636	1600	1	1	2	04:04:33
4637	1601	2	7	5	09:06:27
4638	1601	2	3	3	12:16:46
4639	1601	2	1	3	12:16:46
4640	1601	2	2	3	12:16:46
4641	1602	2	7	5	09:05:46
4642	1602	2	1	3	11:38:07
4643	1602	2	2	3	11:38:07
4644	1602	2	5	3	15:19:24
4645	1603	1	9	5	09:39:13
4646	1603	1	3	3	11:29:35
4647	1603	1	2	3	11:29:35
4648	1604	3	9	5	15:41:19
4649	1604	3	3	2	09:01:49
4650	1604	3	1	2	09:01:49
4651	1604	3	8	3	10:44:46
4652	1605	1	7	5	09:15:26
4653	1605	1	2	4	08:53:01
4654	1606	2	9	5	09:04:40
4655	1606	2	1	4	14:04:36
4656	1607	1	9	5	16:02:33
4657	1607	1	5	2	16:47:05
4658	1608	3	9	5	09:50:09
4659	1608	3	3	3	09:17:59
4660	1608	3	1	3	09:17:59
4661	1608	3	5	3	12:40:10
4662	1608	3	8	3	17:49:13
4663	1609	1	7	5	15:46:54
4664	1609	1	3	2	04:36:10
4665	1609	1	1	2	04:36:10
4666	1610	1	7	5	11:34:04
4667	1611	3	7	5	11:59:27
4668	1611	3	6	2	12:49:08
4669	1611	3	8	1	17:20:26
4670	1612	3	7	5	14:23:25
4671	1612	3	3	3	04:38:23
4672	1612	3	1	3	04:38:23
4673	1612	3	4	4	15:15:39
4674	1612	3	5	4	15:15:39
4675	1612	3	6	4	15:15:39
4676	1613	1	9	5	09:17:51
4677	1613	1	1	2	13:34:14
4678	1614	3	7	5	09:48:13
4679	1614	3	2	2	14:07:12
4680	1615	4	7	5	09:08:18
4681	1616	1	9	5	09:15:22
4682	1616	4	3	1	11:54:17
4683	1616	4	2	1	11:54:17
4684	1616	4	4	3	13:08:55
4685	1616	4	6	3	13:08:55
4686	1616	4	8	3	16:45:56
4687	1617	4	9	5	15:29:16
4688	1617	4	3	1	17:09:55
4689	1618	3	7	5	09:53:38
4690	1619	1	9	5	09:57:37
4691	1619	3	3	1	05:57:48
4692	1619	3	2	1	05:57:48
4693	1620	3	9	5	13:26:29
4694	1620	3	1	1	12:51:57
4695	1621	1	9	5	09:13:44
4696	1621	1	3	3	16:35:15
4697	1621	1	1	3	16:35:15
4698	1621	1	5	3	18:40:13
4699	1622	1	9	5	09:15:12
4700	1622	1	1	4	05:48:13
4701	1623	2	9	5	18:04:36
4702	1624	1	7	5	17:14:06
4703	1624	4	3	1	09:22:29
4704	1624	4	4	3	16:54:35
4705	1624	4	5	3	16:54:35
4706	1625	4	9	5	09:33:54
4707	1625	4	3	2	12:50:06
4708	1625	4	1	2	12:50:06
4709	1625	4	4	3	13:58:24
4710	1626	2	9	5	09:48:42
4711	1626	2	3	3	13:17:11
4712	1626	2	1	3	13:17:11
4713	1627	3	7	5	09:09:56
4714	1627	3	1	2	05:31:56
4715	1627	3	2	2	05:31:56
4716	1628	2	9	5	15:19:38
4717	1628	2	3	2	04:22:59
4718	1628	2	1	2	04:22:59
4719	1629	2	7	5	17:41:51
4720	1629	2	3	2	15:21:36
4721	1629	2	1	2	15:21:36
4722	1629	2	2	2	15:21:36
4723	1630	2	7	5	09:32:42
4724	1630	2	3	3	05:12:49
4725	1630	2	5	3	14:30:57
4726	1630	2	6	3	14:30:57
4727	1631	1	9	5	11:54:09
4728	1632	2	7	5	09:50:51
4729	1632	3	3	1	05:52:44
4730	1632	3	2	1	05:52:44
4731	1633	4	7	5	13:00:59
4732	1633	4	3	4	18:47:02
4733	1633	4	2	4	18:47:02
4734	1633	4	4	4	11:35:37
4735	1633	4	6	4	11:35:37
4736	1634	1	9	5	09:13:17
4737	1634	1	3	2	12:12:07
4738	1634	1	1	2	12:12:07
4739	1635	2	9	5	09:02:17
4740	1636	2	9	5	09:34:53
4741	1636	2	3	4	04:14:16
4742	1636	2	1	4	04:14:16
4743	1636	2	2	4	04:14:16
4744	1636	2	5	3	11:30:19
4745	1637	4	9	5	09:15:37
4746	1637	4	3	4	04:24:45
4747	1637	4	6	1	12:12:27
4748	1638	3	7	5	11:15:03
4749	1638	3	3	1	13:07:42
4750	1638	3	1	1	13:07:42
4751	1638	3	6	3	11:52:22
4752	1639	4	9	5	13:02:43
4753	1639	4	3	3	07:40:30
4754	1639	4	1	3	07:40:30
4755	1640	1	7	5	09:16:16
4756	1640	1	6	4	14:30:31
4757	1641	1	9	5	16:16:57
4758	1641	1	3	4	03:37:06
4759	1641	1	8	3	10:50:14
4760	1642	1	9	5	16:50:30
4761	1642	3	3	1	05:06:14
4762	1643	3	9	5	11:48:54
4763	1643	3	3	3	05:10:51
4764	1643	3	1	3	05:10:51
4765	1644	3	9	5	09:40:43
4766	1644	3	3	3	10:54:28
4767	1644	3	1	3	10:54:28
4768	1644	3	6	4	14:20:19
4769	1645	2	9	5	09:49:36
4770	1646	2	7	5	09:40:54
4771	1647	4	7	5	10:05:17
4772	1647	4	3	4	10:35:55
4773	1648	3	7	5	15:37:15
4774	1648	3	3	2	04:22:47
4775	1648	3	1	2	04:22:47
4776	1648	3	6	4	13:08:25
4777	1648	3	8	3	11:04:22
4778	1649	1	7	5	16:17:27
4779	1649	1	3	1	13:52:06
4780	1649	1	2	1	13:52:06
4781	1649	1	5	2	16:49:07
4782	1649	1	8	4	14:49:25
4783	1650	1	9	5	16:47:50
4784	1650	1	1	3	06:51:25
4785	1651	1	9	5	09:07:33
4786	1651	4	3	1	10:44:29
4787	1651	4	1	1	10:44:29
4788	1651	4	2	1	10:44:29
4789	1651	4	4	3	11:39:14
4790	1652	3	7	5	14:00:08
4791	1652	3	1	4	09:32:13
4792	1652	3	8	4	15:48:05
4793	1653	1	9	5	09:32:46
4794	1653	1	3	2	17:38:38
4795	1653	1	1	2	17:38:38
4796	1653	1	4	2	17:24:50
4797	1653	1	6	2	17:24:50
4798	1654	4	9	5	09:40:38
4799	1654	4	1	3	16:05:33
4800	1655	1	7	5	13:21:22
4801	1655	1	3	4	16:58:40
4802	1655	1	2	4	16:58:40
4803	1656	3	9	5	09:20:04
4804	1656	3	3	4	11:35:34
4805	1656	3	1	4	11:35:34
4806	1657	2	9	5	11:46:45
4807	1657	3	3	1	04:29:44
4808	1658	1	9	5	14:19:07
4809	1658	1	3	3	10:53:55
4810	1658	1	1	3	10:53:55
4811	1658	1	2	3	10:53:55
4812	1659	2	9	5	14:31:40
4813	1659	2	3	3	03:18:00
4814	1659	2	1	3	03:18:00
4815	1659	2	2	3	03:18:00
4816	1660	3	9	5	13:34:37
4817	1660	3	3	2	13:20:16
4818	1660	3	5	2	09:25:45
4819	1661	2	7	5	09:13:40
4820	1661	4	1	1	09:43:48
4821	1661	4	2	1	09:43:48
4822	1661	4	8	3	14:43:14
4823	1662	1	7	5	17:11:25
4824	1662	4	3	1	06:04:55
4825	1663	1	7	5	17:54:23
4826	1664	2	9	5	09:32:46
4827	1664	2	3	3	08:39:17
4828	1664	2	4	3	10:41:45
4829	1665	1	9	5	09:45:33
4830	1666	4	7	5	09:17:50
4831	1666	4	3	2	15:08:45
4832	1666	4	1	2	15:08:45
4833	1666	4	2	2	15:08:45
4834	1666	4	4	3	17:03:12
4835	1666	4	6	3	17:03:12
4836	1667	3	9	5	09:27:39
4837	1667	3	3	1	05:47:23
4838	1667	3	1	1	05:47:23
4839	1668	2	9	5	14:48:47
4840	1668	2	1	3	05:50:59
4841	1669	2	7	5	10:32:22
4842	1669	2	2	2	08:06:28
4843	1669	2	5	4	13:47:12
4844	1669	2	6	4	13:47:12
4845	1669	2	8	1	12:44:14
4846	1670	1	7	5	17:47:23
4847	1670	4	3	1	10:08:29
4848	1670	4	1	1	10:08:29
4849	1670	4	2	1	10:08:29
4850	1671	1	9	5	15:54:51
4851	1671	1	1	2	17:22:03
4852	1671	1	5	4	18:40:24
4853	1672	2	9	5	16:17:46
4854	1673	2	9	5	11:47:52
4855	1673	3	3	1	11:11:12
4856	1673	3	1	1	11:11:12
4857	1674	2	7	5	11:20:01
4858	1674	4	3	1	12:41:11
4859	1674	4	2	1	12:41:11
4860	1674	4	4	3	14:53:54
4861	1674	4	5	3	14:53:54
4862	1675	2	9	5	09:13:22
4863	1675	2	1	3	08:43:42
4864	1676	2	7	5	14:08:39
4865	1676	2	3	3	09:09:47
4866	1676	2	2	3	09:09:47
4867	1677	1	9	5	09:31:52
4868	1677	3	3	1	10:24:36
4869	1678	1	9	5	09:43:09
4870	1678	1	3	3	10:45:14
4871	1679	2	9	5	09:49:10
4872	1679	2	3	3	08:34:38
4873	1680	1	9	5	09:23:38
4874	1680	1	3	2	04:50:00
4875	1681	4	9	5	14:25:41
4876	1681	4	3	3	14:55:14
4877	1681	4	2	3	14:55:14
4878	1681	4	4	4	11:57:36
4879	1681	4	6	4	11:57:36
4880	1682	3	7	5	09:09:49
4881	1682	3	3	3	08:57:23
4882	1682	3	1	3	08:57:23
4883	1682	3	8	4	15:52:45
4884	1683	1	9	5	09:35:50
4885	1684	2	9	5	09:28:40
4886	1684	2	3	2	04:24:32
4887	1684	2	1	2	04:24:32
4888	1684	2	4	2	12:55:16
4889	1684	2	6	2	12:55:16
4890	1685	1	7	5	09:04:32
4891	1685	3	2	1	15:52:42
4892	1686	2	7	5	09:13:03
4893	1686	2	3	4	14:14:15
4894	1686	2	1	4	14:14:15
4895	1686	2	2	4	14:14:15
4896	1687	2	9	5	09:50:22
4897	1687	2	3	3	07:57:33
4898	1687	2	1	3	07:57:33
4899	1688	2	9	5	09:35:43
4900	1688	2	3	3	04:22:26
4901	1688	2	1	3	04:22:26
4902	1688	2	5	4	14:17:23
4903	1688	2	8	1	13:45:24
4904	1689	3	9	5	09:28:36
4905	1689	3	3	3	13:34:37
4906	1689	3	2	3	13:34:37
4907	1690	4	9	5	16:50:15
4908	1690	4	3	3	11:17:09
4909	1690	4	1	3	11:17:09
4910	1690	4	6	4	16:23:09
4911	1691	2	7	5	09:48:14
4912	1691	2	3	3	17:51:34
4913	1692	1	9	5	13:48:34
4914	1692	3	3	1	04:38:58
4915	1693	2	7	5	10:15:10
4916	1693	2	2	3	10:04:30
4917	1693	2	4	3	16:01:21
4918	1693	2	5	3	16:01:21
4919	1694	1	9	5	09:40:43
4920	1694	4	1	1	11:02:10
4921	1694	4	2	1	11:02:10
4922	1695	2	7	5	11:37:49
4923	1696	4	9	5	17:16:01
4924	1696	4	3	2	08:10:35
4925	1696	4	1	2	08:10:35
4926	1697	2	9	5	16:30:50
4927	1698	1	9	5	17:21:38
4928	1699	1	9	5	12:58:04
4929	1700	1	9	5	18:36:46
4930	1700	1	3	3	09:30:29
4931	1701	3	9	5	17:05:06
4932	1701	3	3	3	12:21:11
4933	1701	3	8	4	15:25:39
4934	1702	4	7	5	09:14:12
4935	1702	4	1	3	10:32:23
4936	1702	4	2	3	10:32:23
4937	1703	4	9	5	15:32:39
4938	1703	4	3	2	05:45:52
4939	1703	4	1	2	05:45:52
4940	1704	3	7	5	18:13:51
4941	1704	3	3	2	09:12:49
4942	1704	3	1	2	09:12:49
4943	1704	3	2	2	09:12:49
4944	1704	3	5	4	10:24:47
4945	1705	1	7	5	09:43:59
4946	1706	3	7	5	11:33:11
4947	1706	3	6	2	12:09:16
4948	1707	3	9	5	15:17:01
4949	1707	3	4	4	17:11:41
4950	1707	3	5	4	17:11:41
4951	1708	2	9	5	16:49:10
4952	1708	4	3	1	16:47:25
4953	1708	4	1	1	16:47:25
4954	1709	3	7	5	18:38:03
4955	1709	3	3	2	11:07:20
4956	1710	1	7	5	16:35:50
4957	1710	4	3	1	09:43:49
4958	1711	4	7	5	17:46:34
4959	1711	4	3	2	09:55:26
4960	1711	4	2	2	09:55:26
4961	1712	2	9	5	09:50:47
4962	1712	2	3	2	09:25:38
4963	1712	2	1	2	09:25:38
4964	1712	2	6	4	10:48:25
4965	1713	1	9	5	09:15:28
4966	1713	1	3	2	09:04:10
4967	1713	1	1	2	09:04:10
4968	1713	1	6	4	15:20:15
4969	1713	1	8	1	10:28:33
4970	1714	1	7	5	12:48:07
4971	1714	4	3	1	14:58:01
4972	1715	4	7	5	09:27:07
4973	1715	4	2	3	17:01:24
4974	1716	3	9	5	09:27:51
4975	1716	3	6	4	11:00:50
4976	1717	1	9	5	13:54:14
4977	1717	1	3	2	18:47:33
4978	1717	1	1	2	18:47:33
4979	1718	2	7	5	09:20:57
4980	1718	2	3	2	10:35:51
4981	1718	2	1	2	10:35:51
4982	1718	2	2	2	10:35:51
4983	1719	4	9	5	09:14:39
4984	1719	4	3	2	10:32:05
4985	1719	4	2	2	10:32:05
4986	1719	4	4	4	12:04:38
4987	1719	4	5	4	12:04:38
4988	1719	4	6	4	12:04:38
4989	1719	4	8	2	16:41:14
4990	1720	1	7	5	14:42:18
4991	1721	2	9	5	14:29:39
4992	1721	2	3	2	09:22:17
4993	1721	2	1	2	09:22:17
4994	1722	1	9	5	09:12:25
4995	1722	1	3	3	09:39:54
4996	1723	3	9	5	10:30:55
4997	1723	3	1	2	13:56:10
4998	1724	2	7	5	16:12:01
4999	1725	3	9	5	14:41:24
5000	1725	3	1	4	13:36:20
5001	1725	3	4	2	18:25:54
5002	1726	1	7	5	09:27:19
5003	1726	1	5	4	17:57:20
5004	1726	1	6	4	17:57:20
5005	1727	1	9	5	09:45:38
5006	1728	2	7	5	11:28:08
5007	1729	2	9	5	13:45:28
5008	1729	2	3	2	09:35:35
5009	1729	2	1	2	09:35:35
5010	1730	1	9	5	09:56:57
5011	1730	1	3	3	15:42:29
5012	1731	1	9	5	12:08:40
5013	1731	1	3	1	12:57:03
5014	1731	1	1	1	12:57:03
5015	1732	1	9	5	16:43:28
5016	1733	2	7	5	09:32:34
5017	1733	2	3	3	16:17:20
5018	1733	2	2	3	16:17:20
5019	1734	1	9	5	09:41:27
5020	1734	1	3	3	07:55:15
5021	1734	1	1	3	07:55:15
5022	1735	4	9	5	09:05:49
5023	1735	4	3	1	17:30:40
5024	1736	4	9	5	09:41:20
5025	1736	4	1	1	08:40:02
5026	1736	4	6	4	14:38:44
5027	1737	3	7	5	09:46:02
5028	1737	3	1	4	14:01:35
5029	1737	3	4	4	16:49:05
5030	1738	1	9	5	09:02:26
5031	1739	3	7	5	15:57:56
5032	1739	3	3	1	16:28:24
5033	1739	3	5	3	13:59:35
5034	1740	1	9	5	09:40:23
5035	1740	1	3	3	08:47:53
5036	1740	1	1	3	08:47:53
5037	1741	1	7	5	12:49:29
5038	1742	1	7	5	11:18:20
5039	1742	1	3	4	15:03:41
5040	1742	1	1	4	15:03:41
5041	1742	1	4	2	12:41:09
5042	1743	2	9	5	14:13:58
5043	1743	2	3	3	04:20:15
5044	1744	1	7	5	09:30:07
5045	1744	4	3	1	14:35:41
5046	1744	4	2	1	14:35:41
5047	1744	4	5	4	10:17:31
5048	1744	4	6	4	10:17:31
5049	1745	1	7	5	17:08:01
5050	1745	1	3	4	10:08:05
5051	1745	1	1	4	10:08:05
5052	1745	1	2	4	10:08:05
5053	1745	1	5	2	15:56:07
5054	1745	1	6	2	15:56:07
5055	1746	1	7	5	12:56:18
5056	1746	1	3	4	08:02:22
5057	1746	1	2	4	08:02:22
5058	1747	2	9	5	09:50:16
5059	1747	4	3	1	11:55:30
5060	1747	4	2	1	11:55:30
5061	1748	1	7	5	16:06:04
5062	1748	1	3	3	08:10:35
5063	1748	1	2	3	08:10:35
5064	1748	1	4	3	14:22:16
5065	1749	2	9	5	15:31:34
5066	1749	3	3	1	10:24:38
5067	1749	3	1	1	10:24:38
5068	1749	3	4	3	17:05:47
5069	1749	3	5	3	17:05:47
5070	1749	3	8	3	16:13:42
5071	1750	1	9	5	12:20:44
5072	1750	1	3	3	10:06:47
5073	1750	1	1	3	10:06:47
5074	1750	1	2	3	10:06:47
5075	1750	1	8	3	10:46:56
5076	1751	3	7	5	09:38:45
5077	1751	3	3	4	07:18:38
5078	1751	3	2	4	07:18:38
5079	1751	3	6	4	13:39:27
5080	1752	1	9	5	12:10:10
5081	1752	3	3	1	08:04:19
5082	1752	3	1	1	08:04:19
5083	1752	3	2	1	08:04:19
5084	1753	1	9	5	09:27:32
5085	1753	1	3	3	17:51:23
5086	1754	2	9	5	16:31:50
5087	1755	1	9	5	09:54:02
5088	1755	1	3	2	04:45:50
5089	1755	1	1	2	04:45:50
5090	1755	1	4	3	13:18:54
5091	1755	1	6	3	13:18:54
5092	1756	1	9	5	15:28:42
5093	1757	3	9	5	09:47:44
5094	1757	3	1	2	05:55:58
5095	1757	3	2	2	05:55:58
5096	1758	3	9	5	09:40:17
5097	1758	3	3	3	09:56:14
5098	1758	3	1	3	09:56:14
5099	1758	3	8	3	10:12:22
5100	1759	4	9	5	09:01:19
5101	1759	4	3	4	11:22:17
5102	1759	4	1	4	11:22:17
5103	1759	4	2	4	11:22:17
5104	1760	2	7	5	14:24:41
5105	1760	2	3	3	03:18:04
5106	1760	2	1	3	03:18:04
5107	1761	1	9	5	12:07:52
5108	1762	1	9	5	09:05:25
5109	1762	1	6	3	13:28:16
5110	1763	3	7	5	16:56:42
5111	1763	3	2	1	12:13:08
5112	1763	3	4	4	16:49:07
5113	1763	3	6	4	16:49:07
5114	1764	4	7	5	09:58:40
5115	1764	4	3	4	09:21:52
5116	1764	4	2	4	09:21:52
5117	1765	1	9	5	15:57:33
5118	1766	3	7	5	09:04:21
5119	1766	3	3	1	04:53:49
5120	1766	3	2	1	04:53:49
5121	1766	3	5	3	12:27:15
5122	1767	1	9	5	14:09:45
5123	1768	3	7	5	09:18:48
5124	1768	3	3	3	04:26:50
5125	1768	3	1	3	04:26:50
5126	1769	1	9	5	11:31:26
5127	1769	4	5	3	13:10:04
5128	1770	2	7	5	09:46:06
5129	1770	2	5	2	13:36:07
5130	1770	2	6	2	13:36:07
5131	1771	1	9	5	09:47:50
5132	1771	1	3	3	03:25:30
5133	1771	1	1	3	03:25:30
5134	1772	2	9	5	16:13:35
5135	1772	2	5	2	10:57:41
5136	1772	2	6	2	10:57:41
5137	1773	2	7	5	12:53:48
5138	1773	2	3	3	09:29:45
5139	1774	1	7	5	09:18:15
5140	1774	3	3	1	03:02:29
5141	1774	3	2	1	03:02:29
5142	1774	3	6	4	11:06:42
5143	1775	2	7	5	18:43:02
5144	1775	2	8	2	17:38:53
5145	1776	2	9	5	09:14:30
5146	1777	2	7	5	09:13:11
5147	1778	1	7	5	11:21:41
5148	1778	3	3	1	13:48:44
5149	1778	3	1	1	13:48:44
5150	1778	3	2	1	13:48:44
5151	1778	3	6	3	12:18:55
5152	1779	2	7	5	15:25:59
5153	1779	2	3	3	07:36:08
5154	1779	2	1	3	07:36:08
5155	1779	2	2	3	07:36:08
5156	1780	1	7	5	09:01:21
5157	1780	1	3	2	07:48:35
5158	1780	1	1	2	07:48:35
5159	1780	1	2	2	07:48:35
5160	1780	1	5	2	13:32:16
5161	1781	2	7	5	13:12:19
5162	1782	4	9	5	13:35:42
5163	1782	4	3	2	04:07:11
5164	1782	4	5	1	15:42:52
5165	1783	1	9	5	16:40:22
5166	1784	1	9	5	17:03:56
5167	1784	1	1	3	03:55:20
5168	1784	1	4	4	14:23:58
5169	1785	1	7	5	13:10:54
5170	1786	2	7	5	11:09:33
5171	1786	2	6	4	11:34:03
5172	1787	1	9	5	14:02:51
5173	1787	1	3	3	11:37:01
5174	1787	1	1	3	11:37:01
5175	1787	1	2	3	11:37:01
5176	1787	1	8	3	14:35:49
5177	1788	3	9	5	09:35:24
5178	1788	3	3	1	15:24:17
5179	1789	1	7	5	13:51:02
5180	1789	1	3	3	10:28:57
5181	1789	1	2	3	10:28:57
5182	1790	1	9	5	09:07:50
5183	1790	1	6	3	17:13:51
5184	1791	1	9	5	15:11:16
5185	1791	1	4	2	15:49:22
5186	1792	3	9	5	09:37:29
5187	1792	3	3	2	09:07:26
5188	1792	3	1	2	09:07:26
5189	1792	3	4	4	14:35:03
5190	1793	2	7	5	10:45:02
5191	1794	1	9	5	09:02:20
5192	1794	1	3	3	05:08:07
5193	1794	1	1	3	05:08:07
5194	1795	3	7	5	17:33:10
5195	1795	3	3	3	06:03:24
5196	1795	3	1	3	06:03:24
5197	1795	3	2	3	06:03:24
5198	1796	1	7	5	09:03:40
5199	1796	1	3	2	14:10:45
5200	1796	1	2	2	14:10:45
5201	1797	4	9	5	12:31:08
5202	1798	2	7	5	11:38:40
5203	1798	2	3	2	11:02:30
5204	1799	2	9	5	09:16:31
5205	1799	2	3	2	06:58:01
5206	1799	2	1	2	06:58:01
5207	1800	3	7	5	09:34:20
5208	1800	3	3	4	04:03:59
5209	1800	3	1	4	04:03:59
5210	1800	3	2	4	04:03:59
5211	1801	2	7	5	12:44:55
5212	1801	2	3	2	07:23:50
5213	1801	2	1	2	07:23:50
5214	1801	2	2	2	07:23:50
5215	1801	2	6	4	10:16:46
5216	1802	2	7	5	12:01:41
5217	1802	2	3	4	10:56:00
5218	1802	2	2	4	10:56:00
5219	1802	2	8	4	18:50:40
5220	1803	3	7	5	13:57:01
5221	1803	3	3	2	15:52:19
5222	1803	3	2	2	15:52:19
5223	1803	3	5	3	16:28:29
5224	1804	1	9	5	16:15:13
5225	1805	1	9	5	13:47:43
5226	1805	1	3	3	10:15:05
5227	1806	3	9	5	18:00:44
5228	1806	3	3	3	05:56:43
5229	1806	3	1	3	05:56:43
5230	1806	3	8	2	12:14:47
5231	1807	2	7	5	09:08:13
5232	1807	2	3	2	08:47:49
5233	1807	2	2	2	08:47:49
5234	1808	1	7	5	09:40:20
5235	1808	3	3	1	07:36:39
5236	1809	3	7	5	09:40:15
5237	1809	3	3	1	14:07:48
5238	1809	3	2	1	14:07:48
5239	1809	3	5	3	15:45:42
5240	1809	3	8	2	17:14:26
5241	1810	2	9	5	09:57:44
5242	1810	2	3	3	17:05:15
5243	1810	2	4	4	18:45:08
5244	1811	3	9	5	09:00:54
5245	1812	1	9	5	17:47:44
5246	1812	1	3	3	15:07:02
5247	1812	1	1	3	15:07:02
5248	1812	3	5	1	12:44:41
5249	1812	3	6	1	12:44:41
5250	1813	3	7	5	09:49:52
5251	1813	3	3	4	16:08:06
5252	1813	3	1	4	16:08:06
5253	1813	3	2	4	16:08:06
5254	1814	2	9	5	18:12:20
5255	1814	2	4	3	18:42:35
5256	1815	2	7	5	15:09:51
5257	1815	3	3	1	17:51:14
5258	1815	3	1	1	17:51:14
5259	1816	3	7	5	09:31:33
5260	1816	3	4	1	17:07:47
5261	1816	3	5	1	17:07:47
5262	1817	3	9	5	15:58:44
5263	1817	3	5	4	11:45:12
5264	1817	3	8	2	13:51:26
5265	1818	1	7	5	13:24:35
5266	1818	1	3	2	11:55:08
5267	1818	1	2	2	11:55:08
5268	1818	1	5	2	15:27:45
5269	1818	1	6	2	15:27:45
5270	1819	1	7	5	09:14:05
5271	1819	1	3	3	12:01:29
5272	1819	1	1	3	12:01:29
5273	1819	1	2	3	12:01:29
5274	1819	1	5	3	09:46:36
5275	1820	1	9	5	17:38:03
5276	1820	1	3	3	03:44:09
5277	1821	3	9	5	11:04:09
5278	1821	3	1	1	04:48:07
5279	1822	3	7	5	09:32:57
5280	1822	3	3	2	04:21:46
5281	1822	3	1	2	04:21:46
5282	1822	3	2	2	04:21:46
5283	1823	3	9	5	09:29:38
5284	1823	3	3	4	08:43:16
5285	1824	4	9	5	16:39:03
5286	1824	4	3	3	14:42:00
5287	1825	1	9	5	09:16:56
5288	1825	1	1	2	05:22:53
5289	1826	1	7	5	10:48:46
5290	1826	1	1	2	06:02:32
5291	1827	2	7	5	17:44:52
5292	1827	4	3	1	17:11:15
5293	1827	4	1	1	17:11:15
5294	1828	3	7	5	13:52:49
5295	1828	3	3	3	11:48:30
5296	1828	3	2	3	11:48:30
5297	1828	3	6	4	13:14:23
5298	1829	1	7	5	11:55:56
5299	1829	1	3	3	04:54:54
5300	1830	1	7	5	09:38:33
5301	1830	1	1	3	10:56:31
5302	1830	1	2	3	10:56:31
5303	1831	1	9	5	16:19:25
5304	1831	1	3	2	12:38:33
5305	1832	2	7	5	15:53:13
5306	1832	4	3	1	08:04:12
5307	1832	4	2	1	08:04:12
5308	1833	1	9	5	09:55:11
5309	1834	1	7	5	13:55:42
5310	1834	1	3	3	07:08:33
5311	1834	1	1	3	07:08:33
5312	1834	1	2	3	07:08:33
5313	1834	1	4	3	10:54:38
5314	1835	3	9	5	16:48:30
5315	1835	3	3	1	14:09:09
5316	1835	3	1	1	14:09:09
5317	1835	3	2	1	14:09:09
5318	1836	1	7	5	16:12:53
5319	1837	3	9	5	09:48:01
5320	1837	3	3	3	13:45:45
5321	1837	3	2	3	13:45:45
5322	1837	3	8	3	15:02:25
5323	1838	1	9	5	17:13:25
5324	1838	1	4	3	10:53:10
5325	1839	2	9	5	11:14:08
5326	1840	2	7	5	14:48:49
5327	1840	2	3	2	04:33:29
5328	1840	2	2	2	04:33:29
5329	1840	2	4	3	11:53:52
5330	1840	2	5	3	11:53:52
5331	1840	2	6	3	11:53:52
5332	1841	1	9	5	09:35:43
5333	1841	1	2	2	18:25:24
5334	1842	3	9	5	09:27:07
5335	1842	3	3	1	05:56:45
5336	1842	3	1	1	05:56:45
5337	1843	1	9	5	15:56:51
5338	1843	1	3	2	07:15:28
5339	1844	1	9	5	14:32:11
5340	1845	3	9	5	12:16:50
5341	1845	3	3	1	08:42:01
5342	1846	3	7	5	11:37:37
5343	1847	3	7	5	13:51:45
5344	1847	3	3	1	06:03:43
5345	1847	3	2	1	06:03:43
5346	1848	1	9	5	14:11:28
5347	1849	1	9	5	09:15:54
5348	1849	4	3	1	14:51:18
5349	1850	1	7	5	09:56:01
5350	1850	1	3	3	09:43:54
5351	1850	1	1	3	09:43:54
5352	1850	1	2	3	09:43:54
5353	1851	4	9	5	13:45:20
5354	1851	4	3	3	08:37:20
5355	1851	4	1	3	08:37:20
5356	1851	4	2	3	08:37:20
5357	1852	3	9	5	11:37:52
5358	1853	2	7	5	09:53:20
5359	1853	2	3	3	08:23:11
5360	1853	2	2	3	08:23:11
5361	1854	2	9	5	17:57:41
5362	1854	2	3	4	17:28:19
5363	1855	2	9	5	09:52:04
5364	1855	3	3	1	05:26:34
5365	1855	3	1	1	05:26:34
5366	1856	2	9	5	11:16:53
5367	1856	2	2	2	09:36:53
5368	1857	2	9	5	14:33:32
5369	1857	2	3	4	10:45:32
5370	1858	1	9	5	09:17:00
5371	1858	1	3	4	11:18:50
5372	1859	2	7	5	18:50:52
5373	1859	2	3	4	04:22:49
5374	1859	2	2	4	04:22:49
5375	1859	2	4	3	14:09:26
5376	1859	2	6	3	14:09:26
5377	1860	1	7	5	09:06:29
5378	1860	1	3	3	13:48:34
5379	1860	1	1	3	13:48:34
5380	1860	1	2	3	13:48:34
5381	1861	2	7	5	12:05:11
5382	1862	3	9	5	09:00:31
5383	1863	2	9	5	17:51:26
5384	1863	2	3	3	16:43:16
5385	1863	2	1	3	16:43:16
5386	1864	3	7	5	11:38:30
5387	1865	2	9	5	14:57:47
5388	1865	2	3	3	10:27:17
5389	1865	2	6	2	17:40:46
5390	1866	2	9	5	09:42:15
5391	1866	2	3	3	08:27:21
5392	1866	2	1	3	08:27:21
5393	1867	1	7	5	16:59:27
5394	1867	1	1	2	10:29:13
5395	1867	1	4	3	13:49:33
5396	1867	1	5	3	13:49:33
5397	1867	1	6	3	13:49:33
5398	1868	2	7	5	17:29:52
5399	1868	4	3	1	09:44:57
5400	1868	4	2	1	09:44:57
5401	1869	1	7	5	09:48:35
5402	1869	4	3	1	11:08:34
5403	1869	4	8	1	13:24:23
5404	1870	1	9	5	14:06:55
5405	1870	4	3	1	03:25:53
5406	1870	4	4	4	16:44:37
5407	1870	4	8	2	13:03:28
5408	1871	3	9	5	13:09:23
5409	1871	3	3	4	13:46:30
5410	1871	3	1	4	13:46:30
5411	1872	3	7	5	09:47:42
5412	1872	3	3	3	04:03:44
5413	1872	3	4	3	11:55:04
5414	1873	1	9	5	14:48:18
5415	1873	1	3	3	09:30:20
5416	1873	1	1	3	09:30:20
5417	1874	1	9	5	09:27:59
5418	1874	4	3	1	07:41:22
5419	1874	4	1	1	07:41:22
5420	1874	4	4	4	10:11:47
5421	1874	4	6	4	10:11:47
5422	1875	1	9	5	15:41:44
5423	1875	3	3	1	11:16:03
5424	1875	3	1	1	11:16:03
5425	1875	3	4	2	18:30:19
5426	1875	3	5	2	18:30:19
5427	1875	3	6	2	18:30:19
5428	1876	1	9	5	09:12:10
5429	1876	3	3	1	04:27:49
5430	1877	2	7	5	18:24:43
5431	1878	1	7	5	14:53:19
5432	1878	1	3	4	03:09:10
5433	1878	1	2	4	03:09:10
5434	1878	1	4	2	15:02:15
5435	1878	1	6	2	15:02:15
5436	1879	1	9	5	09:40:48
5437	1879	3	3	1	13:22:45
5438	1879	3	1	1	13:22:45
5439	1880	1	9	5	09:43:41
5440	1880	1	3	3	15:43:32
5441	1881	4	9	5	09:28:20
5442	1881	4	3	2	09:22:52
5443	1882	2	7	5	12:49:03
5444	1882	2	3	2	17:57:17
5445	1882	2	1	2	17:57:17
5446	1882	2	2	2	17:57:17
5447	1883	1	7	5	09:09:12
5448	1883	3	3	1	11:18:04
5449	1883	3	1	1	11:18:04
5450	1883	3	2	1	11:18:04
5451	1883	3	8	3	12:03:58
5452	1884	1	9	5	16:04:49
5453	1885	1	9	5	09:43:53
5454	1885	1	3	2	07:55:30
5455	1886	1	7	5	11:32:57
5456	1886	3	3	1	10:42:53
5457	1887	2	7	5	16:46:52
5458	1887	2	3	4	07:41:08
5459	1888	2	7	5	16:11:19
5460	1888	2	1	1	17:16:28
5461	1888	2	2	1	17:16:28
5462	1889	2	9	5	09:04:46
5463	1889	3	6	1	10:06:34
5464	1890	1	9	5	16:28:11
5465	1890	4	3	1	04:20:35
5466	1890	4	1	1	04:20:35
5467	1890	4	2	1	04:20:35
5468	1891	3	7	5	10:03:14
5469	1891	3	1	1	10:12:49
5470	1891	3	2	1	10:12:49
5471	1892	2	9	5	11:44:54
5472	1892	2	1	3	17:35:32
5473	1893	3	9	5	09:02:49
5474	1893	3	3	4	12:48:39
5475	1893	3	1	4	12:48:39
5476	1893	3	4	4	15:56:59
5477	1894	1	7	5	09:58:10
5478	1894	1	3	3	07:36:55
5479	1894	1	2	3	07:36:55
5480	1895	2	7	5	09:32:16
5481	1895	4	3	1	14:49:51
5482	1895	4	1	1	14:49:51
5483	1895	4	2	1	14:49:51
5484	1895	4	4	4	16:20:53
5485	1895	4	6	4	16:20:53
5486	1896	1	7	5	14:41:44
5487	1897	1	9	5	17:17:20
5488	1898	2	9	5	09:17:58
5489	1899	3	9	5	13:46:06
5490	1899	3	1	1	11:10:52
5491	1900	1	7	5	10:46:55
5492	1900	1	3	3	10:42:11
5493	1900	1	2	3	10:42:11
5494	1901	3	7	5	09:31:31
5495	1901	3	3	3	11:56:08
5496	1901	3	2	3	11:56:08
5497	1901	3	4	4	13:11:59
5498	1901	3	6	4	13:11:59
5499	1902	3	9	5	09:51:12
5500	1902	3	3	3	04:49:12
5501	1902	3	1	3	04:49:12
5502	1903	1	7	5	09:09:29
5503	1903	1	3	4	13:08:51
5504	1903	1	1	4	13:08:51
5505	1904	3	7	5	09:01:22
5506	1904	3	1	1	08:52:34
5507	1904	3	2	1	08:52:34
5508	1904	3	4	2	12:12:17
5509	1905	2	9	5	09:10:56
5510	1905	4	1	1	12:18:02
5511	1906	2	9	5	09:14:05
5512	1906	2	3	3	03:18:07
5513	1906	2	8	3	12:37:35
5514	1907	1	7	5	09:31:49
5515	1907	1	3	2	14:12:50
5516	1907	1	2	2	14:12:50
5517	1907	1	4	3	17:10:48
5518	1908	1	9	5	09:49:39
5519	1908	1	3	3	07:23:50
5520	1908	1	1	3	07:23:50
5521	1908	1	5	3	10:40:26
5522	1908	1	6	3	10:40:26
5523	1909	1	9	5	14:49:56
5524	1909	1	4	2	14:21:10
5525	1909	1	5	2	14:21:10
5526	1910	1	7	5	09:10:15
5527	1910	1	3	3	07:37:01
5528	1910	1	2	3	07:37:01
5529	1911	4	9	5	11:53:37
5530	1912	3	7	5	17:44:18
5531	1912	3	3	3	03:37:51
5532	1912	3	2	3	03:37:51
5533	1913	1	9	5	09:26:05
5534	1913	1	3	2	05:20:48
5535	1913	1	1	2	05:20:48
5536	1914	1	9	5	09:00:28
5537	1915	1	7	5	09:56:39
5538	1915	1	3	3	04:23:47
5539	1915	1	1	3	04:23:47
5540	1916	3	9	5	09:45:40
5541	1916	3	4	3	15:30:44
5542	1916	3	5	3	15:30:44
5543	1917	3	9	5	13:00:52
5544	1917	3	3	4	16:05:32
5545	1917	3	1	4	16:05:32
5546	1918	3	9	5	09:20:05
5547	1918	3	5	1	14:06:06
5548	1918	3	6	1	14:06:06
5549	1919	1	7	5	09:43:31
5550	1920	4	7	5	10:43:23
5551	1920	4	3	2	11:42:35
5552	1920	4	1	2	11:42:35
5553	1920	4	2	2	11:42:35
5554	1921	1	9	5	09:11:50
5555	1921	4	5	4	10:06:09
5556	1921	4	6	4	10:06:09
5557	1922	1	7	5	11:09:51
5558	1922	1	3	3	10:02:33
5559	1922	1	1	3	10:02:33
5560	1922	1	2	3	10:02:33
5561	1922	1	4	4	14:22:11
5562	1923	3	7	5	16:19:06
5563	1924	3	9	5	09:28:16
5564	1924	3	3	1	05:59:35
5565	1924	3	1	1	05:59:35
5566	1924	3	2	1	05:59:35
5567	1924	3	4	2	13:26:09
5568	1924	3	8	4	11:42:53
5569	1925	3	7	5	09:07:25
5570	1925	3	3	3	12:34:52
5571	1925	3	1	3	12:34:52
5572	1925	3	2	3	12:34:52
5573	1925	3	6	3	10:47:36
5574	1926	2	7	5	09:14:52
5575	1926	2	8	2	13:52:25
5576	1927	2	9	5	09:18:31
5577	1927	2	3	3	05:19:24
5578	1927	2	1	3	05:19:24
5579	1928	1	9	5	09:45:49
5580	1928	3	3	1	17:53:37
5581	1928	3	1	1	17:53:37
5582	1929	1	9	5	10:25:19
5583	1929	1	3	4	09:25:18
5584	1930	3	9	5	12:19:03
5585	1930	3	3	4	17:55:26
5586	1930	3	1	4	17:55:26
5587	1930	3	4	4	17:53:22
5588	1930	3	5	4	17:53:22
5589	1930	3	6	4	17:53:22
5590	1931	3	9	5	09:39:06
5591	1931	3	3	2	16:11:02
5592	1931	3	1	2	16:11:02
5593	1931	3	4	3	15:39:50
5594	1931	3	5	3	15:39:50
5595	1931	3	6	3	15:39:50
5596	1932	1	7	5	11:22:46
5597	1933	1	7	5	15:52:18
5598	1934	2	9	5	11:24:50
5599	1934	2	3	3	09:07:19
5600	1934	2	1	3	09:07:19
5601	1935	2	7	5	14:57:15
5602	1935	2	3	4	14:59:03
5603	1935	2	1	4	14:59:03
5604	1936	1	7	5	16:24:48
5605	1936	1	3	3	15:45:54
5606	1936	1	2	3	15:45:54
5607	1937	2	7	5	16:42:58
5608	1937	4	3	1	09:30:43
5609	1937	4	2	1	09:30:43
5610	1938	1	7	5	11:31:22
5611	1938	1	5	2	17:41:23
5612	1938	1	8	2	14:33:06
5613	1939	1	7	5	15:55:49
5614	1939	1	3	3	10:41:49
5615	1939	1	5	3	17:56:10
5616	1940	1	7	5	09:19:58
5617	1940	1	3	3	04:28:22
5618	1940	1	2	3	04:28:22
5619	1940	3	4	1	16:09:01
5620	1941	1	7	5	09:14:02
5621	1941	1	3	4	08:22:51
5622	1941	1	2	4	08:22:51
5623	1941	1	5	2	15:54:37
5624	1942	2	9	5	09:39:11
5625	1942	2	3	2	11:15:07
5626	1942	2	1	2	11:15:07
5627	1943	2	9	5	16:39:54
5628	1944	2	9	5	12:45:50
5629	1944	3	3	1	08:08:20
5630	1944	3	1	1	08:08:20
5631	1945	1	9	5	16:57:37
5632	1945	4	3	1	11:37:39
5633	1945	4	1	1	11:37:39
5634	1946	1	7	5	17:01:37
5635	1947	2	9	5	09:45:48
5636	1947	3	5	1	17:16:53
5637	1948	2	9	5	09:23:20
5638	1948	2	3	3	14:48:04
5639	1948	2	4	2	18:09:05
5640	1948	2	5	2	18:09:05
5641	1948	2	6	2	18:09:05
5642	1949	2	9	5	09:07:42
5643	1950	1	9	5	17:45:02
5644	1951	1	9	5	14:48:30
5645	1952	1	9	5	15:05:24
5646	1952	1	3	2	08:23:27
5647	1952	1	1	2	08:23:27
5648	1952	1	4	2	18:26:18
5649	1953	1	7	5	11:17:29
5650	1953	1	2	2	06:57:58
5651	1953	1	8	1	11:40:24
5652	1954	2	7	5	09:45:51
5653	1954	2	1	4	10:45:55
5654	1954	2	2	4	10:45:55
5655	1954	2	4	3	14:20:21
5656	1955	1	9	5	14:43:52
5657	1955	1	3	3	04:44:23
5658	1955	1	1	3	04:44:23
5659	1955	1	5	3	14:29:36
5660	1955	1	6	3	14:29:36
5661	1956	3	9	5	11:22:44
5662	1956	3	1	1	06:58:15
5663	1957	1	7	5	14:34:25
5664	1958	1	9	5	15:02:21
5665	1958	3	3	1	04:28:53
5666	1959	4	7	5	10:29:46
5667	1959	4	8	4	11:07:13
5668	1960	4	9	5	17:58:15
5669	1961	3	9	5	11:10:39
5670	1961	3	1	1	18:22:52
5671	1962	1	9	5	14:18:48
5672	1962	4	3	1	12:22:03
5673	1963	2	7	5	09:50:41
5674	1963	3	3	1	10:46:05
5675	1963	3	1	1	10:46:05
5676	1964	3	7	5	11:41:32
5677	1964	3	3	1	12:15:40
5678	1964	3	2	1	12:15:40
5679	1964	3	6	4	13:24:03
5680	1965	1	9	5	10:55:00
5681	1965	3	3	1	08:37:28
5682	1965	3	1	1	08:37:28
5683	1965	3	5	2	13:56:55
5684	1966	1	9	5	13:50:47
5685	1967	4	7	5	16:10:50
5686	1967	4	6	4	12:42:14
5687	1968	2	9	5	15:34:34
5688	1969	1	9	5	13:12:39
5689	1969	1	3	2	10:13:03
5690	1970	1	7	5	14:34:28
5691	1970	1	3	4	10:34:09
5692	1970	1	2	4	10:34:09
5693	1970	1	4	4	09:49:01
5694	1971	4	7	5	15:46:58
5695	1971	4	3	2	07:51:22
5696	1971	4	1	2	07:51:22
5697	1972	4	9	5	18:20:50
5698	1972	4	3	3	04:44:22
5699	1972	4	1	3	04:44:22
5700	1972	4	2	3	04:44:22
5701	1973	1	7	5	14:58:48
5702	1973	1	3	2	13:10:15
5703	1973	1	1	2	13:10:15
5704	1974	1	9	5	15:12:52
5705	1974	1	3	4	17:23:10
5706	1974	1	1	4	17:23:10
5707	1975	2	7	5	11:54:16
5708	1976	3	9	5	09:27:47
5709	1976	3	3	3	06:57:33
5710	1976	3	1	3	06:57:33
5711	1977	2	9	5	13:14:49
5712	1977	2	3	4	15:14:30
5713	1977	2	1	4	15:14:30
5714	1977	2	2	4	15:14:30
5715	1977	2	4	2	14:50:06
5716	1978	1	7	5	09:51:03
5717	1978	1	8	3	16:47:06
5718	1979	1	7	5	17:30:46
5719	1980	4	7	5	18:20:37
5720	1980	4	3	2	10:46:22
5721	1981	4	9	5	09:04:54
5722	1982	2	9	5	14:35:55
5723	1982	2	3	3	08:39:06
5724	1982	2	2	3	08:39:06
5725	1982	2	8	1	09:30:41
5726	1983	2	9	5	09:17:55
5727	1984	1	9	5	09:45:48
5728	1984	1	1	3	13:22:11
5729	1984	4	6	1	09:49:33
5730	1985	3	7	5	09:52:03
5731	1985	3	1	3	10:02:58
5732	1985	3	2	3	10:02:58
5733	1986	1	7	5	09:47:48
5734	1986	1	3	3	11:23:58
5735	1986	1	1	3	11:23:58
5736	1986	1	2	3	11:23:58
5737	1987	4	7	5	17:53:36
5738	1987	4	3	2	12:50:57
5739	1987	4	5	3	10:24:21
5740	1988	2	7	5	09:49:29
5741	1988	2	3	3	11:51:42
5742	1988	2	1	3	11:51:42
5743	1988	2	2	3	11:51:42
5744	1989	2	7	5	10:00:24
5745	1990	1	7	5	09:18:44
5746	1990	1	2	3	11:57:44
5747	1991	1	7	5	15:21:44
5748	1991	4	3	1	08:54:14
5749	1991	4	2	1	08:54:14
5750	1992	1	9	5	11:10:06
5751	1992	4	4	3	18:43:07
5752	1993	2	9	5	09:51:19
5753	1993	2	1	3	04:06:18
5754	1994	1	9	5	11:48:15
5755	1994	1	6	4	16:30:32
5756	1995	2	7	5	15:00:03
5757	1995	2	3	3	05:08:48
5758	1996	3	9	5	09:24:37
5759	1996	3	3	1	04:42:28
5760	1996	3	1	1	04:42:28
5761	1997	2	7	5	17:41:27
5762	1997	2	3	4	07:33:31
5763	1997	2	2	4	07:33:31
5764	1998	1	7	5	13:08:31
5765	1999	3	9	5	10:19:37
5766	1999	3	3	2	08:49:29
5767	1999	3	5	4	12:33:57
5768	2000	3	9	5	16:56:27
5769	2000	3	3	3	13:37:14
5770	2001	4	9	5	09:28:33
5771	2001	4	3	3	05:54:04
5772	2001	4	1	3	05:54:04
5773	2001	4	6	3	09:12:42
5774	2002	2	7	5	14:24:28
5775	2002	2	3	4	12:01:39
5776	2003	3	9	5	17:49:39
5777	2003	3	3	3	07:01:18
5778	2003	3	1	3	07:01:18
5779	2004	1	9	5	18:53:46
5780	2004	1	3	3	16:53:53
5781	2004	1	6	3	15:05:05
5782	2005	4	7	5	16:54:29
5783	2005	4	3	1	08:06:03
5784	2005	4	2	1	08:06:03
5785	2006	4	9	5	09:22:24
5786	2006	4	3	1	13:56:06
5787	2006	4	4	3	10:54:05
5788	2006	4	5	3	10:54:05
5789	2006	4	6	3	10:54:05
5790	2007	4	9	5	09:52:17
5791	2007	4	3	3	05:37:10
5792	2007	4	1	3	05:37:10
5793	2007	4	4	2	18:21:39
5794	2008	1	7	5	16:42:17
5795	2008	1	3	4	04:36:06
5796	2008	1	1	4	04:36:06
5797	2009	3	9	5	11:22:07
5798	2009	3	3	2	15:37:55
5799	2009	3	1	2	15:37:55
5800	2010	1	9	5	11:29:41
5801	2011	1	7	5	15:02:40
5802	2012	3	9	5	17:38:51
5803	2012	3	3	3	07:47:45
5804	2012	3	6	1	12:53:09
5805	2013	1	9	5	12:21:50
5806	2013	1	5	2	10:37:37
5807	2014	2	9	5	09:42:10
5808	2014	2	3	1	12:42:04
5809	2015	1	9	5	16:20:12
5810	2015	3	3	1	06:03:09
5811	2015	3	1	1	06:03:09
5812	2015	3	5	3	10:10:39
5813	2016	1	7	5	15:02:30
5814	2016	1	6	3	14:01:04
5815	2017	3	9	5	11:18:42
5816	2017	3	3	4	18:00:18
5817	2017	3	4	4	14:06:54
5818	2017	3	5	4	14:06:54
5819	2018	1	7	5	09:50:34
5820	2018	1	4	2	11:54:27
5821	2019	2	9	5	09:33:29
5822	2020	2	9	5	16:13:11
5823	2020	2	3	2	13:50:56
5824	2020	2	1	2	13:50:56
5825	2021	1	7	5	16:42:14
5826	2021	4	3	1	09:51:05
5827	2021	4	2	1	09:51:05
5828	2021	4	4	1	11:20:49
5829	2021	4	5	1	11:20:49
5830	2022	1	9	5	09:15:10
5831	2022	1	4	1	16:05:09
5832	2022	1	5	1	16:05:09
5833	2023	1	9	5	09:52:10
5834	2023	1	4	2	11:19:33
5835	2023	1	5	2	11:19:33
5836	2024	1	9	5	10:45:30
5837	2024	1	3	3	09:37:15
5838	2024	1	4	4	15:51:55
5839	2025	3	7	5	15:58:17
5840	2025	3	3	1	16:22:04
5841	2025	3	2	1	16:22:04
5842	2025	3	5	4	17:04:08
5843	2026	2	9	5	09:01:32
5844	2026	2	3	2	10:38:07
5845	2026	2	1	2	10:38:07
5846	2027	1	7	5	09:16:19
5847	2027	1	3	2	06:21:36
5848	2027	1	2	2	06:21:36
5849	2027	1	4	3	13:10:01
5850	2027	1	8	4	11:27:29
5851	2028	3	7	5	16:45:42
5852	2028	3	3	1	07:11:40
5853	2028	3	2	1	07:11:40
5854	2029	4	7	5	12:19:04
5855	2029	4	3	2	09:38:30
5856	2029	4	2	2	09:38:30
5857	2029	4	4	1	17:37:13
5858	2030	1	7	5	09:39:29
5859	2030	1	3	2	12:29:31
5860	2030	1	1	2	12:29:31
5861	2031	1	7	5	12:37:24
5862	2031	1	3	2	16:07:34
5863	2031	1	6	2	17:26:20
5864	2031	1	8	1	11:35:42
5865	2032	4	7	5	09:40:44
5866	2032	4	3	3	05:02:26
5867	2032	4	2	3	05:02:26
5868	2033	2	9	5	18:11:29
5869	2033	2	3	2	12:25:28
5870	2033	2	1	2	12:25:28
5871	2033	2	4	3	10:16:51
5872	2033	2	8	4	16:52:47
5873	2034	3	7	5	11:16:30
5874	2034	3	3	3	13:47:57
5875	2034	3	2	3	13:47:57
5876	2035	2	7	5	15:14:44
5877	2035	2	4	2	10:44:30
5878	2036	1	9	5	17:07:54
5879	2036	3	5	1	12:56:26
5880	2036	3	6	1	12:56:26
5881	2037	2	9	5	16:37:33
5882	2037	2	3	3	07:03:09
5883	2037	2	1	3	07:03:09
5884	2037	2	2	3	07:03:09
5885	2037	2	4	4	13:50:08
5886	2037	2	6	4	13:50:08
5887	2038	2	9	5	09:22:03
5888	2038	2	3	2	12:57:18
5889	2038	2	1	2	12:57:18
5890	2038	2	4	2	18:01:04
5891	2038	2	6	2	18:01:04
5892	2039	1	9	5	09:15:38
5893	2039	1	3	3	14:31:22
5894	2039	1	1	3	14:31:22
5895	2039	1	2	3	14:31:22
5896	2040	3	9	5	15:11:46
5897	2040	3	3	1	10:14:50
5898	2040	3	8	4	18:06:07
5899	2041	1	7	5	14:56:58
5900	2041	1	3	3	14:09:06
5901	2041	1	1	3	14:09:06
5902	2041	1	2	3	14:09:06
5903	2041	1	6	3	14:12:10
5904	2042	1	9	5	10:00:53
5905	2042	1	3	3	05:18:17
5906	2043	3	9	5	17:33:21
5907	2043	3	3	3	17:53:34
5908	2043	3	1	3	17:53:34
5909	2043	3	4	3	14:14:54
5910	2043	3	5	3	14:14:54
5911	2044	2	9	5	14:10:40
5912	2044	2	3	1	11:45:14
5913	2044	2	2	1	11:45:14
5914	2045	1	9	5	11:05:51
5915	2045	4	3	1	12:48:12
5916	2045	4	1	1	12:48:12
5917	2046	1	9	5	13:52:31
5918	2046	4	3	1	09:25:59
5919	2046	4	5	4	13:37:40
5920	2047	3	7	5	18:55:58
5921	2047	3	3	1	15:52:36
5922	2047	3	2	1	15:52:36
5923	2047	3	4	4	10:31:24
5924	2047	3	5	4	10:31:24
5925	2048	3	9	5	18:57:25
5926	2048	3	3	1	17:10:58
5927	2048	3	5	3	17:55:42
5928	2048	3	6	3	17:55:42
5929	2049	2	9	5	14:34:27
5930	2049	4	3	1	09:39:09
5931	2049	4	1	1	09:39:09
5932	2050	1	9	5	09:54:16
5933	2050	1	3	4	05:54:44
5934	2051	1	9	5	13:01:44
5935	2052	3	9	5	11:25:40
5936	2052	3	3	3	10:38:39
5937	2052	3	1	3	10:38:39
5938	2052	3	5	3	11:52:43
5939	2053	1	7	5	09:30:48
5940	2054	1	9	5	13:44:52
5941	2054	1	3	4	06:10:12
5942	2054	1	1	4	06:10:12
5943	2054	1	6	3	11:32:56
5944	2055	1	9	5	10:01:03
5945	2055	1	3	2	04:33:15
5946	2056	2	7	5	09:42:40
5947	2056	4	3	1	04:03:00
5948	2056	4	2	1	04:03:00
5949	2057	1	7	5	09:02:18
5950	2058	1	7	5	09:12:33
5951	2058	1	4	3	12:11:48
5952	2059	1	9	5	12:04:09
5953	2059	1	3	3	05:24:53
5954	2059	1	1	3	05:24:53
5955	2059	1	6	4	10:10:44
5956	2060	3	9	5	09:21:01
5957	2060	3	3	2	15:36:39
5958	2060	3	1	2	15:36:39
5959	2060	3	8	3	16:19:50
5960	2061	2	9	5	09:56:16
5961	2061	2	3	1	09:11:06
5962	2061	2	1	1	09:11:06
5963	2062	1	9	5	15:09:43
5964	2062	1	3	2	05:06:30
5965	2062	1	4	2	10:49:44
5966	2062	1	5	2	10:49:44
5967	2063	4	9	5	09:33:55
5968	2064	2	9	5	10:57:13
5969	2065	3	7	5	15:00:22
5970	2065	3	3	2	10:47:55
5971	2065	3	5	4	12:52:33
5972	2066	2	7	5	12:17:36
5973	2066	3	3	1	11:23:27
5974	2066	3	2	1	11:23:27
5975	2066	3	6	4	18:25:23
5976	2067	2	7	5	09:31:33
5977	2067	2	2	2	06:50:35
5978	2068	3	9	5	15:32:53
5979	2069	1	9	5	09:57:42
5980	2069	4	3	1	16:41:11
5981	2069	4	8	4	15:56:46
5982	2070	1	9	5	09:45:22
5983	2070	3	3	1	12:48:22
5984	2070	3	1	1	12:48:22
5985	2070	3	4	4	11:43:56
5986	2071	2	9	5	09:06:16
5987	2071	2	1	2	13:03:55
5988	2071	2	2	2	13:03:55
5989	2072	2	7	5	12:02:23
5990	2072	2	3	3	16:39:13
5991	2072	2	1	3	16:39:13
5992	2073	2	9	5	09:50:35
5993	2073	2	3	1	11:06:20
5994	2073	2	1	1	11:06:20
5995	2074	1	9	5	12:38:50
5996	2074	1	4	4	13:42:05
5997	2075	2	9	5	09:23:34
5998	2075	2	3	4	12:56:18
5999	2075	2	1	4	12:56:18
6000	2075	2	8	3	09:52:39
6001	2076	1	9	5	09:35:33
6002	2076	1	3	3	16:09:57
6003	2077	1	7	5	15:53:43
6004	2077	1	3	4	07:58:36
6005	2077	1	2	4	07:58:36
6006	2078	3	9	5	12:11:15
6007	2078	3	3	3	07:18:03
6008	2078	3	1	3	07:18:03
6009	2078	3	8	4	16:17:20
6010	2079	2	9	5	12:39:41
6011	2079	3	3	1	15:09:01
6012	2079	3	1	1	15:09:01
6013	2079	3	6	3	16:35:14
6014	2080	2	9	5	09:19:47
6015	2080	2	3	3	12:55:20
6016	2080	2	1	3	12:55:20
6017	2080	2	4	3	17:05:07
6018	2081	1	9	5	09:49:50
6019	2081	1	1	3	12:00:58
6020	2081	1	2	3	12:00:58
6021	2081	1	4	4	12:36:05
6022	2081	1	5	4	12:36:05
6023	2081	1	6	4	12:36:05
6024	2082	1	9	5	09:14:14
6025	2082	1	3	3	08:35:02
6026	2082	1	1	3	08:35:02
6027	2082	1	6	2	13:54:21
6028	2083	1	7	5	09:10:50
6029	2083	4	3	1	07:51:50
6030	2083	4	1	1	07:51:50
6031	2084	3	9	5	14:32:09
6032	2084	3	3	3	15:54:25
6033	2085	2	9	5	09:15:53
6034	2086	2	9	5	13:47:44
6035	2086	2	1	3	09:55:29
6036	2086	2	8	3	17:01:38
6037	2087	3	7	5	16:26:35
6038	2087	3	3	1	14:20:40
6039	2087	3	2	1	14:20:40
6040	2088	1	9	5	16:27:58
6041	2088	1	3	3	11:17:53
6042	2088	1	1	3	11:17:53
6043	2089	2	9	5	14:04:13
6044	2089	2	3	2	09:08:11
6045	2089	2	5	3	17:42:52
6046	2089	2	6	3	17:42:52
6047	2090	1	7	5	16:17:08
6048	2090	1	1	4	08:58:55
6049	2090	1	8	3	14:31:06
6050	2091	3	9	5	15:34:02
6051	2091	3	2	4	09:13:26
6052	2091	3	4	2	15:04:52
6053	2092	1	7	5	11:46:50
6054	2092	1	3	4	07:22:16
6055	2092	1	2	4	07:22:16
6056	2093	1	9	5	09:05:03
6057	2093	1	3	4	06:33:47
6058	2093	1	4	2	10:21:25
6059	2093	1	8	1	14:15:42
6060	2094	2	7	5	17:15:11
6061	2094	4	3	1	16:34:55
6062	2094	4	8	1	14:50:53
6063	2095	1	7	5	13:06:39
6064	2095	4	3	1	04:25:34
6065	2095	4	4	4	14:08:06
6066	2096	1	9	5	09:01:19
6067	2096	1	1	3	09:39:47
6068	2096	1	2	3	09:39:47
6069	2097	1	9	5	12:12:58
6070	2097	1	3	3	10:04:43
6071	2097	1	1	3	10:04:43
6072	2098	3	7	5	09:15:32
6073	2098	3	3	3	17:52:17
6074	2098	3	2	3	17:52:17
6075	2098	3	8	3	14:42:37
6076	2099	3	9	5	09:14:02
6077	2099	3	3	1	09:46:47
6078	2099	3	4	4	16:35:18
6079	2099	3	6	4	16:35:18
6080	2100	2	9	5	12:25:10
6081	2100	2	3	3	13:21:33
6082	2100	2	1	3	13:21:33
6083	2101	1	9	5	10:08:38
6084	2101	1	3	3	16:16:18
6085	2101	1	1	3	16:16:18
6086	2102	2	9	5	12:34:05
6087	2102	2	3	2	11:08:30
6088	2102	2	1	2	11:08:30
6089	2102	2	4	2	13:53:54
6090	2103	1	9	5	14:34:17
6091	2103	4	6	1	17:08:40
6092	2103	4	8	3	10:50:09
6093	2104	2	9	5	15:25:33
6094	2104	2	3	3	11:56:36
6095	2104	2	1	3	11:56:36
6096	2105	3	9	5	17:58:35
6097	2105	3	3	2	14:33:12
6098	2106	2	7	5	16:49:17
6099	2106	2	4	4	10:22:41
6100	2107	3	7	5	18:36:12
6101	2107	3	3	1	08:50:47
6102	2107	3	2	1	08:50:47
6103	2107	3	4	4	17:38:28
6104	2108	2	9	5	09:32:22
6105	2108	2	1	2	11:25:04
6106	2108	2	8	2	10:55:00
6107	2109	1	9	5	13:22:43
6108	2109	1	1	4	04:19:45
6109	2110	3	7	5	13:51:34
6110	2110	3	3	1	18:27:23
6111	2110	3	1	1	18:27:23
6112	2110	3	8	4	13:06:36
6113	2111	2	7	5	12:58:29
6114	2111	2	3	4	10:24:56
6115	2111	2	1	4	10:24:56
6116	2111	2	2	4	10:24:56
6117	2111	2	4	2	14:47:19
6118	2111	2	5	2	14:47:19
6119	2112	2	7	5	09:15:56
\.


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('purchases_id_seq', 6119, true);


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stores (id, storename) FROM stdin;
1	Valentina's Wacky Funhaus
2	Jeb's Cantina
3	Bill's iShop
4	Bob's Gift Store
5	Front Gate
\.


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('stores_id_seq', 5, true);


--
-- Data for Name: table_updates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_updates (update_id, target_table, inserted) FROM stdin;
InsertCustomers()	D_customers	2015-06-29 03:30:08.757627
InsertStores()	D_stores	2015-06-29 03:30:08.841091
InsertProducts()	D_products	2015-06-29 03:30:08.884377
InsertEntrances()	F_entrances	2015-06-29 03:30:09.056843
InsertPurchases()	F_purchases	2015-06-29 03:30:55.919698
\.


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: d_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_customers
    ADD CONSTRAINT d_customers_pkey PRIMARY KEY (id);


--
-- Name: d_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_products
    ADD CONSTRAINT d_products_pkey PRIMARY KEY (id);


--
-- Name: d_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_stores
    ADD CONSTRAINT d_stores_pkey PRIMARY KEY (id);


--
-- Name: f_entrances_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY f_entrances
    ADD CONSTRAINT f_entrances_pkey PRIMARY KEY (id);


--
-- Name: f_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY f_purchases
    ADD CONSTRAINT f_purchases_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: paymenttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paymenttypes
    ADD CONSTRAINT paymenttypes_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: table_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY table_updates
    ADD CONSTRAINT table_updates_pkey PRIMARY KEY (update_id);


--
-- Name: customers_paymentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_paymentid_fkey FOREIGN KEY (paymentid) REFERENCES paymenttypes(id);


--
-- Name: f_entrances_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY f_entrances
    ADD CONSTRAINT f_entrances_customerid_fkey FOREIGN KEY (customerid) REFERENCES d_customers(id);


--
-- Name: f_purchases_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY f_purchases
    ADD CONSTRAINT f_purchases_customerid_fkey FOREIGN KEY (customerid) REFERENCES d_customers(id);


--
-- Name: f_purchases_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY f_purchases
    ADD CONSTRAINT f_purchases_productid_fkey FOREIGN KEY (productid) REFERENCES d_products(id);


--
-- Name: f_purchases_storeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY f_purchases
    ADD CONSTRAINT f_purchases_storeid_fkey FOREIGN KEY (storeid) REFERENCES d_stores(id);


--
-- Name: orders_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_productid_fkey FOREIGN KEY (productid) REFERENCES products(id);


--
-- Name: purchases_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT purchases_customerid_fkey FOREIGN KEY (customerid) REFERENCES customers(id);


--
-- Name: purchases_paymentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT purchases_paymentid_fkey FOREIGN KEY (paymentid) REFERENCES paymenttypes(id);


--
-- Name: purchases_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT purchases_productid_fkey FOREIGN KEY (productid) REFERENCES products(id);


--
-- Name: purchases_storeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT purchases_storeid_fkey FOREIGN KEY (storeid) REFERENCES stores(id);


--
-- PostgreSQL database dump complete
--

