-- Create the pkl_perusahaan table
CREATE TABLE pkl_perusahaan (
    angkatan INTEGER NOT NULL,
    id INTEGER NOT NULL,
    nama VARCHAR(255) NOT NULL,
    alamat VARCHAR(255),
    PRIMARY KEY (angkatan, id)
);

-- Create indexes for pkl_perusahaan
CREATE INDEX idx_perusahaan_nama ON pkl_perusahaan(nama);
CREATE INDEX idx_perusahaan_alamat ON pkl_perusahaan(alamat);

-- Create the pkl_murid table
CREATE TABLE pkl_murid (
    angkatan INTEGER NOT NULL,
    id INTEGER NOT NULL,
    nama VARCHAR(255) NOT NULL,
    kelas VARCHAR(50),
    id_perusahaan INTEGER NOT NULL,
    PRIMARY KEY (angkatan, id)
);

-- Create indexes for pkl_murid
CREATE INDEX idx_murid_nama ON pkl_murid(nama);
CREATE INDEX idx_murid_kelas ON pkl_murid(kelas);

-- Insert data into pkl_perusahaan
INSERT INTO pkl_perusahaan (angkatan, id, nama) VALUES
(1, 1, 'Bina Sarana Global Institute'),
(1, 2, 'Dinas Komunikasi dan Informatika Kota Tangerang (PPID)'),
(1, 3, 'Kantor Kelurahan Poris Plawad'),
(1, 4, 'KBW Studio'),
(1, 5, 'Kelurahan Poris Plawad Indah'),
(1, 6, 'Kementerian Hukum dan HAM Ri Direktorat Jenderal HAKI'),
(1, 7, 'Levelon Digital'),
(1, 8, 'Moshi Motion'),
(1, 9, 'Perum LPPNPI AirNav Indonesia'),
(1, 10, 'Print Story'),
(1, 11, 'PT Angkasa Pura Indonesia'),
(1, 12, 'PT Prima Harum Dinamis'),
(1, 13, 'PT Sariling Aneka Energi'),
(1, 14, 'PT Tiga Pilar Utama Karya Sentosa'),
(1, 15, 'PT Triwijaya Abadi Perkasa'),
(1, 16, 'PT. Agrobisnis Banten Mandiri (perseroda) Plaza Banten'),
(1, 17, 'PT. Idea Imaji Persada'),
(1, 18, 'PT. Prima Cahaya Sejati'),
(1, 19, 'PT. Tata Tekno Indonesia (Property Technologies)'),
(1, 20, 'Studio 31 hairdesign');

