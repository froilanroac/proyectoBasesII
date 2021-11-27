DROP TABLE COMENTARIOS_OBSERVACIONES;
DROP TABLE OBSERVACION;
DROP TABLE DET_FACTURAS;
DROP TABLE FORMAS_PAGO;
DROP TABLE FACTURAS;
DROP TABLE PCRS;
DROP TABLE HIS_PAQUETES;
DROP TABLE CLIENTES;
DROP TABLE HIS_SERVICIOS;
DROP TABLE PAISES; 
DROP TABLE DESTINOS; 
DROP TABLE HIS_MANTENIMIENTOS;
DROP TABLE CRUCEROS;
DROP TABLE SERVICIOS; 
DROP TABLE VENTAS_COMPETIDORES;
DROP TABLE COMPETIDORES;
DROP TABLE MANTENIMIENTOS;
DROP TABLE HIS_ALIANZAS;
DROP TABLE PAQUETES;
DROP TABLE PROVEEDORES;
/
CREATE OR REPLACE TYPE FECHAS_TDA AS OBJECT(
FECHA_DESDE date,
FECHA_HASTA date,
PRECIO_DIA number(20,2),
PRECIO_TO number(20,2),
STATIC FUNCTION VALIDACION_FECHA (fecha_inicio date, fecha_fin date) RETURN date,
STATIC FUNCTION VALIDACION_PRECIO (precio NUMBER) RETURN number,
STATIC FUNCTION PRECIO_TOTAL(precio number,d1 DATE,d2 DATE) RETURN NUMBER
);
/
CREATE OR REPLACE TYPE BODY FECHAS_TDA AS

STATIC FUNCTION VALIDACION_FECHA(fecha_inicio date, fecha_fin date) RETURN date
IS
BEGIN
IF fecha_fin >= fecha_inicio THEN
RETURN fecha_inicio;
ELSE
RAISE_APPLICATION_ERROR(-20001, 'Error: la fecha de fin no puede ser antes que la de inicio.');
END IF;
END;

STATIC FUNCTION VALIDACION_PRECIO(PRECIO NUMBER) RETURN NUMBER
IS
BEGIN
IF PRECIO>=0 THEN
RETURN PRECIO;
ELSE
RAISE_APPLICATION_ERROR(-20001, 'Error: Ingrese un precio valido.');
END IF;
END;

STATIC FUNCTION PRECIO_TOTAL(precio number,d1 DATE,d2 DATE) RETURN NUMBER
IS
BEGIN
IF ((d2>=d1) AND (PRECIO >= 0)) THEN
return (d2-d1) * precio;
ELSE
RAISE_APPLICATION_ERROR(-20001,'Error: Verifique el precio o las fechas.');
END IF;
END;

END;

