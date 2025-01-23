Modul ini berfungsi untuk menampilkan nama-nama perusahaan dan nama-nama murid yang melakukan PKL.

Tabel yang dibutuhkan adalah tabel yang kompatibel dengan PostgreSQL:

Tabel: pkl_perusahaan
angkatan: int
id: int
nama: varchar
alamat: varchar
primary key adalah (angkatan + id)
index: nama
index: alamat

Tabel: pkl_murid
angkatan: int
id: int
nama: varchar
kelas: varchar
id_perusahaan: int
primary key adalah (angkatan + id)
index: nama
index: kelas

id_perusahaan referensi ke id pada tabel pkl_perusahaan

