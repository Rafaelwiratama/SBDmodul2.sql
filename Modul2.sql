create table Bandara( 
ID INT PRIMARY KEY, 
Nama varchar(255), 
Kota varchar(255), 
Negara varchar(255),
Kode_IATA char(3) 
);

create table Bagasi ( 
ID INT PRIMARY KEY, 
Berat INT, 
Ukuran varchar(5), 
Warna varchar(255), 
Jenis varchar(255) 
);

create table Maskapai( 
ID char(6) PRIMARY KEY, 
Nama varchar(255), 
Negara_Asal varchar(255) 
);

create table Penumpang (     
NIK char(16) PRIMARY KEY,     
Nama varchar(255),     
tanggal_lahir date,     
Alamat varchar(255),      
No_Telepon varchar(13),     
Jenis_Kelamin char(1),     
Kewarganegaraan varchar(255),  
Bagasi_ID INT,     
CONSTRAINT FK_Bagasi 
FOREIGN KEY (Bagasi_ID) REFERENCES Bagasi(ID)     
ON DELETE CASCADE    
ON UPDATE CASCADE    
)ENGINE=InnoDB;

create table Pesawat(      
ID char(6) PRIMARY KEY,      
Model varchar(255),      
Kapasitas INT,      
Tahun_Produksi char(4),      
Status_Pesawat varchar(50),   
Maskapai_ID char(6),      
CONSTRAINT FK_Maskapai  
FOREIGN KEY (Maskapai_ID)  REFERENCES Maskapai(ID)    
ON DELETE CASCADE    
ON UPDATE CASCADE      
)ENGINE=InnoDB;

create table Penerbangan(   
ID char (6) PRIMARY KEY,   
Waktu_keberangkatan datetime,   
Waktu_sampai datetime,   
Status_penerbangan varchar(50),   
Pesawat_ID char(6),   
CONSTRAINT FK_Pesawat 
FOREIGN KEY (Pesawat_ID) REFERENCES Pesawat(ID)   
ON DELETE CASCADE   
ON UPDATE CASCADE   
)ENGINE=InnoDB;

create table bandara_Penerbangan(  
Bandara_ID INT,  
Penerbangan_ID char(6),  
PRIMARY KEY (Bandara_ID, Penerbangan_ID), 
CONSTRAINT FK_Bandara  
FOREIGN KEY (Bandara_ID) REFERENCES Bandara(ID),  
CONSTRAINT FK_Penerbangan  
FOREIGN KEY (Penerbangan_ID) REFERENCES Penerbangan(ID)  
ON DELETE CASCADE  
ON UPDATE CASCADE  
)ENGINE=InnoDB;

create table Tiket( 
ID char(6), 
Nomor_Kursi char(3), 
Harga INT, 
Waktu_pembelian datetime, 
Kelas_penerbangan varchar(50), 
Penumpang_NIK char(16), 
Penerbangan_ID char(6), 
CONSTRAINT FK_Penumpang 
FOREIGN KEY (Penumpang_NIK) REFERENCES Penumpang(NIK), 
CONSTRAINT FK_TiketPenerbangan 
FOREIGN KEY (Penerbangan_ID) REFERENCES Penerbangan(ID) 
ON DELETE CASCADE 
ON UPDATE CASCADE 
)ENGINE=InnoDB;

INSERT INTO Bandara (ID, Nama, Kota, Negara, Kode_IATA) 
VALUES  
(1, 'Soekarno-Hatta', 'Jakarta', 'Indonesia', 'CGK'), 
(2, 'Ngurah Rai', 'Denpasar', 'Indonesia', 'DPS'), 
(3, 'Changi', 'Singapore', 'Singapore', 'SIN'), 
(4, 'Haneda', 'Tokyo', 'Japan', 'HND');

INSERT INTO Bagasi 
VALUES  
(1, 20, 'M', 'Hitam', 'Koper'), 
(2, 15, 'S', 'Merah', 'Ransel'), 
(3, 25, 'L', 'Biru', 'Koper'), 
(4, 10, 'S', 'Hijau', 'Ransel');

INSERT INTO Maskapai 
VALUES  
('GA123', 'Garuda Indonesia', 'Indonesia'), 
('SQ456', 'Singapore Airlines', 'Singapore'), 
('JL789', 'Japan Airlines', 'Japan'), 
('QZ987', 'AirAsia', 'Malaysia');

