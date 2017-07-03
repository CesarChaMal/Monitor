
******************************************************************
CARGA DE DATOS
conectarse con MONITOR/monitor
******************************************************************

--proveedor
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('GIM','GIM',1,NULL);
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('ABA','ABACO',1,NULL);
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('MUL','MULTIMEDIO',1,NULL);
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('MON','MONITOREXACTO',1,NULL);


--cliente
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('MON_CUER','CASA CUERVO',2,'MONI');
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('GIM_LALA','PRODUCTOS LALA',2,'GIM');
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('GIM_FEMSA','COCA DE MEXICO',2,'GIM');

insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('ABA_KRAF','PRODUCTOS KRAF',2,'ABA');

insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('MUL_NES','PRODUCTOS NESTLE',2,'MUL');
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('MUL_SONY','SONY DE MEXICO',2,'MUL');
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('MUL_PANAS','PANASONIC',2,'MUL');
insert into monitor.cli_pro (cve_clipro,nombre,tipo,padre) values ('MUL_FEDEX','MENSAJERIA FEDEX',2,'MUL');


--usuarios (si es un usuario de proveedor, puede ver a todos sus clientes, 
--si es un usuario de cliente solo podra ver los objetos que le pertenezcan)

insert into monitor.usuario (email,nombre,apellidos,contrasena,tipo,fechaalta,status,cve_clipro)
values ('aosornio@yahoo.com','angel','leon osornio', 'Khm64', 3,sysdate,1,'GIM');

insert into monitor.usuario (email,nombre,apellidos,contrasena,tipo,fechaalta,status,cve_clipro)
values ('cuervo2@yahoo.com','angel','leon osornio', 'A_?#22', 2,sysdate,1,'GIM_FEMSA');

insert into monitor.usuario (email,nombre,apellidos,contrasena,tipo,fechaalta,status,cve_clipro)
values ('ces_ch@hotmail.com','Cesar','Chavez', '123', 2,sysdate,1,'GIM');




--PLAZA GIM
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('RIO','BOCA DEL RIO',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('CAM','CAMPECHE',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('CUE','CUERNAVACA',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('DF','CIUDAD DE MEXICO',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('JAL','GUADALAJARA',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('MER','MERIDA',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('OAX','OAXACA',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('PUE','PUEBLA',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('TLA','TLAXCALA',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('TOL','TOLUCA',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('CHP','CHIAPAS',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('VER','VERACRUZ',1,null,1,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('TAB','VILLA HERMOSA',1,null,1,'GIM');

--SUB PLAZA GIM
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('COA','COATZACOALCOS',1,'VER',2,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('ORI','ORIZABA',1,'VER',2,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('MIN','MINATITLAN',1,'VER',2,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('COR','CORDOBA',1,'VER',2,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('JPA','JALAPA',1,'VER',2,'GIM');



--PLAZA MON_CUER
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('BAJ','BAJA CALIFORNIA',1,null,1,'MON_CUER');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('SON','SONORA',1,null,1,'MON_CUER');

--SUB PLAZA MON_CUER
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('TIJ','TIJUANA',1,'BAJ',2,'GIM');
insert into monitor.plaza (cve_plaza,nombre,status,padre,tipo,cve_clipro) values ('CAB','CABORCA',1,'SON',2,'GIM');





--campana
insert into monitor.campana(cve_campana,nombre,fechaalta,status,cve_clipro) values ('AAA','BLACK CUERVO ESPECIAL',sysdate,1,'MON_CUER');
insert into monitor.campana(cve_campana,nombre,fechaalta,status,cve_clipro) values ('BBB','PLATINO CUERVO',sysdate,1,'MON_CUER');
insert into monitor.campana(cve_campana,nombre,fechaalta,status,cve_clipro) values ('CCC','AMIGOS CUERVO',sysdate,1,'MON_CUER');
insert into monitor.campana(cve_campana,nombre,fechaalta,status,cve_clipro) values ('DDD','CUERVO NUEVO',sysdate,2,'MON_CUER');


insert into monitor.campana(cve_campana,nombre,fechaalta,status,cve_clipro) values ('PRO','LALA PROTEINA',sysdate,1,'GIM_LALA');
insert into monitor.campana(cve_campana,nombre,fechaalta,status,cve_clipro) values ('SIN','COCA SIN AZUCAR',sysdate,1,'GIM_FEMSA');
insert into monitor.campana(cve_campana,nombre,fechaalta,status,cve_clipro) values ('CLA','COCACOLA CLASICA',sysdate,2,'GIM_FEMSA');



--sitio
insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('PRO','GIM_LALA','CAB','GGSTY7635G',sysdate,sysdate+30,1,'ubicacion del sitio uno',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('BBB','MON_CUER','ORI','S44TY7635G',sysdate,sysdate+30,1,'ubicacion del sitio dos',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('CCC','MON_CUER','TOL','UGSTY7885G',sysdate,sysdate+30,1,'ubicacion del sitio tres',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('DDD','MON_CUER','DF','LGSTY7635G',sysdate,sysdate+30,1,'ubicacion del sitio cuatro',2);

COMMIT;
