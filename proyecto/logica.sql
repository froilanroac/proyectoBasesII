-- funcion para imprimir los BLOB
CREATE OR REPLACE PROCEDURE CLOB_PRINT (IDENTIFICADOR NUMBER)
IS
 myStoryBuf VARCHAR2(4001);
BEGIN
    SELECT D.DESCRIPCION INTO myStoryBuf FROM DESTINOS D WHERE D.ID = IDENTIFICADOR;
    DBMS_OUTPUT.PUT_LINE(myStoryBuf);
END;
/
--modulo de mantenimiento 
CREATE OR REPLACE PROCEDURE MODULO_DE_MANTENIMIENTO(FECHA DATE, PAQUETE NUMBER)
IS
CURSOR MANTENIMIENTOS IS SELECT * FROM MANTENIMIENTOS;
REGISTROS_TABLA MANTENIMIENTOS%ROWTYPE;
ID_CRUCERO NUMBER;
FECHA_PROX DATE;
FECHA_TOPE DATE;
CURSOR CRUCEROS_MANTENIMIENTO IS SELECT MAX(H.FECHA_MANTENIMIENTO) "FECHA" ,h.fk_crucero "ID" from his_mantenimientos h  GROUP BY h.fk_crucero;
REGISTROS_CRUCEROS CRUCEROS_MANTENIMIENTO%ROWTYPE;
BEGIN

    DBMS_OUTPUT.PUT_LINE('MODULO DE MANTENIMIENTO');
    FECHA_TOPE:= FECHA - 30;

    IF (PAQUETE IS NOT NULL) THEN
       select distinct(c.id) INTO ID_CRUCERO from cruceros c, his_paquetes h where c.fk_servicio = h.fk_servicio and h.fk_paquete = PAQUETE;
    
    OPEN MANTENIMIENTOS;
    FETCH MANTENIMIENTOS into REGISTROS_TABLA;
    while MANTENIMIENTOS%FOUND
        LOOP
        FECHA_PROX:= FECHA + 30;
        INSERT INTO HIS_MANTENIMIENTOS VALUES (FECHA,FECHA_PROX,ID_CRUCERO,REGISTROS_TABLA.NUMERO);
        FETCH MANTENIMIENTOS into REGISTROS_TABLA;
        END LOOP;
    CLOSE MANTENIMIENTOS;
    
    
    
    ELSE
    
    OPEN CRUCEROS_MANTENIMIENTO;
    FETCH CRUCEROS_MANTENIMIENTO into REGISTROS_CRUCEROS;
    while CRUCEROS_MANTENIMIENTO%FOUND
        LOOP

        IF (REGISTROS_CRUCEROS.FECHA <= FECHA_TOPE) THEN
            OPEN MANTENIMIENTOS;
            FETCH MANTENIMIENTOS into REGISTROS_TABLA;
            while MANTENIMIENTOS%FOUND
                LOOP
                FECHA_PROX:= FECHA + 30;
                INSERT INTO HIS_MANTENIMIENTOS VALUES (FECHA,FECHA_PROX,REGISTROS_CRUCEROS.ID,REGISTROS_TABLA.NUMERO);
                FETCH MANTENIMIENTOS into REGISTROS_TABLA;
                END LOOP;
            CLOSE MANTENIMIENTOS;
        END IF;

        FETCH CRUCEROS_MANTENIMIENTO into REGISTROS_CRUCEROS;
        END LOOP;
        CLOSE CRUCEROS_MANTENIMIENTO;

    END IF;

    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No hay cruceros para el paquete seleccionado');
    WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('No se puede hacer el servicio de mantenimiento al crucero dos veces al dia');
END;

/
--modulo de generacion de PAQUETES
CREATE OR REPLACE PROCEDURE MODULO_DE_GENERACION(FECHA DATE)
IS

ID_DESTINO NUMBER;
ID_SERVICIO NUMBER;
NOMBRE_SERVICIO VARCHAR(100);
NOMBRE_DESTINO VARCHAR(100);
NUEVO_PRECIO_DIA NUMBER(20,2);
NUEVO_PRECIO_TO NUMBER(20,2);
MAX_PAQUETE NUMBER;
FECHA_FIN DATE;
CANTIDAD_SERVICIOS NUMBER;

