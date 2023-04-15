-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 06:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_identifikasi_kulit`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` varchar(7) NOT NULL,
  `id_pengguna` varchar(5) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telp_admin` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_aturan`
--

CREATE TABLE `tb_aturan` (
  `kd_aturan` varchar(3) NOT NULL,
  `kd_jeniskulit` varchar(3) NOT NULL,
  `kd_gejala` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_buatjanji`
--

CREATE TABLE `tb_buatjanji` (
  `id_janji` varchar(10) NOT NULL,
  `id_kinik` varchar(5) NOT NULL,
  `id_dokter` varchar(7) NOT NULL,
  `id_pasient` varchar(7) NOT NULL,
  `sesi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_diagnosa`
--

CREATE TABLE `tb_diagnosa` (
  `kd_diagnosa` varchar(3) NOT NULL,
  `kd_aturan` varchar(3) NOT NULL,
  `kd_jeniskulit` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_dokter`
--

CREATE TABLE `tb_dokter` (
  `id_dokter` varchar(7) NOT NULL,
  `id_pengguna` varchar(5) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `lama_pengalaman` int(2) NOT NULL,
  `umur_dokter` int(2) NOT NULL,
  `alumni` varchar(100) NOT NULL,
  `tempat_praktik` varchar(100) NOT NULL,
  `no_STR` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gejala`
--

CREATE TABLE `tb_gejala` (
  `kd_gejala` varchar(3) NOT NULL,
  `nama_gejala` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jeniskulit`
--

CREATE TABLE `tb_jeniskulit` (
  `kd_jeniskulit` varchar(3) NOT NULL,
  `jenis_kulit` varchar(50) NOT NULL,
  `solusi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jwbdokter`
--

CREATE TABLE `tb_jwbdokter` (
  `kd_jawab` varchar(12) NOT NULL,
  `kd_pertanyaaan` varchar(11) NOT NULL,
  `id_dokter` varchar(7) NOT NULL,
  `jawab` text NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_klinik`
--

CREATE TABLE `tb_klinik` (
  `id_klinik` varchar(5) NOT NULL,
  `id_dokter` varchar(7) NOT NULL,
  `tempat_klinik` varchar(100) NOT NULL,
  `sesi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `biaya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_konsultasi`
--

CREATE TABLE `tb_konsultasi` (
  `kd_pertanyaan` varchar(11) NOT NULL,
  `id_pasient` varchar(7) NOT NULL,
  `nama_pasient` varchar(100) NOT NULL,
  `pertanyaan` text NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pasient`
--

CREATE TABLE `tb_pasient` (
  `id_pasient` varchar(7) NOT NULL,
  `id_pengguna` varchar(5) NOT NULL,
  `nama_pasient` varchar(100) NOT NULL,
  `telp_pasient` varchar(12) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(11) NOT NULL,
  `jabatan` enum('Admin','Dokter','Pasient','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_resepdokter`
--

CREATE TABLE `tb_resepdokter` (
  `kd_diagsosa` varchar(3) NOT NULL,
  `id_pasient` varchar(7) NOT NULL,
  `resep_dokter` text NOT NULL,
  `id_dokter` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `id_janji` varchar(10) NOT NULL,
  `id-pasient` varchar(7) NOT NULL,
  `biaya` int(11) NOT NULL,
  `rekening` varchar(16) NOT NULL,
  `bank` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tb_aturan`
--
ALTER TABLE `tb_aturan`
  ADD KEY `kd_aturan` (`kd_aturan`,`kd_jeniskulit`,`kd_gejala`),
  ADD KEY `kd_jeniskulit` (`kd_jeniskulit`),
  ADD KEY `kd_gejala` (`kd_gejala`);

--
-- Indexes for table `tb_buatjanji`
--
ALTER TABLE `tb_buatjanji`
  ADD PRIMARY KEY (`id_janji`),
  ADD KEY `id_kinik` (`id_kinik`),
  ADD KEY `id_dokter` (`id_dokter`,`id_pasient`),
  ADD KEY `id_kinik_2` (`id_kinik`,`id_dokter`,`id_pasient`),
  ADD KEY `id_pasient` (`id_pasient`);

--
-- Indexes for table `tb_diagnosa`
--
ALTER TABLE `tb_diagnosa`
  ADD PRIMARY KEY (`kd_diagnosa`),
  ADD KEY `kd_aturan` (`kd_aturan`,`kd_jeniskulit`),
  ADD KEY `kd_jeniskulit` (`kd_jeniskulit`);

--
-- Indexes for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tb_gejala`
--
ALTER TABLE `tb_gejala`
  ADD PRIMARY KEY (`kd_gejala`);

--
-- Indexes for table `tb_jeniskulit`
--
ALTER TABLE `tb_jeniskulit`
  ADD PRIMARY KEY (`kd_jeniskulit`);

--
-- Indexes for table `tb_jwbdokter`
--
ALTER TABLE `tb_jwbdokter`
  ADD PRIMARY KEY (`kd_jawab`),
  ADD KEY `kd_pertanyaaan` (`kd_pertanyaaan`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `tb_klinik`
--
ALTER TABLE `tb_klinik`
  ADD PRIMARY KEY (`id_klinik`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  ADD PRIMARY KEY (`kd_pertanyaan`),
  ADD KEY `id_pasient` (`id_pasient`);

--
-- Indexes for table `tb_pasient`
--
ALTER TABLE `tb_pasient`
  ADD PRIMARY KEY (`id_pasient`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_resepdokter`
--
ALTER TABLE `tb_resepdokter`
  ADD KEY `id_diaksosa` (`kd_diagsosa`),
  ADD KEY `id_pasient` (`id_pasient`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_janji` (`id_janji`),
  ADD KEY `id-pasient` (`id-pasient`),
  ADD KEY `id_janji_2` (`id_janji`),
  ADD KEY `id-pasient_2` (`id-pasient`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_aturan`
--
ALTER TABLE `tb_aturan`
  ADD CONSTRAINT `tb_aturan_ibfk_1` FOREIGN KEY (`kd_jeniskulit`) REFERENCES `tb_jeniskulit` (`kd_jeniskulit`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_aturan_ibfk_2` FOREIGN KEY (`kd_gejala`) REFERENCES `tb_gejala` (`kd_gejala`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_buatjanji`
--
ALTER TABLE `tb_buatjanji`
  ADD CONSTRAINT `tb_buatjanji_ibfk_1` FOREIGN KEY (`id_kinik`) REFERENCES `tb_klinik` (`id_klinik`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_buatjanji_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `tb_dokter` (`id_dokter`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_buatjanji_ibfk_3` FOREIGN KEY (`id_pasient`) REFERENCES `tb_pasient` (`id_pasient`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_diagnosa`
--
ALTER TABLE `tb_diagnosa`
  ADD CONSTRAINT `tb_diagnosa_ibfk_1` FOREIGN KEY (`kd_aturan`) REFERENCES `tb_aturan` (`kd_aturan`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_diagnosa_ibfk_2` FOREIGN KEY (`kd_jeniskulit`) REFERENCES `tb_jeniskulit` (`kd_jeniskulit`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD CONSTRAINT `tb_dokter_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_jwbdokter`
--
ALTER TABLE `tb_jwbdokter`
  ADD CONSTRAINT `tb_jwbdokter_ibfk_1` FOREIGN KEY (`kd_pertanyaaan`) REFERENCES `tb_konsultasi` (`kd_pertanyaan`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_jwbdokter_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `tb_dokter` (`id_dokter`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_klinik`
--
ALTER TABLE `tb_klinik`
  ADD CONSTRAINT `tb_klinik_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `tb_dokter` (`id_dokter`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  ADD CONSTRAINT `tb_konsultasi_ibfk_1` FOREIGN KEY (`id_pasient`) REFERENCES `tb_pasient` (`id_pasient`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_pasient`
--
ALTER TABLE `tb_pasient`
  ADD CONSTRAINT `tb_pasient_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`);

--
-- Constraints for table `tb_resepdokter`
--
ALTER TABLE `tb_resepdokter`
  ADD CONSTRAINT `tb_resepdokter_ibfk_1` FOREIGN KEY (`kd_diagsosa`) REFERENCES `tb_diagnosa` (`kd_diagnosa`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_resepdokter_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `tb_dokter` (`id_dokter`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_resepdokter_ibfk_3` FOREIGN KEY (`id_pasient`) REFERENCES `tb_pasient` (`id_pasient`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_resepdokter_ibfk_4` FOREIGN KEY (`kd_pertanyaan`) REFERENCES `tb_konsultasi` (`kd_pertanyaan`) ON UPDATE NO ACTION;

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id-pasient`) REFERENCES `tb_pasient` (`id_pasient`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_janji`) REFERENCES `tb_buatjanji` (`id_janji`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
