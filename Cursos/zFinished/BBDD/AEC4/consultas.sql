-- ---------------------------------------------------------------------------------------
-- Consulta 1
-- ---------------------------------------------------------------------------------------
-- Mostrar listado de editores y journal al que prestan sus servicios
USE `elsevier`;
select editor.Primer_Apellido as 'Primero apellido', editor.Segundo_Apellido as'Segundo apellido', 
editor.Nombre_Pila as 'Nombre Editor', journal.Nombre as 'Nombre journal gestionado'
from editor
inner join journal 
	on editor.ISSN_Journal_Gestionado = journal.ISSN;
   
   
-- ---------------------------------------------------------------------------------------
-- Consulta 2
-- ---------------------------------------------------------------------------------------
-- Listado de journals ordenados por su índice de impacto de mayor a menor
USE `elsevier`;
select journal.Nombre as 'Nombre Journal', journal.Ultimo_Indice_Impacto as 'Índice Impacto'
from journal
order by Ultimo_Indice_Impacto desc;


-- ---------------------------------------------------------------------------------------
-- Consulta 3
-- ---------------------------------------------------------------------------------------
/* Listado de journals con el numero de editores que gestionan cada
uno de menor a mayor. */
USE `elsevier`;
select journal.Nombre, count(editor.ISSN_Journal_Gestionado) as 'Gestores'
from journal
join editor 
	on journal.ISSN = editor.ISSN_Journal_Gestionado
group by journal.Nombre 
order by Gestores asc;


-- ---------------------------------------------------------------------------------------
-- Conuslta 4 
-- ---------------------------------------------------------------------------------------
/* Listado de los investigadores que hayan realizado algún artículo de más de 35 páginas publicado en algún número del journal
 “Information Sciences”, y cuyo editor responsable (del número) pertenezca a la misma institución que el investigador.  */
USE `elsevier`;
select distinct investigador.Primer_Apellido as 'Primer apelldio', investigador.Segundo_Apellido as 'Segundo apellido', investigador.Nombre_Pila as 'Nombre'
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
numero.ISSN_Journal_Publicado = '5088-1245';



-- ---------------------------------------------------------------------------------------
-- Consulta 5
-- ---------------------------------------------------------------------------------------
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
);


-- ---------------------------------------------------------------------------------------
-- Consulta 6
-- ---------------------------------------------------------------------------------------
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
); 



-- ---------------------------------------------------------------------------------------
-- Consulta 7
-- ---------------------------------------------------------------------------------------
/*
Número medio de artículos por número (se pide un único valor).
*/
USE `elsevier`;
select avg(articulosPorNumero) as 'Media articulos por numero'
from
(
	select count(articulo_investigacion.Identificador_Numero_Contiene) as articulosPorNumero
	from articulo_investigacion
	group by articulo_investigacion.Identificador_Numero_Contiene
) tablaArticulosPorNumero; -- Tabla derivada



