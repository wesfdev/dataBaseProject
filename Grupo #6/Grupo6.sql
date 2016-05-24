/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     9/04/2016 12:57:54 a. m.                     */
/*==============================================================*/


/*==============================================================*/
/* TABLE: LABORATORIOS_TIPO                                     */
/*==============================================================*/
CREATE TABLE LABORATORIOS_TIPO 
(
   IDLABOTIPO INT PRIMARY KEY,
   DSLABOTIPO VARCHAR2(100) NOT NULL   
);

/*==============================================================*/
/* SECUENCIA: LABORATORIOS_TIPO                                 */
/*==============================================================*/
CREATE SEQUENCE LABOTIPO
START WITH 1 /*PARAMETRO DE INICIO*/
INCREMENT BY 1; /*SECUENCIA DE INCREMENTO*/

/*==============================================================*/
/* TABLE: PRECIO_LABORATORIOS                                   */
/*==============================================================*/
CREATE TABLE PRECIO_LABORATORIOS 
(
   IDPRECIOLABO INT PRIMARY KEY,
   IDLABOCABE INT,
   FECHAPRECIOLABO DATE,
   VALOR FLOAT(10),
   ACTIVO SMALLINT
);

/*==============================================================*/
/* SECUENCIA: PRECIO_LABORATORIOS                               */
/*==============================================================*/
CREATE SEQUENCE PRECIOLABO
START WITH 1
INCREMENT BY 1;

/*==============================================================*/
/* TABLE: LABORATORIOS_RESUL                                    */
/*==============================================================*/
CREATE TABLE LABORATORIOS_RESUL
(
  IDLABORESUL INT PRIMARY KEY,
  DSLABORESUL VARCHAR2(100)
);

/*==============================================================*/
/* SECUENCIA: LABORATORIOS_RESUL                                */
/*==============================================================*/
CREATE SEQUENCE LABORESUL
START WITH 1
INCREMENT BY 1;

/*==============================================================*/
/* TABLE: LABORATORIOS_REQUISITOS                               */
/*==============================================================*/
CREATE TABLE LABORATORIOS_REQUISITOS
(
   IDLABOREQUI INT PRIMARY KEY,
   DSLABOREQUI VARCHAR2(100)
);

/*==============================================================*/
/* SECUENCIA: LABORATORIOS_REQUISITOS                           */
/*==============================================================*/
CREATE SEQUENCE REQUILABO
START WITH 1
INCREMENT BY 1;

/*==============================================================*/
/* TABLE: LABORATORIOS_CABE                                     */
/*==============================================================*/
CREATE TABLE LABORATORIOS_CABE
(
   IDLABOCABE INT PRIMARY KEY,
   IDLABOTIPO INT,
   DSLABOCABE VARCHAR2(40),
   FECHALABOCABE DATE,
   ACTIVO SMALLINT,
   CONSTRAINT FK_LABORATO_REF_LAB_C_LABORATO FOREIGN KEY (IDLABOTIPO)
   REFERENCES LABORATORIOS_TIPO (IDLABOTIPO)
);

/*==============================================================*/
/* SECUENCIA: LABORATORIOS_CABE                                 */
/*==============================================================*/
CREATE SEQUENCE LABOCABE
START WITH 1
INCREMENT BY 1 ; 

/*==============================================================*/
/* TABLE: LABORATORIOS_DETA                                     */
/*==============================================================*/
CREATE TABLE LABORATORIOS_DETA
(
   IDLABODETA INT PRIMARY KEY,
   IDLABOCABE INT NOT NULL,
   IDLABOREQUI INT NOT NULL,
  CONSTRAINT FK_LABORATO_REF_LAB_D_LABORATO FOREIGN KEY(IDLABOCABE)
  REFERENCES LABORATORIOS_CABE(IDLABOCABE),
  CONSTRAINT FK_LABORATO_REF_LABDE_LABORATO FOREIGN KEY(IDLABOREQUI)
  REFERENCES LABORATORIOS_REQUISITOS(IDLABOREQUI)
);

