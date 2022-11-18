Create Database olimpiadas

create table sede(
id_sede numeric(8),
nombre char(30),
ubicacion char(30),
num_complejos numeric(10),
PRIMARY KEY (id_sede)
);

create table complejo(
id_complejo numeric(8),
localizacion varchar(30),
responsable varchar(30),
area_total numeric(10),
id_sede numeric(8), 
presupuesto money,
PRIMARY KEY (id_complejo),
FOREIGN KEY (id_sede) REFERENCES sede(id_sede)
);

create table zona(
id_zona numeric(8),
nombre varchar(30),
localizacion varchar(30),
area numeric(10),
es_polideportiva varchar(10),
id_complejo numeric(8),
PRIMARY KEY (id_zona),
FOREIGN KEY (id_complejo) REFERENCES complejo(id_complejo)
);

create table evento(
id_evento numeric(8),
nombre varchar(30),
fecha date,
duracion numeric(10),
num_participantes numeric(20),
id_zona numeric(8),
PRIMARY KEY (id_evento),
FOREIGN KEY (id_zona) REFERENCES zona(id_zona)
); 

create table equipamiento(
id_equipamiento numeric(8),
tipo varchar(30),
id_evento numeric(8),
PRIMARY KEY (id_equipamiento),
FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

create table utiliza(
id_evento numeric(8),
id_equipamiento numeric(8),
PRIMARY KEY (id_evento,id_equipamiento)
); 

create table comisario(
id_comisario numeric(8),
nombre varchar(30),
tipo varchar(30),
id_evento numeric(8),
PRIMARY KEY (id_comisario),
FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

insert into sede
values 
(1,'Antonia','Sevilla',76),
(16,'Paco','Madrid',45),
(13,'Maria','Madrid',32),
(2,'Lola','Murcia',31),
(17,'Pablo','Barcelona',53),
(5,'David','Granada',76),
(8,'Sandra','Barcelona',9),
(34,'Irene','Sevilla',87),
(9,'Inés','Valencia',63),
(41,'Manolo','Sevilla',34)

insert into complejo
values
(23,'Granada','David',890,5,100000),
(12,'Barcelona','Pablo',540,13,150000),
(42,'Sevilla','Antonia',421,34,200000),
(35,'Madrid','Paco',123,16,10000),
(18,'Granada','David',145,5,265000),
(13,'Madrid','Luis',765,16,1000000),
(7,'Valencia','Manuel',987,9,230000),
(54,'Sevilla','Jose',100,41,12000),
(2,'Murcia','Lola',450,5,4300000),
(79,'Madrid','Maria',679,13,6300000),
(11,'Barcelona','Manuela',321,17,800000)

insert into zona
values
(15,'Pulianas','Granada',345,'True',23),
(12,'Exteriores','Barcelona',456,'True',12),
(42,'Dos Hermanas','Sevilla',230,'True',42),
(45,'Realejo','Granada',120,'True',18),
(7,'Centro','Madrid',345,'True',35),
(12,'Lomavieja','Valencia',200,'True',7),
(12,'Carrameda','Sevilla',130,'True',54),
(12,'Murillo','Murcia',125,'True',2),
(12,'Pasaton','Barcelona',98,'True',11),
(12,'Terco','Madrid',260,'True',13)

insert into evento
values
(34,'Jabalina',12-12-2023,4,16,15),
(25,'Natación',13-12-2023,2,20,12),
(67,'Futbol',10-12-2023,48,8,42),
(54,'Tenis',07-12-2023,56,10,45),
(21,'Escalada',06-12-2023,8,7,7),
(13,'Padel',07-12-2023,56,16,23),
(69,'Esgrima',25-12-2023,6,8,7),
(48,'Martillo',20-12-2023,4,22,2),
(31,'Salto_Altura',18-12-2023,8,20,11),
(8,'Waterpolo',21-12-2023,8,60,13)

insert into equipamiento
values
(8,'Jabalina','Jabalina',34),
(4,'Accesorios natación','Natación',25),
(2,'Balón','Futbol',67),
(10,'Pelota','Tenis',54),
(1,'Cuerdas','Escalada',21),
(15,'Palas','Padel',13),
(34,'Espadas','Esgrima',69),
(21,'Martillo','Martillo',48),
(27,'Pertiga','Salto_Altura',31),
(6,'Pelota','Waterpolo',8)

insert into utiliza
values
(34,8),
(4,25),
(2,67),
(10,54),
(1,21),
(13,15),
(69,34),
(48,21),
(31,27),
(8,6)

insert into comisario
values

(2,'Manuel','Cabo',34),
(5,'Román','General',25),
(8,'Paco','Coronel',67),
(9,'Francisco','Comandante',54),
(3,'Lola','Capitán',21),
(13,'Juan','Oficial',13),
(10,'Teresa','Suboficial',69),
(1,'Rodrigo','Capitán',48),
(6,'Pablo','Cabo',31),
(15,'Christian','General',8)

