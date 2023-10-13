/*
	[sp_consultarusuarioxocupacion]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de las tablas 'usuarios' y 'ocupacion' de la base de datos 
                       'empanadasHaydee' filtrandola por una id_ocupacion.
                       
                       - Nota: Por seguridad, se omitio el campo 'contraseña' de la tabla 'usuarios'
							   de esta consulta.
							   
	Formato de consulta: 
		CALL sp_consultarusuarioxocupacion(x);
        "x hace alusión a una id, en este caso, id_ocupacion entregada por el usuario"
        "Ej: 1 (Administrador)"
*/

DELIMITER $$$
CREATE PROCEDURE sp_consultarusuarioxocupacion
(
	IN _ocupacion TINYINT
)
BEGIN
	SELECT
		u.id
		, u.nombre
        , u.id_ocupacion 
        , o.descripcion ocupacion
    FROM usuarios u
		LEFT JOIN ocupacion o
			ON u.id_ocupacion = o.id
    WHERE u.id_ocupacion = _ocupacion;
END
$$$