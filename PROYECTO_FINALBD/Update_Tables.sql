
--CREATE DATABASE PRUEBAFINAL;

USE PRUEBAFINAL;

--Tabla Genero
	CREATE TABLE GENEROS (
	Masculino VARCHAR (10),
	Femenino VARCHAR (10),
	LGTBIQ VARCHAR (10),
	No_Especifica VARCHAR (20)
	);

	INSERT INTO  GENEROS VALUES
		('Masculino', 'Femenino', 'LGTBIQ+', 'No_Especifica');

-- Tabla CATEGORIAS

	CREATE TABLE CATEGORIAS(
    Masculino VARCHAR(10),
    Femenino VARCHAR(10),
    Mixto VARCHAR(50),
    No_Especifica VARCHAR(20)
);
	INSERT INTO CATEGORIAS
	VALUES ('Masculino', 'Femenino', 'Mixto', 'No especifica');


-- Tabla TORNEOS
	CREATE TABLE TORNEOS (
		id_Torneo INT IDENTITY(1,1) PRIMARY KEY, 
		Nombre_Torneo VARCHAR(50),
		Categoria_T VARCHAR(20),
		Fecha_Inicio DATETIME,
		Fecha_Final DATETIME,
		Ubicacion_T VARCHAR(30),
		Reglas_Especificas VARCHAR(100),
		Estado BIT NOT NULL DEFAULT 1
	);
		CREATE INDEX idx_Torneo ON TORNEOS (Nombre_Torneo);

-- Tabla REGISTRO_EQUIPOS
	CREATE TABLE REGISTRO_EQUIPOS (
		id_Equipo INT IDENTITY(1,1) PRIMARY KEY,
		id_Torneo INT,
		Nombre VARCHAR(50),
		Categoria VARCHAR(20),
		Cantidad_Jugadores INT,
		Patrocinadores VARCHAR(50),
		Estado BIT NOT NULL DEFAULT 1,
		FOREIGN KEY (id_Torneo) REFERENCES TORNEOS (id_Torneo),
	);
	ALTER TABLE REGISTRO_EQUIPOS
		ADD CONSTRAINT UC_Equipos UNIQUE (Nombre);

-- Tabla Torneo_Equipos
	CREATE TABLE Torneo_Equipos (
		id_Torneo INT,
		id_Equipo INT,
		FOREIGN KEY (id_Torneo) REFERENCES TORNEOS (id_Torneo),
		FOREIGN KEY (id_Equipo) REFERENCES REGISTRO_EQUIPOS (id_Equipo)
	);

-- Tabla REGISTRO_JUGADOR
	CREATE TABLE REGISTRO_JUGADOR (
		id_Jugador INT IDENTITY(1,1) PRIMARY KEY,
		id_Equipo INT,
		Nombre VARCHAR(50),
		Apellido VARCHAR(50),
		Documento VARCHAR(15),
		Edad INT NOT NULL,
		Genero VARCHAR(50),
		Telefono VARCHAR(14),
		Correo VARCHAR(50),
		Estado BIT NOT NULL DEFAULT  1
		FOREIGN KEY (id_Equipo) REFERENCES REGISTRO_EQUIPOS (id_Equipo),
	);

-- Tabla PROGRAMACION
	CREATE TABLE PROGRAMACION (
		id_Programacion INT IDENTITY(1,1) PRIMARY KEY,
		id_Torneo INT,
		Fecha DATETIME,
		Hora DATETIME,
		Ubicacion VARCHAR(50),
		Equipo_local VARCHAR(50),
		VS CHAR(2) DEFAULT 'VS',
		Equipo_visitante VARCHAR(50),
		Estado BIT NOT NULL DEFAULT 1,
		FOREIGN KEY (id_Torneo) REFERENCES TORNEOS (id_Torneo),
		FOREIGN KEY (Equipo_local) REFERENCES REGISTRO_EQUIPOS (Nombre),
		FOREIGN KEY (Equipo_visitante) REFERENCES REGISTRO_EQUIPOS (Nombre)
	);

	ALTER TABLE PROGRAMACION
		ADD CONSTRAINT UC_Fecha UNIQUE (Fecha);

-- Tabla RESULTADOS
	CREATE TABLE RESULTADOS (
		id_Resultado INT IDENTITY(1,1) PRIMARY KEY,
		id_Torneo INT,
		Equipo_local VARCHAR(50),
		VS CHAR(2) DEFAULT 'VS',
		Equipo_visitante VARCHAR(50),
		Marcador VARCHAR(50),
		Ganador VARCHAR(50),
		Perdedor VARCHAR(50),
		Empate VARCHAR(50),
		Evento_Destacado VARCHAR(100),
		FOREIGN KEY (id_Torneo) REFERENCES TORNEOS (id_Torneo),
		FOREIGN KEY (Equipo_local) REFERENCES REGISTRO_EQUIPOS (Nombre),
		FOREIGN KEY (Equipo_visitante) REFERENCES REGISTRO_EQUIPOS (Nombre)
	);

	ALTER TABLE RESULTADOS
		ADD	Estado BIT NOT NULL DEFAULT 1;

	ALTER TABLE RESULTADOS
		ADD CONSTRAINT UC_Resultados UNIQUE (Marcador, Evento_Destacado);

-- Tabla POSICIONES
	CREATE TABLE POSICIONES (
		id_Posicion INT IDENTITY(1,1) PRIMARY KEY,
		Equipo VARCHAR(50),
		Encuentros VARCHAR(50),
		Victorias VARCHAR(50),
		Derrotas VARCHAR(50),
		Empates VARCHAR(50),
		FOREIGN KEY (Equipo) REFERENCES REGISTRO_EQUIPOS (Nombre)
	);

-- Tabla HISTORIAL
	CREATE TABLE HISTORIAL (
		id_Historial INT IDENTITY(1,1) PRIMARY KEY,
		id_Torneo INT,
		Fecha DATETIME,
		Equipo_local VARCHAR(50),
		VS CHAR(2) DEFAULT 'VS',
		Equipo_visitante VARCHAR (50),
		Marcador VARCHAR(50),
		Evento_Destacado VARCHAR(100),
		FOREIGN KEY (id_Torneo) REFERENCES TORNEOS (id_Torneo),
		FOREIGN KEY (Fecha) REFERENCES PROGRAMACION (Fecha),
		FOREIGN KEY (Equipo_local) REFERENCES REGISTRO_EQUIPOS (Nombre),
		FOREIGN KEY (Equipo_visitante) REFERENCES REGISTRO_EQUIPOS (Nombre),
		FOREIGN KEY (Marcador, Evento_Destacado) REFERENCES RESULTADOS (Marcador, Evento_Destacado)
	);