-- Insert data into pkl_murid
INSERT INTO pkl_murid (angkatan, id, nama, kelas, id_perusahaan) VALUES
(1, 1, 'Abdan Shafiq Athalla Yusri', 'XII DKV 1', 16),
(1, 2, 'Aditya Putra Nugraha', 'XII DKV 1', 13),
(1, 3, 'Aisyah Alimah Lesmono', 'XII DKV 1', 13),
(1, 4, 'Aldini Kurniawan', 'XII DKV 1', 8),
(1, 5, 'Andre Firmansah', 'XII DKV 1', 8),
(1, 6, 'Azka Aimee Namiah', 'XII DKV 1', 1),
(1, 7, 'Bintang Basmara Abdullah', 'XII DKV 1', 14),
(1, 8, 'Caysa Medliona', 'XII DKV 1', 13),
(1, 9, 'Emilio Sasongko', 'XII DKV 1', 16),
(1, 10, 'Eryshia Then', 'XII DKV 1', 13),
(1, 11, 'Faiz Hakim Novianto', 'XII DKV 1', 8),
(1, 12, 'Falih Ghani Akhmad', 'XII DKV 1', 18),
(1, 13, 'Felicia Aisyah Serenity', 'XII DKV 1', 14),
(1, 14, 'Habiburrahman Sidik', 'XII DKV 1', 9),
(1, 15, 'Imam Fabio At-Tarmizi', 'XII DKV 1', 9),
(1, 16, 'Meilani Wulandari', 'XII DKV 1', 13),
(1, 17, 'Muhamad Azhim Ildana', 'XII DKV 1', 9),
(1, 18, 'Muhamad Julkahviludin', 'XII DKV 1', 6),
(1, 19, 'Muhammad Akmal Firaaski', 'XII DKV 1', 9),
(1, 20, 'Muhammad Al Ridho Ramadhani', 'XII DKV 1', 16),
(1, 21, 'Muhammad Helmi Athallah', 'XII DKV 1', 9),
(1, 22, 'Muhammad Hilman Al-Ghazy', 'XII DKV 1', 13),
(1, 23, 'Muhammad Irfansyah', 'XII DKV 1', 16),
(1, 24, 'Muhammad Shiddiq Al Khawarizmi', 'XII DKV 1', 9),
(1, 25, 'Nabila Zahran Anabela', 'XII DKV 1', 14),
(1, 26, 'Nasira Siddiqa Nurrahman', 'XII DKV 1', 11),
(1, 27, 'Nazila Diah Arfan Putri', 'XII DKV 1', 4),
(1, 28, 'Nidya Putri Rinton', 'XII DKV 1', 11),
(1, 29, 'Rafli Anadi Wicaksono', 'XII DKV 1', 16),
(1, 30, 'Riyana Larasati', 'XII DKV 1', 11),
(1, 31, 'Safira Natasya Ramadhany', 'XII DKV 1', 13),
(1, 32, 'Salwa Naurah El Imani', 'XII DKV 1', 4),
(1, 33, 'Syafira Azhara', 'XII DKV 1', 8),
(1, 34, 'Tiara', 'XII DKV 1', 8),
(1, 35, 'Violet Azra Zulfaqa', 'XII DKV 1', 9),
(1, 36, 'Achmad Dhanie Effendy', 'XII DKV 2', 5),
(1, 37, 'Ahmad Nur Sidiq', 'XII DKV 2', 12),
(1, 38, 'Al Firdaus Kornianda', 'XII DKV 2', 19),
(1, 39, 'Alvinly Hadinata', 'XII DKV 2', 13),
(1, 40, 'Aprilia Sechan', 'XII DKV 2', 6),
(1, 41, 'Azzahrra Dhabitah Junaria', 'XII DKV 2', 3),
(1, 42, 'Callysta Putri Isella', 'XII DKV 2', 2),
(1, 43, 'Danar Eka Maheswara', 'XII DKV 2', 13),
(1, 44, 'Dwi Andika', 'XII DKV 2', 13),
(1, 45, 'Dzikra Haifa Aulia', 'XII DKV 2', 2),
(1, 46, 'Erasmus Brahim Zaibat', 'XII DKV 2', 13),
(1, 47, 'Fadilah Arya Wisesa', 'XII DKV 2', 14),
(1, 48, 'Faiza Shivarani', 'XII DKV 2', 2),
(1, 49, 'Farel Ahmad Kurniawan', 'XII DKV 2', 13),
(1, 50, 'Frizki Ardiansyah', 'XII DKV 2', 10),
(1, 51, 'Hanna Majesta', 'XII DKV 2', 3),
(1, 52, 'Jonathan Toba Simangunsong', 'XII DKV 2', 13),
(1, 53, 'Mahessa Bagaskara', 'XII DKV 2', 14),
(1, 54, 'Mohamad Arief Fangga', 'XII DKV 2', 13),
(1, 55, 'Muhamad Fathir Alfath', 'XII DKV 2', 13),
(1, 56, 'Muhammad Al Fattan Audratama', 'XII DKV 2', 13),
(1, 57, 'Muhammad Andra Atha Razan', 'XII DKV 2', 17),
(1, 58, 'Muhammad Ellite Rapi Nassruloh', 'XII DKV 2', 15),
(1, 59, 'Muhammad Ridwan Abdul Rahman', 'XII DKV 2', 20),
(1, 60, 'Muhammad Uthman Dzaky', 'XII DKV 2', 14),
(1, 61, 'Nashwa Mayrani Putri Kurniawan', 'XII DKV 2', 2),
(1, 62, 'Natava Kudira Zidane', 'XII DKV 2', 6),
(1, 63, 'Nilam Setiana Gultom', 'XII DKV 2', 5),
(1, 64, 'Panji Fitra Permana', 'XII DKV 2', 13),
(1, 65, 'Reza Ahmad Al Ghifari', 'XII DKV 2', 13),
(1, 66, 'Salsa Nabila', 'XII DKV 2', 6),
(1, 67, 'Shahnaz Nawra Raggaza Zaelrus', 'XII DKV 2', 12),
(1, 68, 'Syawaludin Purnama', 'XII DKV 2', 7),
(1, 69, 'Viola Wilda Pardede', 'XII DKV 2', 2);
