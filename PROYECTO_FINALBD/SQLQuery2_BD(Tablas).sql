USE PRUEBAFINAL;

CREATE TABLE TORNEOS (
	id_Torneo INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	Nombre_Torneo VARCHAR(50) NOT NULL,
	Categoria_T VARCHAR(20) NOT NULL,
	Fecha_Inicio VARCHAR(10) NOT NULL,
	Duracion VARCHAR(20) NOT NULL,
	Ubicación_T VARCHAR(30) NOT NULL,
	Reglas_Especificas VARCHAR(100) NOT NULL,
);
ALTER TABLE TORNEOS
ADD CONSTRAINT constraint1 UNIQUE (Nombre_Torneo);

CREATE TABLE REGISTRO_EQUIPOS (
	id_Equipo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	id_Torneo INT NOT NULL FOREIGN KEY REFERENCES TORNEOS (id_Torneo), 
	Nombre VARCHAR(50) NOT NULL,
	Categoria VARCHAR(20) NOT NULL,
	Cantidad_Jugadores INT,
	Patrocinadores VARCHAR(50)
);
ALTER TABLE REGISTRO_EQUIPOS
ADD CONSTRAINT constraint2 UNIQUE (Nombre);


CREATE TABLE Torneo_Equipos  (
	id_Torneo INT NOT NULL FOREIGN KEY REFERENCES TORNEOS (id_Torneo),
	id_Equipo INT NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS (id_Equipo),
);


CREATE TABLE REGISTRO_JUGADOR (
	id_Jugador INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	id_Equipo INT NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS (id_Equipo),
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR (50) NOT NULL,
	Documento VARCHAR(15) NOT NULL,
	Edad INT NOT NULL,
	Genero VARCHAR(50) NOT NULL,
	Telefono VARCHAR(14) NOT NULL,
	Correo VARCHAR(50) NOT NULL,
);

CREATE INDEX idx_Jugador ON REGISTRO_JUGADOR (Nombre);

CREATE TABLE ACTUALIZACION_JUGADOR(
	id_Actualizacion_JUGADOR INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	id_Jugador INT NOT NULL FOREIGN KEY REFERENCES REGISTRO_JUGADOR (id_Jugador),
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR (50) NOT NULL,
	Documento VARCHAR(15) NOT NULL,
	Edad INT NOT NULL,
	Genero VARCHAR(50) NOT NULL,
	Telefono VARCHAR(10) NOT NULL,
	Correo VARCHAR(50) NOT NULL,
);

CREATE INDEX idx_Actualizar_Jugador ON ACTUALIZACION_JUGADOR (Nombre);

CREATE TABLE PROGRAMACION (
	id_Programacion INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	id_Torneo INT NOT NULL FOREIGN KEY REFERENCES TORNEOS (id_Torneo),
	Fecha VARCHAR(10) NOT NULL,
	Hora VARCHAR (10) NOT NULL,
	Ubicacion VARCHAR(50) NOT NULL,
	Equipo_local VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS(Nombre),
	VS CHAR(2) DEFAULT 'VS',
	Equipo_visitante VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS(Nombre), 
);

ALTER TABLE PROGRAMACION
ADD CONSTRAINT constraint3 UNIQUE (Fecha);

ALTER TABLE PROGRAMACION 
ADD CONSTRAINT chk_Equipos_Diferentes CHECK (Equipo_local != Equipo_visitante);

CREATE TABLE ACTUALIZACION_PROGRAMACION (
	id_Actualizacion_Programacion INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	id_Pogramacion INT NOT NULL FOREIGN KEY REFERENCES PROGRAMACION (id_Programacion),
	Nueva_Fecha VARCHAR(30) NOT NULL,
	Nueva_Ubicacion VARCHAR(30) NOT NULL,
	Mensaje VARCHAR(100),
	);

	--

	CREATE TABLE RESULTADOS (
	id_Resultado INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Torneo VARCHAR (50) NOT NULL FOREIGN KEY REFERENCES TORNEOS(Nombre_Torneo), 
	Equipo_local VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS(Nombre),
	VS CHAR(2) DEFAULT 'VS',
	Equipo_visitante VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS(Nombre),
	Marcador VARCHAR(50) NOT NULL,
	Gana_Equipo_Loical CHAR(1),
	Gana_Equipo_Visitante CHAR(1),
	Empate CHAR(1),
	Pierde_Equipo_Local CHAR(1),
	Pierde_Equipo_Visitante CHAR(1),
	Evento_Destacado VARCHAR(100) NOT NULL,
);

ALTER TABLE RESULTADOS
ADD CONSTRAINT constraint4 UNIQUE (Marcador);

ALTER TABLE RESULTADOS
ADD CONSTRAINT constraint5 UNIQUE (Evento_Destacado);

CREATE TABLE POSICIONES (
	id_Posicion INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	Equipo VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS(Nombre),
	Encuentros INT DEFAULT 0,
	Victoritas INT DEFAULT 0,
	Derrotas INT DEFAULT 0,
	Empates INT DEFAULT 0,
);


CREATE TABLE HISTORIAL (
	id_Historial INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Torneo VARCHAR (50) NOT NULL FOREIGN KEY REFERENCES TORNEOS (Nombre_Torneo),
	Fecha VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES PROGRAMACION (Fecha),
	Equipo_local VARCHAR (50) NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS (Nombre),
	Equipo_visitante VARCHAR (50) NOT NULL FOREIGN KEY REFERENCES REGISTRO_EQUIPOS (Nombre),
	Marcador VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES RESULTADOS (Marcador),
	Evento_Destacado VARCHAR(100) NOT NULL FOREIGN KEY REFERENCES RESULTADOS (Evento_Destacado),

);


--
GO
CREATE TRIGGER Sumar_jugadores 
ON REGISTRO_JUGADOR
AFTER INSERT 
AS 
BEGIN
	UPDATE REGISTRO_EQUIPOS 
	SET Cantidad_jugadores = Cantidad_jugadores + 1
	FROM REGISTRO_EQUIPOS 
	JOIN INSERTED ON REGISTRO_EQUIPOS.id_Equipo=inserted.id_Equipo;
END;

SET IDENTITY_INSERT REGISTRO_EQUIPOS ON
SET IDENTITY_INSERT TORNEOS ON