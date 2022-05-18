CREATE SCHEMA `faesa`;


CREATE TABLE `faesa`.`dim_aluno` (
  `id_aluno` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `matricula` INT NOT NULL,
  `cpf` INT(11) NOT NULL,
  `endereco` VARCHAR(500) NULL,
  `telefone` INT(11) NULL,
  `sexo` CHAR(1) NOT NULL,
  `dt_nascimento` DATE NOT NULL,
  `estado_civil` VARCHAR(45) NULL,
  `deficiencia` VARCHAR(45) NULL,
  `dt_criacao` DATETIME NOT NULL,
  `dt_alteracao` DATETIME NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE);


CREATE TABLE `faesa`.`dim_curso` (
  `id_curso` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `qtd_periodo` INT NULL,
  `dt_criacao` DATETIME NOT NULL,
  `dt_alteracao` DATETIME NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE);


CREATE TABLE `faesa`.`dim_disciplina` (
  `id_disciplina` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `carga_horaria` INT NOT NULL,
  `periodo` INT NULL,
  `oferta` BIT NOT NULL DEFAULT 0,
  `dt_oferta_ini` DATE NULL,
  `dt_oferta_fim` DATE NULL,
  `dt_criacao` DATETIME NOT NULL,
  `dt_alteracao` DATETIME NULL,
  PRIMARY KEY (`id_disciplina`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE);


CREATE TABLE `faesa`.`dim_nota` (
  `id_nota` INT NOT NULL,
  `conceito` VARCHAR(10) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `dt_criacao` DATETIME NOT NULL,
  `dt_alteracao` DATETIME NULL,
  PRIMARY KEY (`id_nota`));


CREATE TABLE `faesa`.`dim_hora_complementar` (
  `id_hora_complementar` INT NOT NULL,
  `qtd_hora` INT NOT NULL,
  `dt_criacao` DATETIME NOT NULL,
  `dt_alteracao` DATETIME NULL,
  PRIMARY KEY (`id_hora_complementar`));


CREATE TABLE `faesa`.`dim_hora_estagio` (
  `id_hora_estagio` INT NOT NULL,
  `qtd_hora` INT NOT NULL,
  `dt_criacao` DATETIME NOT NULL,
  `dt_alteracao` DATETIME NULL,
  PRIMARY KEY (`id_hora_estagio`));


CREATE TABLE `faesa`.`dim_tcc` (
  `id_tcc` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `nota` DECIMAL(10,2) NOT NULL,
  `aprovacao` BIT NOT NULL,
  `dt_criacao` DATETIME NOT NULL,
  `dt_alteracao` DATETIME NULL,
  PRIMARY KEY (`id_tcc`));


CREATE TABLE `faesa`.`dim_professor_orientador` (
  `id_professor_orientador` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dt_criacao` DATETIME NOT NULL,
  `dt_alteracao` DATETIME NULL,
  PRIMARY KEY (`id_professor_orientador`));


CREATE TABLE `faesa`.`fato_conclusao_curso` (
  `id_conclusao_curso` INT NOT NULL,
  `id_aluno` INT NOT NULL,
  `id_curso` INT NOT NULL,
  `id_disciplina` INT NOT NULL,
  `id_hora_complementar` INT NOT NULL,
  `id_hora_estagio` INT NOT NULL,
  `id_nota` INT NOT NULL,
  `id_professor_orientador` INT NOT NULL,
  `id_tcc` INT NOT NULL,
  PRIMARY KEY (`id_conclusao_curso`),
  INDEX `fk_aluno_idx` (`id_aluno` ASC) VISIBLE,
  INDEX `fk_curso_idx` (`id_curso` ASC) VISIBLE,
  INDEX `fk_hora_estagio_idx` (`id_hora_estagio` ASC) VISIBLE,
  INDEX `fk_nota_idx` (`id_nota` ASC) VISIBLE,
  INDEX `fk_professor_orientador_idx` (`id_professor_orientador` ASC) VISIBLE,
  INDEX `fk_tcc_idx` (`id_tcc` ASC) VISIBLE,
  CONSTRAINT `fk_aluno`
    FOREIGN KEY (`id_aluno`)
    REFERENCES `faesa`.`dim_aluno` (`id_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso`
    FOREIGN KEY (`id_curso`)
    REFERENCES `faesa`.`dim_curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina`
    FOREIGN KEY (`id_disciplina`)
    REFERENCES `faesa`.`dim_disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hora_complementar`
    FOREIGN KEY (`id_hora_complementar`)
    REFERENCES `faesa`.`dim_hora_complementar` (`id_hora_complementar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hora_estagio`
    FOREIGN KEY (`id_hora_estagio`)
    REFERENCES `faesa`.`dim_hora_estagio` (`id_hora_estagio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota`
    FOREIGN KEY (`id_nota`)
    REFERENCES `faesa`.`dim_nota` (`id_nota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_orientador`
    FOREIGN KEY (`id_professor_orientador`)
    REFERENCES `faesa`.`dim_professor_orientador` (`id_professor_orientador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tcc`
    FOREIGN KEY (`id_tcc`)
    REFERENCES `faesa`.`dim_tcc` (`id_tcc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




































































