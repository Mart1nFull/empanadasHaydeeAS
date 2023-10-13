/*
	[sp_consultararticuloxid]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de las tablas 'articulos' y 'articulos_tipo' de la base de datos 
                       'empanadasHaydee' filtrandola por una id.
							   
	Formato de consulta: 
		CALL sp_consultararticuloxid(x);
        "x hace alusión a una id entregada por el usuario"
        "Ej: 1"
*/

DELIMITER $$
CREATE PROCEDURE sp_consultararticuloxid
(
	IN _id INT
)
BEGIN
	SELECT 
		a.id
        , a.nombre
        , a.cantidad
        , a.id_tipo
        , ati.descripcion tipo
        , a.fecha_vencimiento
	FROM articulos a
		LEFT JOIN articulos_tipo ati
			ON a.id_tipo = ati.id
	WHERE a.id = _id;
END
$$