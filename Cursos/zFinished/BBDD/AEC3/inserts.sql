USE `elsevier` ;


-- REGISTROS EJEMPLO DE JOURNALS, INDICAMOS TODOS LOS ATRIBUTOS EXCEPTO EL PASAPORTE DEL EDITOR JEFE
INSERT INTO JOURNAL (ISSN,Nombre,Tematica,Ultimo_Indice_Impacto,Periodicidad,Permitir_Publicaciones_Open_Access,Email_Contacto,Instrucciones_Envio) 
VALUES ('2049-3630','Immunology','Salud','2243','Mensual',TRUE,'immunology@science.com','200 New York Ave NW Washington DC 20005');
INSERT INTO JOURNAL (ISSN,Nombre,Tematica,Ultimo_Indice_Impacto,Periodicidad,Permitir_Publicaciones_Open_Access,Email_Contacto,Instrucciones_Envio) 
VALUES ('2043-5839','Robotics','Ingenieria','2532','Trimestral',TRUE,'robotics@science.com','200 New York Ave NW Washington DC 20005');
INSERT INTO JOURNAL (ISSN,Nombre,Tematica,Ultimo_Indice_Impacto,Periodicidad,Permitir_Publicaciones_Open_Access,Email_Contacto,Instrucciones_Envio) 
VALUES ('5088-1245','Information Sciences','Ciencia','5524','Bimensual',TRUE,'infosciences@science.com','200 New York Ave NW Washington DC 20005');
INSERT INTO JOURNAL (ISSN,Nombre,Tematica,Ultimo_Indice_Impacto,Periodicidad,Permitir_Publicaciones_Open_Access,Email_Contacto,Instrucciones_Envio) 
VALUES ('5245-3249','Logistics Engineering','Ingenieria Logistica','1524','Anual',FALSE,'logisticseng@science.com','200 New York Ave NW Washington DC 20005');
INSERT INTO JOURNAL (ISSN,Nombre,Tematica,Ultimo_Indice_Impacto,Periodicidad,Permitir_Publicaciones_Open_Access,Email_Contacto,Instrucciones_Envio) 
VALUES ('7334-1889','Chemical Engineering','Ingenieria Quimica','1954','Semestral',TRUE,'chemicaleng@science.com','200 New York Ave NW Washington DC 20005');
INSERT INTO JOURNAL (ISSN,Nombre,Tematica,Ultimo_Indice_Impacto,Periodicidad,Permitir_Publicaciones_Open_Access,Email_Contacto,Instrucciones_Envio) 
VALUES ('1889-2504','Civil Engineering','Ingenieria Civil','2772','Trimestral',FALSE,'civileng@science.com','200 New York Ave NW Washington DC 20005');
INSERT INTO JOURNAL (ISSN,Nombre,Tematica,Ultimo_Indice_Impacto,Periodicidad,Permitir_Publicaciones_Open_Access,Email_Contacto,Instrucciones_Envio) 
VALUES ('3784-4472','Computer Engineering','Ingenieria Informatica','4875','Mensual',TRUE,'computereng@science.com','200 New York Ave NW Washington DC 20005');

-- REGISTROS EJEMPLO DE EDITORES
INSERT INTO EDITOR VALUES ('615313585','Sarah','P.','Mclver', '1940-05-28','Hollywood Video', 50000,'sarahpmciver@dayrep.com','USA','2049-3630');
INSERT INTO EDITOR VALUES ('739560423','Ion','Medrano','Molina','1986-09-16','Shoe Pavilion', 30000,'ionmedranomolina@dayrep.com','Spain','2043-5839');
INSERT INTO EDITOR VALUES ('204388993','Pelayo','Ortiz','Molina', '1990-04-20','Shoe Pavilion', 45500,'pelayogarciaortiz@dayrep.com','Spain','5088-1245');
INSERT INTO EDITOR VALUES ('459852017','Anne','McGregor','Molina', '1998-04-22','Modern Age', 34500,'annesmithmcgregor@dayrep.com','UK','5245-3249');
INSERT INTO EDITOR VALUES ('983455771','Dominique','Dubois','Leclerc', '1992-06-29','Modern Age', 36200,'dominiqueduboisleclerc@dayrep.com','France','7334-1889');
INSERT INTO EDITOR VALUES ('103983423','Denis','Martel','Leclerc', '1992-06-22','Shoe Pavilion', 36800,'denispapemartel@dayrep.com','France','1889-2504');
INSERT INTO EDITOR VALUES ('487584931','Diane','Cock','Dukes', '1995-10-10','Modern Age', 38000,'dianecockdukes@dayrep.com','UK','3784-4472');
INSERT INTO EDITOR VALUES ('125584532', 'Jack', 'Smith', 'Jones', '1972-03-12','Modern Age', 24000, 'jackSJ@dayrep.com', 'UK', '7334-1889');
INSERT INTO EDITOR VALUES ('781231254','Olivia','Roberts','Evans', '1981-08-22','Shoe Pavilion', 21500,'oliviaREvans@dayrep.com','UK','1889-2504');
INSERT INTO EDITOR VALUES ('127361298','Emily','Wilson','Brown', '1990-04-15','Modern Age', 23000,'emilyWilson@dayrep.com','USA','3784-4472');

