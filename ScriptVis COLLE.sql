CREATE VIEW Clientes_Wilde AS
(SELECT * 
FROM clientes
WHERE Domicilio like '%Wilde');

Select *
FROM clientes_wilde

CREATE VIEW ProductoMelisa AS
(SELECT P.Id_Producto, P.Nombre 
from Pasteles P inner join Producto PR 
on P.Id_Producto = PR.Id_Producto 
inner join Empleados E  
on PR.Legajo = E.Legajo 
where E.Legajo = 100100);

Select *
FROM ProductoMelisa

CREATE VIEW Materia_Prima_V AS
(SELECT Codigo, Descrpcion, Orden
FROM Materia_Prima
WHERE Id_proveedor = 8);

Select *
FROM Materia_Prima_V

CREATE VIEW Clientes_V AS
(SELECT C.Id_Cliente, C.Nombre, C.Apellido
from Clientes C inner join Pedidos P
on C.Id_Cliente = P.Id_Cliente 
inner join Detalle D
on P.Id_Pedido = D.Id_Pedido 
where Total > 20000); 

Select *
FROM Clientes_V

CREATE VIEW Manteca AS
(SELECT P.Id_Producto, P.Nombre
from Pasteles P inner join Ingredientes I
on P.Id_Producto = I.Id_Producto 
inner join Materia_Prima M
on M.Codigo = I.Codigo 
where Descrpcion = 'Manteca'); 

Select *
FROM Manteca