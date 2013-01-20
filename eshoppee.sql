--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: e_category; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE e_category (
    cat_id character varying(10) NOT NULL,
    descrip character varying(500) NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.e_category OWNER TO b090468cs;

--
-- Name: e_customer; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE e_customer (
    c_name character varying(30) NOT NULL,
    c_id character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    address character varying(100) NOT NULL,
    email character varying(30),
    phone character varying(10),
    tr_point integer
);


ALTER TABLE public.e_customer OWNER TO b090468cs;

--
-- Name: e_discount; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE e_discount (
    disc_id character varying(10) NOT NULL,
    rate integer NOT NULL,
    point_low integer NOT NULL,
    point_high integer NOT NULL
);


ALTER TABLE public.e_discount OWNER TO b090468cs;

--
-- Name: e_order; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE e_order (
    o_id character varying(10) NOT NULL,
    p_id character varying(10),
    pay_id character varying(10),
    date date,
    ship_id character varying(10),
    s_id character varying(20),
    b_id character varying(20),
    d_id character varying(10)
);


ALTER TABLE public.e_order OWNER TO b090468cs;

--
-- Name: e_orderdetail; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE e_orderdetail (
    o_id character varying(10) NOT NULL,
    p_id character varying(10),
    mrp numeric(12,2),
    no integer,
    d_id character varying(10),
    t_amt numeric(12,2)
);


ALTER TABLE public.e_orderdetail OWNER TO b090468cs;

--
-- Name: e_payment; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE e_payment (
    pmt_id character varying(10) NOT NULL,
    type character varying(25) NOT NULL
);


ALTER TABLE public.e_payment OWNER TO b090468cs;

--
-- Name: e_products; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE e_products (
    p_id character varying(10) NOT NULL,
    p_name character varying(50),
    picture character varying(100),
    descrip character varying(1000),
    cat_id character varying(10),
    u_price numeric(16,2),
    n_units integer,
    s_id character varying(20)
);


ALTER TABLE public.e_products OWNER TO b090468cs;

--
-- Name: e_shipping; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE e_shipping (
    ship_name character varying(30) NOT NULL,
    ship_id character varying(20) NOT NULL,
    s_phone character varying(15)
);


ALTER TABLE public.e_shipping OWNER TO b090468cs;

--
-- Data for Name: e_category; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY e_category (cat_id, descrip, name) FROM stdin;
CAT0001	Bags&Luggages,Men's Accessories,Men's Apparel,Women's Accessories,Women's Apparel,Other Apparel,Other Accessories are covered in this section.	Apparel & Accessories
CAT0002	Children,Comics,Computers & Internet,Education & Textbooks,Fictional,Magazines,Other Books	Books & Magazines
CAT0003	Cars,MotorCycles,Commercial Vehicles,Car & Bike Accessories & Parts are covered in this section.	Cars & Bikes
CAT0004	MP3 & MP4 Players,MP3 Accessories,LCD,LED & Plasma TV's,TV Accessories,Batteries & Chargers,Electronic Gadgets,Cameras & Camcorders,Video Game Consoles,Other Electronics are covered in this section.	Consumer Electronics
CAT0005	Camping & Adventure Sports,Cricket,Exercise & Fitness,Football,Golf,Hockey,Squash,Swimming,Table Tennis,Tennis,etc... are covered in this section.	Fitness & Sports
CAT0006	Body Care,Hygiene,Face Care,Hair Care,Health Care,Cosmetics,Perfumes,Other Beauty & Health Products are covered in this section.	Health & Personal Care
CAT0007	iPads,Tablets & eBook Readers,Laptops & Laptop Accessories,Desktop PC,Computer Components,Speakers & MUltimedia,Networking Equipments are covered in this section.	Laptops & Computer Peripherals
CAT0008	Memory Cards,Card Readers,Pen Drives,Internal & External Hard Disk Drives,Blank Media,Other Digital Storage Media etc... are covered in this section.	Memory Storage Devices
CAT0009	GSM Phones,Dual Sim,CDMA Phones,Mobile Accessories etc... are covered in this section.	Mobile Phones & Accessories
CAT0010	Every Other Products which do not fall to any given categories are covered in this section.	Everything Else
\.


--
-- Data for Name: e_customer; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY e_customer (c_name, c_id, password, address, email, phone, tr_point) FROM stdin;
1	sreeraj	vertigo	NITC	sreeraj.altair@gmail.com	9495374101	23
true	q	true	true	true	true	1
1	tomcat	1234	Calicut	abc@gmail.com	654321	0
1	aa	aa	a@a.com	a@a.com	1234567890	0
1	beenz	chr	cityscape room no.12,calicut	beena@hotmail.com	9678650090	0
1	bhasi	bhasi	ekm	bhasiekm@gmail.com	9946556607	0
1	dqwdw	qwer	sdweff	weqw	wqdeweqf	0
1	qwerty	qwerty	qwerty			0
1	smoking_gun	why	room 133, b - hostel, nitc hostels, nitc, kerala	jeremyzakk16@yahoo.in	9567343752	0
1	123	123	123	123@gmail.com	1233	0
1	weer	123	hhuh	njnjnn	8774534	0
1	syam	syam	syam	syamsankar91@gmail.com	007	0
1	kuttupai	yahoo	a	b	9895689519	0
1	memagnetic	plugin	B-136	memagnetic@gmail.com	9895437518	0
1	dad	aa	ddgf	qwe	12345	0
1	asd	asd	asd	asd	asd	0
1	bla	baba	blaaaaaaaaaa	goth@homtail.com	2395032	0
1	pranchi	ettan	asdfa	prachi@ettan.com	1122334455	0
1	jerrin	password	b233	jerrinsg@nitc.ac.in	9567428090	0
1	b	c	d	e@e.com	blah	0
1	abcd	pqrs	hgk,fmvlfjvifjflre	abc@gmail.com	4858955948	0
1	rose	rose	ekm	h@gmail.com	12345678	0
1	vinay_bcs09	29061992	Kunraghat,Gorakhpur,UP	vinay_bcs09@nitc.ac.in	8089373637	1
1	vivekmnair	qwerty	B-342, NITC	vivekmnair2007@gmail.com	9446872495	9
1	suthar	123456	G-309, NITC, Calicut	royalsunil007@gmail.com	8714217231	0
1	vin	pass	fd	df	100	4
1	sandy	sandra	buaaa	goddess.of.evil@hotmail.com	9865656678	0
1	vedprakash	ved	shiv colony churu	ved.nitc@gmail.com	9020585290	1
1	shamil	sparsham	B331 NITC	shamil.cm@gmail.com	9961056990	10
1	234	234	234	234@234.com	2342342342	0
1	mohd	mohd	hira	mohd	23232	1
1	anil007	123	nitc-calicut			0
1	Jiss	subhash	No 516, 9th A main, 8th Croos, BEML Layout, Thubarahalli, Bangalore	jiss_simon@yahoo.com	7829564967	1
1	ashok	4knights	kallampally	ashokzhere@gmail.com	9037661984	2
1	ajayt6	hatter	B 122	ajayt6@yahoo.com	8891725683	0
1	royzhere	roy123	9496321783	mohanroy@live.in	9496321783	2
1	3dev	thridev	B-308, NITC	me3dev@gmail.com	9446326544	18
1	s	h	w	i	14	0
1	true	true	true	true	true	0
1	a	true	true	true	true	0
ashwin	jacob	true	d6b"><script>alert("KALLU")</script><marquee>KALLU</marquee>	ashwinjacob@gmail.com	9999999999	0
zolu	zolu123	zolu@123	f-hostel nitc			1
1	vivekzhere	missippi	G 105, NITC	vivekzhere@gmail.com	9037660385	16
\.


--
-- Data for Name: e_discount; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY e_discount (disc_id, rate, point_low, point_high) FROM stdin;
DISC0001	0	0	5
DISC0002	5	6	15
DISC0003	10	16	50
DISC0004	15	51	30000
\.


--
-- Data for Name: e_order; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY e_order (o_id, p_id, pay_id, date, ship_id, s_id, b_id, d_id) FROM stdin;
ODR0001	PRO0002	PMT0001	2011-04-08	SHP0003	3dev	vivekmnair	DISC0001
ODR0002	PRO0001	PMT0001	2011-04-08	SHP0004	vivekzhere	3dev	DISC0001
ODR0003	PRO0001	PMT0001	2011-04-08	SHP0004	vivekzhere	3dev	DISC0001
ODR0004	PRO0002	PMT0001	2011-04-08	SHP0001	3dev	vivekzhere	DISC0001
ODR0005	PRO0002	PMT0001	2011-04-08	SHP0001	3dev	vivekzhere	DISC0001
ODR0006	PRO0001	PMT0001	2011-04-08	SHP0001	vivekzhere	vivekmnair	DISC0001
ODR0007	PRO0003	PMT0002	2011-04-08	SHP0002	vivekmnair	vivekzhere	DISC0001
ODR0008	PRO0004	PMT0002	2011-04-08	SHP0002	vivekzhere	vivekmnair	DISC0001
ODR0009	PRO0003	PMT0001	2011-04-08	SHP0005	vivekmnair	sreeraj	DISC0001
ODR0010	PRO0005	PMT0001	2011-04-08	SHP0001	vinay_bcs09	shamil	DISC0001
ODR0011	PRO0006	PMT0001	2011-04-08	SHP0001	sreeraj	shamil	DISC0001
ODR0012	PRO0008	PMT0001	2011-04-08	SHP0001	sreeraj	shamil	DISC0001
ODR0013	PRO0008	PMT0001	2011-04-08	SHP0001	sreeraj	shamil	DISC0001
ODR0014	PRO0008	PMT0001	2011-04-08	SHP0001	sreeraj	shamil	DISC0001
ODR0015	PRO0007	PMT0001	2011-04-08	SHP0001	3dev	sreeraj	DISC0001
ODR0016	PRO0008	PMT0001	2011-04-08	SHP0001	sreeraj	shamil	DISC0001
ODR0017	PRO0004	PMT0001	2011-04-08	SHP0001	vivekzhere	sreeraj	DISC0002
ODR0018	PRO0003	PMT0001	2011-04-08	SHP0001	vivekmnair	sreeraj	DISC0002
ODR0019	PRO0009	PMT0001	2011-04-08	SHP0001	3dev	sreeraj	DISC0002
ODR0020	PRO0009	PMT0001	2011-04-08	SHP0001	3dev	sreeraj	DISC0002
ODR0021	PRO0009	PMT0001	2011-04-08	SHP0001	3dev	sreeraj	DISC0002
ODR0022	PRO0009	PMT0001	2011-04-08	SHP0001	3dev	sreeraj	DISC0002
ODR0023	PRO0009	PMT0001	2011-04-08	SHP0001	3dev	sreeraj	DISC0002
ODR0024	PRO0009	PMT0001	2011-04-08	SHP0001	3dev	sreeraj	DISC0002
ODR0025	PRO0009	PMT0001	2011-04-08	SHP0001	3dev	sreeraj	DISC0002
ODR0026	PRO0012	PMT0001	2011-04-08	SHP0001	shamil	sreeraj	DISC0003
ODR0027	PRO0012	PMT0001	2011-04-08	SHP0006	shamil	3dev	DISC0002
ODR0028	PRO0003	PMT0001	2011-04-08	SHP0001	vivekmnair	vin	DISC0001
ODR0029	PRO0014	PMT0003	2011-04-08	SHP0005	sreeraj	vin	DISC0001
ODR0030	PRO0006	PMT0001	2011-04-08	SHP0001	sreeraj	vin	DISC0001
ODR0031	PRO0007	PMT0001	2011-04-08	SHP0001	3dev	vivekzhere	DISC0002
ODR0032	PRO0015	PMT0001	2011-04-08	SHP0001	vivekzhere	vivekmnair	DISC0002
ODR0033	PRO0015	PMT0001	2011-04-08	SHP0001	vivekzhere	vivekmnair	DISC0002
ODR0034	PRO0008	PMT0001	2011-04-08	SHP0001	sreeraj	vin	DISC0001
ODR0035	PRO0011	PMT0001	2011-04-08	SHP0001	shamil	sreeraj	DISC0003
ODR0036	PRO0010	PMT0001	2011-04-08	SHP0001	shamil	vedprakash	DISC0001
ODR0037	PRO0008	PMT0002	2011-04-08	SHP0003	sreeraj	vivekzhere	DISC0002
ODR0038	PRO0004	PMT0001	2011-04-08	SHP0002	vivekzhere	ashok	DISC0001
ODR0039	PRO0007	PMT0002	2011-04-08	SHP0003	3dev	mohd	DISC0001
ODR0040	PRO0018	PMT0001	2011-04-09	SHP0005	ashok	Jiss	DISC0001
ODR0041	PRO0009	PMT0001	2011-04-13	SHP0001	3dev	royzhere	DISC0001
ODR0042	PRO0020	PMT0001	2011-05-30	SHP0001	royzhere	vivekzhere	DISC0002
ODR0043	PRO0007	PMT0002	2011-06-09	SHP0004	3dev	vivekzhere	DISC0002
ODR0044	PRO0013	PMT0001	2012-08-19	SHP0001	sreeraj	q	DISC0001
ODR0045	PRO0004	PMT0002	2012-09-21	SHP0001	vivekzhere	zolu123	DISC0001
\.


--
-- Data for Name: e_orderdetail; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY e_orderdetail (o_id, p_id, mrp, no, d_id, t_amt) FROM stdin;
ODR0001	PRO0002	250000.00	1	DISC0001	250000.00
ODR0002	PRO0001	600.00	2	DISC0001	1200.00
ODR0003	PRO0001	600.00	2	DISC0001	1200.00
ODR0004	PRO0002	250000.00	2	DISC0001	500000.00
ODR0005	PRO0002	250000.00	2	DISC0001	500000.00
ODR0006	PRO0001	600.00	1	DISC0001	600.00
ODR0007	PRO0003	12000.00	1	DISC0001	12000.00
ODR0008	PRO0004	1500.00	2	DISC0001	3000.00
ODR0009	PRO0003	12000.00	1	DISC0001	12000.00
ODR0010	PRO0005	750.00	1	DISC0001	750.00
ODR0011	PRO0006	120000.00	3	DISC0001	360000.00
ODR0012	PRO0008	5000.00	1	DISC0001	5000.00
ODR0013	PRO0008	5000.00	1	DISC0001	5000.00
ODR0014	PRO0008	5000.00	1	DISC0001	5000.00
ODR0015	PRO0007	2300.00	1	DISC0001	2300.00
ODR0016	PRO0008	5000.00	1	DISC0001	5000.00
ODR0017	PRO0004	1500.00	1	DISC0002	1425.00
ODR0018	PRO0003	12000.00	1	DISC0002	11400.00
ODR0019	PRO0009	150.00	1	DISC0002	142.50
ODR0020	PRO0009	150.00	1	DISC0002	142.50
ODR0021	PRO0009	150.00	1	DISC0002	142.50
ODR0022	PRO0009	150.00	1	DISC0002	142.50
ODR0023	PRO0009	150.00	1	DISC0002	142.50
ODR0024	PRO0009	150.00	1	DISC0002	142.50
ODR0025	PRO0009	150.00	1	DISC0002	142.50
ODR0026	PRO0012	5423222212.00	1	DISC0003	4880899990.80
ODR0027	PRO0012	5423222212.00	1	DISC0002	5152061101.40
ODR0028	PRO0003	12000.00	1	DISC0001	12000.00
ODR0029	PRO0014	4300000.00	1	DISC0001	4300000.00
ODR0030	PRO0006	120000.00	2	DISC0001	240000.00
ODR0031	PRO0007	2300.00	1	DISC0002	2185.00
ODR0032	PRO0015	50.00	8	DISC0002	380.00
ODR0033	PRO0015	50.00	2	DISC0002	95.00
ODR0034	PRO0008	5000.00	1	DISC0001	5000.00
ODR0035	PRO0011	10199.00	1	DISC0003	9179.10
ODR0036	PRO0010	1500.00	1	DISC0001	1500.00
ODR0037	PRO0008	5000.00	1	DISC0002	4750.00
ODR0038	PRO0004	1500.00	1	DISC0001	1500.00
ODR0039	PRO0007	2300.00	1	DISC0001	2300.00
ODR0040	PRO0018	300000.00	1	DISC0001	300000.00
ODR0041	PRO0009	150.00	1	DISC0001	150.00
ODR0042	PRO0020	1000.00	1	DISC0002	950.00
ODR0043	PRO0007	2300.00	6	DISC0002	13110.00
ODR0044	PRO0013	15.00	1	DISC0001	15.00
ODR0045	PRO0004	1500.00	1	DISC0001	1500.00
\.


--
-- Data for Name: e_payment; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY e_payment (pmt_id, type) FROM stdin;
PMT0001	Credit Card
PMT0002	Debit Card
PMT0003	Internet Banking
PMT0004	Cheque
PMT0005	Demand Draft
\.


--
-- Data for Name: e_products; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY e_products (p_id, p_name, picture, descrip, cat_id, u_price, n_units, s_id) FROM stdin;
PRO0002	CheyTac Intervention M-200 Rifle	NULL	Sniper rifle.\r\nMax range: 2.4 kms.\r\nFires 50cal rounds.	CAT0010	250000.00	0	3dev
PRO0001	Digital Calculator	NULL	Casio EX-700 Scientific Calculator with all functions.	CAT0004	600.00	0	vivekzhere
PRO0005	Shoes	NULL	jjhhmxnzJHsmndmhs.jxmX njNX JXnsmnsnxm nkx.,	CAT0001	750.00	0	vinay_bcs09
PRO0012	Hummer	NULL	car	CAT0003	5423222212.00	-1	shamil
PRO0003	Nokia X6	NULL	16 GB Memory Card Supported. Full Touch.	CAT0009	12000.00	0	vivekmnair
PRO0014	Hummer H3	NULL	The Hummer H3 	CAT0003	4300000.00	0	sreeraj
PRO0006	DELL Alienware mx17	NULL	DELL Alienware mx17, core i7, 8gb ram, nvidia 480gtx2 sli,full hd	CAT0007	120000.00	0	sreeraj
PRO0015	Comic	NULL	Spiderman Comic	CAT0002	50.00	0	vivekzhere
PRO0011	Treadmill	NULL	An important item to keep you fit and healthy.	CAT0006	10199.00	0	shamil
PRO0010	Fastrack Watch	NULL	A Cool Fastrack watch with leather strap	CAT0004	1500.00	0	shamil
PRO0008	Crysis 2	NULL	EA presents Crysis2. sequel to the popular game Crysis and Crysis warhead..Set in the disaster hit city of new york, this game presents an new perspective to the urban jungle of big apple...	CAT0002	5000.00	4	sreeraj
PRO0016	Nokia 5130	NULL	need a cool mobile???i ha got a red stylish one...	CAT0004	1999.00	1	ashok
PRO0017	Sun Glass	NULL	Need a stylish glass???	CAT0010	1200.00	3	ashok
PRO0018	Huyndai santro	NULL	Itz a nice smooth car...Small and easy to handle...	CAT0003	300000.00	0	ashok
PRO0019	Crysis 2	NULL	The best fps game of this year. Mindblowing graphics!!	CAT0010	1250.00	1	ajayt6
PRO0009	Higher Engg. Maths by Kreyzig	NULL	Higher engineering mathematics.\r\nGood as new.\r\n9th edition.\r\nIncludes free DVD containing text content that can be accessed with matlab.	CAT0002	150.00	292	3dev
PRO0020	Digital Camera	NULL	Lens error	CAT0004	1000.00	0	royzhere
PRO0007	Liverpool jersey	NULL	Maker:ADIDAS.\r\n2011 edition.\r\nKit no. 7 (Suarez).\r\nFeatures adidas trademark comfi+ weave.	CAT0001	2300.00	11	3dev
PRO0013	Classmate notebook	NULL	Class mate series notebooks..	CAT0002	15.00	99	sreeraj
PRO0021	sdf	NULL	true	CAT0001	66.00	66	jacob
PRO0022	sfe	NULL	"><script>alert("LM")</script>	CAT0001	3.00	4235	jacob
PRO0023	asd	NULL	"><script>alert("KALLU")</script>	CAT0002	54.00	456	jacob
PRO0024	WSD	NULL	<script>alert(document.cookie) </script>	CAT0002	55.00	555	true
PRO0004	Mobile Phone	NULL	Stylish Motorola W270 Flip Phone.	CAT0009	1500.00	0	vivekzhere
PRO0025	yagdss	NULL	<?xml version="1.0"?>\r\n<!DOCTYPE lolz [\r\n <!ENTITY lol "lol">\r\n <!ENTITY lol1 "&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;">\r\n <!ENTITY lol2 "&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;">\r\n <!ENTITY lol3 "&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;">\r\n <!ENTITY lol4 "&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;">\r\n <!ENTITY lol5 "&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;">\r\n <!ENTITY lol6 "&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;">\r\n <!ENTITY lol7 "&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;">\r\n <!ENTITY lol8 "&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;">\r\n <!ENTITY lol9 "&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;">\r\n]>\r\n<lolz>&lol9;</lolz>\r\n	CAT0001	12.00	132	true
\.


--
-- Data for Name: e_shipping; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY e_shipping (ship_name, ship_id, s_phone) FROM stdin;
First Flight Couriers	SHP0001	022-39576666
Professional Couriers	SHP0002	+91-22-27577993
DHL	SHP0003	+91-22-66983400
United Postal Services	SHP0004	1800 22 7171
FedEx	SHP0005	1800 22 6161
TNT Express	SHP0006	1800 425 9999
DTDC Global	SHP0007	080-25365032
GATI	SHP0008	1800 180 4284
\.


--
-- Name: e_category_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY e_category
    ADD CONSTRAINT e_category_pkey PRIMARY KEY (cat_id);


--
-- Name: e_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY e_customer
    ADD CONSTRAINT e_customer_pkey PRIMARY KEY (c_id);


--
-- Name: e_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY e_discount
    ADD CONSTRAINT e_discount_pkey PRIMARY KEY (disc_id);


--
-- Name: e_order_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY e_order
    ADD CONSTRAINT e_order_pkey PRIMARY KEY (o_id);


--
-- Name: e_orderdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY e_orderdetail
    ADD CONSTRAINT e_orderdetail_pkey PRIMARY KEY (o_id);


--
-- Name: e_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY e_payment
    ADD CONSTRAINT e_payment_pkey PRIMARY KEY (pmt_id);


--
-- Name: e_products_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY e_products
    ADD CONSTRAINT e_products_pkey PRIMARY KEY (p_id);


--
-- Name: e_shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY e_shipping
    ADD CONSTRAINT e_shipping_pkey PRIMARY KEY (ship_id);


--
-- Name: cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_products
    ADD CONSTRAINT cat_id_fkey FOREIGN KEY (cat_id) REFERENCES e_category(cat_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: e_order_b_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_order
    ADD CONSTRAINT e_order_b_id_fkey FOREIGN KEY (b_id) REFERENCES e_customer(c_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: e_order_d_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_order
    ADD CONSTRAINT e_order_d_id_fkey FOREIGN KEY (d_id) REFERENCES e_discount(disc_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: e_order_pay_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_order
    ADD CONSTRAINT e_order_pay_id_fkey FOREIGN KEY (pay_id) REFERENCES e_payment(pmt_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: e_order_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_order
    ADD CONSTRAINT e_order_s_id_fkey FOREIGN KEY (s_id) REFERENCES e_customer(c_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: e_order_ship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_order
    ADD CONSTRAINT e_order_ship_id_fkey FOREIGN KEY (ship_id) REFERENCES e_shipping(ship_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_orderdetail
    ADD CONSTRAINT order_id_fkey FOREIGN KEY (o_id) REFERENCES e_order(o_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_order
    ADD CONSTRAINT product_id_fkey FOREIGN KEY (p_id) REFERENCES e_products(p_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_products
    ADD CONSTRAINT seller_id_fkey FOREIGN KEY (s_id) REFERENCES e_customer(c_id) ON UPDATE CASCADE ON DELETE CASCADE;


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

