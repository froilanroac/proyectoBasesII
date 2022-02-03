alter session set "_ORACLE_SCRIPT"=true; 

-- droppeando 
drop user administrador1 cascade;
drop user consultor1 cascade;
drop user usuario1 cascade;
drop role administrador;
drop role consultor;
drop role usuario;
drop public synonym paquetes;
drop public synonym his_paquetes;
drop public synonym servicios;
drop public synonym det_facturas;
drop public synonym facturas;
drop public synonym clientes;
drop public synonym paises;
drop public synonym cruceros;
drop public synonym observacion;
drop public synonym comentarios_observaciones;


-- creacion de roles
-- administrador
-- permisos generales del administrador
create role administrador;
grant create table to administrador;
grant create role to administrador;
grant create user to administrador;
grant create procedure to administrador;
grant create trigger to administrador;
grant create view to administrador;
grant create sequence to administrador;
grant create session to administrador;
grant drop user to administrador;
-- permisos del administrador sobre las tablas
grant select, insert, delete, update on paquetes to administrador;
grant select, insert, delete, update on his_paquetes to administrador;
grant select, insert, delete, update on servicios to administrador;
grant select, insert, delete, update on det_facturas to administrador;
grant select, insert, delete, update on facturas to administrador;
grant select, insert, delete, update on clientes to administrador;
grant select, insert, delete, update on paises to administrador;
grant select, insert, delete, update on cruceros to administrador;
grant select, insert, delete, update on observacion to administrador;
grant select, insert, delete, update on comentarios_observaciones to administrador;

-- consultor
create role consultor;
-- permisos generales de consultor
grant create session to consultor;
-- permisos del consultor sobre las tablas
grant select, update on paquetes to consultor;
grant select, update on his_paquetes to consultor;
grant select, update on servicios to consultor;
grant select, update on det_facturas to consultor;
grant select, update on facturas to consultor;
grant select, delete, update on clientes to consultor;
grant select, update on paises to consultor;
grant select, update on cruceros to consultor;
grant select, delete, update on observacion to consultor;
grant select, delete, update on comentarios_observaciones to consultor;

-- usuario
create role usuario;
-- permisos generales del usuario
grant create session to usuario;
-- permisos del usuario sobre las tablas 
grant select on paquetes to usuario;
grant select on his_paquetes to usuario;
grant select on servicios to usuario;
grant select, insert on det_facturas to usuario;
grant select, insert on facturas to usuario;
grant select, insert on clientes to usuario;
grant select on paises to usuario;
grant select on cruceros to usuario;
grant select, insert, update on observacion to usuario;
grant select, insert, update on comentarios_observaciones to usuario;

-- creacion de usuarios
create user administrador1 identified by clave;
grant administrador to administrador1;

create user consultor1 identified by clave;
grant consultor to consultor1;

create user usuario1 identified by clave;
grant usuario to usuario1;

-- hay que crear sinonimos de todas las tablas
create public synonym paquetes for paquetes;
create public synonym his_paquetes for his_paquetes;
create public synonym servicios for servicios;
create public synonym det_facturas for det_facturas;
create public synonym facturas for facturas;
create public synonym clientes for clientes;
create public synonym paises for paises;
create public synonym cruceros for cruceros;
create public synonym observacion for observacion;
create public synonym comentarios_observaciones for comentarios_observaciones;

