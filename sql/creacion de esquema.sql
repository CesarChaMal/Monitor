******************************************************************
CREACION DE USUARIO
conectarse con system
******************************************************************



-- CONNECT SYSTEM
 DROP USER MONITOR CASCADE;
 CREATE USER "MONITOR" IDENTIFIED BY monitor
      DEFAULT TABLESPACE "USERS"
      TEMPORARY TABLESPACE "TEMP";

GRANT UNLIMITED TABLESPACE TO "MONITOR";
GRANT CREATE SESSION TO "MONITOR";

 GRANT "CONNECT" TO "MONITOR";
 GRANT "RESOURCE" TO "MONITOR";

 ALTER USER "MONITOR" DEFAULT ROLE ALL;



******************************************************************
CREACION DE ESTRUCTURA
conectarse con monitor
******************************************************************


 CREATE TABLE "MONITOR"."CAMPANA" 
   (  "CVE_CAMPANA" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
  "NOMBRE" VARCHAR2(80 BYTE), 
  "FECHAALTA" DATE NOT NULL, 
  "STATUS" NUMBER(6,0), 
  "CVE_CLIPRO" VARCHAR2(10 BYTE) NOT NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
CREATE TABLE "MONITOR"."CLI_PRO" 
   (  "CVE_CLIPRO" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
  "NOMBRE" VARCHAR2(80 BYTE), 
  "TIPO" NUMBER(6,0) NOT NULL ENABLE, 
  "PADRE" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
CREATE TABLE "MONITOR"."FOTO" 
   (  "FECHA_HORA" DATE NOT NULL ENABLE, 
  "FOTO_PATH" VARCHAR2(100 BYTE), 
  "COMENTARIO" VARCHAR2(100 BYTE), 
  "LATITUD_GPS" FLOAT(126), 
  "LONGITUD_GPS" FLOAT(126), 
  "CALIFICACION" NUMBER(6,0), 
  "CVE_CAMPANA" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
  "CVE_CLIPRO" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
  "EMAIL" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
  "CVE_PLAZA" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
  "CVE_SITIO" VARCHAR2(20 BYTE) NOT NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
CREATE TABLE "MONITOR"."PLAZA" 
   (  "CVE_PLAZA" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
  "NOMBRE" VARCHAR2(80 BYTE), 
  "STATUS" NUMBER(6,0), 
  "PADRE" VARCHAR2(10 BYTE), 
  "TIPO" NUMBER(6,0), 
  "CVE_CLIPRO" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
CREATE TABLE "MONITOR"."SITIO" 
   (  "CVE_CAMPANA" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
  "INICIA" DATE, 
  "TERMINA" DATE, 
  "STATUS" NUMBER(6,0), 
  "CVE_CLIPRO" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
  "CVE_PLAZA" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
  "CVE_SITIO" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
  "UBICACION" VARCHAR2(200 BYTE), 
  "ILUMINACION" NUMBER(6,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE TABLE "MONITOR"."USUARIO" 
   (  "EMAIL" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
  "NOMBRE" VARCHAR2(50 BYTE), 
  "APELLIDOS" VARCHAR2(50 BYTE), 
  "CONTRASENA" VARCHAR2(10 BYTE), 
  "TIPO" NUMBER(6,0) NOT NULL ENABLE, 
  "FECHAALTA" DATE, 
  "STATUS" NUMBER(6,0), 
  "CVE_CLIPRO" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

 CREATE TABLE "MONITOR"."SOPORTE" 
   (  "ID_SOPORTE" NUMBER(6,0) NOT NULL ENABLE, 
  "DOCTO" BLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DOCTO") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

 -- new object type path: SCHEMA_EXPORT/TABLE/INDEX/INDEX
CREATE UNIQUE INDEX "MONITOR"."XPKCAMPANA" ON "MONITOR"."CAMPANA" ("CVE_CAMPANA", "CVE_CLIPRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" PARALLEL 1 ;

ALTER INDEX "MONITOR"."XPKCAMPANA" NOPARALLEL;
CREATE UNIQUE INDEX "MONITOR"."XPKCLI_PRO" ON "MONITOR"."CLI_PRO" ("CVE_CLIPRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" PARALLEL 1 ;

ALTER INDEX "MONITOR"."XPKCLI_PRO" NOPARALLEL;
CREATE UNIQUE INDEX "MONITOR"."XPKFOTO" ON "MONITOR"."FOTO" ("FECHA_HORA", "CVE_CAMPANA", "CVE_CLIPRO", "EMAIL", "CVE_PLAZA", "CVE_SITIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" PARALLEL 1 ;

ALTER INDEX "MONITOR"."XPKFOTO" NOPARALLEL;
CREATE UNIQUE INDEX "MONITOR"."XPKPLAZA" ON "MONITOR"."PLAZA" ("CVE_PLAZA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" PARALLEL 1 ;

ALTER INDEX "MONITOR"."XPKPLAZA" NOPARALLEL;
CREATE UNIQUE INDEX "MONITOR"."XPKSITIO" ON "MONITOR"."SITIO" ("CVE_CAMPANA", "CVE_CLIPRO", "CVE_PLAZA", "CVE_SITIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" PARALLEL 1 ;

ALTER INDEX "MONITOR"."XPKSITIO" NOPARALLEL;
CREATE UNIQUE INDEX "MONITOR"."XPKSOPORTE" ON "MONITOR"."SOPORTE" ("ID_SOPORTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" PARALLEL 1 ;

ALTER INDEX "MONITOR"."XPKSOPORTE" NOPARALLEL;
CREATE UNIQUE INDEX "MONITOR"."XPKUSUARIO" ON "MONITOR"."USUARIO" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" PARALLEL 1 ;

ALTER INDEX "MONITOR"."XPKUSUARIO" NOPARALLEL;
-- new object type path: SCHEMA_EXPORT/TABLE/CONSTRAINT/CONSTRAINT
ALTER TABLE "MONITOR"."CAMPANA" ADD CONSTRAINT "XPKCAMPANA" PRIMARY KEY ("CVE_CAMPANA", "CVE_CLIPRO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;

ALTER TABLE "MONITOR"."CLI_PRO" ADD CONSTRAINT "XPKCLI_PRO" PRIMARY KEY ("CVE_CLIPRO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  
ALTER TABLE "MONITOR"."FOTO" ADD CONSTRAINT "XPKFOTO" PRIMARY KEY ("FECHA_HORA", "CVE_CAMPANA", "CVE_CLIPRO", "EMAIL", "CVE_PLAZA", "CVE_SITIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  
ALTER TABLE "MONITOR"."PLAZA" ADD CONSTRAINT "XPKPLAZA" PRIMARY KEY ("CVE_PLAZA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  
ALTER TABLE "MONITOR"."SITIO" ADD CONSTRAINT "XPKSITIO" PRIMARY KEY ("CVE_CAMPANA", "CVE_CLIPRO", "CVE_PLAZA", "CVE_SITIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  
ALTER TABLE "MONITOR"."SOPORTE" ADD CONSTRAINT "XPKSOPORTE" PRIMARY KEY ("ID_SOPORTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  
ALTER TABLE "MONITOR"."USUARIO" ADD CONSTRAINT "XPKUSUARIO" PRIMARY KEY ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  
-- new object type path: SCHEMA_EXPORT/TABLE/CONSTRAINT/REF_CONSTRAINT
ALTER TABLE "MONITOR"."FOTO" ADD CONSTRAINT "R_13" FOREIGN KEY ("CVE_CAMPANA", "CVE_CLIPRO", "CVE_PLAZA", "CVE_SITIO")
    REFERENCES "MONITOR"."SITIO" ("CVE_CAMPANA", "CVE_CLIPRO", "CVE_PLAZA", "CVE_SITIO") ENABLE;
    
ALTER TABLE "MONITOR"."FOTO" ADD CONSTRAINT "R_14" FOREIGN KEY ("EMAIL")
    REFERENCES "MONITOR"."USUARIO" ("EMAIL") ENABLE;
    
ALTER TABLE "MONITOR"."SITIO" ADD CONSTRAINT "R_2" FOREIGN KEY ("CVE_CAMPANA", "CVE_CLIPRO")
    REFERENCES "MONITOR"."CAMPANA" ("CVE_CAMPANA", "CVE_CLIPRO") ENABLE;
    
ALTER TABLE "MONITOR"."SITIO" ADD CONSTRAINT "R_17" FOREIGN KEY ("CVE_PLAZA")
    REFERENCES "MONITOR"."PLAZA" ("CVE_PLAZA") ENABLE;
    
ALTER TABLE "MONITOR"."USUARIO" ADD CONSTRAINT "R_16" FOREIGN KEY ("CVE_CLIPRO")
    REFERENCES "MONITOR"."CLI_PRO" ("CVE_CLIPRO") ON DELETE SET NULL ENABLE;
    
-- new object type path: SCHEMA_EXPORT/TABLE/TRIGGER
CREATE TRIGGER "MONITOR"."TU_CAMPANA" AFTER UPDATE ON "MONITOR"."CAMPANA" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- UPDATE trigger on campana 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
  /* campana R/2 sitio on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000134fa", PARENT_OWNER="", PARENT_TABLE="campana"
    CHILD_OWNER="", CHILD_TABLE="sitio"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="cve_campana""cve_clipro" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cve_campana <> :new.cve_campana OR 
    :old.cve_clipro <> :new.cve_clipro
  THEN
    SELECT count(*) INTO NUMROWS
      FROM sitio
      WHERE
        /*  %JoinFKPK(sitio,:%Old," = "," AND") */
        sitio.cve_campana = :old.cve_campana AND
        sitio.cve_clipro = :old.cve_clipro;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update campana because sitio exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TU_CAMPANA" ENABLE;

ALTER TRIGGER "MONITOR"."TU_CAMPANA" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TD_CLI_PRO" AFTER DELETE ON "MONITOR"."CLI_PRO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- DELETE trigger on cli_pro 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* cli_pro R/16 usuario on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000c1f5", PARENT_OWNER="", PARENT_TABLE="cli_pro"
    CHILD_OWNER="", CHILD_TABLE="usuario"
    P2C_VERB_PHRASE="R/16", C2P_VERB_PHRASE="R/16", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="cve_clipro" */
    UPDATE usuario
      SET
        /* %SetFK(usuario,NULL) */
        usuario.cve_clipro = NULL
      WHERE
        /* %JoinFKPK(usuario,:%Old," = "," AND") */
        usuario.cve_clipro = :old.cve_clipro;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TD_CLI_PRO" ENABLE;

ALTER TRIGGER "MONITOR"."TD_CLI_PRO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TD_CAMPANA" AFTER DELETE ON "MONITOR"."CAMPANA" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- DELETE trigger on campana 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* campana R/2 sitio on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f268", PARENT_OWNER="", PARENT_TABLE="campana"
    CHILD_OWNER="", CHILD_TABLE="sitio"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="cve_campana""cve_clipro" */
    SELECT count(*) INTO NUMROWS
      FROM sitio
      WHERE
        /*  %JoinFKPK(sitio,:%Old," = "," AND") */
        sitio.cve_campana = :old.cve_campana AND
        sitio.cve_clipro = :old.cve_clipro;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete campana because sitio exists.'
      );
    END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TD_CAMPANA" ENABLE;

ALTER TRIGGER "MONITOR"."TD_CAMPANA" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TU_CLI_PRO" AFTER UPDATE ON "MONITOR"."CLIPRO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- UPDATE trigger on cli_pro 
DECLARE NUMROWS INTEGER;
BEGIN
  /* cli_pro R/16 usuario on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000ecd4", PARENT_OWNER="", PARENT_TABLE="cli_pro"
    CHILD_OWNER="", CHILD_TABLE="usuario"
    P2C_VERB_PHRASE="R/16", C2P_VERB_PHRASE="R/16", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="cve_clipro" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cve_clipro <> :new.cve_clipro
  THEN
    UPDATE usuario
      SET
        /* %SetFK(usuario,NULL) */
        usuario.cve_clipro = NULL
      WHERE
        /* %JoinFKPK(usuario,:%Old," = ",",") */
        usuario.cve_clipro = :old.cve_clipro;
  END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TU_CLI_PRO" ENABLE;

ALTER TRIGGER "MONITOR"."TU_CLI_PRO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TI_FOTO" BEFORE INSERT ON "MONITOR"."FOTO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- INSERT trigger on foto 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* sitio R/13 foto on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0002417d", PARENT_OWNER="", PARENT_TABLE="sitio"
    CHILD_OWNER="", CHILD_TABLE="foto"
    P2C_VERB_PHRASE="R/13", C2P_VERB_PHRASE="R/13", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="cve_campana""cve_plaza""cve_clipro""cve_sitio" */
    SELECT count(*) INTO NUMROWS
      FROM sitio
      WHERE
        /* %JoinFKPK(:%New,sitio," = "," AND") */
        :new.cve_campana = sitio.cve_campana AND
        :new.cve_clipro = sitio.cve_clipro AND
        :new.cve_plaza = sitio.cve_plaza AND
        :new.cve_sitio = sitio.cve_sitio;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert foto because sitio does not exist.'
      );
    END IF;

    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* usuario R/14 foto on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="usuario"
    CHILD_OWNER="", CHILD_TABLE="foto"
    P2C_VERB_PHRASE="R/14", C2P_VERB_PHRASE="R/14", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="email" */
    SELECT count(*) INTO NUMROWS
      FROM usuario
      WHERE
        /* %JoinFKPK(:%New,usuario," = "," AND") */
        :new.email = usuario.email;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert foto because usuario does not exist.'
      );
    END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TI_FOTO" ENABLE;

ALTER TRIGGER "MONITOR"."TI_FOTO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TU_FOTO" AFTER UPDATE ON "MONITOR"."FOTO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- UPDATE trigger on foto 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
  /* sitio R/13 foto on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00023923", PARENT_OWNER="", PARENT_TABLE="sitio"
    CHILD_OWNER="", CHILD_TABLE="foto"
    P2C_VERB_PHRASE="R/13", C2P_VERB_PHRASE="R/13", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="cve_campana""cve_plaza""cve_sitio""cve_clipro" */
  SELECT count(*) INTO NUMROWS
    FROM sitio
    WHERE
      /* %JoinFKPK(:%New,sitio," = "," AND") */
      :new.cve_campana = sitio.cve_campana AND
      :new.cve_clipro = sitio.cve_clipro AND
      :new.cve_plaza = sitio.cve_plaza AND
      :new.cve_sitio = sitio.cve_sitio;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update foto because sitio does not exist.'
    );
  END IF;

  /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
  /* usuario R/14 foto on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="usuario"
    CHILD_OWNER="", CHILD_TABLE="foto"
    P2C_VERB_PHRASE="R/14", C2P_VERB_PHRASE="R/14", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="email" */
  SELECT count(*) INTO NUMROWS
    FROM usuario
    WHERE
      /* %JoinFKPK(:%New,usuario," = "," AND") */
      :new.email = usuario.email;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update foto because usuario does not exist.'
    );
  END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TU_FOTO" ENABLE;

ALTER TRIGGER "MONITOR"."TU_FOTO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TD_PLAZA" AFTER DELETE ON "MONITOR"."PLAZA" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- DELETE trigger on plaza 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* plaza R/17 sitio on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000d3bc", PARENT_OWNER="", PARENT_TABLE="plaza"
    CHILD_OWNER="", CHILD_TABLE="sitio"
    P2C_VERB_PHRASE="R/17", C2P_VERB_PHRASE="R/17", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="cve_plaza" */
    SELECT count(*) INTO NUMROWS
      FROM sitio
      WHERE
        /*  %JoinFKPK(sitio,:%Old," = "," AND") */
        sitio.cve_plaza = :old.cve_plaza;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete plaza because sitio exists.'
      );
    END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TD_PLAZA" ENABLE;

ALTER TRIGGER "MONITOR"."TD_PLAZA" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TU_PLAZA" AFTER UPDATE ON "MONITOR"."PLAZA" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- UPDATE trigger on plaza 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
  /* plaza R/17 sitio on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000fd6f", PARENT_OWNER="", PARENT_TABLE="plaza"
    CHILD_OWNER="", CHILD_TABLE="sitio"
    P2C_VERB_PHRASE="R/17", C2P_VERB_PHRASE="R/17", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="cve_plaza" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cve_plaza <> :new.cve_plaza
  THEN
    SELECT count(*) INTO NUMROWS
      FROM sitio
      WHERE
        /*  %JoinFKPK(sitio,:%Old," = "," AND") */
        sitio.cve_plaza = :old.cve_plaza;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update plaza because sitio exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TU_PLAZA" ENABLE;

ALTER TRIGGER "MONITOR"."TU_PLAZA" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TI_SITIO" BEFORE INSERT ON "MONITOR"."SITIO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- INSERT trigger on sitio 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* campana R/2 sitio on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00020110", PARENT_OWNER="", PARENT_TABLE="campana"
    CHILD_OWNER="", CHILD_TABLE="sitio"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="cve_campana""cve_clipro" */
    SELECT count(*) INTO NUMROWS
      FROM campana
      WHERE
        /* %JoinFKPK(:%New,campana," = "," AND") */
        :new.cve_campana = campana.cve_campana AND
        :new.cve_clipro = campana.cve_clipro;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert sitio because campana does not exist.'
      );
    END IF;

    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* plaza R/17 sitio on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="plaza"
    CHILD_OWNER="", CHILD_TABLE="sitio"
    P2C_VERB_PHRASE="R/17", C2P_VERB_PHRASE="R/17", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="cve_plaza" */
    SELECT count(*) INTO NUMROWS
      FROM plaza
      WHERE
        /* %JoinFKPK(:%New,plaza," = "," AND") */
        :new.cve_plaza = plaza.cve_plaza;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert sitio because plaza does not exist.'
      );
    END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TI_SITIO" ENABLE;

ALTER TRIGGER "MONITOR"."TI_SITIO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TD_SITIO" AFTER DELETE ON "MONITOR"."SITIO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- DELETE trigger on sitio 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* sitio R/13 foto on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00011659", PARENT_OWNER="", PARENT_TABLE="sitio"
    CHILD_OWNER="", CHILD_TABLE="foto"
    P2C_VERB_PHRASE="R/13", C2P_VERB_PHRASE="R/13", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="cve_campana""cve_plaza""cve_clipro""cve_sitio" */
    SELECT count(*) INTO NUMROWS
      FROM foto
      WHERE
        /*  %JoinFKPK(foto,:%Old," = "," AND") */
        foto.cve_campana = :old.cve_campana AND
        foto.cve_clipro = :old.cve_clipro AND
        foto.cve_plaza = :old.cve_plaza AND
        foto.cve_sitio = :old.cve_sitio;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete sitio because foto exists.'
      );
    END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TD_SITIO" ENABLE;

ALTER TRIGGER "MONITOR"."TD_SITIO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TU_SITIO" AFTER UPDATE ON "MONITOR"."SITIO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- UPDATE trigger on sitio 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
  /* sitio R/13 foto on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00039867", PARENT_OWNER="", PARENT_TABLE="sitio"
    CHILD_OWNER="", CHILD_TABLE="foto"
    P2C_VERB_PHRASE="R/13", C2P_VERB_PHRASE="R/13", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="cve_campana""cve_plaza""cve_clipro""cve_sitio" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cve_campana <> :new.cve_campana OR 
    :old.cve_clipro <> :new.cve_clipro OR 
    :old.cve_plaza <> :new.cve_plaza OR 
    :old.cve_sitio <> :new.cve_sitio
  THEN
    SELECT count(*) INTO NUMROWS
      FROM foto
      WHERE
        /*  %JoinFKPK(foto,:%Old," = "," AND") */
        foto.cve_campana = :old.cve_campana AND
        foto.cve_clipro = :old.cve_clipro AND
        foto.cve_plaza = :old.cve_plaza AND
        foto.cve_sitio = :old.cve_sitio;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update sitio because foto exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
  /* campana R/2 sitio on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="campana"
    CHILD_OWNER="", CHILD_TABLE="sitio"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="cve_campana""cve_clipro" */
  SELECT count(*) INTO NUMROWS
    FROM campana
    WHERE
      /* %JoinFKPK(:%New,campana," = "," AND") */
      :new.cve_campana = campana.cve_campana AND
      :new.cve_clipro = campana.cve_clipro;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update sitio because campana does not exist.'
    );
  END IF;

  /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
  /* plaza R/17 sitio on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="plaza"
    CHILD_OWNER="", CHILD_TABLE="sitio"
    P2C_VERB_PHRASE="R/17", C2P_VERB_PHRASE="R/17", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="cve_plaza" */
  SELECT count(*) INTO NUMROWS
    FROM plaza
    WHERE
      /* %JoinFKPK(:%New,plaza," = "," AND") */
      :new.cve_plaza = plaza.cve_plaza;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update sitio because plaza does not exist.'
    );
  END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TU_SITIO" ENABLE;

ALTER TRIGGER "MONITOR"."TU_SITIO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TI_USUARIO" BEFORE INSERT ON "MONITOR"."USUARIO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- INSERT trigger on usuario 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* cli_pro R/16 usuario on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000f791", PARENT_OWNER="", PARENT_TABLE="cli_pro"
    CHILD_OWNER="", CHILD_TABLE="usuario"
    P2C_VERB_PHRASE="R/16", C2P_VERB_PHRASE="R/16", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="cve_clipro" */
    UPDATE usuario
      SET
        /* %SetFK(usuario,NULL) */
        usuario.cve_clipro = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM cli_pro
            WHERE
              /* %JoinFKPK(:%New,cli_pro," = "," AND") */
              :new.cve_clipro = cli_pro.cve_clipro
        ) 
        /* %JoinPKPK(usuario,:%New," = "," AND") */
         and usuario.email = :new.email;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TI_USUARIO" ENABLE;

ALTER TRIGGER "MONITOR"."TI_USUARIO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TD_USUARIO" AFTER DELETE ON "MONITOR"."USUARIO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- DELETE trigger on usuario 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* usuario R/14 foto on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000dacb", PARENT_OWNER="", PARENT_TABLE="usuario"
    CHILD_OWNER="", CHILD_TABLE="foto"
    P2C_VERB_PHRASE="R/14", C2P_VERB_PHRASE="R/14", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="email" */
    SELECT count(*) INTO NUMROWS
      FROM foto
      WHERE
        /*  %JoinFKPK(foto,:%Old," = "," AND") */
        foto.email = :old.email;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete usuario because foto exists.'
      );
    END IF;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TD_USUARIO" ENABLE;

ALTER TRIGGER "MONITOR"."TD_USUARIO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;
CREATE TRIGGER "MONITOR"."TU_USUARIO" AFTER UPDATE ON "MONITOR"."USUARIO" for each row
-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
-- UPDATE trigger on usuario 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
  /* usuario R/14 foto on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000207cc", PARENT_OWNER="", PARENT_TABLE="usuario"
    CHILD_OWNER="", CHILD_TABLE="foto"
    P2C_VERB_PHRASE="R/14", C2P_VERB_PHRASE="R/14", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="email" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.email <> :new.email
  THEN
    SELECT count(*) INTO NUMROWS
      FROM foto
      WHERE
        /*  %JoinFKPK(foto,:%Old," = "," AND") */
        foto.email = :old.email;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update usuario because foto exists.'
      );
    END IF;
  END IF;

    /* ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m. */
    /* cli_pro R/16 usuario on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="cli_pro"
    CHILD_OWNER="", CHILD_TABLE="usuario"
    P2C_VERB_PHRASE="R/16", C2P_VERB_PHRASE="R/16", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="cve_clipro" */
    UPDATE usuario
      SET
        /* %SetFK(usuario,NULL) */
        usuario.cve_clipro = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM cli_pro
            WHERE
              /* %JoinFKPK(:%New,cli_pro," = "," AND") */
              :new.cve_clipro = cli_pro.cve_clipro
        ) 
        /* %JoinPKPK(usuario,:%New," = "," AND") */
         and usuario.email = :new.email;


-- ERwin Builtin martes, 20 de junio de 2017 01:04:36 a.m.
END;

/

ALTER TRIGGER "MONITOR"."TU_USUARIO" ENABLE;

ALTER TRIGGER "MONITOR"."TU_USUARIO" 
  COMPILE 
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'
;




SELECT * FROM monitor.USUARIO;
SELECT * FROM monitor.CLI_PRO;
SELECT * FROM monitor.CAMPANA ORDER BY FECHAALTA ASC;
SELECT * FROM monitor.PLAZA;
SELECT * FROM monitor.SITIO;
SELECT * FROM monitor.FOTO

SELECT 
	email, nombre, apellidos, contrasena, tipo, fechaalta, status, cve_clipro 
FROM 
	monitor.usuario
	
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
	WHERE LOWER(ccl.CVE_CLIPRO) LIKE LOWER('GIM%')
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
	
	
	