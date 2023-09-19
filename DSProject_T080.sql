DROP DATABASE MangaShop;

CREATE DATABASE MangaShop;

USE MangaShop;




CREATE TABLE MsCustomer(
	customerID CHAR(5) PRIMARY KEY,
	customername VARCHAR(50),
	phonenumbercustomer VARCHAR(40)  CHECK (LEN(phonenumbercustomer) >= 11 AND ISNUMERIC(phonenumbercustomer) = 1),
	customeraddress VARCHAR(255)
);

CREATE TABLE MsRole(
	roleID char(5) PRIMARY KEY,
	rolename varchar(50)
);

CREATE TABLE MsStoreLocation(
	storeID char(5) PRIMARY KEY,
	StoreName varchar(50),
	StoreAddress varchar(255)
);
CREATE TABLE MsGenreManga(
	genreID char(5) PRIMARY KEY,
	genreManga varchar(50)
);


CREATE TABLE MsManga(
	mangaID CHAR(5) PRIMARY KEY,
	title VARCHAR(50),
	totalchapter INTEGER CHECK (totalchapter >= 1),
	author VARCHAR(50),
	price INTEGER CHECK (price >= 10000 AND price <= 1000000),
	rating DECIMAL(2,1) CHECK (rating >= 0.1 AND rating <= 5.0),
	genreID CHAR(5) FOREIGN KEY REFERENCES MsGenreManga(genreID)
);	


CREATE TABLE PaymentMethod(
	paymentmethodID char(5) PRIMARY KEY,
	paymenttype varchar(50)
);


CREATE TABLE MsStaff(
	staffID char(5) PRIMARY KEY,
	NameStaff VARCHAR(50),
	StaffPhoneNumber varchar(20) CHECK (LEN(StaffPhoneNumber) >= 11 AND ISNUMERIC(StaffPhoneNumber) = 1),
	StaffAddress VARCHAR(255),
	Sales integer,
	storeID char(5) FOREIGN KEY  REFERENCES MsstoreLocation(storeID),
	roleID char(5) FOREIGN KEY  REFERENCES MSRole(roleID),
	Salary integer,
	HiredDate date
);

CREATE TABLE MsTransaction(
		transactionID char(5) PRIMARY KEY,
		DateTransaction date,
		storeID char(5) FOREIGN KEY REFERENCES MsStoreLocation(storeID),
		costumerID char(5) FOREIGN KEY REFERENCES MsCustomer(customerID),
		staffID char(5) FOREIGN KEY REFERENCES MSStaff(staffID)
);

CREATE TABLE Transaction_Detail(
	transactionID CHAR(5) PRIMARY KEY FOREIGN KEY REFERENCES MsTransaction(transactionID),
	mangaID CHAR(5) FOREIGN KEY REFERENCES MsManga(mangaID),
	Quantity INTEGER CHECK (Quantity >= 1),
	paymentmethodID CHAR(5) FOREIGN KEY REFERENCES PaymentMethod(paymentmethodID)
);

