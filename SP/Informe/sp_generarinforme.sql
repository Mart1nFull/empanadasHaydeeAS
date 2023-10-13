/*
	[sp_generarinforme]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de añadir (INSERT)
					   información en los campos 'id_usuario', 'id_articulo', 'id_tipo_movimiento',
                       'cantidad' y 'fecha' de la tabla 'informe' de la base de datos 'empanadasHaydee'.
                       
                       A su vez, actualiza el campo 'cantidad' de la tabla 'articulos'
                       sumando o restando la cantidad entregada por el usuario en el informe
                       dependiendo del tipo de movimiento entregado.
                       
                       --
                       1 (Entrada) = Suma.
                       2 (Salida) = Resta.
                       --
                       
	Formato de consulta: 
		CALL sp_generarinforme(x, y, z, w, yyyyMMddhhmmss);
        "x, y, z y w hacen alusión a id_usuario, id_articulo, id_tipo_movimiento y cantidad"
        "yyyyMMddhhmmss hace alusión a una fecha entregada por el usuario en formato inverso 
        (año, mes, dia, hora, minuto, segundo), siendo hora, minuto y segundo; omitibles (No se recomienda)"
        "Ej: 1, 1, 1, 2000, now(). (now() hace alusión a la fecha actual del servidor)"
        "(Solo se recomienda escribir una fecha en vez de now() en caso de generar un informe no actual)"
*/

DELIMITER %$
CREATE PROCEDURE sp_generarinforme
(
	IN _idu INT,
    IN _ida INT,
    IN _idtm TINYINT,
    IN _cantidad DOUBLE,
    IN _fecha DATETIME
)
BEGIN
	INSERT INTO informe(id_usuario, id_articulo, id_tipo_movimiento, cantidad, fecha)
    VALUES (_idu, _ida, _idtm, _cantidad, _fecha);
    
    UPDATE articulos
		INNER JOIN informe
			ON _ida = articulos.id
	SET articulos.cantidad = articulos.cantidad - informe.cantidad
	WHERE _idtm = 2
	AND articulos.cantidad > _cantidad;
    
    UPDATE articulos
		INNER JOIN informe
			ON _ida = articulos.id
	SET articulos.cantidad = articulos.cantidad + _cantidad
	WHERE _idtm = 1;
END
%$