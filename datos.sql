INSERT INTO CAMION (matricula, fecha_alta, peso_maximo) VALUES('1849JRH','2020-03-05',17000);
INSERT INTO CAMION (matricula, fecha_alta, peso_maximo) VALUES('7439JRR','2021-08-14',29000);
INSERT INTO CAMION (matricula, fecha_alta, peso_maximo) VALUES('8546EAP','2020-07-21',17000);
INSERT INTO CAMION (matricula, fecha_alta, peso_maximo) VALUES('8459LPH','2020-06-25',11000);
INSERT INTO CAMION (matricula, fecha_alta, peso_maximo) VALUES('3538CGT','2022-06-12',30000);
INSERT INTO CAMION (matricula, fecha_alta, peso_maximo) VALUES('6831FBG','2021-02-16',23000);


INSERT INTO CONDUCTOR (codigo, nombre, apellido1, apellido2, DNI, calle, nº_calle, provincia, poblacion, telefono) VALUES(11111,'JAIRO','DOMINGUEZ','HIDALGO','49131224G','Tajo',24,'SEVILLA','DOSHERMANS','603835930');
INSERT INTO CONDUCTOR (codigo, nombre, apellido1, apellido2, DNI, calle, nº_calle, provincia, poblacion, telefono) VALUES(22222,'JOSEJOAQUIN','RODRIGUEZ','REINA','47829361R','Marqués',14,'CADIZ','ROTA','658835921');
INSERT INTO CONDUCTOR (codigo, nombre, apellido1, apellido2, DNI, calle, nº_calle, provincia, poblacion, telefono) VALUES(33333,'ELIZABETH','ALFONSO','PRIETO','46204780A','Pañoleta',21,'SEVILLA','MAIRENA','615349290');
INSERT INTO CONDUCTOR (codigo, nombre, apellido1, apellido2, DNI, calle, nº_calle, provincia, poblacion, telefono) VALUES(44444,'LETICIA','HURTADO','PERA','49324356H','London',25,'CORDOBA','CORDOBA','699111221');
INSERT INTO CONDUCTOR (codigo, nombre, apellido1, apellido2, DNI, calle, nº_calle, provincia, poblacion, telefono) VALUES(55555,'CRISTIAN','GOMEZ','TALAMINO','49208495T','Pascual',12,'SEVILLA','DOSHERMANS','719846438');
INSERT INTO CONDUCTOR (codigo, nombre, apellido1, apellido2, DNI, calle, nº_calle, provincia, poblacion, telefono) VALUES(66666,'FRANCISCO','BARRERA','GARCIA','49923443F','Martin',16,'HUELVA','LEPE','673892834');


INSERT INTO CAMION_CONDUCTOR (matricula_camion, codigo_conductor, fecha) VALUES('1849JRH','11111','2022-03-15');
INSERT INTO CAMION_CONDUCTOR (matricula_camion, codigo_conductor, fecha) VALUES('7439JRR','22222','2021-07-23');
INSERT INTO CAMION_CONDUCTOR (matricula_camion, codigo_conductor, fecha) VALUES('8546EAP','33333','2020-10-31');
INSERT INTO CAMION_CONDUCTOR (matricula_camion, codigo_conductor, fecha) VALUES('8459LPH','44444','2022-04-04');
INSERT INTO CAMION_CONDUCTOR (matricula_camion, codigo_conductor, fecha) VALUES('3538CGT','55555','2020-12-22');
INSERT INTO CAMION_CONDUCTOR (matricula_camion, codigo_conductor, fecha) VALUES('6831FBG','66666','2021-02-17');