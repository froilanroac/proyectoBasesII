INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (1,'Estrellita Caribenita',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (2,'DELOS INC.',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (3,'Shelby Company Limited',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (4,'Andina de Turismo',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (5,'Turvinter',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (6,'UCAB Turismo',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (7,'Venezuela Bella',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (8,'Morocoy boats',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (9,'La Chinita Rides INC.',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (10,'United Continental Venezuela',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (11,'Walt Disney Venezuela',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (12,'Marriot Venezuela',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (13,'Singapur Venezuela',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (14,'Ryanair Venezuela',empty_blob());
INSERT INTO COMPETIDORES (ID,NOMBRE,FOTO) VALUES (15,'Delta Venezuela',empty_blob());

INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-1-1',5000,1);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-2-1',6000,1);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-3-1',2000,1);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-1-1',8000,2);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-2-1',2000,2);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-3-1',5000,2);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-3-1',9000,3);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-1-1',7000,3);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-2-1',2000,3);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-3-1',7000,4);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-1-1',3000,4);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-2-1',3000,4);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-2-1',8000,5);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-3-1',4000,6);
INSERT INTO VENTAS_COMPETIDORES (FECHA_CREACION,CANTIDAD_VENTAS,FK_COMPETIDOR) VALUES (DATE '2021-1-1',8000,7);

INSERT INTO DESTINOS VALUES (1,DATOS_TDA('LOS ROQUES','Territorio Insular Francisco de Miranda.'),empty_blob(),empty_blob(),
'Este precioso archipiélago y parque nacional de islas y cayos forma parte de las Antillas Menores venezolanas. Su isla más grande es Gran Roque, donde reside la mayor parte de sus 3 mil y tantos habitantes y donde está el aeropuerto que brinda el principal acceso al territorio. Los Roques es parecido a un atolón, formaciones que son muy raras en el Caribe. Sus playas paradisíacas, de diferentes tonos de azul, aguas transparentes y blanca arena, están consideradas entre las más puras de las Antillas. Entre los cayos se distinguen Cayo de Agua, Cayo Sal, Cayo Pirata y Cayos Francisqui. Los roqueños son hábiles pescadores de langostas, por lo que Los Roques es el mejor lugar de Venezuela para disfrutar esta exquisitez. El principal acceso es desde el Aeropuerto de Maiquetía, que sirve a la ciudad de Caracas.'
);
INSERT INTO DESTINOS VALUES (2,DATOS_TDA('MORROCOY','Estado Falcon'),empty_blob(),empty_blob(),
'Es un Parque Nacional situado en el estado occidental de Falcón. Cuenta con espectaculares playas tanto en el territorio continental como en sus distintos islotes y cayos cercanos a la costa. El área insular más reconocida de Morrocoy es Cayo Sombrero, que cuenta con dos amplias playas de aguas nítidas y clamadas, sombreadas por los cocoteros. Punta Brava es el cayo más visitado ya que permite el acceso en coche a través de un puente. En tierra firme, la población más importante del parque es Tucacas, una ciudad de poco más de 30.000 habitantes que también cuenta con bonitas playas.'
);
INSERT INTO DESTINOS VALUES (3,DATOS_TDA('Adicora','Estado Falcon'),empty_blob(),empty_blob(),
'Los vientos Alisios que se abaten sobre la Península de Paraguaná y el occidente venezolano son intensos y constantes, haciendo de la playa de Adícora un paraíso para los deportes de viento, especialmente el kitesurf y el windsurf. Paraguaná está separada del resto del territorio nacional por el istmo de los Médanos de Coro, donde se forman estos atractivos arenales que van cambiando de forma y donde se practican algunos entretenimientos. Finalizado el istmo está Coro, la capital de Falcón, con un bello centro colonial.'
);
INSERT INTO DESTINOS VALUES (4,DATOS_TDA('Bahia de cata','Estado aragua'),empty_blob(),empty_blob(),
 'A 54 kilómetros de la capital del estado Aragua, Maracay, por una sinuosa carretera, se encuentra esta hermosa ensenada, con una amplia playa de aguas diáfanas y arena fina y blanca. Durante la colonia, en las cercanías había enormes plantaciones de cacao y cuando los comerciantes españoles especulaban a la baja con los precios, los hacendados venezolanos más poderosos vendían su fruto a los contrabandistas holandeses, que utilizaban esta y otras bahías aragüeñas para cargar. Cerca de Bahía de Cata  hay otras espléndidas playas, como Cuyagua, La Ciénaga de Ocumare y Ensenadas de Chuao.'
);
INSERT INTO DESTINOS VALUES (5,DATOS_TDA('Choroni','Estado Aragua'),empty_blob(),empty_blob(),
 'Frente al mar en la cordillera de la Costa, embutida dentro del Parque Nacional Henri Pittier, está la pintoresca población de Choroní, con su magnífica playa. La exuberante vegetación de los alrededores está formada por árboles que dan sombra y protegen a las plantas que producen uno de los cacaos de mayor calidad a nivel mundial. Este marco de verdor cubre también a Playa Grande, la más apreciada del lugar por su extensión, fina arena y deliciosas aguas, que por su fortaleza constituyen uno de los destinos preferidos de los surfistas venezolanos.'
);
INSERT INTO DESTINOS VALUES (6,DATOS_TDA('Playa caribe','Estado Miranda'),empty_blob(),empty_blob(),
'La zona de playas del estado Miranda, entidad que limita con el Distrito Capital (el antiguo DF venezolano), es ampliamente utilizada por los caraqueños para sus salidas de playa de ida y vuelta el mismo día, aunque muchos tienen allí sus casas y apartamentos de descanso. Una de las playas más encantadoras de la costa mirandina es Playa Caribe. Sus aguas son diáfanas, su oleaje es calmado y su arena es fina y blanca. La presencia de corales la hace atractiva para el snorkel.'
);
INSERT INTO DESTINOS VALUES (7,DATOS_TDA('Las Isletas de piritu','Estado Anzoategui'),empty_blob(),empty_blob(),
'Frente a la población anzoatiguense de Píritu, están dos islitas que han cobrado auge como destino turístico por sus playas de aguas nítidas y calmado oleaje. La vida en las aguas y en el fondo marino de las playas es muy rica y es posible admirar pepinos de mar, estrellas de mar, erizos y pececillos. En una de las islas hay un yacimiento de mineral de azufre, que los lugareños promocionan como excelente para tratamientos de piel y otros fines medicinales.'
);
INSERT INTO DESTINOS VALUES (8,DATOS_TDA('Mochima','Sucre y anzoategui'),empty_blob(),empty_blob(),
'El Parque Nacional Mochima, que abarca buena parte de las islas y de la costa perteneciente a los estados Sucre y Anzoategui, cuenta con las playas más tranquilas, transparentes y hermosas de la zona oriental del país. La ciudad cercana más importante es Puerto La Cruz, que hace una gran conurbación con Barcelona, la capital del estado Anzoategui, donde está el aeropuerto internacional. Entre las playas insulares más espectaculares están Isla de Plata, Arapo, Playa Blanca, Las Marites y Cautaro. En tierra continental, las más frecuentadas son Arapito y Playa Colorada. Mochima es lugar ideal para degustar una catalana, pescado de piel roja y carne blanca y delicada.'
);
INSERT INTO DESTINOS VALUES (9,DATOS_TDA('Playa medina','Estado Sucre'),empty_blob(),empty_blob(),
'Situada hacia el lado oriental del estado Sucre, en la Península de Paria, este lugar está catalogado como el mejor refugio playero del país. La vía es de difícil acceso, por lo que es recomendable hacerla en vehículo de doble tracción. La playa de limpia arena e intenso color azul cuenta con una amplia plantación de cocoteros con suelo de césped, por el que se puede andar cómodamente. Los lugareños siempre están prestos para darte a beber un coco o a comer su tierna pulpa. Los alojamientos son escasos y sencillos y los restaurantes rústicos y acogedores. La mayoríade los visitantes se aloja en la cercana ciudad de Carúpano.'
);
INSERT INTO DESTINOS VALUES (10,DATOS_TDA('Coche','Estado nueva esparta'),empty_blob(),empty_blob(),
'Esta isla desértica forma parte de Nueva Esparta, el único estado insular venezolano, integrado además por las islas de Margarita y Cubagua. A la pequeña isla de 54 km2  se llega hasta su capital, San Pedro de Coche, por un pequeño aeropuerto o por transbordador desde la cercana isla de Margarita. El perímetro de la isla es de bellas playas, algunas azotadas por buenos vientos, ideales para los deportes de mar. La más frecuentada es Playa la Punta, una linda playa de mar en calma, aguas en varios tonos de azul y fina arena blanca, ideal para el windsurf y el kitesurf.'
);
INSERT INTO DESTINOS VALUES (11,DATOS_TDA('Cubagua','Estado Nueva esparta'),empty_blob(),empty_blob(),
'Es una isla deshabitada del estado Nueva Esparta que se hizo célebre desde el siglo XVI por sus ricos placeres de perlas, que eran extraídas de las profundidades por los indios guaiqueríes buceando a pulmón. Fue uno de las primeras poblaciones de los españoles en América, después que Colón descubrió la isla en su tercer viaje. El poblado fue destruido por un maremoto y el lugar ya no volvió a repoblarse, existiendo actualmente solo unas pocas casas de pescadores. Guarda algunas de las playas más vírgenes del país, a las que solo puede llegarse por embarcaciones, navegando unos 10 minutos desde la isla de Margarita. Entre estas playas están Charagato, Falucho y Cabecera.'
);
INSERT INTO DESTINOS VALUES (12,DATOS_TDA('Margarita','Estado Nueva esparta'),empty_blob(),empty_blob(),
'La isla más grande y poblada de Venezuela es también el principal destino turístico del país. Cuenta con la mayor concentración de hermosas playas, de todos los tipos, en todo el territorio nacional. Su oferta hotelera es amplia y tiene innumerables lugares históricos de interés, como templos, castillos y fortines de la época colonial. Su gastronomía es deliciosa, siendo sus platos estrella el sancocho de pescado y las empanadas de cazón. La capital de la isla es La Asunción, por historia, pero la ciudad más importante es la moderna Porlamar. Sus playas de buen oleaje están frente al Caribe abierto, como Playa El Agua, Guacuco y Playa Parguito. Del lado sur, frente a la isla de Coche, está El Yaque, uno de los santuarios mundiales del windsurf. El Parque Nacional Laguna de La Restiga, con su espectacular playa, es otro atractivo de gran interés.'
);
INSERT INTO DESTINOS VALUES (13,DATOS_TDA('Cayo sombrero','Parque Nacional morrocoy'),empty_blob(),empty_blob(),
'Una de las mejores playas de Venezuela es Cayo Sombrero, a decir verdad, es uno de los cayos más bonitos y grandes del Parque Nacional Morrocoy. Destaca por su belleza tropical, aguas cristalinas cálidas y poco profundas, además está rodeado de palmeras y arena blanca, lo cual lo hace propicio para disfrutar del mar y del sol. La única forma para llegar a este es en lancha, estas parten desde Chichiriviche o Tucacas por la mañana y vuelven por ti al atardecer.'
);
INSERT INTO DESTINOS VALUES (14,DATOS_TDA('Cayo sal','Parque Nacional morrocoy'),empty_blob(),empty_blob(),
'Si viajas con niños, una de las playas de Venezuela que debes visitar es Cayo Sal, aquí podrás disfrutar de turquesas aguas tranquilas y sin olas y blanca arena. Cayo sal es un lugar propicio para disfrutar de actividades como el snorkel, además, hacer recorridos por el lugar (que no es muy grande) Y como no, disfrutar de una rica comida caribeña a la orilla de esta hermosa playa y claro: hacer algunas fotos. '
);
INSERT INTO DESTINOS VALUES (15,DATOS_TDA('PLAYA PUNTA BRAVA','Parque Nacional morrocoy'),empty_blob(),empty_blob(),
'Otra de las playas de Falcón es Punta Brava, esta también se encuentra en un cayo, sin embargo, se puede acceder a esta a través de un puente. Punta Brava tiene arenas doradas y aguas apacibles que son perfectas para hacer snorkel. Esta playa es muy visitada durante carnaval, semana santa, diciembre y fines de semana.'
);

INSERT INTO SERVICIOS VALUES (1,'Servicio de crucero a LOS ROQUES');
INSERT INTO SERVICIOS VALUES (2,'Servicio de crucero a MORROCOY');
INSERT INTO SERVICIOS VALUES (3,'Servicio de crucero a Adicora');
INSERT INTO SERVICIOS VALUES (4,'Servicio de crucero a Bahica de cata');
INSERT INTO SERVICIOS VALUES (5,'Servicio de crucero a Choroni');
INSERT INTO SERVICIOS VALUES (6,'Servicio de crucero a PLaya Caribe');
INSERT INTO SERVICIOS VALUES (7,'Servicio de crucero a Las Isletas de piritu');
INSERT INTO SERVICIOS VALUES (8,'Servicio de crucero a Mochima');
INSERT INTO SERVICIOS VALUES (9,'Servicio de crucero a PLaya medina');
INSERT INTO SERVICIOS VALUES (10,'Servicio de crucero a Coche');
INSERT INTO SERVICIOS VALUES (11,'Servicio de crucero a Cubagua');
INSERT INTO SERVICIOS VALUES (12,'Servicio de crucero a Margarita');
INSERT INTO SERVICIOS VALUES (13,'Servicio de crucero a Cayo sombrero');
INSERT INTO SERVICIOS VALUES (14,'Servicio de crucero a Cayo sal');
INSERT INTO SERVICIOS VALUES (15,'Servicio de crucero a PLAYA PUNTA BRAVA');

INSERT INTO SERVICIOS VALUES (17,'Servicio de Transporte en el destino');
INSERT INTO SERVICIOS VALUES (18,'Servicio de Rentado de vehiculo');
INSERT INTO SERVICIOS VALUES (19,'Servicio de Kayak');
INSERT INTO SERVICIOS VALUES (20,'Servicio de Paseo acuatico');
INSERT INTO SERVICIOS VALUES (21,'Servicio de comida gourmet');
INSERT INTO SERVICIOS VALUES (22,'Servicio de Buceo');
INSERT INTO SERVICIOS VALUES (23,'Servicio de Internet');
INSERT INTO SERVICIOS VALUES (24,'Servicio de lavanderia');
INSERT INTO SERVICIOS VALUES (25,'Servicio de Cocteleria');
INSERT INTO SERVICIOS VALUES (26,'Servicio de Fotografia');
INSERT INTO SERVICIOS VALUES (27,'Servicio de guia turistico');
INSERT INTO SERVICIOS VALUES (28,'Servicio de botones (para el equipaje)');
INSERT INTO SERVICIOS VALUES (29,'Servicio de cuidado de ninos');
INSERT INTO SERVICIOS VALUES (16,'Servicio de Alojamiento en Margatita');
INSERT INTO SERVICIOS VALUES (30,'Servicio de Alojamiento en Los Roques');
INSERT INTO SERVICIOS VALUES (31,'Servicio de Alojamiento en Morrocoy');

INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(48),FECHAS_TDA.PRECIO_TOTAL(48,DATE '2021-1-1',DATE '2021-3-1')),12,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-1',DATE '2021-3-1')),16,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(5),FECHAS_TDA.PRECIO_TOTAL(5,DATE '2021-1-1',DATE '2021-3-1')),17,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(4),FECHAS_TDA.PRECIO_TOTAL(4,DATE '2021-1-1',DATE '2021-3-1')),18,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(8),FECHAS_TDA.PRECIO_TOTAL(8,DATE '2021-1-1',DATE '2021-3-1')),19,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(3),FECHAS_TDA.PRECIO_TOTAL(3,DATE '2021-1-1',DATE '2021-3-1')),20,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(3),FECHAS_TDA.PRECIO_TOTAL(3,DATE '2021-1-1',DATE '2021-3-1')),21,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(5),FECHAS_TDA.PRECIO_TOTAL(5,DATE '2021-1-1',DATE '2021-3-1')),22,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(8),FECHAS_TDA.PRECIO_TOTAL(8,DATE '2021-1-1',DATE '2021-3-1')),23,12);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(2),FECHAS_TDA.PRECIO_TOTAL(2,DATE '2021-1-1',DATE '2021-3-1')),24,12);

INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(49),FECHAS_TDA.PRECIO_TOTAL(49,DATE '2021-1-1',DATE '2021-2-28')),1,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-1',DATE '2021-2-28')),30,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(5),FECHAS_TDA.PRECIO_TOTAL(5,DATE '2021-1-1',DATE '2021-2-28')),17,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(4),FECHAS_TDA.PRECIO_TOTAL(4,DATE '2021-1-1',DATE '2021-2-28')),18,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(8),FECHAS_TDA.PRECIO_TOTAL(8,DATE '2021-1-1',DATE '2021-2-28')),19,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(3),FECHAS_TDA.PRECIO_TOTAL(3,DATE '2021-1-1',DATE '2021-2-28')),20,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(3),FECHAS_TDA.PRECIO_TOTAL(3,DATE '2021-1-1',DATE '2021-2-28')),21,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(5),FECHAS_TDA.PRECIO_TOTAL(5,DATE '2021-1-1',DATE '2021-2-28')),22,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(8),FECHAS_TDA.PRECIO_TOTAL(8,DATE '2021-1-1',DATE '2021-2-28')),23,1);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-2-28',FECHAS_TDA.VALIDACION_PRECIO(2),FECHAS_TDA.PRECIO_TOTAL(2,DATE '2021-1-1',DATE '2021-2-28')),24,1);

INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(50),FECHAS_TDA.PRECIO_TOTAL(50,DATE '2021-1-1',DATE '2021-3-1')),2,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-1',DATE '2021-3-1')),31,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(5),FECHAS_TDA.PRECIO_TOTAL(5,DATE '2021-1-1',DATE '2021-3-1')),17,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(4),FECHAS_TDA.PRECIO_TOTAL(4,DATE '2021-1-1',DATE '2021-3-1')),18,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(8),FECHAS_TDA.PRECIO_TOTAL(8,DATE '2021-1-1',DATE '2021-3-1')),19,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(3),FECHAS_TDA.PRECIO_TOTAL(3,DATE '2021-1-1',DATE '2021-3-1')),20,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(3),FECHAS_TDA.PRECIO_TOTAL(3,DATE '2021-1-1',DATE '2021-3-1')),21,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(5),FECHAS_TDA.PRECIO_TOTAL(5,DATE '2021-1-1',DATE '2021-3-1')),22,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(8),FECHAS_TDA.PRECIO_TOTAL(8,DATE '2021-1-1',DATE '2021-3-1')),23,2);
INSERT INTO HIS_SERVICIOS VALUES (DATE '2021-1-1',FECHAS_TDA(DATE '2021-1-1',DATE '2021-3-1',FECHAS_TDA.VALIDACION_PRECIO(2),FECHAS_TDA.PRECIO_TOTAL(2,DATE '2021-1-1',DATE '2021-3-1')),24,2);



INSERT INTO CRUCEROS VALUES (1, DATOS_TDA('EC-1','Un crucero con muchos salones de conciertos'),empty_blob(),1);
INSERT INTO CRUCEROS VALUES (2, DATOS_TDA('EC-2','Tiene mucho arte barroco'),empty_blob(),2);
INSERT INTO CRUCEROS VALUES (3, DATOS_TDA('EC-3','Inspirado en el titanic'),empty_blob(),3);
INSERT INTO CRUCEROS VALUES (4, DATOS_TDA('EC-4','Crucero sencillo pero comodo'),empty_blob(),4);
INSERT INTO CRUCEROS VALUES (5, DATOS_TDA('EC-5','Especial para Viajes largos'),empty_blob(),5);
INSERT INTO CRUCEROS VALUES (6, DATOS_TDA('EC-6','Para viajes pequenos'),empty_blob(),6);
INSERT INTO CRUCEROS VALUES (7, DATOS_TDA('EC-7','Muy amigable para los ninos'),empty_blob(),7);
INSERT INTO CRUCEROS VALUES (8, DATOS_TDA('EC-8','Crucero lleno de esculturas'),empty_blob(),8);
INSERT INTO CRUCEROS VALUES (9, DATOS_TDA('EC-9','Muchos salones de concierto'),empty_blob(),9);
INSERT INTO CRUCEROS VALUES (10, DATOS_TDA('EC-10','Tiene muchas discotecas'),empty_blob(),10);
INSERT INTO CRUCEROS VALUES (11, DATOS_TDA('EC-11','Crucero de Lujo para pocas personas'),empty_blob(),11);
INSERT INTO CRUCEROS VALUES (12, DATOS_TDA('EC-12','Crucero de Lujo para muchas personas'),empty_blob(),12);
INSERT INTO CRUCEROS VALUES (13, DATOS_TDA('EC-13','Crucero estandar'),empty_blob(),13);
INSERT INTO CRUCEROS VALUES (14, DATOS_TDA('EC-14','Crucero para viajes muy largos'),empty_blob(),14);
INSERT INTO CRUCEROS VALUES (15, DATOS_TDA('EC-15','Crucero para viajes muy pequenos'),empty_blob(),15);


INSERT INTO MANTENIMIENTOS VALUES (1,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(5)),'Cambio de aceite');
INSERT INTO MANTENIMIENTOS VALUES (2,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(15)),'Pintura externa');
INSERT INTO MANTENIMIENTOS VALUES (3,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(4)),'Chequeo motor');
INSERT INTO MANTENIMIENTOS VALUES (4,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(15)),'Limpieza de vidrios');
INSERT INTO MANTENIMIENTOS VALUES (5,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(20)),'Cambio de filtros');
INSERT INTO MANTENIMIENTOS VALUES (6,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(30)),'Cambio Aletas');
INSERT INTO MANTENIMIENTOS VALUES (7,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(5)),'Servicio de gas');
INSERT INTO MANTENIMIENTOS VALUES (8,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(10)),'Limpieza de los tanques');
INSERT INTO MANTENIMIENTOS VALUES (9,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(10)),'Cambio de luces');
INSERT INTO MANTENIMIENTOS VALUES (10,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(3)),'Calibracion del GPS');
INSERT INTO MANTENIMIENTOS VALUES (11,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(5)),'Inspeccion de botes de seguridad');
INSERT INTO MANTENIMIENTOS VALUES (12,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(3)),'Inspeccion de chalecos salvavidas');
INSERT INTO MANTENIMIENTOS VALUES (13,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(15)),'Limpieza de tuberias internas');
INSERT INTO MANTENIMIENTOS VALUES (14,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(20)),'Limpieza de camarotes');
INSERT INTO MANTENIMIENTOS VALUES (15,PRECIO_TDA(PRECIO_TDA.VALIDACION_MONTO(10)),'Limpieza de piscina');

INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,1);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,2);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,3);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,4);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,5);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,6);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,7);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,8);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,9);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,10);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,11);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,12);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,13);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,14);
INSERT INTO HIS_MANTENIMIENTOS VALUES (DATE '2021-1-10',DATE '2021-2-10',1,15);

INSERT INTO PAQUETES VALUES (1,DATOS_TDA('E-C Margarita','Un paquete hacia la isla de margarita'),0);
INSERT INTO PAQUETES VALUES (2,DATOS_TDA('E-C Los Roques','Un paquete por los roques'),0);
INSERT INTO PAQUETES VALUES (3,DATOS_TDA('E-C Morrocoy','Un paquete hacia el parque nacional morrocoy'),0);
INSERT INTO PAQUETES VALUES (4,DATOS_TDA('E-C Adicora','Un paquete Por adicora'),0);
INSERT INTO PAQUETES VALUES (5,DATOS_TDA('E-C Falcon','Un paquete hacia el parque nacional morrocoy'),0);
INSERT INTO PAQUETES VALUES (6,DATOS_TDA('E-C Cata','Un paquete por la bahia de cata'),0);
INSERT INTO PAQUETES VALUES (7,DATOS_TDA('E-C Choroni','Un paquete hacia choroni'),0);
INSERT INTO PAQUETES VALUES (8,DATOS_TDA('E-C Caribe','Un paquete por las costas del caribe'),0);
INSERT INTO PAQUETES VALUES (9,DATOS_TDA('E-C Piritu','Un paquete por puerto piritu'),0);
INSERT INTO PAQUETES VALUES (10,DATOS_TDA('E-C Mochima','Un paquete por mochima'),0);
INSERT INTO PAQUETES VALUES (11,DATOS_TDA('E-C Playa medina','Un paquete hacia un paisage idilico'),0);
INSERT INTO PAQUETES VALUES (12,DATOS_TDA('E-C Coche','Un paquete hacia las una de las playas mas cristalinas'),0);
INSERT INTO PAQUETES VALUES (13,DATOS_TDA('E-C Cubagua','Un paquete hacia un lugar poco comun'),0);
INSERT INTO PAQUETES VALUES (14,DATOS_TDA('E-C La Orchila','Un paquete hacia la isla presidencial'),0);
INSERT INTO PAQUETES VALUES (15,DATOS_TDA('E-C Dependencias Federales','Un paquete por las hermosas dependencias federales'),0);

INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-1-20',FECHAS_TDA.VALIDACION_PRECIO(100.1),FECHAS_TDA.PRECIO_TOTAL(100.1,DATE '2021-1-10',DATE '2021-1-20')),1000,12,1);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-1-20',FECHAS_TDA.VALIDACION_PRECIO(20),FECHAS_TDA.PRECIO_TOTAL(20,DATE '2021-1-10',DATE '2021-1-20')),1000,16,1);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-1-20',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-10',DATE '2021-1-20')),1000,17,1);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-1-20',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-10',DATE '2021-1-20')),1000,18,1);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-1-20',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-10',DATE '2021-1-20')),1000,19,1);

INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-2-2',FECHAS_TDA.VALIDACION_PRECIO(100),FECHAS_TDA.PRECIO_TOTAL(100,DATE '2021-1-10',DATE '2021-2-2')),500,1,2);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-2-2',FECHAS_TDA.VALIDACION_PRECIO(20),FECHAS_TDA.PRECIO_TOTAL(20,DATE '2021-1-10',DATE '2021-2-2')),500,16,2);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-2-2',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-10',DATE '2021-2-2')),500,17,2);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-2-2',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-10',DATE '2021-2-2')),500,18,2);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-10',FECHAS_TDA(DATE '2021-1-10',DATE '2021-2-2',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-10',DATE '2021-2-2')),500,19,2);

INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-5',FECHAS_TDA(DATE '2021-1-5',DATE '2021-1-30',FECHAS_TDA.VALIDACION_PRECIO(100),FECHAS_TDA.PRECIO_TOTAL(100,DATE '2021-1-5',DATE '2021-1-30')),300,2,3);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-5',FECHAS_TDA(DATE '2021-1-5',DATE '2021-1-30',FECHAS_TDA.VALIDACION_PRECIO(20),FECHAS_TDA.PRECIO_TOTAL(20,DATE '2021-1-5',DATE '2021-1-30')),300,16,3);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-5',FECHAS_TDA(DATE '2021-1-5',DATE '2021-1-30',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-5',DATE '2021-1-30')),300,17,3);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-5',FECHAS_TDA(DATE '2021-1-5',DATE '2021-1-30',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-5',DATE '2021-1-30')),300,18,3);
INSERT INTO HIS_PAQUETES VALUES (DATE '2021-1-5',FECHAS_TDA(DATE '2021-1-5',DATE '2021-1-30',FECHAS_TDA.VALIDACION_PRECIO(10),FECHAS_TDA.PRECIO_TOTAL(10,DATE '2021-1-5',DATE '2021-1-30')),300,19,3);


INSERT INTO PAISES VALUES (1,'Venezuela',empty_blob(),'AM');
INSERT INTO PAISES VALUES (2,'EEUU',empty_blob(),'AM');
INSERT INTO PAISES VALUES (3,'China',empty_blob(),'AS');
INSERT INTO PAISES VALUES (4,'Rusia',empty_blob(),'AS');
INSERT INTO PAISES VALUES (5,'Alemania',empty_blob(),'EU');
INSERT INTO PAISES VALUES (6,'Reino Unido',empty_blob(),'EU');
INSERT INTO PAISES VALUES (7,'Japon',empty_blob(),'AS');
INSERT INTO PAISES VALUES (8,'Francia',empty_blob(),'EU');
INSERT INTO PAISES VALUES (9,'Corea del Sur',empty_blob(),'AS');
INSERT INTO PAISES VALUES (10,'Argentina',empty_blob(),'AM');
INSERT INTO PAISES VALUES (11,'Colombia',empty_blob(),'AM');
INSERT INTO PAISES VALUES (12,'Ecuador',empty_blob(),'AM');
INSERT INTO PAISES VALUES (13,'Mexico',empty_blob(),'AM');
INSERT INTO PAISES VALUES (14,'Canada',empty_blob(),'AM');
INSERT INTO PAISES VALUES (15,'Chile',empty_blob(),'AM');

