-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2024 at 09:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qltx`
--

-- --------------------------------------------------------

--
-- Table structure for table `bang_gia`
--

CREATE TABLE `bang_gia` (
  `CTG_MA` varchar(8) NOT NULL,
  `TD_THOIGIANKETTHUC` datetime NOT NULL,
  `TD_THOIGIANBATDAU` datetime NOT NULL,
  `G_TIEN` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bang_gia`
--

INSERT INTO `bang_gia` (`CTG_MA`, `TD_THOIGIANKETTHUC`, `TD_THOIGIANBATDAU`, `G_TIEN`) VALUES
('001', '2024-03-09 22:00:00', '2024-03-09 06:00:00', 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `bao_duong`
--

CREATE TABLE `bao_duong` (
  `X_MA` varchar(8) NOT NULL,
  `BD_SOLAN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_bang_gia`
--

CREATE TABLE `chi_tiet_bang_gia` (
  `CTG_MA` varchar(8) NOT NULL,
  `CX_MA` varchar(8) NOT NULL,
  `CTG_DONGIA` float(8,2) DEFAULT NULL,
  `CTG_GIACANTREN` float(8,2) DEFAULT NULL,
  `CTG_GIACANDUOI` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chi_tiet_bang_gia`
--

INSERT INTO `chi_tiet_bang_gia` (`CTG_MA`, `CX_MA`, `CTG_DONGIA`, `CTG_GIACANTREN`, `CTG_GIACANDUOI`) VALUES
('001', '001', 50000.00, 0.00, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_xe`
--

CREATE TABLE `chi_tiet_xe` (
  `X_MA` varchar(8) NOT NULL,
  `TX_MA` varchar(8) NOT NULL,
  `CTX_CHONGOI` decimal(8,0) DEFAULT NULL,
  `CTX_THONGSO` text DEFAULT NULL,
  `CTX_MODEL` varchar(8) DEFAULT NULL,
  `CTX_NGAYBANGIAO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chuyen_xe`
--

CREATE TABLE `chuyen_xe` (
  `CX_MA` varchar(8) NOT NULL,
  `TX_MA` varchar(8) NOT NULL,
  `KH_MA` varchar(8) NOT NULL,
  `_CX_TOADOBATDAU` varchar(50) NOT NULL,
  `CX_NOIDEN` varchar(50) NOT NULL,
  `CX_QUANGDUONG` varchar(50) NOT NULL,
  `CX_TOADOBDX` varchar(80) NOT NULL,
  `CX_TOADOKTY` varchar(80) NOT NULL,
  `CX_TOADOBDY` varchar(80) DEFAULT NULL,
  `CX_TOADOKTX` varchar(80) DEFAULT NULL,
  `CX_trangThai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dang_kiem`
--

CREATE TABLE `dang_kiem` (
  `DK_MA` varchar(8) NOT NULL,
  `X_MA` varchar(8) NOT NULL,
  `DK_TGHETHAN` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danh_gia`
--

CREATE TABLE `danh_gia` (
  `CX_MA` varchar(8) NOT NULL,
  `DG_SAO` decimal(5,0) DEFAULT NULL,
  `DG_NOIDUNG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `danh_gia`
--

INSERT INTO `danh_gia` (`CX_MA`, `DG_SAO`, `DG_NOIDUNG`) VALUES
('001', 5, 'tài xế lái xe an toàn'),
('001', 5, 'tài xế lái xe an toàn');

-- --------------------------------------------------------

--
-- Table structure for table `diem_danh_gia`
--

CREATE TABLE `diem_danh_gia` (
  `TX_MA` varchar(8) NOT NULL,
  `DDG_TONGDIEM` decimal(8,0) DEFAULT NULL,
  `DDG_SAO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diem_danh_gia`
--

INSERT INTO `diem_danh_gia` (`TX_MA`, `DDG_TONGDIEM`, `DDG_SAO`) VALUES
('001', 98, '4.8'),
('002', 90, '4.5'),
('003', 91, '4.0');

-- --------------------------------------------------------

--
-- Table structure for table `khach_hang`
--

CREATE TABLE `khach_hang` (
  `KH_MA` varchar(8) NOT NULL,
  `QH_MA` varchar(8) NOT NULL,
  `KH_TEN` varchar(30) DEFAULT NULL,
  `KH_SODIENTHOAI` decimal(10,0) DEFAULT NULL,
  `KH_EMAIL` varchar(30) DEFAULT NULL,
  `KH_USERNAME` varchar(30) DEFAULT NULL,
  `KH_PASSWORD` varchar(10) DEFAULT NULL,
  `KH_DIEMTICHLUY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `khach_hang`
--

INSERT INTO `khach_hang` (`KH_MA`, `QH_MA`, `KH_TEN`, `KH_SODIENTHOAI`, `KH_EMAIL`, `KH_USERNAME`, `KH_PASSWORD`, `KH_DIEMTICHLUY`) VALUES
('001', '001', 'Cao Văn Trường', 987678123, 'truong123@gmail.com', 'truong123', 'truong123', 50),
('002', '003', 'Trần Quốc Bình', 321987789, 'binh123@gmail.com', 'binh123', 'binh123', 21),
('003', '002', 'Nguyễn Bá Nam', 967672144, 'nam123@gmail.com', 'nam123', 'nam123', 84);

-- --------------------------------------------------------

--
-- Table structure for table `pttt_cua_cx`
--

CREATE TABLE `pttt_cua_cx` (
  `CX_ma` varchar(10) NOT NULL,
  `PTTT_ma` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pt_thanh_toan`
--

CREATE TABLE `pt_thanh_toan` (
  `PTTT_MA` varchar(8) NOT NULL,
  `PTTT_TEN` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quan_huyen`
--

CREATE TABLE `quan_huyen` (
  `QH_MA` varchar(8) NOT NULL,
  `TP_MA` varchar(8) NOT NULL,
  `QH_TEN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quan_huyen`
--

INSERT INTO `quan_huyen` (`QH_MA`, `TP_MA`, `QH_TEN`) VALUES
('001', '001', 'Ninh Kiều'),
('002', '001', 'Cái Răng'),
('003', '001', 'Bình Thủy');

-- --------------------------------------------------------

--
-- Table structure for table `quan_ly`
--

CREATE TABLE `quan_ly` (
  `QL_MA` varchar(8) NOT NULL,
  `QH_MA` varchar(8) NOT NULL,
  `QL_TEN` varchar(80) NOT NULL,
  `QL_SODIENTHOAI` int(11) NOT NULL,
  `QL_EMAIL` varchar(100) NOT NULL,
  `QL_USERNAME` varchar(30) NOT NULL,
  `QL_PASSWORD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quan_ly`
--

INSERT INTO `quan_ly` (`QL_MA`, `QH_MA`, `QL_TEN`, `QL_SODIENTHOAI`, `QL_EMAIL`, `QL_USERNAME`, `QL_PASSWORD`) VALUES
('1', '', 'Thành', 988184036, '...', 'Thanh', '1'),
('001', '001', 'Admin', 987654321, 'admin@gmail.com', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tai_xe`
--

CREATE TABLE `tai_xe` (
  `TX_MA` varchar(8) NOT NULL,
  `QH_MA` varchar(8) NOT NULL,
  `TX_TEN` varchar(30) DEFAULT NULL,
  `TX_SODIENTHOAI` decimal(10,0) DEFAULT NULL,
  `TX_EMAIL` varchar(30) DEFAULT NULL,
  `TX_USERNAME` varchar(30) DEFAULT NULL,
  `TX_PASSWORD` varchar(10) DEFAULT NULL,
  `TX_viTriX` varchar(30) NOT NULL,
  `TX_viTriY` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tai_xe`
--

INSERT INTO `tai_xe` (`TX_MA`, `QH_MA`, `TX_TEN`, `TX_SODIENTHOAI`, `TX_EMAIL`, `TX_USERNAME`, `TX_PASSWORD`, `TX_viTriX`, `TX_viTriY`) VALUES
('1', '', 'Tiến', NULL, NULL, 'tientien', '1', '10.0279603', '105.7664918'),
('2', '', 'Trân', NULL, NULL, 'trantran', '1', '10.015984614521544', ' 105.76582708643166'),
('001', '001', 'Trần Văn Xuân', 377525377, 'xuan123@gmail.com', 'xuan123', 'xuan123', '10.02408937435276', '105.76443853446952'),
('002', '003', 'Ngô Đình Trung', 975647123, 'trung123@gmail.com', 'trung123', 'trung123', '10.029419801397434', '105.78717356884066'),
('003', '002', 'Nguyễn Văn Nam', 791244563, 'nam123@gmail.com', 'nam123', 'nam123', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `thanh_pho`
--

CREATE TABLE `thanh_pho` (
  `TP_MA` varchar(8) NOT NULL,
  `TP_TEN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thanh_pho`
--

INSERT INTO `thanh_pho` (`TP_MA`, `TP_TEN`) VALUES
('001', 'Cần Thơ');

-- --------------------------------------------------------

--
-- Table structure for table `thoidiem`
--

CREATE TABLE `thoidiem` (
  `TD_THOIGIANBATDAU` datetime NOT NULL,
  `TD_THOIGIANKETTHUC` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thoidiem`
--

INSERT INTO `thoidiem` (`TD_THOIGIANBATDAU`, `TD_THOIGIANKETTHUC`) VALUES
('2024-03-09 14:37:50', '0000-00-00 00:00:00'),
('2024-03-09 22:00:00', '2024-03-09 06:00:00'),
('2024-03-09 22:00:00', '2024-03-09 06:00:00'),
('2024-03-09 06:00:00', '2024-03-09 22:00:00'),
('2024-03-10 11:00:00', '2024-03-10 11:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `trang_thai`
--

CREATE TABLE `trang_thai` (
  `TD_THOIGIANKETTHUC` datetime NOT NULL,
  `TD_THOIGIANBATDAU` datetime NOT NULL,
  `TX_MA` varchar(8) NOT NULL,
  `TT_TINHTRANG` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trang_thai`
--

INSERT INTO `trang_thai` (`TD_THOIGIANKETTHUC`, `TD_THOIGIANBATDAU`, `TX_MA`, `TT_TINHTRANG`) VALUES
('2024-03-09 22:00:00', '2024-03-09 06:00:00', '001', 0),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', '002', 0),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', '003', 0),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xe`
--

CREATE TABLE `xe` (
  `X_MA` varchar(8) NOT NULL,
  `X_TEN` varchar(30) DEFAULT NULL,
  `X_BIENSO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `xe`
--

INSERT INTO `xe` (`X_MA`, `X_TEN`, `X_BIENSO`) VALUES
('001', 'Vinfast VF8', '65A-823.'),
('002', 'Vinfast VF5', '65A-214.'),
('003', 'Kia Morning', '65A-144.'),
('004', 'Toyota Vios', '65A-731.'),
('005', 'Toyota Innova', '65A-932.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bang_gia`
--
ALTER TABLE `bang_gia`
  ADD PRIMARY KEY (`CTG_MA`,`TD_THOIGIANKETTHUC`,`TD_THOIGIANBATDAU`),
  ADD KEY `FK_CO_GIA_TAI_THOI_DIEM` (`TD_THOIGIANKETTHUC`,`TD_THOIGIANBATDAU`);

--
-- Indexes for table `bao_duong`
--
ALTER TABLE `bao_duong`
  ADD PRIMARY KEY (`X_MA`);

--
-- Indexes for table `chi_tiet_bang_gia`
--
ALTER TABLE `chi_tiet_bang_gia`
  ADD PRIMARY KEY (`CTG_MA`),
  ADD KEY `FK_RELATIONSHIP_15` (`CX_MA`);

--
-- Indexes for table `chi_tiet_xe`
--
ALTER TABLE `chi_tiet_xe`
  ADD PRIMARY KEY (`X_MA`,`TX_MA`),
  ADD KEY `FK_QUAN_LI` (`TX_MA`);

--
-- Indexes for table `chuyen_xe`
--
ALTER TABLE `chuyen_xe`
  ADD PRIMARY KEY (`CX_MA`),
  ADD KEY `FK_RELATIONSHIP_19` (`KH_MA`),
  ADD KEY `FK_THUC_HIEN_BOI` (`TX_MA`);

--
-- Indexes for table `pttt_cua_cx`
--
ALTER TABLE `pttt_cua_cx`
  ADD PRIMARY KEY (`CX_ma`,`PTTT_ma`),
  ADD KEY `Constraint_PTTT` (`PTTT_ma`);

--
-- Indexes for table `pt_thanh_toan`
--
ALTER TABLE `pt_thanh_toan`
  ADD PRIMARY KEY (`PTTT_MA`);

--
-- Indexes for table `xe`
--
ALTER TABLE `xe`
  ADD PRIMARY KEY (`X_MA`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pttt_cua_cx`
--
ALTER TABLE `pttt_cua_cx`
  ADD CONSTRAINT `Constraint_CX` FOREIGN KEY (`CX_ma`) REFERENCES `chuyen_xe` (`CX_MA`),
  ADD CONSTRAINT `Constraint_PTTT` FOREIGN KEY (`PTTT_ma`) REFERENCES `pt_thanh_toan` (`PTTT_MA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
