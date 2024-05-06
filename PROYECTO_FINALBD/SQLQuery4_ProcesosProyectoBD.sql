USE PRUEBAFINAL;



EXEC sp_rename 'RESULTADOS.Gana_Equipo_Loical', 'Gana_Equipo_Local';

--Creación de procesos para el registro de atributos
--Tabla TORNEOS
CREATE PROCEDURE SP_Registro_Datos_TORNEOS
@Id_Torneo INT,
@Nombre_Torneo VARCHAR(50),
@Categoria_T VARCHAR(50),
@Fecha_Inicio DATE,
@Duracion Varchar(50),
@Ubicacion_T VARCHAR(50),
@Reglas_Especificas VARCHAR(100)
AS
BEGIN
	INSERT INTO TORNEOS (id_Torneo,Nombre_torneo,Categoria_T,Fecha_Inicio,Duracion,Ubicación_T,Reglas_Especificas)
	VALUES (@Id_Torneo,@Nombre_Torneo,@Categoria_T,@Fecha_Inicio,@Duracion,@Ubicacion_T,@Reglas_Especificas)
END;

--Tabla RegistroJugadores
CREATE PROCEDURE SP_Registro_Datos_Jugadores
@id_Jugador INT, 
@id_Equipo INT,
@Nombre VARCHAR(50),
@Apellido VARCHAR(50),
@Documento VARCHAR(50),
@Edad INT,
@Genero VARCHAR(50),
@Telefono VARCHAR(50),
@Correo VARCHAR(50)
AS
BEGIN
	INSERT INTO REGISTRO_JUGADOR(id_Jugador,id_Equipo,Nombre,Apellido,Documento,Edad,Genero,Telefono,Correo)
	VALUES (@id_Jugador,@id_Equipo,@Nombre,@Apellido,@Documento,@Edad,@Genero,@Telefono,@Correo)
END;

--Tabla ActualizacionJugador
CREATE PROCEDURE SP_Registro_Datos_ActualizacionJugador
@id_ActualizacionJugador INT,
@id_Jugador INT,
@Nombre VARCHAR(50),
@Apellido VARCHAR(50),
@Documento VARCHAR(50),
@Edad INT,
@Genero VARCHAR(50),
@Telefono VARCHAR(50),
@Correo VARCHAR(50)
AS
BEGIN --Ingresamos  los datos a la tabla Actualización Jugador
	INSERT INTO ACTUALIZACION_JUGADOR (id_Actualizacion_JUGADOR,id_Jugador, Nombre, Apellido, Documento, Edad, Genero, Telefono, Correo)
	VALUES (@id_ActualizacionJugador, @id_Jugador, @Nombre, @Apellido, @Documento, @Edad, @Genero, @Telefono, @Correo)
END;

--Tabla Registro Equipo
CREATE PROCEDURE SP_Registro_Datos_Equipos
@Id_Equipo INT,
@Id_Torneo INT,
@Nombre VARCHAR(50),
@Categoria VARCHAR(50),
@Cantidad_Jugadores INT,
@Patrocinadores VARCHAR(50)
AS
BEGIN
		INSERT INTO REGISTRO_EQUIPOS (id_Equipo,id_Torneo,Nombre,Categoria,Cantidad_Jugadores, Patrocinadores)
		VALUES (@Id_Equipo,@Id_Torneo,@Nombre,@Categoria,@Cantidad_Jugadores, @Patrocinadores)
END;

--Tabla Programacion
CREATE PROCEDURE SP_REGISTRO_DATOS_PROGRAMACION
@Id_Programacion INT,
@Id_Torneo INT,
@Fecha VARCHAR(50),
@Hora VARCHAR(50),
@Ubicacion VARCHAR(50),
@Equipo_Local VARCHAR(50),
@Equipo_Visitante VARCHAR(50)
AS
BEGIN
	INSERT INTO PROGRAMACION (id_Programacion,id_Torneo,Fecha,Hora,Ubicacion,Equipo_local,Equipo_visitante)
	VALUES (@Id_Programacion,@Id_Torneo,@Fecha,@Hora,@Ubicacion,@Equipo_Local,@Equipo_Visitante)
