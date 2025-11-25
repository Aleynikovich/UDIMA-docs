-- Consulta 2
-- Listado de journals ordenados por su índice de impacto de mayor a menor
USE `elsevier`;
select journal.Nombre as 'Nombre Journal', journal.Ultimo_Indice_Impacto as 'Índice Impacto'
from journal
order by Ultimo_Indice_Impacto desc
