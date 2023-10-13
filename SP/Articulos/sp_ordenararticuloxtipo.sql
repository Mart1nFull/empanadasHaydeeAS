/*
	[sp_ordenararticuloxtipo]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de la tabla 'articulos' de la base de datos 
                       'empanadasHaydee' y ordenarla por tipo.
							   
	Formato de consulta: 
		CALL sp_ordenararticuloxtipo();
        "En este caso, no es necesario ingresar ningun parametro"
*/

DELIMITER $$
CREATE PROCEDURE sp_ordenararticuloxtipo
(
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
	ORDER BY tipo;
END
$$