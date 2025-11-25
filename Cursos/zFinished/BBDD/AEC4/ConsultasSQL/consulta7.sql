-- Consulta 7
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
) tablaArticulosPorNumero -- Tabla derivada

