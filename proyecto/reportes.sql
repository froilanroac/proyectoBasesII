
CREATE OR REPLACE FUNCTION CONCATENAR_OBSERVACIONES(MES NUMBER, ANIO NUMBER, escal varchar, servicio varchar) RETURN VARCHAR 
IS
REGRESO VARCHAR(2000);
PORCENTAJE NUMBER(20,2);

CURSOR COMENTARIOS IS select c.comentario "COMENTARIO"
from observacion o, comentarios_observaciones c, servicios s
where o.id = c.fk_observacion
and s.id = o.fk_servicio
and upper(s.categoria) = UPPER(SERVICIO)
AND o.escala = escal
and extract(month from o.fecha_creacion) = MES
and extract(year from o.fecha_creacion) = ANIO;

REGISTROS_COMENTARIOS COMENTARIOS%ROWTYPE;
BEGIN

    REGRESO := '';
    OPEN COMENTARIOS;
    FETCH COMENTARIOS into REGISTROS_COMENTARIOS;
    while COMENTARIOS%FOUND
        LOOP
        
        REGRESO := REGRESO || CHR(10) || ' - ' ||REGISTROS_COMENTARIOS.COMENTARIO;

        FETCH COMENTARIOS into REGISTROS_COMENTARIOS;
        END LOOP;
    CLOSE COMENTARIOS;

return regreso;
end;
/
CREATE OR REPLACE FUNCTION total_medios_fecha(mes number, anio number) RETURN number
is
regreso number;
BEGIN
    regreso := 0;
    select count (f.numero_factura) into regreso
    from facturas f
    where (EXTRACT(month FROM f.fecha_emision) = mes)
    and (EXTRACT(year FROM f.fecha_emision) = anio);
    return regreso;