INSERT INTO MsCustomer(customerID,customername,phonenumbercustomer,customeraddress)
VALUES
	('CS001', 'Agus Setiawan', '081234567890', 'Jl. Merdeka No. 10'),
    ('CS002', 'Rina Wijayanti', '082345678901', 'Jl. Kenanga No. 5'),
    ('CS003', 'Budi Santoso', '083456789012', 'Jl. Mawar No. 8'),
    ('CS004', 'Siti Rahayu', '084567890123', 'Jl. Cendana No. 15'),
    ('CS005', 'Hadi Prasetyo', '085678901234', 'Jl. Seroja No. 7'),
    ('CS006', 'Rita Fitriani', '086789012345', 'Jl. Melati No. 12'),
    ('CS007', 'Dedi Nugroho', '087890123456', 'Jl. Anggrek No. 3'),
    ('CS008', 'Lina Susanti', '088901234567', 'Jl. Sakura No. 6'),
    ('CS009', 'Eko Sutanto', '089012345678', 'Jl. Flamboyan No. 9'),
    ('CS010', 'Sari Indah', '081234567891', 'Jl. Kamboja No. 11'),
    ('CS011', 'Joko Purnomo', '082345678912', 'Jl. Tulip No. 4'),
    ('CS012', 'Rini Sari', '083456789123', 'Jl. Lavender No. 17'),
    ('CS013', 'Arif Hidayat', '084567890234', 'Jl. Aster No. 2'),
    ('CS014', 'Lia Agustina', '085678901345', 'Jl. Dahlia No. 14'),
    ('CS015', 'Rizal Wijaya', '086789012456', 'Jl. Anggrek No. 19'),
    ('CS016', 'Wati Permata', '087890123567', 'Jl. Flamboyan No. 13'),
    ('CS017', 'Doni Nugroho', '088901234678', 'Jl. Sakura No. 18'),
    ('CS018', 'Santi Indriani', '089012345789', 'Jl. Flamboyan No. 16'),
    ('CS019', 'Eko Susanto', '081234567892', 'Jl. Melati No. 21'),
    ('CS020', 'Siti Rahayu', '082345678913', 'Jl. Cendana No. 24'),
    ('CS021', 'Agus Prasetyo', '083456789124', 'Jl. Seroja No. 27'),
    ('CS022', 'Rina Fitriani', '084567890235', 'Jl. Melati No. 22'),
    ('CS023', 'Budi Susanto', '085678901346', 'Jl. Anggrek No. 29'),
	('CS024', 'Dewi Lestari', '087890123568', 'Jl. Mawar No. 26'),
    ('CS025', 'Hendra Santoso', '088901234679', 'Jl. Anggrek No. 31');



INSERT INTO MsRole (roleID, rolename)
VALUES
    ('RL001', 'Manager'),
    ('RL002', 'Staff');

INSERT INTO  MsStoreLocation(storeID,StoreName,StoreAddress)
VALUES
    ('SE001', 'MangaStore 1', 'Jl. Raya Sukamaju No. 10'),
    ('SE002', 'MangaStore 2', 'Jl. Merdeka No. 5'),
    ('SE003', 'MangaStore 3', 'Jl. Pahlawan No. 8'),
    ('SE004', 'MangaStore 4', 'Jl. Diponegoro No. 15'),
    ('SE005', 'MangaStore 5', 'Jl. Gatot Subroto No. 12');


INSERT INTO MsGenreManga (genreID, genreManga)
VALUES
    ('GE001', 'Action'),
    ('GE002', 'Romance'),
    ('GE003', 'Fantasy'),
    ('GE004', 'Comedy'),
    ('GE005', 'Mystery');

