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
-- Name: advisor; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE advisor (
    s_id character varying(9) NOT NULL,
    i_id character varying(9) NOT NULL
);


ALTER TABLE public.advisor OWNER TO b090468cs;

--
-- Name: classroom; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE classroom (
    building character varying(20) NOT NULL,
    room_no smallint NOT NULL,
    capacity smallint NOT NULL
);


ALTER TABLE public.classroom OWNER TO b090468cs;

--
-- Name: course; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE course (
    course_id character varying(9) NOT NULL,
    title character varying(40) NOT NULL,
    dept_name character varying(20) NOT NULL,
    credits smallint NOT NULL
);


ALTER TABLE public.course OWNER TO b090468cs;

--
-- Name: department; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE department (
    dept_name character varying(20) NOT NULL,
    building character varying(50) NOT NULL,
    budget double precision NOT NULL
);


ALTER TABLE public.department OWNER TO b090468cs;

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
-- Name: instructor; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE instructor (
    id character varying(9) NOT NULL,
    name character varying(20) NOT NULL,
    dept_name character varying(20) NOT NULL,
    salary double precision NOT NULL
);


ALTER TABLE public.instructor OWNER TO b090468cs;

--
-- Name: prereq; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE prereq (
    course_id character varying(9) NOT NULL,
    prereq_id character varying(9) NOT NULL
);


ALTER TABLE public.prereq OWNER TO b090468cs;

--
-- Name: section; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE section (
    course_id character varying(9) NOT NULL,
    sec_id character varying(9) NOT NULL,
    semester character varying(20) NOT NULL,
    year smallint NOT NULL,
    building character varying(30) NOT NULL,
    room_no smallint,
    time_slot_id character varying(3) NOT NULL
);


ALTER TABLE public.section OWNER TO b090468cs;

--
-- Name: student; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE student (
    id character varying(9) NOT NULL,
    name character varying(20) NOT NULL,
    dept_name character varying(20) NOT NULL,
    tot_cred smallint
);


ALTER TABLE public.student OWNER TO b090468cs;

--
-- Name: takes; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE takes (
    id character varying(9) NOT NULL,
    course_id character varying(9) NOT NULL,
    sec_id character varying(9) NOT NULL,
    semester character varying(20) NOT NULL,
    year smallint NOT NULL,
    grade character varying(2)
);


ALTER TABLE public.takes OWNER TO b090468cs;

--
-- Name: teaches; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE teaches (
    id character varying(9) NOT NULL,
    course_id character varying(9) NOT NULL,
    sec_id character varying(9) NOT NULL,
    semester character varying(20) NOT NULL,
    year smallint NOT NULL
);


ALTER TABLE public.teaches OWNER TO b090468cs;

--
-- Name: time_slot; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE time_slot (
    time_slot_id character varying(2) NOT NULL,
    day character varying(7) NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone
);


ALTER TABLE public.time_slot OWNER TO b090468cs;

--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: b090468cs; Tablespace: 
--

CREATE TABLE vehicle (
    name character varying(20) NOT NULL,
    year character varying(5),
    make character varying(20),
    type character varying(10),
    rating integer,
    cost character varying(10)
);


ALTER TABLE public.vehicle OWNER TO b090468cs;

--
-- Data for Name: advisor; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY advisor (s_id, i_id) FROM stdin;
00128	45565
12345	10101
23121	76543
44553	22222
45678	22222
76543	45565
76653	98345
98765	98345
98988	76766
\.


--
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY classroom (building, room_no, capacity) FROM stdin;
Packard	101	500
Painter	514	10
Taylor	3128	70
Watson	100	30
Watson	120	50
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY course (course_id, title, dept_name, credits) FROM stdin;
MU-199	Music Video Production	Music	3
BIO-101	Intro. to Biology	Biology	4
BIO-301	Genetics	Biology	4
BIO-399	Computational Biology	Biology	3
CS-101	Intro. to Computer Science	Comp. Sci.	4
CS-190	Game Design	Comp. Sci.	4
CS-315	Robotics	Comp. Sci.	3
CS-319	Image Processing	Comp. Sci.	3
CS-347	Database System Concepts	Comp. Sci.	3
EE-181	Intro. to Digital Systems	Elec. Eng.	3
FIN-201	Investment Banking	Finance	3
HIS-351	World History	History	3
PHY-101	Physical Principles	Physics	4
CS-400	Game Physics	Comp. Sci.	4
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY department (dept_name, building, budget) FROM stdin;
Music	Packard	80000
Biology	Watson	90000
Comp. Sci.	Taylor	100000
Elec. Eng.	Taylor	85000
Finance	Painter	120000
History	Painter	50000
Physics	Watson	70000
\.


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



