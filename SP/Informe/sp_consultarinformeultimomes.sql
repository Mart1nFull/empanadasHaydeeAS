/*
	[sp_consultarinformeultimomes]
    Autor: Martín Mardones
    Fecha: 30/09/2023
    
    Breve descripción: "Stored Procedure" (SP) que cumple la funcionalidad de consultar (Select)
					   información de la tabla 'informe' de la base de datos 'empanadasHaydee'
                       filtrandola por el mes actual.
                       
	Formato de consulta: 
		CALL sp_consultarinformeultimomes();
        "En este caso, no es necesario entregarle ningun parametro al llamado, puesto que este; interpreta el año y mes actual automaticamente"
*/

DELIMITER $%$
CREATE PROCEDURE sp_consultarinformeultimomes
(
)
BEGIN
	SELECT *
    FROM informe i
    WHERE i.fecha LIKE concat(concat(YEAR(now()), MONTH(now())),"-", "%");
END
$%$