-- Consulta 3
/* Listado de journals con el numero de editores que gestionan cada
uno de menor a mayor. */
USE `elsevier`;
select journal.Nombre, count(editor.ISSN_Journal_Gestionado) as 'Gestores'
from journal
join editor 
	on journal.ISSN = editor.ISSN_Journal_Gestionado
group by journal.Nombre 
order by Gestores asc

