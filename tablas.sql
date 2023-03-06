CREATE TABLE CAMION(
    matricula varchar2(7),
    fecha_alta date,
    peso_maximo number(7,2) NOT NULL
);
ADD CONSTRAINT cp_matricula PRIMARY KEY(matricula)
ADD CONSTRAINT ch_matri CHECK (REGEXP_LIKE(matricula, '[0-9]{4}[A-Z][A-Z][A-Z]')) 
ADD CONSTRAINT ch_fechalta CHECK (TO_CHAR(fecha_alta,'YYYY-MM-DD') <= '2020-01-01')

CREATE TABLE CAMION_CONDUCTOR(
    matricula_camion varchar2(7),
    codigo_conductor number(5),
    fecha date
);
ADD CONSTRAINT ca_matricami FOREIGN KEY (matricula_camion) references CAMION(matricula)
ADD CONSTRAINT ca_codicondu FOREIGN KEY (codigo_conductor) references CONDUCTOR(codigo)

CREATE TABLE CONDUCTOR(
    codigo number(5),
    nombre varchar2(20),
    apellido1 varchar2(20),
    apellido2 varchar2(20),
    DNI varchar2(9) NOT NULL,
    calle varchar2(20),
    nº_calle number(5),
    provincia varchar2(10),
    poblacion varchar2(10),
    telefono varchar2(9) NOT NULL
);

ADD CONSTRAINT cp_codi PRIMARY KEY (codigo)
ADD CONSTRAINT un_dni UNIQUE (DNI)
ADD CONSTRAINT ch_dni CHECK (REGEXP_LIKE (DNI, '[0-9]{8}[A-Z]'))
ADD CONSTRAINT ch_tele check (REGEXP_LIKE (telefono, '^[679][0-9]{8}'))
ADD CONSTRAINT ch_nom check (nombre = UPPER (nombre))