INSERT INTO PROVEEDORES VALUES (1,'HILTON', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (2,'ALBA', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (3,'HISPERIA HOLTES', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (4,'ACCOR', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (5,'WYNDHAM HOTELS', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (6,'BTG HOTELS', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (7,'BWH HOTEL GROUP', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (8,'CHEVROLET HOTELS', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (9,'INTERCONTINENTAL GROUP', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (10,'IDAHO SUMEL', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (11,'NEW CENTURY HOTELS', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (12,'EUROBUILDING AMERICA', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (13,'PASEO LAS MERCEDES', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (14,'ADICORA CARIBEAN HOTELS', empty_blob(),empty_blob());
INSERT INTO PROVEEDORES VALUES (15,'PIRITU HOTELS GROUP', empty_blob(),empty_blob());

INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 1,1);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 2,2);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 3,3);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 4,4);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 5,5);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 6,6);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 7,7);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 8,8);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 9,9);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 10,10);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 11,11);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 12,12);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 13,13);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 14,14);
INSERT INTO HIS_ALIANZAS VALUES (DATE '2021-1-1',NULL, 15,15);

INSERT INTO CLIENTES VALUES (1,'Froilan','Roa','froilan@gmail.com',null,1);
INSERT INTO CLIENTES VALUES (2,'Alejandro','Corredor','alejandroco@gmail.com',null,2);
INSERT INTO CLIENTES VALUES (3,'Fernando','Silva','fsilva@gmail.com',null,3);
INSERT INTO CLIENTES VALUES (4,'Juan','Perez','jperez@gmail.com',null,4);
INSERT INTO CLIENTES VALUES (5,'Carla','Paez','kpsdc@hotmail.com',null,5);
INSERT INTO CLIENTES VALUES (6,'Jose','Caceres','ccaceres19@gmail.com',null,6);
INSERT INTO CLIENTES VALUES (7,'Obdulio','Ferrer','obse@gmail.com',null,7);
INSERT INTO CLIENTES VALUES (8,'Evelin','Bastidas','evabastidas@hotmail.com',null,8);
INSERT INTO CLIENTES VALUES (9,'Greicy','Chacon','gchacon@gmail.com',null,9);
INSERT INTO CLIENTES VALUES (10,'Marcos','Perez','mpjimenez@gmail.com',null,10);
INSERT INTO CLIENTES VALUES (11,'Juan','Gomez','jvicente@hotmail.com',null,11);
INSERT INTO CLIENTES VALUES (12,'Romulo','Betancourt','rbe.venezuela@gmail.com',null,12);
INSERT INTO CLIENTES VALUES (13,'Eleazar','Lopez','eleazarlopez@gmail.com',null,13);
INSERT INTO CLIENTES VALUES (14,'Isaias','Medina','i.media@hotmail.com',null,14);
INSERT INTO CLIENTES VALUES (15,'Willian','Gandino','wgand@gmail.com',null,15);

