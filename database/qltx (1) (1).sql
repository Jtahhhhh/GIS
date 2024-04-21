-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 20, 2024 lúc 01:31 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qltx`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bang_gia`
--

CREATE TABLE `bang_gia` (
  `CTG_MA` varchar(8) NOT NULL,
  `TD_THOIGIANKETTHUC` datetime NOT NULL,
  `TD_THOIGIANBATDAU` datetime NOT NULL,
  `G_TIEN` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bang_gia`
--

INSERT INTO `bang_gia` (`CTG_MA`, `TD_THOIGIANKETTHUC`, `TD_THOIGIANBATDAU`, `G_TIEN`) VALUES
('001', '2024-03-09 22:00:00', '2024-03-09 06:00:00', 2.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bao_duong`
--

CREATE TABLE `bao_duong` (
  `X_MA` varchar(8) NOT NULL,
  `BD_SOLAN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietgia_chuyenxe`
--

CREATE TABLE `chitietgia_chuyenxe` (
  `CX_MA` int(8) NOT NULL,
  `CTG_MA` varchar(50) NOT NULL,
  `CT_SOTIEN` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietgia_chuyenxe`
--

INSERT INTO `chitietgia_chuyenxe` (`CX_MA`, `CTG_MA`, `CT_SOTIEN`) VALUES
(1, '001', 0),
(5, '001', 0),
(6, '', 31570),
(7, '', 28930),
(8, '', 20350),
(9, '', 24090),
(10, '001', 13090),
(11, '001', 21340),
(12, '001', 5610),
(13, '001', 25190),
(14, '001', 39050),
(15, '001', 22330),
(16, '001', 22000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_bang_gia`
--

CREATE TABLE `chi_tiet_bang_gia` (
  `CTG_MA` varchar(8) NOT NULL,
  `CTG_DONGIA` float(8,0) DEFAULT NULL,
  `CTG_GIACANTREN` float(8,0) DEFAULT NULL,
  `CTG_GIACANDUOI` float(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_bang_gia`
--

INSERT INTO `chi_tiet_bang_gia` (`CTG_MA`, `CTG_DONGIA`, `CTG_GIACANTREN`, `CTG_GIACANDUOI`) VALUES
('001', 11000, 5, 0),
('002', 50, 10, 5),
('003', 93, 20, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_xe`
--

CREATE TABLE `chi_tiet_xe` (
  `X_MA` varchar(8) NOT NULL,
  `TX_MA` int(8) NOT NULL,
  `CTX_CHONGOI` decimal(8,0) DEFAULT NULL,
  `CTX_THONGSO` text DEFAULT NULL,
  `CTX_MODEL` varchar(8) DEFAULT NULL,
  `CTX_NGAYBANGIAO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_xe`
--

INSERT INTO `chi_tiet_xe` (`X_MA`, `TX_MA`, `CTX_CHONGOI`, `CTX_THONGSO`, `CTX_MODEL`, `CTX_NGAYBANGIAO`) VALUES
('001', 2, 5, 'Điện', '2022', '2023-08-01'),
('002', 4, 5, 'Điện', '2022', '2023-10-01'),
('003', 5, 5, 'Xăng', '2019', '2023-07-07'),
('004', 3, 5, 'Xăng', '2020', '2023-11-24'),
('005', 1, 8, 'Xăng', '2019', '2023-05-16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyen_xe`
--

CREATE TABLE `chuyen_xe` (
  `CX_MA` int(8) NOT NULL,
  `TX_MA` int(8) NOT NULL,
  `KH_MA` int(8) NOT NULL,
  `CX_TOADOBATDAU` varchar(50) DEFAULT NULL,
  `CX_NOIDEN` varchar(50) NOT NULL,
  `CX_QUANGDUONG` varchar(50) NOT NULL,
  `CX_TOADOBDX` varchar(80) NOT NULL,
  `CX_TOADOKTY` varchar(80) NOT NULL,
  `CX_TOADOBDY` varchar(80) DEFAULT NULL,
  `CX_TOADOKTX` varchar(80) DEFAULT NULL,
  `CX_trangThai` int(11) NOT NULL,
  `PTTT_MA` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuyen_xe`
--

INSERT INTO `chuyen_xe` (`CX_MA`, `TX_MA`, `KH_MA`, `CX_TOADOBATDAU`, `CX_NOIDEN`, `CX_QUANGDUONG`, `CX_TOADOBDX`, `CX_TOADOKTY`, `CX_TOADOBDY`, `CX_TOADOKTX`, `CX_trangThai`, `PTTT_MA`) VALUES
(1, 2, 3, 'Trường Đại học Cần Thơ', 'Vincom Plaza Hùng Vương', '2.4 Km', '10.029892599248873', '10.045291690912725', '105.77961573402484', '105.77060464333577', 0, '001'),
(2, 1, 5, 'Đại Học Y Dược Cần Thơ', 'Công viên Lưu Hữu Phước', '5 Km', '10.03349472114935', '10.032047379481815', '105.78167938912603', '105.75465793376551', 0, '002'),
(3, 4, 4, 'FPT University', 'GO! Cần Thơ', '9.3 Km', '10.012458274410218', '10.013966963671754', '105.78451243603766', '105.73244608597166', 0, '003'),
(4, 5, 1, 'FIT Hotel Can Tho', 'Bến Ninh Kiều', '2.7 Km', '10.048153565414124', '10.032307200216552', '105.7881725340379', '105.7854922158625', 0, '002'),
(5, 1, 2, '', 'Đại học cần thơ', '2.4', '10.024833161911891', '105.76909', '105.75899874646754', '10.03111', 1, '001'),
(6, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '2.87', '10.0368384', '105.7333175947748', '105.7325056', '10.040783954320041', 0, '001'),
(7, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '2.63', '10.0368384', '105.7335749403252', '105.7325056', '10.04048798522516', 0, '001'),
(8, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '1.85', '10.0368384', '105.7370491052553', '105.7325056', '10.042432920035793', 0, '001'),
(9, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '2.19', '10.0368384', '105.73451854067656', '105.7325056', '10.043701349483028', 0, '001'),
(10, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '1.19', '10.0204544', '105.76623231261121', '105.7718272', '10.01677629968662', 0, '001'),
(11, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '1.94', '10.0204544', '105.77348589301752', '105.7718272', '10.02810833600027', 0, '001'),
(12, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '0.51', '10.0204544', '105.76889656403581', '105.7718272', '10.024091432268035', 0, '001'),
(13, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '2.29', '10.0204544', '105.77767165713948', '105.7718272', '10.034232572119045', 0, '001'),
(14, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '3.55', '10.0248289', '105.76811717721284', '105.7589447', '10.03250331527271', 0, '001'),
(15, 2, 6, 'Vị trí hiện tại của bạn', 'Đang cập nhật', '2.03', '10.0204544', '105.76006103347285', '105.7718272', '10.026882128561708', 0, '001');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dang_kiem`
--

CREATE TABLE `dang_kiem` (
  `DK_MA` varchar(8) NOT NULL,
  `X_MA` varchar(8) NOT NULL,
  `DK_TGHETHAN` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia`
--

CREATE TABLE `danh_gia` (
  `CX_MA` int(8) NOT NULL,
  `DG_SAO` decimal(5,0) DEFAULT NULL,
  `DG_NOIDUNG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_gia`
--

INSERT INTO `danh_gia` (`CX_MA`, `DG_SAO`, `DG_NOIDUNG`) VALUES
(1, 5, 'Lái xe cẩn thận, an toàn'),
(2, 4, 'Tới đón muộn hơn giờ dự kiến'),
(3, 5, 'Đúng thời gian'),
(4, 5, 'Tài xế nhiệt tình, vui vẻ trò chuyện với khách hàng '),
(7, 5, 'Tài xế thân thiện'),
(10, 5, 'oke'),
(10, 5, 'okeeeee'),
(8, 5, 'Tài xế lái xe oke'),
(10, 5, 'Tài xế vui tính'),
(11, 5, 'Lái xe an toàn'),
(12, 5, 'ổn'),
(14, 5, 'okeeeeeeeeeeeeeeeeeeeee');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem_danh_gia`
--

CREATE TABLE `diem_danh_gia` (
  `TX_MA` int(8) NOT NULL,
  `DDG_TONGDIEM` decimal(8,0) DEFAULT NULL,
  `DDG_SAO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `diem_danh_gia`
--

INSERT INTO `diem_danh_gia` (`TX_MA`, `DDG_TONGDIEM`, `DDG_SAO`) VALUES
(1, 80, '4'),
(2, 100, '5'),
(3, 100, '5'),
(5, 100, '5\r\n'),
(4, 95, '4.8');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `KH_MA` int(8) NOT NULL,
  `QH_MA` varchar(8) NOT NULL,
  `KH_TEN` varchar(30) DEFAULT NULL,
  `KH_SODIENTHOAI` varchar(10) DEFAULT NULL,
  `KH_EMAIL` varchar(30) DEFAULT NULL,
  `KH_USERNAME` varchar(30) DEFAULT NULL,
  `KH_PASSWORD` varchar(10) DEFAULT NULL,
  `KH_DIEMTICHLUY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`KH_MA`, `QH_MA`, `KH_TEN`, `KH_SODIENTHOAI`, `KH_EMAIL`, `KH_USERNAME`, `KH_PASSWORD`, `KH_DIEMTICHLUY`) VALUES
(1, '001', 'Cao Văn Trường', '987678123', 'truong123@gmail.com', 'truong123', 'truong123', 50),
(2, '003', 'Trần Quốc Bình', '321987789', 'binh123@gmail.com', 'binh123', 'binh123', 21),
(3, '002', 'Nguyễn Bá Nam', '967672144', 'nam123@gmail.com', 'nam123', 'nam123', 84),
(4, '002', 'Nguyễn Trà Giang', '797675555', 'giang123@gmail.com', 'Nguyễn Trà Giang', 'giang123', 71),
(5, '001', 'Nguyễn Anh Thư', '377155166', 'thu123@gmail.com', 'Nguyễn Anh Thư', 'thu123', 52),
(6, '4', 'Nguyễn Thanh Liêm', '0398585897', 'liemb2003790@student.ctu.edu.v', 'liem123', 'liem123', 2316);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pt_thanh_toan`
--

CREATE TABLE `pt_thanh_toan` (
  `PTTT_MA` varchar(8) NOT NULL,
  `PTTT_TEN` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `pt_thanh_toan`
--

INSERT INTO `pt_thanh_toan` (`PTTT_MA`, `PTTT_TEN`) VALUES
('001', 'Tiền mặt'),
('002', 'Ví điện tử'),
('003', 'Online Banking');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quan_huyen`
--

CREATE TABLE `quan_huyen` (
  `QH_MA` varchar(8) NOT NULL,
  `TP_MA` varchar(8) NOT NULL,
  `QH_TEN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quan_huyen`
--

INSERT INTO `quan_huyen` (`QH_MA`, `TP_MA`, `QH_TEN`) VALUES
('001', '001', 'Ninh Kiều'),
('002', '001', 'Cái Răng'),
('003', '001', 'Bình Thủy'),
('4', '2', 'Thới Lai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quan_ly`
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
-- Đang đổ dữ liệu cho bảng `quan_ly`
--

INSERT INTO `quan_ly` (`QL_MA`, `QH_MA`, `QL_TEN`, `QL_SODIENTHOAI`, `QL_EMAIL`, `QL_USERNAME`, `QL_PASSWORD`) VALUES
('001', '001', 'Admin', 987654321, 'admin@gmail.com', 'admin', 'admin'),
('002', '002', 'LiemNguyen', 398585897, 'liemb2003790@student.ctu.edu.vn', 'liem123', 'liem123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_xe`
--

CREATE TABLE `tai_xe` (
  `TX_MA` int(8) NOT NULL,
  `QH_MA` varchar(8) NOT NULL,
  `TX_TEN` varchar(30) DEFAULT NULL,
  `TX_SODIENTHOAI` varchar(10) DEFAULT NULL,
  `TX_EMAIL` varchar(30) DEFAULT NULL,
  `TX_USERNAME` varchar(30) DEFAULT NULL,
  `TX_PASSWORD` varchar(10) DEFAULT NULL,
  `TX_viTriX` varchar(30) NOT NULL,
  `TX_viTriY` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tai_xe`
--

INSERT INTO `tai_xe` (`TX_MA`, `QH_MA`, `TX_TEN`, `TX_SODIENTHOAI`, `TX_EMAIL`, `TX_USERNAME`, `TX_PASSWORD`, `TX_viTriX`, `TX_viTriY`) VALUES
(1, '001', 'Trần Văn Xuân', '377525377', 'xuan123@gmail.com', 'Trần Văn Xuân', 'xuan123', '10.039787846196289', '105.75796213098627'),
(2, '003', 'Ngô Đình Trung', '975647123', 'trung123@gmail.com', 'Ngô Đình Trung', 'trung123', '10.030617273418581', '105.77256791669227'),
(3, '002', 'Nguyễn Văn Nam', '791244563', 'nam123@gmail.com', 'Nguyễn Văn Nam', 'nam123', '10.050322375793844', '105.77188282204726'),
(4, '001', 'Trần Bùi Văn Sĩ', '399191626', 'si123@gmail.com', 'Trần Bùi Văn Sĩ', 'si123', '10.026751795131599', '105.74796390692458'),
(5, '001', 'Đinh Văn Hoài', '913134876', 'hoai123@gmail.com', 'admin', 'admin', '10.046324864121866', '105.78128187915503');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanh_pho`
--

CREATE TABLE `thanh_pho` (
  `TP_MA` varchar(8) NOT NULL,
  `TP_TEN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thanh_pho`
--

INSERT INTO `thanh_pho` (`TP_MA`, `TP_TEN`) VALUES
('001', 'Cần Thơ'),
('2', 'Cần Thơ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thoidiem`
--

CREATE TABLE `thoidiem` (
  `CX_MA` int(11) NOT NULL,
  `TD_THOIGIANBATDAU` datetime NOT NULL,
  `TD_THOIGIANKETTHUC` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thoidiem`
--

INSERT INTO `thoidiem` (`CX_MA`, `TD_THOIGIANBATDAU`, `TD_THOIGIANKETTHUC`) VALUES
(7, '2024-04-19 18:59:06', '2024-04-19 19:01:06'),
(8, '2024-04-19 19:01:55', '2024-04-19 19:03:55'),
(9, '2024-04-19 20:02:55', '2024-04-19 20:04:55'),
(6, '2024-04-19 15:40:25', '2024-04-19 15:42:25'),
(10, '2024-04-20 15:44:39', '2024-04-20 15:46:39'),
(11, '2024-04-20 16:55:10', '2024-04-20 16:57:10'),
(12, '2024-04-20 17:59:52', '2024-04-20 18:01:52'),
(13, '2024-04-20 18:07:06', '2024-04-20 18:09:06'),
(14, '2024-04-20 18:14:39', '2024-04-20 18:16:39'),
(15, '2024-04-20 18:17:30', '2024-04-20 18:19:30'),
(16, '2024-04-20 18:22:40', '2024-04-20 18:24:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trang_thai`
--

CREATE TABLE `trang_thai` (
  `TD_THOIGIANKETTHUC` datetime NOT NULL,
  `TD_THOIGIANBATDAU` datetime NOT NULL,
  `TX_MA` varchar(8) NOT NULL,
  `TT_TINHTRANG` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `trang_thai`
--

INSERT INTO `trang_thai` (`TD_THOIGIANKETTHUC`, `TD_THOIGIANBATDAU`, `TX_MA`, `TT_TINHTRANG`) VALUES
('2024-04-20 12:34:46', '2024-04-20 12:34:46', '1', 0),
('2024-04-20 18:25:29', '2024-04-20 18:23:29', '2', 1),
('2024-04-20 12:35:01', '2024-04-20 12:35:01', '3', 0),
('2024-04-20 12:35:01', '2024-04-20 12:35:01', '4', 0),
('2024-04-20 12:35:11', '2024-04-20 12:35:11', '5', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xe`
--

CREATE TABLE `xe` (
  `X_MA` varchar(8) NOT NULL,
  `X_TEN` varchar(30) DEFAULT NULL,
  `X_BIENSO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `xe`
--

INSERT INTO `xe` (`X_MA`, `X_TEN`, `X_BIENSO`) VALUES
('001', 'Vinfast VF88', '65A-218.'),
('002', 'Vinfast VF5', '65A-214.'),
('003', 'Kia Morning', '65A-144.'),
('004', 'Toyota Vios', '65A-731.'),
('005', 'Toyota Innova', '65A-932.');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bang_gia`
--
ALTER TABLE `bang_gia`
  ADD PRIMARY KEY (`CTG_MA`,`TD_THOIGIANKETTHUC`,`TD_THOIGIANBATDAU`),
  ADD KEY `FK_CO_GIA_TAI_THOI_DIEM` (`TD_THOIGIANKETTHUC`,`TD_THOIGIANBATDAU`);

--
-- Chỉ mục cho bảng `bao_duong`
--
ALTER TABLE `bao_duong`
  ADD PRIMARY KEY (`X_MA`);

--
-- Chỉ mục cho bảng `chitietgia_chuyenxe`
--
ALTER TABLE `chitietgia_chuyenxe`
  ADD PRIMARY KEY (`CX_MA`,`CTG_MA`);

--
-- Chỉ mục cho bảng `chi_tiet_bang_gia`
--
ALTER TABLE `chi_tiet_bang_gia`
  ADD PRIMARY KEY (`CTG_MA`);

--
-- Chỉ mục cho bảng `chi_tiet_xe`
--
ALTER TABLE `chi_tiet_xe`
  ADD PRIMARY KEY (`X_MA`,`TX_MA`),
  ADD KEY `FK_QUAN_LI` (`TX_MA`);

--
-- Chỉ mục cho bảng `chuyen_xe`
--
ALTER TABLE `chuyen_xe`
  ADD PRIMARY KEY (`CX_MA`),
  ADD KEY `FK_RELATIONSHIP_19` (`KH_MA`),
  ADD KEY `FK_THUC_HIEN_BOI` (`TX_MA`),
  ADD KEY `PTTT_CX` (`PTTT_MA`);

--
-- Chỉ mục cho bảng `pt_thanh_toan`
--
ALTER TABLE `pt_thanh_toan`
  ADD PRIMARY KEY (`PTTT_MA`);

--
-- Chỉ mục cho bảng `tai_xe`
--
ALTER TABLE `tai_xe`
  ADD PRIMARY KEY (`TX_MA`),
  ADD KEY `QH_MA` (`QH_MA`);

--
-- Chỉ mục cho bảng `thoidiem`
--
ALTER TABLE `thoidiem`
  ADD KEY `CX_MA` (`CX_MA`);

--
-- Chỉ mục cho bảng `xe`
--
ALTER TABLE `xe`
  ADD PRIMARY KEY (`X_MA`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tai_xe`
--
ALTER TABLE `tai_xe`
  MODIFY `TX_MA` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chuyen_xe`
--
ALTER TABLE `chuyen_xe`
  ADD CONSTRAINT `PTTT_CX` FOREIGN KEY (`PTTT_MA`) REFERENCES `pt_thanh_toan` (`PTTT_MA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
