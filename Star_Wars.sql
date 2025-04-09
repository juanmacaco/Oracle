
DROP TABLE PERSONAJE CASCADE CONSTRAINTS; --
DROP TABLE ESPECIE CASCADE CONSTRAINTS; --
DROP TABLE PLANETA CASCADE CONSTRAINTS; --
DROP TABLE NAVE CASCADE CONSTRAINTS; --
DROP TABLE ORGANIZACION CASCADE CONSTRAINTS; --
DROP TABLE ARMA CASCADE CONSTRAINTS; --
DROP TABLE EVENTO CASCADE CONSTRAINTS; --
DROP TABLE HABILIDAD CASCADE CONSTRAINTS; --
DROP TABLE OBJETO CASCADE CONSTRAINTS; --
DROP TABLE DROIDE CASCADE CONSTRAINTS; --
DROP TABLE SECTOR_GALACTICO CASCADE CONSTRAINTS; --
DROP TABLE CLASE_DE_NAVE CASCADE CONSTRAINTS; --
DROP TABLE LENGUAJE CASCADE CONSTRAINTS; --
DROP TABLE RAZA CASCADE CONSTRAINTS; --
DROP TABLE MATERIAL CASCADE CONSTRAINTS; --

CREATE TABLE PERSONAJE (
    PERSONAJE VARCHAR2(100) PRIMARY KEY,
    ESPECIE VARCHAR2(50) NOT NULL,
    PLANETA_DE_ORIGEN VARCHAR2(50) NOT NULL,
    AFILIACION VARCHAR2(100) NOT NULL,
    RANGO VARCHAR2(50) CHECK (RANGO IN ('Maestro', 'Aprendiz', 'General', 'Soldado', 'Lord', 'Emperador', 'Ninguno')),
    GENERO VARCHAR2(20) CHECK (GENERO IN ('Masculino', 'Femenino', 'Otro', 'No especificado')),
    EDAD NUMBER CHECK (EDAD >= 0),
    FUERZA NUMBER CHECK (FUERZA BETWEEN 0 AND 10),
    ALIADOS VARCHAR2(255),
    ENEMIGOS VARCHAR2(255),
    FECHA_DE_NACIMIENTO VARCHAR(20),
    ESTADO VARCHAR(20) CHECK (ESTADO IN('Vivo', 'Muerto', 'Desconocido')),

    FOREIGN KEY (ESPECIE) REFERENCES ESPECIE(ESPECIE),
    FOREIGN KEY (PLANETA_DE_ORIGEN) REFERENCES PLANETA(PLANETA),
    FOREIGN KEY (AFILIACION) REFERENCES ORGANIZACION(ORGANIZACION)
);

SELECT * FROM PERSONAJE;

CREATE TABLE ESPECIE ( --AAAAAAAAAA
    ESPECIE VARCHAR2(50) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    PROMEDIO_VIDA NUMBER
);

SELECT * FROM ESPECIE;

CREATE TABLE PLANETA ( --AAAAAAAAAAAAAA
    PLANETA VARCHAR2(50) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    CLIMA VARCHAR2(50),
    POBLACION NUMBER,
    UBICACION VARCHAR2(100),
    TIPO VARCHAR2(50) CHECK (TIPO IN('Habitable', 'Inhabitable')),

    FOREIGN KEY (UBICACION) REFERENCES SECTOR_GALACTICO(SECTOR)
);

SELECT * FROM PLANETA;

CREATE TABLE NAVE ( --AAAAAAAAAA
    NAVE VARCHAR2(50) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    CLASE VARCHAR2(50),
    ARMAMENTO VARCHAR2(255),
    VELOCIDAD NUMBER,
    TRIPULACION NUMBER,

    FOREIGN KEY (CLASE) REFERENCES CLASE_DE_NAVE(CLASE)
);

SELECT * FROM NAVE;

CREATE TABLE ORGANIZACION ( --AAAAAAAAAA
    ORGANIZACION VARCHAR2(100) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    TIPO VARCHAR2(50) CHECK (TIPO IN('Gubernamental', 'Militar', 'Religiosa', 'Criminal', 'Comercial', 'Neutra')),
    FUNDACION VARCHAR2(50),
    BASE_OPERACION VARCHAR2(100)
);

SELECT * FROM ORGANIZACION;

CREATE TABLE ARMA ( --AAAAAAAAAAAAA
    ARMA VARCHAR2(100) PRIMARY KEY,
    TIPO VARCHAR2(50) CHECK (TIPO IN ('Blaster', 'Sable de luz', 'Torpedo', 'Cañón', 'Lanza', 'Dardo')),
    DESCRIPCION VARCHAR2(255),
    POTENCIA NUMBER,
    ALCANCE NUMBER,
    FABRICANTE VARCHAR2(100)
);

SELECT * FROM ARMA;

CREATE TABLE EVENTO ( --AAAAAAAAAAA
    EVENTO VARCHAR2(255) PRIMARY KEY,
    DESCRIPCION VARCHAR2(100),
    FECHA VARCHAR2(50),
    UBICACION VARCHAR2(100),
    IMPACTO VARCHAR2(255),
    PARTICIPANTES VARCHAR2(255)
);

SELECT * FROM EVENTO;

CREATE TABLE HABILIDAD ( --AAAAAAAAAAA
    HABILIDAD VARCHAR2(255) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    TIPO VARCHAR2(50) CHECK(TIPO IN ('Fuerza', 'Combate', 'Tecnología', 'Tácticas', 'Diplomacia', 'Mente')),
    NIVEL NUMBER,
    REQUISITOS VARCHAR2(255)
);

SELECT * FROM HABILIDAD;

CREATE TABLE OBJETO ( --AAAAAAAAA
    OBJETO VARCHAR2(100) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    TIPO VARCHAR2(50) CHECK(TIPO IN('Tecnológico', 'Religioso', 'Artefacto', 'Antiguo', 'Arma')),
    VALOR NUMBER,
    PROPIETARIO VARCHAR2(100),
    FECHA_DESCUBRIMIENTO VARCHAR2(50)
);

SELECT * FROM OBJETO;

