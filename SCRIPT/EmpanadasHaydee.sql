DROP SCHEMA IF EXISTS empanadasHaydee;
CREATE SCHEMA IF NOT EXISTS empanadasHaydee
	CHARACTER SET 'utf8mb4';
    
USE empanadasHaydee;

CREATE TABLE IF NOT EXISTS ocupacion(
	id SMALLINT NOT NULL,
    descripcion VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS movimiento(
	id_tipo TINYINT NOT NULL,
    descripcion VARCHAR(20),
    PRIMARY KEY (id_tipo)
);

CREATE TABLE IF NOT EXISTS articulos_tipo(
	id TINYINT NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS usuarios(
	id INTEGER AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    id_ocupacion SMALLINT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_ocupacion) REFERENCES ocupacion(id)
);

CREATE TABLE IF NOT EXISTS articulos(
	id INTEGER AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    cantidad DOUBLE NOT NULL,
    id_tipo TINYINT NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    valor_unidad INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tipo) REFERENCES articulos_tipo(id)
);

CREATE TABLE IF NOT EXISTS informe(
	id INTEGER AUTO_INCREMENT,
    id_usuario INTEGER,
    id_articulo INTEGER,
    id_tipo_movimiento TINYINT,
    cantidad DOUBLE NOT NULL,
    fecha DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_articulo) REFERENCES articulos(id),
    FOREIGN KEY (id_tipo_movimiento) REFERENCES movimiento(id_tipo)
);