/*
	[sp_consultarinformexmeses]
    Autor: Martín Mardones
    Fecha: 30/09/2023 
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de la tabla 'informe' de la base de datos 'empanadasHaydee'
                       filtrandola por el pediodo entre 2 meses.
                       
	Formato de consulta: 
		CALL sp_consultarinformexmeses(x, y);
        "x e y hacen alusión a 2 meses entregados por el usuario cuyos limites son 2 digitos cada uno"
        "Ej: 01, 02 (Entre Enero y Febrero)"
*/

DELIMITER ///
CREATE PROCEDURE sp_consultarinformesxmeses
(
	IN _mes1 VARCHAR(2),
    IN _mes2 VARCHAR(2)
)
BEGIN
	SELECT *
    FROM informe i
    WHERE i.fecha BETWEEN concat("%","-", _mes1,"-","%") AND concat("%","-", _mes2,"-","%");
END
///