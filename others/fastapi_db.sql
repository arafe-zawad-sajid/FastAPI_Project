PGDMP      *                 |            fastapi    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16411    fastapi    DATABASE     �   CREATE DATABASE fastapi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE fastapi;
                postgres    false            �            1259    16413    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    published boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16412    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    216            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    215                       2604    16416    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16413    posts 
   TABLE DATA           J   COPY public.posts (id, title, content, published, created_at) FROM stdin;
    public          postgres    false    216   �
       �           0    0    posts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.posts_id_seq', 4, true);
          public          postgres    false    215                       2606    16422    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    216            �   [   x�3�L�,*.Q(�/.���+I-J-.��KW(.)MK�,�4202�50�5�P04�21�25�3630�60�2�,NM��K��LLI�ac���� Ѧ!     