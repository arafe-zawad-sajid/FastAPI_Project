PGDMP  /                    |            practice    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    practice    DATABASE     �   CREATE DATABASE practice WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE practice;
                postgres    false            �            1259    24577    products    TABLE       CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    price integer NOT NULL,
    is_sale boolean DEFAULT false,
    inventory integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    24585    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    215            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    216                       2604    24586    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �          0    24577    products 
   TABLE DATA           S   COPY public.products (id, name, price, is_sale, inventory, created_at) FROM stdin;
    public          postgres    false    215   !       �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 26, true);
          public          postgres    false    216                       2606    24588    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    215            �   s  x����N�0��ӧ�}���;G���J �54R����xz(Rr���<3���7@R��r�Is��A�v�
g�E�!͊���Y�9$�K��o�p	��O�Mq��C ��h�O�KP�p���ؽ���ާ�P�eȳV�Wx�D�v@���'uȂ[dk��pw����'��I�s�����������
�c��M:���
v��b�C��ڏu���l[n7�	TID�sx[ל�P�����A]ߨ�u
u�$\��iJ?x�2!q���߅a���|k�M��Z��S����Uѥ��Mo_��s�*�����K!-*n+_�}�	�$�o������9��u�JAFkW�t/V��+����     