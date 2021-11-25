CREATE TABLE CLIENTES (
pasaporte number PRIMARY KEY,
nombre varchar2 (15) NOT NULL,
apellido varchar2(15) NOT NULL,
email varchar2 (20)NOT NULL,
suspension_paq number NOT NULL,
telefono varchar2 (12));

CREATE TABLE PCRS (
pasaporte_cliente number NOT NULL,
id_pcr number NOT NULL,
estado number NOT NULL,
fecha_prueba date,
CONSTRAINT pk_pcr PRIMARY KEY (pasaporte_cliente,id_pcr),
CONSTRAINT fk_cliente FOREIGN KEY (pasaporte_cliente) references clientes (pasaporte) 
);

create or replace TRIGGER TRI_SUSPENDER
AFTER INSERT ON PCRS
DECLARE 
CURSOR VALORES is SELECT * FROM PCRS;
REGISTRO_TABLA PCRS%rowtype;
CLIENTE clientes.pasaporte%TYPE;
BEGIN
dbms_output.put_line('TRIGGER SUSPENDER PAQUETES ACTIVADO');

OPEN VALORES;
FETCH VALORES into REGISTRO_TABLA;
while VALORES%FOUND
    LOOP

        SELECT C.PASAPORTE INTO CLIENTE FROM CLIENTES C WHERE C.PASAPORTE = REGISTRO_TABLA.PASAPORTE_CLIENTE;

        IF (((SYSDATE - REGISTRO_TABLA.FECHA_PRUEBA) < 3) AND (REGISTRO_TABLA.ESTADO = 0) ) THEN
        UPDATE clientes 
        SET SUSPENSION_PAQ = 0 
        WHERE PASAPORTE = REGISTRO_TABLA.PASAPORTE_CLIENTE;
        ELSE
        UPDATE clientes 
        SET SUSPENSION_PAQ = 1
        WHERE PASAPORTE = REGISTRO_TABLA.PASAPORTE_CLIENTE;
        END IF; 

    FETCH VALORES into REGISTRO_TABLA;
    END LOOP;
CLOSE VALORES;
END;

INSERT into clientes (pasaporte,nombre,apellido,email,suspension_paq,telefono) values (1,'juan','yanez','jy@gmail.com',0,'04245286395');
INSERT into clientes (pasaporte,nombre,apellido,email,suspension_paq,telefono) values (2,'luis','pepe','lp@gmail.com',0,'04146589584');
INSERT into clientes (pasaporte,nombre,apellido,email,suspension_paq,telefono) values (3,'carl','pico','cp@gmail.com',0,'04163021254');


SELECT * FROM CLIENTES;
UPDATE CLIENTES SET SUSPENSION_PAQ = 0; 
delete from pcrs; 
SET SERVEROUTPUT ON;

INSERT into PCRS (pasaporte_cliente,id_pcr,estado,fecha_prueba) values (1,1,0,'20-11-2021');
INSERT into PCRS (pasaporte_cliente,id_pcr,estado,fecha_prueba) values (1,2,1,'24-11-2021');
INSERT into PCRS (pasaporte_cliente,id_pcr,estado,fecha_prueba) values (2,3,0,'19-11-2021');
INSERT into PCRS (pasaporte_cliente,id_pcr,estado,fecha_prueba) values (3,4,0,'24-11-2021');

SELECT * FROM CLIENTES