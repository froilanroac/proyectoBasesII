alter session set "_ORACLE_SCRIPT"=true; 
/
drop table tabla_prueba;
drop user usuario_prueba;
drop role rol_prueba;
drop view vista_prueba;
-- prueba de los permisos generales
CREATE TABLE TABLA_PRUEBA (
    ID NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(50)
);
/
CREATE ROLE ROL_PRUEBA;
/
create user usuario_prueba identified by clave;

/
create or replace procedure procedimiento_prueba
is 
begin 
    DBMS_OUTPUT.PUT_LINE('Procedimiento de prueba');
end;
/
CREATE OR REPLACE TRIGGER trigger_prueba
after INSERT ON paises
DECLARE
begin 
dbms_output.put_line('PRUEBA'); 
end;
/
CREATE VIEW vista_prueba AS 
SELECT p.id FROM paises p;
/
CREATE SEQUENCE supplier_seq
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
/
drop SEQUENCE supplier_seq;
/
-- prueba en las tablas
-- paquetes
INSERT INTO PAQUETES VALUES (1000,null,0);
select * from paquetes;
update paquetes set id = 1001 where id = 1000;
delete from paquetes where id = 1001; 
-- his_paquetes
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',null,1000,12,1);
SELECT * FROM HIS_PAQUETES;
UPDATE HIS_PAQUETES SET FECHA_CREACION = DATE'2023-1-10' WHERE FK_SERVICIO = 12 AND FK_PAQUETE = 1;
DELETE FROM HIS_PAQUETES WHERE FECHA_CREACION = DATE '2023-1-10' AND FK_SERVICIO = 12 AND FK_PAQUETE = 1;
--servicios 
INSERT INTO SERVICIOS VALUES (1000,'Servicio de prueba');
select * from servicios;
update servicios set categoria = 'Servicio de alojamiento en playa punta brava' where id = 15;
delete from servicios where id = 15;
--det_facturas
INSERT INTO DET_FACTURAS VALUES (1000,1,1,1,1,1);
select * from det_facturas;
update det_facturas set cantidad = 3 where id_renglon = 1;
delete from det_facturas where id_renglon = 1001;
--facturas
INSERT INTO FACTURAS VALUES (1000,DATE '2021-1-1',10,'OTRO','AGENCIA FISICA',1,1);
select * from facturas;
update facturas set canal = 'AGENCIA FISICA' where numero_factura = 15;
delete from facturas where numero_factura = 15;
--clientes
INSERT INTO CLIENTES VALUES (1000,'prueba','prueba','froilan@gmail.com',null,1);
select * from clientes;
update clientes set nombre = 'Prueba' where pasaporte = 15;
delete from clientes where pasaporte = 1000;
--paises
INSERT INTO PAISES VALUES (1000,'prueba',empty_blob(),'AM');
SELECT * FROM PAISES;
UPDATE PAISES SET nombre = 'japan' WHERE ID = 7;
DELETE FROM PAISES WHERE ID = 1001;
--CRUCEROS
INSERT INTO CRUCEROS VALUES (1000,null,empty_blob(),1);
select * from cruceros;
update cruceros set fk_servicio = 15 where id = 15;
delete from cruceros where id = 1001;
--observacion
INSERT INTO OBSERVACION VALUES (1000,DATE '2021-2-1',':)',16,1,1);
select * from observacion;
update observacion set escala = ':)' where id = 1;
delete from observacion where id = 17;
--comentarios
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (1000,'Servicio muy mal organizado',1,16,1,1);
select * from comentarios_observaciones;
update comentarios_observaciones set comentario = 'Todo muy mal' where id = 17;
delete from comentarios_observaciones where id = 17;