INSERT INTO MsManga (mangaID, title, totalchapter, author, price, rating, genreID)
VALUES
    ('MG001', 'One Piece', 1000, 'Eiichiro Oda', 50000, 4.5, 'GE001'),
    ('MG002', 'Naruto', 700, 'Masashi Kishimoto', 40000, 4.2, 'GE001'),
    ('MG003', 'Attack on Titan', 139, 'Hajime Isayama', 35000, 4.6, 'GE001'),
    ('MG004', 'My Hero Academia', 340, 'Kohei Horikoshi', 38000, 4.4, 'GE001'),
    ('MG005', 'Demon Slayer', 205, 'Koyoharu Gotouge', 42000, 4.7, 'GE001'),
    ('MG006', 'Kaguya-sama: Love is War', 240, 'Aka Akasaka', 32000, 3.3, 'GE002'),
    ('MG007', 'Fruits Basket', 200, 'Natsuki Takaya', 30000, 2.1, 'GE002'),
    ('MG008', 'Ao Haru Ride', 60, 'Io Sakisaka', 28000, 2.0, 'GE002'),
    ('MG009', 'Berserk', 364, 'Kentaro Miura', 45000, 3.8, 'GE003'),
	('MG010', 'Death Note', 108, 'Tsugumi Ohba', 32000, 4.2, 'GE003'),
    ('MG011', 'Fullmetal Alchemist', 116, 'Hiromu Arakawa', 38000, 4.7, 'GE003'),
    ('MG012', 'Gintama', 709, 'Hideaki Sorachi', 35000, 2.3, 'GE004'),
    ('MG013', 'One Punch Man', 137, 'ONE', 40000, 4.6, 'GE004'),
    ('MG014', 'The Promised Neverland', 181, 'Kaiu Shirai', 34000, 4.2, 'GE004'),
    ('MG015', 'Detective Conan', 1000, 'Gosho Aoyama', 45000, 2.8, 'GE005'),
    ('MG016', 'Black Clover', 300, 'Yuki Tabata', 32000, 2.4, 'GE005'),
    ('MG017', 'Jujutsu Kaisen', 170, 'Gege Akutami', 38000, 4.7, 'GE005'),
    ('MG018', 'Haikyu!!', 402, 'Haruichi Furudate', 36000, 1.5, 'GE001'),
    ('MG019', 'Komi Cant Communicate', 240, 'Tomohito Oda', 34000, 2.3, 'GE004'),
    ('MG020', 'Dr. Stone', 200, 'Riichiro Inagaki', 32000, 2.2, 'GE001'),
	('MG021', 'Tokyo Ghoul', 144, 'Sui Ishida', 33000, 2.4, 'GE001'),
    ('MG022', 'Hunter x Hunter', 390, 'Yoshihiro Togashi', 37000, 2.8, 'GE001'),
    ('MG023', 'The Seven Deadly Sins', 346, 'Nakaba Suzuki', 35000, 2.3, 'GE001'),
    ('MG024', 'Fairy Tail', 549, 'Hiro Mashima', 39000, 3.5, 'GE001'),
    ('MG025', 'Dragon Ball', 520, 'Akira Toriyama', 40000, 3.7, 'GE001');


INSERT INTO PaymentMethod (paymentmethodID, paymenttype)
VALUES
    ('PT001', 'Debit'),
    ('PT002', 'Cash'),
    ('PT003', 'Credit');


