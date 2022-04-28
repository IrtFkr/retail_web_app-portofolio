-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2022 at 10:17 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retail_portofolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` varchar(50) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `id_kategori_barang` varchar(50) DEFAULT NULL,
  `harga` decimal(10,0) NOT NULL,
  `id_unit_standard` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` varchar(50) NOT NULL,
  `id_penjualan` varchar(50) DEFAULT NULL,
  `id_barang` varchar(50) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `id_unit` varchar(50) DEFAULT NULL,
  `total_harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_stok_masuk`
--

CREATE TABLE `detail_stok_masuk` (
  `id` varchar(50) NOT NULL,
  `id_stok_masuk` varchar(50) DEFAULT NULL,
  `id_barang` varchar(50) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `id_unit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` varchar(50) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `kode_karyawan` varchar(50) DEFAULT NULL,
  `no_telp` varchar(50) DEFAULT NULL,
  `jenis_kelamin` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` varchar(50) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL,
  `kode_kategori` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `konversi_unit`
--

CREATE TABLE `konversi_unit` (
  `id` varchar(50) NOT NULL,
  `id_barang` varchar(50) DEFAULT NULL,
  `id_unit_konversi` varchar(50) DEFAULT NULL,
  `jumlah_koversi` decimal(10,0) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` varchar(50) NOT NULL,
  `no_transaksi` varchar(50) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT NULL,
  `id_karyawan` varchar(50) DEFAULT NULL,
  `total_harga` decimal(10,0) NOT NULL,
  `jumlah_bayar` decimal(10,0) NOT NULL,
  `jumlah_kembali` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stok_masuk`
--

CREATE TABLE `stok_masuk` (
  `id` varchar(50) NOT NULL,
  `no_transaksi` varchar(50) DEFAULT NULL,
  `tanggal_masuk` datetime DEFAULT NULL,
  `id_karyawan` varchar(50) DEFAULT NULL,
  `id_supplier` varchar(50) DEFAULT NULL,
  `nama_kurir` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` varchar(50) NOT NULL,
  `nama_supplier` varchar(50) DEFAULT NULL,
  `kode_supplier` varchar(50) DEFAULT NULL,
  `no_telp` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` varchar(50) NOT NULL,
  `nama_unit` varchar(50) DEFAULT NULL,
  `kode_unit` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori_barang` (`id_kategori_barang`),
  ADD KEY `id_unit_standard` (`id_unit_standard`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penjualan` (`id_penjualan`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Indexes for table `detail_stok_masuk`
--
ALTER TABLE `detail_stok_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_stok_masuk` (`id_stok_masuk`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konversi_unit`
--
ALTER TABLE `konversi_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_unit_konversi` (`id_unit_konversi`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indexes for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori_barang`) REFERENCES `kategori_barang` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_unit_standard`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `detail_penjualan_ibfk_3` FOREIGN KEY (`id_unit`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `detail_stok_masuk`
--
ALTER TABLE `detail_stok_masuk`
  ADD CONSTRAINT `detail_stok_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `detail_stok_masuk_ibfk_2` FOREIGN KEY (`id_stok_masuk`) REFERENCES `stok_masuk` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `detail_stok_masuk_ibfk_3` FOREIGN KEY (`id_unit`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `konversi_unit`
--
ALTER TABLE `konversi_unit`
  ADD CONSTRAINT `konversi_unit_ibfk_1` FOREIGN KEY (`id_unit_konversi`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `konversi_unit_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD CONSTRAINT `stok_masuk_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `stok_masuk_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
