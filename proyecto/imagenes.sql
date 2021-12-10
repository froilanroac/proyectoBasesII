
CREATE OR REPLACE DIRECTORY BLOB_DIR_PAIS AS 'C:\imagenes\Banderas';
/
Create or replace procedure Insertar_imagen_pais is
  l_bfile  BFILE;
  l_blob   BLOB;
  num_imagen number;
  contador number;
BEGIN

  For contador IN 1..15
    LOOP
    
          SELECT l.foto
          INTO   l_blob
          FROM   paises l
          WHERE  l.id = contador
          FOR UPDATE;
    
      l_bfile := BFILENAME('BLOB_DIR_PAIS', CONCAT(TO_CHAR(contador),'.png'));
      
  DBMS_LOB.fileopen(l_bfile, Dbms_Lob.File_Readonly);
  DBMS_LOB.trim(l_blob, 0);
  DBMS_LOB.loadfromfile(l_blob,l_bfile,DBMS_LOB.getlength(l_bfile));
  DBMS_LOB.fileclose(l_bfile);
  End loop;
  
END;
/
execute Insertar_imagen_pais;
/
CREATE OR REPLACE DIRECTORY BLOB_DIR_DESTINO AS 'C:\imagenes\Destino';

/
Create or replace procedure insertar_imagen_destino is
  l_bfile  BFILE;
  l_blob   BLOB;
  num_imagen number;
  contador number;
BEGIN

  For contador IN 1..15
    LOOP
    
          SELECT l.foto
          INTO   l_blob
          FROM   destinos l
          WHERE  l.id = contador
          FOR UPDATE;
    
      l_bfile := BFILENAME('BLOB_DIR_DESTINO', CONCAT(TO_CHAR(contador),'.png'));
      
  DBMS_LOB.fileopen(l_bfile, Dbms_Lob.File_Readonly);
  DBMS_LOB.trim(l_blob, 0);
  DBMS_LOB.loadfromfile(l_blob,l_bfile,DBMS_LOB.getlength(l_bfile));
  DBMS_LOB.fileclose(l_bfile);
  End loop;
  
END;
/
execute insertar_imagen_destino;
/
CREATE OR REPLACE DIRECTORY BLOB_DIR_FLOTA AS 'C:\imagenes\Flota';

/
Create or replace procedure insertar_imagen_crucero is
  l_bfile  BFILE;
  l_blob   BLOB;
  num_imagen number;
  contador number;
BEGIN

  For contador IN 1..15
    LOOP
    
          SELECT l.foto
          INTO   l_blob
          FROM   cruceros l
          WHERE  l.id = contador
          FOR UPDATE;
    
      l_bfile := BFILENAME('BLOB_DIR_FLOTA', CONCAT(TO_CHAR(contador),'.png'));
      
  DBMS_LOB.fileopen(l_bfile, Dbms_Lob.File_Readonly);
  DBMS_LOB.trim(l_blob, 0);
  DBMS_LOB.loadfromfile(l_blob,l_bfile,DBMS_LOB.getlength(l_bfile));
  DBMS_LOB.fileclose(l_bfile);
  End loop;
  
END;
/
execute insertar_imagen_crucero;
/
CREATE OR REPLACE DIRECTORY BLOB_DIR_COMPETIDOR AS 'C:\imagenes\competidor';

/
Create or replace procedure insertar_imagen_competidor is
  l_bfile  BFILE;
  l_blob   BLOB;
  num_imagen number;
  contador number;
BEGIN

  For contador IN 1..15
    LOOP
    
          SELECT l.foto
          INTO   l_blob
          FROM   competidores l
          WHERE  l.id = contador
          FOR UPDATE;
    
      l_bfile := BFILENAME('BLOB_DIR_COMPETIDOR', CONCAT(TO_CHAR(contador),'.png'));
      
  DBMS_LOB.fileopen(l_bfile, Dbms_Lob.File_Readonly);
  DBMS_LOB.trim(l_blob, 0);
  DBMS_LOB.loadfromfile(l_blob,l_bfile,DBMS_LOB.getlength(l_bfile));
  DBMS_LOB.fileclose(l_bfile);
  End loop;
  
END;
/
execute insertar_imagen_competidor;
/

CREATE OR REPLACE DIRECTORY BLOB_DIR_PRO AS 'C:\imagenes\Proovedor';

/
Create or replace procedure insertar_imagen_pro is
  l_bfile  BFILE;
  l_blob   BLOB;
  num_imagen number;
  contador number;
BEGIN

  For contador IN 1..6
    LOOP
    
          SELECT l.foto
          INTO   l_blob
          FROM   PROVEEDORES l
          WHERE  l.id = contador
          FOR UPDATE;
    
      l_bfile := BFILENAME('BLOB_DIR_PRO', CONCAT(TO_CHAR(contador),'.png'));
      
  DBMS_LOB.fileopen(l_bfile, Dbms_Lob.File_Readonly);
  DBMS_LOB.trim(l_blob, 0);
  DBMS_LOB.loadfromfile(l_blob,l_bfile,DBMS_LOB.getlength(l_bfile));
  DBMS_LOB.fileclose(l_bfile);
  End loop;
  
END;
/
execute insertar_imagen_pro;
/

CREATE OR REPLACE DIRECTORY BLOB_DIR_LO AS 'C:\imagenes\Logo';

/
Create or replace procedure insertar_imagen_logo is
  l_bfile  BFILE;
  l_blob   BLOB;
  num_imagen number;
  contador number;
BEGIN

  For contador IN 1..6
    LOOP
    
          SELECT l.logo
          INTO   l_blob
          FROM   PROVEEDORES l
          WHERE  l.id = contador
          FOR UPDATE;
    
      l_bfile := BFILENAME('BLOB_DIR_LO', CONCAT(TO_CHAR(contador),'.png'));
      
  DBMS_LOB.fileopen(l_bfile, Dbms_Lob.File_Readonly);
  DBMS_LOB.trim(l_blob, 0);
  DBMS_LOB.loadfromfile(l_blob,l_bfile,DBMS_LOB.getlength(l_bfile));
  DBMS_LOB.fileclose(l_bfile);
  End loop;
  
END;
/
execute insertar_imagen_logo;
/