INSERT INTO MsStaff (staffID, NameStaff, StaffPhoneNumber, StaffAddress, Sales, storeID, roleID, Salary, HiredDate)
VALUES
    ('ST001', 'Budi Santoso', '08123456789', 'Jl. Merdeka No. 10', '20000', 'SE001', 'RL001', 500000, '2020-01-20'),
    ('ST002', 'Siti Rahayu', '08765432109', 'Jl. Mawar Indah No. 5', '30000', 'SE002', 'RL001', 450000, '2019-02-23'),
    ('ST003', 'Ahmad Gunawan', '08111223344', 'Jl. Pahlawan Kusuma No. 15', '40000', 'SE004', 'RL002', 400000, '2021-03-05'),
    ('ST004', 'Ratna Wulandari', '08987654321', 'Jl. Raya Serang No. 8', '60000', 'SE005', 'RL002', 550000, '2021-04-09'),
    ('ST005', 'Dewi Lestari', '08123456789', 'Jl. Diponegoro No. 25', '700000', 'SE003', 'RL001', 480000, '2018-05-20'),
    ('ST006', 'Agus Susanto', '08765432109', 'Jl. Kemuning Indah No. 12', '800000', 'SE003', 'RL001', 5200000, '2019-06-30'),
    ('ST007', 'Siti Haryati', '08111223344', 'Jl. Teuku Umar No. 7', '900000', 'SE004', 'RL002', 400000, '2022-07-25'),
    ('ST008', 'Dwi Cahyono', '08987654321', 'Jl. Veteran No. 18', '1000000', 'SE002', 'RL002', 450000, '2020-08-27'),
    ('ST009', 'Tri Utami', '08123456789', 'Jl. Ahmad Yani No. 14', '120000', 'SE003', 'RL001', 550000, '2019-09-14'),
    ('ST010', 'Rudi Hartono', '08765432109', 'Jl. Teratai Indah No. 21', '190000', 'SE001', 'RL002', 480000, '2019-10-15'),
    ('ST011', 'Nurul Aini', '08111223344', 'Jl. Cempaka No. 6', '100000', 'SE002', 'RL002', 400000, '2018-11-18'),
    ('ST012', 'Eko Pratomo', '08987654321', 'Jl. Seruni No. 11', '200000', 'SE003', 'RL001', 520000, '2016-12-19'),
    ('ST013', 'Sri Widayanti', '08123456789', 'Jl. Sudirman No. 19', '400000', 'SE001', 'RL002', 450000, '2020-01-28'),
    ('ST014', 'Bambang Susanto', '08765432109', 'Jl. A. Yani No. 16', '500000', 'SE002', 'RL001', 500000, '2021-02-25'),
    ('ST015', 'Linda Putri', '08111223344', 'Jl. Ahmad Dahlan No. 13', '750000', 'SE003', 'RL002', 400000, '2021-03-27'),
    ('ST016', 'Anto Kusuma', '08987654321', 'Jl. Merak No. 9', '50000', 'SE001', 'RL002', 480000, '2022-04-01'),
    ('ST017', 'Rina Pratiwi', '08123456789', 'Jl. Pahlawan No. 20', '80000', 'SE002', 'RL001', 550000, '2019-05-12'),
    ('ST018', 'Dedy Setiawan', '08765432109', 'Jl. Cendrawasih No. 17', '90000', 'SE004', 'RL001', 520000, '2020-06-17'),
    ('ST019', 'Rini Anggraini', '08111223344', 'Jl. Ahmad Yani No. 24', '150000', 'SE003', 'RL002', 400000, '2015-07-19'),
    ('ST020', 'Yoga Prasetyo', '08987654321', 'Jl. Diponegoro No. 23', '140000', 'SE002', 'RL002', 450000, '2021-08-21'),
    ('ST021', 'Novi Sulistyowati', '08123456789', 'Jl. Mawar Indah No. 28', '180000', 'SE003', 'RL001', 550000, '2020-09-24'),
    ('ST022', 'Rudi Hermawan', '08765432109', 'Jl. Pahlawan Kusuma No. 33', '130000', 'SE001', 'RL002', 480000, '2021-10-25'),
    ('ST023', 'Diana Sari', '08111223344', 'Jl. Raya Serang No. 30', '900000', 'SE005', 'RL002', 400000, '2019-11-29'),
    ('ST024', 'Faisal Ramadhan', '08987654321', 'Jl. Diponegoro No. 27', '1000000', 'SE003', 'RL001', 520000, '2018-12-27'),
    ('ST025', 'Winda Sari', '08123456789', 'Jl. Kemuning Indah No. 32', '550000', 'SE001', 'RL001', 500000, '2020-01-17');

