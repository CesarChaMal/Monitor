
-----------------------------------------------------------------
-- CARGA DE DATOS
-- conectarse con MONITOR/monitor
-----------------------------------------------------------------

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
values ('ces_ch@hotmail.com','Cesar Francisco','Chavez Maldonado', 'ba286129', 2,sysdate,1,'GIM');




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
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('AAA','BLACK CUERVO ESPECIAL',sysdate,sysdate,sysdate+30,1,'MON_CUER');
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('BBB','PLATINO CUERVO',sysdate,sysdate+30,sysdate,1,'MON_CUER');
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('CCC','AMIGOS CUERVO',sysdate,sysdate+30,sysdate,1,'MON_CUER');
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('DDD','CUERVO NUEVO',sysdate,sysdate+30,sysdate,2,'MON_CUER');
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('EEE','CUERVO NUEVO2',sysdate,sysdate+30,sysdate,2,'MON_CUER');
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('FFF','CUERVO NUEVO3',sysdate,sysdate+30,sysdate,2,'GIM');
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('GGG','CUERVO NUEVO4',sysdate,sysdate+30,sysdate,2,'GIM');


insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('SIN','COCA SIN AZUCAR',sysdate,sysdate,sysdate+30,1,'GIM_FEMSA');
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('PRO','LALA PROTEINA',sysdate,sysdate,sysdate+30,1,'GIM_LALA');
insert into monitor.campana(cve_campana,nombre,fechaalta,inicia,termina,status,cve_clipro) values ('CLA','COCACOLA CLASICA',sysdate,sysdate,sysdate+30,2,'GIM_FEMSA');



