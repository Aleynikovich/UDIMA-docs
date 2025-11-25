-- Consulta 1
-- Mostrar listado de editores y journal al que prestan sus servicios
USE `elsevier`;
select editor.Primer_Apellido as 'Primero apellido', editor.Segundo_Apellido as'Segundo apellido', 
editor.Nombre_Pila as 'Nombre Editor', journal.Nombre as 'Nombre journal gestionado'
from editor
inner join journal 
	on editor.ISSN_Journal_Gestionado = journal.ISSN