INSERT INTO MsTransaction (transactionID, DateTransaction, storeID, costumerID, staffID)
VALUES
    ('TR001', '2023-02-01', 'SE001', 'CS001', 'ST013'),
    ('TR002', '2023-03-02', 'SE004', 'CS002', 'ST003'),
    ('TR003', '2023-12-03', 'SE002', 'CS003', 'ST020'),
    ('TR004', '2023-11-04', 'SE001', 'CS004', 'ST016'),
    ('TR005', '2023-03-05', 'SE003', 'CS005', 'ST019'),
    ('TR006', '2023-01-06', 'SE004', 'CS006', 'ST007'),
    ('TR007', '2023-07-07', 'SE005', 'CS007', 'ST023'),
    ('TR008', '2023-08-08', 'SE002', 'CS008', 'ST020'),
    ('TR009', '2023-09-09', 'SE003', 'CS009', 'ST009'),
    ('TR010', '2023-10-10', 'SE001', 'CS010', 'ST022'),
    ('TR011', '2023-02-11', 'SE004', 'CS011', 'ST003'),
    ('TR012', '2023-01-12', 'SE005', 'CS012', 'ST023'),
    ('TR013', '2023-04-13', 'SE002', 'CS013', 'ST020'),
    ('TR014', '2023-05-14', 'SE003', 'CS014', 'ST012'),
    ('TR015', '2023-02-15', 'SE001', 'CS015', 'ST013'),
    ('TR016', '2023-01-16', 'SE002', 'CS016', 'ST011'),
    ('TR017', '2023-06-17', 'SE003', 'CS017', 'ST015'),
    ('TR018', '2023-08-18', 'SE004', 'CS018', 'ST003'),
    ('TR019', '2023-09-19', 'SE005', 'CS019', 'ST004'),
    ('TR020', '2023-10-20', 'SE001', 'CS020', 'ST022'),
    ('TR021', '2023-11-21', 'SE004', 'CS021', 'ST007'),
    ('TR022', '2023-01-22', 'SE002', 'CS022', 'ST008'),
    ('TR023', '2023-02-23', 'SE004', 'CS023', 'ST007'),
    ('TR024', '2023-03-24', 'SE003', 'CS024', 'ST015'),
    ('TR025', '2023-05-25', 'SE001', 'CS025', 'ST013');

INSERT INTO Transaction_Detail (transactionID, mangaID, Quantity, paymentmethodID)
VALUES
    ('TR001', 'MG001', 19, 'PT001'),
    ('TR002', 'MG003', 17, 'PT002'),
    ('TR003', 'MG005', 16, 'PT003'),
    ('TR004', 'MG006', 15, 'PT001'),
    ('TR005', 'MG007', 14, 'PT003'),
    ('TR006', 'MG009', 10, 'PT002'),
    ('TR007', 'MG010', 9, 'PT001'),
    ('TR008', 'MG011', 8, 'PT003'),
    ('TR009', 'MG012', 5, 'PT001'),
    ('TR010', 'MG014', 4, 'PT002'),
    ('TR011', 'MG015', 6, 'PT003'),
    ('TR012', 'MG017', 9, 'PT001'),
    ('TR013', 'MG018', 6, 'PT002'),
    ('TR014', 'MG019', 4, 'PT003'),
    ('TR015', 'MG020', 7, 'PT001'),
    ('TR016', 'MG021', 2, 'PT002'),
    ('TR017', 'MG023', 3, 'PT003'),
    ('TR018', 'MG024', 4, 'PT001'),
    ('TR019', 'MG025', 6, 'PT003'),
	('TR020', 'MG001', 3, 'PT002'),
    ('TR021', 'MG022', 2, 'PT003'),
    ('TR022', 'MG014', 3, 'PT001'),
    ('TR023', 'MG003', 3, 'PT002'),
    ('TR024', 'MG002', 6, 'PT003'),
    ('TR025', 'MG004', 5, 'PT001')

--NOMOR 1
SELECT title AS "Title", author AS "Author", price AS "Price"
FROM MsManga
WHERE rating > 3.3

--NOMOR 2
SELECT *
FROM MsManga
WHERE totalchapter > (SELECT AVG(totalchapter) FROM MsManga)

--NOMOR 3
UPDATE MsStaff
SET Salary = Salary * 1.1
WHERE MONTH(HiredDate) = 3

--NOMOR 4
ALTER TABLE MsStaff
ALTER COLUMN StaffPhoneNumber varchar(13)

--NOMOR 5
SELECT mt.transactionID, td.Quantity, mm.title, mm.author
FROM MsTransaction mt JOIN Transaction_Detail td ON mt.transactionID = td.transactionID  JOIN MsManga mm ON td.mangaID = mm.mangaID
WHERE mm.author LIKE '%i'

