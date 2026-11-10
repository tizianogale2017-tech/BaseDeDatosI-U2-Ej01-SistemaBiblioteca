-- Base de Datos I - Unidad 4 - Ej01: SistemaBiblioteca
-- Script portable (SQLite / MySQL). En SQLite activar antes: PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Autoria;
DROP TABLE IF EXISTS Detalle_Prestamo;
DROP TABLE IF EXISTS Prestamo;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Ejemplar_Fisico;
DROP TABLE IF EXISTS Libro;
DROP TABLE IF EXISTS Autor;

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY,
    nombre_autor VARCHAR(50),
    apellido VARCHAR(50),
    nacionalidad VARCHAR(50),
    edad INT
);

CREATE TABLE Libro (
    id_libro INT PRIMARY KEY,
    isbn VARCHAR(50) UNIQUE,
    titulo VARCHAR(50),
    anio_edicion INT,
    editorial VARCHAR(50)
);

CREATE TABLE Ejemplar_Fisico (
    id_ejemplar INT PRIMARY KEY,
    id_libro INT,
    codigo_inventario VARCHAR(50) UNIQUE,
    estado_conservacion VARCHAR(50),
    disponibilidad VARCHAR(50),
    ubicacion VARCHAR(100),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    numero_legajo VARCHAR(50) UNIQUE,
    nombre VARCHAR(50),
    tipo_usuario VARCHAR(50),
    correo_institucional VARCHAR(50),
    telefono VARCHAR(100)
);

CREATE TABLE Prestamo (
    id_prestamo INT PRIMARY KEY,
    id_usuario INT,
    estado VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Detalle_Prestamo (
    id_detalle_prestamo INT PRIMARY KEY,
    id_prestamo INT,
    id_ejemplar INT,
    fecha_prestamo DATE,
    fecha_devolucion_prevista DATE,
    fecha_devolucion_real DATE,
    FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id_prestamo),
    FOREIGN KEY (id_ejemplar) REFERENCES Ejemplar_Fisico(id_ejemplar)
);

CREATE TABLE Autoria (
    id_autoria INT PRIMARY KEY,
    id_autor INT,
    id_libro INT,
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
    UNIQUE (id_autor, id_libro)
);

-- Datos de Autor
INSERT INTO Autor (id_autor, nombre_autor, apellido, nacionalidad, edad) VALUES (1, 'Gabriel', 'García Márquez', 'Colombiana', 87);
INSERT INTO Autor (id_autor, nombre_autor, apellido, nacionalidad, edad) VALUES (2, 'Isabel', 'Allende', 'Chilena', 82);
INSERT INTO Autor (id_autor, nombre_autor, apellido, nacionalidad, edad) VALUES (3, 'Julio', 'Cortázar', 'Argentina', 69);
INSERT INTO Autor (id_autor, nombre_autor, apellido, nacionalidad, edad) VALUES (4, 'Ricardo', 'Piglia', 'Argentina', 82);

-- Datos de Libro
INSERT INTO Libro (id_libro, isbn, titulo, anio_edicion, editorial) VALUES (1, '978-84-376-0494-7', 'Cien años de soledad', 2015, 'Sudamericana');
INSERT INTO Libro (id_libro, isbn, titulo, anio_edicion, editorial) VALUES (2, '978-84-204-8250-2', 'La casa de los espíritus', 2013, 'Plaza & Janés');
INSERT INTO Libro (id_libro, isbn, titulo, anio_edicion, editorial) VALUES (3, '978-987-566-001-3', 'Rayuela', 2012, 'Alfaguara');
INSERT INTO Libro (id_libro, isbn, titulo, anio_edicion, editorial) VALUES (4, '978-950-731-001-4', 'Respiración artificial', 2010, 'Sudamericana');

-- Datos de Ejemplar_Fisico
INSERT INTO Ejemplar_Fisico (id_ejemplar, id_libro, codigo_inventario, estado_conservacion, disponibilidad) VALUES (1, 1, 'INV-0001', 'Bueno', 'Disponible');
INSERT INTO Ejemplar_Fisico (id_ejemplar, id_libro, codigo_inventario, estado_conservacion, disponibilidad) VALUES (2, 1, 'INV-0002', 'Regular', 'Prestado');
INSERT INTO Ejemplar_Fisico (id_ejemplar, id_libro, codigo_inventario, estado_conservacion, disponibilidad) VALUES (3, 2, 'INV-0004', 'Bueno', 'Prestado');
INSERT INTO Ejemplar_Fisico (id_ejemplar, id_libro, codigo_inventario, estado_conservacion, disponibilidad) VALUES (4, 3, 'INV-0005', 'Regular', 'Prestado');

-- Datos de Usuario
INSERT INTO Usuario (id_usuario, numero_legajo, nombre, tipo_usuario, correo_institucional) VALUES (1, 'L-3001', 'Camila Ruiz', 'Alumno', 'cruiz@uch.edu.ar');
INSERT INTO Usuario (id_usuario, numero_legajo, nombre, tipo_usuario, correo_institucional) VALUES (2, 'L-3002', 'Matías Gómez', 'Alumno', 'mgomez@uch.edu.ar');
INSERT INTO Usuario (id_usuario, numero_legajo, nombre, tipo_usuario, correo_institucional) VALUES (3, 'L-3004', 'Agustín Paz', 'Alumno', 'apaz@uch.edu.ar');
INSERT INTO Usuario (id_usuario, numero_legajo, nombre, tipo_usuario, correo_institucional) VALUES (4, 'L-3005', 'Hugo Lara', 'Docente', 'hlara@uch.edu.ar');

-- Datos de Prestamo
INSERT INTO Prestamo (id_prestamo, id_usuario, estado) VALUES (1, 1, 'Finalizado');
INSERT INTO Prestamo (id_prestamo, id_usuario, estado) VALUES (2, 2, 'Activo');
INSERT INTO Prestamo (id_prestamo, id_usuario, estado) VALUES (3, 1, 'Activo');
INSERT INTO Prestamo (id_prestamo, id_usuario, estado) VALUES (4, 3, 'Activo');

-- Datos de Detalle_Prestamo
INSERT INTO Detalle_Prestamo (id_detalle_prestamo, id_prestamo, id_ejemplar, fecha_prestamo, fecha_devolucion_prevista) VALUES (1, 1, 1, '2026-09-01', '2026-09-15');
INSERT INTO Detalle_Prestamo (id_detalle_prestamo, id_prestamo, id_ejemplar, fecha_prestamo, fecha_devolucion_prevista) VALUES (2, 2, 2, '2026-09-10', '2026-09-24');
INSERT INTO Detalle_Prestamo (id_detalle_prestamo, id_prestamo, id_ejemplar, fecha_prestamo, fecha_devolucion_prevista) VALUES (3, 3, 3, '2026-10-01', '2026-10-15');
INSERT INTO Detalle_Prestamo (id_detalle_prestamo, id_prestamo, id_ejemplar, fecha_prestamo, fecha_devolucion_prevista) VALUES (4, 4, 4, '2026-10-05', '2026-10-19');

-- Datos de Autoria
INSERT INTO Autoria (id_autoria, id_autor, id_libro) VALUES (1, 1, 1);
INSERT INTO Autoria (id_autoria, id_autor, id_libro) VALUES (2, 2, 2);
INSERT INTO Autoria (id_autoria, id_autor, id_libro) VALUES (3, 3, 3);
INSERT INTO Autoria (id_autoria, id_autor, id_libro) VALUES (4, 4, 4);
