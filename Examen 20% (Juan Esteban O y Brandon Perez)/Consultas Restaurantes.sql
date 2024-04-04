USE Restaurantes
--¿Cuáles son los restaurantes que ofrecen cocina italiana?
SELECT r.Nombre_rest AS Restaurante_Italiano FROM Restaurante r INNER JOIN Restaurante_tipococina rtc ON r.Id_rest = rtc.Id_rest INNER JOIN Tipo_Cocina tc ON rtc.Id_tipo = tc.Id_tipo WHERE tc.Tipo = 'Italiana';

--¿Cuál es el plato más popular en cada restaurante? x
SELECT r.Nombre_rest AS Restaurante, m.Plato AS Plato_Más_Popular, MAX(m.Precio) AS Precio
FROM Restaurante r
INNER JOIN Menu m ON r.Id_rest = m.Id_rest
GROUP BY r.Nombre_rest;

--¿Cuántos pedidos se han realizado en un restaurante determinado?
SELECT COUNT(*) AS Pedidos_Realizados FROM Pedido WHERE Id_rest = 1
;
--¿Cuántas reservas se han realizado en una fecha determinada? 
SELECT COUNT(*) AS Reservas_Realizadas FROM Reserva WHERE Fecha_Reserva = '2024-04-03';


--Finalmente, crea una consulta que muestre la información de los restaurantes, sus menús y platos, los pedidos realizados y las reservas realizadas por los clientes. 
SELECT 
    r.Nombre_rest AS Restaurante,
    m.Plato AS Plato,
    m.Descripcion AS Descripcion_Platos,
    p.Precio_total AS Precio_Pedido,
    pe.Tipo_entrega AS Tipo_Entrega,
    c.Nombre AS Cliente,
    c.Direccion AS Direccion_Cliente,
    c.Ciudad AS Ciudad_Cliente,
    c.Pais AS Pais_Cliente,
    r.Hora_apertura AS Hora_Apertura,
    r.Hora_cierre AS Hora_Cierre,
    re.Num_personas AS Num_Personas_Reserva,
    re.Hora_reserva AS Hora_Reserva,
    re.Fecha_reserva AS Fecha_Reserva
FROM Pedido p
INNER JOIN Restaurante r ON p.Id_rest = r.Id_rest
INNER JOIN Menu m ON p.Id_rest = m.Id_rest
INNER JOIN Reserva re ON p.Id_rest = re.Id_rest
INNER JOIN Cliente c ON p.Id_pedido = c.Id_cliente
INNER JOIN Pedido pe ON p.Id_pedido = pe.Id_pedido;