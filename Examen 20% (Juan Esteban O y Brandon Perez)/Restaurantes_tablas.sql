USE Restaurantes

CREATE TABLE Reserva(
    Id_reserva int PRIMARY KEY,
    Id_rest int,
    Num_personas int,
    Hora_reserva VARCHAR(30),
    Fecha_Reserva Varchar(30),
    FOREIGN KEY (Id_rest) REFERENCES Restaurante(Id_rest)
);

CREATE TABLE Pedido(
    Id_pedido INT PRIMARY KEY,
    Id_rest INT,
    Precio_total INT,
    Estado_pedido INT,
    Tipo_entrega VARCHAR(50),
    Hora VARCHAR(50),
    Fecha VARCHAR(50),
    FOREIGN KEY (Id_rest) REFERENCES Restaurante(Id_rest)
);

CREATE TABLE Cliente (
    Id_cliente INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion VARCHAR(50),
    Ciudad VARCHAR(50),
    Pais VARCHAR(50),
    Telefono INT,
    Correo VARCHAR(50)
	FOREIGN KEY (Id_cliente) REFERENCES Reserva(Id_Reserva),
FOREIGN KEY (Id_cliente) REFERENCES Pedido(Id_pedido)
);

CREATE TABLE Restaurante (
    Id_rest INT Primary KEY,
    Nombre_rest VARCHAR(50),
    Direccion VARCHAR(50),
    Ciudad VARCHAR(50),
    Pais VARCHAR(50),
    Telefono INT,
    Hora_apertura VARCHAR(50),
    Hora_cierre VARCHAR(50),
    Imagen IMAGE
);

CREATE TABLE Tipo_Cocina(
    Id_tipo INT Primary KEY,
    Tipo  VARCHAR(50),
    Descripcion VARCHAR(100)
);

CREATE TABLE Restaurante_tipococina(
    Id_rest INT,
    Id_tipo INT,
    Primary Key (Id_rest,Id_Tipo),
    FOREIGN KEY (Id_rest) REFERENCES Restaurante(Id_rest),
    FOREIGN Key (Id_tipo) REFERENCES Tipo_Cocina(Id_tipo)
);

CREATE TABLE Menu (
    Id_menu INT PRIMARY KEY,
    Id_rest  INT,
    Plato VARCHAR(50),
    Descripcion VARCHAR(50),
    Precio INT,
    FOREIGN KEY (Id_rest)REFERENCES Restaurante(Id_rest)
);