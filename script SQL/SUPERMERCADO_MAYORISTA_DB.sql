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
GO

CREATE TABLE USUARIOS(
	ID BIGINT IDENTITY(1,1),
	IDUsuario BIGINT NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Pass VARCHAR(20) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR(20) NOT NULL,
	Direccion VARCHAR(40) NULL,
	Telefono VARCHAR(20) NULL,
	Estado BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_ID_USUARIO PRIMARY KEY (IDUsuario),
	CONSTRAINT UQ_UNICIDAD_USUARIOS UNIQUE (IDUsuario, Email)
)
GO

CREATE TABLE EMPLEADOS(
	ID BIGINT IDENTITY(1,1),
	IDEmpleado BIGINT NOT NULL,
	FechaIngreso DATETIME NOT NULL,
	FechaEgreso DATETIME NULL,
	CONSTRAINT PK_ID_EMPLEADO PRIMARY KEY (IDEmpleado),
	CONSTRAINT FK_ID_EMPLEADO FOREIGN KEY (IDEmpleado) REFERENCES USUARIOS(IDUsuario)
)
GO

CREATE TABLE EMPLEADOS_X_PUESTO(
	ID BIGINT IDENTITY(1,1),
	IDEmpleado BIGINT NOT NULL,
	IDPuesto BIGINT NOT NULL,
	CONSTRAINT PK_EMPLEADO_X_PUESTO PRIMARY KEY (IDEmpleado, IDPuesto),
	CONSTRAINT FK_EMPLEADO_PUESTO FOREIGN KEY (IDEmpleado) REFERENCES EMPLEADOS(IDEmpleado),
	CONSTRAINT FK_PUESTO_EMPLEADO FOREIGN KEY (IDPuesto) REFERENCES PUESTOS(IDPuesto)
)
GO

CREATE TABLE CAJAS(
	ID BIGINT IDENTITY(1,1),
	IDCaja BIGINT NOT NULL,
	Estado BIT NOT NULL,
	CONSTRAINT PK_ID_CAJA PRIMARY KEY (IDCaja)
)
GO

CREATE TABLE CAJA_X_EMPLEADO(
	ID BIGINT IDENTITY(1,1),
	IDCaja BIGINT NOT NULL,
	IDEmpleado BIGINT NOT NULL,
	FichaEntrada DATETIME NOT NULL,
	FichaSalida DATETIME NULL,
	CONSTRAINT PK_CAJAS_X_EMPLEADOS PRIMARY KEY (IDEmpleado, IDCaja),
	CONSTRAINT FK_EMPLEADO_CAJA FOREIGN KEY (IDEmpleado) REFERENCES EMPLEADOS(IDEmpleado)
)
GO

CREATE TABLE FICHAJE(
	ID BIGINT IDENTITY(1,1),
	IDEmpleado BIGINT NOT NULL,
	FichaEntrada DATETIME NOT NULL,
	FichaSalida DATETIME NULL,
	CONSTRAINT PK_ENTRADA PRIMARY KEY (IDEmpleado, FichaEntrada),
	CONSTRAINT FK_EMPLEADO FOREIGN KEY (IDEmpleado) REFERENCES EMPLEADOS(IDEmpleado)
)
GO


CREATE TABLE TIPO_CLIENTE(
	ID BIGINT IDENTITY(1,1),
	IDTtipo BIGINT NOT NULL,
	NombreTipoCliente VARCHAR(20) NOT NULL,
	CONSTRAINT PK_ID_TIPO PRIMARY KEY (IDTtipo),
	CONSTRAINT UQ_UNICIDAD_TIPO_CLIENTE UNIQUE (IDTtipo, NombreTipoCliente)
)
GO

CREATE TABLE CLIENTES(
	ID BIGINT IDENTITY(1,1),
	IDCliente BIGINT NOT NULL,
	IDTipoCliente BIGINT NOT NULL,
	Estado BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_CLIENTE PRIMARY KEY (IDCliente),
	CONSTRAINT UQ_UNICIDAD_CLIENTE UNIQUE (IDCliente, IDTipoCliente),
	CONSTRAINT FK_TIPO_EMPLEADO FOREIGN KEY (IDTipoCliente) REFERENCES TIPO_CLIENTE(IDTtipo),
	CONSTRAINT FK_USUARIO_CLIENTE FOREIGN KEY (IDCliente) REFERENCES USUARIOS(IDUsuario)
)
GO

