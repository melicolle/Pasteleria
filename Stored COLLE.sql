-- Elimino si existe el sp 
DROP procedure IF EXISTS sp_prov_order;
delimiter $$  
-- defino el sp con el parámetro de campo
CREATE PROCEDURE sp_prov_order (IN campo varchar (30))
BEGIN
-- Aplico el condicional y defino variable.
IF campo = '' THEN
-- Si campo no tiene valor, la variable p_order está vacía
SET @p_order = '';
ELSE
-- si tiene valor, declaro la variable ordenada por el campo
SET @p_order = concat('ORDER BY ', campo);
end if;
-- declaro nueva variable clausula y concateno la sentencia con la otra variable
SET @clausula = concat('SELECT * FROM proveedores ', @p_order);
PREPARE runSQL FROM @clausula;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;
END$$

DELIMITER ;

call sp_prov_order('Nombre')

-- Elimino si existe el sp 
DROP procedure IF EXISTS sp_PedidosHoy;
delimiter $$  
-- Defino el sp
CREATE PROCEDURE sp_PedidosHoy(IN Id_P int, IN Id_C int) 
begin  	
-- inserto a la tabla pedidos los valores para generar nuevos registros
insert into Pedidos (Id_Pedido, Id_Cliente, Fecha)         
values         (ID_P, ID_C, curdate());         
END $$  

DELIMITER ;

call sp_PedidosHoy(1031, 12)

SELECT *
FROM PEDIDOS
	