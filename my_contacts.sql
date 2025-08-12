-- =============================================
-- my_contacts Database Project
-- Author: Your Name
-- Description: 6-table ERD with constraints
-- For: South Africa (9 provinces, 2 cities each)
-- =============================================

-- Drop database if exists (run separately in pgAdmin)
-- DROP DATABASE IF EXISTS my_contacts_db;
-- CREATE DATABASE my_contacts_db;

-- Connect to your database in pgAdmin

-- ---------------------------------------------
-- Table 1: provinces
-- ---------------------------------------------
CREATE TABLE provinces (
    province_id SERIAL PRIMARY KEY,
    province_name VARCHAR(50) NOT NULL UNIQUE
);

-- Insert all 9 South African provinces
INSERT INTO provinces (province_name) VALUES
('Eastern Cape'),
('Free State'),
('Gauteng'),
('KwaZulu-Natal'),
('Limpopo'),
('Mpumalanga'),
('Northern Cape'),
('North West'),
('Western Cape');

-- ---------------------------------------------
-- Table 2: zip_codes (Natural Key: zip_code)
-- ---------------------------------------------
CREATE TABLE zip_codes (
    zip_code CHAR(4) PRIMARY KEY,  -- Natural key
    city VARCHAR(50) NOT NULL,
    province_id INT NOT NULL,
    CHECK (zip_code ~ '^[0-9]{4}$')  -- Only 4 digits
);

-- Insert 2 cities per province
INSERT INTO zip_codes (zip_code, city, province_id) VALUES
-- Eastern Cape
('6000', 'Gqeberha', 1),
('5000', 'East London', 1),
-- Free State
('9300', 'Bloemfontein', 2),
('9800', 'Welkom', 2),
-- Gauteng
('2000', 'Johannesburg', 3),
('0002', 'Pretoria', 3),
-- KwaZulu-Natal
('4000', 'Durban', 4),
('3200', 'Pietermaritzburg', 4),
-- Limpopo
('0700', 'Polokwane', 5),
('0800', 'Tzaneen', 5),
-- Mpumalanga
('1050', 'Nelspruit', 6),
('2300', 'Ermelo', 6),
-- Northern Cape
('8300', 'Kimberley', 7),
('8500', 'Upington', 7),
-- North West
('2740', 'Rustenburg', 8),
('2520', 'Klerksdorp', 8),
-- Western Cape
('7500', 'Stellenbosch', 9),
('8000', 'Cape Town', 9);

-- ---------------------------------------------
-- Table 3: professions
-- ---------------------------------------------
CREATE TABLE professions (
    profession_id SERIAL PRIMARY KEY,
    profession VARCHAR(100) NOT NULL UNIQUE  -- UNIQUE constraint
);

INSERT INTO professions (profession) VALUES
('Software Engineer'),
('Graphic Designer'),
('Teacher'),
('Doctor'),
('Lawyer'),
('Accountant'),
('Chef'),
('Mechanic'),
('Nurse'),
('Police Officer'),
('Electrician'),
('Journalist'),
('Architect'),
('Pilot'),
('Dentist'),
('Farmer'),
('Actor'),
('Musician'),
('Scientist'),
('Therapist');

-- ---------------------------------------------
-- Table 4: statuses
-- ---------------------------------------------
CREATE TABLE statuses (
    status_id SERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL
);

INSERT INTO statuses (status) VALUES
('Single'),
('In a relationship'),
('Married'),
('Divorced'),
('Widowed'),
('Engaged');

-- ---------------------------------------------
-- Table 5: interests
-- ---------------------------------------------
CREATE TABLE interests (
    interest_id SERIAL PRIMARY KEY,
    interest VARCHAR(50) NOT NULL
);

INSERT INTO interests (interest) VALUES
('Reading'), ('Hiking'), ('Cooking'), ('Traveling'),
('Photography'), ('Music'), ('Sports'), ('Art'),
('Gaming'), ('Dancing'), ('Movies'), ('Fishing'),
('Yoga'), ('Cycling'), ('Writing'), ('Volunteering');

-- ---------------------------------------------
-- Table 6: my_contacts
-- ---------------------------------------------
CREATE TABLE my_contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    birthday DATE,
    profession_id INT NOT NULL,
    zip_code CHAR(4) NOT NULL,
    status_id INT NOT NULL,
    seeking_id INT NOT NULL,

    CONSTRAINT fk_profession FOREIGN KEY (profession_id) REFERENCES professions(profession_id),
    CONSTRAINT fk_zip_code FOREIGN KEY (zip_code) REFERENCES zip_codes(zip_code),
    CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES statuses(status_id),
    CONSTRAINT fk_seeking FOREIGN KEY (seeking_id) REFERENCES statuses(status_id)
);

