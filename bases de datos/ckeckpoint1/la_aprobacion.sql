-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema la_aprobacion_grupo_3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema la_aprobacion_grupo_3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `la_aprobacion_grupo_3` DEFAULT CHARACTER SET utf8 ;
USE `la_aprobacion_grupo_3` ;

-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`servicios` (
  `idservicios` INT NOT NULL,
  `servicios` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idservicios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`clases_de_habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`clases_de_habitaciones` (
  `idclases_de_habitaciones` INT NOT NULL,
  `tipo_de_habitacion` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idclases_de_habitaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`decoracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`decoracion` (
  `iddecoracion` INT NOT NULL,
  `tipo_decoracion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddecoracion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`habitaciones` (
  `idhabitaciones` INT NOT NULL,
  `clases_de_habitaciones_idclases_de_habitaciones` INT NOT NULL,
  `capacidad_maxima` TINYINT(2) NOT NULL,
  `decoracion_iddecoracion` INT NOT NULL,
  PRIMARY KEY (`idhabitaciones`, `clases_de_habitaciones_idclases_de_habitaciones`, `decoracion_iddecoracion`),
  INDEX `fk_habitaciones_clases_de_habitaciones_idx` (`clases_de_habitaciones_idclases_de_habitaciones` ASC) VISIBLE,
  INDEX `fk_habitaciones_decoracion1_idx` (`decoracion_iddecoracion` ASC) VISIBLE,
  CONSTRAINT `fk_habitaciones_clases_de_habitaciones`
    FOREIGN KEY (`clases_de_habitaciones_idclases_de_habitaciones`)
    REFERENCES `la_aprobacion_grupo_3`.`clases_de_habitaciones` (`idclases_de_habitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitaciones_decoracion1`
    FOREIGN KEY (`decoracion_iddecoracion`)
    REFERENCES `la_aprobacion_grupo_3`.`decoracion` (`iddecoracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`sectores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`sectores` (
  `idsectores` INT NOT NULL,
  `nombre_sector` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsectores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`empleados` (
  `numero_legajo` INT NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `DNI` INT(15) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `domicilio` VARCHAR(200) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `telefono_mobil` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `estado_empleado` TINYINT(1) NOT NULL,
  `sectores_idsectores` INT NOT NULL,
  PRIMARY KEY (`numero_legajo`, `sectores_idsectores`),
  INDEX `fk_empleados_sectores1_idx` (`sectores_idsectores` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_sectores1`
    FOREIGN KEY (`sectores_idsectores`)
    REFERENCES `la_aprobacion_grupo_3`.`sectores` (`idsectores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`datos_huespedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`datos_huespedes` (
  `iddatos_huespedes` INT NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `pasaporte` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `domicilio` VARCHAR(200) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `telefono_mobil` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddatos_huespedes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`formas_de_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`formas_de_pago` (
  `idformas_de_pago` INT NOT NULL,
  `nombre_forma_de_pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idformas_de_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`registros_checkin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`registros_checkin` (
  `idregistros_checkin` INT NOT NULL,
  `datos_huespedes_iddatos_huespedes` INT NOT NULL,
  `fecha_entrada` DATETIME NOT NULL,
  `fecha_salida` DATETIME NOT NULL,
  `importe` FLOAT NOT NULL,
  `habitaciones_idhabitaciones` INT NOT NULL,
  `formas_de_pago_idformas_de_pago` INT NOT NULL,
  PRIMARY KEY (`idregistros_checkin`, `datos_huespedes_iddatos_huespedes`, `habitaciones_idhabitaciones`, `formas_de_pago_idformas_de_pago`),
  INDEX `fk_registros_checkin_datos_huespedes1_idx` (`datos_huespedes_iddatos_huespedes` ASC) VISIBLE,
  INDEX `fk_registros_checkin_habitaciones1_idx` (`habitaciones_idhabitaciones` ASC) VISIBLE,
  INDEX `fk_registros_checkin_formas_de_pago1_idx` (`formas_de_pago_idformas_de_pago` ASC) VISIBLE,
  CONSTRAINT `fk_registros_checkin_datos_huespedes1`
    FOREIGN KEY (`datos_huespedes_iddatos_huespedes`)
    REFERENCES `la_aprobacion_grupo_3`.`datos_huespedes` (`iddatos_huespedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_checkin_habitaciones1`
    FOREIGN KEY (`habitaciones_idhabitaciones`)
    REFERENCES `la_aprobacion_grupo_3`.`habitaciones` (`idhabitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_checkin_formas_de_pago1`
    FOREIGN KEY (`formas_de_pago_idformas_de_pago`)
    REFERENCES `la_aprobacion_grupo_3`.`formas_de_pago` (`idformas_de_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`habitaciones_has_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`habitaciones_has_servicios` (
  `habitaciones_idhabitaciones` INT NOT NULL,
  `servicios_idservicios` INT NOT NULL,
  PRIMARY KEY (`habitaciones_idhabitaciones`, `servicios_idservicios`),
  INDEX `fk_habitaciones_has_servicios_servicios1_idx` (`servicios_idservicios` ASC) VISIBLE,
  INDEX `fk_habitaciones_has_servicios_habitaciones1_idx` (`habitaciones_idhabitaciones` ASC) VISIBLE,
  CONSTRAINT `fk_habitaciones_has_servicios_habitaciones1`
    FOREIGN KEY (`habitaciones_idhabitaciones`)
    REFERENCES `la_aprobacion_grupo_3`.`habitaciones` (`idhabitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitaciones_has_servicios_servicios1`
    FOREIGN KEY (`servicios_idservicios`)
    REFERENCES `la_aprobacion_grupo_3`.`servicios` (`idservicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`servicios_extra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`servicios_extra` (
  `idservicios_extra` INT NOT NULL,
  `nombre_servicio_extra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idservicios_extra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion_grupo_3`.`reservas_servicios_extra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion_grupo_3`.`reservas_servicios_extra` (
  `registros_checkin_idregistros_checkin` INT NOT NULL,
  `registros_checkin_formas_de_pago_idformas_de_pago` INT NOT NULL,
  `fecha_hora_reserva` DATETIME NOT NULL,
  `duracion_de_reserva` FLOAT NOT NULL,
  `importe` FLOAT NOT NULL,
  `servicios_extra_idservicios_extra` INT NOT NULL,
  PRIMARY KEY (`registros_checkin_idregistros_checkin`, `registros_checkin_formas_de_pago_idformas_de_pago`, `servicios_extra_idservicios_extra`),
  INDEX `fk_registros_checkin_has_reservas_servicios_extra_registros_idx` (`registros_checkin_idregistros_checkin` ASC, `registros_checkin_formas_de_pago_idformas_de_pago` ASC) VISIBLE,
  INDEX `fk_reservas_servicios_extra_servicios_extra1_idx` (`servicios_extra_idservicios_extra` ASC) VISIBLE,
  CONSTRAINT `fk_registros_checkin_has_reservas_servicios_extra_registros_c1`
    FOREIGN KEY (`registros_checkin_idregistros_checkin` , `registros_checkin_formas_de_pago_idformas_de_pago`)
    REFERENCES `la_aprobacion_grupo_3`.`registros_checkin` (`idregistros_checkin` , `formas_de_pago_idformas_de_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_servicios_extra_servicios_extra1`
    FOREIGN KEY (`servicios_extra_idservicios_extra`)
    REFERENCES `la_aprobacion_grupo_3`.`servicios_extra` (`idservicios_extra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
