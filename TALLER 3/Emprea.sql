CREATE DATABASE Empresa3;
/*USE Empresa2;

CREATE TABLE EMPLEADO (
id_Empleado int not null PRIMARY KEY,
nombre varchar(50) not null,
telefono varchar(12),
genero varchar(20),
);

/*CREATE TABLE HABILIDADEMPLEADO (
id_HabilidadEmpleado int not null,
id_Empleado int not null,
id_Habilidad int not null,
FOREIGN KEY (id_Empleado) REFERENCES EMPLEADO(id_Empleado)
);*/

/*CREATE TABLE HABILIDAD (
id_Habilidad int not null PRIMARY KEY,
id_Empleado int not null, 
nombre_Habilidad varchar(50) not null,
FOREIGN KEY(id_Empleado) REFERENCES EMPLEADO(id_Empleado)
);*/



/*CREATE TABLE DEPARTAMENTO (
id_Departamento int not null PRIMARY KEY,
dependencia varchar(50) not null,
numero_Empleados int not null,
id_Empleado int not null,
FOREIGN KEY (id_Empleado) REFERENCES EMPLEADO(id_Empleado)
);*/

/*CREATE TABLE DEPARTAMENTOEMPLEADO (
id_DepartamentoEmpleado  int not null,
id_Departamento int not null,
id_Empleado int not null, 
FOREIGN KEY (id_Empleado) REFERENCES EMPLEADO(id_Empleado)
);*/

/*CREATE TABLE PROYECTO (
id_Proyecto int not null PRIMARY KEY,
id_Departamento int not null,
inversion varchar(50) not null,
nombre_Proyecto varchar(50) not null,
FOREIGN KEY (id_Departamento) REFERENCES DEPARTAMENTO(id_Departamento)
);*/

CREATE TABLE PROYECTODEPARTAMENTO (
id_ProyectoEmpleado int not null,
id_Proyecto int not null,
id_Empleado int not null,
id_Departamento int not null,
FOREIGN KEY (id_Departamento) REFERENCES DEPARTAMENTO(id_Departamento)
);
