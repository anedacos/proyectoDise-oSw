PGDMP     #                    v            LineaBlanca    9.5.14    10.4 "    Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            \           1262    16393    LineaBlanca    DATABASE     �   CREATE DATABASE "LineaBlanca" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Ecuador.1252' LC_CTYPE = 'Spanish_Ecuador.1252';
    DROP DATABASE "LineaBlanca";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ]           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            ^           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            _           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1255    16403 !   obtenerusuario(character varying)    FUNCTION     �   CREATE FUNCTION public.obtenerusuario(nombre character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
	begin
		select * from usuarios where usuarios.username=nombre and usuarios.estado=1;
	end;
$$;
 ?   DROP FUNCTION public.obtenerusuario(nombre character varying);
       public       postgres    false    1    6            �            1259    16437    clientes    TABLE     !  CREATE TABLE public.clientes (
    cedula character varying(15) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    telefono character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    direccion character varying(150)
);
    DROP TABLE public.clientes;
       public         postgres    false    6            �            1259    16416 	   empleados    TABLE     �  CREATE TABLE public.empleados (
    cedula character varying(20) NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL,
    email character varying(25) NOT NULL,
    telefono character varying(15) NOT NULL,
    edad integer NOT NULL,
    direccion character varying(150) NOT NULL,
    idlocal integer,
    iduser integer NOT NULL,
    estado boolean DEFAULT false,
    CONSTRAINT empleados_edad_check CHECK ((edad > 17))
);
    DROP TABLE public.empleados;
       public         postgres    false    6            �            1259    16406    locales    TABLE       CREATE TABLE public.locales (
    idlocal integer NOT NULL,
    nombre character varying(50) NOT NULL,
    telefono character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    red character varying(50) NOT NULL,
    direccion character varying(100)
);
    DROP TABLE public.locales;
       public         postgres    false    6            �            1259    16404    locales_idlocal_seq    SEQUENCE     |   CREATE SEQUENCE public.locales_idlocal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.locales_idlocal_seq;
       public       postgres    false    6    184            `           0    0    locales_idlocal_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.locales_idlocal_seq OWNED BY public.locales.idlocal;
            public       postgres    false    183            �            1259    16396    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    iduser integer NOT NULL,
    username character varying(25) NOT NULL,
    passwords character varying(25) NOT NULL,
    rol character varying(50) NOT NULL,
    estado integer DEFAULT 1
);
    DROP TABLE public.usuarios;
       public         postgres    false    6            �            1259    16394    usuarios_iduser_seq    SEQUENCE     |   CREATE SEQUENCE public.usuarios_iduser_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.usuarios_iduser_seq;
       public       postgres    false    182    6            a           0    0    usuarios_iduser_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.usuarios_iduser_seq OWNED BY public.usuarios.iduser;
            public       postgres    false    181            �           2604    16409    locales idlocal    DEFAULT     r   ALTER TABLE ONLY public.locales ALTER COLUMN idlocal SET DEFAULT nextval('public.locales_idlocal_seq'::regclass);
 >   ALTER TABLE public.locales ALTER COLUMN idlocal DROP DEFAULT;
       public       postgres    false    184    183    184            �           2604    16399    usuarios iduser    DEFAULT     r   ALTER TABLE ONLY public.usuarios ALTER COLUMN iduser SET DEFAULT nextval('public.usuarios_iduser_seq'::regclass);
 >   ALTER TABLE public.usuarios ALTER COLUMN iduser DROP DEFAULT;
       public       postgres    false    181    182    182            V          0    16437    clientes 
   TABLE DATA               X   COPY public.clientes (cedula, nombre, apellido, telefono, email, direccion) FROM stdin;
    public       postgres    false    186   �&       U          0    16416 	   empleados 
   TABLE DATA               x   COPY public.empleados (cedula, nombre, apellido, email, telefono, edad, direccion, idlocal, iduser, estado) FROM stdin;
    public       postgres    false    185   y'       T          0    16406    locales 
   TABLE DATA               S   COPY public.locales (idlocal, nombre, telefono, email, red, direccion) FROM stdin;
    public       postgres    false    184   �(       R          0    16396    usuarios 
   TABLE DATA               L   COPY public.usuarios (iduser, username, passwords, rol, estado) FROM stdin;
    public       postgres    false    182   )       b           0    0    locales_idlocal_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.locales_idlocal_seq', 2, true);
            public       postgres    false    183            c           0    0    usuarios_iduser_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.usuarios_iduser_seq', 10, true);
            public       postgres    false    181            �           2606    16441    clientes clientes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cedula);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public         postgres    false    186            �           2606    16421    empleados empleados_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (cedula);
 B   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_pkey;
       public         postgres    false    185            �           2606    16413    locales locales_nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_nombre_key UNIQUE (nombre);
 D   ALTER TABLE ONLY public.locales DROP CONSTRAINT locales_nombre_key;
       public         postgres    false    184            �           2606    16411    locales locales_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_pkey PRIMARY KEY (idlocal);
 >   ALTER TABLE ONLY public.locales DROP CONSTRAINT locales_pkey;
       public         postgres    false    184            �           2606    16415    locales locales_telefono_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_telefono_key UNIQUE (telefono);
 F   ALTER TABLE ONLY public.locales DROP CONSTRAINT locales_telefono_key;
       public         postgres    false    184            �           2606    16402    usuarios usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (iduser);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    182            �           2606    16422     empleados empleados_idlocal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.locales(idlocal);
 J   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_idlocal_fkey;
       public       postgres    false    185    184    2006            �           2606    16427    empleados empleados_iduser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_iduser_fkey FOREIGN KEY (iduser) REFERENCES public.usuarios(iduser);
 I   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_iduser_fkey;
       public       postgres    false    182    2002    185            V   �   x�]пN�0����y��v�/R%*!!�0�\]S��\{I�=I:��;|����c���\J�J�#�.xc]����~���b.�H�)il���$dwSZo��C�7�3�j��O]��w��xI�r|X�<a��D�X��2�Vic}���-��X��4��
eݺZi}>ϩ�c�����x�����3LL�)5���B���{X	      U      x�eбN�0���+���؎��� !���<R��Dj�z�� ����L3.�ZWޝ�;̀g煲b��i��o�8��p�j�Ah���4�a�4 ��{�lk�"R�]8���� ����
l�ՍP���y����1J0.u7.���/���~͘V*�;�T�faʳP��5����c̐�=�
��h
��	s7�w� Y�2���Q�P�G�a.�]F�y{Z�^�/O}t5���<xjh�p�B*���q����L���ZF%�u�4}��7�8#鰩��y �      T   `   x�3�.M.-*N�Q.-�4012�0�41����KM
9d��&f��%��rC��5q!�����B0364� �j@^>� ��=... �=,/      R   �   x�U�K�0Dד� ���.��������'�����b��� i�
G�'��,,7}�urY���c�:�l��-��/�v�`a�sK-��\qP�W�%p�[<!ΕB��3��>c]��}����'����=j     