INSERT INTO PCRS VALUES (1,DATE '2021-3-1',0,1,1);
INSERT INTO PCRS VALUES (2,DATE '2021-3-2',0,2,2);
INSERT INTO PCRS VALUES (3,DATE '2021-3-3',0,3,3);
INSERT INTO PCRS VALUES (4,DATE '2021-3-4',0,4,4);
INSERT INTO PCRS VALUES (5,DATE '2021-3-5',0,5,5);
INSERT INTO PCRS VALUES (6,DATE '2021-3-6',0,6,6);
INSERT INTO PCRS VALUES (7,DATE '2021-3-7',0,7,7);
INSERT INTO PCRS VALUES (8,DATE '2021-3-8',0,8,8);
INSERT INTO PCRS VALUES (9,DATE '2021-3-9',0,9,9);
INSERT INTO PCRS VALUES (10,DATE '2021-3-10',0,10,10);
INSERT INTO PCRS VALUES (11,DATE '2021-3-11',0,11,11);
INSERT INTO PCRS VALUES (12,DATE '2021-3-12',0,12,12);
INSERT INTO PCRS VALUES (13,DATE '2021-3-13',0,13,13);
INSERT INTO PCRS VALUES (14,DATE '2021-3-14',0,14,14);
INSERT INTO PCRS VALUES (15,DATE '2021-3-15',0,15,15);

