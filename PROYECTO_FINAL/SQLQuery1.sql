create database BD_agencia_de_pollos_Los_valles;
go
use BD_agencia_de_pollos_Los_valles;
go

create table camiones
(
    placa_camion varchar(50)primary key not null,
    tipo_camion varchar(50)not null, --pesado,medio,pequeño
    marca varchar(50)not null
);

create table mantenimiento_camiones
(
    id_mantenimiento integer identity primary key not null,
    precio_diecel_mes integer not null,
    tipo_mantenimiento varchar(100) not null,
    costo_mantenimiento integer not null,
    placa_camion varchar(50) not null,
    foreign key (placa_camion)references camiones(placa_camion)
);

create table empleados
(
    ci_empleado varchar(50) primary key not null,
    salario varchar (10) not null,
    nombre varchar (50)not null,
    apellido varchar(50)not null,
    area varchar(50)not null,
    telefono varchar(50)not null,
    fecha_contrato varchar(50) not null,
    fecha_nacimiento varchar(50) not null
);

create table conductores
(
    id_conductor integer identity primary key not null,
    ci_empleado varchar(50) not null,
    placa_camion varchar(50)not null,
    foreign key (ci_empleado) references empleados (ci_empleado),
    foreign key (placa_camion) references camiones (placa_camion)
);

create table oficinas
(
    id_oficina integer identity primary key not null,
    ci_empleado varchar(50)  not null,
    foreign key (ci_empleado) references empleados (ci_empleado),
);

create table puesto_ventas
(
    id_puesto_ventas integer identity primary key not null,
    direccion_puesto varchar(100)not null,
    ci_empleado varchar(50) not null,
    placa_camion varchar(50)not null,
    foreign key (ci_empleado) references empleados (ci_empleado),
    foreign key (placa_camion) references camiones (placa_camion)
);

create table pollos
(
    id_carga_pollos varchar(50) primary key not null,
    costo integer not null, --medianos, pequeños, grandes
    placa_camion varchar(50)not null,
    foreign key (placa_camion) references camiones (placa_camion)
);
go


insert into camiones (placa_camion, tipo_camion, marca) values
('QWERTY1201','PESADO','Scania'),
('QWERTY1202','PESADO','Volvo'),
('QWERTY1203','PESADO','Volvo'),
('QWERTY1204','MEDIO','Iveco'),
('QWERTY1205','MEDIO','Iveco'),
('QWERTY1206','MEDIO','Isuzu'),
('QWERTY1207','MEDIO','Iveco'),
('QWERTY1208','LIGERO','Isuzu'),
('QWERTY1209','LIGERO','Scania'),
('QWERTY1210','LIGERO','Iveco');

go

insert into mantenimiento_camiones(precio_diecel_mes, tipo_mantenimiento, costo_mantenimiento, placa_camion)values
(3000,'Frenos','1500','QWERTY1201'),
(2500,'Puertas','2500','QWERTY1202'),
(2700,'Normal','0','QWERTY1203'),
(2100,'Frenos','1600','QWERTY1204'),
(2120,'Normal','0','QWERTY1205'),
(2300,'Normal','0','QWERTY1206'),
(2000,'Frenos','1000','QWERTY1207'),
(1800,'Chaperia','2000','QWERTY1208'),
(1900,'Normal','0','QWERTY1209'),
(1500,'Normal','0','QWERTY1210');

go