--NOMOR 6
SELECT mc.customerID,mc.customername, COUNT(mt.transactionID) AS 'TotalTransaction', mm.mangaID
FROM MsTransaction mt JOIN MsCustomer mc ON mt.costumerID = mc.customerID JOIN Transaction_Detail td ON mt.transactionID = td.transactionID  JOIN MsManga mm ON td.mangaID = mm.mangaID
WHERE MONTH(mt.DateTransaction) > 6
  AND LEN(mc.customername) < 16
GROUP BY mc.customerID,mc.customername, mm.mangaID

--NOMOR 7
SELECT TOP 10 ms.NameStaff, mt.transactionID, mc.customername
FROM MsStaff ms
JOIN MsTransaction mt ON ms.staffID = mt.staffID
JOIN MsCustomer mc ON mt.costumerID = mc.customerID
WHERE SUBSTRING(mc.CustomerID, LEN(mc.CustomerID), 1) % 2 = 1
ORDER BY ms.Salary DESC

--NOMOR 8
SELECT
    COUNT(td.MangaID) AS TotalCount,
    mm.title,
    mm.price
FROM
    (
        SELECT TOP 10 MangaID
        FROM Transaction_Detail
        GROUP BY MangaID
        ORDER BY COUNT(*) DESC
    ) AS topManga
JOIN Transaction_Detail AS td ON topManga.MangaID = td.MangaID
JOIN MsManga AS mm ON td.MangaID = mm.MangaID
GROUP BY td.mangaID, mm.title, mm.price

--NOMOR 9
SELECT
    mt.transactionID AS ID,ms.NameStaff,ms.roleID, ms.HiredDate,msl.StoreAddress
	FROM
    MsTransaction mt JOIN MsStaff ms ON mt.StaffID = ms.StaffID JOIN MsRole mr ON ms.roleID = mr.roleID JOIN MsStoreLocation msl ON ms.storeID = msl.storeID
    WHERE
    MONTH(ms.HiredDate) > 2
    AND mr.rolename = 'Manager'
    AND msl.StoreAddress LIKE '%l%'
    AND RIGHT(ms.StaffPhoneNumber, 2) % 2 = 1;

--NOMOR 10
SELECT
    mc.CustomerID,
    mc.CustomerName
FROM
    MsCustomer mc
JOIN
    (
        SELECT
            mt.costumerID,
            COUNT(*) AS TransactionCount
        FROM
            MsTransaction mt
        GROUP BY
            mt.costumerID
        HAVING
            COUNT(*) < 2
    ) AS Subquery ON mc.CustomerID = Subquery.costumerID
JOIN
    MsTransaction AS mt ON mc.CustomerID = mt.costumerID
JOIN
    MsStaff AS ms ON mt.StaffID = ms.StaffID
WHERE
    SUBSTRING(ms.StaffID, LEN(ms.StaffID), 1) % 2 = 0

--NOMOR 11
SELECT
    gm.genreID,
    gm.genreManga
FROM
    MsGenreManga  gm
JOIN
    MsManga mm ON gm.GenreID = mm.GenreID
JOIN
    Transaction_Detail td ON mm.MangaID = td.MangaID
JOIN
    MsTransaction mt ON td.TransactionID = mt.TransactionID
WHERE
    mt.DateTransaction > DATEADD(MONTH, -10, CURRENT_TIMESTAMP)
GROUP BY
    gm.GenreID, gm.genreManga
HAVING
    COUNT(*) > 4;

--NOMOR 12
GO
CREATE VIEW BestSeniorStaff AS
SELECT
    ms.NameStaff,
    ms.Salary,
    ms.Sales,
    SUM(mm.price) AS 'TotalSalesValue'
FROM
    MsStaff ms
JOIN
    MsTransaction mt ON ms.StaffID = mt.StaffID