INSERT INTO FACTURAS VALUES (1,DATE '2021-1-1',2850,'OTRO','AGENCIA FISICA',1,1);
INSERT INTO FACTURAS VALUES (2,DATE '2021-1-2',3450,'OTRO','AGENCIA FISICA',2,2);
INSERT INTO FACTURAS VALUES (3,DATE '2021-1-3',3750,'OTRO','AGENCIA FISICA',3,3);
INSERT INTO FACTURAS VALUES (4,DATE '2021-1-4',2850,'OTRO','AGENCIA FISICA',4,4);
INSERT INTO FACTURAS VALUES (5,DATE '2021-1-5',3450,'OTRO','AGENCIA FISICA',5,5);
INSERT INTO FACTURAS VALUES (6,DATE '2021-1-6',3750,'OTRO','AGENCIA FISICA',6,6);
INSERT INTO FACTURAS VALUES (7,DATE '2021-1-7',2850,'OTRO','AGENCIA FISICA',7,7);
INSERT INTO FACTURAS VALUES (8,DATE '2021-1-8',3450,'OTRO','AGENCIA FISICA',8,8);
INSERT INTO FACTURAS VALUES (9,DATE '2021-1-9',3750,'OTRO','AGENCIA FISICA',9,9);
INSERT INTO FACTURAS VALUES (10,DATE '2021-1-10',2850,'OTRO','AGENCIA FISICA',10,10);
INSERT INTO FACTURAS VALUES (11,DATE '2021-1-11',3450,'OTRO','AGENCIA FISICA',11,11);
INSERT INTO FACTURAS VALUES (12,DATE '2021-1-12',3750,'OTRO','AGENCIA FISICA',12,12);
INSERT INTO FACTURAS VALUES (13,DATE '2021-1-13',2850,'OTRO','AGENCIA FISICA',13,13);
INSERT INTO FACTURAS VALUES (14,DATE '2021-1-14',3450,'OTRO','AGENCIA FISICA',14,14);
INSERT INTO FACTURAS VALUES (15,DATE '2021-1-15',3750,'OTRO','AGENCIA FISICA',15,15);

