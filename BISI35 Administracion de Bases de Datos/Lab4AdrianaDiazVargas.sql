--CLASE 4

--CAMBIO DE BD
USE MASTER
GO

--CREAR BASE DE DATOS
CREATE DATABASE Empresa
GO

--CAMBIO DE BASE DE DATOS
USE Empresa
GO

--CREAR TABLA VENTA (NO PARTICIONADA)
CREATE TABLE dbo.Ciudadano
(
	IDciudadano INT NOT NULL,
	Nombre VARCHAR (50) NOT NULL,
	Ciudad NVARCHAR (50) NOT NULL,
	Edad INT NOT NULL,
	Direccion VARCHAR (100) NOT NULL,
	CONSTRAINT PK_ciudadano PRIMARY KEY NONCLUSTERED (IDciudadano, Ciudad)  --PK compuesto de dos campos
)
ON EsquemaParticionAnual (Ciudad); --ejecute pasos de mas abajo primero para ahorrar el crear una tabla nueva
GO
--los 900 inserts para la tabla dbo.ciudadno
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65301197, 'Trix', 'Gaoling', 75, 'Room 1191');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64103833, 'Wynne', 'Xagmakajor', 97, 'Apt 581');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63101454, 'Merrel', 'Villa Bisonó', 56, 'PO Box 2530');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52000016, 'Halsey', 'Ganping', 52, 'Suite 36');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61000256, 'Yasmin', 'Radišići', 81, 'Apt 1543');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125108463, 'Karlie', 'Nikol’sk', 93, 'Room 1760');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (44108641, 'Jeremiah', 'Hecheng', 40, 'Apt 752');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107004695, 'Dianne', 'Tambak', 93, 'PO Box 35123');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53101121, 'Dolorita', 'Vidin', 34, 'Apt 1846');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81504855, 'Osbourne', 'Inowrocław', 71, '17th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122038442, 'Dilly', 'Bollnäs', 94, 'Apt 1673');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102101823, 'Layne', 'Svetlogorsk', 58, 'PO Box 86929');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125108463, 'Giusto', 'Haukivuori', 55, 'Suite 90');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64107729, 'Carry', 'Tegalgede Kulon', 77, 'Suite 63');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101113841, 'Thomasina', 'Sawankhalok', 37, 'Apt 729');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122039360, 'August', 'Divnomorskoye', 61, 'Room 521');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104914160, 'Anabelle', 'Karangkeng', 65, 'Room 980');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11401135, 'Adamo', 'Daba', 32, 'PO Box 46869');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (322284892, 'Aldwin', 'Cidamar', 59, 'Room 1987');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121181730, 'Clarice', 'Viline', 20, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107006305, 'Wally', 'Mairana', 36, 'Room 913');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103111252, 'Evangeline', 'Kanbula', 20, 'PO Box 12209');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31315382, 'Edithe', 'Härnösand', 100, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21308176, 'Wilburt', 'Qŭshkŭpir', 95, 'PO Box 80416');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64002280, 'Abagail', 'Wang Muang', 40, 'Room 468');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (231371841, 'Sheila', 'Kamieniec Wrocławski', 29, '8th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91300719, 'Carmen', 'São Pedro de Muel', 66, 'Apt 1834');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75905431, 'Daloris', 'La Unión', 17, 'PO Box 90690');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63015537, 'Ollie', 'Cacoal', 90, 'Apt 1814');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11104050, 'Gamaliel', 'Capacho Viejo', 49, 'Room 63');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64109073, 'Rubie', 'San Alberto', 71, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (226071091, 'Sibeal', 'Kaduseeng', 22, 'PO Box 11826');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91803290, 'Felic', 'Karpogory', 39, 'PO Box 91897');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11110701, 'Anselm', 'Santa María del Real', 28, 'Suite 25');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84205559, 'Marius', 'Šenkovec', 22, 'PO Box 21210');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64009144, 'Mayor', 'Baylo', 54, 'Suite 56');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (261378652, 'Dara', 'Ilembula', 48, 'Suite 2');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67002436, 'Tobey', 'Skibbereen', 26, 'Room 830');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82900937, 'Annamarie', 'Fastovetskaya', 17, 'PO Box 95170');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61101799, 'Christabella', 'Beiquan', 100, 'Suite 92');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83905546, 'Lindsay', 'Polonnaruwa', 60, 'Suite 45');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (253278498, 'Roddie', 'Sumuranyar', 44, 'PO Box 50555');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103912956, 'Colan', 'Knyaginino', 84, '12th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83907913, 'Vi', 'Jurm', 21, 'PO Box 74382');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81207097, 'Tadeo', 'Nesterovskaya', 99, 'PO Box 42566');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53185079, 'Aile', 'Providencia', 4, 'Room 365');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71924393, 'Carver', 'Zamarski', 84, 'Apt 1343');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72400052, 'Raynell', 'Nikkō', 90, 'PO Box 45079');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75912165, 'Franky', 'Xiushi', 86, 'PO Box 52465');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73900580, 'Nicky', 'Usukhchay', 26, '12th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81912379, 'Stevana', 'Qitao', 55, 'PO Box 64287');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103111252, 'Justinian', 'Chartres', 88, 'PO Box 974');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111904231, 'Adelind', 'Kota Bharu', 50, 'Apt 137');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73906306, 'Dulci', 'Skelivka', 89, 'Apt 99');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122101010, 'Myrta', 'Owerri', 95, 'Suite 31');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74906800, 'Curran', 'Compostela', 5, 'Suite 66');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84303008, 'Mallorie', 'San Pedro', 21, 'Room 384');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83900680, 'Avie', 'El Carmen', 48, 'Apt 1628');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122243172, 'Korney', 'Fahraj', 3, 'Apt 18');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111104785, 'Padraig', 'Chishui', 95, 'Room 724');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (311078802, 'Ludovika', 'Bošovice', 99, 'Room 221');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83900732, 'Nikaniki', 'Grindavík', 10, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73908731, 'Franklyn', 'Puerto Quellón', 49, '8th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113101773, 'Mary', 'Bamencheng', 13, 'Suite 90');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92101085, 'Melloney', 'Cilegi', 48, 'PO Box 75323');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121140933, 'Allistir', 'Bandungsari', 32, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114907387, 'Zebedee', 'Korosten’', 4, 'Apt 85');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101114031, 'Augustine', 'Ōiso', 5, 'PO Box 65810');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84301372, 'Gay', 'Mionica', 6, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64103914, 'Clarie', 'Smarhon’', 42, 'PO Box 15107');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91213877, 'Leisha', 'Perbaungan', 12, 'Apt 1004');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102001017, 'Dodi', 'Zabaykal’sk', 47, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73910114, 'Norton', 'Nový Hrozenkov', 18, 'Room 1673');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111905230, 'Philomena', 'Leer', 87, 'Suite 54');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82906258, 'Jarret', 'Baranusa', 34, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61204612, 'Alexander', 'Lidoríki', 6, 'Suite 3');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114917908, 'Kirstyn', 'Ngrambitan', 67, 'Suite 84');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107005490, 'Allianora', 'Sumberkenanga', 39, 'Suite 34');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (226071389, 'Alicea', 'North Perth', 51, 'Room 1539');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121135773, 'Erastus', 'Kambia', 25, 'Room 20');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (44108641, 'Mahala', 'Kil’mez’', 88, 'Room 899');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (271971829, 'Margi', 'Shashemenē', 13, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91311135, 'Ira', 'Zhangduangu', 97, 'Room 520');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52101106, 'Vinni', 'Nanling', 82, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104000058, 'Giacinta', 'Kolodenka', 42, 'Apt 895');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107006664, 'Corabel', 'Kokemäki', 51, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241272053, 'Ellie', 'Jastrzębia', 49, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11601074, 'Aharon', 'Taen Tengah', 96, 'Room 25');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31317380, 'Horacio', 'Stěžery', 36, 'PO Box 32974');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31200730, 'Amble', 'Tumba', 53, '4th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211371638, 'Lennie', 'Cavadas', 66, 'Apt 702');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107002118, 'Jeramey', 'Pazin', 89, 'PO Box 19049');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62206431, 'Augustus', 'Sobreira', 86, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71923336, 'Conney', 'San José', 49, 'Apt 986');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61202245, 'Lucretia', 'Leitões', 98, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71214579, 'Wayne', 'Shibata', 91, 'Suite 51');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71000301, 'Bliss', 'Dachun', 21, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84201443, 'Sacha', 'San Benito', 89, 'Suite 64');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91901561, 'Ritchie', 'Nkoteng', 40, 'Room 1287');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211070175, 'Rey', 'Saint Petersburg', 46, 'Apt 197');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82901897, 'Grethel', 'Thị Trấn Phù Yên', 89, '17th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72412985, 'Peterus', 'Yantai', 94, 'Room 1741');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51900366, 'Paige', 'Miyazaki-shi', 23, 'Suite 14');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103103396, 'Archibold', 'Haapsalu', 77, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107005801, 'Joanie', 'Särkisalo', 73, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63114360, 'Ronald', 'Beipai', 63, 'Suite 4');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102103287, 'Waylen', 'Ust’-Kut', 92, 'Room 865');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65302196, 'Byram', 'Cagbang', 11, 'Room 438');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101105257, 'Roxanna', 'Baruta', 92, 'Suite 100');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101205681, 'Louise', 'Aranhas', 67, 'Apt 823');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91811758, 'Jan', 'Burla', 1, 'Room 786');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81905344, 'Emmalynn', 'Baimaqiao', 43, 'Room 261');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122101191, 'Andreas', 'Quintã', 65, 'PO Box 38294');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122038251, 'Nevin', 'Leeuwarden', 41, 'Apt 1303');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21207413, 'Valentijn', 'Yajin', 95, 'Suite 13');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107000796, 'Tracee', 'Ramat Yishay', 12, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91405258, 'Hy', 'Shigu', 52, 'PO Box 12695');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122101010, 'Archaimbaud', 'Shishang', 18, 'Room 442');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81509737, 'Waite', 'San Pedro', 79, 'PO Box 2714');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62205908, 'Guthrey', 'Hewa', 46, 'PO Box 75122');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114915081, 'Myer', 'Psary', 25, 'PO Box 65652');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111306059, 'Davis', 'Magtaking', 33, 'Apt 468');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92902352, 'Stuart', 'Huohua', 73, 'Apt 1680');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82902472, 'Emilee', 'Ábrego', 13, 'Apt 1709');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51403630, 'Patricia', 'Maae', 69, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71922696, 'Philbert', 'Taotang', 11, 'PO Box 12470');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31301846, 'Adrian', 'Cisiec', 67, 'PO Box 64444');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (231271226, 'Budd', 'Hellevoetsluis', 60, 'Apt 589');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (292977831, 'Garvy', 'Pirapozinho', 95, 'Apt 1976');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64204703, 'Kaylee', 'Pinheiro Machado', 18, 'Suite 69');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75909903, 'Carlye', 'Magisterial', 13, 'Room 1508');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102301050, 'Lennie', 'Araras', 79, 'Room 1138');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81309364, 'Osgood', 'Balakliya', 6, 'Room 806');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (112307222, 'Shela', 'Sinjil', 1, 'Apt 632');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51408936, 'Sibyl', 'Karangasem', 35, 'Room 1851');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (284170468, 'Claire', 'Shirone', 66, 'PO Box 85988');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65306079, 'Lowell', 'Ishkhoy-Yurt', 7, 'Apt 280');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61206982, 'Nealson', 'Heiheba', 70, 'Apt 941');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107089555, 'Lionello', 'Yancheng', 100, 'Room 234');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67091719, 'Kim', 'Casais Brancos', 68, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102301092, 'Penn', 'Mafeteng', 46, 'Suite 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21404465, 'Eileen', 'Tielu', 54, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (22306960, 'Clarabelle', 'Ţāqchah Khānah', 83, 'Apt 244');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (274970843, 'Boigie', 'Verdun', 67, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71922340, 'Meghan', 'Makilala', 36, 'PO Box 76770');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103110237, 'Andie', 'Puerto Plata', 52, 'Suite 32');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (43300738, 'Noel', 'Heping', 40, 'Room 1264');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63115437, 'Shelby', 'Al Marj', 34, 'Apt 542');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74907414, 'Byron', 'Luzino', 21, 'Room 1795');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121142627, 'Kelwin', 'Sohbatpur', 11, 'PO Box 57618');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (221970346, 'Devon', 'Musashino', 68, 'Room 1357');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241270039, 'Mort', 'Murowana Goślina', 57, 'PO Box 22194');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (271984162, 'Courtnay', 'Pilníkov', 90, 'Suite 48');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (254070132, 'Carita', 'Huji', 13, 'Apt 1962');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41201936, 'Herby', 'La Playosa', 24, 'Suite 9');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21302622, 'Tana', 'Bayt ‘Adhāqah', 30, 'Suite 46');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114902777, 'Emyle', 'Muarabadak', 19, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211872959, 'Leigha', 'Nanae', 31, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107006091, 'Patrica', 'Valence', 67, 'Room 1341');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (44115511, 'Elene', 'Salcedo', 51, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114000718, 'Emile', 'Nawal', 50, 'Apt 1285');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111904998, 'Berny', 'Péfki', 31, 'Room 349');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125106986, 'Matthias', 'Taiyuan', 79, 'Room 1273');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73918569, 'Berke', 'Maceió', 58, 'PO Box 56634');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122105249, 'Blaire', 'Ždánice', 54, 'Apt 1227');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84200981, 'Nathalia', 'San Marcos', 89, 'PO Box 81597');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72013915, 'Moses', 'Ragay', 99, 'Suite 76');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111924363, 'Jeni', 'Oliveirinha', 100, 'PO Box 12818');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (242272612, 'Averill', 'Nanortalik', 2, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61203325, 'Ashil', 'Šilheřovice', 4, 'Apt 917');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113102442, 'Anet', 'Trail', 35, 'Suite 23');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65000090, 'Linet', 'Białobrzegi', 69, 'Apt 357');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111300880, 'Norrie', 'Bauta', 57, 'PO Box 76120');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111302587, 'Cindy', 'Kunheda Woerzu Manzu', 19, 'Room 582');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (251473091, 'Cherrita', 'Kańczuga', 84, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111901454, 'Leontine', 'Knysna', 79, 'Suite 53');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11100805, 'Annamaria', 'Phatthalung', 98, 'Apt 512');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53110633, 'Kamila', 'Uherský Ostroh', 53, 'Suite 37');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (267083763, 'Roobbie', 'Hrádek', 73, 'Suite 70');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74900194, 'Aleta', 'Hŭngnam', 49, 'PO Box 74946');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104101465, 'Elna', 'Qiucun', 14, 'PO Box 14358');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111304093, 'Ericka', 'Tepusteca', 40, 'Suite 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72409794, 'Zia', 'Cabo', 98, 'Suite 12');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111313000, 'Kassey', 'Marka', 11, 'Room 1443');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41215278, 'Dewie', 'Ulset', 98, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113123560, 'Reeta', 'Dal’neye Konstantinovo', 32, 'Suite 21');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91408297, 'Jayne', 'Santa Rita', 98, 'PO Box 48340');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65106680, 'Kort', 'Río Sereno', 98, '17th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63114894, 'Greer', 'Sadao', 20, 'Room 267');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53112136, 'Leela', 'Yuhe', 20, 'Suite 22');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61101294, 'Minetta', 'Yashao', 31, 'Apt 314');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71000521, 'Lelah', 'Lincuo', 48, 'Suite 39');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101101439, 'Silvie', 'Safakulevo', 41, 'PO Box 98400');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111907021, 'Marquita', 'General Enrique Godoy', 35, 'Room 1491');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111101461, 'Raven', 'Xiongshan', 31, 'PO Box 78558');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21202719, 'Worth', 'Mnichovo Hradiště', 90, 'PO Box 68530');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104102574, 'Sharia', 'Bumbuna', 20, '3rd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (221971332, 'Carolyne', 'Sikonge', 52, 'Suite 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82901839, 'Anthea', 'Hengzhou', 95, 'PO Box 97048');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104910342, 'Letisha', 'La Huaca', 38, 'Apt 1703');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (22309239, 'Kassey', 'Saint-Avertin', 5, 'Suite 89');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (43001024, 'Collin', 'Trosa', 9, 'Apt 543');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21410080, 'Vivian', 'Telmin Suma', 89, 'Room 54');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241272079, 'Harwell', 'La Puerta de San José', 83, '17th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31318538, 'Alyssa', 'Jambu', 90, 'Apt 725');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53208066, 'Stan', 'Hengduo', 13, '2nd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72402212, 'Merralee', 'Nanjie', 8, 'Apt 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83002533, 'Berte', 'Jiaoba', 71, 'Room 840');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211070146, 'Linn', 'Samdrup Jongkhar', 36, '2nd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122240696, 'Jillana', 'Philadelphia', 61, 'PO Box 60608');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92901337, 'Perren', 'Majie', 62, 'Room 301');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (266086554, 'Olympie', 'Kungsbacka', 97, 'Apt 1357');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42107602, 'Sven', 'Mabilang', 3, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91902531, 'Hermione', 'Tysmenychany', 44, 'Room 1184');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71921833, 'Denny', 'Solotcha', 53, 'PO Box 48647');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81506646, 'Gonzales', 'San Vicente de Moravia', 18, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81205112, 'Correy', 'Mingyue', 68, 'Room 413');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62204158, 'Marshall', 'Djibo', 38, 'Apt 1738');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (54001534, 'Carline', 'Arbeláez', 3, 'PO Box 46115');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111311785, 'Gianna', 'Caicedonia', 82, 'Room 306');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81503490, 'Chance', 'Claremorris', 100, 'PO Box 25369');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241070433, 'Gregorio', 'Kihangara', 31, 'Room 623');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122237751, 'Teressa', 'Marhanets’', 87, 'Room 1013');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (112000011, 'Karalee', 'Fresno', 81, '20th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73921190, 'Peggie', 'Weiguo', 21, 'PO Box 2261');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53106799, 'Andrey', 'Primorsko', 4, 'Suite 45');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84201139, 'Tan', 'Petong', 41, 'Suite 61');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82908625, 'Emmanuel', 'Chavusy', 40, 'PO Box 15946');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111025518, 'Shandra', 'Shuimen', 27, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81000728, 'Dian', 'Pahonjean', 26, 'Room 1868');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11101752, 'Ruttger', 'Pogonsili', 97, 'Suite 60');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104900886, 'Lanie', 'Datarkadu', 10, 'Apt 524');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211970194, 'Karena', 'Thị Trấn Bắc Yên', 24, 'Room 1787');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53102117, 'Jayson', 'Medalem', 15, 'Apt 344');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101101581, 'Lissi', 'Al Bāţinah', 90, 'PO Box 85335');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113109131, 'Riordan', 'Ban Lŭng', 35, 'PO Box 77723');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123103729, 'Liva', 'Nantes', 71, 'Apt 973');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41203824, 'Garold', 'Korniyivka', 60, 'Suite 76');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64101385, 'Jemie', 'Wan’an', 51, '12th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73907091, 'Waite', 'Chenyangzhai', 37, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65302895, 'Granger', 'Dolní Dvořiště', 84, 'Room 147');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (322279920, 'Terri', 'Karantaba', 56, 'Room 1178');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122038277, 'Ynes', 'Dzyarzhynsk', 37, 'Suite 21');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111000753, 'Kenyon', 'Shuangxiqiao', 16, 'Room 1005');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63106352, 'Baron', 'Maesan', 88, 'Suite 21');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11302933, 'Myrta', 'Akashi', 27, 'Room 1644');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122105948, 'Celle', 'Nosy Varika', 89, 'Apt 237');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65301566, 'Blaire', 'Balungkopi', 79, 'Suite 3');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63115631, 'Hermione', 'Bajiao', 10, 'PO Box 95974');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (26007906, 'Janaya', 'Tinambac', 4, 'Room 606');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (267090691, 'Betti', 'Perené', 20, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21213339, 'Wade', 'Weepangali', 55, 'Room 75');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92901078, 'Shurlocke', 'Nevinnomyssk', 70, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31302638, 'Harman', 'Sokolov', 84, 'PO Box 65226');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103000619, 'Othella', 'Descalvado', 2, 'Room 734');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103101330, 'Cloe', 'Changlu', 47, 'PO Box 24067');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91403865, 'Kynthia', 'Oli', 80, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61220489, 'Johna', 'Dayou', 73, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (253184359, 'Andrea', 'Yavne', 93, 'Suite 30');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111315794, 'Lurette', 'Eybens', 7, '20th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101113935, 'Kimberlee', 'Kawungsari', 53, 'PO Box 61996');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73910237, 'Mei', 'Tetyushi', 100, 'Suite 26');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104112849, 'Imogene', 'Neftegorsk', 96, '20th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41001246, 'Lucienne', 'Moppo', 76, 'Apt 323');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71004530, 'Tuckie', 'Naj‘ Ḩammādī', 65, 'Suite 26');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111912090, 'Mikel', 'Savran’', 32, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83901825, 'Husain', 'Rokitno', 94, 'Room 1390');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61103894, 'Durante', 'Chengzhong', 5, 'Room 594');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72413256, 'Neall', 'Shuanggang', 75, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211273309, 'Ivie', 'Siqian', 85, 'Apt 258');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101903336, 'Nevin', 'Qümong', 57, 'Apt 680');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52000168, 'Harlene', 'El Parco District', 7, '17th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75909576, 'Melody', 'Beiyuan', 8, 'Room 1754');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65103887, 'Hillie', 'Suzaka', 60, 'Apt 1150');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63111677, 'Tatiana', 'Bela Vista', 79, 'Room 1151');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91310699, 'Arnold', 'Växjö', 53, '2nd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84000026, 'Selena', 'Krajan Tanjungrejo', 100, '4th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (231375575, 'Lezlie', 'Sang-e Chārak', 2, 'Suite 31');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (275079882, 'Ezmeralda', 'Dame-Marie', 26, 'Suite 27');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122238200, 'Martainn', 'Greensboro', 18, 'PO Box 93188');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74900194, 'Devon', 'Stradbally', 99, 'Room 952');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53203210, 'Clement', 'Rio', 54, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21409567, 'Rubin', 'Infanta', 27, 'PO Box 4150');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92901654, 'Worth', 'Maqiu', 53, 'PO Box 22216');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111904451, 'Sutherland', 'Perho', 35, 'Room 777');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113109131, 'Siusan', 'Thul', 100, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111321270, 'Garvy', 'Cocachacra', 10, 'Suite 39');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (26010605, 'Tami', 'Kodinsk', 86, 'Room 116');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31318619, 'Leone', 'Saint-Gratien', 50, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63114661, 'Eolande', 'Haikou', 75, 'Apt 1510');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101114031, 'Charmane', 'Caotang', 31, 'Suite 48');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53273981, 'Georges', 'Kourou', 35, 'Suite 41');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84107055, 'Dolores', 'Poroj', 76, 'Apt 441');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61111653, 'Christean', 'Bobrov', 39, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101000925, 'Kristoffer', 'Plovdiv', 90, 'Suite 100');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (44202505, 'Gareth', 'Motong', 60, 'Apt 1');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111907788, 'Fields', 'Cañaveral', 65, 'Apt 903');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72407987, 'Gayla', 'Palompon', 22, 'Room 1742');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53112220, 'Arnoldo', 'Santana do Paraíso', 11, 'Apt 1732');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82001881, 'Estelle', 'Américo Brasiliense', 78, 'Suite 30');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103102216, 'Roda', 'Bích Động', 83, 'Apt 172');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102100918, 'Nissy', 'Tunbao', 31, 'Room 675');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51000033, 'Sam', 'Jaboatão dos Guararapes', 77, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41201703, 'Orrin', 'Lianzhou', 55, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101003773, 'Addie', 'Kalmar', 1, 'Suite 83');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113124637, 'Chiquita', 'Stare Juchy', 85, 'Room 1130');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61203338, 'Shannon', 'San Luis', 78, 'Apt 1871');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103109840, 'Rossy', 'Kamionka', 62, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241272053, 'Brianna', 'Ferme-Neuve', 48, 'Room 1281');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111904150, 'Reinhard', 'Cabangan', 43, 'Apt 841');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241070459, 'Diann', 'Lenningen', 73, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61203257, 'Jehu', 'Jiaowei', 73, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74905173, 'Paulette', 'Dongtai', 11, 'Suite 59');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104103683, 'Sayer', 'Kortowo', 70, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62202778, 'Gretel', 'Palmas', 94, 'Suite 68');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122402081, 'Gigi', 'Rouen', 81, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81225804, 'Turner', 'Tianzhen', 100, 'Suite 29');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102300242, 'Riley', 'Ridder', 93, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41202812, 'Graeme', 'Encontrados', 62, 'Suite 5');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111901629, 'Sydney', 'Lusacan', 48, 'PO Box 47632');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65106619, 'Joe', 'Rudnya', 91, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (124100080, 'Hermann', 'Pionerskiy', 26, 'Room 1823');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21207358, 'Natale', 'Krasnyy Oktyabr’', 39, 'Apt 1450');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31901929, 'Sherlocke', 'Kemil', 60, 'Suite 87');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91914710, 'Judi', 'Chezhan', 78, '2nd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91302788, 'Nero', 'Xilinji', 38, 'Room 660');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81903524, 'Renato', 'Shamboyacu', 24, '4th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71900786, 'Marilee', 'Belmullet', 5, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (43310281, 'Wyatt', 'Ufa', 42, 'Suite 50');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (274970937, 'Kipper', 'Pavlovskaya', 4, 'Suite 6');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62202804, 'Willey', 'Nueve de Julio', 14, 'Apt 1497');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53010445, 'Leonid', 'El Parco District', 41, 'Suite 2');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (226070296, 'Norby', 'Totok', 53, '3rd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125106708, 'Katee', 'Berlin', 4, 'Apt 1046');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71103473, 'Dun', 'Dengjia', 51, 'Room 1646');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83901744, 'Ruthann', 'Tauranga', 10, 'Apt 574');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21206074, 'Udell', 'Suhopolje', 38, 'PO Box 50617');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (22310422, 'Morey', 'Sinhyeon', 81, 'PO Box 10469');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64105200, 'Felicle', 'Melati', 44, 'PO Box 47043');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107003609, 'Patin', 'Banjar Jabejero', 88, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64102601, 'Ephrayim', 'Mosjøen', 55, '20th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75000019, 'Claudina', 'Tangyin', 16, 'PO Box 17105');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (265270413, 'Fonz', 'Martakert', 13, 'Apt 1591');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113014077, 'Washington', 'Aldeia', 52, 'Room 187');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73921006, 'Minnie', 'Guofu', 52, '3rd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62204158, 'Shae', 'Hödrögö', 13, 'Suite 6');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81000210, 'Lewie', 'Ji’an', 99, 'Suite 88');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82901101, 'Bell', 'Dziewin', 90, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41204166, 'Theda', 'Agpangi', 22, 'Room 1791');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113118012, 'Charmain', 'Kadyy', 64, 'Suite 35');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83900680, 'Merry', 'Tucuran', 19, 'Suite 76');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (243073852, 'Ignacio', 'Kayangel', 15, 'Suite 31');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211370257, 'Kerri', 'Dapdap', 22, 'Apt 1159');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67003778, 'Baron', 'Kapuan', 76, 'Room 1835');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101100375, 'Janet', 'Hongqi', 45, 'PO Box 74263');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (231170181, 'Brandon', 'Jardín América', 25, 'Room 80');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107006101, 'Fernanda', 'Mikró Monastíri', 51, 'Room 810');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111302587, 'Serge', 'Guozhai', 2, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (253177476, 'Bernadine', 'Sayama', 85, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (253184472, 'Sigfried', 'Kybartai', 78, 'Room 394');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (26013958, 'Stoddard', 'Geneng', 54, 'Suite 22');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91310987, 'Rica', 'Hadžići', 5, 'PO Box 9193');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81017478, 'Cindi', 'Beyla', 11, 'Suite 61');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72414239, 'Edan', 'Ayabaca', 23, 'Apt 1304');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62202804, 'Cass', 'Ibirité', 68, 'PO Box 48314');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51404529, 'Edwina', 'Pirogovo', 3, 'PO Box 58164');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (44072337, 'Janetta', 'Wangyi Zhendian', 57, 'Apt 1948');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113123366, 'Rip', 'Agriá', 42, 'Room 148');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101113935, 'Stanwood', 'Michurinskoye', 19, 'Suite 62');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101115001, 'Philomena', 'Kawayan', 53, 'Apt 1754');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121141107, 'Alano', 'Itapipoca', 42, 'Apt 1659');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (311093120, 'Elizabet', 'Banjar Banyuning Barat', 54, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (221976861, 'Rachel', 'Lokavec', 39, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65403626, 'Verile', 'Smiltene', 18, 'Room 813');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101219059, 'Audre', 'Linköping', 78, 'PO Box 22559');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91300719, 'Adelice', 'Bolong', 18, '4th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51400646, 'Florance', 'Galatás', 56, 'Apt 1884');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104902363, 'Catharine', 'Longquan', 58, 'Suite 64');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101019521, 'Richy', 'Alajuela', 84, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111312551, 'Sheeree', 'Pará de Minas', 20, 'Apt 1786');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113112995, 'Jerome', 'Heqian', 36, 'Room 912');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101107860, 'Fayina', 'Tignoan', 22, 'PO Box 6550');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91909217, 'Eb', 'Villasis', 2, '12th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53274090, 'Blondy', 'General Luna', 68, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65402892, 'Willem', 'Besko', 51, 'PO Box 84849');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (271171674, 'Adena', 'Bambali', 9, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61220489, 'Wolfgang', 'Flen', 13, 'Apt 827');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67091719, 'Rafaello', 'La Hacienda', 7, 'Apt 270');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111024483, 'Elberta', 'El Soberbio', 70, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101001005, 'Darwin', 'Songmuping', 100, 'Room 308');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111306871, 'Etta', 'Sindanghayu', 77, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82907558, 'Terrye', 'Ulbroka', 73, 'Apt 496');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41204166, 'Saundra', 'Skurup', 49, 'Room 793');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101006039, 'Winnifred', 'Los Arcos', 95, 'Room 1577');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101111348, 'Jenelle', 'Kidangbang', 39, 'Apt 197');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53110633, 'Cahra', 'Liyuan', 60, 'Apt 301');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67016037, 'Danny', 'Dayangzhou', 30, 'Room 121');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84206082, 'Enos', 'Mugumu', 63, 'PO Box 89230');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (255072126, 'Marybeth', 'Punkalaidun', 66, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81511754, 'Crissy', 'Sasovo', 8, 'PO Box 62629');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31309123, 'Tabbatha', 'Dagua', 7, 'Suite 61');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51408923, 'Regan', 'Ciparay', 6, 'Apt 428');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (55001698, 'Kandace', 'Shengshan', 54, 'Apt 1924');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42101404, 'Tripp', 'Silca', 59, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62204789, 'Katuscha', 'Ustrzyki Dolne', 7, '17th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111912401, 'Vince', 'Marne-la-Vallée', 13, 'PO Box 99430');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67092022, 'Marnia', 'Batou', 38, 'Room 1984');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74913699, 'Megen', 'Solna', 10, 'Suite 54');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (256072701, 'Aleece', 'Nice', 85, 'Room 44');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111908127, 'Sigismondo', 'Eséka', 97, 'Suite 99');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67014181, 'Humfried', 'Dokshytsy', 45, 'Suite 79');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81505155, 'Annnora', 'Shakīso', 46, 'Apt 1450');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82907273, 'Karim', 'Zhongyuan', 44, 'PO Box 2754');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91302597, 'Donall', 'Topory', 35, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113024562, 'Ingamar', 'San Rafael', 54, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111923898, 'Sharron', 'Owase', 18, 'Room 1277');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122240861, 'Daisi', 'Pueblo Nuevo', 94, 'Apt 1200');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101104151, 'Casandra', 'Brovary', 92, 'PO Box 1060');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65306079, 'Harv', 'Oratorio', 9, 'Room 435');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107003298, 'Irving', 'Bendorubuh', 20, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84201294, 'Tallie', 'Krajan Selatan', 35, 'Apt 839');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113102138, 'Hobart', 'Chervonopartyzans’k', 29, 'Room 1491');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (221270758, 'Logan', 'Tandil', 18, 'Suite 20');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (321071077, 'Parsifal', 'La Rochelle', 73, 'Apt 490');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (271071402, 'Joya', 'Domoni', 6, 'PO Box 14031');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63104312, 'Bonnie', 'Krasnoye', 72, 'Room 629');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (54000551, 'Lorain', 'Carapelhos', 92, 'PO Box 69240');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91406972, 'Sandra', 'Ruchihe', 74, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (26010825, 'Dela', 'Antony', 4, 'PO Box 51291');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (271070801, 'Dulcia', 'Raejeru', 39, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107004637, 'Ondrea', 'Novo Selo', 100, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11301798, 'Cleopatra', 'Wuli', 78, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103102193, 'Ina', 'Oborniki Śląskie', 21, 'Suite 25');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82901282, 'Elora', 'Vagos', 82, 'Apt 124');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111924305, 'Consalve', 'Bīrganj', 86, 'PO Box 12609');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111908091, 'Melodie', 'Tandahimba', 33, 'Apt 285');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (242272447, 'Geoff', 'Jieshui', 24, 'Room 175');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101002949, 'Ernest', 'Lieyu', 12, 'Apt 1363');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111302545, 'Vonny', 'Pahārpur', 1, 'Room 1235');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121140823, 'Norene', 'Kvasiny', 25, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (322271627, 'Sella', 'Bejuco', 97, 'Room 762');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (28000082, 'Bell', 'Kuntong', 52, 'Apt 159');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111321717, 'Beverie', 'Buenavista', 54, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53207986, 'Abrahan', 'Majia', 38, 'Suite 13');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (282970437, 'Babita', 'San Ramón', 85, 'Room 1712');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52000016, 'Farra', 'Lac La Biche', 59, 'Suite 45');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (26015079, 'Mar', 'Moshenskoye', 5, 'Suite 36');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73921569, 'Lu', 'Cipesing', 62, 'Apt 762');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11301947, 'Griswold', 'Roissy Charles-de-Gaulle', 51, 'Room 1801');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74903890, 'Kim', 'Cabarroguis', 84, 'Apt 1646');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111304064, 'Reinhard', 'Rzyki', 28, 'Room 1586');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107005801, 'Dillon', 'Catu', 7, 'PO Box 44629');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71114491, 'Ricky', 'Dhidhdhoo', 34, 'Suite 19');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65201116, 'Opal', 'Grindavík', 44, 'Suite 2');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53112068, 'Dorey', 'Jiblah', 58, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111909443, 'Desdemona', 'Goodlands', 89, 'Apt 1728');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111101157, 'Micheil', 'Unidos', 52, 'Suite 41');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31202084, 'Allsun', 'Izingolweni', 67, 'Suite 45');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84201294, 'Jordan', 'Saint-Quentin-Fallavier', 22, 'Room 1707');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91204763, 'Codi', 'Beit Horon', 80, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211170305, 'Reagan', 'Kamiiso', 98, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63115631, 'Cymbre', 'Ribas', 87, 'PO Box 55737');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67011993, 'Shannon', 'Palatine', 35, 'Suite 28');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (256078569, 'Arlana', 'Gornyy', 31, 'Suite 54');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (274970791, 'Burr', 'Mnogoudobnoye', 75, 'Suite 39');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111901014, 'Sabra', 'Sipocot', 80, '20th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53112686, 'Belicia', 'Bijeli', 82, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123206545, 'Angie', 'Barraute', 25, 'Room 553');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63292538, 'Gillie', 'Biyan', 5, '2nd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101000048, 'Tamqrah', 'Paris 08', 95, 'Suite 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (112025342, 'Queenie', 'Huxiaoqiao', 88, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (325182551, 'Moselle', 'Bang Nam Priao', 35, 'Apt 734');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21410637, 'Kary', 'Puncan', 15, 'PO Box 21356');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61104123, 'Melisse', 'Göteborg', 89, 'Room 1979');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21203501, 'Alicea', 'Yubileyny', 56, 'PO Box 55445');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (271172754, 'Karel', 'Balma', 10, 'Suite 94');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62202082, 'Chaim', 'Málaga', 91, 'Suite 44');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62004099, 'Israel', 'Xingfu', 9, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91501408, 'Phillis', 'Žďár nad Sázavou Druhy', 11, 'Suite 63');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75900148, 'Bordie', 'San Francisco', 88, 'Suite 40');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111309742, 'Angelle', 'Toroy', 44, 'Suite 26');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (314970664, 'Megan', 'Kurchatov', 100, 'PO Box 47571');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61110557, 'Monty', 'Maikun', 23, 'Apt 395');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61206982, 'Zarla', 'Manay', 73, 'PO Box 12397');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21201383, 'Elnar', 'Afanas’yeva', 86, 'Suite 21');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91803818, 'Katlin', 'Luotuo', 7, 'Apt 1730');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101110543, 'Lottie', 'Pančevo', 46, 'Suite 61');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61213069, 'Rozele', 'New Iloilo', 88, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (124002971, 'Rene', 'Itum-Kali', 95, 'Suite 15');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72410013, 'Erny', 'Jayawangi', 22, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21300019, 'Ned', 'La Virginia', 83, 'Suite 19');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122241831, 'Corey', 'Tahala', 60, 'Room 1348');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114901147, 'Gradey', 'Haunubenak', 10, 'Room 1321');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91015224, 'Derrek', 'Shatki', 34, 'PO Box 83920');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71925350, 'Bren', 'Barengkok Hilir', 43, 'Room 544');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84303545, 'Debera', 'Sedayu', 17, 'Room 1565');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82901473, 'Cherice', 'Qianjia', 82, 'Suite 58');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123206901, 'Osborn', 'Vancouver', 34, 'Room 339');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31000095, 'Debra', 'Lago', 67, 'PO Box 3053');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74907126, 'Nikolos', 'Étampes', 18, 'Room 1469');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64102740, 'Donnamarie', 'Casal da Serra', 95, 'PO Box 64057');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42309222, 'Barry', 'Garoua', 9, '2nd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91304634, 'Simonette', 'La Falda', 55, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102300404, 'Bary', 'Mabayo', 96, 'Room 194');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91200961, 'Kissee', 'Luleå', 2, 'Apt 428');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62006495, 'Tiler', 'Cipondok', 27, 'Suite 71');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111909825, 'Nadeen', 'Barreiros', 12, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83902811, 'Clarie', 'Pariti', 65, 'Apt 550');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65403875, 'Emelen', 'Ciyun', 26, 'Suite 91');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84000084, 'Ethyl', 'Ichinomiya', 47, 'Room 666');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (314974356, 'Sibyl', 'Opol', 93, 'Suite 54');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (284373838, 'Shadow', 'Kotovsk', 53, 'Apt 977');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71123385, 'Georgina', 'Benešov nad Černou', 41, 'Room 873');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (66010351, 'Ailey', 'Skiáthos', 11, 'Room 1579');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111908583, 'Ariel', 'Lindavista', 72, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91101455, 'Carleen', 'Karibib', 52, 'Suite 60');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101105244, 'Ailsun', 'Vårby', 19, 'Room 272');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51402204, 'Kristel', 'Novomykolayivka', 55, 'Room 547');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102105269, 'Milissent', 'Tanabe', 2, 'Room 123');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241070501, 'Cosetta', 'Nossa Senhora de Machede', 4, 'Room 1496');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65403370, 'Bud', 'Sattahip', 48, 'Apt 1347');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63112605, 'Stanley', 'Agía Triáda', 97, 'Suite 35');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111909634, 'Jena', 'Mamonovo', 47, 'Apt 182');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61103357, 'Hamid', 'Sindang', 55, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67012099, 'Corbin', 'Dengmu', 52, '3rd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (221370878, 'Wallis', 'Zhoujiaba', 14, 'PO Box 80584');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67014343, 'Halimeda', 'San Rafael', 16, 'Suite 36');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84107055, 'Nestor', 'Regimin', 50, 'Suite 54');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122106031, 'Melonie', 'Pulong Sampalok', 41, 'PO Box 89459');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21004823, 'Irena', 'Łaszczów', 22, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111924363, 'Cass', 'Gulyantsi', 48, 'Suite 28');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42101268, 'Minnaminnie', 'Al ‘Āliyah', 56, 'Suite 21');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (55001384, 'Bamby', 'Viterbo', 20, 'Room 1099');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71918286, 'Oralla', 'Caen', 93, 'Apt 1132');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111910380, 'Cleve', 'Oesao', 63, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81518333, 'Shaine', 'Dayrūţ', 38, 'PO Box 75834');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67092022, 'Audrie', 'Iḩsim', 80, 'Room 1847');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91402905, 'Kakalina', 'Biaokou', 50, 'PO Box 21385');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52173464, 'Cathee', 'Aurillac', 21, 'Room 193');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91911551, 'Tillie', 'Kouango', 96, 'Suite 57');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42100188, 'Olly', 'Gombangan', 64, 'Room 443');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81501793, 'Emmie', 'Xiwei', 90, 'PO Box 13223');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (321170318, 'Morena', 'Markovo', 59, 'Apt 240');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65405132, 'Kippy', 'Carcarañá', 10, 'PO Box 96774');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51500614, 'Reg', 'Benchu', 69, 'Suite 29');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (26011882, 'Liane', 'Puyo', 49, 'Room 1930');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125000105, 'Jessalyn', 'Ishëm', 81, 'Apt 1712');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21213096, 'Gertrud', 'Niterói', 54, '1st Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71911416, 'Kassandra', 'Putou', 51, '3rd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91406833, 'Madlen', 'N''Djamena', 14, 'Apt 1765');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (44202505, 'Aube', 'Poções', 53, 'Apt 1208');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53003931, 'Isidro', 'Lomba do Loução', 82, 'Room 1830');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102107364, 'Erica', 'Yahotyn', 81, 'PO Box 12580');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67016590, 'Dyann', 'Jōetsu', 53, 'PO Box 8475');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42203001, 'Cull', 'Seversk', 29, 'Suite 87');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74903337, 'Aurie', 'Tianzhuang', 62, 'Room 1014');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122239063, 'Matteo', 'Dziewin', 83, 'Apt 1079');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51500614, 'Melessa', 'Buawan', 49, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102101548, 'Jan', 'Lubu', 73, '8th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61219571, 'Cass', 'Bourg-en-Bresse', 19, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107004352, 'Debor', 'Kangar', 47, 'Apt 590');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102101548, 'Louie', 'Décines-Charpieu', 74, 'PO Box 15799');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84204628, 'Marietta', 'Dondar Quşçu', 10, 'PO Box 28853');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (265070532, 'Cathee', 'Salaspils', 55, 'Apt 374');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101101439, 'Dewey', 'Daru', 80, 'Suite 52');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211179995, 'Vilma', 'Huangbu', 55, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104905881, 'Noell', 'Lityn', 45, '8th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83905630, 'Harrie', 'Yantongtun', 46, 'Apt 1780');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71922227, 'Garnet', 'Changsheng', 64, '20th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (231374945, 'Celie', 'Tapel', 21, 'PO Box 26640');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111908004, 'Arch', 'Yingchun', 16, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121137807, 'Vitoria', 'Pandansari', 6, 'Apt 465');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (43308468, 'Jerrold', 'Funtua', 58, 'Apt 1868');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102103999, 'Ximenes', 'Izumi', 79, 'Apt 712');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91400758, 'Hildagarde', 'Smederevo', 75, '17th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (28001489, 'Gabriell', 'Sayaq', 84, 'Apt 1396');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63113727, 'Michail', 'Kŭlob', 38, 'Room 436');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104905836, 'Carissa', 'Jiangtian', 33, 'PO Box 86665');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121142779, 'Robers', 'Binjiang', 76, 'Apt 1228');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (255072126, 'Clementina', 'Chipata', 27, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (124002942, 'Cathee', 'Basak', 32, 'Room 571');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107002406, 'Jeniece', 'Rosebank', 94, 'PO Box 84776');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (28001081, 'Gillian', 'Pražmo', 96, 'Apt 1606');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81504693, 'Isaac', 'Buliwao', 51, 'Suite 30');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65405491, 'Jenelle', 'Al ‘Ashshah', 50, 'Suite 80');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122401710, 'Ranique', 'Machang', 14, 'PO Box 20972');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104113628, 'Wilmer', 'Vršac', 67, 'PO Box 60429');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241272037, 'Jourdain', 'Zhouji', 83, 'Apt 435');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (264071590, 'Audrey', 'Maikawada', 25, 'Suite 50');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122187076, 'Carmella', 'Tiberias', 98, 'Room 316');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42207735, 'Helsa', 'Shanguang', 41, 'PO Box 71865');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113104521, 'Coletta', 'Cipicung Timur', 27, '6th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107000152, 'Tommy', 'Kalodu', 39, 'Room 912');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (321070007, 'Fredelia', 'Všeruby', 2, 'Suite 37');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101014953, 'Glyn', 'Richmond', 79, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64203979, 'Frannie', 'Hanji', 28, 'Suite 46');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83901650, 'Ingmar', 'Chilecito', 71, 'Suite 17');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (323070380, 'Diego', 'Ennery', 32, 'Apt 94');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (272471836, 'Gloria', 'Wissembourg', 94, 'Room 1337');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21207002, 'Ranice', 'Huta Stara B', 55, 'Room 1131');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91408734, 'Aurlie', 'Leteki', 44, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52204346, 'Gabriel', 'Chư Ty', 41, 'Suite 8');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (124000737, 'Martha', 'Zhatay', 71, '17th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (124100080, 'Brigitte', 'Ronfe', 98, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84204628, 'Carrissa', 'Zašová', 42, 'Room 1517');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101114879, 'Josefina', 'Yangzizhou', 74, 'Suite 15');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71109891, 'Robbin', 'Jianlong', 31, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102100772, 'Genna', 'Alivéri', 74, 'Room 1489');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (43304239, 'Berkley', 'Sadabe', 70, 'PO Box 98805');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111909605, 'Alfons', 'Takahagi', 77, 'Room 145');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111914917, 'Poul', 'Baishan', 58, 'PO Box 96502');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103000703, 'Harrietta', 'Joaçaba', 41, 'Apt 1310');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91403548, 'Natal', 'Nanyang', 17, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101106939, 'Kerrie', 'Babakantugu', 99, 'Apt 258');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61121203, 'Flory', 'Zuru', 53, 'Suite 90');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113015995, 'Eba', 'Beiquan', 59, 'Suite 95');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53100850, 'Marlena', 'Torez', 94, 'Room 1495');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67011760, 'Crosby', 'Kostanay', 21, '2nd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122243596, 'Annissa', 'Shibganj', 7, 'Suite 64');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92901298, 'Barb', 'Kesambilerenkrajan', 98, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31318907, 'Sascha', 'Shah Alam', 65, 'PO Box 70744');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114924690, 'Neil', 'Wierzchowo', 43, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73922678, 'Waite', 'Tumbes', 88, 'Apt 1309');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71904627, 'Adan', 'Kipen’', 56, 'Suite 71');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81905344, 'Aleta', 'Descalvado', 42, '3rd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122239775, 'Ethyl', 'Longkou', 54, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103100522, 'Nichols', 'Chernukha', 82, 'Apt 1953');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (272471357, 'Margaret', 'Hengbanqiao', 52, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (322271779, 'Keenan', 'Caba', 35, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74900657, 'Ruperta', 'Quangang', 87, 'Suite 64');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71925062, 'Trixie', 'Krajan Sumberanget', 40, 'Room 1547');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71922984, 'Mariellen', 'Acobambilla', 29, 'Suite 72');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82901855, 'Hedda', 'Apopa', 64, 'Room 878');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111917383, 'Murielle', 'Wolofeo', 63, 'PO Box 34133');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (322280870, 'Montgomery', 'Dengyue', 12, 'Room 314');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101212182, 'Sal', 'Cầu Gồ', 75, 'PO Box 3144');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91206745, 'Eliza', 'Beltinci', 13, 'Room 186');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82901596, 'Gwyn', 'Suileng', 44, 'Suite 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (26013246, 'Reade', 'Kolape', 45, 'Suite 32');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125107260, 'Jodee', 'Sutysky', 100, 'Apt 768');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31309385, 'Marylin', 'Xinlong', 28, 'Room 1148');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (274070439, 'Izzy', 'Petaling Jaya', 36, 'Suite 81');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71925237, 'Reggy', 'Évora', 79, 'Apt 806');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71905040, 'Noe', 'Arroyo Seco', 32, 'PO Box 57615');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111912252, 'Bealle', 'Pofadder', 38, 'Suite 43');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103107046, 'Katheryn', 'Sagopshi', 49, 'Apt 733');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (274970843, 'Arluene', 'Leiria', 58, 'Suite 65');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91900465, 'Zack', 'Vale Flores', 3, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52173464, 'Rayshell', 'Kasserine', 30, 'Apt 347');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65201349, 'Zachary', 'Betong', 51, 'Apt 1611');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65400137, 'Chan', 'Vydreno', 53, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (231371841, 'Kennith', 'Sigou', 44, 'PO Box 89367');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101111351, 'Milli', 'Lishu', 66, '4th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101110080, 'Heinrick', 'Toluviejo', 15, '20th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72401006, 'Lanie', 'Cabudare', 58, 'Room 810');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62103453, 'Kayne', 'Koceljeva', 96, 'Suite 91');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (311373125, 'Nana', 'Sūrān', 24, 'PO Box 12440');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75901082, 'Rooney', 'Santa Ana', 22, 'Suite 80');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74904394, 'Selestina', 'Kępno', 8, 'Apt 1865');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42207735, 'Henka', 'Cincinnati', 64, 'Apt 651');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73922005, 'Elka', 'Paraíso das Águas', 85, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111903575, 'Gustav', 'Ailuk', 31, 'PO Box 88296');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104900459, 'Magdalena', 'Tokonou', 67, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (284272654, 'Lolita', 'Maluko', 7, 'Apt 1935');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21213397, 'Caty', 'Rožna Dolina', 8, 'Apt 777');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53185079, 'Ella', 'Paris 05', 65, 'PO Box 23376');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122000661, 'Vassili', 'Osasco', 31, 'PO Box 87167');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84000945, 'Batholomew', 'Ajman', 78, 'Room 694');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73904230, 'Petronilla', 'Manadas', 10, 'PO Box 35589');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (43304239, 'Winni', 'Kidal', 76, 'Suite 62');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103000619, 'Misti', 'Banī Zayd', 8, 'Apt 1782');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71909062, 'Hailee', 'Chipinge', 98, 'Room 1167');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103101576, 'Alley', 'Cambuí', 66, 'Apt 197');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114916019, 'Darlene', 'Bojongaren', 66, 'PO Box 74963');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31207966, 'Willey', 'Shihudang', 90, 'PO Box 26984');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111915398, 'Farr', 'Pingshi', 65, 'PO Box 10790');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (265371082, 'Franz', 'Portela', 22, 'Room 1397');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101101769, 'Jasmine', 'Higuerote', 9, 'Apt 495');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31302803, 'Devondra', 'Taveiro', 27, 'Apt 1291');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111101461, 'Hobart', 'Huitang', 22, 'Room 260');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53112039, 'Mercy', 'Komorniki', 21, 'PO Box 64225');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71925350, 'Jarred', 'Rokytne', 29, 'Apt 739');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91213039, 'Gloria', 'Jinhe', 64, 'Suite 56');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72401006, 'Ross', 'Manhiça', 84, 'Suite 72');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113003389, 'Shaylynn', 'Keli', 24, 'Room 1492');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63101111, 'Lita', 'Sipirok', 74, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11301536, 'Des', 'Panggungwinong', 46, 'Room 615');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11401135, 'Keary', 'Huakoulongtan', 4, 'Apt 515');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81000702, 'Trudie', 'Rosmaninhal', 81, 'PO Box 58026');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (242272489, 'Lavina', 'Lupak', 13, 'Suite 46');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53112479, 'Cloe', 'Achiras', 55, 'PO Box 29972');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111908583, 'Bernete', 'Pianling', 18, 'PO Box 11796');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111320925, 'Madelyn', 'Tangban', 34, 'Apt 690');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123006389, 'Jackqueline', 'Tayu', 19, 'PO Box 86290');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73912073, 'Clayton', 'Fezna', 40, 'Room 1060');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122243208, 'Kimble', 'Kavalerovo', 87, 'PO Box 69187');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91204763, 'Cecilio', 'Atafu Village', 78, 'Suite 66');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111302545, 'Cristen', 'Kruševica', 10, 'Suite 80');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63101399, 'Gaultiero', 'Shangbahe', 31, '14th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84001915, 'Mommy', 'Jiuxian', 56, 'Apt 270');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73911676, 'Martina', 'Ashmūn', 14, 'Suite 80');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65002289, 'Ilene', 'Wudui', 49, 'Room 1852');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (312276182, 'Jaye', 'Chicago', 81, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31309440, 'Marcile', 'Kasli', 63, 'Suite 66');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21973019, 'Alberta', 'Qiagai', 91, 'Suite 38');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75906003, 'Kiri', 'Yanino Vtoroye', 23, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101107860, 'Idette', 'Farinheiras', 24, 'Suite 86');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62201779, 'Beitris', 'Péplos', 22, 'PO Box 16445');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92901706, 'Catharina', 'Jifarong', 12, 'Apt 1167');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71925965, 'Prentice', 'Dallas', 63, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111907445, 'Duffie', 'Jagdaqi', 89, 'Suite 15');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65305478, 'Dal', 'Marseille', 38, 'PO Box 42750');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111308031, 'Nevil', 'Esperança', 91, '8th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21300019, 'Jeromy', 'Baruunsuu', 75, 'Room 856');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83908200, 'Stephanus', 'Issy-les-Moulineaux', 37, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104902392, 'Barrett', 'Hořice', 43, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21101425, 'Adelheid', 'Auxerre', 46, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104111769, 'Elyn', 'Albardón', 70, 'PO Box 47216');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125200947, 'Thorin', 'Horodok', 34, 'Room 47');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82908829, 'Hyman', 'Kampungdesa', 51, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (272471661, 'Roslyn', 'Jardín', 83, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67016354, 'Abagael', 'Châteaurenard', 24, '3rd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74014213, 'Emmalynn', 'Pretana', 41, 'Apt 708');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121139122, 'Wernher', 'Tokorozawa', 34, 'PO Box 54682');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51000033, 'Susanna', 'Xiaojia', 95, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123206817, 'Burg', 'Raszowa', 42, 'Room 1999');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53000219, 'Devin', 'Cao Thượng', 47, 'Room 870');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73921226, 'Lanie', 'Frankfurt am Main', 19, 'PO Box 4193');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81017342, 'Dario', 'Partizansk', 37, 'Room 797');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101112716, 'Robbyn', 'Le Blanc-Mesnil', 6, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31318538, 'Lion', 'Usa River', 60, 'PO Box 65026');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122220849, 'Hercules', 'Leles', 65, 'Room 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (262285184, 'Guntar', 'Jinxiu', 56, 'PO Box 11695');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81221549, 'Monah', 'Aramecina', 40, 'Room 636');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53174103, 'Rozanne', 'Donskoye', 59, 'Room 529');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92901476, 'Linell', 'Jönköping', 41, 'Apt 1117');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61211197, 'Tallie', 'Coromandel', 47, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122402049, 'Garnet', 'Pinoma', 71, 'Apt 435');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103000017, 'Francoise', 'Sinubong', 51, 'Apt 1230');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82908625, 'Rollie', 'Batangafo', 92, '2nd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71102322, 'Bee', 'Changjiangbu', 53, 'Room 1973');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (241282632, 'Min', 'Nadezhda', 5, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104110113, 'Rosalinde', 'Kiel', 55, 'Suite 43');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (311972652, 'Derby', 'Baltasar Brum', 44, 'Room 1815');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107006392, 'Olwen', 'Dumalneg', 72, 'Suite 37');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75909660, 'Caterina', 'Estância Velha', 42, 'PO Box 16207');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114909165, 'Burlie', 'Kungsbacka', 92, 'PO Box 25638');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71902797, 'Douglass', 'Lovas', 28, 'PO Box 87224');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84006729, 'Shandie', 'Yinglong', 89, 'Suite 1');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (55000288, 'Curry', 'Niaojin', 89, 'PO Box 85575');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65200874, 'Rodrique', 'Cergy-Pontoise', 71, 'Room 756');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61119464, 'Hollis', 'Bogojevo', 53, 'Room 109');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21207196, 'Fred', 'Sobinka', 54, 'Apt 521');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (11402008, 'Hilary', 'Santa Praxedes', 3, 'Suite 78');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211470319, 'Obadiah', 'Gnojnik', 94, 'Room 1414');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (55002286, 'Toinette', 'Skurup', 83, 'PO Box 19190');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111313631, 'Bartholemy', 'Xiabuji', 77, 'PO Box 55408');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (31301846, 'Jeana', 'Horodok', 88, '7th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121142850, 'Cammi', 'Onguday', 5, 'Apt 66');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72401831, 'Michal', 'Marialva', 54, '4th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53110303, 'Rakel', 'Jawornik', 68, 'Suite 64');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42107738, 'Kippar', 'Soe', 55, 'Room 146');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101104096, 'Reinald', 'Daojiang', 4, 'PO Box 82432');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72401048, 'Henka', 'Sułkowice', 91, 'Suite 73');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122105728, 'Ezri', 'Marcala', 33, 'Apt 998');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (72412927, 'Celestia', 'Itaparica', 70, 'Room 678');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111909265, 'Beth', 'Sirre', 52, 'Suite 26');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101000925, 'Roberto', 'La Tour-du-Pin', 44, 'PO Box 10479');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211170282, 'Nikolos', 'Merapit', 59, 'PO Box 71121');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121135773, 'Finley', 'Marialva', 6, 'PO Box 79285');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (43305131, 'Reginauld', 'Querobamba', 46, 'Suite 54');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (312276182, 'Silvan', 'Tiandeng', 48, '15th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122242102, 'Lulu', 'Mosopa', 46, 'Room 872');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211170282, 'Elisha', 'Hultsfred', 47, 'Apt 512');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71102995, 'Jessa', 'Birendranagar', 81, 'Suite 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (102103999, 'Pat', 'Xianlong', 41, 'Apt 1405');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52204346, 'Lark', 'Nova Petrópolis', 65, 'Apt 796');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75910523, 'Northrup', 'Fontainhas', 9, 'Suite 87');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (42000424, 'Melva', 'Caoyan', 6, 'Apt 651');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91205607, 'Gearalt', 'Lobitos', 21, 'Suite 48');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63109058, 'Lynnea', 'Funza', 15, 'Apt 648');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71112105, 'Rolf', 'Az Ziyārah', 10, 'Room 1519');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211370590, 'Romonda', 'Luna', 14, 'Suite 41');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62201397, 'Lynne', 'Calizo', 99, 'Apt 1414');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (41000124, 'Kessia', 'Santa Praxedes', 76, 'Apt 845');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211272504, 'Holden', 'Palestina de los Altos', 30, 'Apt 1188');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53112806, 'Thorin', 'Weston', 42, 'Room 364');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81210398, 'Korry', 'Chongkan', 47, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101006725, 'Helen', 'Montélimar', 85, 'PO Box 95426');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73922940, 'Pancho', 'Dafang', 85, 'Apt 1198');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (121031673, 'Gwyneth', 'Shar’ya', 22, 'Suite 67');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111319347, 'Reggi', 'Gugark’', 44, 'PO Box 80957');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91000019, 'Earvin', 'Labney', 75, 'PO Box 79259');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101207773, 'Daloris', 'Utama Wetan', 10, 'Apt 1423');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65301948, 'Willem', 'Ban Mo', 30, 'PO Box 96000');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (281073555, 'Cassie', 'Lensk', 21, 'Apt 1603');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83905892, 'Benedick', 'Loučeň', 94, 'Room 372');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123103729, 'Jami', 'Resapombo', 3, 'Suite 42');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71922609, 'Anett', 'Kaédi', 77, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64000020, 'Priscella', 'Unisław', 95, 'Apt 1137');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81518113, 'Thaxter', 'Saint-Jean-de-Luz', 61, 'PO Box 71930');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53112385, 'Sidonia', 'Ridderkerk', 100, 'PO Box 2186');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (107003298, 'Antonin', 'Horní Čermná', 95, 'Room 1732');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122043440, 'Yelena', 'Uliastay', 21, '16th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51409223, 'Adriane', 'Genova', 33, 'Apt 1770');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61220146, 'Padraic', 'Charleston', 43, 'Apt 632');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91000080, 'Evy', 'Kakamega', 12, 'Suite 66');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21300420, 'Claudine', 'Staryy Oskol', 20, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81504693, 'Duff', 'Kefar Shemaryahu', 36, 'Apt 779');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125107532, 'Shir', 'Cobre', 86, 'Room 69');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122242018, 'Abdel', 'Lastoursville', 65, 'Suite 60');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111325823, 'Morten', 'Tottori', 90, 'Room 1106');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123204835, 'Romy', 'La Mesa', 36, 'Apt 131');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (125108683, 'Currey', 'Dolavón', 84, '4th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71900883, 'Rosetta', 'Đà Bắc', 23, 'Room 1427');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84305129, 'Kandace', 'Reston', 12, 'Room 1792');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82001881, 'Harold', 'Aso', 70, 'Apt 1540');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101107802, 'Etienne', 'Rozhnyativ', 75, 'Room 1250');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114907329, 'Therine', 'Przelewice', 22, 'Room 1494');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91409762, 'Jaquelyn', 'Jamshoro', 7, 'Suite 25');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103912668, 'Rivalee', 'Vila Pouca da Beira', 93, 'Room 371');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81503322, 'Aeriel', 'Toumodi', 36, 'PO Box 76697');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62104203, 'Julissa', 'Nabire', 36, 'Room 1000');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111901946, 'Cortie', 'Bandeirantes', 81, 'Room 504');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (26011358, 'Major', 'Songhe', 38, 'Apt 1802');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91309846, 'Yasmeen', 'Kaiapoi', 69, 'PO Box 679');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123200088, 'Glen', 'Dimovo', 59, 'Apt 70');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101902117, 'Vivianne', 'Enskede', 79, 'Apt 1708');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91408734, 'Wes', 'Ptení', 39, 'Room 722');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73920845, 'Betsey', 'Guisijan', 59, 'Suite 51');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83900619, 'Gussi', 'Czarna Woda', 43, 'Room 1398');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71923695, 'Blinni', 'Старо Нагоричане', 98, '13th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (71923336, 'Paulina', 'Sieniawa Żarska', 98, 'Room 856');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51409142, 'Cece', 'Kebonan', 51, 'Apt 459');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (262287218, 'Lazarus', 'Tomaszów Lubelski', 87, 'Room 381');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (44115126, 'Merrilee', 'Tianyu', 70, 'Suite 70');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (67012099, 'Cornie', 'Lakatoro', 53, '19th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (325171740, 'Piggy', 'Al Mazra‘ah ash Sharqīyah', 83, '3rd Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (22309239, 'Skye', 'Cikijing', 10, 'PO Box 23421');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (52102215, 'Avie', 'Duwe', 71, 'Room 965');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103102193, 'Garey', 'Sritanjung', 71, 'Apt 953');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (73921909, 'Heindrick', 'Banamba', 56, 'Suite 89');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63115437, 'Billye', 'Haoraoshan', 49, 'Suite 79');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101901396, 'Pammy', 'Ipiaú', 22, 'PO Box 87097');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91905648, 'Gill', 'Shuitou', 51, 'PO Box 61338');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (103101152, 'Murdoch', 'Galis Dua', 83, 'Room 1976');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81517907, 'Lyndsay', 'Xiaosong', 63, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111306871, 'Opalina', 'Bandungan Timur', 58, 'Room 367');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211170088, 'Burty', 'Quivilla', 88, 'Room 603');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84003900, 'Gerhard', 'Stockholm', 28, 'Suite 33');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21200012, 'Erin', 'El Ángel', 91, 'Room 48');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (83906684, 'Heddi', 'Savalou', 20, 'Suite 21');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91311135, 'Edouard', 'Sumqayıt', 15, 'Room 1218');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114025599, 'Phylys', 'Gaizhou', 81, 'Room 168');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111907717, 'Ellwood', 'Hostomice', 32, 'Room 1508');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (101102496, 'Chip', 'Awat', 15, 'Suite 16');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (124084672, 'Cherlyn', 'Yuracyacu', 80, 'PO Box 42033');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81517981, 'Ikey', 'Baihe', 63, 'PO Box 35994');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81501065, 'Alexio', 'Téra', 73, 'Room 713');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (104901610, 'Tedd', 'Cidolog', 97, 'Room 762');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (51404600, 'Flory', 'Nunguan', 32, 'Room 654');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (114909929, 'Krishna', 'Le Blanc-Mesnil', 58, 'PO Box 66577');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111900659, 'Eadith', 'Ankazobe', 74, 'Apt 118');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91909068, 'Michaeline', 'Tangkanpulit', 56, 'Apt 1053');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61206432, 'Alikee', 'Krasnaya Polyana', 99, 'Suite 54');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62203010, 'Danyelle', 'Heishui', 97, 'Room 770');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (61102138, 'Randa', 'Kilafors', 70, 'PO Box 64525');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113109720, 'Simona', 'Bajo Naranjillo', 78, 'Suite 82');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (111908143, 'Clio', 'Beaverton', 35, 'Room 1966');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (221970605, 'Kira', 'Plumtree', 8, 'PO Box 93366');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (271972718, 'Emmanuel', 'Ilandža', 89, 'PO Box 71760');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (44202505, 'Raddy', 'Dera Bugti', 37, 'Room 310');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (74905474, 'Garrott', 'Arroyo Salado', 34, 'Apt 848');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (62203010, 'Yurik', 'Bizerte', 51, 'Room 793');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (75908218, 'Reidar', 'Stapleford', 89, 'Suite 70');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53104869, 'Myrle', 'Igarassu', 5, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91806381, 'Laurel', 'Kirovskiy', 4, '10th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113014909, 'Zacharias', 'Los Algarrobos', 73, '5th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123000848, 'Denice', 'Zudun', 56, '11th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (321170538, 'Yorgo', 'Yaopi', 75, 'Suite 36');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (21000089, 'Carmelle', 'Wonokerto', 79, 'Apt 1843');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (92905485, 'Horst', 'Shal’skiy', 52, '4th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (261378652, 'Sheppard', 'Santiago de Subrrifana', 38, 'Apt 497');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (64103671, 'Chen', 'Lebak', 94, 'Apt 465');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (53103637, 'Lizzie', 'Querobamba', 13, 'Room 783');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (82908829, 'Jase', 'Calhetas', 50, 'Apt 701');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63112906, 'Arne', 'Jagabaya Dua', 98, 'Suite 19');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (81001387, 'Gilles', 'Liliongan', 91, 'Apt 1081');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (231375290, 'Emmanuel', 'Oliveira de Frades', 47, 'Apt 808');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (123000220, 'Adrian', 'Shanmuqiao', 68, '12th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (91310725, 'Giustino', 'Sundbyberg', 52, 'Room 1362');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63100688, 'Vladamir', 'Puerto Rico', 38, 'Room 848');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122217056, 'Ermengarde', 'Gent', 24, 'PO Box 3829');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (113104712, 'Christyna', 'Were', 45, '9th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (211178640, 'Cheston', 'Nantes', 1, 'Room 973');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65302963, 'Doll', 'Pacanga', 36, '18th Floor');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (65303784, 'Traci', 'Petaling Jaya', 97, 'PO Box 65832');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (122238242, 'Monte', 'Skogås', 94, 'PO Box 67737');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (84206082, 'Elicia', 'Shingū', 74, 'Room 1355');
INSERT INTO Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion) VALUES (63114661, 'Alana', 'Manghit', 64, 'PO Box 33860');

