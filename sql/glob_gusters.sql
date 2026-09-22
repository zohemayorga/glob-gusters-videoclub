-- Base de Datos Relacional Glob-Gusters Video-Club
-- Autor: Zohe Lorena Mayorga Cardenas
-- Fecha: 2026-09-15

-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS `glob_gusters` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glob_gusters`;

-- Eliminación de la base de datos
-- DROP DATABASE IF EXISTS `glob_gusters`;

CREATE TABLE Productora (
    ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Estado (
    ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Nacionalidad (
    ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
    
);

CREATE TABLE Director (
    ID INTEGER PRIMARY KEY,
    Nacionalidad_ID INTEGER,
    Nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (Nacionalidad_ID) REFERENCES Nacionalidad(ID)
);

CREATE TABLE Actor (
    ID INTEGER PRIMARY KEY,
    Nacionalidad_ID INTEGER,
    Nombre VARCHAR(100) NOT NULL,
    Sexo CHAR(1),
    FOREIGN KEY (Nacionalidad_ID) REFERENCES Nacionalidad(ID)
);

CREATE TABLE Cliente (
    DNI INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Telefono VARCHAR(30)
);

CREATE TABLE Renta (
    Numero INTEGER PRIMARY KEY,
    Cliente_DNI INTEGER NOT NULL,
    Inicia DATETIME,
    Termina DATETIME,
    FOREIGN KEY (Cliente_DNI) REFERENCES Cliente(DNI)
);

CREATE TABLE Pelicula (
    ID INTEGER PRIMARY KEY,
    Productora_ID INTEGER,
    Nacionalidad_ID INTEGER,
    Titulo VARCHAR(200) NOT NULL,
    Director_ID INTEGER,
    Fecha DATETIME,
    FOREIGN KEY (Productora_ID) REFERENCES Productora(ID),
    FOREIGN KEY (Nacionalidad_ID) REFERENCES Nacionalidad(ID),
    FOREIGN KEY (Director_ID) REFERENCES Director(ID)
);

CREATE TABLE Ejemplar (
    Numero INTEGER PRIMARY KEY,
    Estado_ID INTEGER,
    Pelicula_ID INTEGER,
    FOREIGN KEY (Estado_ID) REFERENCES Estado(ID),
    FOREIGN KEY (Pelicula_ID) REFERENCES Pelicula(ID)
);

CREATE TABLE Ejemplar_Renta (
    Ejemplar_Numero INTEGER,
    Renta_Numero INTEGER,
    Entrega DATETIME,
    PRIMARY KEY (Ejemplar_Numero, Renta_Numero),
    FOREIGN KEY (Ejemplar_Numero) REFERENCES Ejemplar(Numero),
    FOREIGN KEY (Renta_Numero) REFERENCES Renta(Numero)
);

CREATE TABLE Reparto (
    Actor_ID INTEGER,
    Pelicula_ID INTEGER,
    Rol VARCHAR(100),
    PRIMARY KEY (Actor_ID, Pelicula_ID),
    FOREIGN KEY (Actor_ID) REFERENCES Actor(ID),
    FOREIGN KEY (Pelicula_ID) REFERENCES Pelicula(ID)
);