CREATE TABLE TIPO_PAGO(
	ID BIGINT IDENTITY(1,1),
	IDTipoPago BIGINT NOT NULL,
	NombreTipoPago VARCHAR(20) NOT NULL,
	CONSTRAINT PK_ID_TIPO_PAGO PRIMARY KEY (IDTipoPago),
	CONSTRAINT UQ_UNICIDAD_TIPO_PAGO UNIQUE (IDTipoPago, NombreTipoPago)
)
GO

CREATE TABLE COMPRAS(
	ID BIGINT IDENTITY(1,1),
	IDCompra BIGINT NOT NULL,
	IDCaja BIGINT NOT NULL,--
	IDCliente BIGINT NOT NULL,--
	IDCajero BIGINT NOT NULL,--
	Monto MONEY NOT NULL,
	FechaCompra DATETIME NOT NULL,
	IDTipoPago BIGINT NOT NULL,--
	Cantidad BIGINT NOT NULL,
	DescuentoMayorista MONEY NOT NULL,
	CONSTRAINT PK_ID_COMPRA PRIMARY KEY (IDCompra),
	CONSTRAINT FK_CAJA_COMPRA FOREIGN KEY (IDCaja) REFERENCES CAJAS(IDCaja),
	CONSTRAINT FK_CLIENTE_COMPRA FOREIGN KEY (IDCliente) REFERENCES CLIENTES(IDCliente),
	CONSTRAINT FK_CAJERO_COMPRA FOREIGN KEY (IDCajero) REFERENCES EMPLEADOS(IDEmpleado),
	CONSTRAINT FK_Tipo_Pago FOREIGN KEY (IDTipoPago) REFERENCES TIPO_PAGO(IDTipoPago),
	CONSTRAINT CK_MONTO_VALIDO CHECK (Monto > 0),
	CONSTRAINT CK_CANTIDAD_VALIDA CHECK (Cantidad > 0),
	CONSTRAINT CK_DESCUENTO_VALIDO CHECK (DescuentoMayorista >= 0)
)
GO

CREATE TABLE COMPRA_X_CLIENTE(
	ID BIGINT IDENTITY(1,1),
	IDCliente BIGINT NOT NULL,
	IDCompra BIGINT NOT NULL,
	CONSTRAINT PK_COMPRA PRIMARY KEY (IDCliente, IDCompra),
	CONSTRAINT FK_CLIENTE_X_COMPRA FOREIGN KEY (IDCliente) REFERENCES CLIENTES(IDCliente),
	CONSTRAINT FK_COMPRA_CLIENTE FOREIGN KEY (IDCompra) REFERENCES COMPRAS(IDCompra)
)
GO

CREATE TABLE PRODUCTOS(
	ID BIGINT IDENTITY(1,1),
	IDProducto BIGINT NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Stock BIGINT NOT NULL,
	Precio MONEY NOT NULL,
	Descripcion VARCHAR(300) NOT NULL,
	Estado BIT NOT NULL,
	CONSTRAINT PK_PRODUCTO PRIMARY KEY (IDProducto),
	CONSTRAINT UQ_UNICIDAD_PRODUCTOS UNIQUE (Nombre, Descripcion),
	CONSTRAINT CK_PRECIO_VALIDO CHECK (Precio > 0),
	CONSTRAINT CK_STOCK_VALIDO CHECK (Stock >= 0)  
)
GO

CREATE TABLE COMPRA_X_PRODUCTO(
	ID BIGINT IDENTITY(1,1),
	IDCompra BIGINT NULL,
	IDProducto BIGINT NOT NULL,
	PrecioUnitarioHistorico MONEY NOT NULL,
	CONSTRAINT PK_COMPRA_PRODUCTO PRIMARY KEY (ID, IDProducto),
	CONSTRAINT FK_ID_COMPRA FOREIGN KEY (IDCompra) REFERENCES COMPRAS(IDCompra),
	CONSTRAINT FK_ID_PRODUCTO FOREIGN KEY (IDProducto) REFERENCES PRODUCTOS(IDProducto)
)
GO

