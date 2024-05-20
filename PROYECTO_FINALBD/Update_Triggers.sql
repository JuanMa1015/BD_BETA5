use PRUEBAFINAL
--DISPARADORES PARA TABLA POSICIONES

--cada que se registre un resultado a los dos 
--equipos se les sumara un encuentro
GO
	CREATE TRIGGER Actualizar_Posiciones
	ON RESULTADOS
	AFTER INSERT
	AS
	IF (SELECT COUNT (*) FROM RESULTADOS)>0
	BEGIN 
	UPDATE POSICIONES
	SET
		Encuentros = Encuentros + 1
	WHERE Equipo IN (SELECT Equipo_local FROM RESULTADOS ) 
	OR Equipo IN (SELECT Equipo_visitante FROM RESULTADOS) 
END;	

--Cada que se ponga 'Si' en empate se le sumara 1 empate
--a cada equipo
CREATE TRIGGER Actualizacion_Empates
ON RESULTADOS
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM INSERTED WHERE Empate = 'Si')
    BEGIN
        -- Actualizar empates para los equipos locales
        UPDATE POSICIONES
        SET Empates = Empates + 1
        WHERE Equipo IN (SELECT Equipo_local FROM INSERTED WHERE Empate = 'Si');
        
        -- Actualizar empates para los equipos visitantes
        UPDATE POSICIONES
        SET Empates = Empates + 1
        WHERE Equipo IN (SELECT Equipo_visitante FROM INSERTED WHERE Empate = 'Si');
    END
END;

--
--cada que se ponga el nombre del equipo que gano se le sumara 
--una victoria
GO
	CREATE TRIGGER Actualiza_Victorias
	ON RESULTADOS
	AFTER INSERT
	AS
	IF (SELECT COUNT (*) FROM RESULTADOS)>0
	BEGIN
	UPDATE POSICIONES
	SET
		Victorias = Victorias + 1
	WHERE Equipo IN (SELECT Ganador FROM RESULTADOS WHERE Ganador = Equipo_Local)
	OR Equipo IN (SELECT Ganador FROM RESULTADOS WHERE Ganador = Equipo_Visitante)
END;

--Cada que se ponga el nombre del equipo que perdio se le sumara
--una derrota
GO
	CREATE TRIGGER Actualizacion_Derrotas
	ON RESULTADOS
	AFTER INSERT
	AS
	IF (SELECT COUNT (*) FROM RESULTADOS)>0
	BEGIN 
	UPDATE POSICIONES
	SET
		Derrotas = Derrotas + 1
	WHERE Equipo IN (SELECT Perdedor FROM RESULTADOS WHERE Perdedor = Equipo_local)
	OR Equipo IN (SELECT Perdedor FROM RESULTADOS WHERE Perdedor = Equipo_Visitante);
END;







