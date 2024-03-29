DROP TABLE LOG_CREACIONES;
DROP TABLE HOLA;
CREATE TABLE LOG_CREACIONES (
    USUARIO VARCHAR(30),
    FECHA_CREACION VARCHAR(30),
    NOMBRE_TABLA VARCHAR(30)
);
/
create or replace TRIGGER CREACION_TABLA
after CREATE ON SCHEMA 
BEGIN 
    IF (ORA_DICT_OBJ_TYPE = 'TABLE') THEN
    INSERT INTO LOG_CREACIONES VALUES (USER,SYSDATE,ORA_DICT_OBJ_NAME);
    END IF;
END CREACION_TABLA;
/
SELECT * FROM LOG_CREACIONES;
SET SERVEROUTPUT ON;
CREATE TABLE HOLA (ID NUMBER PRIMARY KEY);
/
SELECT * FROM LOG_CREACIONES;