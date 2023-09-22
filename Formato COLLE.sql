drop function if exists f_DetalleFactura;
 
 delimiter //
 create function f_DetalleFactura(
   total int)
   returns Varchar (25)
   deterministic
 begin
case 
    when total <= 10000 then
      return 'Facturacion estandar';
    when total >10000 and total <20000 then
      return 'Facturacion intermedia';
    when total>=20000 then
      return 'Facturacion elevada';
  end case; 
 end //
 delimiter ;
 
select id_pedido, id_producto, f_DetalleFactura(total) from detalle; 

drop function if exists DescrRol;

delimiter //
CREATE FUNCTION DescrRol (EmpleadoID int)
RETURNS varchar(50)
reads sql data
BEGIN
declare salida varchar(50);
select Puesto
into salida
from empleados
where Legajo = EmpleadoID;
RETURN salida;
END //
delimiter ;

select DescrRol(100106) as Rol;