-- AHORA ACTUALIZAMOS LA FK QUE FALTABA DE JOURNALS, UNA VEZ LOS REGISTROS DE EDITOR HAN SIDO CREADOS
UPDATE JOURNAL SET `Pasaporte_Editor_Jefe`='615313585' WHERE JOURNAL.`ISSN` = '2049-3630';
UPDATE JOURNAL SET `Pasaporte_Editor_Jefe`='739560423' WHERE JOURNAL.`ISSN` = '2043-5839';
UPDATE JOURNAL SET `Pasaporte_Editor_Jefe`='204388993' WHERE JOURNAL.`ISSN` = '5088-1245';
UPDATE JOURNAL SET `Pasaporte_Editor_Jefe`='459852017' WHERE JOURNAL.`ISSN` = '5245-3249';
UPDATE JOURNAL SET `Pasaporte_Editor_Jefe`='983455771' WHERE JOURNAL.`ISSN` = '7334-1889';
UPDATE JOURNAL SET `Pasaporte_Editor_Jefe`='103983423' WHERE JOURNAL.`ISSN` = '1889-2504';
UPDATE JOURNAL SET `Pasaporte_Editor_Jefe`='487584931' WHERE JOURNAL.`ISSN` = '3784-4472';

-- REGISTROS EJEMPLO DE NUMEROS
INSERT INTO NUMERO VALUES('892355', 'Volume 17', '2010-04-23' ,42, TRUE,'2049-3630',615313585);
INSERT INTO NUMERO VALUES('543563', 'Volume 23', '2018-11-03', 53, TRUE,'2043-5839',739560423);
INSERT INTO NUMERO VALUES('104035', 'Volume 34', '2008-11-21', 150, FALSE,'5088-1245',204388993);
INSERT INTO NUMERO VALUES('224075', 'Volume 16', '2016-08-14', 110, FALSE,'5245-3249',459852017);
INSERT INTO NUMERO VALUES('746336', 'Volume 32', '2020-01-05', 95, FALSE,'7334-1889',983455771);
INSERT INTO NUMERO VALUES('851266', 'Volume 15', '2018-01-13', 105, FALSE,'1889-2504',103983423);
INSERT INTO NUMERO VALUES('473663', 'Volume 28', '2018-11-03', 115, TRUE,'3784-4472',487584931);

-- REGISTROS EJEMPLO DE ARTICULOS DE INVESTIGACION
INSERT INTO ARTICULO_INVESTIGACION VALUES('08572089', 'Vacuna Hepatitis B', 4,5,'10.1145/1067268.1067287',
'Investigacion de vacuna sobre la hepatitis B con excipientes que producen efectos secundarios menos severos', TRUE,'2017-05-23','2018-09-04','2018-09-04','2019-03-06','892355');

INSERT INTO ARTICULO_INVESTIGACION VALUES('08596880', 'Robots Scara', 7,10,'11.1145/1067268.6349863', 
'Calculo de la posicion final en robots Scara mediante algoritmos geneticos e inteligencia artificial', TRUE,'2017-07-29','2017-10-04','2018-04-10','2020-03-06','892355');
INSERT INTO ARTICULO_INVESTIGACION VALUES('02569440', 'The dark side of information: overload, anxiety and other paradoxes and pathologies', 20,57,'10.1177/0165551.5080957', 

'Identifying and discussing some of main issues and potential problems around the communication of recorded information an pointing to some possible solutions', TRUE,'2008-04-11','2008-06-23','2008-09-15','2008-11-21','104035');
INSERT INTO ARTICULO_INVESTIGACION VALUES('44151758', 'Trends in transportation and logistics', 8,12,'10.1177/3165551.2280957', 
'New Operation Research techniques applied to transportation and logistics', FALSE,'2016-03-29','2016-05-29','2016-07-15','2016-08-14','224075');