--sitio
insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('PRO','GIM_LALA','CAB','GGSTY7635G',sysdate,sysdate+30,1,'ubicacion del sitio uno',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('BBB','MON_CUER','ORI','S44TY7635G',sysdate,sysdate+30,1,'ubicacion del sitio dos',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('CCC','MON_CUER','TOL','UGSTY7885G',sysdate,sysdate+30,1,'ubicacion del sitio tres',1);


insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('DDD','MON_CUER','DF','LGSTY7635G',sysdate,sysdate+30,1,'ubicacion del sitio cuatro',2);

insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('EEE','MON_CUER','DF','LGSTY7635H',sysdate,sysdate+30,1,'ubicacion del sitio cinco',2);

insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('FFF','GIM','DF','LGSTY7635I',sysdate,sysdate+30,1,'ubicacion del sitio sexto',2);

insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('GGG','GIM','MER','LGSTY7635J',sysdate,sysdate+30,1,'ubicacion del sitio septimo',2);

insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('PRO','GIM_LALA','MER','LGSTY7635K',sysdate,sysdate+30,1,'ubicacion del sitio octavo',2);

insert into monitor.sitio (cve_campana,cve_clipro,cve_plaza,cve_sitio,inicia,termina,status,ubicacion,iluminacion)
values ('PRO','GIM_LALA','MER','LGSTY7635L',sysdate,sysdate+30,1,'ubicacion del sitio noveno',2);

COMMIT;






SELECT * FROM monitor.USUARIO;
SELECT * FROM monitor.CLI_PRO;
SELECT * FROM monitor.CAMPANA ORDER BY FECHAALTA ASC;
SELECT * FROM monitor.PLAZA;
SELECT * FROM monitor.SITIO;
SELECT * FROM monitor.FOTO;

SELECT 
	email, nombre, apellidos, contrasena, tipo, fechaalta, status, cve_clipro 
FROM 
	monitor.usuario;
	
SELECT  
	cl.CVE_CLIPRO,
	cl.NOMBRE,
	s.CVE_SITIO,
	s.UBICACION,
	s.CVE_PLAZA,
	c.CVE_CAMPANA,
	c.NOMBRE
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = cl.CVE_CLIPRO
INNER JOIN 
	monitor.CAMPANA c
ON 
	s.CVE_CAMPANA = c.CVE_CAMPANA;

SELECT  
	cl.CVE_CLIPRO,
	cl.NOMBRE,
	s.CVE_SITIO,
	s.UBICACION,
	s.CVE_CAMPANA,
	p.CVE_PLAZA,
	p.NOMBRE
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = cl.CVE_CLIPRO
INNER JOIN 
	monitor.PLAZA p
ON 
	s.CVE_PLAZA = p.CVE_PLAZA;

SELECT  
	cl.CVE_CLIPRO,
	cl.NOMBRE,
	s.CVE_SITIO,
	s.UBICACION,
	c.CVE_CAMPANA,
	c.NOMBRE,
	p.CVE_PLAZA,
	p.NOMBRE
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA; 

	
	
-- Plazas children	
SELECT  
	cl.CVE_CLIPRO,
	cl.NOMBRE,
	s.CVE_SITIO,
	s.UBICACION,
	c.CVE_CAMPANA,
	c.NOMBRE,
	p.CVE_PLAZA,
	p.NOMBRE,
	p.PADRE,
	pp.NOMBRE
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA 
INNER JOIN 
	monitor.PLAZA pp
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.PADRE = pp.CVE_PLAZA; 
	
	
-- Todas las Plazas que cumplen la relacion con las otras tablas incluyendo padre si tienen	
SELECT  
	cl.CVE_CLIPRO,
	cl.NOMBRE,
	s.CVE_SITIO,
	s.UBICACION,
	c.CVE_CAMPANA,
	c.NOMBRE,
	p.CVE_PLAZA,
	p.NOMBRE,
	p.PADRE,
	pp.NOMBRE
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA 
LEFT OUTER JOIN 
	monitor.PLAZA pp
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.PADRE = pp.CVE_PLAZA; 

-- Todas las Plazas de la tabla plazas incluyendo padre si tienen	
SELECT  
	cl.CVE_CLIPRO,
	cl.NOMBRE,
	s.CVE_SITIO,
	s.UBICACION,
	c.CVE_CAMPANA,
	c.NOMBRE,
	p.CVE_PLAZA,
	p.NOMBRE,
	pp.PADRE,
	pp.NOMBRE
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA 
RIGHT OUTER JOIN 
	monitor.PLAZA pp
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.PADRE = pp.CVE_PLAZA; 

	
-- Query monitor catalogo sitios	
SELECT  
	cl.CVE_CLIPRO,
	cl.NOMBRE,
	s.CVE_SITIO,
	s.UBICACION,
	s.ILUMINACION,
	s.STATUS,
	c.CVE_CAMPANA,
	c.NOMBRE,
	p.CVE_PLAZA,
	p.NOMBRE
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
ORDER BY
	s.CVE_SITIO; 
	
-- Query monitor app catalog sitios tree group by por campaña	
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
--	c.CVE_CAMPANA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
--	s.CVE_SITIO,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	c.CVE_CAMPANA, s.CVE_SITIO 
ORDER BY
	MAX(s.CVE_SITIO);
	
	
-- Query monitor app catalog sitios tree group by por plaza	
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
	p.CVE_PLAZA,
--	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
--	s.CVE_SITIO,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	p.CVE_PLAZA, s.CVE_SITIO
ORDER BY
	MAX(s.CVE_SITIO);
	

-- union all to compare the two queries result	
SELECT
	t.*
FROM
(	
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
--	c.CVE_CAMPANA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	c.CVE_CAMPANA, s.CVE_SITIO 
	
UNION ALL		

SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
--	p.CVE_PLAZA,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	p.CVE_PLAZA, s.CVE_SITIO 
) t
ORDER BY t.CVE_SITIO;


-- with roll up by plaza and showing number of plazas
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
--	p.CVE_PLAZA,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	ROLLUP (p.CVE_PLAZA), s.CVE_SITIO
ORDER BY
	MAX(s.CVE_SITIO);



-- with roll up and cube by plaza and cliente and showing number of plazas and clientes
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
--	p.CVE_PLAZA,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	monitor.CLI_PRO cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	ROLLUP (cl.CVE_CLIPRO), CUBE(p.CVE_PLAZA)
ORDER BY
	MAX(s.CVE_SITIO);


-- Query monitor app catalog sitios tree group by por plaza for specific client	
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
--	c.CVE_CAMPANA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	(SELECT ccl.CVE_CLIPRO, ccl.NOMBRE FROM monitor.CLI_PRO ccl
--	WHERE ccl.CVE_CLIPRO = 'MON_CUER'
--	WHERE ccl.CVE_CLIPRO = 'GIM'
	) cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	p.CVE_PLAZA, s.CVE_SITIO
ORDER BY
	MAX(s.CVE_SITIO);

-- Query monitor app catalog sitios tree group by por campaña for specific client	
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
--	c.CVE_CAMPANA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	(SELECT ccl.CVE_CLIPRO, ccl.NOMBRE FROM monitor.CLI_PRO ccl
--	WHERE ccl.CVE_CLIPRO = 'MON_CUER'
--	WHERE ccl.CVE_CLIPRO = 'GIM'
	) cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	c.CVE_CAMPANA, s.CVE_SITIO
ORDER BY
	MAX(s.CVE_SITIO);
	
	
	
-- Query monitor app catalog sitios tree group by por plaza for specific client	including users
SELECT  
	MAX(s.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
	MAX(u.EMAIL) EMAIL,
	MAX(u.NOMBRE) USUARIO,
	MAX(s.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
--	c.CVE_CAMPANA,
	MAX(s.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	(SELECT ccl.CVE_CLIPRO, ccl.NOMBRE FROM monitor.CLI_PRO ccl
-- 	WHERE ccl.CVE_CLIPRO LIKE 'MON_CUER'
 	WHERE ccl.CVE_CLIPRO LIKE 'GIM'
	) cl
INNER JOIN 
	(SELECT uu.EMAIL, uu.NOMBRE, uu.CVE_CLIPRO FROM monitor.USUARIO uu
	WHERE uu.EMAIL LIKE 'ces_ch@hotmail.com'
	) u
ON 
	u.CVE_CLIPRO = cl.CVE_CLIPRO
INNER JOIN 
	monitor.CAMPANA c
ON 
	c.CVE_CLIPRO = cl.CVE_CLIPRO 
INNER JOIN 
	monitor.PLAZA p
ON 
	p.CVE_CLIPRO = cl.CVE_CLIPRO 
RIGHT OUTER JOIN
-- INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = cl.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA AND 
	s.CVE_PLAZA = p.CVE_PLAZA 
GROUP BY 
	c.CVE_CAMPANA, s.CVE_SITIO
ORDER BY
	MAX(s.CVE_SITIO);
	
	
------------------------------------------------------------------------------	

-- Query monitor catalogo sitios	
SELECT  
	cl.CVE_CLIPRO,
	cl.NOMBRE,
	s.CVE_SITIO,
	s.UBICACION,
	s.ILUMINACION,
	s.STATUS,
	c.CVE_CAMPANA,
	c.NOMBRE,
	p.CVE_PLAZA,
	p.NOMBRE
FROM 
	(SELECT ccl.CVE_CLIPRO, ccl.NOMBRE FROM monitor.CLI_PRO ccl
--	WHERE ccl.CVE_CLIPRO = 'MON_CUER'
--	WHERE ccl.CVE_CLIPRO = 'GIM'
	
--	WHERE LOWER(ccl.CVE_CLIPRO) LIKE LOWER('MON_CUER%')
--	WHERE LOWER(ccl.CVE_CLIPRO) LIKE LOWER('GIM%')
	) cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
ORDER BY
	s.CVE_SITIO; 

	
-- Query monitor app catalog sitios tree group by por plaza for specific client	
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
--	c.CVE_CAMPANA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	(SELECT ccl.CVE_CLIPRO, ccl.NOMBRE FROM monitor.CLI_PRO ccl
--	WHERE LOWER(ccl.CVE_CLIPRO) LIKE LOWER('MON_CUER%')
--	WHERE LOWER(ccl.CVE_CLIPRO) LIKE LOWER('GIM%')
	) cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	p.CVE_PLAZA, s.CVE_SITIO
ORDER BY
	MAX(s.CVE_SITIO);

-- Query monitor app catalog sitios tree group by por campaña for specific client	
SELECT  
	MAX(c.CVE_CLIPRO) CVE_CLIPRO,
	MAX(c.NOMBRE) CLIPRO,
	MAX(p.CVE_PLAZA) CVE_PLAZA,
	MAX(p.NOMBRE) PLAZA,
--	c.CVE_CAMPANA,
	MAX(c.CVE_CAMPANA) CVE_CAMPANA,
	MAX(c.NOMBRE) CAMPANA,
	MAX(s.CVE_SITIO) CVE_SITIO,
	COUNT(*) AS num_rows
FROM 
	(SELECT ccl.CVE_CLIPRO, ccl.NOMBRE FROM monitor.CLI_PRO ccl
--	WHERE LOWER(ccl.CVE_CLIPRO) LIKE LOWER('MON_CUER%')
--	WHERE LOWER(ccl.CVE_CLIPRO) LIKE LOWER('GIM%')
	) cl
INNER JOIN 
	monitor.CAMPANA c
ON 
	cl.CVE_CLIPRO = c.CVE_CLIPRO
INNER JOIN 
	monitor.SITIO s
ON 
	s.CVE_CLIPRO = c.CVE_CLIPRO AND 
	s.CVE_CAMPANA = c.CVE_CAMPANA 
INNER JOIN 
	monitor.PLAZA p
ON 
--	p.CVE_CLIPRO = s.CVE_CLIPRO AND 
	p.CVE_PLAZA = s.CVE_PLAZA
GROUP BY 
	c.CVE_CAMPANA, s.CVE_SITIO
ORDER BY
	MAX(s.CVE_SITIO);
