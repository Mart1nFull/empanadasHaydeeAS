/*
	[sp_ordenarusuarioxocupacion]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de las tablas 'usuarios' y 'ocupacion' de la base de datos 
                       'empanadasHaydee' ordenandola por una ocupacion.
                       
                       - Nota: Por seguridad, se omitio el campo 'contraseña' de la tabla 'usuarios'
							   de esta consulta.
							   
	Formato de consulta: 
		CALL sp_ordenarusuarioxocupacion();
        "En este caso, no es necesario ingresar un parametro"
*/

DELIMITER $$$
CREATE PROCEDURE sp_ordenarusuarioxocupacion
(
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
    ORDER BY ocupacion;
END
$$$