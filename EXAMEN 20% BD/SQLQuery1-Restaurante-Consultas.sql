 USE RESTAURANTES;

 --¿Cuáles son los restaurantes que ofrecen cocina italiana?
 select nombre from RESTAURANTE where id_Restaurante 
 in(select id_Restaurante from COCINA where nombre = 'comida italiana')

 --¿Cuál es el plato más popular en cada restaurante? 
 SELECT R.nombre AS 'Restaurante', P.nombre AS 'Plato', SUM(cantidadPlatos) AS 'Cantidad Vendida'
FROM PEDIDOS 
JOIN Plato p ON PEDIDOS.id_Plato = p.id_Plato
JOIN Menus m ON P.id_Menu = M.Id_Menu
JOIN RESTAURANTE r ON m.Id_Restaurante = R.id_Restaurante
GROUP BY R.Nombre, P.Nombre
ORDER BY SUM(cantidadPlatos) DESC;

 --¿Cuántos pedidos se han realizado en un restaurante determinado?
select COUNT(*) as TotalPedidos from PEDIDOS where id_Restaurante = 1

 --¿Cuántas reservas se han realizado en una fecha determinada? 
select COUNT(*) as TotalReservas from RESERVAS where fecha = '2024-04-05'

 --Finalmente, crea una consulta que muestre la información de los restaurantes, 
 --sus menús y platos, los pedidos realizados y las reservas realizadas por los clientes.

 --PUNTO 5--
-- Información de los restaurantes, sus menús y platos
SELECT R.id_Restaurante, R.nombre AS 'Restaurante', M.id_Menu, C.nombre AS 'Cocina', P.id_Plato, P.nombre AS 'Plato'
FROM RESTAURANTE R
JOIN MENUS M ON R.id_Restaurante = M.id_Restaurante
JOIN COCINA C ON M.id_Cocina = C.id_Cocina
JOIN PLATO P ON M.id_Menu = P.id_Menu;
GO

-- Información de los pedidos realizados
SELECT Pe.id_Pedidos, Pe.Fecha, Pe.Hora, Pe.tipoPedido, Pe.Estado, Pe.precioTotal,
R.nombre AS 'Restaurante', Cl.nombre AS 'Cliente'
FROM PEDIDOS Pe
JOIN RESTAURANTE R ON Pe.id_Restaurante = R.id_Restaurante
JOIN CLIENTE Cl ON Pe.id_Cliente = Cl.id_Cliente;
GO

-- Información de las reservas realizadas por los clientes
SELECT Re.id_Reserva, Re.Fecha, Re.Hora, Re.numeroPersonas, R.nombre AS 'Restaurante', 
Cl.nombre AS 'Cliente'
FROM RESERVAS Re
JOIN RESTAURANTE R ON Re.id_Restaurante = R.id_Restaurante
JOIN CLIENTE Cl ON Re.id_Cliente = Cl.id_Cliente;