INSERT INTO Penumpang   
VALUES 
('3201123456789012', 'Budi Santoso', '1990-04-15', 'Jl. Merdeka No.1', '081234567890', 'L', 'Indonesia', 1), 
('3302134567890123', 'Siti Aminah', '1985-08-20', 'Jl. Kebangsaan No.2', '081298765432', 'P', 'Indonesia', 2), 
('3403145678901234', 'John Tanaka', '1992-12-05', 'Shibuya, Tokyo', '080123456789', 'L', 'Japan', 3), 
('3504156789012345', 'Li Wei', '1995-03-10', 'Orchard Rd, Singapore', '0658123456789', 'L', 'Singapore', 4);

INSERT INTO Pesawat 
VALUES 
('PKABC1', 'Boeing 737', '180', 2018, 'Aktif', 'GA123'),
('PKDEF2', 'Airbus A320', '150', 2020, 'Aktif', 'SQ456'),
('PKGHI3', 'Boeing', '250', 2019, 'Dalam Perawatan', 'JL789'), 
('PKJKL4', 'Airbus A330', '280', 2021, 'Aktif', 'QZ987');

INSERT INTO Penerbangan 
VALUES 
('FL0001', '2024-12-15 10:00:00', '2024-12-15 12:30:00', 'Jadwal', 'PKABC1'), 
('FL0002', '2024-12-16 08:00:00', '2024-12-15 10:45:00', 'Jadwal', 'PKDEF2'), 
('FL0003', '2024-12-17 14:00:00', '2024-12-15 16:30:00', 'Ditunda', 'PKGHI3'), 
('FL0004', '2024-12-18 18:00:00', '2024-12-15 20:30:00', 'Jadwal', 'PKJKL4');

INSERT INTO Bandara_Penerbangan 
VALUES 
('1', 'FL0001'), 
('2', 'FL0002'), 
('3', 'FL0003'), 
('4', 'FL0004');

INSERT INTO Tiket  
VALUES 
('TIK001', '12A', 1200000, '2024-11-01 08:00:00', 'Ekonomi', '3201123456789012', 'FL0001'), 
('TIK002', '14B', 1500000, '2024-11-02 09:30:00', 'Bisnis', '3302134567890123', 'FL0002'), 
('TIK003', '16C', 2000000, '2024-11-03 10:15:00', 'Ekonomi', '3403145678901234', 'FL0003'), 
('TIK004', '18D', 1000000, '2024-11-04 11:45:00', 'Ekonomi', '3504156789012345', 'FL0004');

ALTER TABLE Penumpang ADD Email varchar(255);

ALTER TABLE Bagasi MODIFY Jenis varchar(50);

ALTER TABLE Bandara_Penerbangan DROP CONSTRAINT FK_Bandara;

ALTER TABLE Bandara DROP PRIMARY KEY;

ALTER TABLE Bandara ADD PRIMARY KEY (ID, Kode_IATA);

ALTER TABLE Bandara_Penerbangan 
ADD CONSTRAINT FK_Bandara 
FOREIGN KEY (Bandara_ID) 
REFERENCES Bandara(ID) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

ALTER TABLE Penumpang DROP COLUMN Email;

UPDATE Penerbangan SET  Waktu_keberangkatan = '2024-12-15 11:00:00',  Waktu_sampai = '2024-12-15 13:30:00' WHERE ID = 'FL0001';

UPDATE Penumpang SET No_Telepon = '081223344556' WHERE NIK = '3302134567890123' AND Nama = 'Siti Aminah';

UPDATE Pesawat SET Status_Pesawat = 'Aktif' WHERE ID = 'PKGHI3';

ALTER TABLE Tiket DROP CONSTRAINT FK_Penumpang;

DELETE FROM Tiket WHERE Penumpang_NIK = '3504156789012345' AND Penerbangan_ID = 'FL0004';

ALTER TABLE Tiket ADD CONSTRAINT FK_Penumpang  FOREIGN KEY (Penumpang_NIK) REFERENCES Penumpang(NIK);

ALTER TABLE Penumpang DROP CONSTRAINT FK_Bagasi;

DELETE FROM Bagasi   WHERE ID = '2'   AND Berat = '15'   AND Ukuran = 'S'   AND Warna = 'Merah';

ALTER TABLE Penumpang ADD CONSTRAINT FK_Bagasi FOREIGN KEY (Bagasi_ID) REFERENCES Bagasi(ID) ON DELETE CASCADE ON UPDATE CASCADE;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Penerbangan WHERE Status_penerbangan = 'Ditunda';