CREATE TABLE DROIDE (
    DROIDE VARCHAR2(100) PRIMARY KEY,
    TIPO VARCHAR2(50) CHECK (TIPO IN ('Astromecánico', 'Protocolar', 'Médico', 'De combate', 'De mantenimiento', 'Amalgama', 'Torturador')),
    MODELO VARCHAR2(50),
    FABRICANTE VARCHAR2(100),
    DESCRIPCION VARCHAR2(255),
    PROPIETARIO VARCHAR2(100),
    FECHA_CREACION VARCHAR2(20),

    FOREIGN KEY (PROPIETARIO) REFERENCES PERSONAJE(PERSONAJE)
);

SELECT * FROM DROIDE;

CREATE TABLE SECTOR_GALACTICO ( --AAAAAAAAAAA
    SECTOR VARCHAR2(100) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    COORDENADAS VARCHAR2(100),
    NUMERO_PLANETAS NUMBER,
    GOBERNADOR VARCHAR2(100)

);

SELECT * FROM SECTOR_GALACTICO;

CREATE TABLE CLASE_DE_NAVE ( --AAAAAAA
    CLASE VARCHAR2(50) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    CAPACIDAD_MAX NUMBER,
    VELOCIDAD_MAX NUMBER,
    ARMAMENTO VARCHAR2(255)
);

SELECT * FROM CLASE_DE_NAVE;

CREATE TABLE LENGUAJE ( --AAAAAAAAAA
    LENGUAJE VARCHAR2(50) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    ORIGEN VARCHAR2(100),
    HABLANTES NUMBER,
    ESCRITO VARCHAR(10) CHECK (ESCRITO IN ('True', 'False'))
);

SELECT * FROM LENGUAJE;

CREATE TABLE RAZA (
    RAZA VARCHAR2(100) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    PLANETA_ORIGEN VARCHAR2(50),
    ESPERANZA_VIDA NUMBER,

    FOREIGN KEY (PLANETA_ORIGEN) REFERENCES PLANETA(PLANETA)
);

SELECT * FROM RAZA;

CREATE TABLE MATERIAL ( --AAAAAA
    MATERIAL VARCHAR2(100) PRIMARY KEY,
    DESCRIPCION VARCHAR2(255),
    PROPIEDADES VARCHAR2(255),
    USOS VARCHAR2(255),
    RAREZA VARCHAR2(50) CHECK (RAREZA IN ('Común', 'Poco común', 'Raro', 'Muy raro'))
);

SELECT * FROM MATERIAL;

INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Humano', 'Especie predominante en la galaxia, con gran diversidad cultural.', 80);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Twi''lek', 'Humanoides con tentáculos en la cabeza llamados lekku.', 90);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Wookiee', 'Altos, cubiertos de pelo y originarios de Kashyyyk.', 400);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Zabrak', 'Poseen cuernos en la cabeza y una gran resistencia física.', 120);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Rodiano', 'Reptilianos con hocicos alargados y grandes ojos multifacetados.', 70);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Chiss', 'Humanoides de piel azul y ojos rojos, altamente inteligentes.', 90);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Hutt', 'Criaturas grandes y babosas, conocidas por ser señores del crimen.', 1000);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Togruta', 'Humanoides con grandes montrals y piel colorida.', 95);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Mon Calamari', 'Amfibios inteligentes de Mon Cala, conocidos por su destreza en la navegación.', 80);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Ewok', 'Criaturas pequeñas y peludas de Endor, muy ingeniosas.', 60);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Desconocido', 'Especie no identificada o de origen desconocido en la galaxia.', NULL);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Nikto', 'Especie humanoide reptiliana originaria de Kintan, conocida por su fuerza física y adaptación a entornos hostiles. Presenta múltiples subespecies con variaciones en piel y cuernos.', 85);
INSERT INTO ESPECIE (ESPECIE, DESCRIPCION, PROMEDIO_VIDA) VALUES ('Mandaloriano', 'Los mandalorianos son una cultura guerrera, temida y respetada, conocida por su código de honor, su destreza en combate y su inquebrantable lealtad a sus propios ideales y tradición.', 75);

SELECT * FROM ESPECIE;

INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Imperio Galáctico', 'Gobierno autoritario que reemplazó a la República.', 'Gubernamental', '19 ABY', 'Coruscant');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Alianza Rebelde', 'Resistencia contra el Imperio Galáctico.', 'Militar', '2 ABY', 'Yavin 4');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Orden Jedi', 'Usuarios de la Fuerza que buscan la paz y la justicia.', 'Religiosa', 'Antiguo', 'Templo Jedi, Coruscant');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Sith', 'Usuarios del lado oscuro que buscan el poder absoluto.', 'Religiosa', 'Antiguo', 'Korriban');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Clan Hutt', 'Sindicato criminal liderado por los Hutt.', 'Criminal', 'Desconocida', 'Nal Hutta');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Cazarrecompensas', 'Grupo neutral de mercenarios a sueldo.', 'Neutra', 'Variable', 'Toda la galaxia');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Federación de Comercio', 'Corporación comercial que influyó en conflictos galácticos.', 'Comercial', '350 ABY', 'Neimoidia');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Confederación de Sistemas Independientes', 'Alianza separatista contra la República.', 'Militar', '24 ABY', 'Geonosis');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Primera Orden', 'Régimen sucesor del Imperio Galáctico.', 'Militar', 'Desconocida', 'Starkiller Base');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Nueva República', 'Gobierno democrático sucesor de la Alianza Rebelde.', 'Gubernamental', '5 DBY', 'Hosnian Prime');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('República Galáctica', 'Gobierno central de la galaxia que promueve la democracia y la paz, formado por múltiples sistemas estelares y planetas.', 'Gubernamental', '25,000 ABY', 'Coruscant');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Resistencia', 'Movimiento militar dedicado a combatir la Primera Orden y restaurar la libertad en la galaxia.', 'Militar', '34 DBY', 'Base Ilium');
INSERT INTO ORGANIZACION (ORGANIZACION, DESCRIPCION, TIPO, FUNDACION, BASE_OPERACION) VALUES ('Corredores de Carreras', 'Agrupación informal de pilotos profesionales que compiten en carreras ilegales o sancionadas', 'Comercial', 'Desconocida (antes del 32 ABY)', 'Variable');
SELECT * FROM ORGANIZACION;

INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Blaster E-11', 'Blaster', 'Blaster estándar utilizado por los soldados imperiales.', 5, 100, 'BlasTech Industries');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Pistola Blaster DL-44', 'Blaster', 'Blaster de gran potencia y uso popular entre contrabandistas.', 7, 75, 'BlasTech Industries');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Sable de Luz Azul', 'Sable de luz', 'Arma de los Jedi, emite una hoja de plasma azul.', 10, 1, 'Desconocido');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Sable de Luz Rojo', 'Sable de luz', 'Arma característica de los Sith, con hoja roja.', 10, 1, 'Desconocido');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Torpedo de protones', 'Torpedo', 'Munición explosiva utilizada en combates espaciales.', 9, 1000, 'Incom Corporation');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Cañón Turboláser', 'Cañón', 'Cañón de energía empleado en destructores estelares.', 10, 5000, 'Kuat Drive Yards');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Lanza de la Guardia Pretoriana', 'Lanza', 'Arma cuerpo a cuerpo utilizada por la guardia de élite.', 8, 2, 'Desconocido');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Dardo Kaminoano', 'Dardo', 'Dardo venenoso utilizado para asesinatos sigilosos.', 4, 50, 'Kamino');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Cañón de Iones', 'Cañón', 'Arma diseñada para desactivar naves sin destruirlas.', 6, 3000, 'Rothana Heavy Engineering');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('Blaster Westar-35', 'Blaster', 'Blaster mandaloriano utilizado por los guerreros.', 6, 120, 'MandalMotors');
INSERT INTO ARMA (ARMA, TIPO, DESCRIPCION, POTENCIA, ALCANCE, FABRICANTE) VALUES ('773 Firepuncher rifle', 'Blaster', 'El arma preferida del francotirador Crosshair de la Fuerza Clon 99, incluso un rifle Firepuncher 773 estándar en manos de un soldado clon regular lo convierte en una herramienta poderosa en la lucha contra los Separatistas.', 8, 1000, 'Merr-Sonn Munitions, Inc.');

SELECT * FROM ARMA;

INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Batalla de Yavin', 'Destrucción de la primera Estrella de la Muerte.', '0 ABY', 'Yavin 4', 'Gran victoria para la Alianza Rebelde.', 'Luke Skywalker, Darth Vader, Alianza Rebelde');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Orden 66', 'Ejecutada contra los Jedi por el Imperio.', '19 ABY', 'Toda la galaxia', 'Extinción casi total de los Jedi.', 'Palpatine, Darth Vader, Clones');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Batalla de Endor', 'Destrucción de la segunda Estrella de la Muerte.', '4 DBY', 'Endor', 'Caída del Imperio Galáctico.', 'Luke Skywalker, Darth Vader, Alianza Rebelde');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Creación del Imperio Galáctico', 'Palpatine toma el poder absoluto.', '19 ABY', 'Coruscant', 'Fin de la República y ascenso del Imperio.', 'Palpatine, Anakin Skywalker, Senado');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Invasión de Naboo', 'Bloqueo y ocupación de la Federación de Comercio.', '32 ABY', 'Naboo', 'Inicio de la crisis galáctica.', 'Darth Sidious, Padmé Amidala, Qui-Gon Jinn');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Duel of the Fates', 'Batalla entre Jedi y Sith en Naboo.', '32 ABY', 'Theed, Naboo', 'Muerte de Qui-Gon Jinn.', 'Qui-Gon Jinn, Obi-Wan Kenobi, Darth Maul');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Guerra de los Clones', 'Conflicto entre la República y los Separatistas.', '22-19 ABY', 'Toda la galaxia', 'Caída de la República y ascenso del Imperio.', 'Jedi, Clones, Separatistas');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Batalla de Hoth', 'Ataque imperial a la base rebelde.', '3 DBY', 'Hoth', 'Los rebeldes se ven obligados a huir.', 'Luke Skywalker, Darth Vader, Alianza Rebelde');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('La Purga Jedi', 'Persecución de los Jedi sobrevivientes.', '19-10 ABY', 'Toda la galaxia', 'Jedi casi extintos.', 'Darth Vader, Inquisidores, Palpatine');
INSERT INTO EVENTO (EVENTO, DESCRIPCION, FECHA, UBICACION, IMPACTO, PARTICIPANTES) VALUES ('Destrucción de Alderaan', 'Prueba de la Estrella de la Muerte.', '0 ABY', 'Alderaan', 'Destrucción de un planeta entero.', 'Gran Moff Tarkin, Leia Organa');

SELECT * FROM EVENTO;

INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Telequinesis', 'Capacidad de mover objetos con la mente.', 'Fuerza', 8, 'Sensibilidad a la Fuerza');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Forma III - Soresu', 'Técnica de combate con sable de luz defensiva.', 'Combate', 7, 'Entrenamiento Jedi/Sith');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Piratería informática', 'Capacidad de hackear sistemas de seguridad.', 'Tecnología', 6, 'Conocimiento avanzado en programación');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Manipulación mental', 'Influir en la mente de otros.', 'Fuerza', 9, 'Sensibilidad a la Fuerza, concentración avanzada');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Estrategia militar', 'Capacidad de planificar y liderar batallas.', 'Tácticas', 7, 'Entrenamiento en liderazgo');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Negociación avanzada', 'Persuadir y alcanzar acuerdos favorables.', 'Diplomacia', 8, 'Experiencia política');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Rayo Sith', 'Emitir rayos de energía oscura con la Fuerza.', 'Fuerza', 10, 'Conexión con el Lado Oscuro');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Forma V - Djem So', 'Estilo agresivo de combate con sable de luz.', 'Combate', 8, 'Entrenamiento con sable de luz');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Resistencia mental', 'Capacidad de resistir manipulación mental.', 'Mente', 9, 'Disciplina y entrenamiento psicológico');
INSERT INTO HABILIDAD (HABILIDAD, DESCRIPCION, TIPO, NIVEL, REQUISITOS) VALUES ('Mecánica avanzada', 'Habilidad para reparar y modificar naves.', 'Tecnología', 7, 'Conocimiento en ingeniería espacial');

