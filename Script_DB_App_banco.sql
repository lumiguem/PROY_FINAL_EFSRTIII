create database yata_app;

use yata_app;

CREATE TABLE `yata_app`.`usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nomUsuario` VARCHAR(45) NOT NULL,
  `apeUsuario` VARCHAR(45) NOT NULL,
  `celUsuario` VARCHAR(45) NOT NULL,
  `pasUsuario` INT NOT NULL,
  `saldo` DOUBLE NOT NULL,
  PRIMARY KEY (`idUsuario`));

INSERT INTO `yata_app`.`usuarios` (`nomUsuario`, `apeUsuario`, `celUsuario`, `pasUsuario`, `saldo`) VALUES ('Miguel', 'Moreno', '978376725', '123456', 1500);
INSERT INTO `yata_app`.`usuarios` (`nomUsuario`, `apeUsuario`, `celUsuario`, `pasUsuario`, `saldo`) VALUES ('Alejandro ', 'Romero', '914613879', '654321', 500);  
INSERT INTO `yata_app`.`usuarios` (`nomUsuario`, `apeUsuario`, `celUsuario`, `pasUsuario`, `saldo`)
VALUES 
('Carlos', 'Gómez', '912345678', '111111', 1000),
('Laura', 'Fernández', '923456789', '222222', 2000),
('Pedro', 'López', '934567890', '333333', 1500);

    
CREATE TABLE `yata_app`.`transacciones` (
  `idTransaccion` INT NOT NULL AUTO_INCREMENT,
  `idOrigen` INT NOT NULL,
  `monto` DOUBLE NOT NULL,
  `idDestino` INT NOT NULL,
  `fecTrans` DATE NOT NULL,
  PRIMARY KEY (`idTransaccion`),
  CONSTRAINT `fk_idOrigen`
    FOREIGN KEY (`idOrigen`) REFERENCES `usuarios`(`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_idDestino`
    FOREIGN KEY (`idDestino`) REFERENCES `usuarios`(`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- registros prueba transacciones

INSERT INTO `yata_app`.`transacciones` (`idOrigen`, `monto`, `idDestino`, `fecTrans`) VALUES
(1, 200, 2, '2024-01-01'),
(2, 100, 3, '2024-01-02'),
(3, 300, 4, '2024-01-03'),
(4, 150, 5, '2024-01-04'),
(5, 250, 1, '2024-01-05'),
(1, 500, 3, '2024-01-06'),
(2, 350, 5, '2024-01-07'),
(3, 400, 2, '2024-01-08'),
(4, 100, 1, '2024-01-09'),
(5, 600, 3, '2024-01-10'),
(1, 750, 4, '2024-01-11'),
(2, 80, 5, '2024-01-12'),
(3, 220, 1, '2024-01-13'),
(4, 90, 2, '2024-01-14'),
(5, 330, 4, '2024-01-15');


