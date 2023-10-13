/*
	[sp_consultarinformexid]
    Autor: Martín Mardones
    Fecha: 30/09/2023
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de las tablas 'informe', 'usuarios', 'articulos' y 'movimiento'  de la base de datos 'empanadasHaydee'
                       filtrandola por una id de la tabla 'informe'.
                       
	Formato de consulta: 
		CALL sp_consultarinformexid(x);
        "x hace alusión a una id entregada por el usuario con un limite de -2 elevado a 31 y +2 elevado a 31 (INTEGER)"
        "Ej: 1"
*/

DELIMITER $%
CREATE PROCEDURE sp_consultarinformexid
(
	IN _id INT 
)
BEGIN
	SELECT 
		i.id informe
        , i.id_usuario usuario
        , u.nombre
        , i.id_articulo articulo
        , a.nombre
        , i.id_tipo_movimiento movimiento
        , m.descripcion tipo
        , i.cantidad
        , i.fecha
    FROM informe i
		LEFT JOIN usuarios u
			ON u.id = i.id_usuario
		LEFT JOIN articulos a
			ON a.id = i.id_articulo
		LEFT JOIN movimiento m
			ON m.id_tipo = i.id_tipo_movimiento
    WHERE i.id = _id;
END
$%