-- Insert more than 15 contacts
INSERT INTO my_contacts (first_name, last_name, email, gender, birthday, profession_id, zip_code, status_id, seeking_id) VALUES
('Thabo', 'Mokoena', 'thabo.m@live.com', 'M', '1990-03-15', 1, '2000', 1, 6),
('Lerato', 'Nkosi', 'lerato.n@gmail.com', 'F', '1985-07-22', 2, '4000', 2, 1),
('Sipho', 'Dlamini', 'siphod@outlook.com', 'M', '1992-11-05', 3, '6000', 1, 1),
('Nomsa', 'Mthembu', 'nomsa.m@icloud.com', 'F', '1988-01-30', 4, '7500', 3, 1),
('Bongani', 'Zulu', 'bongani.z@gmail.com', 'M', '1995-05-18', 5, '9300', 1, 2),
('Ayanda', 'Peters', 'ayanda.p@live.com', 'F', '1991-09-10', 6, '8000', 1, 1),
('Kagiso', 'Khumalo', 'kagiso.k@gmail.com', 'M', '1987-12-25', 7, '0002', 2, 1),
('Zinhle', 'Mbele', 'zinhle.m@icloud.com', 'F', '1993-04-08', 8, '2740', 1, 1),
('Andile', 'Ngwenya', 'andile.n@outlook.com', 'M', '1996-06-14', 9, '1050', 1, 2),
('Tshepo', 'Mare', 'tshepo.m@gmail.com', 'M', '1989-08-19', 10, '5000', 1, 1),
('Nomvula', 'Khumalo', 'nomvula.k@live.com', 'F', '1994-10-03', 11, '9800', 1, 1),
('Mpho', 'Mokoena', 'mpho.m@icloud.com', 'F', '1997-02-20', 12, '4000', 1, 1),
('Lebo', 'Dlamini', 'lebo.d@gmail.com', 'F', '1990-04-12', 13, '8300', 1, 1),
('Sibusiso', 'Nkosi', 'sibusiso.n@outlook.com', 'M', '1986-07-07', 14, '8500', 3, 1),
('Nandi', 'Zulu', 'nandi.z@live.com', 'F', '1998-09-28', 15, '2520', 1, 1),
('Tebogo', 'Mare', 'tebogo.m@gmail.com', 'M', '1992-11-11', 16, '2300', 1, 1),
('Refilwe', 'Peters', 'refilwe.p@icloud.com', 'F', '1991-12-31', 17, '7500', 1, 1);

-- ---------------------------------------------
-- Junction Table: contact_interests (Many-to-Many)
-- ---------------------------------------------
CREATE TABLE contact_interests (
    contact_id INT,
    interest_id INT,
    PRIMARY KEY (contact_id, interest_id),
    FOREIGN KEY (contact_id) REFERENCES my_contacts(contact_id) ON DELETE CASCADE,
    FOREIGN KEY (interest_id) REFERENCES interests(interest_id) ON DELETE CASCADE
);

-- Assign each contact more than 2 interests
INSERT INTO contact_interests (contact_id, interest_id) VALUES
-- Thabo
(1, 1), (1, 3), (1, 7),
-- Lerato
(2, 2), (2, 5), (2, 9), (2, 12),
-- Sipho
(3, 4), (3, 8), (3, 10),
-- Nomsa
(4, 6), (4, 11), (4, 13),
-- Bongani
(5, 1), (5, 4), (5, 7), (5, 14),
-- Ayanda
(6, 3), (6, 6), (6, 9),
-- Kagiso
(7, 2), (7, 5), (7, 8), (7, 15),
-- Zinhle
(8, 1), (8, 4), (8, 10), (8, 16),
-- Andile
(9, 7), (9, 11), (9, 13),
-- Tshepo
(10, 2), (10, 6), (10, 9),
-- Nomvula
(11, 3), (11, 5), (11, 8), (11, 12),
-- Mpho
(12, 1), (12, 4), (12, 7), (12, 10),
-- Lebo
(13, 6), (13, 9), (13, 13),
-- Sibusiso
(14, 2), (14, 5), (14, 8), (14, 11),
-- Nandi
(15, 1), (15, 3), (15, 6), (15, 9),
-- Tebogo
(16, 4), (16, 7), (16, 10),
-- Refilwe
(17, 5), (17, 8), (17, 12), (17, 14);

-- =============================================
-- LEFT JOIN Query: Show required fields
-- =============================================

SELECT 
    p.profession AS "Profession",
    z.zip_code AS "Postal Code",
    z.city AS "City",
    prov.province_name AS "Province",
    s.status AS "Status",
    STRING_AGG(i.interest, ', ') AS "Interests",
    s2.status AS "Seeking"
FROM my_contacts mc
LEFT JOIN professions p ON mc.profession_id = p.profession_id
LEFT JOIN zip_codes z ON mc.zip_code = z.zip_code
LEFT JOIN provinces prov ON z.province_id = prov.province_id
LEFT JOIN statuses s ON mc.status_id = s.status_id
LEFT JOIN statuses s2 ON mc.seeking_id = s2.status_id
LEFT JOIN contact_interests ci ON mc.contact_id = ci.contact_id
LEFT JOIN interests i ON ci.interest_id = i.interest_id
GROUP BY p.profession, z.zip_code, z.city, prov.province_name, s.status, s2.status
ORDER BY p.profession;