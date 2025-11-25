-- Consulta 6
/*
Sueldo medio de los editores, jefes de algún journal con algún número especial publicado en 2018.
*/
USE `elsevier`;
select AVG(editor.Sueldo) as 'Sueldo Medio'
from editor
where
-- Subquery, editores que son jefe de un journal
editor.Pasaporte IN
(
	select journal.Pasaporte_Editor_Jefe
	from journal
	where
	-- Subsubquery, journals que contienen un numero especial y que sea publicado en 2018
	journal.ISSN IN
		(
			select numero.ISSN_Journal_Publicado
			from numero
			where
			numero.Numero_Especial = true AND
            numero.Fecha_Publicacion >= '2018-01-01' AND
            numero.Fecha_Publicacion < '2019-01-01'
		)
)