CURSOR SERVICIOS_DESTINO IS SELECT s.id, s.CATEGORIA, h.fechas.PRECIO_DIA "PRECIO_DIA" ,h.fechas.PRECIO_TO "PRECIO_TO" FROM servicios s, HIS_SERVICIOS h WHERE h.FK_DESTINO = ID_DESTINO AND s.id= h.fk_servicio AND UPPER(S.CATEGORIA) NOT LIKE '%ALOJAMIENTO%' AND UPPER(S.CATEGORIA) NOT LIKE '%CRUCERO%' ORDER BY DBMS_RANDOM.RANDOM FETCH FIRST CANTIDAD_SERVICIOS ROWS ONLY;
REGISTROS_tabla SERVICIOS_DESTINO%rowtype;

BEGIN

    Select trunc(dbms_random.value(2,5)) num into CANTIDAD_SERVICIOS From dual;
    
    --seleccion del destino con servicios
    SELECT d.ID, D.DATOS.NOMBRE into ID_DESTINO,NOMBRE_DESTINO FROM destinos d, his_servicios h where d.id = h.fk_destino ORDER BY DBMS_RANDOM.RANDOM fetch first 1 rows only;
    --creacion del paquete
    SELECT MAX(ID) INTO MAX_PAQUETE FROM PAQUETES;
    FECHA_FIN := FECHA + 10;
    MAX_PAQUETE:= MAX_PAQUETE + 1;
    INSERT INTO PAQUETES VALUES (MAX_PAQUETE,DATOS_TDA('*E-R ' || NOMBRE_DESTINO, 'Un paquete hacia ' || NOMBRE_DESTINO),0); 
    
    --estas dos cosas se pueden hacer con un cursor
    --seleccion del servicio de crucero del destino
    SELECT S.ID, S.CATEGORIA, H.FECHAS.PRECIO_DIA, H.FECHAS.PRECIO_TO INTO ID_SERVICIO, NOMBRE_SERVICIO,NUEVO_PRECIO_DIA,NUEVO_PRECIO_TO FROM SERVICIOS S,HIS_SERVICIOS H WHERE S.ID = H.FK_SERVICIO AND H.FK_DESTINO = ID_DESTINO AND S.CATEGORIA LIKE '%' || NOMBRE_DESTINO || '%'  fetch first 1 rows only;
    INSERT INTO HIS_PAQUETES VALUES (FECHA,FECHAS_TDA(FECHA,FECHA_FIN,NUEVO_PRECIO_DIA,NUEVO_PRECIO_TO),100,ID_SERVICIO,MAX_PAQUETE);
    DBMS_OUTPUT.PUT_LINE('Destino ' || NOMBRE_DESTINO || ' SERVICIO ' || NOMBRE_SERVICIO || ' PRECIO DIA ' || NUEVO_PRECIO_DIA ||  ' PRECIO TOTAL ' || NUEVO_PRECIO_TO);
    
    --seleccion del servicio de hospedaje en el destino
    SELECT S.ID, S.CATEGORIA, H.FECHAS.PRECIO_DIA, H.FECHAS.PRECIO_TO INTO ID_SERVICIO, NOMBRE_SERVICIO,NUEVO_PRECIO_DIA,NUEVO_PRECIO_TO FROM SERVICIOS S,HIS_SERVICIOS H WHERE S.ID = H.FK_SERVICIO AND H.FK_DESTINO = ID_DESTINO AND upper(S.CATEGORIA) LIKE '%ALOJAMIENTO%'  fetch first 1 rows only;
    INSERT INTO HIS_PAQUETES VALUES (FECHA,FECHAS_TDA(FECHA,FECHA_FIN,NUEVO_PRECIO_DIA,NUEVO_PRECIO_TO),100,ID_SERVICIO,MAX_PAQUETE);

    DBMS_OUTPUT.PUT_LINE('Destino ' || NOMBRE_DESTINO || ' SERVICIO ' || NOMBRE_SERVICIO || ' PRECIO DIA ' || NUEVO_PRECIO_DIA ||  ' PRECIO TOTAL ' || NUEVO_PRECIO_TO);

    -- insercion de servicios del destino seleccionado
    OPEN SERVICIOS_DESTINO;
    FETCH SERVICIOS_DESTINO into REGISTROS_TABLA;
    while SERVICIOS_DESTINO%FOUND
        LOOP
        DBMS_OUTPUT.PUT_LINE('SERVICIO NUMERO :' || REGISTROS_TABLA.ID);
        DBMS_OUTPUT.PUT_LINE('SERVICIO CATEGORIA :' || REGISTROS_TABLA.CATEGORIA);
        NUEVO_PRECIO_DIA := REGISTROS_TABLA.PRECIO_DIA * 2;
        NUEVO_PRECIO_TO := REGISTROS_TABLA.PRECIO_TO * 2;
        INSERT INTO HIS_PAQUETES VALUES (FECHA,FECHAS_TDA(FECHA,FECHA_FIN,NUEVO_PRECIO_DIA,NUEVO_PRECIO_TO),100,REGISTROS_TABLA.ID,MAX_PAQUETE);
        FETCH SERVICIOS_DESTINO into REGISTROS_TABLA;
        END LOOP;
    CLOSE SERVICIOS_DESTINO;

    
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('MODULO DEGENERACION: Error en ' || NOMBRE_DESTINO  || ', verificar que todos los destinos que tengan servicios para ofrecer tengan servicio de alojamiento y de crucero, no se pudo generar un nuevo paquete');