CREATE TABLE CATEGORIAS(
	ID BIGINT IDENTITY(1,1),
	IDCategoria BIGINT NOT NULL,
	NombreCategoria VARCHAR(20) NOT NULL,
	Estado BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_CATEGORIA PRIMARY KEY (IDCategoria),
	CONSTRAINT UQ_UNICIDAD_CATEGORIAS UNIQUE (IDCategoria, NombreCategoria)
)
GO

CREATE TABLE PRODUCTO_X_CATEGORIA(
	ID BIGINT IDENTITY(1,1),
	IDProducto BIGINT NOT NULL,
	IDCategoria BIGINT NOT NULL,
	CONSTRAINT PK_PRODUCTO_CATEGORIA PRIMARY KEY (IDProducto, IDCategoria),
	CONSTRAINT FK_ID_PRODUCTO_CATEGORIA FOREIGN KEY (IDProducto) REFERENCES PRODUCTOS(IDProducto),
	CONSTRAINT FK_ID_CATEGORIA_PRODUCTO FOREIGN KEY (IDCategoria) REFERENCES CATEGORIAS(IDCategoria)
)
GO

INSERT INTO PUESTOS (IDPuesto, NombrePuesto) VALUES 
(1, 'Cajero'),
(2, 'Repositor'),
(3, 'Gerente'),
(4, 'Manager');
GO

INSERT INTO USUARIOS (IDUsuario, Email, Pass, Nombre, Apellido, Direccion, Telefono) VALUES 
(0, 'automatico@super.com', 'pass000', ' ', ' ', ' ', ' '), -- usuario para el autoservicio
(1, 'cajero@super.com', 'pass123', 'Juan', 'Perez', 'Av. Siempre Viva 123', '123456789'),
(2, 'repositor@super.com', 'pass456', 'Maria', 'Gomez', 'Calle Falsa 456', '987654321'),
(3, 'gerente@super.com', 'pass789', 'Carlos', 'Lopez', 'Av. Central 789', '456789123'),
(4, 'manager@super.com', 'pass321', 'Lucia', 'Fernandez', 'Calle 8 1010', '654123987'),
(5, 'cliente@super.com', 'pass111', 'Lucio', 'Hernandez', 'p`sherman wallabie', '11223344'); -- cuenta de un cliente.
GO

INSERT INTO EMPLEADOS (IDEmpleado, FechaIngreso, FechaEgreso) VALUES 
(0, '1999-01-01', NULL), -- empleado para el autoservicio
(1, '2023-01-10', NULL),
(2, '2023-02-15', NULL),
(3, '2022-08-01', NULL),
(4, '2021-05-20', NULL);
GO

INSERT INTO EMPLEADOS_X_PUESTO (IDEmpleado, IDPuesto) VALUES 
(1, 1), -- Juan Perez - cajero
(2, 2), -- Maria Gomez - repositor
(3, 3), -- Carlos Lopez - gerente
(4, 4); -- Lucia Fernandez - manager
GO

INSERT INTO CAJAS (IDCaja, Estado) VALUES 
(0, 1), -- CAJA RESERVADA PARA EL AUTOSERVICIO.
(1, 1), -- abierto
(2, 0); -- cerrado
GO

INSERT INTO CAJA_X_EMPLEADO (IDCaja, IDEmpleado, FichaEntrada, FichaSalida) VALUES 
(1, 1, '2024-01-15 08:00:00', '2024-01-15 16:00:00'),
(2, 1, '2024-01-16 08:00:00', NULL);
GO

INSERT INTO FICHAJE (IDEmpleado, FichaEntrada, FichaSalida) 
VALUES 
(1, '2024-01-15 08:00:00', '2024-01-15 17:00:00'),
(2, '2024-01-15 09:00:00', '2024-01-15 18:00:00'),
(3, '2024-01-15 07:00:00', '2024-01-15 16:00:00'),
(4, '2024-01-15 07:00:00', '2024-01-15 16:00:00');
GO

INSERT INTO TIPO_CLIENTE (IDTtipo, NombreTipoCliente) VALUES 
(1, 'Mayorista'),
(2, 'Minorista');
GO

INSERT INTO CLIENTES (IDCliente, IDTipoCliente) VALUES 
(1, 1),
(5, 1), -- cliente mayorista.
(2, 2);
GO

