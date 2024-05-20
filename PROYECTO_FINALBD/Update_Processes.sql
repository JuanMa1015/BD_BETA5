USE PRUEBAFINAL

GO
	CREATE PROCEDURE SP_Registro_Datos_TORNEOS
		@Nombre_Torneo VARCHAR(50),
		@Categoria VARCHAR (20),
		@Fecha_Inicio DATE,
		@Ubicacion_T VARCHAR(50),
		@Reglas_Especificas VARCHAR(100),
		@Estado BIT,
		@Id_Torneo INT OUTPUT -- Parámetro de salida para el id_Torneo
	AS
	BEGIN
		IF @Nombre_Torneo IS NULL OR @Categoria IS NULL OR @Fecha_Inicio IS NULL OR @Ubicacion_T IS NULL OR @Reglas_Especificas IS NULL
			BEGIN
				THROW 51000, 'Los parámetros no pueden ser NULL', 1;
			END
		ELSE
			BEGIN
				INSERT INTO TORNEOS (Nombre_Torneo, Categoria_T, Fecha_Inicio, Ubicacion_T, Reglas_Especificas, Estado)
				VALUES (@Nombre_Torneo, @Categoria, @Fecha_Inicio, @Ubicacion_T, @Reglas_Especificas, @Estado)
				SET @Id_Torneo = SCOPE_IDENTITY(); -- Recuperar el id_Torneo generado
		END
	END


--Tabla RegistroJugadores
GO
	CREATE PROCEDURE SP_Registro_Datos_Jugadores
		@id_Equipo INT,
		@Nombre VARCHAR(50),
		@Apellido VARCHAR(50),
		@Documento VARCHAR(50),
		@Edad INT,
		@Genero VARCHAR (50),
		@Telefono VARCHAR(50),
		@Correo VARCHAR(50),
		@Estado BIT
	AS
	BEGIN
			IF @id_Equipo IS NULL OR @Nombre IS NULL OR @Apellido IS NULL OR @Documento IS NULL OR @Edad IS NULL OR @Genero IS NULL OR @Telefono IS NULL OR @Correo IS NULL
				BEGIN
					THROW 51000, 'Los parámetros no pueden ser NULL', 1;
				END
			ELSE
				BEGIN
					INSERT INTO REGISTRO_JUGADOR (id_Equipo, Nombre, Apellido, Documento, Edad, Genero, Telefono, Correo, Estado)
					VALUES (@id_Equipo, @Nombre, @Apellido, @Documento, @Edad, @Genero, @Telefono, @Correo, @Estado)
			END
	END
--
--Tabla Registro Equipo
GO
	CREATE PROCEDURE SP_Registro_Datos_Equipos
		@Id_Torneo INT,
		@Nombre VARCHAR(50),
		@Categoria VARCHAR (20),
		@Cantidad_Jugadores INT,
		@Patrocinadores VARCHAR(50),
		@Estado BIT
	AS
	BEGIN
		IF @Id_Torneo IS NULL OR @Nombre IS NULL OR @Categoria IS NULL OR @Cantidad_Jugadores IS NULL OR @Patrocinadores IS NULL
			BEGIN
				THROW 51000, 'Los parámetros no pueden ser NULL', 1;
			END
		ELSE
			BEGIN
				INSERT INTO REGISTRO_EQUIPOS (id_Torneo, Nombre, Categoria, Cantidad_Jugadores, Patrocinadores, Estado)
				VALUES (@Id_Torneo, @Nombre, @Categoria, @Cantidad_Jugadores, @Patrocinadores,@Estado)
			END
	END

--Tabla Programacion
GO
	CREATE PROCEDURE SP_REGISTRO_DATOS_PROGRAMACION
		@Id_Torneo INT,
		@Fecha DATETIME,
		@Hora DATETIME,
		@Ubicacion VARCHAR(50),
		@Equipo_Local VARCHAR(50),
		@VS CHAR(3),
		@Equipo_Visitante VARCHAR(50)
	AS
	BEGIN
		IF @Id_Torneo IS NULL OR @Fecha IS NULL OR @Hora IS NULL OR @Ubicacion IS NULL OR @Equipo_Local IS NULL OR @VS IS NOT NULL OR  @Equipo_Visitante IS NULL
			BEGIN
				THROW 51000, 'Los parámetros no pueden ser NULL', 1;
			END
		ELSE
			BEGIN
				INSERT INTO PROGRAMACION (id_Torneo, Fecha, Hora, Ubicacion, Equipo_local, VS, Equipo_visitante)
				VALUES (@Id_Torneo, @Fecha, @Hora, @Ubicacion, @Equipo_Local, @VS, @Equipo_Visitante)
			END
	END


-- Tabla Resultados
	CREATE PROCEDURE SP_REGISTRAR_DATOS_RESULTADOS
		@Id_Torneo INT,
		@Equipo_Local VARCHAR(50),
		@VS VARCHAR(3),
		@Equipo_Visitante VARCHAR(50),
		@Marcador VARCHAR(50),
		@Ganador VARCHAR(50),
		@Perdedor VARCHAR(50),
		@Empate CHAR(1),
		@Evento_Destacado VARCHAR(100)
	AS
	BEGIN
		IF @Id_Torneo IS NULL OR @Equipo_Local IS NULL OR @VS IS NOT NULL OR @Equipo_Visitante IS NULL OR @Marcador IS NULL OR @Ganador IS NOT NULL OR @Perdedor IS NOT NULL OR @Empate IS  NOT NULL OR @Evento_Destacado IS NOT NULL
			BEGIN
				THROW 51000, 'Los parámetros no pueden ser NULL', 1;
			END
		ELSE
			BEGIN
				INSERT INTO RESULTADOS (id_Torneo, Equipo_Local, VS, Equipo_Visitante, Marcador, Ganador, Perdedor, Empate, Evento_Destacado)
				VALUES (@Id_Torneo, @Equipo_Local,@VS, @Equipo_Visitante, @Marcador, @Ganador, @Perdedor, @Empate, @Evento_Destacado)
			END
	END

-- Tabla Posiciones
GO
	CREATE PROCEDURE SP_REGISTRAR_DATOS_POSICIONES
		@Equipo VARCHAR(50),
		@Encuentros VARCHAR(50),
		@Victorias VARCHAR(50),
		@Derrotas VARCHAR(50),
		@Empates VARCHAR(50)
	AS
	BEGIN
		IF @Equipo IS NULL OR @Encuentros IS NULL OR @Victorias IS NULL OR @Derrotas IS NULL OR @Empates IS NULL
			BEGIN
				THROW 51000, 'Los parámetros no pueden ser NULL', 1;
			END
		ELSE
			BEGIN
				INSERT INTO POSICIONES (Equipo, Encuentros, Victorias, Derrotas, Empates)
				VALUES (@Equipo, @Encuentros, @Victorias, @Derrotas, @Empates)
			END
	END
