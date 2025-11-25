-- Elimina la base de datos si ya estaba creada
DROP SCHEMA IF EXISTS `elsevier` ;

-- Crea la base de datos y le asigna la codificacion de caracteres utf8
CREATE SCHEMA IF NOT EXISTS `elsevier` DEFAULT CHARACTER SET utf8 ;

USE `elsevier` ;

-- -----------------------------------------------------
-- Table `elsevier`.`JOURNAL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elsevier`.`JOURNAL` ;

CREATE TABLE IF NOT EXISTS `elsevier`.`JOURNAL` (
  `ISSN` VARCHAR(9) NOT NULL ,
  `Nombre` VARCHAR(40) NOT NULL ,
  `Tematica` VARCHAR(40) NOT NULL ,
  `Ultimo_Indice_Impacto` INT NULL DEFAULT NULL,
  `Periodicidad` VARCHAR(20) NOT NULL ,
  `Permitir_Publicaciones_Open_Access` BOOL NOT NULL,
  `Email_Contacto` VARCHAR(40) NOT NULL ,
  `Instrucciones_Envio` VARCHAR(80) NOT NULL ,
  `Pasaporte_Editor_Jefe` VARCHAR(12) DEFAULT NULL ,
  -- LA FK Pasaporte editor jefe se anade despues con un alter table --
  PRIMARY KEY (`ISSN`) 
);

-- -----------------------------------------------------
-- Table `elsevier`.`EDITOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elsevier`.`EDITOR` ;

CREATE TABLE IF NOT EXISTS `elsevier`.`EDITOR` (
  `Pasaporte` VARCHAR(12) NOT NULL,
  `Nombre_Pila` VARCHAR(50) NOT NULL ,
  `Primer_Apellido` VARCHAR(50) NOT NULL ,
  `Segundo_Apellido` VARCHAR(50) NOT NULL ,
  `Fecha_Nacimiento` DATE NOT NULL ,
  `Institucion` VARCHAR(50) NOT NULL ,
  `Sueldo` DECIMAL(13,2) NOT NULL ,
  `Email` VARCHAR(40) NOT NULL ,
  `Pais` VARCHAR(20) NOT NULL ,
  `ISSN_Journal_Gestionado` VARCHAR(9) DEFAULT NULL ,
  PRIMARY KEY (`Pasaporte`) ,
  FOREIGN KEY (`ISSN_Journal_Gestionado`) 
    REFERENCES `elsevier`.`JOURNAL` (`ISSN`)
);

ALTER TABLE `elsevier`.`JOURNAL`
ADD FOREIGN KEY (`Pasaporte_Editor_Jefe`) 
    REFERENCES `elsevier`.`EDITOR` (`Pasaporte` );
-- -----------------------------------------------------
-- Table `elsevier`.`NUMERO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elsevier`.`NUMERO` ;

CREATE TABLE IF NOT EXISTS `elsevier`.`NUMERO` (
  `Identificador` VARCHAR(10) NOT NULL ,
  `Titulo` VARCHAR(13) NOT NULL ,
  `Fecha_Publicacion` DATE NOT NULL ,
  `Numero_Paginas` INT NOT NULL ,
  `Numero_Especial` BOOL NOT NULL,
  `ISSN_Journal_Publicado` VARCHAR(9) DEFAULT NULL ,
  `Pasaporte_Editor_Responsable` VARCHAR(12) DEFAULT NULL ,
  PRIMARY KEY (`Identificador`) , 					
  FOREIGN KEY (`ISSN_Journal_Publicado`) 
    REFERENCES `elsevier`.`JOURNAL` (`ISSN` ),
  FOREIGN KEY (`Pasaporte_Editor_Responsable`) 
    REFERENCES `elsevier`.`EDITOR` (`Pasaporte` )
);
  
-- -----------------------------------------------------
-- Table `elsevier`.`ARTICULO_INVESTIGACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elsevier`.`ARTICULO_INVESTIGACION` ;

CREATE TABLE IF NOT EXISTS `elsevier`.`ARTICULO_INVESTIGACION` (
  `Identificador` VARCHAR(10) NOT NULL ,
  `Titulo` VARCHAR(180) NOT NULL ,
  `Numero_Pagina_Inicial` INT NOT NULL ,
  `Numero_Pagina_Final` INT NOT NULL ,
  `DOI` VARCHAR(50) NOT NULL ,
  `Resumen` VARCHAR(200) DEFAULT NULL ,
  `Publicado_Open_Access` BOOL NOT NULL,
  `Fecha_Recepcion` DATE NOT NULL ,
  `Fecha_Revision` DATE NULL DEFAULT NULL ,
  `Fecha_Aceptacion` DATE NULL DEFAULT NULL ,
  `Fecha_Disponible_Online` DATE NULL DEFAULT NULL ,
  `Identificador_Numero_Contiene` VARCHAR(10) DEFAULT NULL ,
  PRIMARY KEY (`Identificador`), 
  FOREIGN KEY (`Identificador_Numero_Contiene`) 
    REFERENCES `elsevier`.`NUMERO` (`Identificador` )
);

-- -----------------------------------------------------
-- Table `elsevier`.`INVESTIGADOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elsevier`.`INVESTIGADOR` ;

CREATE TABLE IF NOT EXISTS `elsevier`.`INVESTIGADOR` (
  `ORCID` VARCHAR(19) NOT NULL ,
  `Nombre_Pila` VARCHAR(50) NOT NULL ,
  `Primer_Apellido` VARCHAR(50) NOT NULL ,
  `Segundo_Apellido` VARCHAR(50) NOT NULL ,
  `Institucion` VARCHAR(50) NOT NULL ,
  `Pais` VARCHAR(20) NOT NULL ,
  `Email` VARCHAR(40) NOT NULL ,
  `Titulo_Universitario` VARCHAR(50) DEFAULT NULL ,
  PRIMARY KEY (`ORCID`)
);

-- -----------------------------------------------------
-- Table `elsevier`.`REALIZAR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elsevier`.`REALIZAR` ;

CREATE TABLE IF NOT EXISTS `elsevier`.`REALIZAR` (
  `Identificador_Articulo_Realizado` VARCHAR(10) NOT NULL ,
  `ORCID_Investigador_Realiza` VARCHAR(19) NOT NULL ,
  PRIMARY KEY (`Identificador_Articulo_Realizado`,`ORCID_Investigador_Realiza`),
   FOREIGN KEY (`Identificador_Articulo_Realizado`)
     REFERENCES `elsevier`.`ARTICULO_INVESTIGACION` (`Identificador` ),
   FOREIGN KEY (`ORCID_Investigador_Realiza`) 
     REFERENCES `elsevier`.`INVESTIGADOR` (`ORCID` )
);