DROP TABLE ENTRADA;
DROP TABLE SALIDA;

CREATE TABLE ENTRADA (
    FECHA DATE PRIMARY KEY,
    DOSIS_APLICADAS NUMBER,
    DOSIS_DISPONIBLES NUMBER
);

CREATE TABLE SALIDA (
    FECHA DATE PRIMARY KEY,
    DOSIS_APLICADAS NUMBER,
    DOSIS_DISPONIBLES NUMBER
);
/
INSERT INTO ENTRADA VALUES (DATE '2020-6-2',100,NULL);
INSERT INTO ENTRADA VALUES (DATE '2020-6-8',500,NULL);
INSERT INTO ENTRADA VALUES (DATE '2020-6-3',200,NULL);
INSERT INTO ENTRADA VALUES (DATE '2020-6-4',300,NULL);
INSERT INTO ENTRADA VALUES (DATE '2020-6-1',2000,NULL);

/
create or replace PROCEDURE PRO_DISPONIBLES
IS
CURSOR VALORES IS SELECT q.fecha , q.dosis_aplicadas , q.dosis_disponibles from ENTRADA q order by q.fecha;
REGISTRO_ENTRADA ENTRADA%rowtype;
AUXILIAR ENTRADA.DOSIS_DISPONIBLES%TYPE;
BEGIN
dbms_output.put_line('PROCEDIMIENTO ACTIVADO');
AUXILIAR:=0;
OPEN VALORES;
FETCH VALORES into REGISTRO_ENTRADA;
while VALORES%FOUND
    LOOP
    IF (AUXILIAR = 0) THEN
         AUXILIAR:= REGISTRO_ENTRADA.DOSIS_APLICADAS;
    ELSE 
        AUXILIAR:= AUXILIAR - REGISTRO_ENTRADA.DOSIS_APLICADAS; 
    END IF; 
    
    --  dbms_output.put_line(AUXILIAR || 'AUX'); 
    --  dbms_output.put_line(REGISTRO_ENTRADA.FECHA); 
    --  dbms_output.put_line(REGISTRO_ENTRADA.DOSIS_APLICADAS);
    --  dbms_output.put_line(REGISTRO_ENTRADA.DOSIS_DISPONIBLES);
     
     INSERT INTO SALIDA VALUES (REGISTRO_ENTRADA.FECHA,REGISTRO_ENTRADA.DOSIS_APLICADAS,AUXILIAR);

    FETCH VALORES into REGISTRO_ENTRADA;
    END LOOP;
CLOSE VALORES;
END;
/

EXECUTE PRO_DISPONIBLES;
/
SELECT * FROM SALIDA;