-- tabla de log para insert 
create table Detalle_log_I 
(id_Pedido int, 
Id_Producto int, 
Cantidad int,
PrecioUni int,
Total Int,
fechaCambio datetime,
horacambio time, 
userCambio varchar(30));  

-- tabla de log para update 
create table Pedidos_log_U 
(id_Pedido int, 
Id_Cliente int, 
Cantidad int,
Fecha date,
fechaCambio datetime, 
horacambio time,
userCambio varchar(30));  

-- Inserta en la tabla Detalle_log_I los valores que surgen después de que ocurra la inserción
drop trigger if exists tr_Detalle_After_Insert; 
delimiter $$  
CREATE TRIGGER tr_Detalle_After_Insert
AFTER INSERT ON Detalle
FOR EACH ROW
BEGIN
INSERT INTO Detalle_log_I 
VALUES (new.id_Pedido, new.Id_Producto, new.Cantidad, new.PrecioUni, new.Total, curdate(), curtime(), user());
END $$
delimiter ;

-- Inserta en la tabla Detalle_log_I los valores que surgen después de que ocurra la inserción
drop trigger if exists tr_Detalle_Before_Insert; 
delimiter $$  
CREATE TRIGGER tr_Detalle_Before_Insert
BEFORE INSERT ON Detalle
FOR EACH ROW
BEGIN
INSERT INTO Detalle_log_I 
VALUES (new.id_Pedido, new.Id_Producto, new.Cantidad, new.PrecioUni, new.Total, curdate(), curtime(), user());
END $$
delimiter ;

-- Inserta en la tabla Pedidos_log_U los valores que surgen después de que ocurra la actualización.
drop trigger if exists tr_Pedidos_After_Update; 
delimiter $$  
CREATE TRIGGER tr_Pedidos_After_Update
AFTER UPDATE ON pedidos
FOR EACH ROW
BEGIN
INSERT INTO Pedidos_log_U 
SELECT id_Pedido, Id_Cliente, Cantidad, Fecha, curdate(), curtime(), user()
FROM pedidos
WHERE id_Pedido = old.id_Pedido;
END $$
delimiter ;

-- Inserta en la tabla Pedidos_log_U los valores antes de que ocurra la actualización
drop trigger if exists tr_Pedidos_Before_Update; 
delimiter $$  
CREATE TRIGGER tr_Pedidos_Before_Update
BEFORE UPDATE ON pedidos
FOR EACH ROW
BEGIN
INSERT INTO Pedidos_log_U 
SELECT id_Pedido, Id_Cliente, Cantidad, Fecha, curdate(), curtime(), user()
FROM pedidos
WHERE id_Pedido = new.id_Pedido;
END $$
delimiter ;






