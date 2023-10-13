/*
	[sp_consultarusuarioxid]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de las tablas 'usuarios' y 'ocupacion' de la base de datos 
                       'empanadasHaydee' filtrandola por una id.
                       
                       - Nota: Por seguridad, se omitio el campo 'contraseña' de la tabla 'usuarios'
							   de esta consulta.
							   
	Formato de consulta: 
		CALL sp_consultarusuarioxid(x);
        "x hace alusión a una id entregada por el usuario"
        "Ej: 1"
*/

DELIMITER $$$
CREATE PROCEDURE sp_consultarusuarioxid
(
	IN _id INT
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
    WHERE u.id = _id;
END
$$$