SELECT * FROM HABILIDAD;

INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Holocrón Jedi', 'Dispositivo de almacenamiento de conocimiento Jedi.', 'Religioso', 50000, 'Biblioteca Jedi', '3000 ABY');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Máscara de Mandalore', 'Símbolo del líder de los mandalorianos.', 'Artefacto', 75000, 'Mandalore', 'Desconocida');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Anillo de los Sith', 'Antiguo anillo imbuido con el Lado Oscuro.', 'Antiguo', 30000, 'Coleccionista Sith', '500 ABY');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Kyber cristal', 'Cristal utilizado en la construcción de sables de luz.', 'Artefacto', 5000, 'Varios Jedi y Sith', 'Desde tiempos antiguos');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Mapa estelar Rakata', 'Mapa que muestra antiguas rutas espaciales.', 'Antiguo', 150000, 'Exploradores galácticos', '2000 ABY');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Holocrón Sith', 'Contiene enseñanzas oscuras de los Sith.', 'Religioso', 60000, 'Orden Sith', '5000 ABY');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Amuleto de los Whills', 'Objeto místico ligado a la Fuerza.', 'Religioso', 120000, 'Guardianes de los Whills', 'Desconocida');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Corona de Exar Kun', 'Reliquia antigua que perteneció al legendario Sith Exar Kun.', 'Antiguo', 95000, 'Colección Sith', '4000 ABY');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Cristal Kaiburr', 'Cristal legendario que amplifica el poder de la Fuerza.', 'Artefacto', 200000, 'Templo de Pomojema', 'Desconocida');
INSERT INTO OBJETO (OBJETO, DESCRIPCION, TIPO, VALOR, PROPIETARIO, FECHA_DESCUBRIMIENTO) VALUES ('Cetro de Freedon Nadd', 'Artefacto Sith que amplifica el poder del Lado Oscuro.', 'Artefacto', 175000, 'Culto de Freedon Nadd', '4400 ABY');

SELECT * FROM OBJETO;

INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector Coruscant', 'Región central de la galaxia, hogar de la capital de la República y el Imperio, núcleo político y económico.', 'X:0 Y:0', 1, 'Consejo del Senado Galáctico');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector Arkanis', 'Región situada en el Borde Medio, conocida por su comercio y conexiones con el Imperio Galáctico.', 'X:150 Y:100', 5, 'Gobernador Imperial');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector de la Cosa', 'Una región remota y peligrosa de la galaxia, conocida por sus rutas de contrabando y la presencia de varios sistemas deshabitados.', 'X:450 Y:300', 10, 'Consorcio de la Cosa');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector Mid Rim', 'Una vasta región que conecta el Núcleo con el Borde Exterior, hogar de varios planetas comerciales y militares.', 'X:200 Y:150', 150, 'Alianza del Mid Rim');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector Corelliano', 'Región famosa por sus constructores de naves y su independencia, hogar de los Corellianos y su cultura única.', 'X:75 Y:30', 80, 'Administración Corelliana');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Desconocido', 'Sector galáctico no identificado o no registrado en los archivos galácticos.', 'x: Desconocido, y: Desconocido', NULL, 'Desconocido');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector de Stewjon', 'Sector galáctico que alberga el planeta Stewjon, conocido por ser el planeta de origen de Obi-Wan Kenobi.', 'x: 3456, y: 7890', null, 'Desconocido');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector Quelii', 'Sector galáctico poco explorado, conocido por sus recursos naturales y su relativa neutralidad en conflictos galácticos.', 'x: 6789, y: 1234', 4, 'Desconocido');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sistema de Najra', 'Sistema estelar conocido por sus planetas ricos en minerales y su importancia en la industria minera galáctica.', 'x: 7890, y: 3456', 6, 'Desconocido');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sistema de Dagobah', 'Sistema remoto y poco explorado, conocido por albergar el planeta Dagobah, un mundo pantanoso y rico en la Fuerza.', 'x: 1234, y: 5678', 1, 'Desconocido');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector de Yavin', 'Sector ubicado en el Borde Exterior de la galaxia, famoso por la batalla de Yavin IV', 'X: 155, Y: 34, Z: 22', 4, 'Ninguno');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector de Taris', 'Sector situado en el Borde Exterior, conocido por su planeta principal, Taris, un mundo urbanizado y decadente, hogar de diversas facciones criminales y políticos corruptos.', 'X: 120, Y: 50, Z: 22', 1, 'Ninguno');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector de Vulpter', 'Sector galáctico en la región exterior, conocido por su sector desértico y planetas inhóspitos. La mayoría de las criaturas de este sector son adaptadas a condiciones extremas.', 'X: -2, Y: 3, Z: 8', 3, 'No asignado');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector de Ahch-To', 'Sector galáctico en la región desconectada de la galaxia central, conocido principalmente por ser hogar del planeta Ahch-To, donde se encuentra el Templo Jedi abandonado.', 'X: -5, Y: 12, Z: 9', 1, 'No asignado');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector de Lothal', 'Sector galáctico en la región del Borde Interior, conocido principalmente por el planeta Lothal, que es un importante centro de producción industrial y militar, especialmente para el Imperio Galáctico.', 'X: 2, Y: -3, Z: 5', 1, 'No asignado');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sistema Forome', 'Sistema estelar lejano al sistema Therezar, según Zargo Anaximander, regente de la estación minera Nightside', 'X: 7, Y: -3, Z: 11', 4, 'Darth Saevius');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Espacio Hutt', 'Región controlada por el Clan Hutt, conocida por el crimen organizado, el comercio ilegal y la esclavitud. Incluye planetas como Nal Hutta, Nar Shaddaa y Kintan.', 'R-16 (Borde Medio)', 20, 'Consejo de Grandes Hutts');
INSERT INTO SECTOR_GALACTICO (SECTOR, DESCRIPCION, COORDENADAS, NUMERO_PLANETAS, GOBERNADOR) VALUES ('Sector de la Niebla', 'Región remota y aislada del Borde Exterior, conocida por su densa nube de gas que dificulta la navegación y es hogar del planeta Kamino, donde se ocultan secretos de clonación.', 'X: 50,000 y Y: 25,000.', 3, 'El Comando Clon');

