CREATE TABLE detalles_compra (
 id NUMBER PRIMARY KEY,
 id_paquete NUMBER,
 cantidad_paquetes NUMBER,
 fecha_compra DATE,
 precio_total NUMBER
);
INSERT INTO detalles_compra VALUES (1,1,3,DATE '2020-1-1', 3);
INSERT INTO detalles_compra VALUES (2,1,3,DATE '2020-1-5', 3);
INSERT INTO detalles_compra VALUES (3,1,5,DATE '2021-2-1', 5);
INSERT INTO detalles_compra VALUES (4,1,5,DATE '2021-2-10', 5);
INSERT INTO detalles_compra VALUES (5,1,7,DATE '2021-3-1', 8);
INSERT INTO detalles_compra VALUES (6,1,7,DATE '2021-3-5', 3);
INSERT INTO detalles_compra VALUES (7,1,4,DATE '2021-5-1', 5);
INSERT INTO detalles_compra VALUES (8,1,4,DATE '2021-5-4', 5);
INSERT INTO detalles_compra VALUES (9,1,7,DATE '2021-7-1', 8);
INSERT INTO detalles_compra VALUES (10,1,2,DATE '2021-12-1', 3);
INSERT INTO detalles_compra VALUES (11,1,8,DATE '2021-11-1', 5);
INSERT INTO detalles_compra VALUES (12,1,3,DATE '2021-8-1', 8);
CREATE OR REPLACE PROCEDURE PROCEDIMIENTO_ACT(MEMORYCURSOR OUT SYS_REFCURSOR)
AS
BEGIN
OPEN MEMORYCURSOR FOR SELECT EXTRACT(month FROM fecha_compra) "Mes",EXTRACT(year
FROM fecha_compra) "AÑO", sum(cantidad_paquetes) "PAQUETES VENDIDOS"
FROM detalles_compra 
GROUP BY EXTRACT(month FROM fecha_compra), EXTRACT(year FROM fecha_compra),
cantidad_paquetes
ORDER BY EXTRACT(month FROM fecha_compra);
END ;
set autoprint on;
VARIABLE MEMORYCURSOR REFCURSOR;
EXECUTE PROCEDIMIENTO_ACT(:MEMORYCURSOR);