insert into empleados(ci_empleado, salario, nombre, apellido, area, telefono, fecha_contrato, fecha_nacimiento) values
('98765001LP',8500,'Marcos','Fernandez','Administracion','+591 78910001',	'2010-10-10','1985'),
('98765002LP',8500,'Maria','Cordoba','Administracion','+591 78910002',	'2010-10-10','1985'),
('98765003LP',5000,'Pedro','Cornel','Ventas','+591 78910003',	'2014-10-10','1995'),
('98765004LP',5000,'Ramiro','Astral','Ventas','+591 78910004',	'2013-10-10','1982'),
('98765005LP',5000,'Fernando','Quispe ','Ventas','+591 78910005',	'2013-10-10','1987'),
('98765006LP',5000,'Carlos','Acho','Ventas','+591 78910006',	'2018-10-10','1985'),
('98765007LP',7000,'Manuel','Obrero','Contabilidad','+591 78910007',	'2018-10-10','1988'),
('98765008LP',6000,'Jorge','Fernandez ','Registros','+591 78910008',	'2020-3-10','1992'),
('98765009LP',6000,'Cosmo','Quispe','Registros','+591 78910009',	'2010-6-10','1990'),
('98765010LP',5000,'Tereza','Morales','Recepcion','+591 78910010',	'2010-7-10','1987'),
('98765011LP',6500,'Javier','Apaza','Conductor','+591 78910011',	'2015-11-10','1987'),
('98765012LP',6500,'Wanda','Quispe','Conductor','+591 78910012',	'2015-10-10','1987'),
('98765013LP',6500,'Maria','Cazas','Conductor','+591 78910013',	'2015-10-10','1989'),
('98765014LP',5500,'Pedro','Calle','Conductor','+591 78910014',	'2015-10-10','1989'),
('98765015LP',5500,'Marisol','Quispe','Conductor','+591 78910015',	'2015-1-10','1989'),
('98765016LP',5500,'Mario','Calle','Conductor','+591 78910016',	'2016-8-10','1989'),
('98765017LP',5000,'Agel','Perez','Conductor','+591 78910017',	'2016-7-10','1990'),
('98765018LP',5000,'Angela','Luz','Conductor','+591 78910018',	'2016-5-10','1985'),
('98765019LP',5000,'Jose','Choque','Conductor','+591 78910019',	'2016-2-10','1992'),
('98765020LP',5000,'Jesus','Quispe','Conductor','+591 78910020',	'2016-2-10','1995');

go

insert into conductores(ci_empleado, placa_camion) values
('98765011LP','QWERTY1201'),
('98765012LP','QWERTY1202'),
('98765013LP','QWERTY1203'),
('98765014LP','QWERTY1204'),
('98765015LP','QWERTY1205'),
('98765016LP','QWERTY1206'),
('98765017LP','QWERTY1207'),
('98765018LP','QWERTY1208'),
('98765019LP','QWERTY1209'),
('98765020LP','QWERTY1210');

go

insert into oficinas(ci_empleado)values
('98765001LP'),
('98765002LP'),
('98765003LP'),
('98765007LP'),
('98765008LP'),
('98765009LP'),
('98765010LP');

go

insert into puesto_ventas(direccion_puesto, ci_empleado, placa_camion) values
('Av. Ballivian #530','98765004LP','QWERTY1208'),
('Av. 16 de julio #2','98765005LP','QWERTY1209'),
('Av. La Paz #700','98765006LP','QWERTY1210');

go

insert into pollos(id_carga_pollos, costo, placa_camion) values
('A500A1',30000,'QWERTY1201'),
('B500A2',25000,'QWERTY1202'),
('B500A3',27000,'QWERTY1203');

go


--primer view
create view se_pago as
select  emp.ci_empleado,emp.nombre,emp.apellido,emp.area,emp.salario,pago=
case
    when emp.salario <=6000 then 'PAGADO'
    when emp.salario >6000 then 'FALTA PAGAR'
    else 'indefinido'
end
from empleados as emp
--llamamos view
go
select * from se_pago;
go

--segundo view
create view se_hizo as
select mc.id_mantenimiento,mc.tipo_mantenimiento,mc.placa_camion,se_requirio=
case
    when mc.tipo_mantenimiento != 'Normal' then 'Se requirio'
    else 'No se requirio'
end
from mantenimiento_camiones as mc
--llamamos view
go
select * from se_hizo;
go


--tercer view
create view entrega as
select ca.tipo_camion,emp.area,entrega=
    case
        when ca.marca = 'Volvo' then 'Entrego'
        when ca.marca = 'Scania' then 'En reparacion'
        when ca.marca = 'Iveco' then 'En proceso'
        when ca.marca = 'Isuzu' then 'Fuera de servicio'
        else 'No se encuentra'
    end
from puesto_ventas as pv
inner join empleados as emp on pv.ci_empleado = emp.ci_empleado
inner join camiones as ca on pv.placa_camion = ca.placa_camion
go

select * from entrega
go



--funciones
--primera funcion
create or alter function mantenimientos_realizados()
returns integer
begin
    declare @resultado integer;
    set @resultado=(
        select count(mc.tipo_mantenimiento)
        from mantenimiento_camiones as mc
        where mc.tipo_mantenimiento != 'Normal'
        )
    return @resultado
end
go

print dbo.mantenimientos_realizados();
go

--segunda funcion
create or alter function gasto_compra()
returns integer
begin
    declare @respuesta integer;
    set @respuesta=(
        select sum(po.costo)
        from pollos as po
        )
    return @respuesta;
end
go

print dbo.gasto_compra();
go