END;

/
--modulo de alianzas
CREATE OR REPLACE PROCEDURE MODULO_DE_ALIANZAS(FECHA DATE)
IS
ID_PAQUETE NUMBER;
FECHA_FIN DATE;
FECHA_INICIO DATE;
PROVEEDOR NUMBER;

BEGIN

    SELECT h.fk_paquete,H.FK_PROVEEDOR into ID_PAQUETE,PROVEEDOR from his_alianzas h, his_paquetes p, paquetes a where h.fk_paquete = p.fk_paquete and a.id = p.fk_paquete and p.disponibilidad = 0 and a.sobresaturado = 0 ORDER BY DBMS_RANDOM.RANDOM fetch first 1 rows only; 
    SELECT F.FECHAS.FECHA_DESDE INTO FECHA_INICIO FROM HIS_PAQUETES F WHERE F.FK_PAQUETE = ID_PAQUETE fetch first 1 row only;
    FECHA_INICIO:= FECHA_INICIO + 31;
    FECHA_FIN := FECHA_INICIO  + 41;
    UPDATE HIS_PAQUETES H SET H.FECHAS.FECHA_DESDE = FECHA_INICIO WHERE H.FK_PAQUETE = ID_PAQUETE;
    UPDATE HIS_PAQUETES H SET H.FECHAS.FECHA_HASTA = FECHA_FIN WHERE H.FK_PAQUETE = ID_PAQUETE;
    UPDATE HIS_PAQUETES H SET DISPONIBILIDAD = 300 WHERE H.FK_PAQUETE = ID_PAQUETE;

    UPDATE PAQUETES SET sobresaturado = 1 WHERE id = ID_PAQUETE;

    UPDATE HIS_ALIANZAS SET FIN_ALIANZA = FECHA WHERE FK_PAQUETE = ID_PAQUETE;

    INSERT INTO HIS_ALIANZAS VALUES (FECHA,NULL,PROVEEDOR,ID_PAQUETE);

    DBMS_OUTPUT.PUT_LINE('FECHAS Y DISPONIBILIDAD DEL PAQUETE '|| ID_PAQUETE || ' ACTUALIZADAS ');

    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('MODULO DE ALIANZAS: NO HAY PAQUETES PARA HACER ALIANZAS (AUN HAY PAQUETES CON DISPONIBILIDAD)');
        

END;
/
-- funcion para obtener passaportes de las personas con pcrs negativas en un periodo menor a 48 horas desde la fecha pasada como parametro
CREATE OR REPLACE FUNCTION GET_PASAPORTE_PERSONA_SANA(fecha_actual date) RETURN NUMBER
IS
PASAPORTE NUMBER;
PCR_DIAS DATE;
BEGIN
    PCR_DIAS:= fecha_actual - 2;
    PASAPORTE := 0;
    SELECT P.PASAPORTE INTO PASAPORTE FROM CLIENTES P, PCRS Q WHERE P.PASAPORTE = Q.FK_CLIENTE AND Q.FECHA_PRUEBA >= PCR_DIAS AND Q.ESTADO = 0 ORDER BY DBMS_RANDOM.RANDOM fetch first 1 rows only; 
    RETURN PASAPORTE;

    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/
--funcion para obtener un paquete que tenga disponibilidad y la fecha sea igual o mayor a la  del parametro 
CREATE OR REPLACE FUNCTION GET_PAQUETE_VALIDO(fecha_actual date) RETURN NUMBER
IS
PAQUETE NUMBER;
BEGIN

    SELECT P.ID INTO PAQUETE FROM PAQUETES P, HIS_PAQUETES H WHERE P.ID = H.FK_PAQUETE ORDER BY DBMS_RANDOM.RANDOM fetch first 1 rows only;
    RETURN PAQUETE;

    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
        RETURN 0;

