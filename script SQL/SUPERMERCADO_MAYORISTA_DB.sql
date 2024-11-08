USE master
GO

CREATE DATABASE SUPER_MERCADO_MAYORISTA_DB
GO

USE SUPER_MERCADO_MAYORISTA_DB
GO

CREATE TABLE PUESTOS(
	ID BIGINT IDENTITY(1,1),
	IDPuesto BIGINT NOT NULL,
	NombrePuesto VARCHAR(20) NOT NULL,
	CONSTRAINT PK_ID_PUESTO PRIMARY KEY (IDPuesto),
	CONSTRAINT UQ_UNICIDAD UNIQUE (IDPuesto, NombrePuesto)
)

CREATE TABLE USUARIOS(
	ID BIGINT IDENTITY(1,1),
	IDUsuario BIGINT NOT NULL,
	Email VARCHAR(20) NOT NULL,
	Pass VARCHAR(20) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR(20) NOT NULL,
	Direccion VARCHAR(40) NULL,
	Telefono VARCHAR(20) NULL,
	CONSTRAINT PK_ID_USUARIO PRIMARY KEY (IDUsuario),
	CONSTRAINT UQ_UNICIDAD UNIQUE (IDUsuario, Email)
)

CREATE TABLE EMPLEADOS(
	ID BIGINT IDENTITY(1,1),
	IDEmpleado BIGINT NOT NULL,
	FechaIngreso DATETIME NOT NULL,
	FechaEgreso DATETIME NULL,
	CONSTRAINT PK_ID_EMPLEADO PRIMARY KEY (IDEmpleado),
	CONSTRAINT FK_ID_EMPLEADO FOREIGN KEY (IDEmpleado) REFERENCES USUARIOS(IDUsuario)
)

CREATE TABLE EMPLEADOS_X_PUESTO(
	ID BIGINT IDENTITY(1,1),
	IDEmpleado BIGINT NOT NULL,
	IDPuesto BIGINT NOT NULL,
	CONSTRAINT PK_EMPLEADO_X_PUESTO PRIMARY KEY (IDEmpleado, IDPuesto),
	CONSTRAINT FK_EMPLEADO_PUESTO FOREIGN KEY (IDEmpleado) REFERENCES EMPLEADOS(IDEmpleado),
	CONSTRAINT FK_PUESTO_EMPLEADO FOREIGN KEY (IDPuesto) REFERENCES PUESTOS(IDPuesto)
)

CREATE TABLE CAJAS(
	ID BIGINT IDENTITY(1,1),
	IDCaja BIGINT NOT NULL,
	Estado BIT NOT NULL,
	CONSTRAINT PK_ID_CAJA PRIMARY KEY (IDCaja)
)

CREATE TABLE CAJA_X_EMPLEADO(
	ID BIGINT IDENTITY(1,1),
	IDCaja BIGINT NOT NULL,
	IDEmpleado BIGINT NOT NULL,
	FichaEntrada DATETIME NOT NULL,
	FichaSalida DATETIME NULL,
	CONSTRAINT PK_CAJAS_X_EMPLEADOS PRIMARY KEY (IDEmpleado, IDCaja),
	CONSTRAINT FK_EMPLEADO_CAJA FOREIGN KEY (IDEmpleado) REFERENCES EMPLEADOS(IDEmpleado)
)

CREATE TABLE FICHAJE(
	ID BIGINT IDENTITY(1,1),
	IDEmpleado BIGINT NOT NULL,
	FichaEntrada DATETIME NOT NULL,
	FichaSalida DATETIME NULL,
	CONSTRAINT PK_ENTRADA PRIMARY KEY (IDEmpleado, FichaEntrada),
	CONSTRAINT FK_EMPLEADO FOREIGN KEY (IDEmpleado) REFERENCES EMPLEADOS(IDEmpleado)
)


CREATE TABLE TIPO_CLIENTE(
	ID BIGINT IDENTITY(1,1),
	IDTtipo BIGINT NOT NULL,
	NombreTipoCliente VARCHAR(20) NOT NULL,
	CONSTRAINT PK_ID_TIPO PRIMARY KEY (IDTtipo),
	CONSTRAINT UQ_UNICIDAD UNIQUE (IDTtipo, NombreTipoCliente)
)

CREATE TABLE CLIENTES(
	ID BIGINT IDENTITY(1,1),
	IDCliente BIGINT NOT NULL,
	IDTipoCliente BIGINT NOT NULL,
	CONSTRAINT PK_CLIENTE PRIMARY KEY (IDCliente),
	CONSTRAINT UQ_UNICIDAD UNIQUE (IDCliente, IDTipoCliente),
	CONSTRAINT FK_TIPO_EMPLEADO FOREIGN KEY (IDTipoCliente) REFERENCES TIPO_CLIENTE(IDTtipo),
	CONSTRAINT FK_USUARIO_CLIENTE FOREIGN KEY (IDCliente) REFERENCES USUARIOS(IDUsuario)
)

