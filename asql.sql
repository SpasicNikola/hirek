-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ahazi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ahazi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ahazi` DEFAULT CHARACTER SET utf8 ;
USE `ahazi` ;

-- -----------------------------------------------------
-- Table `ahazi`.`hir`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ahazi`.`hir` (
  `idh` INT NOT NULL AUTO_INCREMENT,
  `megjdatum` VARCHAR(45) NOT NULL,
  `szoveg` VARCHAR(45) NOT NULL,
  `cim` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idh`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ahazi`.`hozzaszol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ahazi`.`hozzaszol` (
  `idhoz` INT NOT NULL AUTO_INCREMENT,
  `nevhoz` VARCHAR(45) NOT NULL,
  `komment` VARCHAR(45) NOT NULL,
  `hir_idh` INT NOT NULL,
  PRIMARY KEY (`idhoz`, `hir_idh`),
  INDEX `fk_hozzaszol_hir_idx` (`hir_idh` ASC),
  CONSTRAINT `fk_hozzaszol_hir`
    FOREIGN KEY (`hir_idh`)
    REFERENCES `ahazi`.`hir` (`idh`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO hir(megjdatum,szoveg,cim)
VALUES
('2021-2-3','Baszom a szad','Elso'),
('2022-26-23','Baszom','Masodik'),
('2022-25-28','Basz','Harmadik');

INSERT INTO hozzaszol(nevhoz,komment,hir_idh)
VALUES
('Janos','baszos',1),
('Janoska','baszos geci',1),
('Jancsi','baszoska',2);

INSERT INTO hir(megjdatum,szoveg,cim)
VALUES
('2021-2-3','Baszom a szad','Elso'),
('2022-26-23','Baszom','Masodik'),
('2022-25-28','Basz','Harmadik');

INSERT INTO hozzaszol(nevhoz,komment,hir_idh)
VALUES
('Janos','baszos',1),
('Janoska','baszos geci',1),
('Jancsi','baszoska',2);

SELECT 
	idh,
    hir.cim,
    hir.megjdatum,
    hir.szoveg,
    COUNT(hozzaszol.idhoz) AS szam
FROM 
    hir
LEFT JOIN 
    hozzaszol 
ON 
    hozzaszol.hir_idh = hir.idh
GROUP BY 
    hir.cim;

SELECT nevhoz,komment,hir_idh FROM hozzaszol;
SELECT
    idh,
    hir.cim AS cimecske,
    hir.megjdatum AS datumocska,
    hir.szoveg AS szovegecske,
    COUNT(hozzaszol.idhoz) AS szam
FROM 
    hir
LEFT JOIN 
    hozzaszol 
ON 
    hozzaszol.hir_idh = hir.idh
GROUP BY 
    hir.cim

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