END;
/
--funcion que disminuye el numero de disponibilidad del paquete dado 
CREATE OR REPLACE FUNCTION DISMINUIR_DISPONIBILIDAD_PAQUETE(PAQUETE NUMBER, DISMINUCION NUMBER) RETURN NUMBER
IS
PAQUETES_DISPONIBLES NUMBER;
NUEVO_VALOR NUMBER;
REGRESO NUMBER;
SOBRE NUMBER; 
BEGIN 

    SELECT MAX(P.DISPONIBILIDAD) INTO PAQUETES_DISPONIBLES FROM HIS_PAQUETES P WHERE P.FK_PAQUETE = PAQUETE;
    SELECT P.SOBRESATURADO INTO SOBRE FROM PAQUETES P WHERE P.ID = PAQUETE;


    IF (PAQUETES_DISPONIBLES IS NULL) THEN

        DBMS_OUTPUT.PUT_LINE('DISMINUIR DISPONIBILIDAD: No se encontro paquete con el identificador dado: '||PAQUETE);
        REGRESO:=0;

    ELSIF (PAQUETES_DISPONIBLES = 0) THEN

        IF (SOBRE = 0) THEN

        --PRIMERA VEZ QUE SE SOBRESATURA UN PAQUETE
        --MODULO DE MANTENIMIENTO A CRUCEROS DE PAQUETE
        DBMS_OUTPUT.PUT_LINE('DISMINUIR DISPONIBILIDAD: El Paquete' || paquete ||' seleccionado no tiene disponibilidad');
        UPDATE PAQUETES SET SOBRESATURADO = 1 WHERE ID = PAQUETE;
        REGRESO:= -1;

        ELSIF (SOBRE = 1) THEN
        --MODULO DE MANTENIMIENTO A CRUCEROS DE PAQUETE
        --SEGUNDA VEZ QUE SE SOBRESATURA UN PAQUETE
        REGRESO := -2;

        END IF;

    ELSIF (PAQUETES_DISPONIBLES < DISMINUCION) THEN 

        NUEVO_VALOR:= 0;
        REGRESO:= PAQUETES_DISPONIBLES;
        UPDATE PAQUETES SET SOBRESATURADO = 1 WHERE ID = PAQUETE;
    ELSE 

        NUEVO_VALOR:= PAQUETES_DISPONIBLES - DISMINUCION;
        REGRESO:= DISMINUCION;
    END IF;
    RETURN REGRESO;

    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    --error consultando la data
    RETURN -10;

END;
/
-- procedimiento que genera los metodos de pago
CREATE OR REPLACE PROCEDURE GENERAR_FORMA_DE_PAGO(FORMAS NUMBER,MONTO_TOTAL NUMBER, NUMERO_FACTURA NUMBER, CLIENTE NUMBER, PAIS_CLIENTE NUMBER)
AS
MAX_FORMA NUMBER;
NUEVO_MONTO NUMBER;
BEGIN
    SELECT MAX(ID) INTO MAX_FORMA FROM FORMAS_PAGO;

    IF (MAX_FORMA IS NULL) THEN
    MAX_FORMA:= 1;
    ELSE 
    MAX_FORMA:= MAX_FORMA + 1;
    END IF;

    IF    (FORMAS = 1) THEN

    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(MONTO_TOTAL),'TDC',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);

    ELSIF (FORMAS = 2) THEN

    NUEVO_MONTO := MONTO_TOTAL/2;

    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'TDC',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'EFECTIVO',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    
    ELSIF (FORMAS = 3) THEN

    NUEVO_MONTO := MONTO_TOTAL/3;
    
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'TDC',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'EFECTIVO',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'CRIPTOMONEDA',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    

    ELSIF (FORMAS = 4) THEN

    NUEVO_MONTO := MONTO_TOTAL/4;
    
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'TDC',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'EFECTIVO',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'CRIPTOMONEDA',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'TDD',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    

    ELSIF (FORMAS = 5) THEN

    
    NUEVO_MONTO := MONTO_TOTAL/5;
    
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'TDC',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'EFECTIVO',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'CRIPTOMONEDA',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'TDD',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    MAX_FORMA:= MAX_FORMA + 1;
    INSERT INTO FORMAS_PAGO VALUES (MAX_FORMA,PRECIO_TDA(NUEVO_MONTO),'TRANSFERENCIA',NUMERO_FACTURA,CLIENTE,PAIS_CLIENTE);
    
    END IF;