INSERT INTO DET_FACTURAS VALUES (1,1,1,1,1,1);
INSERT INTO DET_FACTURAS VALUES (2,1,2,2,2,2);
INSERT INTO DET_FACTURAS VALUES (3,1,3,3,3,3);
INSERT INTO DET_FACTURAS VALUES (4,1,1,4,4,4);
INSERT INTO DET_FACTURAS VALUES (5,1,2,5,5,5);
INSERT INTO DET_FACTURAS VALUES (6,1,3,6,6,6);
INSERT INTO DET_FACTURAS VALUES (7,1,1,7,7,7);
INSERT INTO DET_FACTURAS VALUES (8,1,2,8,8,8);
INSERT INTO DET_FACTURAS VALUES (9,1,3,9,9,9);
INSERT INTO DET_FACTURAS VALUES (10,1,1,10,10,10);
INSERT INTO DET_FACTURAS VALUES (11,1,2,11,11,11);
INSERT INTO DET_FACTURAS VALUES (12,1,3,12,12,12);
INSERT INTO DET_FACTURAS VALUES (13,1,1,13,13,13);
INSERT INTO DET_FACTURAS VALUES (14,1,2,14,14,14);
INSERT INTO DET_FACTURAS VALUES (15,1,3,15,15,15);

INSERT INTO FORMAS_PAGO VALUES (1,PRECIO_TDA(2850),'TDC',1,1,1);
INSERT INTO FORMAS_PAGO VALUES (2,PRECIO_TDA(3450),'TDC',2,2,2);
INSERT INTO FORMAS_PAGO VALUES (3,PRECIO_TDA(3750),'TDC',3,3,3);
INSERT INTO FORMAS_PAGO VALUES (4,PRECIO_TDA(2850),'TDC',4,4,4);
INSERT INTO FORMAS_PAGO VALUES (5,PRECIO_TDA(3450),'TDC',5,5,5);
INSERT INTO FORMAS_PAGO VALUES (6,PRECIO_TDA(3750),'TDC',6,6,6);
INSERT INTO FORMAS_PAGO VALUES (7,PRECIO_TDA(2850),'TDC',7,7,7);
INSERT INTO FORMAS_PAGO VALUES (8,PRECIO_TDA(3450),'TDC',8,8,8);
INSERT INTO FORMAS_PAGO VALUES (9,PRECIO_TDA(3750),'TDC',9,9,9);
INSERT INTO FORMAS_PAGO VALUES (10,PRECIO_TDA(2850),'TDC',10,10,10);
INSERT INTO FORMAS_PAGO VALUES (11,PRECIO_TDA(3450),'TDC',11,11,11);
INSERT INTO FORMAS_PAGO VALUES (12,PRECIO_TDA(3750),'TDC',12,12,12);
INSERT INTO FORMAS_PAGO VALUES (13,PRECIO_TDA(2850),'TDC',13,13,13);
INSERT INTO FORMAS_PAGO VALUES (14,PRECIO_TDA(3450),'TDC',14,14,14);
INSERT INTO FORMAS_PAGO VALUES (15,PRECIO_TDA(3750),'TDC',15,15,15);

INSERT INTO OBSERVACION VALUES (1,DATE '2021-2-1',':|',1,1,1);
INSERT INTO OBSERVACION VALUES (2,DATE '2021-2-1',':)',2,2,2);
INSERT INTO OBSERVACION VALUES (3,DATE '2021-2-1',':)',3,3,3);
INSERT INTO OBSERVACION VALUES (4,DATE '2021-2-1',':)',4,4,4);
INSERT INTO OBSERVACION VALUES (5,DATE '2021-2-1',':|',5,5,5);
INSERT INTO OBSERVACION VALUES (6,DATE '2021-2-1',':(',6,6,6);
INSERT INTO OBSERVACION VALUES (7,DATE '2021-3-1',':|',7,7,7);
INSERT INTO OBSERVACION VALUES (8,DATE '2021-3-1',':)',8,8,8);
INSERT INTO OBSERVACION VALUES (9,DATE '2021-3-1',':)',9,9,9);
INSERT INTO OBSERVACION VALUES (10,DATE '2021-3-1',':)',1,10,10);
INSERT INTO OBSERVACION VALUES (11,DATE '2021-3-1',':)',2,11,11);
INSERT INTO OBSERVACION VALUES (12,DATE '2021-3-1',':|',3,12,12);
INSERT INTO OBSERVACION VALUES (13,DATE '2021-3-1',':(',7,13,13);
INSERT INTO OBSERVACION VALUES (14,DATE '2021-3-1',':)',5,14,14);
INSERT INTO OBSERVACION VALUES (15,DATE '2021-3-1',':|',4,15,15);

INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (1,'Servicio muy mal organizado',1,1,1,1);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (2,'Muy agradable el crucero',2,2,2,2);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (3,'Me gusto el servicio',3,3,3,3);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (4,'Servicio ameno',4,4,4,4);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (5,'Puede mejorar',5,5,5,5);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (6,'Muy mal organizado todo',6,6,6,6);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (7,'Los trabajadores estaban de mal genio',7,7,7,7);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (8,'Muy satisfecho',8,8,8,8);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (9,'Lo repetiria',9,9,9,9);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (10,'Increible todo',10,1,10,10);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (11,'Buena relacion calidad-precio',11,2,11,11);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (12,'Un poco costoso para el servicio',12,3,12,12);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (13,'Demasiado caro y todo bastante en mal estado',13,7,13,13);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (14,'Muy agradable el ambiente',14,5,14,14);
INSERT INTO COMENTARIOS_OBSERVACIONES VALUES (15,'Me parece que pague mucho por todo lo que hice',15,4,15,15);