/
CREATE OR REPLACE TYPE PRECIO_TDA AS OBJECT(
MONTO number(20,2),
STATIC FUNCTION VALIDACION_MONTO(MONTO NUMBER) RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY PRECIO_TDA AS

STATIC FUNCTION VALIDACION_MONTO(MONTO NUMBER) RETURN NUMBER
IS
BEGIN
IF MONTO >= 0  THEN
RETURN MONTO;
ELSE
RAISE_APPLICATION_ERROR(-20001, 'Error: El precio no puede ser negativo');
END IF;
END;

END;

/
CREATE OR REPLACE TYPE DATOS_TDA AS OBJECT(
NOMBRE VARCHAR2(50),
DESCRIPCION VARCHAR2(70),
STATIC FUNCTION VALIDACION_NOMBRE(NOMBRE VARCHAR2) RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY DATOS_TDA AS

STATIC FUNCTION VALIDACION_NOMBRE(NOMBRE VARCHAR2) RETURN VARCHAR2
IS
BEGIN
return NOMBRE;
END;
END;

/



CREATE TABLE PAISES (
    ID NUMBER PRIMARY KEY,
    NOMBRE VARCHAR(50),
    FOTO BLOB,
    CONTINENTE VARCHAR(30),
    CONSTRAINT CHECK_CONTINENTE CHECK (CONTINENTE IN ('AM', 'AS', 'OC', 'EU','AF'))
);


CREATE TABLE CLIENTES (
    PASAPORTE NUMBER,
    NOMBRE VARCHAR(50),
    APELLIDO VARCHAR(50),
    EMAIL VARCHAR2(50),
    TELEFONO VARCHAR2(50),
    FK_PAIS NUMBER,
    CONSTRAINT PK_CLIENTES PRIMARY KEY (PASAPORTE,FK_PAIS),
    CONSTRAINT FK_PAIS FOREIGN KEY (FK_PAIS) REFERENCES PAISES(ID)
);

CREATE TABLE DESTINOS (
    ID NUMBER PRIMARY KEY,
    DATOS DATOS_TDA,
    VIDEO BFILE,
    FOTO BLOB
);


CREATE TABLE PAQUETES (
    ID NUMBER PRIMARY KEY,
    datos DATOS_TDA
);

CREATE TABLE PROVEEDORES (
    ID NUMBER PRIMARY KEY, 
    NOMBRE VARCHAR2(50),
    FOTO BLOB,
    LOGO BLOB
);

CREATE TABLE HIS_ALIANZAS (
    FECHA_CREACION DATE,
    FIN_ALIANZA DATE,
    FK_PROVEEDOR NUMBER,
    FK_PAQUETE NUMBER,
    CONSTRAINT PK_HIS_ALIANZA PRIMARY KEY (FECHA_CREACION,FK_PROVEEDOR,FK_PAQUETE),
    CONSTRAINT FK_PROVEEDOR FOREIGN KEY (FK_PROVEEDOR) REFERENCES PROVEEDORES(ID),
    CONSTRAINT FK_PAQUETE FOREIGN KEY (FK_PAQUETE) REFERENCES PAQUETES(ID)
);

CREATE TABLE MANTENIMIENTOS (
    NUMERO NUMBER PRIMARY KEY,
    PRECIO PRECIO_TDA,
    DESCRIPCION VARCHAR(50)
);

CREATE TABLE SERVICIOS (
    ID NUMBER PRIMARY KEY,
    CATEGORIA VARCHAR(50)
);

CREATE TABLE CRUCEROS (
    ID NUMBER PRIMARY KEY,
    datos DATOS_TDA,
    FOTO BLOB,
    FK_SERVICIO NUMBER,
    CONSTRAINT FK_SERVICIO FOREIGN KEY(FK_SERVICIO) REFERENCES SERVICIOS(ID)
);

CREATE TABLE HIS_MANTENIMIENTOS (
    FECHA_MANTENIMIENTO DATE,
    FECHA_PROX_MANTENIMIENTO DATE,
    FK_CRUCERO NUMBER,
    FK_MANTENIMIENTO NUMBER,
    CONSTRAINT PK_HISTORICOS_MANTENIMIENTO PRIMARY KEY(FECHA_MANTENIMIENTO,FK_CRUCERO,FK_MANTENIMIENTO),
    CONSTRAINT FK_CRUCERO FOREIGN KEY(FK_CRUCERO) REFERENCES CRUCEROS(ID),
    CONSTRAINT FK_MANTENIMIENTO FOREIGN KEY(FK_MANTENIMIENTO) REFERENCES MANTENIMIENTOS(NUMERO)
);

CREATE TABLE COMPETIDORES (
    ID NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(50),
    FOTO BLOB
);

CREATE TABLE VENTAS_COMPETIDORES (
    FECHA_CREACION DATE,
    CANTIDAD_VENTAS NUMBER,
    FK_COMPETIDOR NUMBER,
    CONSTRAINT PK_VENTA_COMPETIDOR PRIMARY KEY (FECHA_CREACION,FK_COMPETIDOR),
    CONSTRAINT FK_COMPETIDOR_VENTA_COMPETIDORES FOREIGN KEY(FK_COMPETIDOR) REFERENCES COMPETIDORES(ID)
);


CREATE TABLE HIS_SERVICIOS (
    FECHA_CREACION DATE,
    fechas FECHAS_TDA,
    FK_SERVICIO NUMBER,
    FK_DESTINO NUMBER,
    CONSTRAINT PK_HIS_SERVICIOS PRIMARY KEY (FECHA_CREACION,FK_SERVICIO,FK_DESTINO),
    CONSTRAINT FK_HIS_SERVICIOS_SERVICIO FOREIGN KEY (FK_SERVICIO) REFERENCES SERVICIOS(ID),
    CONSTRAINT FK_HIS_SERVICIOS_DESTINO FOREIGN KEY (FK_DESTINO) REFERENCES DESTINOS(ID)
);

CREATE TABLE HIS_PAQUETES (
    FECHA_CREACION DATE,
    FECHAS FECHAS_TDA,
    DISPONIBILIDAD NUMBER,
    FK_SERVICIO NUMBER,
    FK_PAQUETE NUMBER,
    CONSTRAINT PK_HIS_PAQUETES PRIMARY KEY (FECHA_CREACION,FK_SERVICIO,FK_PAQUETE),
    CONSTRAINT FK_HIS_PAQUETES_SERVICIO FOREIGN KEY (FK_SERVICIO) REFERENCES SERVICIOS(ID),
    CONSTRAINT FK_HIS_PAQUETES_PAQUETE FOREIGN KEY (FK_PAQUETE) REFERENCES PAQUETES(ID)
);

CREATE TABLE PCRS (
    ID NUMBER,
    FECHA_PRUEBA DATE,
    ESTADO NUMBER,
    FK_CLIENTE NUMBER,
    FK_PAIS_CLIENTE NUMBER,
    CONSTRAINT PK_PCRS PRIMARY KEY (ID,FK_CLIENTE,FK_PAIS_CLIENTE), 
    CONSTRAINT FK_PCRS_CLIENTE FOREIGN KEY (FK_CLIENTE,FK_PAIS_CLIENTE) REFERENCES CLIENTES(PASAPORTE,FK_PAIS),
    CONSTRAINT CHECK_PCR CHECK (ESTADO IN (1,0))
);

CREATE TABLE FACTURAS (
    NUMERO_FACTURA NUMBER,
    FECHA_EMISION DATE,
    TOTAL NUMBER(20,2),
    DISPOSITIVO VARCHAR2(30),
    CANAL VARCHAR2(30),
    FK_CLIENTE NUMBER,
    FK_PAIS_CLIENTE NUMBER,
    CONSTRAINT PK_FACTURA PRIMARY KEY (NUMERO_FACTURA,FK_CLIENTE,FK_PAIS_CLIENTE),
    CONSTRAINT FK_FACTURAS_CLIENTE FOREIGN KEY (FK_CLIENTE,FK_PAIS_CLIENTE) REFERENCES CLIENTES(PASAPORTE,FK_PAIS),
    CONSTRAINT CHECK_DISPOSITIVO_FACTURA CHECK (DISPOSITIVO IN ('ANDROID','IOS','WINDOWS','OTRO')),
    CONSTRAINT CHECK_CANAL_FACTURA CHECK (CANAL IN ('AGENCIA FISICA','APLICACION MOVIL','PAGINA WEB','WHATSAPP','INSTAGRAM'))
);

CREATE TABLE FORMAS_PAGO (
    ID NUMBER,
    PRECIO PRECIO_TDA,
    FORMA VARCHAR2(30),
    FK_FACTURA NUMBER,
    FK_CLIENTE_FACTURA NUMBER,
    FK_PAIS_CLIENTE_FACTURA NUMBER,
    CONSTRAINT PK_FORMAS_PAGO PRIMARY KEY (ID,FK_FACTURA,FK_CLIENTE_FACTURA,FK_PAIS_CLIENTE_FACTURA),
    CONSTRAINT FK_FACTURAS_FORMAS_PAGO FOREIGN KEY (FK_FACTURA,FK_CLIENTE_FACTURA,FK_PAIS_CLIENTE_FACTURA) REFERENCES FACTURAS(NUMERO_FACTURA,FK_CLIENTE,FK_PAIS_CLIENTE),
    CONSTRAINT CHECK_FORMA_FORMAS_PAGO CHECK (FORMA IN ('TDC','EFECTIVO','CRIPTOMONEDA','TDD','TRANSFERENCIA'))
);

CREATE TABLE DET_FACTURAS (
    ID_RENGLON NUMBER,
    CANTIDAD NUMBER,
    FK_PAQUETE NUMBER,
    FK_FACTURA NUMBER,
    FK_CLIENTE_FACTURA NUMBER,
    FK_PAIS_CLIENTE_FACTURA NUMBER,
    CONSTRAINT PK_DET_FACTURAS PRIMARY KEY (ID_RENGLON,FK_PAQUETE,FK_FACTURA,FK_CLIENTE_FACTURA,FK_PAIS_CLIENTE_FACTURA),
    CONSTRAINT FK_FACTURAS_DET_FACTURAS FOREIGN KEY (FK_FACTURA,FK_CLIENTE_FACTURA,FK_PAIS_CLIENTE_FACTURA) REFERENCES FACTURAS(NUMERO_FACTURA,FK_CLIENTE,FK_PAIS_CLIENTE)
);

CREATE TABLE OBSERVACION (
    ID NUMBER,
    FECHA_CREACION DATE,
    ESCALA VARCHAR2(2),
    FK_SERVICIO NUMBER,
    FK_CLIENTE NUMBER,
    FK_PAIS_CLIENTE NUMBER,
    CONSTRAINT PK_OBSERVACION PRIMARY KEY (ID,FK_SERVICIO,FK_CLIENTE,FK_PAIS_CLIENTE),
    CONSTRAINT FK_OBSERVACION_CLIENTE FOREIGN KEY (FK_CLIENTE,FK_PAIS_CLIENTE) REFERENCES CLIENTES(PASAPORTE,FK_PAIS),
    CONSTRAINT CHECK_OBSERVACION_ESCALA CHECK (ESCALA IN (':)',':|',':('))
);

CREATE TABLE COMENTARIOS_OBSERVACIONES (
    ID NUMBER,
    COMENTARIO VARCHAR(50),
    FK_OBSERVACION NUMBER,
    FK_SERVICIO_OBSERVACION NUMBER,
    FK_CLIENTE_OBSERVACION NUMBER,
    FK_PAIS_CLIENTE_OBSERVACION NUMBER,
    CONSTRAINT PK_COMENTARIOS_OBSERVACIONES PRIMARY KEY (ID,FK_OBSERVACION,FK_SERVICIO_OBSERVACION,FK_CLIENTE_OBSERVACION,FK_PAIS_CLIENTE_OBSERVACION),
    CONSTRAINT FK_COMENTARIOS_OBSERVACIONES_OBSERVACION FOREIGN KEY (FK_OBSERVACION,FK_SERVICIO_OBSERVACION,FK_CLIENTE_OBSERVACION,FK_PAIS_CLIENTE_OBSERVACION) REFERENCES OBSERVACION(ID,FK_SERVICIO,FK_CLIENTE,FK_PAIS_CLIENTE)
);