END;
/
-- procedimiento que genera una factura
CREATE OR REPLACE PROCEDURE GENERAR_FACTURA(paquete number, PASAPORTE_P number,cantidad number, fecha date)
AS
MAX_DETALLE NUMBER;
MAX_FACTURA NUMBER;
PRECIO_PAQUETE NUMBER; 
DISMINUCION NUMBER;
PAIS_PERSONA NUMBER;
NUEVA_DISPONIBILIDAD NUMBER;
FORMAS_ALEATORIAS NUMBER;
DISPOSITIVOS_ALEATORIOS NUMBER;
CANALES_ALEATORIOS NUMBER;
VARCHAR_DISPOSITIVOS VARCHAR2(30);
VARCHAR_CANALES VARCHAR2(30);
BEGIN

    SELECT MAX(ID_RENGLON) INTO MAX_DETALLE FROM DET_FACTURAS;
    SELECT MAX(NUMERO_FACTURA) INTO MAX_FACTURA FROM FACTURAS;
    SELECT SUM(H.FECHAS.PRECIO_TO) INTO PRECIO_PAQUETE FROM HIS_PAQUETES H WHERE FK_PAQUETE = paquete;
    SELECT C.FK_PAIS INTO PAIS_PERSONA FROM CLIENTES C WHERE C.PASAPORTE = PASAPORTE_P; 

    IF (MAX_DETALLE IS NULL) THEN
    MAX_DETALLE:= 1;
    ELSE 
    MAX_DETALLE:= MAX_DETALLE + 1;
    END IF;

    IF (MAX_FACTURA IS NULL) THEN
    MAX_FACTURA:= 1;
    ELSE 
    MAX_FACTURA:= MAX_FACTURA + 1;
    END IF;

    IF (PRECIO_PAQUETE IS NULL) THEN

    DBMS_OUTPUT.PUT_LINE('GENERAR FACTURA: El paquete introducido no es valido.');

    ELSE

    PRECIO_PAQUETE := PRECIO_PAQUETE * CANTIDAD;
    --GENERAR DETALLE,FACTURA Y FORMA DE PAGO

    DISMINUCION := DISMINUIR_DISPONIBILIDAD_PAQUETE(PAQUETE,CANTIDAD);
    DBMS_OUTPUT.PUT_LINE('GENERAR FACTURA: DISMINUCION ' || DISMINUCION);

        IF (DISMINUCION = 0 ) THEN
        DBMS_OUTPUT.PUT_LINE('GENERAR FACTURA: No hay disponibilidad para el paquete seleccionado');
        ELSIF (DISMINUCION = -1) THEN
        DBMS_OUTPUT.PUT_LINE('GENERAR FACTURA: GENERANDO NUEVA ALIANZA');
        MODULO_DE_MANTENIMIENTO(FECHA,PAQUETE);
        MODULO_DE_ALIANZAS(FECHA);
        ELSIF (DISMINUCION = -2) THEN 
        DBMS_OUTPUT.PUT_LINE('GENERAR FACTURA: GENERANDO NUEVO PAQUETE');
        MODULO_DE_MANTENIMIENTO(FECHA,PAQUETE);
        MODULO_DE_GENERACION(FECHA);
        ELSIF (DISMINUCION = -10) THEN 
        DBMS_OUTPUT.PUT_LINE('GENERAR FACTURA: ERRROR EN DISMINUIR PAQUETE');
        ELSE 
        DBMS_OUTPUT.PUT_LINE('GENERAR FACTURA: GENERANDO NUEVA FACTURA');

        SELECT MAX(P.DISPONIBILIDAD) INTO NUEVA_DISPONIBILIDAD FROM HIS_PAQUETES P WHERE P.FK_PAQUETE = PAQUETE;
        NUEVA_DISPONIBILIDAD := NUEVA_DISPONIBILIDAD - DISMINUCION;

            --meter esta basura en dos funciones distintas
            Select trunc(dbms_random.value(1,4)) num into DISPOSITIVOS_ALEATORIOS From dual;
            IF (DISPOSITIVOS_ALEATORIOS = 1) THEN
            VARCHAR_DISPOSITIVOS := 'ANDROID';
            ELSIF (DISPOSITIVOS_ALEATORIOS = 2) THEN
            VARCHAR_DISPOSITIVOS := 'IOS';
            ELSIF (DISPOSITIVOS_ALEATORIOS = 3) THEN
            VARCHAR_DISPOSITIVOS := 'WINDOWS';
            ELSIF (DISPOSITIVOS_ALEATORIOS = 4) THEN
            VARCHAR_DISPOSITIVOS := 'OTRO';
            END IF;

            Select trunc(dbms_random.value(1,5)) num into CANALES_ALEATORIOS From dual;
            IF (CANALES_ALEATORIOS = 1) THEN
            VARCHAR_CANALES := 'AGENCIA FISICA';
            ELSIF (CANALES_ALEATORIOS = 2) THEN
            VARCHAR_CANALES := 'APLICACION MOVIL';
            ELSIF (CANALES_ALEATORIOS = 3) THEN
            VARCHAR_CANALES := 'PAGINA WEB';
            ELSIF (CANALES_ALEATORIOS = 4) THEN
            VARCHAR_CANALES := 'WHATSAPP';
            ELSIF (CANALES_ALEATORIOS = 5) THEN
            VARCHAR_CANALES := 'INSTAGRAM';
            END IF;



        INSERT INTO FACTURAS VALUES (MAX_FACTURA,fecha,PRECIO_PAQUETE,VARCHAR_DISPOSITIVOS,VARCHAR_CANALES,PASAPORTE_P,PAIS_PERSONA);

        INSERT INTO DET_FACTURAS VALUES (MAX_DETALLE,DISMINUCION,PAQUETE,MAX_FACTURA,PASAPORTE_P,PAIS_PERSONA); 
        DBMS_OUTPUT.PUT_LINE('GENERAR FACTURA: NUEVA_DISPONIBILIDAD '|| NUEVA_DISPONIBILIDAD);
        UPDATE HIS_PAQUETES SET DISPONIBILIDAD = NUEVA_DISPONIBILIDAD WHERE FK_PAQUETE = PAQUETE;

        Select trunc(dbms_random.value(1,5)) num into FORMAS_ALEATORIAS From dual;
        GENERAR_FORMA_DE_PAGO(FORMAS_ALEATORIAS,PRECIO_PAQUETE,MAX_FACTURA,PASAPORTE_P,PAIS_PERSONA);

        END IF;

    END IF;