INSERT INTO TIPO_PAGO (IDTipoPago, NombreTipoPago) VALUES 
(1, 'Efectivo'),
(2, 'Tarjeta de Cr�dito');
GO

INSERT INTO COMPRAS (IDCompra, IDCaja, IDCliente, IDCajero, Monto, FechaCompra, IDTipoPago, Cantidad, DescuentoMayorista) VALUES 
(1001, 1, 1, 1, 500.00, '2024-01-15 14:30:00', 1, 10, 50.00),
(1002, 2, 2, 1, 150.00, '2024-01-15 15:00:00', 2, 5, 0.00);
GO

INSERT INTO COMPRA_X_CLIENTE (IDCliente, IDCompra) VALUES 
(1, 1001),
(2, 1002);
GO

INSERT INTO PRODUCTOS (IDProducto, Nombre, Stock, Precio, Descripcion, Estado) VALUES 
(1001, 'Leche', 100, 50.00, 'Leche entera 1L', 1),
(1002, 'Pan', 200, 30.00, 'Pan integral 500g', 1),
(1003, 'Queso', 50, 80.00, 'Queso 250g', 1);
GO

INSERT INTO COMPRA_X_PRODUCTO (IDCompra, IDProducto, PrecioUnitarioHistorico) VALUES 
(1001, 1001, 50.00),
(1001, 1002, 30.00),
(1002, 1003, 80.00);
GO

INSERT INTO CATEGORIAS (IDCategoria, NombreCategoria) VALUES 
(1, 'L�cteos'),
(2, 'Panader�a'),
(3, 'Frescos');
GO

INSERT INTO PRODUCTO_X_CATEGORIA (IDProducto, IDCategoria) VALUES 
(1001, 1), -- Leche x L�cteo
(1002, 2), -- Pan x Panader�a
(1003, 1); -- Queso x L�cteo
GO

CREATE PROCEDURE SP_OBTENER_PRODUCTOS_X_CATEGORIA(
	@IDCategoria BIGINT
	)
AS
BEGIN
    SELECT p.IDProducto, p.Nombre, p.Stock, p.Precio, p.Descripcion
    FROM PRODUCTOS p
    INNER JOIN PRODUCTO_X_CATEGORIA pc ON p.IDProducto = pc.IDProducto
    WHERE pc.IDCategoria = @IDCategoria;
END 
GO

CREATE PROCEDURE SP_OBTENER_EMPLEADOS_Y_PUESTO
AS
BEGIN
    SELECT e.IDEmpleado, u.Nombre, u.Apellido, p.NombrePuesto
    FROM EMPLEADOS e
    INNER JOIN USUARIOS u ON e.IDEmpleado = u.IDUsuario
    INNER JOIN EMPLEADOS_X_PUESTO ep ON e.IDEmpleado = ep.IDEmpleado
    INNER JOIN PUESTOS p ON ep.IDPuesto = p.IDPuesto;
END
GO
--EXEC SP_OBTENER_EMPLEADOS_Y_PUESTO
--DROP PROCEDURE SP_OBTENER_EMPLEADOS_Y_PUESTO

CREATE PROCEDURE SP_Listar_Productos
AS
BEGIN
    SELECT p.IDProducto, p.Nombre, p.Stock, p.Precio, p.Descripcion, p.Estado
    FROM PRODUCTOS p;
END
GO


	
-- MODIFICACION DE LA ESTRUCTURA DE LA BBDD 
/*
	SE DEBE BASICAMENTE A QUE EN EL MOMENTO DE HACER EL INSERT NO SE CUENTA CON EL IDCOMPRA
	YA QUE ESTE SE GENERARA POSTERIORMENTE, 
	ENTONCES SE HABILITA PARA QUE LA MISMA RECIBA PARAMETROS NULL
	LOS CUALES VAN A SER MODIFICADOS INMEDIATAMENTE AL TERMIAR EL TRIGGER
	MEDIANTE UN UPDATE QUE SERA DISPARADO POR OTRO TRIGGER EN LA TABLA COMPRAS.
*/
ALTER TABLE [dbo].[COMPRAS_X_PRODUCTO]
DROP CONSTRAINT PK_COMPRA_PRODUCTO