CREATE TABLE TIPO_PAGO(
	ID BIGINT IDENTITY(1,1),
	IDTipoPago BIGINT NOT NULL,
	NombreTipoPago VARCHAR(20) NOT NULL,
	CONSTRAINT PK_ID_TIPO_PAGO PRIMARY KEY (IDTipoPago),
	CONSTRAINT UQ_UNICIDAD UNIQUE (IDTipoPago, NombreTipoPago)
)

CREATE TABLE COMPRAS(
	ID BIGINT IDENTITY(1,1),
	IDCompra BIGINT IDENTITY(1000,1),
	IDCaja BIGINT NOT NULL,--
	IDCliente BIGINT NOT NULL,--
	IDCajero BIGINT NOT NULL,--
	Monto MONEY NOT NULL,
	FechaCompra DATETIME NOT NULL,
	IDTipoPago BIGINT NOT NULL,--
	CONSTRAINT PK_ID_COMPRA PRIMARY KEY (IDCompra),
	CONSTRAINT FK_CAJA_COMPRA FOREIGN KEY (IDCaja) REFERENCES CAJAS(IDCaja),
	CONSTRAINT FK_CLIENTE_COMPRA FOREIGN KEY (IDCliente) REFERENCES CLIENTES(IDCliente),
	CONSTRAINT FK_CAJERO_COMPRA FOREIGN KEY (IDCajero) REFERENCES EMPLEADOS(IDEmpleado),
	CONSTRAINT FK_Tipo_Pago FOREIGN KEY (IDTipoPago) REFERENCES TIPO_PAGO(IDTipoPago),
	CONSTRAINT CK_MONTO_VALIDO CHECK (Monto > 0) 
)

CREATE TABLE COMPRA_X_CLIENTE(
	ID BIGINT IDENTITY(1,1),
	IDCliente BIGINT NOT NULL,
	IDCompra BIGINT NOT NULL,
	CONSTRAINT PK_COMPRA PRIMARY KEY (IDCliente, IDCompra),
	CONSTRAINT FK_CLIENTE_COMPRA FOREIGN KEY (IDCliente) REFERENCES CLIENTES(IDCliente),
	CONSTRAINT FK_COMPRA_CLIENTE FOREIGN KEY (IDCompra) REFERENCES COMPRAS(IDCompra)
)

CREATE TABLE PRODUCTOS(
	ID BIGINT IDENTITY(1,1),
	IDProducto BIGINT IDENTITY(1000,1),
	Nombre VARCHAR(20) NOT NULL,
	Stock BIGINT NOT NULL,
	Precio MONEY NOT NULL,
	Descripcion VARCHAR(300) NOT NULL,
	Estado BIT NOT NULL,
	CONSTRAINT PK_PRODUCTO PRIMARY KEY (IDProducto),
	CONSTRAINT UQ_UNICIDAD UNIQUE (Nombre, Descripcion),
	CONSTRAINT CK_PRECIO_VALIDO CHECK (Precio > 0),
	CONSTRAINT CK_STOCK_VALIDO CHECK (Stock >= 0) 
)

CREATE TABLE COMPRA_X_PRODUCTO(
	ID BIGINT IDENTITY(1,1),
	IDCompra BIGINT NOT NULL,
	IDProducto BIGINT NOT NULL,
	Cantidad BIGINT NOT NULL,
	CONSTRAINT PK_COMPRA_PRODUCTO PRIMARY KEY (IDCompra, IDProducto),
	CONSTRAINT FK_ID_COMPRA FOREIGN KEY (IDCompra) REFERENCES COMPRAS(IDCompra),
	CONSTRAINT FK_ID_PRODUCTO FOREIGN KEY (IDProducto) REFERENCES PRODUCTOS(IDProducto),
	CONSTRAINT CK_CANTIDAD_VALIDA CHECK (Cantidad > 0)
)

CREATE TABLE CATEGORIAS(
	ID BIGINT IDENTITY(1,1),
	IDCategoria BIGINT NOT NULL,
	NombreCategoria VARCHAR(20) NOT NULL,
	CONSTRAINT PK_CATEGORIA PRIMARY KEY (IDCategoria),
	CONSTRAINT UQ_UNICIDAD UNIQUE (IDCategoria, NombreCategoria)
)

CREATE TABLE PRODUCTO_X_CATEGORIA(
	ID BIGINT IDENTITY(1,1),
	IDProducto BIGINT NOT NULL,
	IDCategoria BIGINT NOT NULL,
	CONSTRAINT PK_PRODUCTO_CATEGORIA PRIMARY KEY (IDProducto, IDCategoria),
	CONSTRAINT FK_ID_PRODUCTO FOREIGN KEY (IDProducto) REFERENCES PRODUCTOS(IDProducto),
	CONSTRAINT FK_ID_CATEGORIA FOREIGN KEY (IDCategoria) REFERENCES CATEGORIAS(IDCategoria)
)