END;

/
-- modulo de compras
CREATE OR REPLACE PROCEDURE MODULO_DE_COMPRAS (fecha_actual date)
AS
PAQUETE NUMBER;
PASAPORTE_PERSONA NUMBER;
NUMERO_DE_PAQUETES NUMBER;
ALEATORIO_PAQUETES NUMBER;
BEGIN 

    FOR iteracion in 1..10
    LOOP

    PAQUETE:= GET_PAQUETE_VALIDO(fecha_actual);

    IF (PAQUETE = 0) THEN 

    DBMS_OUTPUT.PUT_LINE('MODULO DE COMPRAS: No hay paquetes con fechas validas');

    ELSE

    PASAPORTE_PERSONA := GET_PASAPORTE_PERSONA_SANA(fecha_actual);

        IF (PASAPORTE_PERSONA = 0) Then

            DBMS_OUTPUT.PUT_LINE('MODULO DE COMPRAS: No hay personas que cumplan las condiciones para entrar');
        ELSE 
            Select trunc(dbms_random.value(1,50)) num into ALEATORIO_PAQUETES From dual;
            GENERAR_FACTURA(PAQUETE,PASAPORTE_PERSONA,ALEATORIO_PAQUETES,fecha_actual);

        END IF;


    END IF;


    END LOOP;

END ;
/
-- procedimiento de simulacion  
CREATE OR REPLACE PROCEDURE SIMULACION(FECHA_INICIO DATE, FECHA_FIN DATE)
AS
CANTIDAD_DIAS NUMBER;
DIA_ACTUAL DATE;
BEGIN
    CANTIDAD_DIAS := FECHA_FIN - FECHA_INICIO;
    DIA_ACTUAL := FECHA_INICIO; 
    FOR ITERACION IN 0..CANTIDAD_DIAS
    LOOP
    DIA_ACTUAL:= DIA_ACTUAL + 1;
    MODULO_DE_COMPRAS(DIA_ACTUAL);
    END LOOP;

END;
--SET SERVEROUTPUT ON;
--EXECUTE SIMULACION(DATE '2021-1-1', DATE '2021-3-1');

--select f.numero_factura from facturas f;
--select p.disponibilidad, p.fk_paquete from his_paquetes p;
--SELECT F.ID,f.forma FROM FORMAS_PAGO F;