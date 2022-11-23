create database SistemaVentas

use SistemaVentas

create table Cajeros
(
Codigo_Cajero int identity,
nombre nvarchar(255) not null,
apellido nvarchar(255) not null,
Constraint Pk_Codigo Primary key(Codigo_Cajero)

)

create table productos 
(
Codigo_Producto int identity ,
Nombre nvarchar (100) not null,
precio float default 0,
Constraint Pk_CodigoProd Primary key(Codigo_Producto)
)

create table MRegistradoras 
(
Codigo_Maquina int identity,
Piso int,
Constraint Pk_CodigoMaquina Primary key(Codigo_Maquina)
)
create table Ventas
(
Codigo_Cajero int,
Codigo_Maquina int,
Codigo_Producto int,
Codigo_Venta int identity,
Fecha datetime constraint DF_fecha default GetDate() null ,
Constraint Pk_CodigoVenta Primary key(Codigo_Venta),
constraint FK_Cajero Foreign Key (Codigo_Cajero) references Cajeros(Codigo_Cajero),
constraint FK_Producto FOREIGN KEY (Codigo_Producto) references productos(Codigo_producto),
constraint Fk_Maquina Foreign Key (Codigo_Maquina) references MRegistradoras(Codigo_Maquina),

)

select *from Ventas

--INGRESO DE CAJEROS:
insert into Cajeros (nombre,apellido) values ( 'Luis','Pérez')
insert into Cajeros (nombre,apellido) values ( 'Noelia','Álvarez')
select * from Cajeros

--iNGRESO DE PRODUCTOS:
insert into productos (Nombre,precio) values ('Quesitos', 450)
insert into productos (Nombre,precio) values ('Coca Cola 600 ml', 750)
insert into productos (Nombre,precio) values ('Ranchitas', 150)
select *from productos

--Ingreso Maquinas:
insert into MRegistradoras (Piso) values (4)
insert into MRegistradoras (Piso) values (2)
select *from MRegistradoras

--Actualización Producto:
update productos set nombre= 'Galletas Maria',precio= '325'  where Codigo_Producto = 1


select Cajeros.nombre, productos.Nombre, MRegistradoras.Codigo_Maquina from Ventas  
inner join Cajeros  on  Cajeros.Codigo_Cajero = Ventas.Cajero
inner join productos  on  productos.Codigo_Producto = Ventas.Producto
inner join MRegistradoras on MRegistradoras.Codigo_Maquina = Ventas.Maquina