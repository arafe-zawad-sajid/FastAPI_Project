PGDMP      2                |            fastapi    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16437    fastapi    DATABASE     �   CREATE DATABASE fastapi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE fastapi;
                postgres    false            �            1259    16438    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    published boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16445    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    215            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    216            �            1259    16462    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16461    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    217                       2604    16446    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            "           2604    16465    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    16438    posts 
   TABLE DATA           J   COPY public.posts (id, title, content, published, created_at) FROM stdin;
    public          postgres    false    215   =       �          0    16462    users 
   TABLE DATA           @   COPY public.users (id, email, password, created_at) FROM stdin;
    public          postgres    false    218   )       �           0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 23, true);
          public          postgres    false    216            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 14, true);
          public          postgres    false    217            %           2606    16448    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    215            '           2606    16472    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    218            )           2606    16470    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �   �   x����j� �y
�eEG���ҋD�,$�4��}��L{)��_�ǌ���2�5s��i/K,�m���4�	�"�<W�	`�C�$�'��tZ��	�i* �h�n��X*�����F�Xs�(���z�)�팂��W��݁�o)RN����4�B�Я�T�: 
gG���� \�t�^X��M4+��G�G��?����1�'�r�}�G1���s�      �   �   x�e�I�0 �5��;cm?-�� FP$
1q��Ԃq��Ɲ���M�98�R�ЮU�[���UA_����P�7�[��9[��I�	�"|G�H(9����X�H����6=�z�  ӵX[:�Z���?KvX�w���ZH4��l�=�>��d���OF"^d�J?��0���7#���( e�7� ]�?$�=�     