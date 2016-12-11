-- CREATE DATABASE
CREATE DATABASE drugstore;

-- CREATE TABLES
CREATE TABLE position (
  id               SERIAL      PRIMARY KEY,
  name             TEXT        NOT NULL,
  role             BOOLEAN     NOT NULL
);

CREATE TABLE profile (
  id               SERIAL      PRIMARY KEY,
  name             TEXT        NOT NULL,
  surname          TEXT        NOT NULL,
  birthdate        DATE        NOT NULL,
	phone            TEXT        NOT NULL,
  sex              BOOLEAN     NOT NULL
  user_id          INT
);

CREATE TABLE users (
  id               SERIAL      PRIMARY KEY,
  email            TEXT        NOT NULL UNIQUE,
  password         TEXT        NOT NULL,
  profile_id       INT         REFERENCES profile(id),
  position_id      INT         REFERENCES position(id)
);

ALTER TABLE profile ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE category (
  id      SERIAL     PRIMARY KEY,
  name    TEXT       NOT NULL
);

CREATE TABLE drug (
  id                SERIAL      PRIMARY KEY,
  name              TEXT        NOT NULL,
  serial_number     TEXT        NOT NULL,
  accepted_at       DATE        NOT NULL,
  expired_at        DATE        NOT NULL,
  amount            INT         NOT NULL CHECK (amount > 0),
  price             REAL        NOT NULL,
  category_id       INT         REFERENCES category(id)
);

CREATE TABLE sale (
  id        SERIAL      PRIMARY KEY,
  sold_at   DATE        NOT NULL,
  price     REAL
);

CREATE TABLE sale_item (
  id            SERIAL      PRIMARY KEY,
  drug_amount   INT         NOT NULL CHECK (drug_amount > 0),
  drug_id       INT         REFERENCES drug(id),
  sale_id       INT         REFERENCES sale(id)
);

-- Inserting into database 
-- User
INSERT INTO position (name) VALUES('admin');
INSERT INTO profile (name, surname, birthdate, phone, sex) VALUES('piotr', 'pawlus', '1994/09/08', '600600600', True);
INSERT INTO users (email, role, profile_id, position_id) VALUES('pawlus.piotrek@gmail.com', 'Adminstrator', 1, 1);

-- Drugs
INSERT INTO category (name) VALUES('Painkillers');
INSERT INTO drug (name, serial_number, accepted_at, expired_at, amount, price, category_id) VALUES('Apap', 'AXTDSAW29123kdsa', '2015/01/01', '2018/01/01', 140, 5.40, 1);
INSERT INTO sale (sold_at, price) VALUES('2016/12/16', 10.80);
INSERT INTO sale_item (drug_amount, drug_id, sale_id) VALUES(3, 1, 1);