JOIN
    Transaction_Detail TD ON mt.TransactionID = TD.TransactionID
JOIN
    MsManga mm ON TD.mangaID = mm.MangaID
JOIN
    MsStoreLocation msl ON ms.storeID = msl.storeID
WHERE
    YEAR(ms.HiredDate) < 2023
    AND TRY_CONVERT(int, LEFT(msl.StoreAddress, 1)) % 2 = 1
GROUP BY
    ms.NameStaff, ms.Salary, ms.Sales
HAVING
    SUM(mm.price) > 100000;
GO

--NOMOR 13
SELECT TOP 5
    mc.customername,
    mc.customerID,
    mt.DateTransaction,
    mm.title,
    mm.rating
FROM
    MsCustomer mc
JOIN
    MsTransaction mt ON mc.CustomerID = mt.costumerID
JOIN
    Transaction_Detail td ON mt.TransactionID = td.TransactionID
JOIN
    MsManga mm ON td.MangaID = mm.MangaID
WHERE
    mm.rating > (SELECT AVG(rating) FROM MsManga)
    AND MONTH(mt.DateTransaction) > 5
GROUP BY
    mc.CustomerName,
    mc.CustomerID,
    mt.DateTransaction,
    mm.title,
    mm.rating
ORDER BY
    mc.customername;
--NOMOR 14
SELECT
    mc.CustomerName,
    mc.CustomerAddress,
    mt.DateTransaction
FROM
    MsCustomer mc
JOIN
    MsTransaction mt ON mc.customerID = mt.costumerID
JOIN
    Transaction_Detail td ON mt.TransactionID = td.TransactionID
WHERE
    MONTH(mt.DateTransaction) = 12
    AND DAY(mt.DateTransaction) > 24
    AND td.Quantity > (SELECT AVG(Quantity) + 1 FROM Transaction_Detail)

--NOMOR 15
SELECT
    ms.NameStaff,
    ms.StaffAddress
FROM
    MsStaff ms
JOIN
    MsTransaction mt ON ms.StaffID = mt.StaffID
JOIN
    MsCustomer mc ON mt.costumerID = mc.customerID
JOIN
	Transaction_Detail td ON mt.transactionID = td.transactionID
JOIN
	PaymentMethod pm ON  td.paymentmethodID = pm.paymentmethodID
WHERE
    DATENAME(WEEKDAY, mt.DateTransaction) = 'Monday'
    AND pm.paymenttype LIKE '%Debit%'
    AND ms.Sales > (SELECT AVG(Sales) FROM MsStaff)

--NOMOR 17

SELECT
    SUM(price) AS "total manga bought price",
    COUNT(*) AS "Total manga bought times",
    SUBSTRING(MangaID, LEN(MangaID) - 2, 3) AS id,
    'highest manga price' AS description
FROM
    MsManga
WHERE
    price <= (SELECT MAX(price) FROM MsManga)
    AND ASCII(RIGHT(author, 1)) < 100
GROUP BY
    price, MangaID, author
UNION
SELECT
    SUM(price) AS "total manga bought price",
    COUNT(*) AS "Total manga bought times",
    SUBSTRING(MangaID, LEN(mangaID) - 2, 3) AS id,
    'Lowest manga rating' AS description
FROM
    MsManga
WHERE
    rating >= (SELECT MIN(rating) + 2.2 FROM MsManga)
    AND ASCII(RIGHT(author, 1)) > 100
GROUP BY
    price, MangaID, author;

--NOMOR 18

SELECT
    DATENAME(MONTH, mt.DateTransaction) AS "Busiest month",
    CONCAT(COUNT(*) , ' transaction(s) in ', DATENAME(MONTH, mt.DateTransaction)) AS "hectic description"
FROM
    MsTransaction mt
JOIN Transaction_Detail td ON mt.transactionID = td.transactionID
JOIN MsManga mm ON td.mangaID = mm.mangaID
WHERE
    mm.GenreID IN ('GE001', 'GE003', 'GE005')
