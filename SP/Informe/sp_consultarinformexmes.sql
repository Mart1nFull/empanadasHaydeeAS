/*
	[sp_consultarinformexmes]
    Autor: Martín Mardones
    Fecha: 30/09/2023
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de la tabla 'informe' de la base de datos 'empanadasHaydee'
                       filtrandola por un mes.
                       
	Formato de consulta:
		CALL sp_consultarinformexmes(x);
        "x hace alusión a un mes entregado por el usuario que no puede sobrepasar los 2 digitos"
        "Ej: 02 (Febrero)"
		
*/

DELIMITER //
CREATE PROCEDURE sp_consultarinformexmes
(
	IN _mes VARCHAR(02)
)
BEGIN
	SELECT *
    FROM informe i
    WHERE i.fecha LIKE concat("%", "-", _mes, "-", "%");
END
//