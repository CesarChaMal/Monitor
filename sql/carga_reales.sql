
-----------------------------------------------------------------
-- CARGA DE DATOS
-- conectarse con MONITOR/monitor
-----------------------------------------------------------------


--proveedor
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('1','GIM PUBLICIDAD EXTERIOR',1,NULL);


--cliente
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('1A','CASA CUERVO',1,'MON');
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre)values ('2B','BESTBAY',1,'GIM');
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre)values ('3C','ATT',1,'GIM');


--usuarios (si es un usuario de proveedor, puede ver a todos sus clientes, 
--si es un usuario de cliente solo podra ver los objetos que le pertenezcan)


insert into monitor.usuario (email,nombre,apellidos,contrasena,tipo,fechaalta,status,cve_clipro)
values ('angel@yahoo.com','angel','osornio', 'Abc123', 2,sysdate,1,'1A');



--campana
insert into monitor.campana(cve_campana,cve_clipro,nombre,status,fechaalta,inicia,termina) values ('1A_JCE','1A','JOSE CUERVO ESPECIAL',1,sysdate,sysdate,sysdate+30);
insert into monitor.campana(cve_campana,cve_clipro,nombre,status,fechaalta,inicia,termina) values ('1A_CEN','1A','AZUL CENTENARIO',1,sysdate,sysdate,sysdate+30);
insert into monitor.campana(cve_campana,cve_clipro,nombre,status,fechaalta,inicia,termina) values ('1A_KRA','1A','KRAKEN',1,sysdate,sysdate,sysdate+30);
insert into monitor.campana(cve_campana,cve_clipro,nombre,status,fechaalta,inicia,termina) values ('1A_1800','1A','CUERVO 1800',1,sysdate,sysdate,sysdate+30);
insert into monitor.campana(cve_campana,cve_clipro,nombre,status,fechaalta,inicia,termina) values ('1A_MAT','1A','MATUSALEM',1,sysdate,sysdate,sysdate+30);
insert into monitor.campana(cve_campana,cve_clipro,nombre,status,fechaalta,inicia,termina) values ('1A_TES','1A','PRUEBA DESHABILITADA',2,sysdate,sysdate,sysdate+30);



--PLAZA
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('1A_PBA','PUEBLA',1,null,1,'1A');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('1A_CDMX','CIUDAD DE MEXICO',1,null,1,'1A');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('1A_MER','MERIDA',1,null,1,'1A');



--sitio
insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_JCE','1A','1A_CDMX','004UA',to_date('01/04/2017', 'DD/MM/YYYY'),to_date('31/12/2017', 'DD/MM/YYYY'),1,'Periferico Sur Esq. Panamericana',1);



insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_1800','1A','1A_CDMX','011CB',to_date('01/04/2017', 'DD/MM/YYYY'),to_date('31/12/2017', 'DD/MM/YYYY'),1,'Viaducto Esq Patricio Saenz #5',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_CEN','1A','1A_PBA','018TRIPB',to_date('16/04/2017', 'DD/MM/YYYY'),to_date('31/12/2017', 'DD/MM/YYYY'),1,'Cto. Juan Pablo II Esq. Blvd. Valsequillo #131',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_CEN','1A','1A_PBA','211UA',to_date('16/04/2017', 'DD/MM/YYYY'),to_date('31/12/2017', 'DD/MM/YYYY'),1,'Blvd. Nte. Esq. Calle 24 Poniente',2);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_MAT','1A','1A_MER','154UB',to_date('01/05/2017', 'DD/MM/YYYY'),to_date('31/12/2017', 'DD/MM/YYYY'),1,'Av. Circuito Colonias, frente a la nissan, Col.Yucatan Calle 26 #95',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_MAT','1A','1A_MER','177UA',to_date('01/05/2017', 'DD/MM/YYYY'),to_date('31/12/2017', 'DD/MM/YYYY'),1,'Prol. Paseo de Montejo Plaza Campestre, Col. Emiliano Zapata Norte',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_KRA','1A','1A_MER','066UB',to_date('15/04/2017', 'DD/MM/YYYY'),to_date('31/12/2017', 'DD/MM/YYYY'),1,'Calle 7, frente a Plaza Altabrisa Col. Maya',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_KRA','1A','1A_PBA','FF10UB',to_date('16/04/2017', 'DD/MM/YYYY'),to_date('15/11/2017', 'DD/MM/YYYY'),1,'Blvb. Atlixco y Av. Juarez',2);



--  INVALIDO
insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('1A_KRA','1A','1A_MER','AAA000',to_date('01/05/2017', 'DD/MM/YYYY'),to_date('31/12/2017', 'DD/MM/YYYY'),1,'Direccion desconocida',0);




COMMIT;