GROUP BY
    DATENAME(MONTH, mt.DateTransaction)
HAVING
    COUNT(*) = (
        SELECT MAX(TransactionCount)
        FROM (
            SELECT COUNT(*) AS TransactionCount
            FROM MsTransaction mt
            JOIN Transaction_Detail td ON mt.transactionID = td.transactionID
            JOIN MsManga mm ON td.mangaID = mm.mangaID
            WHERE mm.GenreID IN ('GE001', 'GE003', 'GE005')
            GROUP BY DATENAME(MONTH, mt.DateTransaction)
        ) AS Subquery
    )

UNION

-- Least busy month and hectic description for GenreID 'GE002', 'GE004', 'GE006'
SELECT
    DATENAME(MONTH, mt.DateTransaction) AS "Least busy month",
    CONCAT(COUNT(*) , ' transaction(s) in ', DATENAME(MONTH, mt.DateTransaction)) AS "hectic description"
FROM
    MsTransaction mt
JOIN Transaction_Detail td ON mt.transactionID = td.transactionID
JOIN MsManga mm ON td.mangaID = mm.mangaID
WHERE
    mm.GenreID IN ('GE002', 'GE004', 'GE006')
GROUP BY
    DATENAME(MONTH, mt.DateTransaction)
HAVING
    COUNT(*) = (
        SELECT MIN(TransactionCount)
        FROM (
            SELECT COUNT(*) AS TransactionCount
            FROM MsTransaction mt
            JOIN Transaction_Detail td ON mt.transactionID = td.transactionID
            JOIN MsManga mm ON td.mangaID = mm.mangaID
            WHERE mm.GenreID IN ('GE002', 'GE004', 'GE006')
            GROUP BY DATENAME(MONTH, mt.DateTransaction)
        ) AS Subquery
    )

--NOMOR 19
SELECT
    mc.customerID,
    SUBSTRING(mc.CustomerName, CHARINDEX(' ', mc.customername) + 1, LEN(mc.customername)) AS "Last Name",
    AVG(TotalMoneySpent) AS "Average Money Spent/customer"
FROM
    MsCustomer mc
JOIN
    (
        SELECT
            mt.costumerID,
            mt.TransactionID,
            SUM(TD.Quantity * MM.price) AS TotalMoneySpent
        FROM
            MsTransaction AS mt
        JOIN
            Transaction_Detail AS td ON mt.TransactionID = TD.TransactionID
        JOIN
            MsManga AS mm ON td.MangaID = mm.MangaID
		JOIN PaymentMethod pm ON td.paymentmethodID = pm.paymentmethodID
        WHERE
            pm.paymenttype IN ('Debit', 'Credit')
        GROUP BY
            mt.costumerID,
            mt.TransactionID
    ) AS Subquery ON mc.CustomerID = Subquery.costumerID
GROUP BY
    mc.customerID,
    mc.customername

--NOMOR 20
SELECT
    msl.StoreID,
    msl.StoreAddress,
    AVG(TD.Quantity * MM.price) AS "Average Income per Transaction",
    SUM(CASE WHEN DATENAME(WEEKDAY, ms.HiredDate) = 'Tuesday' THEN 1 ELSE 0 END) AS "Total Transactions by Tuesday Staff",
    SUM(TD.Quantity * MM.price) AS "Total Income"
FROM
    MsStoreLocation msl
JOIN
    MsStaff ms ON msl.StoreID = ms.StoreID
JOIN
    MsTransaction mt ON ms.StaffID = mt.StaffID
JOIN
    Transaction_Detail td ON mt.TransactionID = td.TransactionID
JOIN
    MsManga  mm ON TD.MangaID = mm.MangaID
GROUP BY
    msl.StoreID, msl.StoreAddress
HAVING
    SUBSTRING(msl.StoreID, LEN(msl.StoreID), 1) % 2 = 1