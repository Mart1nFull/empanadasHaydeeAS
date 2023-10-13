/*
	Este script de datos sobre la base de datos "empanadasHaydee"
	Es de caracter meramente, ejemplar.
    No son los datos reales ni oficiales.
*/

USE empanadasHaydee;

-- Articulos_tipo
INSERT INTO articulos_tipo(id, descripcion) VALUES (1,"Ingrediente"), (2, "Producto");
-- SELECT * FROM articulos_tipo;

-- Movimiento
INSERT INTO movimiento(id_tipo, descripcion) VALUES (1, "Entrada"), (2, "Salida");
-- SELECT * FROM movimiento;

-- Ocupacion 
INSERT INTO ocupacion(id, descripcion) VALUES (1, "Administrador"), (2, "Empleado");
-- SELECT * FROM ocupacion;

-- Articulos
INSERT INTO articulos(nombre, cantidad, id_tipo, fecha_vencimiento) VALUES("Harina", 10000, 1, 20241001), ("Empanada de Pino", 30, 2, 20231005);
SELECT * FROM articulos;

-- Usuarios
INSERT INTO usuarios(nombre, contraseña, id_ocupacion) VALUES ("empanadashaydee", "admin", 1), ("pepito", "123123", 2);
-- SELECT * FROM usuarios;

-- Informe
SELECT * FROM informe;

/*

--
-- Poblado mediante sp
--

CALL sp_consultarusuarioxid(2);
CALL sp_consultararticuloxid(1);
CALL sp_generarinforme(2, 1, 2, 1000, now());
CALL sp_generarinforme(2, 2, 1, 10, now());
CALL sp_generarinforme(2, 1, 1, 2000, 20230710);
CALL sp_generarinforme(2, 1, 1, 2000, 20220710);
CALL sp_consultarinformexid(1);
CALL sp_consultarinformeultimomes();
CALL sp_consultarinformexmes("07");
CALL sp_consultarinformesxmeses("07", "10");

*/