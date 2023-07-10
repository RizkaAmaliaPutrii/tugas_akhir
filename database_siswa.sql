-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2023 pada 11.05
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_akhir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_hubungan`
--

CREATE TABLE `tabel_hubungan` (
  `id_hub` int(10) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `id_ortu` int(10) NOT NULL,
  `status_hubungan` enum('Kandung','Tiri','Wali') NOT NULL,
  `keterangan` enum('Ayah','Ibu','Paman','Tante','Wali') NOT NULL,
  `status_ortu` enum('Hidup','Alm') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tabel_hubungan`
--

INSERT INTO `tabel_hubungan` (`id_hub`, `id_siswa`, `id_ortu`, `status_hubungan`, `keterangan`, `status_ortu`) VALUES
(3, 4, 1, 'Tiri', 'Ayah', 'Hidup'),
(4, 6, 4, 'Kandung', 'Ibu', 'Hidup');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_kelas`
--

CREATE TABLE `tabel_kelas` (
  `id_kelas` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jurusan` enum('IPA','IPS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tabel_kelas`
--

INSERT INTO `tabel_kelas` (`id_kelas`, `nama`, `jurusan`) VALUES
(1, '3 Reg Pagi Bjm', 'IPA'),
(3, '2 Reg Pagi BJB', 'IPS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_ortu`
--

CREATE TABLE `tabel_ortu` (
  `id_ortu` int(10) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `pendidikan` varchar(20) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(15) NOT NULL,
  `status` enum('Hidup','Alm') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tabel_ortu`
--

INSERT INTO `tabel_ortu` (`id_ortu`, `nik`, `nama`, `pendidikan`, `pekerjaan`, `telp`, `alamat`, `jenis_kelamin`, `agama`, `status`) VALUES
(1, '12345678', 'Jamal', 'S2', 'Pensiun', '08987654321', 'Jl Kelayan', 'L', 'Islam', 'Hidup'),
(3, '12323', 'Karina', 'SD', 'Ibu Rumah Tangga', '2132', 'Banjarbaru', 'P', 'Islam', 'Alm'),
(4, '12345678', 'Ningsih', 'S1', 'Dokter', '08123456783', 'Tanjung', 'P', 'islam', 'Hidup');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_poin`
--

CREATE TABLE `tabel_poin` (
  `id_poin` int(10) NOT NULL,
  `nama_poin` varchar(15) NOT NULL,
  `bobot` varchar(10) NOT NULL,
  `jenis` enum('Prestasi','Pelanggaran') NOT NULL,
  `status` enum('True','False') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tabel_poin`
--

INSERT INTO `tabel_poin` (`id_poin`, `nama_poin`, `bobot`, `jenis`, `status`) VALUES
(1, 'Juara Kelas', '10', 'Prestasi', 'True'),
(2, 'Juara Dunia', '500', 'Prestasi', 'True'),
(3, 'Tauran', '50', 'Pelanggaran', 'True');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_semester`
--

CREATE TABLE `tabel_semester` (
  `id_semester` int(10) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `id_poin` int(10) NOT NULL,
  `id_wali` int(10) NOT NULL,
  `id_ortu` int(10) NOT NULL,
  `id_kelas` int(10) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `semester` enum('Ganjil','Genap') NOT NULL,
  `status` enum('Lulus','Tidak Lulus') NOT NULL,
  `tingkat_kelas` enum('10','11','12') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tabel_semester`
--

INSERT INTO `tabel_semester` (`id_semester`, `id_siswa`, `id_poin`, `id_wali`, `id_ortu`, `id_kelas`, `tanggal`, `semester`, `status`, `tingkat_kelas`) VALUES
(2, 4, 2, 1, 1, 1, '28 juni 2023', 'Genap', 'Lulus', '12'),
(3, 6, 2, 5, 4, 1, '29 Juni 2023', 'Genap', 'Lulus', '12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_siswa`
--

CREATE TABLE `tabel_siswa` (
  `id_siswa` int(10) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nik` varchar(13) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telpon` varchar(13) NOT NULL,
  `status` enum('aktif','tidak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tabel_siswa`
--

INSERT INTO `tabel_siswa` (`id_siswa`, `nis`, `nisn`, `nama`, `nik`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `alamat`, `telpon`, `status`) VALUES
(4, '121', '2110010538', 'Rizka', '2312313', 'Banjarmasin', '17 Juni 2003', 'P', 'Jl Adhyaksa', '082151794985', 'aktif'),
(5, '323', '2110010299', 'Reyhan', '321312', 'Banajr', '23 Maret2000', 'L', 'Jl HKSN', '083152235561', 'aktif'),
(6, '2743', '2110010436', 'Gisya', '019283234', 'Banjarmasin', '27 Maret 2004', 'P', 'Jl Sungai Jingah', '081234569876', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_user`
--

CREATE TABLE `tabel_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` enum('User','Admin') NOT NULL,
  `status` enum('Aktif','Tidak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tabel_user`
--

INSERT INTO `tabel_user` (`id_user`, `username`, `password`, `level`, `status`) VALUES
(1, 'user', 'user', 'User', 'Aktif'),
(2, 'rizka', 'admin', 'User', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_wali_kelas`
--

CREATE TABLE `tabel_wali_kelas` (
  `id_wali` int(10) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `pendidikan` varchar(30) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `matpel` varchar(15) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `status` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tabel_wali_kelas`
--

INSERT INTO `tabel_wali_kelas` (`id_wali`, `nik`, `nama`, `jenis_kelamin`, `pendidikan`, `telp`, `matpel`, `alamat`, `status`) VALUES
(1, '01928374', 'supri', 'L', 's1', '089786756', 'agama', 'jl sultan adam', 'aktif'),
(2, '312313', 'yadu', 'L', 's2', '098765432', 'sejarah indonei', 'jl handil bakti', 'aktif'),
(4, '3213', 'dasd', 'P', 'asda', '3123', 'wdsa', 'dwdqd', 'aktif'),
(5, '1234321', 'iShowSpeed', 'L', 's3', '08536541254', 'TIK', 'Jl Ohio', 'aktif'),
(6, '213', 'Suripto', 'L', 'SMA', '098765642', 'BK', 'jl A yani', 'Aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel_hubungan`
--
ALTER TABLE `tabel_hubungan`
  ADD PRIMARY KEY (`id_hub`),
  ADD UNIQUE KEY `id_siswa_2` (`id_siswa`,`id_ortu`),
  ADD UNIQUE KEY `id_siswa_3` (`id_siswa`,`id_ortu`),
  ADD UNIQUE KEY `id_ortu` (`id_ortu`),
  ADD KEY `id_siswa` (`id_siswa`,`id_ortu`);

--
-- Indeks untuk tabel `tabel_kelas`
--
ALTER TABLE `tabel_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tabel_ortu`
--
ALTER TABLE `tabel_ortu`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indeks untuk tabel `tabel_poin`
--
ALTER TABLE `tabel_poin`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indeks untuk tabel `tabel_semester`
--
ALTER TABLE `tabel_semester`
  ADD PRIMARY KEY (`id_semester`),
  ADD UNIQUE KEY `id_siswa_2` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD UNIQUE KEY `id_siswa_3` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD UNIQUE KEY `id_wali` (`id_wali`),
  ADD KEY `id_siswa` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD KEY `id_poin` (`id_poin`),
  ADD KEY `id_ortu` (`id_ortu`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `tabel_siswa`
--
ALTER TABLE `tabel_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `tabel_user`
--
ALTER TABLE `tabel_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `tabel_wali_kelas`
--
ALTER TABLE `tabel_wali_kelas`
  ADD PRIMARY KEY (`id_wali`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tabel_hubungan`
--
ALTER TABLE `tabel_hubungan`
  MODIFY `id_hub` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tabel_kelas`
--
ALTER TABLE `tabel_kelas`
  MODIFY `id_kelas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tabel_ortu`
--
ALTER TABLE `tabel_ortu`
  MODIFY `id_ortu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tabel_poin`
--
ALTER TABLE `tabel_poin`
  MODIFY `id_poin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tabel_semester`
--
ALTER TABLE `tabel_semester`
  MODIFY `id_semester` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tabel_siswa`
--
ALTER TABLE `tabel_siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tabel_user`
--
ALTER TABLE `tabel_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tabel_wali_kelas`
--
ALTER TABLE `tabel_wali_kelas`
  MODIFY `id_wali` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tabel_hubungan`
--
ALTER TABLE `tabel_hubungan`
  ADD CONSTRAINT `tabel_hubungan_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tabel_siswa` (`id_siswa`),
  ADD CONSTRAINT `tabel_hubungan_ibfk_2` FOREIGN KEY (`id_ortu`) REFERENCES `tabel_ortu` (`id_ortu`);

--
-- Ketidakleluasaan untuk tabel `tabel_semester`
--
ALTER TABLE `tabel_semester`
  ADD CONSTRAINT `tabel_semester_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tabel_siswa` (`id_siswa`),
  ADD CONSTRAINT `tabel_semester_ibfk_2` FOREIGN KEY (`id_poin`) REFERENCES `tabel_poin` (`id_poin`),
  ADD CONSTRAINT `tabel_semester_ibfk_3` FOREIGN KEY (`id_wali`) REFERENCES `tabel_wali_kelas` (`id_wali`),
  ADD CONSTRAINT `tabel_semester_ibfk_4` FOREIGN KEY (`id_ortu`) REFERENCES `tabel_ortu` (`id_ortu`),
  ADD CONSTRAINT `tabel_semester_ibfk_5` FOREIGN KEY (`id_kelas`) REFERENCES `tabel_kelas` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