--CONSULTA DE DATOS DE LA TABLA
SELECT * FROM dbo.Ciudadano
-- (Consulta todos los datos de la tabla Ciudadano para ver el estado actual de los registros.)

--CREACIÓN DE FILEGROUPS PARA LA PARTICIÓN DE LA TABLA
ALTER DATABASE Empresa
ADD FILEGROUP Ciudadano1
GO

ALTER DATABASE Empresa
ADD FILEGROUP Ciudadano2 
GO

ALTER DATABASE Empresa
ADD FILEGROUP Ciudadano3
GO
-- (Se crean tres filegroups llamados Ciudadano1, Ciudadano2 y Ciudadano3. Los filegroups permiten distribuir físicamente los datos en distintos archivos en disco, facilitando la partición y administración del almacenamiento.)

--CREAR LOS ARCHIVOS ADICIONALES
ALTER DATABASE Empresa
ADD FILE
(
	NAME = Ventass1, FILENAME = 'C:\ADBD\Ciudadano1.ndf',
	SIZE = 40 MB, FILEGROWTH = 20%
) TO FILEGROUP Ciudadano1;
GO

ALTER DATABASE Empresa
ADD FILE
(
	NAME = Ventass2, FILENAME = 'C:\ADBD\Ciudadano2.ndf',
	SIZE = 40 MB, FILEGROWTH = 20%
) TO FILEGROUP Ciudadano2;
GO

