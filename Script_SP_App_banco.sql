
-- 01 - VALIDAR LOGIN SP

delimiter //
create procedure usp_validaLogin(in cel varchar(45), pwd int)
begin
	Select * 
    From usuarios
    Where celUsuario=cel and pasUsuario=pwd;
end//
delimiter ;

-- 02 - REGISTRAR TRANSACCION SP

delimiter //
create procedure usp_registrarTransaccion(in ido int,in idd int,in monto double,in fechat Date)
begin
	insert into transacciones (idOrigen,idDestino, monto, fecTrans) values
    (ido, idd, monto, fechat);
end//
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
