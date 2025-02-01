CREATE TABLE `yata_app`.`usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nomUsuario` VARCHAR(45) NOT NULL,
  `apeUsuario` VARCHAR(45) NOT NULL,
  `celUsuario` VARCHAR(45) NOT NULL,
  `pasUsuario` INT NOT NULL,
  `saldo` DOUBLE NOT NULL,
  PRIMARY KEY (`idUsuario`));

   
    
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
    
INSERT INTO `yata_app`.`usuarios` (`idUsuario`, `nomUsuario`, `apeUsuario`, `celUsuario`, `pasUsuario`, `saldo`) VALUES ('1111', 'Miguel', 'Moreno', '978376725', '123456', 1500);
INSERT INTO `yata_app`.`usuarios` (`nomUsuario`, `apeUsuario`, `celUsuario`, `pasUsuario`, `saldo`) VALUES ('Alejandro ', 'Romero', '914613879', '654321', 500);

--Procedimientos


delimiter //
create procedure usp_validaLogin(in cel varchar(45), pwd int)
begin
	Select * 
    From usuarios
    Where celUsuario=cel and pasUsuario=pwd;
end//
delimiter ;

call usp_validaLogin(978376725, 123456)

delimiter //
create procedure usp_registrarTransaccion(in ido int,in idd int,in monto double,in fechat Date)
begin
	insert into transacciones (idOrigen,idDestino, monto, fecTrans) values
    (ido, idd, monto, fechat);
end//
delimiter ;