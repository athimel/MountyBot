
CREATE TABLE guilde (
    id integer PRIMARY KEY,
    nom text NOT NULL
);

CREATE TABLE troll (
    id integer PRIMARY KEY,
    nom text NOT NULL,
    race text  NOT NULL,
    nival integer NOT NULL,
    guilde integer REFERENCES guilde(id),
    blason text,
    CONSTRAINT races CHECK (race = 'Kastar' OR race = 'Durakuir' OR race = 'Skrim' OR race = 'Tomawak' OR race = 'Darkling' OR race = 'Nkrwapu')
);

CREATE TABLE credentials (
    id integer REFERENCES troll(id) PRIMARY KEY,
    password text NOT NULL
);

CREATE TABLE update (
    id BIGSERIAL PRIMARY KEY,
    script text NOT NULL,
    troll integer REFERENCES troll(id) NOT NULL,
    date timestamp NOT NULL,
    by text REFERENCES users(login) NOT NULL,
    CONSTRAINT scripts CHECK (script = 'SP_Vue2' OR script = 'SP_Caract' OR script = 'SP_Profil2')
);

CREATE TABLE monster (
    id integer PRIMARY KEY,
    nom text NOT NULL,
    pos_x integer,
    pos_y integer,
    pos_n integer,
    base_name text,
    family text,
    base_nival int4range,
    template text,
    template_bonus integer,
    age text,
    age_bonus integer,
    nival int4range
);

CREATE TABLE voit (
    id BIGSERIAL REFERENCES update(id),
    monstre integer REFERENCES monster(id),
    pos_x integer NOT NULL,
    pos_y integer NOT NULL,
    pos_n integer NOT NULL,
    distance integer NOT NULL,
    CONSTRAINT voit_pk PRIMARY KEY (id, monstre)
);

