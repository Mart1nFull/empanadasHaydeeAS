/*
	[sp_generararticulo]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de añadir (Insert)
					   información en los campos 'nombre', 'cantidad', 'id_tipo' y 'fecha_vencimiento' 
                       de la tabla 'articulos' de la base de datos 'empanadasHaydee'.
							   
	Formato de consulta: 
		CALL sp_generararticulo(x, y, z, yyyymmdd);
        "x, y, z hace alusión al nombre, cantidad y id_tipo de articulo"
        "yyyymmdd hace alusión a la fecha en este caso, de vencimiento escrita como (año, mes y dia)"
        "Ej: 'Queso', 5000, 1, 20231030"
*/

DELIMITER $$
CREATE PROCEDURE sp_generararticulo
(
	IN _nombre VARCHAR(50),
	IN _cantidad DOUBLE,
    IN _tipo TINYINT,
    IN _vencimiento DATE
)
BEGIN
	INSERT INTO articulos (nombre, cantidad, id_tipo, fecha_vencimiento)
    VALUES (_nombre, _cantidad, _tipo, _vencimiento);
END
$$