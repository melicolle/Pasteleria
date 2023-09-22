create schema if not exists Pasteleria;
use Pasteleria;

create table if not exists Empleados (
Legajo INT NOT NULL auto_increment PRIMARY KEY,
DNI INT NOT NULL,
Nombre varchar (50) NOT NULL,
Apellido varchar (50) NOT NULL,
Puesto varchar (50) NOT NULL
);

create table if not exists Pasteles (
Id_Producto INT NOT NULL auto_increment PRIMARY KEY,
Nombre varchar (50) NOT NULL,
Descripcion varchar (70) NOT NULL
);

create table if not exists Producto (
Id_Producto INT NOT NULL, 
Legajo int NOT NULL,
primary key (Id_Producto, Legajo),
constraint Producto_Pasteles foreign key (Id_Producto) references Pasteles(Id_Producto),
constraint Producto_Empleados foreign key (Legajo) references Empleados(Legajo)
);


create table if not exists Clientes (
Id_cliente INT NOT NULL auto_increment PRIMARY KEY,
Nombre varchar (50) NOT NULL,
Apellido varchar (50) NOT NULL,
Telefono int NOT NULL,
Domicilio varchar (50) NOT NULL
);

create table if not exists Pedidos (
Id_Pedido INT NOT NULL auto_increment PRIMARY KEY,
Id_cliente INT NOT NULL,
Fecha date NOT NULL,
constraint Pedidos_Clientes foreign key (Id_cliente) references Clientes(Id_cliente)
);

create table if not exists Detalle (
Id_Pedido int NOT NULL,
Id_Producto int NOT NULL, 
Cantidad int NOT NULL,
PrecioUni int NOT NULL,
Total int NOT NULL,
primary key (Id_Producto, Id_Pedido),
constraint Detalle_Pedidos foreign key (Id_Pedido) references Pedidos (Id_Pedido),
constraint Detalle_Pasteles foreign key (Id_Producto) references Pasteles (Id_Producto)
);

create table if not exists Proveedores (
Id_proveedor INT NOT NULL auto_increment PRIMARY KEY,
Nombre varchar (30) NOT NULL
);

create table if not exists Materia_prima (
Codigo INT NOT NULL auto_increment PRIMARY KEY,
Descrpcion Varchar (30),
Fecha DATE NOT NULL,
Orden varchar (30) NOT NULL,
Importe_M INT NOT NULL,
Id_proveedor INT NOT NULL,
constraint Materia_prima_Proveedores foreign key (Id_proveedor) references Proveedores (Id_proveedor)
);

create table if not exists Ingredientes (
Id_producto int NOT NULL,
Codigo int NOT NULL,
primary key (Id_Producto, Codigo),
constraint Ingredientes_Pasteles foreign key (Id_Producto) references Pasteles (Id_Producto),
constraint Ingredientes_Materia_prima foreign key (Codigo) references Materia_prima (codigo)
);