/*==============================================================*/
/* SECUENCIA: LABORATORIOS_DETA                                 */
/*==============================================================*/
CREATE SEQUENCE LABODETA
START WITH 1
INCREMENT BY 1;

/*==============================================================*/
/* TABLE: LABORATORIOS_RESUL_DETA                               */
/*==============================================================*/
CREATE TABLE LABORATORIOS_RESUL_DETA
(
  IDLABORERESULDETA INT PRIMARY KEY,
  IDLABOCABE INT NOT NULL,
  IDLABORESUL INT NOT NULL,
  CONSTRAINT FK_LABORATO_REF_LABRE_LABORATO FOREIGN KEY(IDLABOCABE) 
  REFERENCES LABORATORIOS_CABE(IDLABOCABE),
  CONSTRAINT FK_LABORATO_REF_LAB2__LABORATO FOREIGN KEY(IDLABORESUL)
  REFERENCES LABORATORIOS_RESUL (IDLABORESUL)
);

/*==============================================================*/
/* SECUENCIA: LABORATORIOS_RESUL_DETA                           */
/*==============================================================*/
CREATE SEQUENCE LABORESULDETA
START WITH 1
INCREMENT BY 1;


/*==============================================================*/
/* TABLE: ORDEN_LABORATORIO                                     */
/*==============================================================*/
CREATE TABLE ORDEN_LABORATORIOS
(
  IDORDEN INT PRIMARY KEY,  
  IDLABOCABE INT NOT NULL,
  IDPACIENTE INT NOT NULL,
  FECHAORDEN DATE,
  CONSTRAINT FK_ORDEN_LA_REF_ORDEN_LABORATO FOREIGN KEY(IDLABOCABE)
  REFERENCES LABORATORIOS_CABE (IDLABOCABE)
);

/*==============================================================*/
/* SECUENCIA: ORDEN_LABORATORIOS                                */
/*==============================================================*/
CREATE SEQUENCE ORDENLABO
START WITH 1
INCREMENT BY 1;

/*==============================================================*/
/* TABLE: LABORATORIO_RESULTADO_CABE                            */
/*==============================================================*/
CREATE TABLE LABORATORIOS_RESULTADO_CABE 
(
   IDRESULORDEN INT PRIMARY KEY,
   IDLABORESULDETA INT NOT NULL,
   IDORDEN INT NOT NULL,
   FECHALABORESULCABE DATE,
   CONSTRAINT FK_LABORATO_REF_LAB_R_LABORATO FOREIGN KEY(IDLABORESULDETA)
   REFERENCES LABORATORIOS_RESUL_DETA(IDLABORESULDETA),
  CONSTRAINT FK_LABORATO_REF_LAB_R_ORDEN_LA FOREIGN KEY(IDORDEN)
  REFERENCES ORDEN_LABORATORIOS(IDORDEN)
);

/*==============================================================*/
/* SECUENCIA: LABORATORIOS_RESULTADO_CABE                       */
/*==============================================================*/
CREATE SEQUENCE LABORESULTADOCABE
START WITH 1
INCREMENT BY 1;

/*==============================================================*/
/* TABLE: LABORATORIOS_RESULTADO_DETA                           */
/*==============================================================*/
CREATE TABLE LABORATORIOS_RESULTADO_DETA 
(
   IDRESULORDENDETA INT PRIMARY KEY,
   IDRESULORDEN INT NOT NULL,
   VALOR VARCHAR2(100),
   CONSTRAINT FK_LABORATO_REF_LAB1__LABORATO FOREIGN KEY(IDRESULORDEN)
   REFERENCES LABORATORIOS_RESULTADO_CABE (IDRESULORDEN)
);
 
/*==============================================================*/
/* SECUENCIA: LABORATORIOS_RESULTADO_DETA                       */
/*==============================================================*/
CREATE SEQUENCE LABORESULTADODETA
START WITH 1
INCREMENT BY 1;

