create or replace TRIGGER CREACION_TABLA
after CREATE ON SCHEMA 
BEGIN 
dbms_output.put_line('-----USUARIO-----');
dbms_output.put_line(USER);
dbms_output.put_line('-----OBJ TYPE-----');
dbms_output.put_line(ORA_DICT_OBJ_TYPE);
dbms_output.put_line('-----OBJ NAME-----');
dbms_output.put_line(ORA_DICT_OBJ_NAME);
dbms_output.put_line('-----OBJ OWNER-----');
dbms_output.put_line(ORA_DICT_OBJ_OWNER);
dbms_output.put_line('-----SYSDATE-----');
dbms_output.put_line(SYSDATE);
END CREACION_TABLA;
/

DROP TABLE HOLA;
SET SERVEROUTPUT ON;
CREATE TABLE HOLA (ID NUMBER PRIMARY KEY);