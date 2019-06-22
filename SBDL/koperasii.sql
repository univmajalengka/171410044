-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2019 at 10:27 AM
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
-- Table structure for table `stp`
--

CREATE TABLE IF NOT EXISTS `stp` (
  `Kd_jual` varchar(8) NOT NULL,
  `Kd_pelanggan` varchar(5) NOT NULL,
  `Tgl_jual` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stp`
--

INSERT INTO `stp` (`Kd_jual`, `Kd_pelanggan`, `Tgl_jual`) VALUES
('jual1', 'Plg1', '2019-05-01'),
('jual10', 'plg10', '2019-06-06'),
('jual2', 'plg2', '2019-05-01'),
('jual3', 'plg3', '2019-05-01'),
('jual4', 'plg4', '2019-05-13'),
('jual5', 'plg5', '2019-06-08'),
('jual6', 'plg6', '2019-06-13'),
('jual7', 'plg7', '2019-06-05'),
('jual8', 'plg8', '2019-05-17'),
('jual9', 'plg9', '2019-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `strukturkodejenis`
--

CREATE TABLE IF NOT EXISTS `strukturkodejenis` (
  `Kd_jenis` varchar(5) NOT NULL,
  `Nm_Jenis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `strukturkodejenis`
--

INSERT INTO `strukturkodejenis` (`Kd_jenis`, `Nm_Jenis`) VALUES
('brg01', 'Mouse'),
('brg02', 'Handphone'),
('brg03', 'Laptop'),
('brg04', 'Kipas'),
('brg05', 'Setrika'),
('brg06', 'Tas'),
('brg07', 'Tempat Pencil'),
('brg08', 'Beter'),
('brg09', 'Chargeran Laptop'),
('brg10', 'Keyboard');

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
('plg1', 'Mia', 'Baturuyuk', '082262494228'),
('plg10', 'Salsabila', 'Jatiwangi', '082262494215'),
('plg2', 'Aprilia', 'Mandapa', '082262494229'),
('plg3', 'Nur', 'Balida', '082262494210'),
('plg4', 'Hasanah', 'Gunungsari', '082262494210'),
('plg5', 'Purnama', 'Beber', '082262494211'),
('plg6', 'Melda', 'Randegan', '082262494212'),
('plg7', 'Nadya', 'Weragati', '082262494213'),
('plg8', 'Dinda', 'Cibogor', '082262494216'),
('plg9', 'Caca', 'Kasokandel', '082262494214');

-- --------------------------------------------------------

--
-- Table structure for table `struktur_barang`
--

CREATE TABLE IF NOT EXISTS `struktur_barang` (
  `Kd_barang` varchar(30) NOT NULL,
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
('BJDAI', 'Beter', '1 pcs', 800, 1000, 30, 'brg08'),
('BJSBCS', 'Mouse', '1 pcs', 50000, 70000, 10, 'brg01'),
('FDGLKJES', 'Laptop', '1 box', 5000000, 6000000, 5, 'brg03'),
('GUSKAJDG', 'Handphone', '1 box', 1000000, 1200000, 5, 'brg02'),
('JBDSHE', 'Keyboard', '1 pcs', 50000, 60000, 10, 'brg10'),
('KJBFHV7', 'Tas', '1 Tas', 80000, 90000, 5, 'brg06'),
('KNDFSVF', 'Setrika', '1 Setrika', 100000, 1200000, 5, 'brg05'),
('NDFNOI', 'Tempat Pencil', '1 pcs', 10000, 6000, 10, 'brg07'),
('NIKOFV', 'Chargeran Laptop', '1 box', 300000, 400000, 10, 'brg09'),
('NVDKS', 'Kipas', '1 kipas', 100000, 120000, 7, 'brg04');

-- --------------------------------------------------------

--
-- Table structure for table `struktur_barang_masuk`
--

CREATE TABLE IF NOT EXISTS `struktur_barang_masuk` (
  `Kd_Masuk` varchar(5) NOT NULL,
  `Tgl_Masuk` date NOT NULL,
  `Kd_Barang` varchar(30) NOT NULL,
  `Hrg_Beli` int(9) NOT NULL,
  `Jml_Masuk` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `struktur_barang_masuk`
--

INSERT INTO `struktur_barang_masuk` (`Kd_Masuk`, `Tgl_Masuk`, `Kd_Barang`, `Hrg_Beli`, `Jml_Masuk`) VALUES
('msk8', '2019-04-12', 'BJDAI', 800, 30),
('msk1', '2019-05-01', 'BJSBCS', 50000, 10),
('msk03', '2019-05-02', 'FDGLKJES', 5000000, 5),
('msk02', '2019-02-15', 'GUSKAJDG', 1000000, 5),
('msk10', '2019-05-01', 'JBDSHE', 50000, 10),
('msk06', '2019-05-11', 'KJBFHV7', 80000, 10),
('msk05', '2019-05-01', 'KNDFSVF', 100000, 10),
('msk07', '2019-05-13', 'NDFNOI', 6000, 10),
('msk09', '2019-05-02', 'NIKOFV', 300000, 10),
('msk04', '2019-04-30', 'NVDKS', 100000, 7);

-- --------------------------------------------------------

--
-- Table structure for table `struktur_detail_transaksi`
--

CREATE TABLE IF NOT EXISTS `struktur_detail_transaksi` (
  `Kd_jual` varchar(8) NOT NULL,
  `Kd_barang` varchar(30) NOT NULL,
  `Hrg_jual` int(9) NOT NULL,
  `Jml_jual` int(3) NOT NULL,
  `Sub_total_jual` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `struktur_detail_transaksi`
--

INSERT INTO `struktur_detail_transaksi` (`Kd_jual`, `Kd_barang`, `Hrg_jual`, `Jml_jual`, `Sub_total_jual`) VALUES
('jual1', 'BJDAI', 70000, 5, 5),
('jual10', 'BJSBCS', 60000, 5, 5),
('jual2', 'FDGLKJES', 1000000, 2, 3),
('jual3', 'GUSKAJDG', 6000000, 3, 2),
('jual4', 'JBDSHE', 120000, 4, 3),
('jual5', 'KJBFHV7', 120000, 5, 5),
('jual6', 'KNDFSVF', 90000, 5, 5),
('jual7', 'NDFNOI', 10000, 5, 5),
('jual8', 'NIKOFV', 1000, 20, 10),
('jual9', 'NVDKS', 4000000, 5, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_barang`
--
CREATE TABLE IF NOT EXISTS `view_barang` (
`Kd_barang` varchar(30)
,`Nm_barang` varchar(30)
,`Satuan_barang` varchar(25)
,`Jml_Barang` int(3)
,`Tgl_Masuk` date
,`Jml_Masuk` int(3)
,`Nm_Jenis` varchar(25)
);
-- --------------------------------------------------------

--
-- Structure for view `view_barang`
--
DROP TABLE IF EXISTS `view_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barang` AS select `a`.`Kd_barang` AS `Kd_barang`,`a`.`Nm_barang` AS `Nm_barang`,`a`.`Satuan_barang` AS `Satuan_barang`,`a`.`Jml_Barang` AS `Jml_Barang`,`b`.`Tgl_Masuk` AS `Tgl_Masuk`,`b`.`Jml_Masuk` AS `Jml_Masuk`,`c`.`Nm_Jenis` AS `Nm_Jenis` from ((`struktur_barang` `a` join `struktur_barang_masuk` `b` on((`b`.`Kd_Barang` = `a`.`Kd_barang`))) join `strukturkodejenis` `c` on((`c`.`Kd_jenis` = `a`.`Kd_Jenis`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stp`
--
ALTER TABLE `stp`
 ADD PRIMARY KEY (`Kd_jual`), ADD KEY `Kd_pelanggan` (`Kd_pelanggan`);

--
-- Indexes for table `strukturkodejenis`
--
ALTER TABLE `strukturkodejenis`
 ADD PRIMARY KEY (`Kd_jenis`);

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
 ADD PRIMARY KEY (`Kd_jual`,`Kd_barang`), ADD KEY `Kd_barang` (`Kd_barang`), ADD KEY `Kd_barang_2` (`Kd_barang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stp`
--
ALTER TABLE `stp`
ADD CONSTRAINT `stp_ibfk_1` FOREIGN KEY (`Kd_pelanggan`) REFERENCES `struktur_anggota` (`Kd_Pelanggan`);

--
-- Constraints for table `struktur_barang`
--
ALTER TABLE `struktur_barang`
ADD CONSTRAINT `struktur_barang_ibfk_1` FOREIGN KEY (`Kd_barang`) REFERENCES `struktur_barang_masuk` (`Kd_Barang`),
ADD CONSTRAINT `struktur_barang_ibfk_2` FOREIGN KEY (`Kd_Jenis`) REFERENCES `strukturkodejenis` (`Kd_jenis`);

--
-- Constraints for table `struktur_barang_masuk`
--
ALTER TABLE `struktur_barang_masuk`
ADD CONSTRAINT `struktur_barang_masuk_ibfk_1` FOREIGN KEY (`Kd_Barang`) REFERENCES `struktur_detail_transaksi` (`Kd_barang`);

--
-- Constraints for table `struktur_detail_transaksi`
--
ALTER TABLE `struktur_detail_transaksi`
ADD CONSTRAINT `struktur_detail_transaksi_ibfk_1` FOREIGN KEY (`Kd_barang`) REFERENCES `struktur_barang` (`Kd_barang`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