ALTER DATABASE Empresa
ADD FILE
(
	NAME = Ventass3, FILENAME = 'C:\ADBD\Ciudadano3.ndf',
	SIZE = 40 MB, FILEGROWTH = 20%
) TO FILEGROUP Ciudadano3;
GO
-- (A cada filegroup se le asigna un archivo físico (.ndf) en disco con nombre, ubicación, tamaño inicial y porcentaje de crecimiento. Esto permite que los datos particionados se almacenen físicamente en archivos diferentes.)

CREATE PARTITION FUNCTION FN_FuncionParticionCiudad (NVARCHAR(50))
AS RANGE RIGHT
FOR VALUES ('I','R');
GO
-- (Se crea una función de partición FN_FuncionParticionCiudad que divide los datos de acuerdo al valor de una columna tipo NVARCHAR(50). El tipo RANGE RIGHT indica que los valores 'I' y 'R' serán los límites de las particiones. Por ejemplo:
-- Valores menores o iguales a 'I' van a la primera partición,
-- mayores a 'I' y menores o iguales a 'R' a la segunda,
-- mayores a 'R' a la tercera.)

--CREAR ESQUEMA DE PARTICIÓN
CREATE PARTITION SCHEME EsquemaParticionAnual 
AS PARTITION FN_FuncionParticionCiudad
TO (Ciudadano1, Ciudadano2, Ciudadano3 )
GO
-- (Se crea un esquema de partición EsquemaParticionAnual que asocia la función de partición con los tres filegroups creados antes. Así, los datos se distribuirán automáticamente entre los filegroups según la función.)