ALTER TABLE [dbo].[COMPRAS_X_PRODUCTO]
ALTER COLUMN IDCompra BIGINT NULL

ALTER TABLE [dbo].[COMPRAS_X_PRODUCTO]
ADD CONSTRAINT PK_COMPRA_PRODUCTO PRIMARY KEY (ID, IDProducto) 

--//(////////////////////////////////////////////////////////////////////////(/////////////////////////////////////////////////////////////
-- TRIGGER DE INSERCION EN LA TABLA EL DISPARADOR QUE INICIA TODO.

CREATE OR ALTER TRIGGER TR_INSERCION_PRODUCTO_X_COMPRA ON COMPRA_X_PRODUCTO
INSTEAD OF INSERT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			--// AUNQUE ESTE VALIDADO EN EL CODEBHIND Y EN EL LLAMADO A LA BBDD, 
			--// NO ESTA DE MAS VALIDAR ACA TAMBIEN.
			IF ((SELECT Estado FROM PRODUCTOS WHERE IDProducto = (SELECT IDProducto FROM inserted)) <> 1)BEGIN
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION
				RAISERROR('EL PRODUCTO NO ESTA DISPONIBLE', 16, 10)
			END

			INSERT INTO COMPRA_X_PRODUCTO (IDCompra, IDProducto, PrecioUnitarioHistorico)
			SELECT 
				NULL, 
				I.IDProducto, 
				(SELECT Precio FROM PRODUCTOS WHERE IDProducto = I.IDProducto)  
			FROM inserted AS I

			UPDATE PRODUCTOS SET 
				Stock = (Stock-1)
			WHERE IDProducto = (SELECT IDProducto FROM inserted)

			IF ((SELECT Stock FROM PRODUCTOS WHERE IDProducto = (SELECT IDProducto FROM inserted)) = 0) BEGIN 
				UPDATE PRODUCTOS SET 
					Estado = 0
				WHERE IDProducto = (SELECT IDProducto FROM inserted)
			END

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		RAISERROR('OCURRIO UN ERROR EN LA OPERACION INTENTELO NUEVAMENTE', 16, 10)
	END CATCH
END
GO


--//(////////////////////////////////////////////////////////////////////////(/////////////////////////////////////////////////////////////
-- TRIGGER DE INSERCION EN LA TABLA COMPRAS EL DISPARADOR QUE LO FINALIZA TODO.


CREATE OR ALTER TRIGGER TR_INSERTAR_COMPRA ON COMPRAS
INSTEAD OF INSERT
AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			-- VARIABLES QUE SE CALCULAN
			DECLARE @ID_COMPRA BIGINT, @MONTO_TOTAL MONEY,  @FECHA_COMPRA DATETIME, @CANTIDAD BIGINT, @DESCUENTO_MAYORISTA MONEY
			-- VARIABLES QUE VIENEN DE INSERTED
			DECLARE @ID_CAJA BIGINT, @ID_CLIENTE BIGINT, @ID_CAJERO BIGINT, @ID_TIPO_PAGO BIGINT

			
			SET @ID_COMPRA = (SELECT ISNULL(MAX(IDCompra), 0) + 1 FROM COMPRAS)
			SET @MONTO_TOTAL = (SELECT SUM(PrecioUnitarioHistorico) FROM COMPRA_X_PRODUCTO WHERE IDCompra IS NULL)
			SET @CANTIDAD = (SELECT COUNT(ID) FROM COMPRA_X_PRODUCTO WHERE IDCompra IS NULL)
			SET @FECHA_COMPRA = GETDATE()

			SELECT @ID_CAJA = IDCaja, @ID_CLIENTE = IDCliente, @ID_CAJERO = IDCajero, @ID_TIPO_PAGO = IDTipoPago FROM inserted

			IF(@CANTIDAD = 0) BEGIN
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION
				RAISERROR('OCURRIO UN ERROR, LA CANTIDAD NO PUEDE SER CERO', 16, 10)
			END

			IF(@MONTO_TOTAL IS NULL) BEGIN
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION
				RAISERROR('OCURRIO UN ERROR, EL MONTO NO PUEDE SER CERO', 16, 10)
			END

			IF @CANTIDAD > 15 AND (SELECT IDTipoCliente FROM CLIENTES WHERE IDCliente = @ID_CLIENTE) = 1 BEGIN 
				SET @DESCUENTO_MAYORISTA = @MONTO_TOTAL * 0.15
			END	
			ELSE BEGIN
				SET @DESCUENTO_MAYORISTA = 0
			END

			INSERT INTO COMPRAS (IDCompra, IDCaja, IDCliente, IDCajero, Monto, FechaCompra, IDTipoPago, Cantidad, DescuentoMayorista)
			VALUES 
			(
				@ID_COMPRA, --IDCOMPRA
				@ID_CAJA, -- viene del codebehind
				@ID_CLIENTE,  -- viene del codebehind 
				@ID_CAJERO,  -- viene del codebehind
				@MONTO_TOTAL, --MONTO TOTAL
				@FECHA_COMPRA, --FECHA DE COMPRA
				@ID_TIPO_PAGO, -- viene del codebehind
				@CANTIDAD, --CANTIDAD 
				@DESCUENTO_MAYORISTA
			) 

			UPDATE COMPRA_X_PRODUCTO SET
				IDCompra = @ID_COMPRA
			WHERE IDCompra IS NULL

			INSERT INTO COMPRA_X_CLIENTE (IDCliente, IDCompra)
			VALUES (@ID_CLIENTE, @ID_COMPRA)

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		RAISERROR('OCURRIO UN ERROR EN LA OPERACION INTENTELO NUEVAMENTE', 16, 10)
	END CATCH
