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