SELECT * FROM SECTOR_GALACTICO;

INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Caza Estelar', 'Naves pequeñas y ágiles diseñadas para combate rápido.', 1, 1200, 'Cañones láser, Torpedos de protones');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Destructor Estelar', 'Nave capital de la flota imperial con gran capacidad ofensiva.', 37000, 975, 'Cañones turboláser, Generador de escudos');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Fragata', 'Naves de escolta medianas usadas para defensa y transporte.', 600, 850, 'Cañones turboláser, Torpedos');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Crucero', 'Naves de tamaño intermedio usadas para exploración y combate.', 5000, 900, 'Cañones láser, Lanzamisiles');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Corbeta', 'Naves rápidas y maniobrables usadas para reconocimiento y patrullaje.', 150, 1000, 'Cañones láser ligeros');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Transporte Ligero', 'Nave de carga pequeña con defensas básicas.', 50, 900, 'Cañones láser ligeros');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Acorazado', 'Enormes naves con blindaje pesado y gran capacidad ofensiva.', 40000, 800, 'Cañones de iones, Misiles de largo alcance');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Explorador', 'Nave pequeña con sistemas avanzados de reconocimiento.', 10, 1100, 'Ninguno o cañón ligero');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Transbordador', 'Nave de transporte de pasajeros o tropas.', 30, 850, 'Cañones defensivos');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Carguero Pesado', 'Nave diseñada para el transporte masivo de mercancías.', 20000, 750, 'Defensas mínimas');
INSERT INTO CLASE_DE_NAVE (CLASE, DESCRIPCION, CAPACIDAD_MAX, VELOCIDAD_MAX, ARMAMENTO) VALUES ('Carguero Ligero', 'Nave de transporte rápida y maniobrable, utilizada para el comercio y el contrabando', 100, 1100, 'Cañones láser dobles, torpedos de protones');


SELECT * FROM CLASE_DE_NAVE;

INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Básico Galáctico', 'Idioma universal más hablado en la galaxia.', 'Humanos', 1000000000, 'True');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Huttés', 'Lengua hablada por los Hutts y usada en el comercio criminal.', 'Hutts', 50000000, 'True');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Shyriiwook', 'Lenguaje de los wookiees basado en gruñidos y rugidos.', 'Wookiees', 3000000, 'False');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Droidspeak', 'Serie de pitidos y tonos utilizados por los droides astromecánicos.', 'Droides', 10000000, 'False');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Mando´a', 'Lenguaje de los mandalorianos, usado en batalla y cultura.', 'Mandalorianos', 2000000, 'True');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Sith', 'Antiguo idioma del Imperio Sith, usado en rituales oscuros.', 'Sith', 100000, 'True');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Bocce', 'Lenguaje técnico usado en el comercio y navegación espacial.', 'Diversas especies', 100000000, 'True');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Rodés', 'Idioma de los Rodianos, basado en chasquidos y vibraciones.', 'Rodianos', 5000000, 'True');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Togruti', 'Lenguaje de los Togruta, basado en sonidos vocales complejos.', 'Togruta', 2000000, 'False');
INSERT INTO LENGUAJE (LENGUAJE, DESCRIPCION, ORIGEN, HABLANTES, ESCRITO) VALUES ('Ewokés', 'Lengua hablada por los Ewoks en la luna de Endor.', 'Ewoks', 100000, 'False');

select * from lenguaje;

INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Adamantium', 'Un metal extremadamente resistente, conocido por su dureza.', 'Alta resistencia, no se puede destruir fácilmente', 'Fabricación de armas y armaduras', 'Muy raro');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Beskar', 'Un metal raro utilizado principalmente por los mandalorianos, conocido por su resistencia.', 'Absorbe los impactos de blásters y sable de luz', 'Fabricación de armaduras, armas', 'Raro');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Phrik', 'Un metal raro extremadamente resistente a la luz y los blásters.', 'Resistente al sable de luz, al bláster', 'Uso en la creación de armaduras y armas', 'Raro');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Cortosis', 'Un mineral utilizado principalmente para crear materiales resistentes a los sables de luz.', 'Absorbe energía, resistente a los sables de luz', 'Uso en armaduras, armas y tecnología de defensa', 'Poco común');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Durasteel', 'Un material metálico duradero ampliamente utilizado en la construcción de naves y estructuras.', 'Gran resistencia y durabilidad', 'Construcción de naves, estaciones espaciales y edificios', 'Común');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Krayt Dragon Pearl', 'Piedra preciosa extremadamente rara, conocida por su conexión con los dragones Krayt.', 'Alta concentración de energía en su interior', 'Uso en la construcción de sable de luz y otros artefactos', 'Muy raro');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Brynite', 'Un material cristalino utilizado en la creación de tecnología avanzada.', 'Resistencia a la temperatura extrema, propiedades de conducción energética', 'Uso en equipos de navegación y armamento', 'Poco común');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Sith Alchemy', 'Materiales creados a través de la alquimia Sith, conocidos por su naturaleza oscura.', 'Capacidad de absorber la energía de la Fuerza', 'Uso en artefactos y tecnología Sith', 'Muy raro');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Vibroblade', 'Un material que se utiliza para crear cuchillas vibrantes, capaces de cortar casi cualquier cosa.', 'Alta frecuencia vibrante, cortante', 'Fabricación de espadas y cuchillas', 'Común');
INSERT INTO MATERIAL (MATERIAL, DESCRIPCION, PROPIEDADES, USOS, RAREZA) VALUES ('Muunium', 'Un metal muy raro utilizado en la creación de dispositivos tecnológicos avanzados.', 'Alta conductividad energética', 'Fabricación de naves, equipos de comunicación', 'Raro');

SELECT * FROM MATERIAL;

INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Tatooine', 'Un desértico planeta árido, hogar de los Jedi y Sith.', 'Desértico', 200000, 'Sector Arkanis', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Coruscant', 'El centro de la política galáctica, un planeta urbano con una megaciudad que lo cubre todo.', 'Templado', 1000000000, 'Sector Coruscant', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Hoth', 'Planeta helado y frío, conocido por ser la base de la Rebelión.', 'Polar', 2000, 'Sector de la Cosa', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Endor', 'Planeta boscoso, hogar de los Ewoks y con lunas con bosques densos.', 'Boscoso', 3000, 'Sector de la Cosa', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Naboo', 'Planeta de paisajes hermosos, agua, llanuras y hermosos jardines.', 'Tropical', 1000000, 'Sector Mid Rim', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Mustafar', 'Un planeta volcánico que alberga grandes cantidades de lava, hogar de la fábrica de droides.', 'Volcánico', 5000, 'Sector de la Cosa', 'Inhabitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Alderaan', 'Un hermoso planeta destruido por la Estrella de la Muerte, conocido por su cultura y arte.', 'Templado', 2000000, 'Sector Corelliano', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Dagobah', 'Un planeta pantanoso y oscuro, famoso por ser el retiro de Yoda.', 'Pantano', 0, 'Sistema de Dagobah', 'Inhabitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Kashyyyk', 'El hogar de los Wookiees, cubierto de vastos bosques y árboles gigantes.', 'Tropical', 5000000, 'Sector Mid Rim', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Jakku', 'Planeta desértico donde se encuentra el "Cruzado" y el "Halcon Milenario".', 'Desértico', 10000, 'Sistema de Najra', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Corellia', 'Planeta natal de Han Solo y conocido por su industria de construcción de naves espaciales.', 'Templado', 15000000000, 'Sector Corelliano', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Desconocido', 'Planeta de origen no identificado o no registrado en los archivos galácticos.', 'Desconocido', NULL, 'Desconocido', null);
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Stewjon', 'Planeta de origen de Obi-Wan Kenobi, con una cultura y geografía poco exploradas en los registros galácticos.', 'Templado', null, 'Sector de Stewjon', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Dathomir', 'Planeta remoto y peligroso, hogar de las Hermanas de la Noche y los Zabrak. Conocido por su conexión con el lado oscuro de la Fuerza.', 'Árido y tormentoso', 1000000, 'Sector Quelii', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Yavin 4', 'Un planeta selvático y húmedo, hogar de los antiguos templos massassi y escenario de la victoria rebelde en la batalla de Yavin.', 'Tropical', 100000, 'Sector de Yavin', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Taris', 'Planeta urbanizado, conocido por su extensa ciudad sobre la superficie, donde las capas inferiores están en ruinas y controladas por criminales.', 'Templado', 1000000, 'Sector de Taris', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Vulpter', 'Planeta desértico en el sector de Vulpter, habitado por especies adaptadas a condiciones extremas de calor. Es conocido por su escasa vegetación y sus tormentas de arena.', 'Desértico', 5000000, 'Sector de Vulpter', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Ahch-To', 'Planeta rocoso y aislado ubicado en el borde de la galaxia, conocido por ser el hogar de la primera ubicación del Templo Jedi y por sus aguas tranquilas y paisajes serenos.', 'Tropical', 20, 'Sector de Ahch-To', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Lothal', 'Planeta industrializado en el Borde Interior, conocido por su gran capacidad de producción y su estratégica importancia durante la guerra contra el Imperio. Su paisaje combina zonas industriales y rurales.', 'Templado', 2000000, 'Sector de Lothal', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Kintan', 'Planeta árido y rocoso, hogar de la especie Nikto. Fue controlado por los Hutts durante siglos y es conocido por sus peligrosas criaturas y minas de minerales.', 'Árido', 12000000, 'Espacio Hutt', 'Habitable');
INSERT INTO PLANETA (PLANETA, DESCRIPCION, CLIMA, POBLACION, UBICACION, TIPO) VALUES ('Kamino', 'Kamino es un remoto y lluvioso planeta, hogar de los cloners, conocido por su vasto océano y sus instalaciones ocultas donde se crearon los clones que sirvieron a la República.', 'Tropical y lluvioso', 10000, 'Sector de la Niebla', 'Habitable');

select * from PLANETA;

INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Luke Skywalker', 'Humano', 'Tatooine', 'Alianza Rebelde', 'Maestro', 'Masculino', 53, 9, 'Leia Organa, Han Solo', 'Darth Vader, Emperador Palpatine', '19 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Darth Vader', 'Humano', 'Tatooine', 'Imperio Galáctico', 'Lord', 'Masculino', 45, 10, 'Emperador Palpatine', 'Luke Skywalker, Alianza Rebelde', '41 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Leia Organa', 'Humano', 'Alderaan', 'Alianza Rebelde', 'General', 'Femenino', 53, 7, 'Luke Skywalker, Han Solo', 'Darth Vader, Emperador Palpatine', '19 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Han Solo', 'Humano', 'Corellia', 'Alianza Rebelde', 'General', 'Masculino', 55, 6, 'Luke Skywalker, Leia Organa', 'Darth Vader, Emperador Palpatine', '29 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Yoda', 'Desconocido', 'Desconocido', 'Orden Jedi', 'Maestro', 'Masculino', 900, 10, 'Luke Skywalker, Obi-Wan Kenobi', 'Darth Sidious, Darth Vader', '896 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Obi-Wan Kenobi', 'Humano', 'Stewjon', 'Orden Jedi', 'Maestro', 'Masculino', 57, 9, 'Luke Skywalker, Yoda', 'Darth Vader, Darth Maul', '57 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Padmé Amidala', 'Humano', 'Naboo', 'República Galáctica', 'General', 'Femenino', 27, 5, 'Anakin Skywalker, Obi-Wan Kenobi', 'Darth Sidious, Conde Dooku', '46 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Chewbacca', 'Wookiee', 'Kashyyyk', 'Alianza Rebelde', 'Soldado', 'Masculino', 234, 8, 'Han Solo, Luke Skywalker', 'Imperio Galáctico', '200 ABY', 'Vivo');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Darth Maul', 'Zabrak', 'Dathomir', 'Sith', 'Aprendiz', 'Masculino', 50, 8, 'Darth Sidious', 'Obi-Wan Kenobi, Qui-Gon Jinn', '54 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Rey', 'Humano', 'Jakku', 'Resistencia', 'Aprendiz', 'Femenino', 25, 8, 'Finn, Poe Dameron', 'Kylo Ren, Snoke', '15 DBY', 'Vivo');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Poe Dameron', 'Humano', 'Yavin 4', 'Resistencia', 'General', 'Masculino', 32, 8, 'Finn, Rey, BB-8', 'Primera Orden', '2 DBY', 'Vivo');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Jabba el Hutt', 'Hutt', 'Tatooine', 'Clan Hutt', 'Lord', 'Masculino', 600, 7, 'Bib Fortuna, Boba Fett', 'Luke Skywalker, Han Solo, Leia Organa', '600 ABY', 'Muerto');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Darth Revan', 'Humano', 'Taris', 'Orden Jedi', 'Lord', 'Masculino', 35, 10, 'Bastila Shan, Carth Onasi', 'Malak, Sith', '3996 ABY', 'Desconocido');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Meetra Surik', 'Humano', 'Desconocido', 'Sith', 'Aprendiz', 'Femenino', 30, 9, 'HK-47, T3-M4', 'Darth Nihilus, Darth Sion', '3956 ABY', 'Desconocido');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('"Steel Claw" Kane', 'Nikto', 'Kintan', 'Corredores de Carreras', 'Ninguno', 'Masculino', null, 3, null, 'La Remesa Mala', '19 DBY', 'Vivo');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Capitán Doza', 'Humano', 'Desconocido', 'Resistencia', 'General', 'Masculino', 55, 3, 'Venisa Doza, Torra Doza, Team Fireball, la Resistencia, tripulación de la Colossus.', 'Primera Orden, agentes imperiales leales, piratas aliados con la Primera Orden, amenazas a la Colossus.', '45 DBY', 'Vivo');
INSERT INTO PERSONAJE (PERSONAJE, ESPECIE, PLANETA_DE_ORIGEN, AFILIACION, RANGO, GENERO, EDAD, FUERZA, ALIADOS, ENEMIGOS, FECHA_DE_NACIMIENTO, ESTADO) VALUES ('Boba Fett', 'Mandaloriano', 'Kamino', 'Cazarrecompensas', 'Ninguno', 'Masculino', 57, 9, 'Fennec Shand, Jabba el Hutt, Din Djarin, mandalorianos, Cartel Hutt.', 'Han Solo, Luke Skywalker, Alianza Rebelde, cazarrecompensas rivales, Imperio Galáctico.', '32 ABY', 'Vivo');


SELECT * FROM PERSONAJE;

INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('Millennium Falcon', 'Legendaria nave de Han Solo, veloz y modificada para el contrabando', 'Carguero Ligero', 'Cañones láser dobles, torpedos de protones', 1050, 4);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('X-Wing', 'Caza estelar usado por la Alianza Rebelde, versátil y bien armado', 'Caza Estelar', 'Cuatro cañones láser, torpedos de protones', 1050, 1);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('TIE Fighter', 'Caza estelar estándar del Imperio, rápido pero sin escudos', 'Caza Estelar', 'Dos cañones láser', 1200, 1);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('Slave I', 'Nave de cazarrecompensas de Boba Fett, altamente armada', 'Caza Estelar', 'Cañones láser, misiles teledirigidos, bombas sísmicas', 1000, 1);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('Star Destroyer', 'Nave de guerra del Imperio, poderosa y temida', 'Destructor Estelar', 'Turboláseres, lanzadores de misiles, cañones de iones', 975, 37000);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('Naboo N-1 Starfighter', 'Caza estelar elegante y rápido usado por la realeza de Naboo', 'Caza Estelar', 'Dos cañones láser, torpedos de protones', 1100, 1);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('Venator-class Star Destroyer', 'Nave capital de la República, usada durante las Guerras Clon', 'Crucero',  'Turboláseres, cañones de iones, baterías antiaéreas', 975, 7400);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('Ghost', 'Nave de la tripulación de Hera Syndulla, modificada para sigilo y combate', 'Carguero Ligero', 'Cañones láser, torpedos de protones', 1020, 5);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('Ebon Hawk', 'Nave legendaria usada en la era de la Antigua República', 'Carguero Ligero', 'Cañones láser, torpedos de protones', 1050, 6);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('Tantive IV', 'Corbeta Corelliana usada por la Princesa Leia para transportar los planos de la Estrella de la Muerte', 'Corbeta', 'Turboláseres, cañones de iones', 950, 46);
INSERT INTO NAVE (NAVE, DESCRIPCION, CLASE, ARMAMENTO, VELOCIDAD, TRIPULACION) VALUES ('A-wing Fighter', 'Con su elegante forma de punta de flecha, su cabina aerodinámica y sus enormes motores gemelos, el caza estelar Ala-A proyecta una velocidad impresionante incluso estacionado en los hangares de la Alianza.', 'Caza Estelar', 'Cañones láser bláster, misiles de protones', 1050, 1);

SELECT * FROM NAVE;

INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('R2-D2', 'Astromecánico', 'R2-series', 'Industrial Automaton', 'Droide astromecánico leal y versátil con múltiples herramientas', 'Luke Skywalker', '32 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('C-3PO', 'Protocolar', '3PO-series', 'Cybot Galactica', 'Droide de protocolo experto en más de seis millones de formas de comunicación', 'Leia Organa', '32 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('IG-88', 'De combate', 'IG-series', 'Holowan Laboratories', 'Droide asesino con inteligencia avanzada y letalidad extrema', null, '19 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('2-1B', 'Médico', '2-1B-series', 'Industrial Automaton', 'Droide médico con avanzados conocimientos en cirugía y tratamientos', null, '22 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('Droideka', 'De combate', 'Droideka', 'Colicoid Creation Nest', 'Droide de combate con escudos de energía y gran potencia de fuego', null, '32 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('BB-8', 'Astromecánico', 'BB-series', 'Industrial Automaton', 'Droide esférico con avanzada tecnología de navegación y comunicación', 'Poe Dameron', '34 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('FX-7', 'Médico', 'FX-series', 'MedTech Industries', 'Droide médico especializado en cirugías con múltiples brazos', null, '19 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('EV-9D9', 'De mantenimiento', 'EV-series', 'MerenData', 'Droide supervisor de mantenimiento con personalidad sádica', 'Jabba el Hutt', '10 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('HK-47', 'De combate', 'HK-series', 'Czerka Corporation', 'Droide asesino con gran habilidad para el combate y el sigilo', 'Darth Revan', '3960 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('T3-M4', 'Astromecánico', 'T3-series', 'Duwani Mechanical Products', 'Droide astromecánico con habilidades de hackeo y reparación', 'Meetra Surik', '3956 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('"Hyper" Rod', 'Protocolar', '3PO-series', 'Cybot Galactica', 'Droide de protocolo reprogramado que ahora se centra en la incivilizada tarea de eliminar a sus oponentes', null, '19 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('"Quick-Draw" Quasar', 'Amalgama', '3PO-series / B1 ', 'Cybot Galactica / Baktoid Combat Automata', 'Cuerpo de un droide de protocolo y la cabeza de un robot de combate B1. Pintado con un toque de púrpura y amarillo, pone en práctica su programación estratégica.', null, '19 ABY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('4D-M1N', 'Protocolar', 'TDA Modificado', 'AccuTronics', 'Servía como asistente personal del Capitán Imanuel Doza en la plataforma Colossus, encargándose de escoltar a los invitados a la Torre Doza y de transmitir mensajes a los ciudadanos de la estación.', 'Capitán Doza', '27 DBY'); 
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('5-L', 'De mantenimiento', 'MSE-6', 'Industrial Automaton', 'Un droide ratón que sirve a bordo de un Destructor Estelar de la Primera Orden', null, '20 DBY');
INSERT INTO DROIDE (DROIDE, TIPO, MODELO, FABRICANTE, DESCRIPCION, PROPIETARIO, FECHA_CREACION) VALUES ('8D8', 'Torturador', 'Torture Droid', 'Industrial Automaton', 'Un larguirucho droide de fundición, durante la época del Imperio, 8D8 ayudó a EV-9D9 a aterrorizar a los droides operativos de Jabba el Hutt.', 'Boba Fett', '25 ABY'); 


-- DELETE FROM DROIDE;
SELECT * FROM Droide;

INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Bantha', 'Gran animal herbívoro, utilizado por los habitantes de Tatooine como montura. Su cuerpo masivo es cubierto de pelaje y tiene grandes cuernos.', 'Tatooine', 50);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Tauntaun', 'Reptil herbívoro de la nieve, utilizado como montura en Hoth por los soldados de la Alianza Rebelde debido a su resistencia al frío.', 'Hoth', 20);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Dewback', 'Reptil grande y resistente, comúnmente utilizado como montura en los desiertos de Tatooine. Tiene una piel gruesa que le protege del calor.', 'Tatooine', 30);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Rancor', 'Monstruo gigantesco y feroz, utilizado por Jabba el Hutt como una herramienta de tortura. Es carnívoro y extremadamente fuerte.', 'Dathomir', 40);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Sarlacc', 'Gigantesco organismo subterráneo, conocido por su capacidad para atrapar presas y devorarlas lentamente durante siglos.', 'Tatooine', 1000);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Womp Rat', 'Pequeña criatura roedora que habita en los desiertos de Tatooine. Son considerados plagas, pero también pueden ser cazados para alimento.', 'Tatooine', 5);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Vulpter', 'Criatura cuadrúpeda de pelaje multicolor que vive en los desiertos. Son rápidos y adaptables a las duras condiciones del planeta Vulpter.', 'Vulpter', 15);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Porg', 'Pequeñas criaturas parecidas a aves, originarias de Ahch-To. Son conocidos por su aspecto tierno y su comportamiento curioso.', 'Ahch-To', 10);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Lothal Cat', 'Un felino nativo del planeta Lothal, conocido por su agilidad y sus ojos que reflejan una luz fosforescente en la oscuridad.', 'Lothal', 10);
INSERT INTO RAZA (RAZA, DESCRIPCION, PLANETA_ORIGEN, ESPERANZA_VIDA) VALUES ('Blurrg', 'Reptil de gran tamaño que habita en el planeta Sorgan. Usado como montura por los caza recompensas en su búsqueda de presas.', 'Endor', 30);

select * from raza;
--1 Ordeno los personajes por los planetas de origen
SELECT PLANETA_DE_ORIGEN, COUNT(*)
AS PLANETAS 
FROM PERSONAJE 
GROUP BY PLANETA_DE_ORIGEN 
ORDER BY PLANETAS DESC, PLANETA_DE_ORIGEN ASC;

--2
SELECT ESPECIE || ', ' || PERSONAJE || ' pertenece a ' || AFILIACION AS TEXTO
FROM PERSONAJE;

--3
SELECT CLASE, SUM(VELOCIDAD) AS TOTAL_VELOCIDAD
FROM NAVE
GROUP BY CLASE
ORDER BY TOTAL_VELOCIDAD DESC;

--4
SELECT PERSONAJE, FECHA_DE_NACIMIENTO
FROM PERSONAJE
WHERE FECHA_DE_NACIMIENTO
LIKE '%DBY';

--5 
SELECT PERSONAJE, ESPECIE, ALIADOS, ESTADO
FROM PERSONAJE;

--6
SELECT PERSONAJE, 
       LENGTH(PERSONAJE) - LENGTH(REPLACE(LOWER(PERSONAJE), 'a', '')) +
       LENGTH(PERSONAJE) - LENGTH(REPLACE(LOWER(PERSONAJE), 'e', '')) +
       LENGTH(PERSONAJE) - LENGTH(REPLACE(LOWER(PERSONAJE), 'i', '')) +
       LENGTH(PERSONAJE) - LENGTH(REPLACE(LOWER(PERSONAJE), 'o', '')) +
       LENGTH(PERSONAJE) - LENGTH(REPLACE(LOWER(PERSONAJE), 'u', '')) AS cantidad_vocales
FROM PERSONAJE
ORDER BY CANTIDAD_VOCALES DESC;

commit;