END
GO

--// PARA VERIFICAR DESPUES DE HACER UNA COMPRA.
--SELECT * FROM COMPRAS
--SELECT * FROM COMPRA_X_PRODUCTO
--SELECT * FROM PRODUCTOS
--SELECT * FROM COMPRA_X_CLIENTE

--------------- ACA EMPIEZAN VISTAS Y PROCEDIMIENTOS PARA USUARIOS ------------------------

CREATE OR ALTER VIEW VW_VistaUsuariosGeneral AS
SELECT 
    u.IDUsuario,
    u.Nombre,
    u.Apellido,
    ISNULL(CONVERT(VARCHAR, e.FechaIngreso, 103), 'No es empleado') AS FechaIngreso,  
    ISNULL(p.NombrePuesto, 'Sin puesto asignado') AS Puesto
FROM 
    USUARIOS u
LEFT JOIN 
    EMPLEADOS e ON u.IDUsuario = e.IDEmpleado
LEFT JOIN 
    EMPLEADOS_X_PUESTO ep ON e.IDEmpleado = ep.IDEmpleado
LEFT JOIN 
    PUESTOS p ON ep.IDPuesto = p.IDPuesto;
GO


---REVISAR Q NO TRAIGA CLIENTE O QUE NO APARECE EL NOMBRE
CREATE OR ALTER VIEW VW_VistaCompras AS
SELECT 
    c.IDCompra,
    cl.IDCliente,
    uCliente.Nombre AS NombreCliente,
    uCajero.Nombre AS NombreCajero,
    c.FechaCompra,
    c.Monto,
    c.Cantidad,
    c.DescuentoMayorista
FROM 
    COMPRAS c
INNER JOIN 
    CLIENTES cl ON c.IDCliente = cl.IDCliente
INNER JOIN 
    USUARIOS uCliente ON cl.IDCliente = uCliente.IDUsuario
INNER JOIN 
    EMPLEADOS ec ON c.IDCajero = ec.IDEmpleado
INNER JOIN 
    USUARIOS uCajero ON ec.IDEmpleado = uCajero.IDUsuario;
GO

CREATE OR ALTER PROCEDURE sp_AltaUsuario
    @IDUsuario BIGINT,
    @Email VARCHAR(100),
    @Pass VARCHAR(20),
    @Nombre VARCHAR(20),
    @Apellido VARCHAR(20),
    @Direccion VARCHAR(40) = NULL,
    @Telefono VARCHAR(20) = NULL
AS
BEGIN
    INSERT INTO USUARIOS (IDUsuario, Email, Pass, Nombre, Apellido, Direccion, Telefono, Estado)
    VALUES (@IDUsuario, @Email, @Pass, @Nombre, @Apellido, @Direccion, @Telefono, 1); -- Estado 1: Activo
END;
GO

