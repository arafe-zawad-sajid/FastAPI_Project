PGDMP      8    
            |            fastapi    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24690    fastapi    DATABASE     �   CREATE DATABASE fastapi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE fastapi;
                postgres    false            �            1259    24742    posts    TABLE       CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    published boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_id integer NOT NULL
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    24741    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    218            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    217            �            1259    24699    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24705    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            !           2604    24745    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218                       2604    24707    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �          0    24742    posts 
   TABLE DATA           T   COPY public.posts (id, title, content, published, created_at, owner_id) FROM stdin;
    public          postgres    false    218   �       �          0    24699    users 
   TABLE DATA           @   COPY public.users (id, email, password, created_at) FROM stdin;
    public          postgres    false    215   �       �           0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 14, true);
          public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 16, true);
          public          postgres    false    216            )           2606    24751    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    218            %           2606    24711    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            '           2606    24713    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            *           2606    24752    posts posts_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_owner_id_fkey;
       public          postgres    false    218    4647    215            �   �   x���݊1��ۧ��bi��?��;]XۡFŷ_G��$p>�I�������r�,X�A�1~���e�����#�PǶ������zxJ���=�B��a.�≿�c{�pفFoqE ��6ޖ�~:M�U����MЁƻ+@�k�,��K$�L��e������>���뇦����V!Yw�ٿ�΅����]�k�&��D��!�������|A��      �   �   x�e���0 �u���{�d�+����1F�2��6(F�덕�����<i��0N��Y�@g�͔[$�B��Z����3���pTot��� ��.�"���w����[���P����s� 2)x�
�����5+7�~J�z;�[�m=����įT��yt7�?,�X���Cp�7��w�
p��(�XC|��m�~=�     