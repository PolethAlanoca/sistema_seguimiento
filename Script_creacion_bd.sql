CREATE DATABASE bd_sistema_seguimiento;
GO
-- Seleccionar la base de datos
USE bd_sistema_seguimiento;
GO

CREATE TABLE [estado_proyecto] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[estado] CHAR(20) NOT NULL,
);

CREATE TABLE [rol_proyecto] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[rol] CHAR(50) NOT NULL,
);

CREATE TABLE [estado_tarea] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[estado] CHAR(50) NOT NULL,
);

CREATE TABLE [prioridad] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[prioridad] CHAR(50) NOT NULL,
);

CREATE TABLE [usuario] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[nombre_completo] VARCHAR(100) NOT NULL,
	[correo] VARCHAR(30) NOT NULL,
	[contraseña] VARCHAR(max) NOT NULL,
	[fecha_registro] DATETIME NOT NULL,
	[rol_global] CHAR(50) NOT NULL,
);

CREATE TABLE [proyecto] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[nombre] VARCHAR(max) NOT NULL,
	[descripcion] VARCHAR(max) NOT NULL,
	[fecha_inicio] DATE NOT NULL,
	[fecha_fin] DATE NOT NULL,
	[id_estado] INT NOT NULL,
	CONSTRAINT [proyecto_fk5] FOREIGN KEY ([id_estado]) REFERENCES [estado_proyecto]([id]),
);

CREATE TABLE [proyecto_usuario] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[id_proyecto] INT NOT NULL,
	[id_usuario] INT NOT NULL,
	[id_rol_proyecto] INT NOT NULL,
	[fecha_ingreso] DATETIME NOT NULL,
	CONSTRAINT [proyecto_usuario_proyecto] FOREIGN KEY ([id_proyecto]) REFERENCES [proyecto]([id]),
	CONSTRAINT [proyecto_usuario_usuario] FOREIGN KEY ([id_usuario]) REFERENCES [usuario]([id]),
	CONSTRAINT [proyecto_usuario_rol_proyecto] FOREIGN KEY ([id_rol_proyecto]) REFERENCES [rol_proyecto]([id]),
);


CREATE TABLE [tarea] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[id_proyecto] INT NOT NULL,
	[titulo] VARCHAR(max) NOT NULL,
	[descripcion] VARCHAR(max) NOT NULL,
	[id_estado] INT NOT NULL,
	[id_prioridad] INT NOT NULL,
	CONSTRAINT [tarea_proyecto] FOREIGN KEY ([id_proyecto]) REFERENCES [proyecto]([id]),
	CONSTRAINT [tarea_estado] FOREIGN KEY ([id_estado]) REFERENCES [estado_tarea]([id]),
	CONSTRAINT [tarea_prioridadd] FOREIGN KEY ([id_prioridad]) REFERENCES [prioridad]([id]),
);

CREATE TABLE [asignacion_tarea] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[id_tarea] INT NOT NULL,
	[id_usuario] INT NOT NULL,
	[fecha_asignacion] DATETIME NOT NULL,
	CONSTRAINT [asignacion_tarea_tarea] FOREIGN KEY ([id_tarea]) REFERENCES [tarea]([id]),
	CONSTRAINT [asignacion_tarea_usuario] FOREIGN KEY ([id_usuario]) REFERENCES [usuario]([id]),

);

CREATE TABLE [comentario] (
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[id_tarea] INT NOT NULL,
	[id_usuario] INT NOT NULL,
	[contenido] VARCHAR(max) NOT NULL,
	[fecha_comentario] DATETIME NOT NULL,
	CONSTRAINT [comentario_tarea] FOREIGN KEY ([id_tarea]) REFERENCES [tarea]([id]),
	CONSTRAINT [comentario_usuario] FOREIGN KEY ([id_usuario]) REFERENCES [usuario]([id]),
);
