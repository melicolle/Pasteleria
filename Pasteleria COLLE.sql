create table Empleados (
Legajo INT NOT NULL auto_increment PRIMARY KEY,
DNI INT NOT NULL,
Nombre varchar (30),
Apellido varchar (30),
Puesto varchar (30)
);

create table Pasteles (
Id_Producto INT NOT NULL auto_increment PRIMARY KEY,
Nombre varchar (15),
Descripcion varchar (30),
Legajo int,
constraint Pasteles_Empleados foreign key (Legajo) references Empleados(Legajo)
);

create table Pedidos (
Id_Pedido INT NOT NULL auto_increment PRIMARY KEY,
Cantidad int,
Importe_P int,
Fecha date,
Id_Producto int,
Id_Cliente int, 
constraint Pedidos_Clientes foreign key (Id_cliente) references Clientes (Id_cliente),
constraint Pedidos_Pasteles foreign key (Id_Producto) references Pasteles (Id_Producto)
);

create table Clientes (
Id_cliente INT NOT NULL auto_increment PRIMARY KEY,
Nombre text(20) NOT NULL,
Apellido text(20) NOT NULL,
Telefono int NOT NULL,
Domicilio varchar (30)
);

create table Proveedores (
Id_proveedor INT NOT NULL auto_increment PRIMARY KEY,
Nombre varchar (30)
);

create table Materia_prima (
Codigo INT NOT NULL auto_increment PRIMARY KEY,
Fecha DATE NOT NULL,
Orden varchar (30),
Importe_M INT NOT NULL,
Id_proveedor INT NOT NULL,
constraint Materia_prima_Proveedores foreign key (Id_proveedor) references Proveedores (Id_proveedor)
);


create table Ingredientes (
Id_producto int NOT NULL,
Codigo int NOT NULL,
constraint Ingredientes_Pasteles foreign key (Id_Producto) references Pasteles (Id_Producto),
constraint Ingredientes_Materia_prima foreign key (Codigo) references Materia_prima (codigo)
);

