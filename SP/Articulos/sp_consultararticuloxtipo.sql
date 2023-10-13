/*
	[sp_consultararticuloxtipo]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de la tabla 'articulos' de la base de datos 
                       'empanadasHaydee' filtrandola por un tipo.
							   
	Formato de consulta: 
		CALL sp_consultararticuloxtipo(x);
        "x hace alusión a una id, en este caso, id_tipo entregada por el usuario"
*/

DELIMITER $$
CREATE PROCEDURE sp_consultararticuloxtipo
(
	IN _tipo TINYINT
)
BEGIN
	SELECT 
		a.id Id_Articulo
        , a.nombre Nombre
        , a.cantidad Cantidad
        , a.id_tipo Id_tipo
        , ati.descripcion Tipo
        , a.fecha_vencimiento Fecha_vencimiento
	FROM articulos a
		LEFT JOIN articulos_tipo ati
			ON a.id_tipo = ati.id
	WHERE _tipo = a.id_tipo;
END
$$