CREATE DATABASE db_cocktails
    WITH 
    OWNER = postgres
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'Slovak_Slovakia.1250'
    LC_CTYPE = 'Slovak_Slovakia.1250'
    CONNECTION LIMIT = -1;
    
CREATE SCHEMA co
    AUTHORIZATION postgres;
    
CREATE TABLE co.t_ingredients
(
    ingredients_id bigserial NOT NULL,
    name character varying(50) NOT NULL,
    PRIMARY KEY (ingredients_id)
);

ALTER TABLE co.t_ingredients
    OWNER to postgres;
    
CREATE TABLE co.t_cocktails
(
    cocktail_id bigserial NOT NULL,
    name character varying(50) NOT NULL,
    url character varying(1000) NOT NULL,
    PRIMARY KEY (cocktail_id)
);

ALTER TABLE co.t_cocktails
    OWNER to postgres;
    
CREATE TABLE co.t_cocktails_x_ingrediets
(
    cocktails_id bigserial NOT NULL,
    ingredients_id bigserial NOT NULL,
    FOREIGN KEY (cocktails_id)
        REFERENCES co.t_cocktails (cocktail_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY (ingredients_id)
        REFERENCES co.t_ingredients (ingredients_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE co.t_cocktails_x_ingrediets
    OWNER to postgres;