END;

--Tabla Actualizacion Programacion
CREATE PROCEDURE SP_REGISTRAR_DATOS_ACTUALIZACIONPROGRAMACION
@Id_Actualizacion_Programacion INT,
@Id_Programacion INT,
@Nueva_Fecha VARCHAR(50),
@Nueva_Ubicacion VARCHAR(50),
@Mensaje VARCHAR(100)
AS
BEGIN
		INSERT INTO ACTUALIZACION_PROGRAMACION (id_Actualizacion_Programacion,id_Pogramacion,Nueva_Fecha,Nueva_Ubicacion,Mensaje)
		VALUES (@Id_Actualizacion_Programacion,@Id_Programacion,@Nueva_Fecha,@Nueva_Ubicacion,@Mensaje)
END;

--Tabla Resultados
CREATE PROCEDURE SP_REGISTRAR_DATOS_RESULTADOS
@id_Resultado INT,
@Torneo VARCHAR(50),
@Equipo_Local VARCHAR(50),
@Equipo_Visitante VARCHAR(50),
@Marcador VARCHAR(50),
@Gana_Equipo_Loical VARCHAR(50),
@Gana_Equipo_Visitante VARCHAR(50),
@Empate VARCHAR(50),
@Pierde_Equipo_Local VARCHAR(50),
@Pierde_Equipo_Visitante VARCHAR(50),
@Evento_Destacado VARCHAR(100)
AS 
BEGIN
	INSERT INTO RESULTADOS (id_Resultado,Torneo,Equipo_Local, Equipo_Visitante,Marcador,Gana_Equipo_Loical,Gana_Equipo_Visitante, Empate,
	Pierde_Equipo_Local, Pierde_Equipo_Visitante,Evento_Destacado)
	VALUES (@id_Resultado,@Torneo,@Equipo_Local, @Equipo_Visitante,@Marcador,@Gana_Equipo_Loical,@Gana_Equipo_Visitante, @Empate,
	@Pierde_Equipo_Local, @Pierde_Equipo_Visitante,@Evento_Destacado)
END;

--Tabla Posiciones 
CREATE PROCEDURE SP_REGISTRAR_DATOS_POSICIONES
@id_Posicion INT,
@Equipo VARCHAR(50),
@Encuentros VARCHAR(50),
@Victorias VARCHAR(50),
@Derrotas VARCHAR(50),
@Empates VARCHAR(50)
AS 
BEGIN 
	INSERT INTO POSICIONES (id_Posicion,Equipo,Encuentros,Victoritas,Derrotas,Empates)
	VALUES (@id_Posicion,@Equipo,@Encuentros,@Victorias,@Derrotas,@Empates)
END;

--Tabla Historial
CREATE PROCEDURE SP_REGISTRAR_DATOS_HISTORIAL
@id_Historial INT,
@Torneo VARCHAR(50),
@Fecha VARCHAR(50),
@Equipo_Local VARCHAR(50),
@Equipo_Visitante VARCHAR(50),
@Marcador VARCHAR(50),
@Evento_Destacado VARCHAR(100)
AS
BEGIN
	INSERT INTO HISTORIAL(id_Historial, Torneo,Fecha, Equipo_local, Equipo_visitante, Marcador, Evento_Destacado)
	VALUES (@id_Historial,@Torneo,@Fecha,@Equipo_Local,@Equipo_Visitante,@Marcador,@Evento_Destacado)
END;

/*Trigger para la tabla RegistroJugador
ALTER TABLE REGISTRO_EQUIPOS 
MODIFY Cantidad_jugadores INT DEFAULT 0; 
 

CREATE TRIGGER  Sumar_jugadores 
ON REGISTRO_JUGADORES 
AFTER INSERT 
AS BEGIN
UPDATE REGISTRO_EQUIPOS 
SET Cantidad_jugadores = Cantidad_jugadores 
FROM REGISTRO_EQUIPOS 
JOIN INSERTED ON REGISTRO_EQUIPOS.id_Equipo= INSERTED.id_Equipo
END;*/

Select * from TORNEOS
SELECT * FROM REGISTRO_JUGADOR