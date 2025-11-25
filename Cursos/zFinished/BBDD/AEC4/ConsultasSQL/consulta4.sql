-- Conuslta 4 
/* Listado de los investigadores que hayan realizado algún artículo de más de 35 páginas publicado en algún número del journal
 “Information Sciences”, y cuyo editor responsable (del número) pertenezca a la misma institución que el investigador.  */
USE `elsevier`;
select investigador.Primer_Apellido as 'Primer apelldio', investigador.Segundo_Apellido as 'Segundo apellido', investigador.Nombre_Pila as 'Nombre'
from investigador

inner join realizar 
	on investigador.ORCID = realizar.ORCID_Investigador_Realiza
inner join articulo_investigacion 
	on realizar.Identificador_Articulo_Realizado = articulo_investigacion.Identificador
inner join editor 
	on editor.Institucion = investigador.Institucion
inner join numero 
	on numero.Pasaporte_Editor_Responsable = editor.Pasaporte

where 
articulo_investigacion.Numero_Pagina_Final - articulo_investigacion.Numero_Pagina_Inicial > 35 AND
numero.ISSN_Journal_Publicado = '5088-1245'