INSERT INTO ARTICULO_INVESTIGACION VALUES('74238758', 'Impregnated calcium-alginate beads as floating reactors for the remediation of nitrate-contaminated groundwater', 52,75,'10.1177/3165551.2280962', 
'Demonstration of effectiveness using for in-situ removal of nitrate in groundwater', FALSE,'2019-09-09','2019-10-14','2019-11-03','2019-12-07','746336');

INSERT INTO ARTICULO_INVESTIGACION VALUES('12115758', 'Evaluation of locally available synthetic macro fibers in a single-fiber pullout test in concrete', 33,38,'10.1152/3163951.2280123', 
'Investigating the fiber interface performance of four types of synthetic macro fibers locally available in the South Africa construction market', FALSE,'2018-05-31','2018-06-11','2018-08-14','2018-11-22','851266');

INSERT INTO ARTICULO_INVESTIGACION VALUES('28894558', 'Machine learning and multi-agent system in oil and gas industry applications', 44,72,'10.1277/3169851.1380957', 
'Identifying possible reasons for low and slow uptake of oil and gas industry and suggesting ways to ensure a greater adoption of these technologies', FALSE,'2017-05-09','2017-07-24','2017-09-03','2017-10-17','473663');

-- REGISTROS EJEMPLO DE INVESTIGADOR
INSERT INTO INVESTIGADOR VALUES('0000-0002-1825-0097', 'Josiah', 'Carberry', 'Stinkey', 'Brown University', 'USA', 'jc.stinkey@brownuniversity.com','PhD Clinical Chemistry');
INSERT INTO INVESTIGADOR VALUES('0000-0012-2825-0043', 'Berta', 'South', 'Arrow', 'Harvard University', 'USA', 'bs.arrow@harvard.com', 'PhD Mechatronics');
INSERT INTO INVESTIGADOR VALUES('0000-0022-5825-1521', 'Andrew', 'Dickinson', 'Smith', 'Harvard University', 'USA', 'ad.smith@hardvard.com', 'PhD Industrial Engineering');
INSERT INTO INVESTIGADOR VALUES('0000-0011-3827-1022', 'John', 'North', 'Snow', 'Cambridge University', 'UK', 'jn.snow@cambridge.com', 'PhD Industrial Engineering');
INSERT INTO INVESTIGADOR VALUES('0000-0052-1823-7545', 'David', 'Alvarez', 'De la Rosa', 'Universidad a Distancia de Madrid', 'Spain', 'da.delarosa@udima.com', 'PhD Industrial Engineering');
INSERT INTO INVESTIGADOR VALUES('0000-0075-8235-5578', 'Lucciano', 'Rossi', 'Visconti', 'Universita di Firenze', 'Italy', 'lr.visconti@firenze.com', 'PhD Industrial Engineering');
INSERT INTO INVESTIGADOR VALUES('0000-0064-1925-1143', 'Alice', 'Carroll', 'East', 'Oxford University', 'UK', 'ac.east@oxford.com', 'PhD Computer Engineering');
INSERT INTO INVESTIGADOR VALUES('0000-0075-8238-5551', 'Ava', 'Jones', 'Miller', 'Harvard University', 'USA', 'avaMiller@hardvard.com', 'PhD Industrial Engineering');
INSERT INTO INVESTIGADOR VALUES('0000-0064-1926-3612', 'Amelia', 'Taylor', 'Smith', 'Oxford University', 'UK', 'ameliaTS@oxford.com', 'PhD Computer Engineering');

-- REGISTROS EJEMPLO DE REALIZAR
INSERT INTO REALIZAR VALUES('08572089','0000-0002-1825-0097');
INSERT INTO REALIZAR VALUES('08596880','0000-0012-2825-0043');
INSERT INTO REALIZAR VALUES('02569440','0000-0022-5825-1521');
INSERT INTO REALIZAR VALUES('44151758','0000-0011-3827-1022');
INSERT INTO REALIZAR VALUES('74238758','0000-0052-1823-7545');
INSERT INTO REALIZAR VALUES('12115758','0000-0075-8235-5578');
INSERT INTO REALIZAR VALUES('28894558','0000-0064-1925-1143');
INSERT INTO REALIZAR VALUES('12115758','0000-0075-8238-5551');
INSERT INTO REALIZAR VALUES('28894558','0000-0064-1926-3612');