SELECT 
    IDciudadano, 
    Ciudad, 
    $PARTITION.FN_FuncionParticionCiudad(Ciudad) AS 'Num Partición'
FROM dbo.ciudadano;
-- (Consulta la tabla Ciudadano mostrando el ID, la Ciudad y a qué partición corresponde cada registro según la función de partición.)

--INSERTAR DATOS NUEVOS, ESTOS SE INSERTAN EN LAS RESPECTIVAS PARTICIONES AUTOMÁTICAMENTE POR LA FUNCIÓN DE PARTICIÓN
INSERT INTO dbo.Ciudadano (IDciudadano, Nombre, Ciudad, Edad, Direccion)
VALUES
	(119320150, 'Adriana Diaz', 'Paris', 10, 'Calle paris'),
	(119320455, 'Sebastian Rodriguez', 'Londres', 9, 'calle londres'),
	(119346747, 'Raul Claudio', 'Heredia', 6, 'calle heredia');
GO
-- (Inserta tres nuevos registros en la tabla Ciudadano. Gracias a la función y esquema de partición, cada registro se almacenará automáticamente en el filegroup/archivo correspondiente según el valor de la columna Ciudad.)

--VERIFICACIÓN DE DATOS INSERTADOS EN LAS RESPECTIVAS PARTICIONES
SELECT 
	IDciudadano, 
	Ciudad, 
	$PARTITION.FN_FuncionParticionCiudad (Ciudad) AS 'Num Partición'
FROM dbo.ciudadano
WHERE IDciudadano IN (119320150, 119320455, 119346747);
GO
-- (Verifica en qué partición fueron almacenados los registros insertados, mostrando el número de partición para cada uno.)