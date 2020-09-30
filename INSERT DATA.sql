USE [Blau Jacke Jacket]

--INSERT Table Customer -> Master Table terdapat 15 data
INSERT INTO Customer
VALUES 
('CU001','Ariana Grande','1993-06-26', 'Female'),
('CU002','William Arthur','1982-06-21', 'Male'),
('CU003','Catherine Middleton','1982-01-09', 'Female'),
('CU004','Henry Charles','1984-09-15', 'Male'),
('CU005','Meghan Markle','1981-08-04', 'Female'),
('CU006','Daniel Padilla','1995-04-26', 'Male'),
('CU007','Kathryn Bernardo','1996-04-26', 'Female'),
('CU008','Chelsea Olivia','1992-07-29', 'Female'),
('CU009','Glenn Alinskie','1988-10-19', 'Male'),
('CU010','Kristine Hermosa','1983-09-09', 'Female'),
('CU011','Maudy Ayunda','1994-12-19', 'Female'),
('CU012','Teejay Marquez','1993-09-29', 'Male'),
('CU013','Michelle Ziudith','1995-01-20', 'Female'),
('CU014','Alden Richards','1992-01-02', 'Male'),
('CU015','James Reid','1993-05-11', 'Male')

--INSERT Table Staff -> Master Table terdapat 15 data
INSERT INTO Staff
VALUES
('ST001','Sarah Geronimo','1988-07-25','Female',3350000),
('ST002','Enrique Gill','1992-03-30','Male',2503000),
('ST003','Marian Rivera','1984-08-12','Female',1600000),
('ST004','Anna Theresa','1984-08-10','Female',3050000),
('ST005','Derrick Monasterio','1995-08-01','Male',2650000),
('ST006','Anne Curtis','1985-02-17','Female',8440000),
('ST007','Nadine Lustre','1993-10-31','Female',2590000),
('ST008','Cristine Reyes','1989-02-05','Female',1680000),
('ST009','Paulo Avelino','1988-05-13','Male',3050000),
('ST010','Coleen García','1992-09-24','Female',2073000),
('ST011','Myrtle Sarrosa','1994-12-07','Female',7008000),
('ST012','Vina Morales','1975-10-17','Female',5590000),
('ST013','Piolo Pascual','1977-01-12','Male',7600000),
('ST014','Miguel Tanfelix','1998-09-21','Male',3050000),
('ST015','Joseph Marco','1988-10-04','Male',6650000)

--INSERT Table Jacket -> Master Table terdapat 15 data
INSERT INTO Jacket
VALUES
('JA001','Windbreaker',245000,80),
('JA002','Bomber',95000,65),
('JA003','Varsity',74500,30),
('JA004','Kulit',638500,12),
('JA005','Sports',83500,36),
('JA006','Parka',183000,67),
('JA007','Duffle Coat',862000,28),
('JA008','Pea Coat',769000,22),
('JA009','Trench Coat',484000,27),
('JA010','Mackintosh Coat',324000,14),
('JA011','Overcoat',562000,9),
('JA012','Denim',65000,217),
('JA013','Cagoule',117000,44),
('JA014','Sukajan',38500,279),
('JA015','Sweater',46500,682)

--INSERT Table Material -> Master Table terdapat 15 Data
INSERT INTO Material
VALUES
('MA001','Kancing',80500,36),
('MA002','Karet',90500,53),
('MA003','Adidas',100500,32),
('MA004','Terry',39500,46),
('MA005','Fleece',28500,24),
('MA006','Kanvas',34600,35),
('MA007','Taslan',98000,62),
('MA008','Mikro',48900,69),
('MA009','Parasut',54500,96),
('MA010','Corduroy',73500,66),
('MA011','Drill',89500,56),
('MA012','Tessa',43500,90),
('MA013','Resleting',66500,54),
('MA014','Jeans',63500,304),
('MA015','Kulit',166500,87)

-- INSERT Table Vendor -> Master Table terdapat 15 data
INSERT INTO Vendor
VALUES
('VE001','PT. Alibaba Group','Naga Street','alibaba@gmail.com'),
('VE002','Bina Kain','Flamboyan Street','kain.bina@yahoo.com'),
('VE003','Cherish Cotton','Senen Street','cot_che@yahoo.com'),
('VE004','Dobby Kain','Bahagia Street','dokain@gmail.com'),
('VE005','PT. Efata Group','Setia Street','grefata@yahoo.com'),
('VE006','Fun Kain','Bijaksana Street','funkain@gmail.com'),
('VE007','Gorgeous Cotton','Telat Street','gor_cot@yahoo.com'),
('VE008','PT. Intan Group','London Street','group.intan@gmail.com'),
('VE009','Jenaka Kain','Lembang Street','kainjenaka@yahoo.com'),
('VE010','Kalimutu Cotton','Jujur Street','kalicotton@gmail.com'),
('VE011','Lewata Abadi','Dermawan Street','abadi_lewata@gmail.com'),
('VE012','Mandiri Kreasi','Hati Street','kreasimandiri@yahoo.com'),
('VE013','Nana Indo','Kacang Street','indonana@yahoo.com'),
('VE014','Pangako Kain','Mawar Street','pangakokain@gmail.com'),
('VE015','Raja Makmur','Melati Street','rajamakmur@gmail.com')

