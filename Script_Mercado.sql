CREATE DATABASE Mercadito_Julio;
go

USE Mercadito_Julio;
go

CREATE TABLE Proveedores(
Id_Proveedor INT PRIMARY KEY,
Nombre VARCHAR(225) NOT NULL,
Tipo_Proveedor VARCHAR(225) NOT NULL,
Telefono INT NOT NULL,
Direccion VARCHAR(225)
);

CREATE TABLE Productos(
Id_Producto INT PRIMARY KEY,
Nombre VARCHAR(225),
PrecioCompra NUMERIC(6,2),
PrecioVenta NUMERIC(6,2),
);

CREATE TABLE Inventario(
Id_Inventario INT PRIMARY KEY,
Id_Producto INT,
Cantidad INT,
FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto)
);

CREATE TABLE Compra(
Id_Compra INT PRIMARY KEY,
Id_Proveedor INT,
Id_Producto INT,
Fecha_Compra DATE,
Cantidad INT,
Total INT,
FOREIGN KEY (Id_Proveedor) REFERENCES Proveedores(Id_Proveedor),
FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto)
);

CREATE TABLE Clientes(
Id_Cliente INT PRIMARY KEY,
Nombre VARCHAR(225),
Apellido VARCHAR(225),
Telefono INT,
Credito INT,
Deuda NUMERIC(6,2)
);

CREATE TABLE Pagos(
Id_Pago INT PRIMARY KEY,
Id_Cliente INT,
Fecha_Pago DATE,
Monto NUMERIC(6,2),
FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente)
);

CREATE TABLE Ventas(
Id_Venta INT PRIMARY KEY,
Id_Producto INT,
Fecha_Venta DATE,
Cantidad INT,
Total INT,
FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto)
);

CREATE TABLE Empleados(
Id_Empleado INT PRIMARY KEY,
Nombre VARCHAR(225),
Apellido VARCHAR(225),
Telefono INT
);

CREATE TABLE ControlCaja(
Id_Caja INT PRIMARY KEY,
Id_Empleado INT,
FechaApertura DATETIME,
FechaCierre DATETIME,
Total_Ventas NUMERIC(6,2),
FOREIGN KEY (Id_Empleado) REFERENCES Empleados(Id_Empleado)
);


CREATE TABLE GastoCasa(
Id_Gasto INT PRIMARY KEY,
Id_Producto INT,
Cantidad INT,
Monto  NUMERIC(6,2),
FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto)
);

CREATE TABLE PagoServicios(
Id_PagoServicio INT PRIMARY KEY,
Descripcion VARCHAR(225),
Monto INT
);

go


INSERT INTO Proveedores(Id_Proveedor, Nombre, Tipo_Proveedor, Telefono, Direccion) VALUES
(1, 'Pepsi', 'EntregaDirecta', 1234590, 'Colonia Trejo, San Pedro Sula'),
(2, 'Leyde', 'EntregaDirecta', 67567890, 'Barrio Guamilito, San Pedro Sula'),
(3, 'Sula', 'EntregaDirecta', 55555555, 'Colonia Moderna, San Pedro Sula'),
(4, 'CocaCola', 'EntregaDirecta', 11545111, 'Colonia Suyapa, San Pedro Sula'),
(5, 'Yumies', 'EntregaDirecta', 76894325, 'Colonia Los Andes, San Pedro Sula'),
(6, 'Diana', 'EntregaDirecta', 44576454, 'Colonia Jardines del Valle, San Pedro Sula'),
(7, 'Colibhri', 'EntregaDirecta', 2223622, 'Colonia luisisana, San Pedro Sula'),
(8, 'PolloRey', 'EntregaDirecta', 7712317, 'Colonia Planeta, San Pedro Sula'),
(9, 'Quincho', 'OrdenCompra', 787653126, 'Colonia Altia, San Pedro Sula'),
(10, 'Tropigas', 'OrdenCompras', 67534567, 'Colonia Jerusalen, San Pedro Sula');

INSERT INTO Productos (Id_Producto, Nombre, PrecioCompra, PrecioVenta) VALUES
(1, 'Tomate', 2, 3),
(2, 'Aceite B', 5.99, 9.99),
(3, 'Chocosula', 8.75, 12.99),
(4, 'Sandia', 12.99, 19.99),
(5, 'Guineo Verde', 6.49, 11.99),
(6, 'Leche Entera', 9.99, 16.99),
(7, 'Queso', 14.99, 24.99),
(8, 'Mantequilla', 7.99, 13),
(9, 'Pollo', 11.99, 18.99),
(10, 'Huevo', 4.99, 8.99);

