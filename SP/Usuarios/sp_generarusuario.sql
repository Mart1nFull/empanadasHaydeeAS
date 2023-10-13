/*
	[sp_generarusuario]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de añadir (Insert)
					   información en los campos 'nombre', 'contraseña' y 'id_ocupacion' 
                       de la tabla 'usuarios' de la base de datos 'empanadasHaydee'.
							   
	Formato de consulta: 
		CALL sp_generarusuario(x, y, z);
        "x, y, z hace alusión a un nombre, contraseña e id_ocupacion"
        "Ej: 'juanito', 'contraseña100%segura', 2"
*/

DELIMITER $$
CREATE PROCEDURE sp_generarusuario
(
	IN _nombre VARCHAR(50),
    IN _contraseña VARCHAR(100),
    IN _ocupacion TINYINT
)
BEGIN
	INSERT INTO usuarios(nombre, contraseña, id_ocupacion)
    VALUES (_nombre, _contraseña, _ocupacion);
END
$$