end;
/
CREATE OR REPLACE FUNCTION porcentaje_agencia(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_medios_fecha(MES,ANIO);

    select count (f.numero_factura) INTO PORCENTAJE
    from facturas f
    where (EXTRACT(month FROM f.fecha_emision) = mes)
    and (EXTRACT(year FROM f.fecha_emision) = anio)
    and f.canal = 'AGENCIA FISICA';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION porcentaje_aplicacion(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_medios_fecha(MES,ANIO);

    select count (f.numero_factura) INTO PORCENTAJE
    from facturas f
    where (EXTRACT(month FROM f.fecha_emision) = mes)
    and (EXTRACT(year FROM f.fecha_emision) = anio)
    and f.canal = 'APLICACION MOVIL';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION porcentaje_pagina(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_medios_fecha(MES,ANIO);

    select count (f.numero_factura) INTO PORCENTAJE
    from facturas f
    where (EXTRACT(month FROM f.fecha_emision) = mes)
    and (EXTRACT(year FROM f.fecha_emision) = anio)
    and f.canal = 'PAGINA WEB';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/

CREATE OR REPLACE FUNCTION porcentaje_what(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_medios_fecha(MES,ANIO);

    select count (f.numero_factura) INTO PORCENTAJE
    from facturas f
    where (EXTRACT(month FROM f.fecha_emision) = mes)
    and (EXTRACT(year FROM f.fecha_emision) = anio)
    and f.canal = 'WHATSAPP';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION porcentaje_insta(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_medios_fecha(MES,ANIO);

    select count (f.numero_factura) INTO PORCENTAJE
    from facturas f
    where (EXTRACT(month FROM f.fecha_emision) = mes)
    and (EXTRACT(year FROM f.fecha_emision) = anio)
    and f.canal = 'INSTAGRAM';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION CONCATENAR_MEDIOS(MES NUMBER, ANIO NUMBER) RETURN VARCHAR 
IS
REGRESO VARCHAR(2000);
PORCENTAJE NUMBER(20,2);
BEGIN

    porcentaje := porcentaje_agencia(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'AGENCIA FISICA - ' || PORCENTAJE || '%';

    porcentaje := porcentaje_aplicacion(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'APLICACION MOVIL - ' || PORCENTAJE || '%';

    porcentaje := porcentaje_pagina(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'PAGINA WEB - ' || PORCENTAJE || '%';

    porcentaje := porcentaje_what(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'WHATSAPP - ' || PORCENTAJE || '%';

    porcentaje := porcentaje_insta(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'INSTAGRAM - ' || PORCENTAJE || '%';

return regreso;
end;
/
CREATE OR REPLACE FUNCTION cantidad_compras_pais_mes(mes number,anio number, country number) RETURN number
is
regreso number(30,2);
BEGIN
    select sum(d.cantidad) into regreso
    from det_facturas d, facturas f, clientes c, paises p
    where d.fk_factura = f.numero_factura
    and f.fk_cliente = c.pasaporte
    and c.fk_pais = p.id
    and extract(month from f.fecha_emision) = mes
    and extract(year from f.fecha_emision) = anio
    and p.id = country;

    return regreso;

    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    return 0;
END;
/
create or replace function obtener_foto_pais(identificador number) return blob
is
regreso blob;
begin
    select c.foto into regreso from paises c where c.id = identificador;
return regreso;
end;
/
create or replace function obtener_foto_competencia(identificador number) return blob
is
regreso blob;
begin
    select c.foto into regreso from competidores c where c.id = identificador;
return regreso;
end;
/
CREATE OR REPLACE FUNCTION ventas_del_mes(mes number,anio number) RETURN number
is
regreso number(30,2);
BEGIN
    select sum(d.cantidad) into regreso from facturas f, det_facturas d 
    where extract(month from f.fecha_emision) = mes 
    and extract(year from f.fecha_emision) = anio
    and f.numero_factura = d.fk_factura;

    if(regreso is null) then
    regreso:=0;
    end if;

    return regreso;
END;
/
CREATE OR REPLACE FUNCTION total_formas_fecha(mes number, anio number) RETURN number
is
regreso number;
BEGIN
    regreso := 0;
    select count (p.id) into regreso
    from facturas f, formas_pago p
    where f.numero_factura = p.fk_factura
    and (EXTRACT(month FROM f.fecha_emision) = mes)
    and (EXTRACT(year FROM f.fecha_emision) = anio);
    return regreso;
end;
/
CREATE OR REPLACE FUNCTION porcentaje_tdc(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_formas_fecha (MES,ANIO);
    select count(p.id) INTO PORCENTAJE from facturas f, formas_pago p 
    where f.numero_factura = p.fk_factura 
    and EXTRACT(month FROM f.fecha_emision) = MES
    and EXTRACT(year FROM f.fecha_emision) = ANIO
    and p.forma = 'TDC';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION porcentaje_efectivo(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_formas_fecha (MES,ANIO);
    select count(p.id) INTO PORCENTAJE from facturas f, formas_pago p 
    where f.numero_factura = p.fk_factura 
    and EXTRACT(month FROM f.fecha_emision) = MES
    and EXTRACT(year FROM f.fecha_emision) = ANIO
    and p.forma = 'EFECTIVO';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION porcentaje_cripto(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_formas_fecha (MES,ANIO);
    select count(p.id) INTO PORCENTAJE from facturas f, formas_pago p 
    where f.numero_factura = p.fk_factura 
    and EXTRACT(month FROM f.fecha_emision) = MES
    and EXTRACT(year FROM f.fecha_emision) = ANIO
    and p.forma = 'CRIPTOMONEDA';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION porcentaje_tdd(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_formas_fecha (MES,ANIO);
    select count(p.id) INTO PORCENTAJE from facturas f, formas_pago p 
    where f.numero_factura = p.fk_factura 
    and EXTRACT(month FROM f.fecha_emision) = MES
    and EXTRACT(year FROM f.fecha_emision) = ANIO
    and p.forma = 'TDD';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION porcentaje_trans(mes number, anio number) RETURN number
is
regreso number(20,2);
PORCENTAJE NUMBER(20,2);
TOTAL NUMBER(20,2);
BEGIN
    TOTAL := total_formas_fecha (MES,ANIO);
    select count(p.id) INTO PORCENTAJE from facturas f, formas_pago p 
    where f.numero_factura = p.fk_factura 
    and EXTRACT(month FROM f.fecha_emision) = MES
    and EXTRACT(year FROM f.fecha_emision) = ANIO
    and p.forma = 'TRANSFERENCIA';

    PORCENTAJE := PORCENTAJE * 100 / total;
    RETURN PORCENTAJE;
END;
/
CREATE OR REPLACE FUNCTION CONCATENAR_FORMAS(MES NUMBER, ANIO NUMBER) RETURN VARCHAR 
IS
REGRESO VARCHAR(2000);
PORCENTAJE NUMBER(20,2);
BEGIN

    porcentaje := porcentaje_trans(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'TRANSFERENCIA - ' || PORCENTAJE || '%';

    porcentaje := porcentaje_tdc(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'TDC - ' || PORCENTAJE || '%';

    porcentaje := porcentaje_efectivo(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'EFECTIVO - ' || PORCENTAJE || '%';

    porcentaje := porcentaje_cripto(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'CRIPTOMONEDA - ' || PORCENTAJE || '%';

    porcentaje := porcentaje_tdd(mes,anio);
    REGRESO := REGRESO || CHR(10) || 'TDD - ' || PORCENTAJE || '%';

return regreso;
end;
/
CREATE OR REPLACE FUNCTION ingreso_mensual_servicio(cate varchar) RETURN number
is
regreso number;
calculo number(20,2);
begin

    select SUM(h.fechas.precio_dia) into calculo
    from his_paquetes h, servicios s
    where h.fk_servicio = s.id
    and upper(s.categoria) = UPPER(cate); 
    calculo := calculo * 30;
    return calculo;
end; 
/
CREATE OR REPLACE FUNCTION egreso_mensual_servicio(cate varchar) RETURN number
is
regreso number;
calculo number(20,2);
begin

    select SUM(h.fechas.precio_dia) into calculo
    from his_servicios h, servicios s
    where h.fk_servicio = s.id
    and upper(s.categoria) = UPPER(cate); 
    calculo := calculo * 30;
    return calculo;
end; 
/
CREATE OR REPLACE FUNCTION calculo_ganancias(cate varchar) RETURN number
is
calculo number(20,2);
begin
    calculo := ingreso_mensual_servicio(cate) - egreso_mensual_servicio(cate);
    return calculo;
end;
/
CREATE OR REPLACE FUNCTION CONCATENAR_MANTENIMIENTOS(FECHA_MAN DATE, IDENTIFICADOR NUMBER) RETURN VARCHAR 
IS
REGRESO VARCHAR(2000);
CURSOR MANTENIMIENTOS_CURSOR IS SELECT m.descripcion "DESCRIPCION" FROM HIS_MANTENIMIENTOS H, MANTENIMIENTOS M WHERE h.fk_mantenimiento = m.numero AND h.fecha_mantenimiento = FECHA_MAN AND h.fk_crucero = IDENTIFICADOR;
REGISTROS_MAN MANTENIMIENTOS_CURSOR%ROWTYPE;
BEGIN
    REGRESO := '';
    OPEN MANTENIMIENTOS_CURSOR;
    FETCH MANTENIMIENTOS_CURSOR into REGISTROS_MAN;
    while MANTENIMIENTOS_CURSOR%FOUND
        LOOP
        
        REGRESO := REGRESO || CHR(10) || '*' ||REGISTROS_MAN.DESCRIPCION;

        FETCH MANTENIMIENTOS_CURSOR into REGISTROS_MAN;
        END LOOP;
    CLOSE MANTENIMIENTOS_CURSOR;

    RETURN REGRESO;

END;
/
create or replace function obtener_foto_crucero (identificador number) return blob
is
regreso blob;
begin
    select c.foto into regreso from cruceros c where c.id = identificador;
return regreso;
end;
/
create or replace function obtener_demanda_mensual(mes number, anio number,cantidad number) return number
IS 
REGRESO VARCHAR(50);
DEMANDA NUMBER(20);
cuenta number(20,2);
BEGIN
    demanda := 0;
    SELECT COUNT(s.id) INTO DEMANDA
    FROM FACTURAS F, DET_FACTURAS D, PAQUETES P, HIS_PAQUETES H, SERVICIOS S, clientes c
    WHERE f.numero_factura = d.fk_factura
    AND d.fk_paquete = p.id
    AND h.fk_paquete = p.id
    AND h.fk_servicio = s.id
    and f.fk_cliente = c.pasaporte
    and (EXTRACT(month FROM f.fecha_emision) = mes)
    and (EXTRACT(YEAR FROM f.fecha_emision) = anio);
    cuenta:= cantidad * 100 / demanda;

    if(demanda <> 0) then
    cuenta:= cantidad * 100 / demanda;
    ELSE 
    Cuenta:=0; 
    END IF;

RETURN cuenta;
END;
/
create or replace function obtener_foto (identificador number) return blob
is
regreso blob;
begin
    select p.foto into regreso from proveedores p where p.id = identificador;
return regreso;
end;
/
create or replace function obtener_logo (identificador number) return blob
is
regreso blob;
begin
    select p.logo into regreso from proveedores p where p.id = identificador;
return regreso;
end;
/
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
CREATE OR REPLACE PROCEDURE REPORTE_5(prc out sys_refcursor, fecha_inicio date, fecha_fin date, prox date)
IS
BEGIN
    OPEN prc for select c.id,obtener_foto_crucero(c.id), h.fecha_mantenimiento, h.fecha_prox_mantenimiento, CONCATENAR_MANTENIMIENTOS(h.fecha_mantenimiento,c.id) ,sum(m.precio.monto)
    from cruceros c, his_mantenimientos h, mantenimientos m 
    where c.id = h.fk_crucero
    and h.fk_mantenimiento = m.numero
    and (h.fecha_mantenimiento >= fecha_inicio or fecha_inicio IS NULL)
    and (h.fecha_mantenimiento <= fecha_fin or fecha_fin IS NULL)
    and (h.fecha_prox_mantenimiento = prox or prox IS NULL)
    group by c.id , h.fecha_mantenimiento, h.fecha_prox_mantenimiento
    order by c.id, h.fecha_mantenimiento;
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_6(prc out sys_refcursor, mes number, cate varchar)
IS
BEGIN
    OPEN prc for SELECT EXTRACT(month FROM f.fecha_emision) "Mes", EXTRACT(year FROM f.fecha_emision) "Anio",s.categoria,count(c.pasaporte) "Clientes que solicitaron", obtener_demanda_mensual(EXTRACT(month FROM f.fecha_emision),EXTRACT(year FROM f.fecha_emision),count(c.pasaporte)) || '%' 
    FROM FACTURAS F, DET_FACTURAS D, PAQUETES P, HIS_PAQUETES H, SERVICIOS S, clientes c
    WHERE f.numero_factura = d.fk_factura
    AND d.fk_paquete = p.id
    AND h.fk_paquete = p.id
    AND h.fk_servicio = s.id
    and f.fk_cliente = c.pasaporte
    and (EXTRACT(month FROM f.fecha_emision) = mes or mes IS NULL)
    and (upper(s.categoria) = upper(cate) or cate IS NULL)
    group by EXTRACT(month FROM f.fecha_emision), EXTRACT(year FROM f.fecha_emision),s.categoria
    order by EXTRACT(month FROM f.fecha_emision), EXTRACT(year FROM f.fecha_emision);
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_7(prc out sys_refcursor, mes number, cate varchar)
IS
BEGIN
    OPEN prc for SELECT EXTRACT(month FROM f.fecha_emision) "Mes", EXTRACT(year FROM f.fecha_emision) "Anio",s.categoria, ingreso_mensual_servicio(s.categoria), egreso_mensual_servicio(s.categoria), calculo_ganancias(s.categoria)
    FROM FACTURAS F, DET_FACTURAS D, PAQUETES P, HIS_PAQUETES H, SERVICIOS S, clientes c, his_servicios w
    WHERE f.numero_factura = d.fk_factura
    AND d.fk_paquete = p.id
    AND h.fk_paquete = p.id
    AND h.fk_servicio = s.id
    and f.fk_cliente = c.pasaporte
    and s.id = w.fk_servicio
    and (EXTRACT(month FROM f.fecha_emision) = mes or mes IS NULL)
    and (upper(s.categoria) = upper(cate) or cate IS NULL)
    group by EXTRACT(month FROM f.fecha_emision), EXTRACT(year FROM f.fecha_emision),s.categoria
    order by EXTRACT(month FROM f.fecha_emision), EXTRACT(year FROM f.fecha_emision);
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_8(prc out sys_refcursor, mes number)
IS
BEGIN 
    OPEN prc for select  EXTRACT(month FROM f.fecha_emision) "Mes",  EXTRACT(year FROM f.fecha_emision)"anio", CONCATENAR_FORMAS(EXTRACT(month FROM f.fecha_emision),  EXTRACT(year FROM f.fecha_emision)) "Medio de pago y porcentaje", 
    porcentaje_tdc(EXTRACT(month FROM f.fecha_emision),EXTRACT(year FROM f.fecha_emision)) "TDC",
    porcentaje_tdd(EXTRACT(month FROM f.fecha_emision),EXTRACT(year FROM f.fecha_emision)) "TDD",
    porcentaje_efectivo(EXTRACT(month FROM f.fecha_emision),EXTRACT(year FROM f.fecha_emision)) "EFECTIVO",
    porcentaje_trans(EXTRACT(month FROM f.fecha_emision),EXTRACT(year FROM f.fecha_emision)) "TRANSFERENCIA",
    porcentaje_cripto(EXTRACT(month FROM f.fecha_emision),EXTRACT(year FROM f.fecha_emision)) "CRIPTOMONEDA"
    from facturas f, formas_pago p
    where f.numero_factura = p.fk_factura
    and (EXTRACT(month FROM f.fecha_emision) = mes or mes is null)
    group by EXTRACT(month FROM f.fecha_emision),  EXTRACT(year FROM f.fecha_emision);
end;
/
CREATE OR REPLACE PROCEDURE REPORTE_9(prc out sys_refcursor, fecha_inicio date, fecha_fin date)
IS
BEGIN
    OPEN prc for select max(h.fecha_creacion), p.nombre, obtener_logo(p.id) "LOGO", obtener_foto(p.id) "FOTO"
    from his_alianzas h, proveedores p
    where h.fk_proveedor = p.id
    and (h.fecha_creacion >= fecha_inicio or fecha_inicio IS NULL)
    and (h.fecha_creacion <= fecha_fin or fecha_fin IS NULL)
    group by p.nombre,p.id
    order by max(h.fecha_creacion);
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_10(prc out sys_refcursor, mes number)
IS
BEGIN 
    open prc for select extract(month from v.fecha_creacion), extract(year from v.fecha_creacion), c.nombre, obtener_foto_competencia(c.id), sum(v.cantidad_ventas) "Ventas de la comeptencia", ventas_del_mes(extract(month from v.fecha_creacion),extract(year from v.fecha_creacion))
    from competidores c, ventas_competidores v
    where c.id = v.fk_competidor
    and (extract(month from v.fecha_creacion) = mes or mes is null)
    group by extract(month from v.fecha_creacion), extract(year from v.fecha_creacion), c.nombre, c.id
    ORDER BY extract(month from v.fecha_creacion), extract(year from v.fecha_creacion);

END;
/
CREATE OR REPLACE PROCEDURE REPORTE_11(prc out sys_refcursor, mes number, country varchar)
IS
BEGIN 
    open PRC for select extract(year from f.fecha_emision), extract(month from f.fecha_emision), obtener_foto_pais(p.id), p.nombre, cantidad_compras_pais_mes(extract(month from f.fecha_emision), extract(year from f.fecha_emision), p.id)
    from facturas f,det_facturas d, clientes c, paises p
    where f.numero_factura = d.fk_factura
    and f.fk_cliente = c.pasaporte
    and c.fk_pais = p.id
    and (extract(month from f.fecha_emision) = mes or mes is null)
    and (upper(p.nombre) = upper(country) or country is null)
    group by extract(year from f.fecha_emision), extract(month from f.fecha_emision), p.id, p.nombre
    order by extract(year from f.fecha_emision), extract(month from f.fecha_emision);
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_12(prc out sys_refcursor, mes number)
IS
BEGIN 
    OPEN prc for SELECT EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision), CONCATENAR_MEDIOS(EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision)),
    porcentaje_agencia(EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision)),
    porcentaje_aplicacion(EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision)),
    porcentaje_pagina(EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision)),
    porcentaje_what(EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision)),
    porcentaje_insta(EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision))
    FROM FACTURAS F
    where (EXTRACT(MONTH FROM f.fecha_emision) = mes or mes is null)
    GROUP BY EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision)
    ORDER BY EXTRACT(MONTH FROM f.fecha_emision), EXTRACT(YEAR FROM f.fecha_emision);
END;
/
CREATE OR REPLACE PROCEDURE REPORTE_13(prc out sys_refcursor, mes number, esca varchar)
IS
BEGIN
    open prc for select extract(month from o.fecha_creacion) "Mes", extract(year from o.fecha_creacion) "Anio",s.categoria "Categoria", o.escala ,CONCATENAR_OBSERVACIONES(extract(month from o.fecha_creacion), extract(year from o.fecha_creacion), o.escala, s.categoria) "Comentarios"
    from observacion o, servicios s
    where o.fk_servicio = s.id
    and (extract(month from o.fecha_creacion) = mes or mes is null)
    and (o.escala = esca or esca is null)
    group by extract(month from o.fecha_creacion), extract(year from o.fecha_creacion), s.categoria, o.escala
    order by extract(month from o.fecha_creacion), extract(year from o.fecha_creacion), s.categoria;

END;
-- set autoprint on;
-- VARIABLE MEMORYCURSOR REFCURSOR;
-- EXECUTE REPORTE_5(:MEMORYCURSOR,DATE '2021-1-20',NULL,DATE '2021-3-13');