--
-- Data for Name: e_orderdetail; Type: TABLE DATA; Schema: public; Owner: b090468cs
--



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
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY instructor (id, name, dept_name, salary) FROM stdin;
15151	Mozart	Music	40000
10101	Srinivasan	Comp. Sci.	65000
12121	Wu	Finance	90000
22222	Einstein	Physics	95000
32343	El Said	History	60000
33456	Gold	Physics	87000
45565	Katz	Comp. Sci.	75000
58583	Califieri	History	62000
76543	Singh	Finance	80000
76766	Crick	Biology	72000
83821	Brandt	Comp. Sci.	92000
98345	Kim	Elec. Eng.	80000
12345	Mandan	Physics	90000
\.


--
-- Data for Name: prereq; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY prereq (course_id, prereq_id) FROM stdin;
BIO-301	BIO-101
BIO-399	BIO-101
CS-190	CS-101
CS-315	CS-101
CS-319	CS-101
CS-347	CS-101
EE-181	PHY-101
\.


--
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY section (course_id, sec_id, semester, year, building, room_no, time_slot_id) FROM stdin;
BIO-101	1	Summer	2009	Painter	514	B
BIO-301	1	Summer	2010	Painter	514	A
CS-101	1	Fall	2009	Packard	101	H
CS-101	1	Spring	2010	Packard	101	F
CS-190	1	Spring	2009	Taylor	3128	E
CS-190	2	Spring	2009	Taylor	3128	A
CS-315	1	Spring	2010	Watson	120	D
CS-319	1	Spring	2010	Watson	100	B
CS-319	2	Spring	2010	Taylor	3128	C
CS-347	1	Fall	2009	Taylor	3128	A
EE-181	1	Spring	2009	Taylor	3128	C
FIN-201	1	Spring	2010	Packard	101	B
HIS-351	1	Spring	2010	Painter	514	C
MU-199	1	Spring	2010	Packard	101	D
PHY-101	1	Fall	2009	Watson	100	A
CS-400	1	Summer	2010	Watson	100	H
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY student (id, name, dept_name, tot_cred) FROM stdin;
55739	Sanchez	Music	38
00128	Zhang	Comp. Sci.	102
12345	Shankar	Comp. Sci.	32
19991	Brandt	History	80
23121	Chavez	Finance	110
44553	Peltier	Physics	56
45678	Levy	Physics	46
54321	Williams	Comp. Sci.	54
70557	Snow	Physics	0
76543	Brown	Comp. Sci.	58
76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
98988	Tanaka	Biology	120
\.


--
-- Data for Name: takes; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY takes (id, course_id, sec_id, semester, year, grade) FROM stdin;
00128	CS-101	1	Fall	2009	A
00128	CS-347	1	Fall	2009	A-
12345	CS-190	2	Spring	2009	A
12345	CS-315	1	Spring	2010	A
19991	HIS-351	1	Spring	2010	B
23121	FIN-201	1	Spring	2010	C+
44553	PHY-101	1	Fall	2009	B-
45678	CS-101	1	Spring	2010	B+
45678	CS-319	1	Spring	2010	B
55739	MU-199	1	Spring	2010	A-
76543	CS-319	2	Spring	2010	A
76653	EE-181	1	Spring	2009	C
98988	BIO-101	1	Summer	2009	A
98988	BIO-301	1	Summer	2010	\N
12345	CS-347	1	Fall	2009	A
45678	CS-101	1	Fall	2009	F
54321	CS-101	1	Fall	2009	A-
54321	CS-190	2	Spring	2009	B+
76543	CS-101	1	Fall	2009	A
98765	CS-101	1	Fall	2009	C-
98765	CS-315	1	Spring	2010	B
12345	CS-101	1	Fall	2009	C
\.


--
-- Data for Name: teaches; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY teaches (id, course_id, sec_id, semester, year) FROM stdin;
10101	CS-101	1	Fall	2009
10101	CS-315	1	Spring	2010
10101	CS-347	1	Fall	2009
12121	FIN-201	1	Spring	2010
15151	MU-199	1	Spring	2010
22222	PHY-101	1	Fall	2009
32343	HIS-351	1	Spring	2010
45565	CS-101	1	Spring	2010
45565	CS-319	1	Spring	2010
76766	BIO-101	1	Summer	2009
76766	BIO-301	1	Summer	2010
83821	CS-190	1	Spring	2009
83821	CS-190	2	Spring	2009
83821	CS-319	2	Spring	2010
98345	EE-181	1	Spring	2009
12345	CS-400	1	Summer	2010
\.