CREATE OR ALTER PROCEDURE sp_ModificarUsuario
    @IDUsuario BIGINT,
    @Email VARCHAR(100),
    @Pass VARCHAR(20),
    @Nombre VARCHAR(20),
    @Apellido VARCHAR(20),
    @Direccion VARCHAR(40) = NULL,
    @Telefono VARCHAR(20) = NULL,
    @Estado BIT
AS
BEGIN
    UPDATE USUARIOS
    SET Email = @Email,
        Pass = @Pass,
        Nombre = @Nombre,
        Apellido = @Apellido,
        Direccion = @Direccion,
        Telefono = @Telefono,
        Estado = @Estado
    WHERE IDUsuario = @IDUsuario;
END;
GO

CREATE OR ALTER PROCEDURE sp_DarDeBajaUsuario(
    @IDCliente BIGINT,
    @Estado BIT
	)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM USUARIOS WHERE IDUsuario = @IDCliente)
    BEGIN
        UPDATE USUARIOS
        SET Estado = @Estado
        WHERE IDUsuario = @IDCliente;
    END
    ELSE
    BEGIN
        ROLLBACK;
    END
END;
GO

CREATE OR ALTER TRIGGER trg_UpdateEstadoCliente
ON USUARIOS
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Estado)
    BEGIN
        UPDATE CLIENTES
        SET Estado = (SELECT Estado FROM INSERTED WHERE IDUsuario = CLIENTES.IDCliente)
        WHERE IDCliente IN (SELECT IDUsuario FROM INSERTED);
    END
END;
GO
--PARA PROBAR
--select * from CLIENTES
--exec sp_DarDeBajaUsuario 2, 0
--SELECT * FROM USUARIOS WHERE IDUsuario = 2;

CREATE OR ALTER PROCEDURE sp_ReactivarUsuario
    @IDUsuario BIGINT
AS
BEGIN
    UPDATE USUARIOS
    SET Estado = 1 
    WHERE IDUsuario = @IDUsuario AND Estado = 0; 
END;
GO

CREATE OR ALTER VIEW VW_EMPLEADOS_PUESTOS AS
SELECT 
    e.IDEmpleado AS 'IDEmpleado',
    u.Nombre,
    u.Apellido,
	p.IDPuesto,
    p.NombrePuesto,
	e.FechaIngreso,
	e.FechaEgreso,
    CASE 
        WHEN f.FichaSalida IS NULL THEN 'Activo'
        ELSE 'Inactivo'
    END AS EstadoEmpleado
FROM EMPLEADOS e
INNER JOIN USUARIOS u ON e.IDEmpleado = u.IDUsuario
INNER JOIN EMPLEADOS_X_PUESTO ep ON e.IDEmpleado = ep.IDEmpleado
INNER JOIN PUESTOS p ON ep.IDPuesto = p.IDPuesto
LEFT JOIN FICHAJE f ON e.IDEmpleado = f.IDEmpleado
WHERE f.FichaEntrada = (SELECT MAX(FichaEntrada) FROM FICHAJE WHERE IDEmpleado = e.IDEmpleado);
GO

CREATE OR ALTER VIEW VW_CLIENTES_TIPO_ESTADO AS
SELECT 
    cli.IDCliente,
    u.Nombre AS 'Nombre',
    u.Apellido AS 'Apellido', 
    u.Email AS 'Email',
	u.Telefono,
	 cli.IDTipoCliente,
    tc.NombreTipoCliente,
    cli.Estado AS 'Estado'
FROM CLIENTES cli
INNER JOIN USUARIOS u ON cli.IDCliente = u.IDUsuario
INNER JOIN TIPO_CLIENTE tc ON cli.IDTipoCliente = tc.IDTtipo;
GO

--SELECT * FROM VW_CLIENTES_TIPO_ESTADO
--SELECT IDCliente, Nombre, Apellido, Email, NombreTipoCliente, EstadoCliente FROM VW_CLIENTES_TIPO_ESTADO;

--------------- ACA TERMINA VISTAS Y PROCEDIMIENTOS PARA USUARIOS ------------------------



SELECT * FROM COMPRAS
SELECT * FROM COMPRA_X_PRODUCTO
SELECT * FROM PRODUCTOS
SELECT * FROM COMPRA_X_CLIENTE

