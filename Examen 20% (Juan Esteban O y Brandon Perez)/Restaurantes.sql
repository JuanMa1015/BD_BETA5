USE Restaurantes

INSERT INTO Restaurante (Id_rest, Nombre_rest, Direccion, Ciudad, Pais, Telefono, Hora_apertura, Hora_cierre, Imagen) Values 
(2,'bella vita', 'Avenida 13', 'medellin', 'Colombia', 456123, '7:00 am', '8:00 pm',null),
(3,'rapiditos', 'calle 12', 'medellin', 'Colombia', 478943, '7:00 am', '8:00 pm',null),
(4,'la comida de la abuela ', 'Calle 13', 'Bogota', 'Colombia', 456123, '8:00 am', '9:00 pm',null),
(5,'Los weros', 'Avenida 24', 'Bogota', 'Colombia', 456123, '8:00 am', '9:00 pm',null),
(6,'El paisita', 'avenida 40 sur ', 'Bogota', 'Colombia', 456123, '8:00 am', '9:00 pm',null)


INSERT INTO Menu (Id_menu, Id_rest, Plato, Descripcion, Precio)  Values
(2, 1, 'pizza', 'circulo de pan con ingredientes al gusto ', 250),
(3, 1, 'Pasta Penne carbonara', 'Pasta con carbonara  ', 250),
(4, 2, 'Carpaccio', 'Carne cruda majada finamente y sasonada ', 300),
(5, 2, 'Lasaña', 'Pata en capas con carne a la boloñesa   ', 300),
(6, 3, 'Ambuerguesa', 'una carne entre dos trozos de pan  ', 200),
(7, 3, 'Perro caliente ', 'salchicha entre dos panes  ', 200),
(8, 4, 'sancocho', 'sopa con carne de res,papa,yuca,platano ', 350),
(9, 4, 'Fijoles', 'sopa de frijoles ', 350),
(10, 5, 'Tacos', ' Tacos al pastor  ', 150),
(11, 5, 'Nachos', 'nachos con queso,carne y salsas',150),
(12, 6,'Arepa paisa','arepa con carne desmechada y frijoles',150)



INSERT INTO Reserva (Id_reserva, Id_rest, Num_personas, Hora_reserva, Fecha_reserva) VALUES
(1, 1, 4, '19:00', '2024-04-03'),
(2, 2, 2, '20:30', '2024-04-04'),
(3, 3, 6, '18:00', '2024-04-05'),
(4, 4, 3, '21:00', '2024-04-06'),
(5, 5, 5, '19:30', '2024-04-07');


INSERT INTO Pedido (Id_pedido, Id_rest, Precio_total, Estado_pedido, Tipo_entrega, Hora, Fecha) VALUES
(1, 1, 45, 1, 'Para llevar', '12:15', '2024-04-03'),
(2, 2, 60, 2, 'A domicilio', '18:30', '2024-04-04'),
(3, 3, 80, 1, 'Para llevar', '20:00', '2024-04-05'),
(4, 4, 30, 3, 'A domicilio', '21:45', '2024-04-06'),
(5, 5, 25, 1, 'Para llevar', '13:00', '2024-04-07');


INSERT INTO Cliente (Id_cliente, Nombre, Direccion, Ciudad, Pais, Telefono, Correo) VALUES
(1, 'Juan Pérez', 'Calle 123', 'Ciudad A', 'Pais A', 123456789, 'juan@example.com'),
(2, 'María Gómez', 'Avenida 456', 'Ciudad B', 'Pais B', 987654321, 'maria@example.com'),
(3, 'Carlos López', 'Carrera 789', 'Ciudad C', 'Pais C', 654321987, 'carlos@example.com'),
(4, 'Ana Martínez', 'Pasaje 456', 'Ciudad D', 'Pais D', 789654321, 'ana@example.com');


INSERT INTO Tipo_Cocina (Id_tipo, Tipo, Descripcion) VALUES
(1, 'Mediterránea', 'Platos inspirados en la cocina mediterránea'),
(2, 'Mexicana', 'Platos típicos de la gastronomía mexicana'),
(3, 'colombiana','Platos emblemáticos de la cocina Colombiana'),
(4, 'Italiana', 'Platos tradicionales italianos'),
(5, 'Japonesa', 'Platos auténticos japoneses'),
(6, 'Rapida', 'Platos de comida rapida y grasosa');

 INSERT INTO Restaurante_tipococina (Id_rest, Id_tipo) VALUES
(1, 4), 
(2, 6),  
(3, 3),  
(4, 2),  
(5, 3); 



