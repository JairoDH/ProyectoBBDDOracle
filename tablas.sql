CREATE TABLE CAMION(
    matricula varchar2(7),
    fecha_alta date,
    peso_maximo number(7,2) NOT NULL,

CONSTRAINT cp_matricula PRIMARY KEY(matricula),
CONSTRAINT ch_matri CHECK (REGEXP_LIKE(matricula, '[0-9]{4}[A-Z][A-Z][A-Z]')),
CONSTRAINT ch_fechalta CHECK (fecha_alta <= to_date('2020-01-01', 'yyyy-mm-dd'))
);

CREATE TABLE CAMION_CONDUCTOR(
    matricula_camion varchar2(7),
    codigo_conductor number(5),
    fecha date,
CONSTRAINT ca_matricami FOREIGN KEY (matricula_camion) references CAMION(matricula),
CONSTRAINT ca_codicondu FOREIGN KEY (codigo_conductor) references CONDUCTOR(codigo)
);

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
    telefono varchar2(9) NOT NULL,
 CONSTRAINT cp_codi PRIMARY KEY (codigo),
    CONSTRAINT un_dni UNIQUE (DNI),
    CONSTRAINT ch_dni CHECK (REGEXP_LIKE (DNI, '[0-9]{8}[A-Z]')),
    CONSTRAINT ch_tele CHECK (REGEXP_LIKE (telefono, '^[679][0-9]{8}$')),
    CONSTRAINT ch_nom CHECK (nombre = UPPER (nombre)))
);