--// VIEW PARA MOSTRAR TODOS LOS DETALLES DE UNA COMPRA.

CREATE OR ALTER VIEW VW_COMPRA_EXPANDIDA
AS 
SELECT
C.IDCompra AS 'Codigo Compra', 
C.IDCaja AS 'Caja',
C.IDCajero AS 'Numero Cajero',
U1.Nombre + ' ' + U1.Apellido AS 'Nombre cajero',
CL.IDCliente AS 'Identificador Cliente',
U2.Nombre + ' ' + U2.Apellido AS 'Nombre Cliente',
TC.NombreTipoCliente AS 'Tipo de Cliente',
C.FechaCompra AS 'Fecha de Compra',
TP.NombreTipoPago AS 'Tipo de pago',
C.Cantidad AS 'Total de productos',
'$' + cast(C.Monto as varchar(20)) as 'Importe Bruto',
'$' + cast(C.DescuentoMayorista as varchar(20)) as 'Descuento Mayorista',
'$' + cast((C.Monto - C.DescuentoMayorista) as varchar(20)) as 'Importe neto total'
FROM COMPRAS AS C
INNER JOIN 
	CLIENTES AS CL 
	ON CL.IDCliente = C.IDCliente
INNER JOIN 
	USUARIOS AS U1 
	ON U1.IDUsuario = C.IDCajero
INNER JOIN 
	USUARIOS AS U2 
	ON U2.IDUsuario = C.IDCliente
INNER JOIN 
	TIPO_CLIENTE AS TC 
	ON TC.IDTtipo = CL.IDTipoCliente
INNER JOIN 
	TIPO_PAGO AS TP 
	ON TP.IDTipoPago = C.IDTipoPago
GO

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE OR ALTER VIEW VW_PRODUCTOS_X_COMPRA_EXPANDIDA
AS
SELECT
CXP.IDCompra AS 'ID Compra',
P.Nombre AS 'Producto',
C.NombreCategoria AS 'Categoria',
CXP.PrecioUnitarioHistorico AS 'Precio Unitario',
CAST(COUNT(CXP.IDProducto) AS varchar(20)) + 'u' AS 'Cantidad'
FROM COMPRA_X_PRODUCTO AS CXP
INNER JOIN 
	PRODUCTOS AS P 
	ON P.IDProducto = CXP.IDProducto
INNER JOIN 
	PRODUCTO_X_CATEGORIA AS PXC 
	ON PXC.IDProducto = P.IDProducto
INNER JOIN 
	CATEGORIAS AS C 
	ON C.IDCategoria = PXC.IDCategoria
GROUP BY 
	CXP.IDCompra, 
	CXP.PrecioUnitarioHistorico, 
	P.Nombre,
	C.NombreCategoria
GO

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE OR ALTER PROCEDURE SP_REPORTE_COMPRA_DETALLADA
(
	@ID_COMPRA BIGINT
)
AS
BEGIN
	SELECT * FROM VW_COMPRA_EXPANDIDA AS VWC WHERE VWC.[Codigo Compra] = @ID_COMPRA
	SELECT * FROM VW_PRODUCTOS_X_COMPRA_EXPANDIDA AS VWP WHERE VWP.[ID Compra] = @ID_COMPRA
END

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE OR ALTER FUNCTION FN_ULTIMO_IDCOMPRA_CARGADO()
RETURNS BIGINT
AS
BEGIN
	DECLARE @ID_COMPRA_ULTIMO BIGINT

	SELECT TOP (1) @ID_COMPRA_ULTIMO = IDCompra 
	FROM COMPRAS 
	ORDER BY IDCompra DESC

	RETURN @ID_COMPRA_ULTIMO
END

SELECT dbo.FN_ULTIMO_IDCOMPRA_CARGADO() AS IDCompra

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE OR ALTER PROCEDURE SP_LISTAR_COMPRAS
AS
BEGIN 
	SELECT IDCompra, IDCaja, IDCliente, IDCajero, Monto, FechaCompra, IDTipoPago, Cantidad, DescuentoMayorista FROM COMPRAS
END

EXEC SP_LISTAR_COMPRAS

select * 
from CLIENTES as c

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SELECT	
	ID,
	IDEmpleado,

FROM EMPLEADOS