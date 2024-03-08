USE Franklin_university;
--1.
Select count(Fname) As Total_Empleados from EMPLEADOS;
--2
Select Fname from EMPLEADOS where Salary = (select MAX(Salary) from EMPLEADOS)
--3
Select COUNT(Dname) As Cantidad_Departamentos from DEPARTMENT
--4
Select Pname from PROJECT where Plocation like '%Ho%' 
--5
select Relationship,Dependent_name,Essn from DEPENDENTT where Essn = 333445555
--6
select Dlocation from DEPTA_LOCATIONS where Dnumber = 5
--7
Select avg(Salary) As Promedio_Salario_Empleados from EMPLEADOS
--8
Select DEPARTMENT.Dname, COUNT(*) As Total_Proyectos from DEPARTMENT
Join PROJECT  ON DEPARTMENT.Dnumber = PROJECT.Dnum
GROUP BY DEPARTMENT.Dname
--9
Select PROJECT.Pnumber, Sum(Hourss) As Horas_Totales from PROJECT
Join WORKS_ON on PROJECT.Pnumber = WORKS_ON.Pno
group by PROJECT.Pnumber
--10
Select DEPARTMENT.Dnumber, sum(Salary) As Salario_Total from DEPARTMENT
Join EMPLEADOS on DEPARTMENT.Dnumber = EMPLEADOS.Dno
Group by DEPARTMENT.Dnumber
--11
Select DEPARTMENT.Dname, max(EMPLEADOS.Salary) As SalarioMaximo, min(EMPLEADOS.Salary) As SalarioMinimo from DEPARTMENT 
Join EMPLEADOS  on DEPARTMENT.Dnumber = EMPLEADOS.Dno 
Group by DEPARTMENT.Dname;
--12
Select DEPENDENTT.Sex, STRING_AGG(Relationship, ', ')As Relacion_Empleado, COUNT(Dependent_name) As Total_Dependientes from DEPENDENTT
Join EMPLEADOS on DEPENDENTT.Sex = EMPLEADOS.Sex
Group by DEPENDENTT.Sex


