-- 1. Crear Base de Datos (Opcional pero ayuda)
CREATE DATABASE universe;
\c universe

-- 2. Crear Tablas
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    age INT,
    galaxy_type TEXT,
    diameter NUMERIC(10,2),
    mass NUMERIC(10,2),
    has_black_hole BOOLEAN,
    is_active BOOLEAN
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    age INT NOT NULL,
    star_type TEXT,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE,
    diameter NUMERIC(10,2),
    mass NUMERIC(10,2),
    temp_in_kelvin NUMERIC(10,2)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    age INT,
    planet_type TEXT,
    star_id INT REFERENCES star(star_id) ON DELETE CASCADE,
    is_exoplanet BOOLEAN,
    has_life BOOLEAN,
    has_atmosphere BOOLEAN
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    age INT,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE,
    has_atmosphere BOOLEAN,
    has_geologic_activity BOOLEAN
);

CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

-- 3. Insertar Datos (6 Galaxias, 6 Estrellas, 12 Planetas, 20 Lunas, 3 Constelaciones)
INSERT INTO galaxy (name, age, galaxy_type, diameter, mass, has_black_hole, is_active) VALUES 
('Vía Láctea', 13000, 'Espiral', 100000, 1.5, TRUE, TRUE), ('Andrómeda', 10000, 'Espiral', 220000, 1.2, TRUE, TRUE), ('Sombrero', 13200, 'Lenticular', 50000, 0.8, TRUE, FALSE), ('Triángulo', 12000, 'Espiral', 60000, 0.5, FALSE, TRUE), ('Centaurus A', 13000, 'Elíptica', 97000, 1.0, TRUE, TRUE), ('Bode', 13500, 'Espiral', 90000, 1.1, TRUE, FALSE);

INSERT INTO star (name, age, star_type, galaxy_id, diameter, mass, temp_in_kelvin) VALUES 
('Sol', 4600, 'G2V', 1, 1, 1, 5778), ('Sirius', 242, 'A1V', 1, 2, 2, 9940), ('Alpheratz', 60, 'B8IV', 2, 2, 3, 13800), ('Sombrero-Alpha', 1000, 'Gigante', 3, 15, 20, 25000), ('Trianguli-1', 500, 'Enana', 4, 0, 0, 10000), ('Bode-Prime', 8000, 'Supergigante', 6, 900, 15, 3500);

INSERT INTO planet (name, planet_type, star_id, is_exoplanet, has_life, has_atmosphere) VALUES 
('Tierra', 'Terrestre', 1, FALSE, TRUE, TRUE), ('Marte', 'Terrestre', 1, FALSE, FALSE, TRUE), ('Sirius-B1', 'Gaseoso', 2, TRUE, FALSE, TRUE), ('Sirius-B2', 'Rocoso', 2, TRUE, FALSE, FALSE), ('Alph-9', 'Neptuniano', 3, TRUE, FALSE, TRUE), ('Alph-10', 'Super-Tierra', 3, TRUE, FALSE, TRUE), ('Somb-X1', 'Joviano', 4, TRUE, FALSE, TRUE), ('Somb-X2', 'Desierto', 4, TRUE, FALSE, TRUE), ('Tri-Alpha', 'Hielo', 5, TRUE, FALSE, FALSE), ('Tri-Beta', 'Oceánico', 5, TRUE, TRUE, TRUE), ('Bode-99', 'Gigante', 6, TRUE, FALSE, TRUE), ('Bode-100', 'Carbonoso', 6, TRUE, FALSE, FALSE);

INSERT INTO moon (name, planet_id, has_atmosphere, has_geologic_activity) VALUES 
('Luna', 1, FALSE, FALSE), ('Fobos', 2, FALSE, FALSE), ('Deimos', 2, FALSE, FALSE), ('Dogstar-1', 3, TRUE, TRUE), ('Dogstar-2', 3, TRUE, FALSE), ('Pup-A', 4, FALSE, TRUE), ('Alpha-Moon-1', 5, TRUE, TRUE), ('Alpha-Moon-2', 5, FALSE, FALSE), ('A10-Satellite', 6, TRUE, TRUE), ('Somb-Luna-A', 7, TRUE, FALSE), ('Somb-Luna-B', 7, FALSE, TRUE), ('Dust-1', 8, FALSE, FALSE), ('Dust-2', 8, FALSE, FALSE), ('Ice-Ball-1', 9, FALSE, TRUE), ('Ocean-Moon', 10, TRUE, TRUE), ('Bode-Guardian', 11, TRUE, TRUE), ('Bode-Shadow', 11, FALSE, FALSE), ('Carbon-Rock', 12, FALSE, FALSE), ('Dark-Moon', 12, FALSE, TRUE), ('Extra-Moon', 12, FALSE, FALSE);

INSERT INTO constellation (name, galaxy_id) VALUES ('Orión', 1), ('Osa Mayor', 1), ('Casiopea', 1);
