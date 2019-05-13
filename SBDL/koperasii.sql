-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 04:10 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `koperasii`
--

-- --------------------------------------------------------

--
-- Table structure for table `struktur_anggota`
--

CREATE TABLE IF NOT EXISTS `struktur_anggota` (
  `Kd_Pelanggan` varchar(5) NOT NULL,
  `Nm_Anggota` varchar(30) NOT NULL,
  `Almt_Anggota` varchar(100) NOT NULL,
  `Telp_Anggota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `struktur_anggota`
--

INSERT INTO `struktur_anggota` (`Kd_Pelanggan`, `Nm_Anggota`, `Almt_Anggota`, `Telp_Anggota`) VALUES
('001', 'Mia', 'Baturuyuk', '082262494228'),
('002', 'Aprilia', 'Mandapa', '082262494229'),
('003', 'Nur', 'Balida', '082262494210'),
('004', 'Hasanah', 'Gunungsari', '082262494210'),
('005', 'Purnama', 'Beber', '082262494211'),
('006', 'Melda', 'Randegan', '082262494212'),
('007', 'Nadya', 'Weragati', '082262494213'),
('008', 'Caca', 'Kasokandel', '082262494214'),
('009', 'Salsabila', 'Jatiwangi', '082262494215'),
('010', 'Dinda', 'Cibogor', '082262494216'),
('044', 'fgf', 'ghsdfh', '563457'),
('0988', 'Dea', 'kertajati', '9450924753'),
('dsaf', 'sadfSDF', 'DFDSF', '43623');

-- --------------------------------------------------------

--
-- Table structure for table `struktur_barang`
--

CREATE TABLE IF NOT EXISTS `struktur_barang` (
  `Kd_barang` varchar(5) NOT NULL,
  `Nm_barang` varchar(30) NOT NULL,
  `Satuan_barang` varchar(25) NOT NULL,
  `Hrg_Beli` int(9) NOT NULL,
  `Hrg_Jual` int(9) NOT NULL,
  `Jml_Barang` int(3) NOT NULL,
  `Kd_Jenis` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `struktur_barang`
--

INSERT INTO `struktur_barang` (`Kd_barang`, `Nm_barang`, `Satuan_barang`, `Hrg_Beli`, `Hrg_Jual`, `Jml_Barang`, `Kd_Jenis`) VALUES
('', '', '', 0, 0, 0, ''),
('1', '1', '1', 1, 1, 1, '1'),
('2', '3', '55', 1, 67, 0, '156'),
('3', '3', '3', 3, 3, 3, '3');

-- --------------------------------------------------------

--
-- Table structure for table `struktur_barang_masuk`
--

CREATE TABLE IF NOT EXISTS `struktur_barang_masuk` (
  `Kd_Masuk` varchar(5) NOT NULL,
  `Tgl_Masuk` date NOT NULL,
  `Kd_Barang` varchar(25) NOT NULL,
  `Hrg_Beli` int(9) NOT NULL,
  `Jml_Masuk` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `struktur_barang_masuk`
--

INSERT INTO `struktur_barang_masuk` (`Kd_Masuk`, `Tgl_Masuk`, `Kd_Barang`, `Hrg_Beli`, `Jml_Masuk`) VALUES
('', '0000-00-00', '', 0, 0),
('1', '2019-05-11', '1', 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `struktur_detail_transaksi`
--

CREATE TABLE IF NOT EXISTS `struktur_detail_transaksi` (
  `Kd_jual` varchar(8) NOT NULL,
  `Kd_barang` varchar(5) NOT NULL,
  `Hrg_jual` int(9) NOT NULL,
  `Jml_jual` int(3) NOT NULL,
  `Sub_total_jual` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `struktur_kd_jenis`
--

CREATE TABLE IF NOT EXISTS `struktur_kd_jenis` (
  `Kd_jenis` varchar(5) NOT NULL,
  `Nm_Jenis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `struktur_transaksi_penjualan`
--

CREATE TABLE IF NOT EXISTS `struktur_transaksi_penjualan` (
  `Kd_jual` varchar(8) NOT NULL,
  `Kd_pelanggan` varchar(5) NOT NULL,
  `Tgl_jual` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `struktur_anggota`
--
ALTER TABLE `struktur_anggota`
 ADD PRIMARY KEY (`Kd_Pelanggan`);

--
-- Indexes for table `struktur_barang`
--
ALTER TABLE `struktur_barang`
 ADD PRIMARY KEY (`Kd_barang`), ADD KEY `Kd_Jenis` (`Kd_Jenis`);

--
-- Indexes for table `struktur_barang_masuk`
--
ALTER TABLE `struktur_barang_masuk`
 ADD PRIMARY KEY (`Kd_Barang`);

--
-- Indexes for table `struktur_detail_transaksi`
--
ALTER TABLE `struktur_detail_transaksi`
 ADD PRIMARY KEY (`Kd_jual`,`Kd_barang`), ADD KEY `Kd_barang` (`Kd_barang`);

--
-- Indexes for table `struktur_kd_jenis`
--
ALTER TABLE `struktur_kd_jenis`
 ADD PRIMARY KEY (`Kd_jenis`);

--
-- Indexes for table `struktur_transaksi_penjualan`
--
ALTER TABLE `struktur_transaksi_penjualan`
 ADD PRIMARY KEY (`Kd_jual`), ADD KEY `Kd_pelanggan` (`Kd_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `struktur_transaksi_penjualan`
--
ALTER TABLE `struktur_transaksi_penjualan`
ADD CONSTRAINT `struktur_transaksi_penjualan_ibfk_1` FOREIGN KEY (`Kd_jual`) REFERENCES `struktur_detail_transaksi` (`Kd_jual`),
ADD CONSTRAINT `struktur_transaksi_penjualan_ibfk_2` FOREIGN KEY (`Kd_pelanggan`) REFERENCES `struktur_anggota` (`Kd_Pelanggan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