--INSERT INTO DetailJacketMaterial -> Detail Table terdapat 30 data
INSERT INTO DetailJacketMaterial
VALUES
('JA001','MA001'),
('JA001','MA009'),
('JA002','MA002'),
('JA002','MA013'),
('JA003','MA008'),
('JA003','MA003'),
('JA004','MA015'),
('JA004','MA001'),
('JA005','MA013'),
('JA005','MA009'),
('JA006','MA006'),
('JA006','MA013'),
('JA007','MA004'),
('JA007','MA010'),
('JA008','MA006'),
('JA008','MA009'),
('JA009','MA003'),
('JA009','MA011'),
('JA010','MA015'),
('JA010','MA011'),
('JA011','MA012'),
('JA011','MA014'),
('JA012','MA002'),
('JA012','MA006'),
('JA013','MA009'),
('JA013','MA010'),
('JA014','MA013'),
('JA014','MA011'),
('JA015','MA004'),
('JA015','MA002')


--INSERT Table SalesTransaction -> Transaction Table terdapat 20 data
INSERT INTO HeaderSalesTransaction
VALUES
('SA001','ST002','CU005','2019-03-20'),
('SA002','ST003','CU007','2019-04-22'),
('SA003','ST004','CU009','2019-04-22'),
('SA004','ST005','CU006','2019-04-24'),
('SA005','ST006','CU014','2019-05-24'),
('SA006','ST007','CU013','2019-05-24'),
('SA007','ST007','CU004','2019-05-25'),
('SA008','ST008','CU013','2019-05-25'),
('SA009','ST009','CU001','2019-06-25'),
('SA010','ST010','CU015','2019-07-25'),
('SA011','ST011','CU011','2019-08-26'),
('SA012','ST012','CU006','2019-08-26'),
('SA013','ST012','CU012','2019-09-27'),
('SA014','ST013','CU002','2019-09-27'),
('SA015','ST014','CU010','2019-10-27'),
('SA016','ST015','CU011','2019-10-29'),
('SA017','ST015','CU001','2019-10-29'),
('SA018','ST001','CU003','2019-11-29'),
('SA019','ST002','CU009','2019-11-30'),
('SA020','ST003','CU008','2019-11-30')


--INSERT Table DetailTransaction -> Transaction Detail Table terdapat 30
INSERT INTO DetailSalesTransaction
VALUES
('SA001','JA002',9),
('SA001','JA006',5),
('SA002','JA002',2),
('SA003','JA005',2),
('SA004','JA007',7),
('SA005','JA009',1),
('SA005','JA011',1),
('SA006','JA014',4),
('SA007','JA015',5),
('SA008','JA015',6),
('SA001','JA010',3),
('SA009','JA013',5),
('SA009','JA014',23),
('SA010','JA014',9),
('SA011','JA004',65),
('SA012','JA004',9),
('SA013','JA001',1),
('SA014','JA002',13),
('SA015','JA015',1),
('SA016','JA012',4),
('SA016','JA013',4),
('SA017','JA011',7),
('SA017','JA012',4),
('SA017','JA008',3),
('SA017','JA005',9),
('SA018','JA002',7),
('SA018','JA003',9),
('SA019','JA008',6),
('SA019','JA009',1),
('SA020','JA005',10)


--INSERT PurchaseTransaction -> Transaction Table terdapat 20 data
INSERT INTO HeaderPurchaseTransaction
VALUES
('PR001','ST008','VE008','2019-01-22'),
('PR002','ST009','VE008','2019-01-22'),
('PR003','ST010','VE012','2019-02-22'),
('PR004','ST010','VE010','2019-03-22'),
('PR005','ST011','VE001','2019-04-22'),
('PR006','ST006','VE009','2019-05-25'),
('PR007','ST007','VE008','2019-06-25'),
('PR008','ST008','VE008','2019-06-25'),
('PR009','ST009','VE005','2019-07-25'),
('PR010','ST001','VE004','2019-08-25'),
('PR011','ST002','VE011','2019-09-26'),
('PR012','ST003','VE006','2019-09-26'),
('PR013','ST004','VE001','2019-10-26'),
('PR014','ST005','VE005','2019-10-26'),
('PR015','ST005','VE008','2019-10-27'),
('PR016','ST006','VE015','2019-10-27'),
('PR017','ST007','VE008','2019-10-28'),
('PR018','ST011','VE005','2019-10-28'),
('PR019','ST012','VE012','2019-12-28'),
('PR020','ST012','VE006','2019-12-30')


--INSERT DetailPurchase --> Transaction Detail Table terdapat 30 data
INSERT INTO DetailPurchaseTransaction
VALUES
('PR001','MA001',45),
('PR002','MA015',65),
('PR002','MA003',75),
('PR003','MA005',85),
('PR004','MA008',65),
('PR005','MA002',10),
('PR005','MA009',20),
('PR005','MA011',40),
('PR006','MA005',50),
('PR007','MA010',30),
('PR008','MA004',60),
('PR008','MA006',60),
('PR009','MA013',45),
('PR010','MA012',80),
('PR010','MA014',90),
('PR011','MA014',35),
('PR012','MA015',65),
('PR013','MA002',90),
('PR013','MA006',20),
('PR014','MA008',85),
('PR015','MA001',15),
('PR015','MA006',75),
('PR016','MA007',85),
('PR017','MA004',45),
('PR017','MA011',65),
('PR018','MA015',35),
('PR019','MA015',25),
('PR019','MA007',10),
('PR020','MA004',25),
('PR020','MA003',10)
