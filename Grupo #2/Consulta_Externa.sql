CREATE TABLE HPTL.HPTL_CITAS (
		ID INTEGER NOT NULL,
		PACIENTES_ID INTEGER NOT NULL,
		CLILNICAS_ID INTEGER NOT NULL,
		DOCTORES_ID INTEGER NOT NULL,
		FECHA_CITA DATE,
		HORA_CITA TIME,
		CONSTRAINT HPTL_CITAS_PK PRIMARY KEY (ID),
		CONSTRAINT HPTL_PAC_PK_HTPL_CIT_FK FOREIGN KEY (PACIENTES_ID) REFERENCES HTPL.HPTL_PACIENTES(ID),
		CONSTRAINT HPTL_DOC_PK_HTPL_CIT_FK FOREIGN KEY (DOCTORES_ID) REFERENCES HTPL.HPTL_DOCTORES(ID),
		CONSTRAINT HPTL_CLI_PK_HTPL_CIT_FK FOREIGN KEY (CLINICAS_ID) REFERENCES HTPL.HPTL_CLINICAS(ID)
)

CREATE TABLE HPTL.HPTL_HIS_MEDICA_ENCA (
		ID INTEGER NOT NULL,
		PACIENTES_ID INTEGER NOT NULL,
		CONSTRAINT HPTL_HIS_MEDICA_ENCA_PK PRIMARY KEY (ID),
		CONSTRAINT HPTL_PAC_PK_HTPL_HIS_FK FOREIGN KEY (PACIENTES_ID) REFERENCES HPTL.HPTL_PACIENTES(ID)
)

CREATE TABLE HPTL.HPTL_HIS_MEDICA_DETA (
		ID INTEGER NOT NULL,
		HIS_ENC_ID INTEGER,
		OBSERVACIONES VARCHAR(50),
		ENFERMEDADES_ID INTEGER,
		CITAS_ID INTEGER,
		CONSTRAINT HPTL_HIS_MEDICA_DETA_PK PRIMARY KEY (ID),
		CONSTRAINT HPTL_HIS_PK_HPTL_HIS_FK FOREIGN KEY (HIS_ENC_ID) REFERENCES HPTL.HPTL_HIS_MEDICA_ENCA(ID),
		CONSTRAINT HPTL_ENF_PK_HPTL_HIS_FK FOREIGN KEY (ENFERMEDADES_ID) REFERENCES HPTL.HPTL_ENFERMEDADES(ID),
		CONSTRAINT HPTL_CIT_PK_HPTL_HIS_FK FOREIGN KEY (CITAS_ID) REFERENCES HPTL.HPTL_CITAS(ID)
)

CREATE TABLE HPTL.HPTL_RECETAS (
		ID INTEGER NOT NULL,
		HIS_DET_ID INTEGER,
		OBSERVACIONES VARCHAR(250),
		CONSTRAINT HPTL_RECETAS_PK PRIMARY KEY (ID),
		CONSTRAINT HPTL_HIS_PK_HPTL_REC_FK FOREIGN KEY (HIS_DET_ID) REFERENCES HPTL.HPTL_HIS_MEDICA_DETA(ID)
)

CREATE TABLE HPTL.HPTL_HIS_EXAMENES (
		EXAMENES_ID INTEGER NOT NULL,
		HIS_DET_ID INTEGER NOT NULL,
		CONSTRAINT HPTL_HIS_EXAMENES_PK PRIMARY KEY (EXAMENES_ID,HIS_DET_ID),
		CONSTRAINT HPTL_EXA_PK_HPTL_HIS_EXA_FK FOREIGN KEY (EXAMENES_ID) REFERENCES HPTL.HPTL_EXAMENES,
		CONSTRAINT HPTL_HIS_PK_HPTL_HIS_EXA_FK FOREIGN KEY (HIS_DET_ID) REFERENCES HPTL.HPTL_HIS_MEDICA_DETA
);