INSERT INTO Inventario(Id_Inventario, Id_Producto, Cantidad) VALUES
(1, 1, 100),
(2, 2, 50),
(3, 3, 20),
(4, 4, 15),
(5, 5, 80),
(6, 6, 30),
(7, 7, 20),
(8, 8, 23),
(9, 9, 30),
(10, 10, 150);

INSERT INTO Compra (Id_Compra, Id_Proveedor, Id_Producto, Fecha_Compra, Cantidad, Total) VALUES
(1, 1, 1, '2023-05-01', 50, 799.50),
(2, 2, 2, '2023-05-02', 25, 249.75),
(3, 3, 3, '2023-05-03', 40, 519.60),
(4, 4, 4, '2023-05-04', 100, 1999),
(5, 5, 5, '2023-05-05', 30, 359.70),
(6, 6, 6, '2023-05-06', 60, 1019.40),
(7, 7, 7, '2023-05-07', 80, 1999.20),
(8, 8, 8, '2023-05-08', 35, 487.65),
(9, 9, 9, '2023-05-09', 20, 379.80),
(10,10,10,'2023-05-10', 45, 404.55);


INSERT INTO Ventas (Id_Venta, Id_Producto, Fecha_Venta, Cantidad, Total) VALUES
(1, 1, '2023-05-01', 10, 159.90),
(2, 2, '2023-05-02', 15, 149.85),
(3, 3, '2023-05-03', 5, 64.95),
(4, 4, '2023-05-04', 20, 399.80),
(5, 5, '2023-05-05', 8, 95.92),
(6, 6, '2023-05-06', 12, 203.88),
(7, 7, '2023-05-07', 25, 624.75),
(8, 8, '2023-05-08', 10, 139.90),
(9, 9, '2023-05-09', 15, 284.85),
(10, 10, '2023-05-10', 18, 161.82);

INSERT INTO Clientes (Id_Cliente, Nombre, Apellido, Telefono, Credito, Deuda) VALUES
(1, 'Luis', 'González', 58511122, 1000, 500.50),
(2, 'Ana', 'Martínez', 5552333, 1500, 250.75),
(3, 'Javier', 'López', 55533344, 2000, 0),
(4, 'María', 'Rodríguez', 57754445, 500, 0),
(5, 'Carlos', 'Pérez', 56555566, 800, 100.25),
(6, 'Laura', 'García', 55566677, 1200, 600.80),
(7, 'Pedro', 'Hernández', 55577788, 300, 150.50),
(8, 'Gabriela', 'Silva', 5558889, 1000, 0),
(9, 'Alejandro', 'Vargas', 55559959, 2000, 0),
(10, 'Sofía', 'Morales', 55500019, 500, 250.75);

INSERT INTO Pagos (Id_Pago, Id_Cliente, Fecha_Pago, Monto) VALUES
(1, 1, '2023-05-01', 100),
(2, 2, '2023-05-02', 50),
(3, 3, '2023-05-03', 200),
(4, 4, '2023-05-04', 100),
(5, 5, '2023-05-05', 150),
(6, 6, '2023-05-06', 300),
(7, 7, '2023-05-07', 50),
(8, 8, '2023-05-08', 100),
(9, 9, '2023-05-09', 150),
(10, 10, '2023-05-10', 200);


INSERT INTO Empleados (Id_Empleado,Nombre,Apellido,Telefono) VALUES
(1,'Juan','Lopez',345643456),
(2,'Julio','Machado',3468353),
(3,'Carlos','4Rodrigez',3456566);


INSERT INTO ControlCaja (Id_Caja, Id_Empleado, FechaApertura, FechaCierre, Total_Ventas) VALUES
(1, 1, '2023-05-01 07:00:00', '2023-05-01 13:00:00', 500.00),
(2, 2, '2023-05-02 13:00:00', '2023-05-02 18:00:00', 734),
(3, 3, '2023-05-03 18:00:00', '2023-05-03 22:00:00', 954.065);

INSERT INTO GastoCasa (Id_Gasto, Id_Producto, Cantidad, Monto) VALUES
(1, 1, 3, 34.78),
(2, 2, 23, 65.4),
(3, 3, 50 ,56),
(4, 4, 5, 87.6),
(5, 5, 3, 75.6),
(6, 6, 5, 100),
(7, 7, 8, 345),
(8, 8, 56,450),
(9, 9, 86, 350),
(10, 10, 3, 789);

INSERT INTO PagoServicios (Id_PagoServicio, Descripcion, Monto) VALUES
(1, 'Electricidad', 100),
(2, 'Agua', 30),
(3, 'Internet', 80),
(4, 'Gas', 20),
(5, 'Teléfono', 50),
(6, 'TV Cable', 60),
(7, 'Seguridad', 70),
(8, 'Limpieza', 40),
(9, 'Seguro', 1100),
(10, 'Impuesto de la alcaldia', 300);