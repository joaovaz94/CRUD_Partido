CREATE SCHEMA IF NOT EXISTS `Partido_Politico` DEFAULT CHARACTER SET utf8 ;
USE `Partido_Politico` ;

-- -----------------------------------------------------
-- Tabela `Partido_Politico`.`Filiado`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Filiado` (
  `Numero_Filiacao` INT NOT NULL,
  `CPF` VARCHAR(12) NOT NULL,
  `Nome` VARCHAR(40) NOT NULL,
  `Titulo_Eleitor` VARCHAR(12) NOT NULL,
  `Contribuicao` DOUBLE NULL,
  `Cargo` VARCHAR(45) NULL,
  `Zona_Eleitoral` VARCHAR(10) NOT NULL,
  `Telefone` VARCHAR(15) NULL,
  `Email` VARCHAR(45) NULL,
  `Estado` VARCHAR(35) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Logradouro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero_Filiacao`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Presidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Presidencia` (
  `Cod_Presidencia` INT NOT NULL,
  `Filiado_Numero_Filiacao` INT NOT NULL,
  PRIMARY KEY (`Cod_Presidencia`, `Filiado_Numero_Filiacao`),

  CONSTRAINT `fk_Presidencia_Filiado`
    FOREIGN KEY (`Filiado_Numero_Filiacao`)
    REFERENCES `Partido_Politico`.`Filiado` (`Numero_Filiacao`))

ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Diretoria_Simples`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Diretoria_Simples` (
  `Cod_Diretoria_Simples` INT NOT NULL,
  PRIMARY KEY (`Cod_Diretoria_Simples`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Tesouraria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Tesouraria` (
  `Cod_Tesouraria` INT NOT NULL,
  `Filiado_Numero_Filiacao` INT NOT NULL,
  PRIMARY KEY (`Cod_Tesouraria`, `Filiado_Numero_Filiacao`),
  CONSTRAINT `fk_Tesouraria_Filiado`
    FOREIGN KEY (`Filiado_Numero_Filiacao`)
    REFERENCES `Partido_Politico`.`Filiado` (`Numero_Filiacao`))


ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Diretoria_Executiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Diretoria_Executiva` (
  `Cod_Diretoria_Executiva` INT NOT NULL,
  PRIMARY KEY (`Cod_Diretoria_Executiva`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Diretorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Diretorio` (
  `Cod_Diretorio` INT NOT NULL,
  `Presidencia_Cod_Presidencia` INT NOT NULL,
  `Diretoria_Simples_Cod_Diretoria_Simples` INT NOT NULL,
  `Tesouraria_Cod_Tesouraria` INT NOT NULL,
  `Diretoria_Executiva_Cod_Diretoria_Executiva` INT NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Abrangência` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Diretorio`),
  CONSTRAINT `fk_Diretorio_Presidencia`
    FOREIGN KEY (`Presidencia_Cod_Presidencia`)
    REFERENCES `Partido_Politico`.`Presidencia` (`Cod_Presidencia`),
  CONSTRAINT `fk_Diretorio_Diretoria_Simples`
    FOREIGN KEY (`Diretoria_Simples_Cod_Diretoria_Simples`)
    REFERENCES `Partido_Politico`.`Diretoria_Simples` (`Cod_Diretoria_Simples`),
  CONSTRAINT `fk_Diretorio_Tesouraria`
    FOREIGN KEY (`Tesouraria_Cod_Tesouraria`)
    REFERENCES `Partido_Politico`.`Tesouraria` (`Cod_Tesouraria`),
  CONSTRAINT `fk_Diretorio_Diretoria_Executiva`
    FOREIGN KEY (`Diretoria_Executiva_Cod_Diretoria_Executiva`)
    REFERENCES `Partido_Politico`.`Diretoria_Executiva` (`Cod_Diretoria_Executiva`))

ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Secretaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Secretaria` (
  `Cod_Secretaria` INT NOT NULL,
  `Diretorio_Cod_Diretorio` INT NOT NULL,
  `Filiado_Numero_Filiacao` INT NOT NULL,
  PRIMARY KEY (`Cod_Secretaria`),
  CONSTRAINT `fk_Secretaria_Diretorio`
    FOREIGN KEY (`Diretorio_Cod_Diretorio`)
    REFERENCES `Partido_Politico`.`Diretorio` (`Cod_Diretorio`),
  CONSTRAINT `fk_Secretaria_Filiado`
    FOREIGN KEY (`Filiado_Numero_Filiacao`)
    REFERENCES `Partido_Politico`.`Filiado` (`Numero_Filiacao`))


ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Caixa` (
  `Cod_Caixa` INT NOT NULL,
  `Tesouraria_Cod_Tesouraria` INT NOT NULL,
  `Saldo` DOUBLE NULL,
  PRIMARY KEY (`Cod_Caixa`),
  CONSTRAINT `fk_Caixa_Tesouraria1`
    FOREIGN KEY (`Tesouraria_Cod_Tesouraria`)
    REFERENCES `Partido_Politico`.`Tesouraria` (`Cod_Tesouraria`))

ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Distribuicao_Verba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Distribuicao_Verba` (
  `Cod_Distribuicao_Verba` INT NOT NULL,
  `Tesouraria_Cod_Tesouraria` INT NOT NULL,
  `Filiado_Numero_Filiacao` INT NOT NULL,
  `Valor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Distribuicao_Verba`),
  CONSTRAINT `fk_Distribuicao_Verba_Tesouraria1`
    FOREIGN KEY (`Tesouraria_Cod_Tesouraria`)
    REFERENCES `Partido_Politico`.`Tesouraria` (`Cod_Tesouraria`),
  CONSTRAINT `fk_Distribuicao_Verba_Filiado1`
    FOREIGN KEY (`Filiado_Numero_Filiacao`)
    REFERENCES `Partido_Politico`.`Filiado` (`Numero_Filiacao`))

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Partido_Politico`.`Atividade_Partidaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Atividade_Partidaria` (
  `Cod_Atividade_Partidaria` INT NOT NULL,
  `Distribuicao_Verba_Cod_Distribuicao_Verba` INT NOT NULL,
  `Filiado_Numero_Filiacao` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Abrangencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Atividade_Partidaria`),
  CONSTRAINT `fk_Atividade_Partidaria_Distribuicao_Verba`
    FOREIGN KEY (`Distribuicao_Verba_Cod_Distribuicao_Verba`)
    REFERENCES `Partido_Politico`.`Distribuicao_Verba` (`Cod_Distribuicao_Verba`),
  CONSTRAINT `fk_Atividade_Partidaria_Filiado`
    FOREIGN KEY (`Filiado_Numero_Filiacao`)
    REFERENCES `Partido_Politico`.`Filiado` (`Numero_Filiacao`))

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Partido_Politico`.`Candidatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Candidatura` (
  `Cod_Candidatura` INT NOT NULL,
  `Filiado_Numero_Filiacao` INT NOT NULL,
  `Distribuicao_Verba_Cod_Distribuicao_Verba` INT NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  `Ano_Eleicao` INT NOT NULL,
  `Abrangencia` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NULL,
  `Municipio` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Candidatura`),
  CONSTRAINT `fk_Candidatura_Filiado`
    FOREIGN KEY (`Filiado_Numero_Filiacao`)
    REFERENCES `Partido_Politico`.`Filiado` (`Numero_Filiacao`),
  CONSTRAINT `fk_Candidatura_Distribuicao_Verba`
    FOREIGN KEY (`Distribuicao_Verba_Cod_Distribuicao_Verba`)
    REFERENCES `Partido_Politico`.`Distribuicao_Verba` (`Cod_Distribuicao_Verba`))

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Partido_Politico`.`Filiado_tem_Diretoria_Simples`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Filiado_tem_Diretoria_Simples` (
  `Filiado_Numero_Filiacao` INT NOT NULL,
  `Diretoria_Simples_Cod_Diretoria_Simples` INT NOT NULL,
  PRIMARY KEY (`Filiado_Numero_Filiacao`, `Diretoria_Simples_Cod_Diretoria_Simples`),
  CONSTRAINT `fk_Filiado_has_Diretoria_Simples_Filiado`
    FOREIGN KEY (`Filiado_Numero_Filiacao`)
    REFERENCES `Partido_Politico`.`Filiado` (`Numero_Filiacao`),
  CONSTRAINT `fk_Filiado_has_Diretoria_Simples_Diretoria_Simples`
    FOREIGN KEY (`Diretoria_Simples_Cod_Diretoria_Simples`)
    REFERENCES `Partido_Politico`.`Diretoria_Simples` (`Cod_Diretoria_Simples`))

ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Partido_Politico`.`Filiado_tem_Diretoria_Executiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partido_Politico`.`Filiado_tem_Diretoria_Executiva` (
  `Filiado_Numero_Filiacao` INT NOT NULL,
  `Diretoria_Executiva_Cod_Diretoria_Executiva` INT NOT NULL,
  PRIMARY KEY (`Filiado_Numero_Filiacao`, `Diretoria_Executiva_Cod_Diretoria_Executiva`),
  CONSTRAINT `fk_Filiado_has_Diretoria_Executiva_Filiado`
    FOREIGN KEY (`Filiado_Numero_Filiacao`)
    REFERENCES `Partido_Politico`.`Filiado` (`Numero_Filiacao`),
  CONSTRAINT `fk_Filiado_has_Diretoria_Executiva_Diretoria_Executiva`
    FOREIGN KEY (`Diretoria_Executiva_Cod_Diretoria_Executiva`)
    REFERENCES `Partido_Politico`.`Diretoria_Executiva` (`Cod_Diretoria_Executiva`))

ENGINE = InnoDB;
