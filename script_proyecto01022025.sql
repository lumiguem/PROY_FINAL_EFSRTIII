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
create procedure usp_validaLogin(in cel varchar(45), in pwd int)
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

delimiter //
CREATE PROCEDURE usp_obtenerUsuario(IN cel VARCHAR(45))
BEGIN
    SELECT * 
    FROM usuarios
    WHERE celUsuario = cel;
END//
delimiter ;

-- 03 SP obtener movimientos 30 01 25 - v2

DELIMITER $$

CREATE PROCEDURE ObtenerMovimientos(
    IN usuarioID INT
)
BEGIN
    SELECT 
        t.fecTrans,
        CASE 
            WHEN t.idOrigen = usuarioID THEN u_dest.nomUsuario  -- Si el usuario envió dinero, mostramos el destinatario
            ELSE u_origen.nomUsuario  -- Si el usuario recibió dinero, mostramos el remitente
        END AS nombreUsuario,
        CASE 
            WHEN t.idOrigen = usuarioID THEN -t.monto  -- Si el usuario envió, monto positivo
            ELSE t.monto  -- Si el usuario recibió, monto negativo
        END AS saldo_movimiento
    FROM transacciones t
    JOIN usuarios u_origen ON t.idOrigen = u_origen.idUsuario
    JOIN usuarios u_dest ON t.idDestino = u_dest.idUsuario
    WHERE t.idOrigen = usuarioID OR t.idDestino = usuarioID
    ORDER BY t.fecTrans DESC;
    
END $$

DELIMITER ;


delimiter //

create procedure usp_modificarUsuarioTran(in id int, in montoTran double)
begin
    -- Declarar variable para guardar el saldo actual
    declare saldoActual double;

    -- Obtener el saldo actual del usuario
    select saldo into saldoActual
    from usuarios
    where idUsuario = id;

    -- Actualizar el saldo del usuario sumando el montoTran
    update usuarios
    set saldo = saldoActual + montoTran
    where idUsuario = id;
end//

delimiter ;
