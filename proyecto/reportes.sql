
CREATE OR REPLACE FUNCTION CONCATENAR_PAGOS (NUMERO_FACTURA NUMBER) RETURN VARCHAR 
IS
REGRESO VARCHAR(2000);
CURSOR PAGOS_FACTURA IS SELECT f.forma "FORMA", f.precio.monto "MONTO" from formas_pago f where f.fk_factura = NUMERO_FACTURA;
REGISTROS_PAGOS PAGOS_FACTURA%ROWTYPE;
BEGIN
    REGRESO := '';
    OPEN PAGOS_FACTURA;
    FETCH PAGOS_FACTURA into REGISTROS_PAGOS;
    while PAGOS_FACTURA%FOUND
        LOOP
        
        REGRESO := REGRESO || CHR(10) || '$' ||REGISTROS_PAGOS.MONTO || ' - ' || REGISTROS_PAGOS.FORMA;

        FETCH PAGOS_FACTURA into REGISTROS_PAGOS;
        END LOOP;
    CLOSE PAGOS_FACTURA;

    RETURN REGRESO;

END;


/
CREATE OR REPLACE FUNCTION CONCATENAR_SERVICIOS (ID_DESTINO NUMBER) RETURN VARCHAR
IS
REGRESO VARCHAR(2000);
CURSOR SERVICIOS_DESTINO IS SELECT s.categoria FROM SERVICIOS S,HIS_SERVICIOS H, DESTINOS D WHERE s.id = h.fk_servicio AND h.fk_destino = d.id AND d.id = ID_DESTINO;
REGISTROS_SERVICIOS SERVICIOS_DESTINO%ROWTYPE;
BEGIN 
    REGRESO := '';
    OPEN SERVICIOS_DESTINO;
    FETCH SERVICIOS_DESTINO into REGISTROS_SERVICIOS;
    while SERVICIOS_DESTINO%FOUND
        LOOP
        
        REGRESO := REGRESO || CHR(10) || '*' ||REGISTROS_SERVICIOS.CATEGORIA;

        FETCH SERVICIOS_DESTINO into REGISTROS_SERVICIOS;
        END LOOP;
    CLOSE SERVICIOS_DESTINO;

    RETURN REGRESO;
END;
/
CREATE OR REPLACE FUNCTION CONCATENAR_SERVICIOS_PAQUETE (ID_PAQUETE NUMBER) RETURN VARCHAR
IS
REGRESO VARCHAR(2000);
CURSOR SERVICIOS_PAQUETE IS SELECT s.categoria FROM SERVICIOS S,HIS_PAQUETES H WHERE s.id = h.fk_servicio AND H.FK_PAQUETE = ID_PAQUETE;
REGISTROS_PAQUETE SERVICIOS_PAQUETE%ROWTYPE;
BEGIN 
    REGRESO := '';
    OPEN SERVICIOS_PAQUETE;
    FETCH SERVICIOS_PAQUETE into REGISTROS_PAQUETE;
    while SERVICIOS_PAQUETE%FOUND
        LOOP
        
        REGRESO := REGRESO || CHR(10) || '*' ||REGISTROS_PAQUETE.CATEGORIA;

        FETCH SERVICIOS_PAQUETE into REGISTROS_PAQUETE;
        END LOOP;
    CLOSE SERVICIOS_PAQUETE;

    RETURN REGRESO;
END;
/
CREATE OR REPLACE FUNCTION CALCULAR_PRECIO_PAQUETE (ID_PAQUETE number) return NUMBER
IS
regreso number;
CURSOR SERVICIOS_PAQUETE IS SELECT H.FECHAS.PRECIO_TO "PRECIO_TO" FROM HIS_PAQUETES H WHERE H.FK_PAQUETE = ID_PAQUETE;
REGISTROS_PAQUETE SERVICIOS_PAQUETE%ROWTYPE;
BEGIN
    regreso := 0;
    OPEN SERVICIOS_PAQUETE;
    FETCH SERVICIOS_PAQUETE into REGISTROS_PAQUETE;
    while SERVICIOS_PAQUETE%FOUND
        LOOP
        
        regreso:= regreso + REGISTROS_PAQUETE.precio_to;

        FETCH SERVICIOS_PAQUETE into REGISTROS_PAQUETE;
        END LOOP;
    CLOSE SERVICIOS_PAQUETE;

    return regreso;