--
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY time_slot (time_slot_id, day, start_time, end_time) FROM stdin;
A	M	08:00:00	08:50:00
A	W	08:00:00	08:50:00
A	F	08:00:00	08:50:00
B	M	09:00:00	09:50:00
B	W	09:00:00	09:50:00
B	F	09:00:00	09:50:00
C	M	11:00:00	11:50:00
C	W	11:00:00	11:50:00
C	F	11:00:00	11:50:00
D	M	13:00:00	13:50:00
D	W	13:00:00	13:50:00
D	F	13:00:00	13:50:00
E	T	10:00:00	11:45:00
E	R	10:00:00	11:45:00
F	T	14:30:00	15:45:00
F	R	14:30:00	15:45:00
G	M	16:00:00	16:50:00
G	W	16:00:00	16:50:00
G	F	16:00:00	16:50:00
H	W	10:00:00	12:30:00
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: b090468cs
--

COPY vehicle (name, year, make, type, rating, cost) FROM stdin;
Impreza	2011	Subaru	Car	2	50000
\.


--
-- Name: advisor_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY advisor
    ADD CONSTRAINT advisor_pkey PRIMARY KEY (s_id);


--
-- Name: classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (building, room_no);


--
-- Name: course_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_name);


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
-- Name: instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (id);


--
-- Name: prereq_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY prereq
    ADD CONSTRAINT prereq_pkey PRIMARY KEY (course_id, prereq_id);


--
-- Name: section_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY section
    ADD CONSTRAINT section_pkey PRIMARY KEY (course_id, sec_id, semester, year);


--
-- Name: student_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: takes_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY takes
    ADD CONSTRAINT takes_pkey PRIMARY KEY (id, course_id, sec_id, semester, year);


--
-- Name: teaches_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY teaches
    ADD CONSTRAINT teaches_pkey PRIMARY KEY (id, course_id, sec_id, semester, year);


--
-- Name: time_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY time_slot
    ADD CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id, day, start_time);


--
-- Name: vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: b090468cs; Tablespace: 
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (name);


--
-- Name: advisor_i_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY advisor
    ADD CONSTRAINT advisor_i_id_fkey FOREIGN KEY (i_id) REFERENCES instructor(id);


--
-- Name: advisor_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY advisor
    ADD CONSTRAINT advisor_s_id_fkey FOREIGN KEY (s_id) REFERENCES student(id);


--
-- Name: cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_products
    ADD CONSTRAINT cat_id_fkey FOREIGN KEY (cat_id) REFERENCES e_category(cat_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: course_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES department(dept_name);


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
-- Name: instructor_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY instructor
    ADD CONSTRAINT instructor_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES department(dept_name);


--
-- Name: order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_orderdetail
    ADD CONSTRAINT order_id_fkey FOREIGN KEY (o_id) REFERENCES e_order(o_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: prereq_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY prereq
    ADD CONSTRAINT prereq_course_id_fkey FOREIGN KEY (course_id) REFERENCES course(course_id);


--
-- Name: prereq_prereq_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY prereq
    ADD CONSTRAINT prereq_prereq_id_fkey FOREIGN KEY (prereq_id) REFERENCES course(course_id);


--
-- Name: product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_order
    ADD CONSTRAINT product_id_fkey FOREIGN KEY (p_id) REFERENCES e_products(p_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: section_building_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY section
    ADD CONSTRAINT section_building_fkey FOREIGN KEY (building, room_no) REFERENCES classroom(building, room_no);


--
-- Name: seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY e_products
    ADD CONSTRAINT seller_id_fkey FOREIGN KEY (s_id) REFERENCES e_customer(c_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES department(dept_name);


--
-- Name: takes_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY takes
    ADD CONSTRAINT takes_course_id_fkey FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year);


--
-- Name: takes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY takes
    ADD CONSTRAINT takes_id_fkey FOREIGN KEY (id) REFERENCES student(id);


--
-- Name: teaches_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY teaches
    ADD CONSTRAINT teaches_course_id_fkey FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year);


--
-- Name: teaches_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: b090468cs
--

ALTER TABLE ONLY teaches
    ADD CONSTRAINT teaches_id_fkey FOREIGN KEY (id) REFERENCES instructor(id);


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

