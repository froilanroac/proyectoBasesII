CREATE OR REPLACE TYPE TDA AS OBJECT(
fecha_desde date,
fecha_hasta date,
precio_dia number,
precio_pa number,
STATIC FUNCTION funcion (precio number,d1 DATE,d2 DATE) RETURN
NUMBER
);
/
CREATE OR REPLACE TYPE BODY TDA AS
STATIC FUNCTION funcion (precio number,d1 DATE,d2 DATE) RETURN NUMBER
IS
BEGIN
IF (d2>d1) THEN
return (d2-d1) * precio;
ELSE
RAISE_APPLICATION_ERROR(-20001,'¡La primera fecha debe ser menor
que la segunda fecha!');
END IF;
END;
END;
/
CREATE TABLE HISTORICO_PAQUETE(
identificador NUMBER PRIMARY KEY,
cuerpo TDA
);
insert into HISTORICO_PAQUETE VALUES (10,TDA(DATE '2021-12-1', DATE
'2021-12-5',3,TDA.funcion(3 ,DATE '2021-12-1', DATE '2021-12-5')));
insert into HISTORICO_PAQUETE VALUES (11,TDA(DATE '2025-10-11', DATE
'2021-10-1',4,TDA.funcion(3 ,DATE '2021-10-11', DATE '2021-10-1')));
select p.cuerpo.precio_pa from HISTORICO_PAQUETE P;