END;
/
CREATE OR REPLACE PROCEDURE REPORTE_1 (prc out sys_refcursor,fecha_inicio date, fecha_fin date, destino VARCHAR)
IS 
BEGIN
    OPEN PRC FOR SELECT DISTINCT(d.datos.nombre) "DESTINO", h.fecha_creacion "FECHA_CREACION" ,h.fechas.fecha_desde "FECHA_DESDE" ,h.fechas.fecha_hasta "FECHA_HASTA" , CONCATENAR_SERVICIOS(d.id) "SERVICIOS_OFRECIDOS"
    FROM DESTINOS D,SERVICIOS S,HIS_SERVICIOS H 
    where d.id = h.fk_destino 
    and h.fk_servicio = s.id
    and (h.fechas.fecha_desde >= fecha_inicio or fecha_inicio IS NULL)
    and (h.fechas.fecha_hasta <= fecha_fin or fecha_fin IS NULL)
    and (UPPER(d.datos.nombre) = upper(destino) or destino IS NULL);
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_2 (prc out sys_refcursor,fecha_inicio date, fecha_fin date)
IS
BEGIN
    OPEN PRC FOR SELECT d.id, d.datos.nombre, h.fechas.fecha_Desde "FECHA_DESDE", h.fechas.fecha_hasta "FECHA_HASTA", d.foto , d.descripcion
    FROM DESTINOS D, HIS_SERVICIOS H, SERVICIOS S 
    WHERE D.ID = H.FK_DESTINO AND s.id = h.fk_servicio
    AND UPPER(S.CATEGORIA) LIKE '%CRUCERO%'
    and (h.fechas.fecha_desde >= fecha_inicio or fecha_inicio IS NULL)
    and (h.fechas.fecha_hasta <= fecha_fin OR fecha_fin is null);
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_3 (prc out sys_refcursor, fecha_inicio date, fecha_fin date, destino VARCHAR)
IS 
BEGIN
    OPEN PRC FOR select d.datos.nombre, p.fechas.fecha_desde,p.fechas.fecha_hasta, d.foto, concatenar_servicios_paquete(p.fk_paquete), CALCULAR_PRECIO_PAQUETE(p.fk_paquete)
    from destinos d,his_servicios h, servicios s, his_paquetes p 
    where d.id = h.fk_destino and h.fk_servicio = s.id and s.id = p.fk_servicio and UPPER(s.categoria) LIKE '%CRUCERO%'
    and (p.fechas.fecha_desde >= fecha_inicio or fecha_inicio IS NULL)
    and (p.fechas.fecha_hasta <= fecha_fin OR fecha_fin is null)
    and (UPPER(d.datos.nombre) = upper(destino) or destino IS NULL);
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_4(prc out sys_refcursor, fecha_inicio date, fecha_fin date, dispo varchar)
IS
BEGIN
    OPEN prc for SELECT c.pasaporte, c.nombre || ' ' || c.apellido "nombre" , c.email, concatenar_servicios_paquete(d.fk_paquete), f.dispositivo, f.canal, f.total, CONCATENAR_PAGOS(f.numero_factura) , h.fechas.fecha_desde, h.fechas.fecha_hasta, w.datos.nombre, w.foto
    from clientes c, facturas f, det_facturas d, paquetes p, his_paquetes h, servicios s, his_servicios hs, destinos w
    where c.pasaporte = f.FK_CLIENTE
    and f.numero_factura = d.fk_factura
    and d.fk_paquete = p.id
    and p.id = h.fk_paquete
    and h.fk_servicio = s.id 
    and s.id = hs.fk_servicio 
    and hs.fk_destino = w.id
    and upper(s.categoria) like '%CRUCERO%'
    and (upper(f.dispositivo) = UPPER(dispo) or dispo is null)
    and (h.fechas.fecha_desde >= fecha_inicio or fecha_inicio IS NULL)
    and (h.fechas.fecha_hasta <= fecha_fin OR fecha_fin is null);
    
END;
/
-- set autoprint on;
-- VARIABLE MEMORYCURSOR REFCURSOR;
-- EXECUTE REPORTE_4(:MEMORYCURSOR);