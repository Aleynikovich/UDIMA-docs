-- Consulta 5
/*
 Listado de artículos open access con 4 o más autores, contenidos en números de 
 journals con periodicidad trimestral gestionados por menos de 10 editores. 
*/
USE `elsevier`;
select articulo_investigacion.Titulo
from articulo_investigacion

join numero
	on articulo_investigacion.Identificador_Numero_Contiene = numero.Identificador
join journal
	on numero.ISSN_Journal_Publicado = journal.ISSN
    
where 
articulo_investigacion.Publicado_Open_Access = true AND 
journal.Periodicidad = 'Trimestral'  AND
 
-- Subquery, condicion de 4 o mas autores 
articulo_investigacion.Identificador IN
(
select realizar.Identificador_Articulo_Realizado
from realizar
group by realizar.Identificador_Articulo_Realizado
having count(Identificador_Articulo_Realizado) >= 4
) 
AND
-- Subquery, condicion de menos de 10 editores
journal.ISSN IN
(
select editor.ISSN_Journal_Gestionado
from editor
group by editor.ISSN_Journal_Gestionado
having count(editor.ISSN_Journal_Gestionado) < 10
)








