CREATE DATABASE tucumax;
USE tucumax;

-- =========================
-- EVENTO
-- =========================
CREATE TABLE evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    precio DECIMAL(10,2),
    latitud DECIMAL(10,6),
    longitud DECIMAL(10,6),
    id_tipo INT,
    id_sponsor INT,
    FOREIGN KEY (id_tipo) REFERENCES tipo_evento(id_tipo),
    FOREIGN KEY (id_sponsor) REFERENCES sponsor(id_sponsor)
);

-- =========================
-- TIPO_EVENTO
-- =========================
CREATE TABLE tipo_evento (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- =========================
-- SPONSOR
-- =========================
CREATE TABLE sponsor (
    id_sponsor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);


-- =========================
-- RESTAURANTE
-- =========================
CREATE TABLE restaurante (
    id_restaurante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    horario VARCHAR(100),
    tipo_comida BOOLEAN,
    bebidas BOOLEAN,
    rampa BOOLEAN,
    celiacos BOOLEAN
);

-- =========================
-- HOTEL
-- =========================
CREATE TABLE hotel (
    id_hotel INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    descripcion TEXT
);

-- =========================
-- HABITACION
-- =========================
CREATE TABLE habitacion (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    precio DECIMAL(10,2),
    capacidad INT,
    id_hotel INT,
    FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)
);

-- =========================
-- SERVICIO
-- =========================
CREATE TABLE servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- =========================
-- HOTEL_SERVICIO (N:M)
-- =========================
CREATE TABLE hotel_servicio (
    id_hotel INT,
    id_servicio INT,
    PRIMARY KEY (id_hotel, id_servicio),
    FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);

-- =========================
-- CIRCUITO
-- =========================
CREATE TABLE circuito (
    id_circuito INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

-- =========================
-- LUGAR_TURISTICO
-- =========================
CREATE TABLE lugar_turistico (
    id_lugar INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    ubicacion VARCHAR(150),
    id_circuito INT,
    FOREIGN KEY (id_circuito) REFERENCES circuito(id_circuito)
);

-- =========================
-- ACTIVIDAD
-- =========================
CREATE TABLE actividad (
    id_actividad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

-- =========================
-- LUGAR_ACTIVIDAD (N:M)
-- =========================
CREATE TABLE lugar_actividad (
    id_lugar INT,
    id_actividad INT,
    PRIMARY KEY (id_lugar, id_actividad),
    FOREIGN KEY (id_lugar) REFERENCES lugar_turistico(id_lugar),
    FOREIGN KEY (id_actividad) REFERENCES actividad(id_actividad)
);

-- =========================
-- MULTIMEDIA
-- =========================
CREATE TABLE multimedia (
    id_media INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255),
    tipo ENUM('imagen','video'),
    id_evento INT,
    id_restaurante INT,
    id_hotel INT,
    id_lugar INT,
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante),
    FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel),
    FOREIGN KEY (id_lugar) REFERENCES lugar_turistico(id_lugar)
);