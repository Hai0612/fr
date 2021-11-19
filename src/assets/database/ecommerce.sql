-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2021 lúc 04:36 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB-log
-- Phiên bản PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id_` int(11) NOT NULL,
  `name_brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc_brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id_`, `name_brand`, `desc_brand`, `image`) VALUES
(1, 'Louis Vuitton', 'Các sản phẩm của Louis Vuitton được sản xuất trong nước và nước ngoài', NULL),
(2, 'Gucci', 'Các sản phẩm của Gucci được sản xuất trong nước và nước ngoài', NULL),
(3, 'Hermes', 'Các sản phẩm của Hermes được sản xuất trong nước và nước ngoài', NULL),
(4, 'Prada', 'Các sản phẩm của Prada được sản xuất trong nước và nước ngoài', NULL),
(5, 'Adidas', 'Các sản phẩm của Adidas được sản xuất trong nước và nước ngoài', NULL),
(6, 'Ralph Lauren', 'Các sản phẩm của Ralph Lauren được sản xuất trong nước và nước ngoài', NULL),
(7, 'Nike', 'Các sản phẩm của Burberry được sản xuất trong nước và nước ngoài', NULL),
(8, 'Versace', 'Các sản phẩm của House Of Versace được sản xuất trong nước và nước ngoài', NULL),
(9, 'Fendi', 'Các sản phẩm của Fendi được sản xuất trong nước và nước ngoài', NULL),
(10, 'Armani', 'Các sản phẩm của Armani được sản xuất trong nước và nước ngoài', NULL),
(11, 'Chanel', 'Các sản phẩm của chanel được sản xuất toàn thế giới', 'null');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_variant` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `modified_at` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_variant`, `quantity`, `created_at`, `modified_at`, `status`) VALUES
(1, 2, 797, 2, '2021-11-19', '2021-11-19', 2),
(2, 2, 502, 3, '2021-11-19', '2021-11-19', 2),
(3, 1, 103, 1, '2021-11-19', '2021-11-19', 2),
(4, 1, 30, 3, '2021-11-19', '2021-11-19', 2),
(5, 1, 388, 1, '2021-11-19', '2021-11-19', 2),
(6, 1, 240, 3, '2021-11-19', '2021-11-19', 2),
(7, 5, 281, 1, '2021-11-19', '2021-11-19', 2),
(8, 5, 617, 2, '2021-11-19', '2021-11-19', 2),
(9, 5, 12, 1, '2021-11-19', '2021-11-19', 0),
(10, 5, 261, 2, '2021-11-19', '2021-11-19', 0),
(11, 12, 1271, 3, '2021-11-19', '2021-11-19', 2),
(12, 1, 44, 2, '2021-11-19', '2021-11-19', 2),
(15, 1, 150, 2, '2021-11-19', '2021-11-19', 2),
(16, 1, 128, 2, '2021-11-19', '2021-11-19', 2),
(17, 1, 39, 1, '2021-11-19', '2021-11-19', 2),
(18, 1, 622, 1, '2021-11-19', '2021-11-19', 2),
(19, 1, 101, 2, '2021-11-19', '2021-11-19', 2);

--
-- Bẫy `cart`
--
DELIMITER $$
CREATE TRIGGER `after_cart_update` AFTER UPDATE ON `cart` FOR EACH ROW BEGIN
    IF NEW.status = 2 THEN
    INSERT INTO order_details (id_order, id_variant, quantity_product)
    VALUES ((SELECT MAX(id) FROM orders) , NEW.id_variant, NEW.quantity);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `id_user`, `id_product`, `content`, `date`) VALUES
(2, 1, 3, 'Sản phẩm rất tốt, mong chờ nhiều sản phẩm như thế này nữa\n', '2021-11-18 03:05:49'),
(4, 1, 3, 'Tôi rất thích sản phẩm này\n', '2021-11-18 03:12:16'),
(6, 5, 34, 'sản phẩm tốt\n', '2021-11-19 10:25:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `percent` decimal(10,0) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `discount`
--

INSERT INTO `discount` (`id`, `name`, `description`, `active`, `percent`, `created_at`) VALUES
(1, 'Không giảm giá', 'Không giảm giá', 0, '0', '2021-10-30'),
(2, 'Sale halloween', 'Giảm giá 30%', 1, '30', '2021-10-30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `id_product`, `description`, `url`, `type`) VALUES
(1, 1, 'Ảnh hiển thị', '1-1.jpg', 'thumbnail'),
(2, 1, 'Ảnh 1', '1-2.jpg', ''),
(3, 1, 'Ảnh 2', '1-3.jpg', ''),
(4, 2, 'Ảnh hiển thị', '2-1.jpg', 'thumbnail'),
(5, 2, 'Ảnh 1', '2-2.jpg', ''),
(6, 2, 'Ảnh 2', '2-3.jpg', ''),
(7, 3, 'Ảnh hiển thị', '3-1.jpg', 'thumbnail'),
(8, 3, 'Ảnh 1', '3-2.jpg', ''),
(9, 3, 'Ảnh 2', '3-3.jpg', ''),
(10, 4, 'Ảnh hiển thị', '4-1.jpg', 'thumbnail'),
(11, 4, 'Ảnh 1', '4-2.jpg', ''),
(12, 4, 'Ảnh 2', '4-3.jpg', ''),
(13, 5, 'Ảnh hiển thị', '5-1.jpg', 'thumbnail'),
(14, 5, 'Ảnh 1', '5-2.jpg', ''),
(15, 5, 'Ảnh 2', '5-3.jpg', ''),
(16, 6, 'Ảnh hiển thị', '6-1.jpg', 'thumbnail'),
(17, 6, 'Ảnh 1', '6-2.jpg', ''),
(18, 6, 'Ảnh 2', '6-3.jpg', ''),
(19, 7, 'Ảnh hiển thị', '7-1.jpg', 'thumbnail'),
(20, 7, 'Ảnh 1', '7-2.jpg', ''),
(21, 7, 'Ảnh 2', '7-3.jpg', ''),
(22, 8, 'Ảnh hiển thị', '8-1.jpg', 'thumbnail'),
(23, 8, 'Ảnh 1', '8-2.jpg', ''),
(24, 8, 'Ảnh 2', '8-3.jpg', ''),
(25, 9, 'Ảnh hiển thị', '9-1.jpg', 'thumbnail'),
(26, 9, 'Ảnh 1', '9-2.jpg', ''),
(27, 9, 'Ảnh 2', '9-3.jpg', ''),
(28, 10, 'Ảnh hiển thị', '10-1.jpg', 'thumbnail'),
(29, 10, 'Ảnh 1', '10-2.jpg', ''),
(30, 10, 'Ảnh 2', '10-3.jpg', ''),
(31, 11, 'Ảnh hiển thị', '11-1.jpg', 'thumbnail'),
(32, 11, 'Ảnh 1', '11-2.jpg', ''),
(33, 11, 'Ảnh 2', '11-3.jpg', ''),
(34, 12, 'Ảnh hiển thị', '12-1.jpg', 'thumbnail'),
(35, 12, 'Ảnh 1', '12-2.jpg', ''),
(36, 12, 'Ảnh 2', '12-3.jpg', ''),
(37, 13, 'Ảnh hiển thị', '13-1.jpg', 'thumbnail'),
(38, 13, 'Ảnh 1', '13-2.jpg', ''),
(39, 13, 'Ảnh 2', '13-3.jpg', ''),
(40, 14, 'Ảnh hiển thị', '14-1.jpg', 'thumbnail'),
(41, 14, 'Ảnh 1', '14-2.jpg', ''),
(42, 14, 'Ảnh 2', '14-3.jpg', ''),
(43, 15, 'Ảnh hiển thị', '15-1.jpg', 'thumbnail'),
(44, 15, 'Ảnh 1', '15-2.jpg', ''),
(45, 15, 'Ảnh 2', '15-3.jpg', ''),
(46, 16, 'Ảnh hiển thị', '16-1.jpg', 'thumbnail'),
(47, 16, 'Ảnh 1', '16-2.jpg', ''),
(48, 16, 'Ảnh 2', '16-3.jpg', ''),
(49, 17, 'Ảnh hiển thị', '17-1.jpg', 'thumbnail'),
(50, 17, 'Ảnh 1', '17-2.jpg', ''),
(51, 17, 'Ảnh 2', '17-3.jpg', ''),
(52, 18, 'Ảnh hiển thị', '18-1.jpg', 'thumbnail'),
(53, 18, 'Ảnh 1', '18-2.jpg', ''),
(54, 18, 'Ảnh 2', '18-3.jpg', ''),
(55, 19, 'Ảnh hiển thị', '19-1.jpg', 'thumbnail'),
(56, 19, 'Ảnh 1', '19-2.jpg', ''),
(57, 19, 'Ảnh 2', '19-3.jpg', ''),
(58, 20, 'Ảnh hiển thị', '20-1.jpg', 'thumbnail'),
(59, 20, 'Ảnh 1', '20-2.jpg', ''),
(60, 20, 'Ảnh 2', '20-3.jpg', ''),
(61, 21, 'Ảnh hiển thị', '21-1.jpg', 'thumbnail'),
(62, 21, 'Ảnh 1', '21-2.jpg', ''),
(63, 21, 'Ảnh 2', '21-3.jpg', ''),
(64, 22, 'Ảnh hiển thị', '22-1.jpg', 'thumbnail'),
(65, 22, 'Ảnh 1', '22-2.jpg', ''),
(66, 22, 'Ảnh 2', '22-3.jpg', ''),
(67, 23, 'Ảnh hiển thị', '23-1.jpg', 'thumbnail'),
(68, 23, 'Ảnh 1', '23-2.jpg', ''),
(69, 23, 'Ảnh 2', '23-3.jpg', ''),
(70, 24, 'Ảnh hiển thị', '24-1.jpg', 'thumbnail'),
(71, 24, 'Ảnh 1', '24-2.jpg', ''),
(72, 24, 'Ảnh 2', '24-3.jpg', ''),
(73, 25, 'Ảnh hiển thị', '25-1.jpg', 'thumbnail'),
(74, 25, 'Ảnh 1', '25-2.jpg', ''),
(75, 25, 'Ảnh 2', '25-3.jpg', ''),
(76, 26, 'Ảnh hiển thị', '26-1.jpg', 'thumbnail'),
(77, 26, 'Ảnh 1', '26-2.jpg', ''),
(78, 26, 'Ảnh 2', '26-3.jpg', ''),
(79, 27, 'Ảnh hiển thị', '27-1.jpg', 'thumbnail'),
(80, 27, 'Ảnh 1', '27-2.jpg', ''),
(81, 27, 'Ảnh 2', '27-3.jpg', ''),
(82, 28, 'Ảnh hiển thị', '28-1.jpg', 'thumbnail'),
(83, 28, 'Ảnh 1', '28-2.jpg', ''),
(84, 28, 'Ảnh 2', '28-3.jpg', ''),
(85, 29, 'Ảnh hiển thị', '29-1.jpg', 'thumbnail'),
(86, 29, 'Ảnh 1', '29-2.jpg', ''),
(87, 29, 'Ảnh 2', '29-3.jpg', ''),
(88, 30, 'Ảnh hiển thị', '30-1.jpg', 'thumbnail'),
(89, 30, 'Ảnh 1', '30-2.jpg', ''),
(90, 30, 'Ảnh 2', '30-3.jpg', ''),
(91, 31, 'Ảnh hiển thị', '31-1.jpg', 'thumbnail'),
(92, 31, 'Ảnh 1', '31-2.jpg', ''),
(93, 31, 'Ảnh 2', '31-3.jpg', ''),
(94, 32, 'Ảnh hiển thị', '32-1.jpg', 'thumbnail'),
(95, 32, 'Ảnh 1', '32-2.jpg', ''),
(96, 32, 'Ảnh 2', '32-3.jpg', ''),
(97, 33, 'Ảnh hiển thị', '33-1.jpg', 'thumbnail'),
(98, 33, 'Ảnh 1', '33-2.jpg', ''),
(99, 33, 'Ảnh 2', '33-3.jpg', ''),
(100, 34, 'Ảnh hiển thị', '34-1.jpg', 'thumbnail'),
(101, 34, 'Ảnh 1', '34-2.jpg', ''),
(102, 34, 'Ảnh 2', '34-3.jpg', ''),
(103, 35, 'Ảnh hiển thị', '35-1.jpg', 'thumbnail'),
(104, 35, 'Ảnh 1', '35-2.jpg', ''),
(105, 35, 'Ảnh 2', '35-3.jpg', ''),
(106, 36, 'Ảnh hiển thị', '36-1.jpg', 'thumbnail'),
(107, 36, 'Ảnh 1', '36-2.jpg', ''),
(108, 36, 'Ảnh 2', '36-3.jpg', ''),
(109, 37, 'Ảnh hiển thị', '37-1.jpg', 'thumbnail'),
(110, 37, 'Ảnh 1', '37-2.jpg', ''),
(111, 37, 'Ảnh 2', '37-3.jpg', ''),
(112, 38, 'Ảnh hiển thị', '38-1.jpg', 'thumbnail'),
(113, 38, 'Ảnh 1', '38-2.jpg', ''),
(114, 38, 'Ảnh 2', '38-3.jpg', ''),
(115, 39, 'Ảnh hiển thị', '39-1.jpg', 'thumbnail'),
(116, 39, 'Ảnh 1', '39-2.jpg', ''),
(117, 39, 'Ảnh 2', '39-3.jpg', ''),
(118, 40, 'Ảnh hiển thị', '40-1.jpg', 'thumbnail'),
(119, 40, 'Ảnh 1', '40-2.jpg', ''),
(120, 40, 'Ảnh 2', '40-3.jpg', ''),
(121, 41, 'Ảnh hiển thị', '41-1.jpg', 'thumbnail'),
(122, 41, 'Ảnh 1', '41-2.jpg', ''),
(123, 41, 'Ảnh 2', '41-3.jpg', ''),
(124, 42, 'Ảnh hiển thị', '42-1.jpg', 'thumbnail'),
(125, 42, 'Ảnh 1', '42-2.jpg', ''),
(126, 42, 'Ảnh 2', '42-3.jpg', ''),
(127, 43, 'Ảnh hiển thị', '43-1.jpg', 'thumbnail'),
(128, 43, 'Ảnh 1', '43-2.jpg', ''),
(129, 43, 'Ảnh 2', '43-3.jpg', ''),
(130, 44, 'Ảnh hiển thị', '44-1.jpg', 'thumbnail'),
(131, 44, 'Ảnh 1', '44-2.jpg', ''),
(132, 44, 'Ảnh 2', '44-3.jpg', ''),
(133, 45, 'Ảnh hiển thị', '45-1.jpg', 'thumbnail'),
(134, 45, 'Ảnh 1', '45-2.jpg', ''),
(135, 45, 'Ảnh 2', '45-3.jpg', ''),
(136, 46, 'Ảnh hiển thị', '46-1.jpg', 'thumbnail'),
(137, 46, 'Ảnh 1', '46-2.jpg', ''),
(138, 46, 'Ảnh 2', '46-3.jpg', ''),
(139, 47, 'Ảnh hiển thị', '47-1.jpg', 'thumbnail'),
(140, 47, 'Ảnh 1', '47-2.jpg', ''),
(141, 47, 'Ảnh 2', '47-3.jpg', ''),
(142, 48, 'Ảnh hiển thị', '48-1.jpg', 'thumbnail'),
(143, 48, 'Ảnh 1', '48-2.jpg', ''),
(144, 48, 'Ảnh 2', '48-3.jpg', ''),
(145, 49, 'Ảnh hiển thị', '49-1.jpg', 'thumbnail'),
(146, 49, 'Ảnh 1', '49-2.jpg', ''),
(147, 49, 'Ảnh 2', '49-3.jpg', ''),
(148, 50, 'Ảnh hiển thị', '50-1.jpg', 'thumbnail'),
(149, 50, 'Ảnh 1', '50-2.jpg', ''),
(150, 50, 'Ảnh 2', '50-3.jpg', ''),
(151, 51, 'Ảnh hiển thị', '51-1.jpg', 'thumbnail'),
(154, 52, 'Ảnh hiển thị', '52-1.jpg', 'thumbnail'),
(155, 52, 'Ảnh 1', '52-2.jpg', ''),
(156, 52, 'Ảnh 2', '52-3.jpg', ''),
(157, 53, 'Ảnh hiển thị', '53-1.jpg', 'thumbnail'),
(158, 53, 'Ảnh 1', '53-2.jpg', ''),
(159, 53, 'Ảnh 2', '53-3.jpg', ''),
(160, 54, 'Ảnh hiển thị', '54-1.jpg', 'thumbnail'),
(161, 54, 'Ảnh 1', '54-2.jpg', ''),
(162, 54, 'Ảnh 2', '54-3.jpg', ''),
(163, 55, 'Ảnh hiển thị', '55-1.jpg', 'thumbnail'),
(164, 55, 'Ảnh 1', '55-2.jpg', ''),
(165, 55, 'Ảnh 2', '55-3.jpg', ''),
(166, 56, 'Ảnh hiển thị', '56-1.jpg', 'thumbnail'),
(167, 56, 'Ảnh 1', '56-2.jpg', ''),
(168, 56, 'Ảnh 2', '56-3.jpg', ''),
(169, 57, 'Ảnh hiển thị', '57-1.jpg', 'thumbnail'),
(170, 57, 'Ảnh 1', '57-2.jpg', ''),
(171, 57, 'Ảnh 2', '57-3.jpg', ''),
(172, 58, 'Ảnh hiển thị', '58-1.jpg', 'thumbnail'),
(173, 58, 'Ảnh 1', '58-2.jpg', ''),
(174, 58, 'Ảnh 2', '58-3.jpg', ''),
(175, 59, 'Ảnh hiển thị', '59-1.jpg', 'thumbnail'),
(176, 59, 'Ảnh 1', '59-2.jpg', ''),
(177, 59, 'Ảnh 2', '59-3.jpg', ''),
(178, 60, 'Ảnh hiển thị', '60-1.jpg', 'thumbnail'),
(179, 60, 'Ảnh 1', '60-2.jpg', ''),
(180, 60, 'Ảnh 2', '60-3.jpg', ''),
(181, 61, 'Ảnh hiển thị', '61-1.jpg', 'thumbnail'),
(182, 61, 'Ảnh 1', '61-2.jpg', ''),
(183, 61, 'Ảnh 2', '61-3.jpg', ''),
(184, 62, 'Ảnh hiển thị', '62-1.jpg', 'thumbnail'),
(185, 62, 'Ảnh 1', '62-2.jpg', ''),
(186, 62, 'Ảnh 2', '62-3.jpg', ''),
(187, 63, 'Ảnh hiển thị', '63-1.jpg', 'thumbnail'),
(188, 63, 'Ảnh 1', '63-2.jpg', ''),
(189, 63, 'Ảnh 2', '63-3.jpg', ''),
(190, 64, 'Ảnh hiển thị', '64-1.jpg', 'thumbnail'),
(191, 64, 'Ảnh 1', '64-2.jpg', ''),
(192, 64, 'Ảnh 2', '64-3.jpg', ''),
(193, 65, 'Ảnh hiển thị', '65-1.jpg', 'thumbnail'),
(194, 65, 'Ảnh 1', '65-2.jpg', ''),
(195, 65, 'Ảnh 2', '65-3.jpg', ''),
(196, 66, 'Ảnh hiển thị', '66-1.jpg', 'thumbnail'),
(197, 66, 'Ảnh 1', '66-2.jpg', ''),
(198, 66, 'Ảnh 2', '66-3.jpg', ''),
(199, 67, 'Ảnh hiển thị', '67-1.jpg', 'thumbnail'),
(200, 67, 'Ảnh 1', '67-2.jpg', ''),
(201, 67, 'Ảnh 2', '67-3.jpg', ''),
(202, 68, 'Ảnh hiển thị', '68-1.jpg', 'thumbnail'),
(203, 68, 'Ảnh 1', '68-2.jpg', ''),
(204, 68, 'Ảnh 2', '68-3.jpg', ''),
(205, 69, 'Ảnh hiển thị', '69-1.jpg', 'thumbnail'),
(206, 69, 'Ảnh 1', '69-2.jpg', ''),
(207, 69, 'Ảnh 2', '69-3.jpg', ''),
(208, 70, 'Ảnh hiển thị', '70-1.jpg', 'thumbnail'),
(209, 70, 'Ảnh 1', '70-2.jpg', ''),
(210, 70, 'Ảnh 2', '70-3.jpg', ''),
(211, 71, 'Ảnh hiển thị', '71-1.jpg', 'thumbnail'),
(212, 71, 'Ảnh 1', '71-2.jpg', ''),
(213, 71, 'Ảnh 2', '71-3.jpg', ''),
(214, 72, 'Ảnh hiển thị', '72-1.jpg', 'thumbnail'),
(215, 72, 'Ảnh 1', '72-2.jpg', ''),
(216, 72, 'Ảnh 2', '72-3.jpg', ''),
(217, 73, 'Ảnh hiển thị', '73-1.jpg', 'thumbnail'),
(218, 73, 'Ảnh 1', '73-2.jpg', ''),
(219, 73, 'Ảnh 2', '73-3.jpg', ''),
(220, 74, 'Ảnh hiển thị', '74-1.jpg', 'thumbnail'),
(221, 74, 'Ảnh 1', '74-2.jpg', ''),
(222, 74, 'Ảnh 2', '74-3.jpg', ''),
(223, 75, 'Ảnh hiển thị', '75-1.jpg', 'thumbnail'),
(224, 75, 'Ảnh 1', '75-2.jpg', ''),
(225, 75, 'Ảnh 2', '75-3.jpg', ''),
(226, 76, 'Ảnh hiển thị', '76-1.jpg', 'thumbnail'),
(227, 76, 'Ảnh 1', '76-2.jpg', ''),
(228, 76, 'Ảnh 2', '76-3.jpg', ''),
(229, 77, 'Ảnh hiển thị', '77-1.jpg', 'thumbnail'),
(230, 77, 'Ảnh 1', '77-2.jpg', ''),
(231, 77, 'Ảnh 2', '77-3.jpg', ''),
(232, 78, 'Ảnh hiển thị', '78-1.jpg', 'thumbnail'),
(233, 78, 'Ảnh 1', '78-2.jpg', ''),
(234, 78, 'Ảnh 2', '78-3.jpg', ''),
(235, 79, 'Ảnh hiển thị', '79-1.jpg', 'thumbnail'),
(236, 79, 'Ảnh 1', '79-2.jpg', ''),
(237, 79, 'Ảnh 2', '79-3.jpg', ''),
(238, 80, 'Ảnh hiển thị', '80-1.jpg', 'thumbnail'),
(239, 80, 'Ảnh 1', '80-2.jpg', ''),
(240, 80, 'Ảnh 2', '80-3.jpg', ''),
(241, 81, 'Ảnh hiển thị', '81-1.jpg', 'thumbnail'),
(242, 81, 'Ảnh 1', '81-2.jpg', ''),
(243, 81, 'Ảnh 2', '81-3.jpg', ''),
(244, 82, 'Ảnh hiển thị', '82-1.jpg', 'thumbnail'),
(245, 82, 'Ảnh 1', '82-2.jpg', ''),
(246, 82, 'Ảnh 2', '82-3.jpg', ''),
(247, 83, 'Ảnh hiển thị', '83-1.jpg', 'thumbnail'),
(248, 83, 'Ảnh 1', '83-2.jpg', ''),
(249, 83, 'Ảnh 2', '83-3.jpg', ''),
(250, 84, 'Ảnh hiển thị', '84-1.jpg', 'thumbnail'),
(251, 84, 'Ảnh 1', '84-2.jpg', ''),
(252, 84, 'Ảnh 2', '84-3.jpg', ''),
(253, 85, 'Ảnh hiển thị', '85-1.jpg', 'thumbnail'),
(254, 85, 'Ảnh 1', '85-2.jpg', ''),
(255, 85, 'Ảnh 2', '85-3.jpg', ''),
(256, 86, 'Ảnh hiển thị', '86-1.jpg', 'thumbnail'),
(257, 86, 'Ảnh 1', '86-2.jpg', ''),
(258, 86, 'Ảnh 2', '86-3.jpg', ''),
(259, 87, 'Ảnh hiển thị', '87-1.jpg', 'thumbnail'),
(260, 87, 'Ảnh 1', '87-2.jpg', ''),
(261, 87, 'Ảnh 2', '87-3.jpg', ''),
(262, 88, 'Ảnh hiển thị', '88-1.jpg', 'thumbnail'),
(263, 88, 'Ảnh 1', '88-2.jpg', ''),
(264, 88, 'Ảnh 2', '88-3.jpg', ''),
(265, 89, 'Ảnh hiển thị', '89-1.jpg', 'thumbnail'),
(266, 89, 'Ảnh 1', '89-2.jpg', ''),
(267, 89, 'Ảnh 2', '89-3.jpg', ''),
(268, 90, 'Ảnh hiển thị', '90-1.jpg', 'thumbnail'),
(269, 90, 'Ảnh 1', '90-2.jpg', ''),
(270, 90, 'Ảnh 2', '90-3.jpg', ''),
(271, 91, 'Ảnh hiển thị', '91-1.jpg', 'thumbnail'),
(272, 91, 'Ảnh 1', '91-2.jpg', ''),
(273, 91, 'Ảnh 2', '91-3.jpg', ''),
(274, 92, 'Ảnh hiển thị', '92-1.jpg', 'thumbnail'),
(275, 92, 'Ảnh 1', '92-2.jpg', ''),
(276, 92, 'Ảnh 2', '92-3.jpg', ''),
(277, 93, 'Ảnh hiển thị', '93-1.jpg', 'thumbnail'),
(278, 93, 'Ảnh 1', '93-2.jpg', ''),
(279, 93, 'Ảnh 2', '93-3.jpg', ''),
(280, 94, 'Ảnh hiển thị', '94-1.jpg', 'thumbnail'),
(281, 94, 'Ảnh 1', '94-2.jpg', ''),
(282, 94, 'Ảnh 2', '94-3.jpg', ''),
(283, 95, 'Ảnh hiển thị', '95-1.jpg', 'thumbnail'),
(284, 95, 'Ảnh 1', '95-2.jpg', ''),
(285, 95, 'Ảnh 2', '95-3.jpg', ''),
(286, 96, 'Ảnh hiển thị', '96-1.jpg', 'thumbnail'),
(287, 96, 'Ảnh 1', '96-2.jpg', ''),
(288, 96, 'Ảnh 2', '96-3.jpg', ''),
(289, 97, 'Ảnh hiển thị', '97-1.jpg', 'thumbnail'),
(290, 97, 'Ảnh 1', '97-2.jpg', ''),
(291, 97, 'Ảnh 2', '97-3.jpg', ''),
(292, 98, 'Ảnh hiển thị', '98-1.jpg', 'thumbnail'),
(293, 98, 'Ảnh 1', '98-2.jpg', ''),
(294, 98, 'Ảnh 2', '98-3.jpg', ''),
(295, 99, 'Ảnh hiển thị', '99-1.jpg', 'thumbnail'),
(296, 99, 'Ảnh 1', '99-2.jpg', ''),
(297, 99, 'Ảnh 2', '99-3.jpg', ''),
(298, 100, 'Ảnh hiển thị', '100-1.jpg', 'thumbnail'),
(299, 100, 'Ảnh 1', '100-2.jpg', ''),
(300, 100, 'Ảnh 2', '100-3.jpg', ''),
(301, 101, 'Ảnh hiển thị', '101-1.jpg', 'thumbnail'),
(302, 101, 'Ảnh 1', '101-2.jpg', ''),
(303, 101, 'Ảnh 2', '101-3.jpg', ''),
(304, 102, 'Ảnh hiển thị', '102-1.jpg', 'thumbnail'),
(305, 102, 'Ảnh 1', '102-2.jpg', ''),
(306, 102, 'Ảnh 2', '102-3.jpg', ''),
(307, 103, 'Ảnh hiển thị', '103-1.jpg', 'thumbnail'),
(308, 103, 'Ảnh 1', '103-2.jpg', ''),
(309, 103, 'Ảnh 2', '103-3.jpg', ''),
(310, 104, 'Ảnh hiển thị', '104-1.jpg', 'thumbnail'),
(311, 104, 'Ảnh 1', '104-2.jpg', ''),
(312, 104, 'Ảnh 2', '104-3.jpg', ''),
(313, 105, 'Ảnh hiển thị', '105-1.jpg', 'thumbnail'),
(314, 105, 'Ảnh 1', '105-2.jpg', ''),
(315, 105, 'Ảnh 2', '105-3.jpg', ''),
(316, 106, 'Ảnh hiển thị', '106-1.jpg', 'thumbnail'),
(317, 106, 'Ảnh 1', '106-2.jpg', ''),
(318, 106, 'Ảnh 2', '106-3.jpg', ''),
(319, 107, 'Ảnh hiển thị', '107-1.jpg', 'thumbnail'),
(320, 107, 'Ảnh 1', '107-2.jpg', ''),
(321, 107, 'Ảnh 2', '107-3.jpg', ''),
(322, 108, 'Ảnh hiển thị', '108-1.jpg', 'thumbnail'),
(323, 108, 'Ảnh 1', '108-2.jpg', ''),
(324, 108, 'Ảnh 2', '108-3.jpg', ''),
(325, 109, 'Ảnh hiển thị', '109-1.jpg', 'thumbnail'),
(326, 109, 'Ảnh 1', '109-2.jpg', ''),
(327, 109, 'Ảnh 2', '109-3.jpg', ''),
(328, 110, 'Ảnh hiển thị', '110-1.jpg', 'thumbnail'),
(329, 110, 'Ảnh 1', '110-2.jpg', ''),
(330, 110, 'Ảnh 2', '110-3.jpg', ''),
(331, 111, 'Ảnh hiển thị', '111-1.jpg', 'thumbnail'),
(332, 111, 'Ảnh 1', '111-2.jpg', ''),
(333, 111, 'Ảnh 2', '111-3.jpg', ''),
(334, 112, 'Ảnh hiển thị', '112-1.jpg', 'thumbnail'),
(335, 112, 'Ảnh 1', '112-2.jpg', ''),
(336, 112, 'Ảnh 2', '112-3.jpg', ''),
(337, 113, 'Ảnh hiển thị', '113-1.jpg', 'thumbnail'),
(338, 113, 'Ảnh 1', '113-2.jpg', ''),
(339, 113, 'Ảnh 2', '113-3.jpg', ''),
(340, 114, 'Ảnh hiển thị', '114-1.jpg', 'thumbnail'),
(341, 114, 'Ảnh 1', '114-2.jpg', ''),
(342, 114, 'Ảnh 2', '114-3.jpg', ''),
(343, 115, 'Ảnh hiển thị', '115-1.jpg', 'thumbnail'),
(344, 115, 'Ảnh 1', '115-2.jpg', ''),
(345, 115, 'Ảnh 2', '115-3.jpg', ''),
(346, 116, 'Ảnh hiển thị', '116-1.jpg', 'thumbnail'),
(347, 116, 'Ảnh 1', '116-2.jpg', ''),
(348, 116, 'Ảnh 2', '116-3.jpg', ''),
(349, 117, 'Ảnh hiển thị', '117-1.jpg', 'thumbnail'),
(350, 117, 'Ảnh 1', '117-2.jpg', ''),
(351, 117, 'Ảnh 2', '117-3.jpg', ''),
(352, 118, 'Ảnh hiển thị', '118-1.jpg', 'thumbnail'),
(353, 118, 'Ảnh 1', '118-2.jpg', ''),
(354, 118, 'Ảnh 2', '118-3.jpg', ''),
(355, 119, 'Ảnh hiển thị', '119-1.jpg', 'thumbnail'),
(356, 119, 'Ảnh 1', '119-2.jpg', ''),
(357, 119, 'Ảnh 2', '119-3.jpg', ''),
(358, 120, 'Ảnh hiển thị', '120-1.jpg', 'thumbnail'),
(359, 120, 'Ảnh 1', '120-2.jpg', ''),
(360, 120, 'Ảnh 2', '120-3.jpg', ''),
(361, 121, 'Ảnh hiển thị', '121-1.jpg', 'thumbnail'),
(362, 121, 'Ảnh 1', '121-2.jpg', ''),
(363, 121, 'Ảnh 2', '121-3.jpg', ''),
(364, 122, 'Ảnh hiển thị', '122-1.jpg', 'thumbnail'),
(365, 122, 'Ảnh 1', '122-2.jpg', ''),
(366, 122, 'Ảnh 2', '122-3.jpg', ''),
(367, 123, 'Ảnh hiển thị', '123-1.jpg', 'thumbnail'),
(368, 123, 'Ảnh 1', '123-2.jpg', ''),
(369, 123, 'Ảnh 2', '123-3.jpg', ''),
(370, 124, 'Ảnh hiển thị', '124-1.jpg', 'thumbnail'),
(371, 124, 'Ảnh 1', '124-2.jpg', ''),
(372, 124, 'Ảnh 2', '124-3.jpg', ''),
(373, 125, 'Ảnh hiển thị', '125-1.jpg', 'thumbnail'),
(374, 125, 'Ảnh 1', '125-2.jpg', ''),
(375, 125, 'Ảnh 2', '125-3.jpg', ''),
(376, 126, 'Ảnh hiển thị', '126-1.jpg', 'thumbnail'),
(377, 126, 'Ảnh 1', '126-2.jpg', ''),
(378, 126, 'Ảnh 2', '126-3.jpg', ''),
(379, 127, 'Ảnh hiển thị', '127-1.jpg', 'thumbnail'),
(380, 127, 'Ảnh 1', '127-2.jpg', ''),
(381, 127, 'Ảnh 2', '127-3.jpg', ''),
(382, 128, 'Ảnh hiển thị', '128-1.jpg', 'thumbnail'),
(383, 128, 'Ảnh 1', '128-2.jpg', ''),
(384, 128, 'Ảnh 2', '128-3.jpg', ''),
(385, 129, 'Ảnh hiển thị', '129-1.jpg', 'thumbnail'),
(386, 129, 'Ảnh 1', '129-2.jpg', ''),
(387, 129, 'Ảnh 2', '129-3.jpg', ''),
(388, 130, 'Ảnh hiển thị', '130-1.jpg', 'thumbnail'),
(389, 130, 'Ảnh 1', '130-2.jpg', ''),
(390, 130, 'Ảnh 2', '130-3.jpg', ''),
(391, 131, 'Ảnh hiển thị', '131-1.jpg', 'thumbnail'),
(392, 131, 'Ảnh 1', '131-2.jpg', ''),
(393, 131, 'Ảnh 2', '131-3.jpg', ''),
(394, 132, 'Ảnh hiển thị', '132-1.jpg', 'thumbnail'),
(395, 132, 'Ảnh 1', '132-2.jpg', ''),
(396, 132, 'Ảnh 2', '132-3.jpg', ''),
(397, 133, 'Ảnh hiển thị', '133-1.jpg', 'thumbnail'),
(398, 133, 'Ảnh 1', '133-2.jpg', ''),
(399, 133, 'Ảnh 2', '133-3.jpg', ''),
(400, 134, 'Ảnh hiển thị', '134-1.jpg', 'thumbnail'),
(401, 134, 'Ảnh 1', '134-2.jpg', ''),
(402, 134, 'Ảnh 2', '134-3.jpg', ''),
(403, 135, 'Ảnh hiển thị', '135-1.jpg', 'thumbnail'),
(404, 135, 'Ảnh 1', '135-2.jpg', ''),
(405, 135, 'Ảnh 2', '135-3.jpg', ''),
(406, 136, 'Ảnh hiển thị', '136-1.jpg', 'thumbnail'),
(407, 136, 'Ảnh 1', '136-2.jpg', ''),
(408, 136, 'Ảnh 2', '136-3.jpg', ''),
(409, 137, 'Ảnh hiển thị', '137-1.jpg', 'thumbnail'),
(410, 137, 'Ảnh 1', '137-2.jpg', ''),
(411, 137, 'Ảnh 2', '137-3.jpg', ''),
(412, 138, 'Ảnh hiển thị', '138-1.jpg', 'thumbnail'),
(413, 138, 'Ảnh 1', '138-2.jpg', ''),
(414, 138, 'Ảnh 2', '138-3.jpg', ''),
(415, 139, 'Ảnh hiển thị', '139-1.jpg', 'thumbnail'),
(416, 139, 'Ảnh 1', '139-2.jpg', ''),
(417, 139, 'Ảnh 2', '139-3.jpg', ''),
(418, 140, 'Ảnh hiển thị', '140-1.jpg', 'thumbnail'),
(419, 140, 'Ảnh 1', '140-2.jpg', ''),
(420, 140, 'Ảnh 2', '140-3.jpg', ''),
(421, 141, 'Ảnh hiển thị', '141-1.jpg', 'thumbnail'),
(422, 141, 'Ảnh 1', '141-2.jpg', ''),
(423, 141, 'Ảnh 2', '141-3.jpg', ''),
(424, 142, 'Ảnh hiển thị', '142-1.jpg', 'thumbnail'),
(425, 142, 'Ảnh 1', '142-2.jpg', ''),
(426, 142, 'Ảnh 2', '142-3.jpg', ''),
(427, 143, 'Ảnh hiển thị', '143-1.jpg', 'thumbnail'),
(428, 143, 'Ảnh 1', '143-2.jpg', ''),
(429, 143, 'Ảnh 2', '143-3.jpg', ''),
(430, 144, 'Ảnh hiển thị', '144-1.jpg', 'thumbnail'),
(431, 144, 'Ảnh 1', '144-2.jpg', ''),
(432, 144, 'Ảnh 2', '144-3.jpg', ''),
(433, 145, 'Ảnh hiển thị', '145-1.jpg', 'thumbnail'),
(434, 145, 'Ảnh 1', '145-2.jpg', ''),
(435, 145, 'Ảnh 2', '145-3.jpg', ''),
(436, 146, 'Ảnh hiển thị', '146-1.jpg', 'thumbnail'),
(437, 146, 'Ảnh 1', '146-2.jpg', ''),
(438, 146, 'Ảnh 2', '146-3.jpg', ''),
(439, 147, 'Ảnh hiển thị', '147-1.jpg', 'thumbnail'),
(440, 147, 'Ảnh 1', '147-2.jpg', ''),
(441, 147, 'Ảnh 2', '147-3.jpg', ''),
(442, 148, 'Ảnh hiển thị', '148-1.jpg', 'thumbnail'),
(443, 148, 'Ảnh 1', '148-2.jpg', ''),
(444, 148, 'Ảnh 2', '148-3.jpg', ''),
(445, 149, 'Ảnh hiển thị', '149-1.jpg', 'thumbnail'),
(446, 149, 'Ảnh 1', '149-2.jpg', ''),
(447, 149, 'Ảnh 2', '149-3.jpg', ''),
(448, 150, 'Ảnh hiển thị', '150-1.jpg', 'thumbnail'),
(449, 150, 'Ảnh 1', '150-2.jpg', ''),
(450, 150, 'Ảnh 2', '150-3.jpg', ''),
(451, 151, 'Ảnh hiển thị', '151-1.jpg', 'thumbnail'),
(452, 151, 'Ảnh 1', '151-2.jpg', ''),
(453, 151, 'Ảnh 2', '151-3.jpg', ''),
(454, 152, 'Ảnh hiển thị', '152-1.jpg', 'thumbnail'),
(455, 152, 'Ảnh 1', '152-2.jpg', ''),
(456, 152, 'Ảnh 2', '152-3.jpg', ''),
(457, 153, 'Ảnh hiển thị', '153-1.jpg', 'thumbnail'),
(458, 153, 'Ảnh 1', '153-2.jpg', ''),
(459, 153, 'Ảnh 2', '153-3.jpg', ''),
(460, 154, 'Ảnh hiển thị', '154-1.jpg', 'thumbnail'),
(461, 154, 'Ảnh 1', '154-2.jpg', ''),
(462, 154, 'Ảnh 2', '154-3.jpg', ''),
(463, 155, 'Ảnh hiển thị', '155-1.jpg', 'thumbnail'),
(464, 155, 'Ảnh 1', '155-2.jpg', ''),
(465, 155, 'Ảnh 2', '155-3.jpg', ''),
(466, 156, 'Ảnh hiển thị', '156-1.jpg', 'thumbnail'),
(467, 156, 'Ảnh 1', '156-2.jpg', ''),
(468, 156, 'Ảnh 2', '156-3.jpg', ''),
(469, 157, 'Ảnh hiển thị', '157-1.jpg', 'thumbnail'),
(470, 157, 'Ảnh 1', '157-2.jpg', ''),
(471, 157, 'Ảnh 2', '157-3.jpg', ''),
(472, 158, 'Ảnh hiển thị', '158-1.jpg', 'thumbnail'),
(473, 158, 'Ảnh 1', '158-2.jpg', ''),
(474, 158, 'Ảnh 2', '158-3.jpg', ''),
(475, 159, 'Ảnh hiển thị', '159-1.jpg', 'thumbnail'),
(476, 159, 'Ảnh 1', '159-2.jpg', ''),
(477, 159, 'Ảnh 2', '159-3.jpg', ''),
(478, 160, 'Ảnh hiển thị', '160-1.jpg', 'thumbnail'),
(479, 160, 'Ảnh 1', '160-2.jpg', ''),
(480, 160, 'Ảnh 2', '160-3.jpg', ''),
(481, 161, 'Ảnh hiển thị', '161-1.jpg', 'thumbnail'),
(482, 161, 'Ảnh 1', '161-2.jpg', ''),
(483, 161, 'Ảnh 2', '161-3.jpg', ''),
(484, 162, 'Ảnh hiển thị', '162-1.jpg', 'thumbnail'),
(485, 162, 'Ảnh 1', '162-2.jpg', ''),
(486, 162, 'Ảnh 2', '162-3.jpg', ''),
(487, 163, 'Ảnh hiển thị', '163-1.jpg', 'thumbnail'),
(488, 163, 'Ảnh 1', '163-2.jpg', ''),
(489, 163, 'Ảnh 2', '163-3.jpg', ''),
(490, 164, 'Ảnh hiển thị', '164-1.jpg', 'thumbnail'),
(491, 164, 'Ảnh 1', '164-2.jpg', ''),
(492, 164, 'Ảnh 2', '164-3.jpg', ''),
(493, 165, 'Ảnh hiển thị', '165-1.jpg', 'thumbnail'),
(494, 165, 'Ảnh 1', '165-2.jpg', ''),
(495, 165, 'Ảnh 2', '165-3.jpg', ''),
(496, 166, 'Ảnh hiển thị', '166-1.jpg', 'thumbnail'),
(497, 166, 'Ảnh 1', '166-2.jpg', ''),
(498, 166, 'Ảnh 2', '166-3.jpg', ''),
(499, 167, 'Ảnh hiển thị', '167-1.jpg', 'thumbnail'),
(500, 167, 'Ảnh 1', '167-2.jpg', ''),
(501, 167, 'Ảnh 2', '167-3.jpg', ''),
(502, 168, 'Ảnh hiển thị', '168-1.jpg', 'thumbnail'),
(503, 168, 'Ảnh 1', '168-2.jpg', ''),
(504, 168, 'Ảnh 2', '168-3.jpg', ''),
(505, 169, 'Ảnh hiển thị', '169-1.jpg', 'thumbnail'),
(506, 169, 'Ảnh 1', '169-2.jpg', ''),
(507, 169, 'Ảnh 2', '169-3.jpg', ''),
(508, 170, 'Ảnh hiển thị', '170-1.jpg', 'thumbnail'),
(509, 170, 'Ảnh 1', '170-2.jpg', ''),
(510, 170, 'Ảnh 2', '170-3.jpg', ''),
(511, 171, 'Ảnh hiển thị', '171-1.jpg', 'thumbnail'),
(512, 171, 'Ảnh 1', '171-2.jpg', ''),
(513, 171, 'Ảnh 2', '171-3.jpg', ''),
(514, 172, 'Ảnh hiển thị', '172-1.jpg', 'thumbnail'),
(515, 172, 'Ảnh 1', '172-2.jpg', ''),
(516, 172, 'Ảnh 2', '172-3.jpg', ''),
(517, 173, 'Ảnh hiển thị', '173-1.jpg', 'thumbnail'),
(518, 173, 'Ảnh 1', '173-2.jpg', ''),
(519, 173, 'Ảnh 2', '173-3.jpg', ''),
(520, 174, 'Ảnh hiển thị', '174-1.jpg', 'thumbnail'),
(521, 174, 'Ảnh 1', '174-2.jpg', ''),
(522, 174, 'Ảnh 2', '174-3.jpg', ''),
(523, 175, 'Ảnh hiển thị', '175-1.jpg', 'thumbnail'),
(524, 175, 'Ảnh 1', '175-2.jpg', ''),
(525, 175, 'Ảnh 2', '175-3.jpg', ''),
(526, 176, 'Ảnh hiển thị', '176-1.jpg', 'thumbnail'),
(527, 176, 'Ảnh 1', '176-2.jpg', ''),
(528, 176, 'Ảnh 2', '176-3.jpg', ''),
(529, 177, 'Ảnh hiển thị', '177-1.jpg', 'thumbnail'),
(530, 177, 'Ảnh 1', '177-2.jpg', ''),
(531, 177, 'Ảnh 2', '177-3.jpg', ''),
(532, 178, 'Ảnh hiển thị', '178-1.jpg', 'thumbnail'),
(533, 178, 'Ảnh 1', '178-2.jpg', ''),
(534, 178, 'Ảnh 2', '178-3.jpg', ''),
(535, 179, 'Ảnh hiển thị', '179-1.jpg', 'thumbnail'),
(536, 179, 'Ảnh 1', '179-2.jpg', ''),
(537, 179, 'Ảnh 2', '179-3.jpg', ''),
(538, 180, 'Ảnh hiển thị', '180-1.jpg', 'thumbnail'),
(539, 180, 'Ảnh 1', '180-2.jpg', ''),
(540, 180, 'Ảnh 2', '180-3.jpg', ''),
(541, 181, 'Ảnh hiển thị', '181-1.jpg', 'thumbnail'),
(542, 181, 'Ảnh 1', '181-2.jpg', ''),
(543, 181, 'Ảnh 2', '181-3.jpg', ''),
(544, 182, 'Ảnh hiển thị', '182-1.jpg', 'thumbnail'),
(545, 182, 'Ảnh 1', '182-2.jpg', ''),
(546, 182, 'Ảnh 2', '182-3.jpg', ''),
(547, 183, 'Ảnh hiển thị', '183-1.jpg', 'thumbnail'),
(548, 183, 'Ảnh 1', '183-2.jpg', ''),
(549, 183, 'Ảnh 2', '183-3.jpg', ''),
(550, 184, 'Ảnh hiển thị', '184-1.jpg', 'thumbnail'),
(551, 184, 'Ảnh 1', '184-2.jpg', ''),
(552, 184, 'Ảnh 2', '184-3.jpg', ''),
(553, 185, 'Ảnh hiển thị', '185-1.jpg', 'thumbnail'),
(554, 185, 'Ảnh 1', '185-2.jpg', ''),
(555, 185, 'Ảnh 2', '185-3.jpg', ''),
(556, 186, 'Ảnh hiển thị', '186-1.jpg', 'thumbnail'),
(557, 186, 'Ảnh 1', '186-2.jpg', ''),
(558, 186, 'Ảnh 2', '186-3.jpg', ''),
(559, 187, 'Ảnh hiển thị', '187-1.jpg', 'thumbnail'),
(560, 187, 'Ảnh 1', '187-2.jpg', ''),
(561, 187, 'Ảnh 2', '187-3.jpg', ''),
(562, 188, 'Ảnh hiển thị', '188-1.jpg', 'thumbnail'),
(563, 188, 'Ảnh 1', '188-2.jpg', ''),
(564, 188, 'Ảnh 2', '188-3.jpg', ''),
(565, 189, 'Ảnh hiển thị', '189-1.jpg', 'thumbnail'),
(566, 189, 'Ảnh 1', '189-2.jpg', ''),
(567, 189, 'Ảnh 2', '189-3.jpg', ''),
(568, 190, 'Ảnh hiển thị', '190-1.jpg', 'thumbnail'),
(569, 190, 'Ảnh 1', '190-2.jpg', ''),
(570, 190, 'Ảnh 2', '190-3.jpg', ''),
(571, 191, 'Ảnh hiển thị', '191-1.jpg', 'thumbnail'),
(572, 191, 'Ảnh 1', '191-2.jpg', ''),
(573, 191, 'Ảnh 2', '191-3.jpg', ''),
(574, 192, 'Ảnh hiển thị', '192-1.jpg', 'thumbnail'),
(575, 192, 'Ảnh 1', '192-2.jpg', ''),
(576, 192, 'Ảnh 2', '192-3.jpg', ''),
(577, 193, 'Ảnh hiển thị', '193-1.jpg', 'thumbnail'),
(578, 193, 'Ảnh 1', '193-2.jpg', ''),
(579, 193, 'Ảnh 2', '193-3.jpg', ''),
(580, 194, 'Ảnh hiển thị', '194-1.jpg', 'thumbnail'),
(581, 194, 'Ảnh 1', '194-2.jpg', ''),
(582, 194, 'Ảnh 2', '194-3.jpg', ''),
(583, 195, 'Ảnh hiển thị', '195-1.jpg', 'thumbnail'),
(584, 195, 'Ảnh 1', '195-2.jpg', ''),
(585, 195, 'Ảnh 2', '195-3.jpg', ''),
(586, 196, 'Ảnh hiển thị', '196-1.jpg', 'thumbnail'),
(587, 196, 'Ảnh 1', '196-2.jpg', ''),
(588, 196, 'Ảnh 2', '196-3.jpg', ''),
(589, 197, 'Ảnh hiển thị', '197-1.jpg', 'thumbnail'),
(590, 197, 'Ảnh 1', '197-2.jpg', ''),
(591, 197, 'Ảnh 2', '197-3.jpg', ''),
(592, 198, 'Ảnh hiển thị', '198-1.jpg', 'thumbnail'),
(593, 198, 'Ảnh 1', '198-2.jpg', ''),
(594, 198, 'Ảnh 2', '198-3.jpg', ''),
(595, 199, 'Ảnh hiển thị', '199-1.jpg', 'thumbnail'),
(596, 199, 'Ảnh 1', '199-2.jpg', ''),
(597, 199, 'Ảnh 2', '199-3.jpg', ''),
(598, 200, 'Ảnh hiển thị', '200-1.jpg', 'thumbnail'),
(599, 200, 'Ảnh 1', '200-2.jpg', ''),
(600, 200, 'Ảnh 2', '200-3.jpg', ''),
(604, 201, 'Ảnh hiển thị', '201-1.jpg', 'thumbnail'),
(605, 201, 'Ảnh 1', '201-2.jpg', ''),
(606, 201, 'Ảnh 2', '201-3.jpg', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `orderAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date NOT NULL,
  `totalAmount` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `orderDate`, `orderAddress`, `requiredDate`, `shippedDate`, `totalAmount`, `status`) VALUES
(1, 2, '2021-11-19', 'Xóm Pha Le, Huyện Phan Nam, Tỉnh Hà Nam', '2021-11-19', '2021-11-19', 16032000, 'shipping'),
(2, 1, '2021-11-19', 'TDP số 6 , Phường Liên Xá, Huyện Kim Chi, Tỉnh Vĩnh Long', '2021-11-19', '2021-11-19', 8360000, 'shipping'),
(3, 1, '2021-11-19', 'Số 212  , Đường Kim Giang, Hà Nội', '2021-11-19', '2021-11-19', 13373550, 'shipping'),
(4, 5, '2021-11-19', 'Số 112, Đường Lí Tự Trọng , Phường Lê Nam , TP Hải Phòng', '2021-11-19', '2021-11-19', 4074000, 'shipped'),
(5, 5, '2021-11-19', 'TDP Khe Thờ, TT. Vĩnh Hồ, TP Lào Cai', '2021-11-19', '2021-11-19', 6978000, 'shipping'),
(6, 12, '2021-11-19', 'Xóm kiến thành , Can Loc , Ha Tinh', '2021-11-19', '2021-11-19', 9777600, 'shipping'),
(7, 1, '2021-11-19', 'Dia chi thanh toasn', '2021-11-19', '2021-11-19', 6990000, 'shipping'),
(8, 1, '2021-11-19', 'Xóm Mai Phong, Hà Đông ,Hà Nội', '2021-11-19', '2021-11-19', 5616900, 'shipping'),
(9, 1, '2021-11-19', 'Xóm Nam Mỹ, Can Lộc ,Hà Tĩnh', '2021-11-19', '2021-11-19', 5264000, 'shipping');

--
-- Bẫy `orders`
--
DELIMITER $$
CREATE TRIGGER `after_orders_insert` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
UPDATE cart
    SET cart.status = 2 WHERE cart.status = 1 AND cart.id_user = NEW.id_user; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_order_insert` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
	SET NEW.totalAmount = (SELECT SUM(product_variant.price * cart.quantity) FROM cart join product_variant on cart.id_variant = product_variant.id WHERE cart.id_user = NEW.id_user AND cart.status = 1);
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id_order` int(11) NOT NULL,
  `id_variant` int(11) NOT NULL,
  `quantity_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id_order`, `id_variant`, `quantity_product`) VALUES
(1, 797, 2),
(1, 502, 3),
(2, 103, 1),
(2, 30, 3),
(3, 388, 1),
(3, 240, 3),
(4, 281, 1),
(5, 617, 2),
(6, 1271, 3),
(7, 44, 2),
(8, 128, 2),
(8, 39, 1),
(8, 622, 1),
(9, 150, 2),
(9, 101, 2);

--
-- Bẫy `order_details`
--
DELIMITER $$
CREATE TRIGGER `after_orderdetail_insert` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
   	UPDATE product_variant 
    SET quantity = quantity - NEW.quantity_product 
    WHERE product_variant.id = NEW.id_variant;
    UPDATE products
    SET SOLD = SOLD + NEW.quantity_product
    WHERE products.id IN (SELECT id_product FROM product_variant WHERE product_variant.id = NEW.id_variant);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_detail`
--

CREATE TABLE `payment_detail` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` int(11) DEFAULT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_detail`
--

INSERT INTO `payment_detail` (`id`, `payment_type`, `card_id`, `created_at`) VALUES
(1, 'Online', 6, '2021-11-19'),
(2, 'Online', 4, '2021-11-19'),
(3, 'Offline', 1, '2021-11-19'),
(4, 'Offline', 7, '2021-11-19'),
(5, 'Online', 8, '2021-11-19'),
(6, 'Online', 10, '2021-11-19'),
(7, 'Online', 2, '2021-11-19'),
(8, 'Online', 5, '2021-11-19'),
(9, 'Online', 2, '2021-11-19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `sold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `brand_id`, `price`, `discount_id`, `createAt`, `sold`) VALUES
(1, 'Áo sơ mi  full cotton Oxford Gucci', 'Các hình dạng phản ánh phong cách từ những năm 70 được pha trộn và xếp lớp với các bóng bắt nguồn từ bây giờ. Được thiết kế với cổ áo nhọn lấy cảm hứng từ cổ điển và được làm phong phú bởi hình thêu Double G, chiếc áo sơ mi vải cotton Oxford màu xanh nhạt này có viền dưới tròn.', 2, 2, 300000, 1, '2021-11-17 00:00:00', 471),
(2, 'Áo khoác \"Twist & Poches\"', 'Áo khoác bằng chất liệu cashmere không thấm nước với chi tiết \"Twist & poches\" (100% cashmere)', 3, 3, 2630000, 1, '2021-11-17 00:00:00', 100),
(3, 'Váy Prince of Wale', 'Chiếc váy nhỏ kiểu dáng đẹp trong tờ séc của Hoàng tử xứ Wales này mang tính chất khái niệm và được làm từ loại vải gợi nhớ đến trang phục nam giới được thiết kế riêng.', 4, 4, 2746000, 1, '2021-11-17 00:00:00', 88),
(4, 'Quần Adidas Z.N.E', 'Nhắm mắt lại và cảm nhận nhịp độ trận đấu, nguồn năng lượng từ khán đài và nhịp tim dồn dập của bạn. Mang theo cảm giác ấy trong suốt ngày dài. Luôn sảng khoái khi xuống phố với chiếc quần adidas Z.N.E. này. Chất vải dệt kim đôi mềm mại làm từ chất liệu tái chế, là cơ hội để bạn được tiếp sức trước trận đấu lớn tiếp theo.', 5, 5, 2442000, 1, '2021-11-17 00:00:00', 139),
(5, 'Túi da Bellport Tote', 'Với phần cứng kim loại đặc trưng gợi nhớ lại di sản cưỡi ngựa của Polo, chiếc túi tote lớn này đảo ngược từ kiểu cài tóc của Pháp được in trên màn hình với họa tiết da báo sang da lộn xa hoa', 6, 6, 4935000, 1, '2021-11-17 00:00:00', 429),
(6, 'Giày Nike Air Zoom Pegasus', 'Chúng tôi đặt ra mục tiêu giữ cho đôi chân của bạn vừa ấm vừa khô trong điều kiện ẩm ướt, vì vậy chúng tôi đã thêm các chi tiết như lưỡi trai cách nhiệt và phần trên ấm được hoàn thiện bằng lớp phủ phong hóa', 7, 7, 1967000, 1, '2021-11-17 00:00:00', 730),
(7, 'Mũ lưỡi trai logo Medusa', 'Được làm thủ công từ sợi tơ tằm hữu cơ, chiếc nắp sang trọng này có in hình Chữ ký Greca. Theo một nét rất riêng của Versace, thiết kế cũng có một Thẻ Medusa graffiti thể hiện tính hài hước và tính cách nổi loạn của thương hiệu', 8, 8, 3495000, 1, '2021-11-17 00:00:00', 358),
(8, 'Áo thun cổ điển Fendi', 'Áo phông tay ngắn cổ thuyền quá khổ. Làm bằng áo bông trắng.', 1, 9, 5006000, 1, '2021-11-17 00:00:00', 601),
(9, 'Áo sơ mi ngắn tay co giãn nylon', 'Chiếc áo có một đường cắt mới, hiện đại hơn và giản dị hơn. Chất liệu vải pha cotton và nylon thoải mái mang lại những đường nét sạch sẽ của chiếc áo sơ mi này, khiến nó trở thành một trong những trang phục phải có của mùa hè.', 2, 10, 1743000, 1, '2021-11-17 00:00:00', 933),
(10, 'Áo khoác họa tiết khung cửa sổ LV', 'Chiếc áo khoác hơi rộng này mang đến hình ảnh đồ họa về chủ đề Đồng phục của mùa. Được may từ vải pha len, nó được trang trí bằng họa tiết lưới hình học tái tạo hiệu ứng hình ảnh của ô cửa sổ, được tạo ra bằng kỹ thuật devoré. Một lớp lót lụa trơn và các nút kim loại ton-sur-ton làm tăng thêm sự rung cảm.', 3, 1, 557000, 1, '2021-11-17 00:00:00', 861),
(11, 'Váy Jersey với thắt lưng chữ G', 'Mỗi bộ sưu tập tôn vinh di sản của Ngôi nhà đều xuất hiện các lần lặp lại khác nhau của logo. Đối với chiếc váy jersey này, một chiếc thắt lưng khóa chữ G ở thắt lưng gợi nhớ đến tên viết tắt của Người sáng lập Guccio Gucci, tôn vinh nguồn gốc của Gucci.', 4, 2, 4189000, 1, '2021-11-17 00:00:00', 506),
(12, 'Quần chạy bộ Seoul', 'Quần cà rốt trong khoan cotton co giãn (98% cotton và 2% elastane)', 5, 3, 4087000, 1, '2021-11-17 00:00:00', 946),
(13, 'Túi Prada tái bản 2005 chấm bi', 'Một cách giải thích mới cho phong cách Prada mang tính biểu tượng, chiếc túi Re-Edition 2005 được bao phủ bởi một họa tiết chấm bi đính kết được thêu. Thiết kế được làm bằng Re-Nylon sáng tạo, được sản xuất từ ​​tái chế', 6, 4, 4423000, 1, '2021-11-17 00:00:00', 211),
(14, 'Giày Adidas Superstar', 'Đôi khi cần phải khuấy động phong cách. Mang đến nét mới mẻ cho outfit của bạn với đôi giày adidas Superstar này. Pha trộn các chi tiết cổ điển cùng các điểm nhấn sắc màu hiện đại, đôi giày trainer bằng da thanh thoát này trung thành với di sản bóng rổ mà vẫn chuẩn trend đầy táo bạo. Đế cupsole bằng cao su và lót giày đúc mang đến cảm giác thoải mái bất kể bạn đang xuống phố khoe outfit chặt chém hay chỉ đơn giản là tụ tập cùng bạn bè.', 7, 5, 4147000, 1, '2021-11-17 00:00:00', 219),
(15, 'Mũ lưỡi trai thêu hình ngựa', 'Được làm thủ công tại Ý từ sợi bông và len, chiếc mũ bóng này được thêu ở phía trước với biểu tượng Con ngựa đứng độc quyền của Purple Label. Dây đeo bằng da có khóa cài lấy cảm hứng từ cưỡi ngựa làm điểm nhấn ở mặt sau.', 8, 6, 1766000, 1, '2021-11-17 00:00:00', 460),
(16, 'Áo thun thể thao Nike', 'Thêm một chút cá tính cho tủ quần áo của bạn với Áo phông thể thao Nike. Nó có một chi tiết biểu tượng cảm xúc được thêu, thiết kế áo bông và một bộ quần áo vừa vặn để mặc hàng ngày.', 1, 7, 274000, 1, '2021-11-17 00:00:00', 646),
(17, 'Áo sơ mi in logo vải cotton Versace', 'Mang một cách tiếp cận rất Versace đối với trang phục bảo hộ lao động, chiếc áo sơ mi poplin cotton cổ điển này có in logo chéo toàn bộ. Thiết kế kiểu dáng đẹp kết hợp hoàn hảo với đường may đồng màu và cà vạt lụa nổi bật', 2, 8, 2578000, 1, '2021-11-17 00:00:00', 838),
(18, 'Áo khoác len Fendi', 'Áo blazer cắt thẳng với túi ngực và túi vá. Đóng hai bên ngực có nút. Được làm từ sợi len đen pha trộn với họa tiết kẻ sọc và các chi tiết vi mô FF màu xanh lam trong jacquard.', 3, 9, 1064000, 1, '2021-11-17 00:00:00', 261),
(19, 'Váy có thắt lưng, nếp gấp', 'Loại vải bồng bềnh, gợi cảm của mặt hàng này rất phù hợp để mặc vào ban ngày hoặc buổi tối. Phần đóng cửa lệch tâm của nó được che giấu bằng những nếp gấp tinh xảo và được gắn chặt bằng một nút hình vòm độc đáo được phủ bằng vải phù hợp. Một chiếc thắt lưng cùng tông màu giúp tôn lên vòng eo.', 4, 10, 594000, 1, '2021-11-17 00:00:00', 793),
(20, 'Quần jean kẻ caro Damier', 'Họa tiết Damier Azur mang tính biểu tượng của bộ sưu tập đồ da đã nâng tầm một chiếc quần jean ống đứng ở giữa lên thành một tuyên bố chữ ký đồ họa. Được làm từ chất liệu cotton gabardine cổ điển với đường cắt thẳng bình thường để dễ dàng tạo kiểu hàng ngày. Phần cứng bằng đồng thau tạo điểm nhấn bằng kim loại ấm áp và miếng dán Louis Vuitton bằng da tạo thêm nét cuối cùng của Ngôi nhà.', 5, 1, 402000, 1, '2021-11-17 00:00:00', 172),
(21, 'Túi đeo vai Jackie 1961', 'Việc giới thiệu lại túi Jackie cho mùa Thu Đông 2020 thể hiện một cách mới về một biểu tượng lịch sử của Gucci', 6, 2, 1821000, 1, '2021-11-17 00:00:00', 485),
(22, 'Dép sandal Izmir', 'Sandal in calfskin with iconic \"H\" cut-out and raw-edged detail\nAn iconic Hermes style, this silhouette is an essential piece in every wardrobe.', 7, 3, 3216000, 1, '2021-11-17 00:00:00', 912),
(23, 'Mũ xô kim sa Prada', 'Những hạt sequins lấp lánh được thêu khắp nơi tô điểm thêm cho chiếc mũ này những khối lượng mang tính biểu tượng. Sự kết hợp giữa ánh sáng và ánh kim lấp lánh mang đến cho phụ kiện sự quyến rũ đương đại tinh vi.', 8, 4, 2358000, 1, '2021-11-17 00:00:00', 105),
(24, 'Áo thun Comfy and Chill', 'Bạn làm gì để tìm kiếm sự cân bằng? Ngắt mạch và xả hơi? Hay tùy cơ ứng biến? Chiếc áo thun adidas này sẵn sàng cho cả hai phương án.', 1, 5, 113000, 1, '2021-11-17 00:00:00', 781),
(25, 'Áo sơ mi cổ điển phong cách miền Tây Ralph Lauren', 'Phiên bản nhuộm màu may mặc của chiếc áo sơ mi phương Tây mang tính biểu tượng của chúng tôi được làm thủ công từ vải denim cotton và được làm thủ công để tạo ra vẻ ngoài thủ công.', 2, 6, 579000, 1, '2021-11-17 00:00:00', 595),
(26, 'Áo khoác Jordan Jumpman', 'Một món đồ xếp lớp tuyệt vời, chiếc full-zip không tay này được trang bị túi đựng đồ để bảo vệ các vật dụng cần thiết, cùng với vòng chữ D để móc chìa khóa. Sản phẩm này được làm từ ít nhất 75% sợi polyester tái chế.', 3, 7, 418000, 1, '2021-11-17 00:00:00', 630),
(27, 'Váy vải họa tiết Le Greca', 'Được nhìn thấy trên đường băng, chiếc váy mini này có hình dáng lấy cảm hứng từ thập niên 60 - bờ vai khỏe khoắn, đường thắt eo kiểu đế chế và chân váy xòe.', 4, 8, 368000, 1, '2021-11-17 00:00:00', 366),
(28, 'Quần dài len Fendi', 'Quần được cắt thẳng với các đường xếp ly ở phía trước và phần chun co giãn ở hai bên eo. Khóa kéo giấu kín. Làm bằng len đen gabardine. Mảng kim loại trên vòng đai.', 5, 9, 3945000, 1, '2021-11-17 00:00:00', 938),
(29, 'Túi đi chợ dệt vai MyEA', 'Emporio Armani đã đưa ra một chiếc túi chỉ dành cho bạn. MyEA Bag có thể được cá nhân hóa và tùy chỉnh theo bất kỳ cách nào bạn muốn. Chọn phong cách của bạn và tô điểm bằng các phụ kiện phản ánh con người của bạn. Túi xách dệt với lớp lót canvas', 6, 10, 3692000, 1, '2021-11-17 00:00:00', 595),
(30, 'Giày sneaker LV', 'Đôi sneaker LV Trainer đình đám được huyền thoại thời trang đường phố Nhật Bản Nigo thể hiện lại như một phần trong lần hợp tác thứ hai của anh với Giám đốc nghệ thuật của Louis Vuitton, Virgil Abloh. Mặt trên bằng da bê trắng in họa tiết con vịt của bộ sưu tập Louis Vuitton x Nigo, bao gồm đồ da, phụ kiện và đồ may sẵn.', 7, 1, 534000, 1, '2021-11-17 00:00:00', 159),
(31, 'Mũ len Gucci', 'Một giải thích đầy màu sắc của họa tiết GG đặc trưng xác định chiếc mũ len màu xanh lá cây này. Chữ lồng lịch sử - một dấu hiệu dành cho Người sáng lập của House là Guccio Gucci, xuất hiện ở đây với màu xanh lam tương phản, tạo thêm sự tương phản về màu sắc cho thiết kế sôi động.', 8, 2, 5098000, 1, '2021-11-17 00:00:00', 9),
(32, 'Áo thun \"Piqures Sellier\"', 'Áo thun cổ thuyền tay ngắn bằng cotton với chi tiết \"Piqures Sellier\" (100% cotton)\n', 1, 3, 1341000, 1, '2021-11-17 00:00:00', 569),
(33, 'Áo sơ mi cotton Prada', 'Chiếc áo sơ mi kiểu dáng đẹp, sáng tạo này nổi bật với phần đính kết toàn thân tạo ra hiệu ứng ba chiều phát sáng', 2, 4, 5044000, 1, '2021-11-17 00:00:00', 819),
(34, 'Áo khoác Marathon Adidas', 'Trang phục của bạn mang ý nghĩa rất quan trọng. Chiếc áo khoác adidas này làm từ chất liệu tái chế, thể hiện cam kết của adidas hướng tới chấm dứt rác thải nhựa. Hãy tự hào thể hiện phong cách thể thao đầy táo bạo. Bạn đang tạo ra sự khác biệt.\n\nSản phẩm này may bằng vải công nghệ Primegreen, thuộc dòng chất liệu tái chế hiệu năng cao.', 3, 5, 3465000, 1, '2021-11-17 00:00:00', 386),
(35, 'Váy Buffalo Georgette Gown kẻ sọc', 'Là một chữ ký của Polo, vải tuyệt đối georgette của chiếc áo choàng quét sàn này được in với họa tiết kẻ sọc trâu đậm chất lễ hội, trong khi đường viền cổ áo không đối xứng xếp nếp và hình dáng vừa vặn tạo nên nét quyến rũ của nó.', 4, 6, 3785000, 1, '2021-11-17 00:00:00', 474),
(36, 'Quần Nike Essential', 'Quần Nike Essential được cập nhật bằng vật liệu tái chế và có nhiều độ co giãn, sử dụng thiết kế nhẹ, lý tưởng cho việc xếp lớp hoặc mặc một mình. Sản phẩm này được làm từ ít nhất 75% sợi polyester tái chế.', 5, 7, 4230000, 1, '2021-11-17 00:00:00', 212),
(37, 'Túi tròn Le Greca', 'Là một phụ kiện mô-đun, chiếc túi tròn này được làm thủ công từ vải bạt tráng La Greca. Thiết kế dễ dàng gắn vào túi La Greca Signature, dây đeo vai hoặc thắt lưng yêu thích của bạn.', 6, 8, 161000, 1, '2021-11-17 00:00:00', 638),
(38, 'Giày thể thao Fendi Force', 'Giày thể thao viền ren Fendi Force. Được làm bằng vải đen có thêu hoạ tiết FF. Hoàn thiện với tông màu trên các chi tiết bằng da. Đế cao su nhẹ với chi tiết FF in nổi ở mũi giày.', 7, 9, 3065000, 1, '2021-11-17 00:00:00', 553),
(39, 'Mũ nồi len với logo Armani', 'Chọn phụ kiện này để làm cho mọi bộ trang phục vừa giản dị vừa quyến rũ. Nhờ có logo thêu tương phản, chiếc mũ nồi len nguyên chất này khiến mọi ánh nhìn trở nên đặc biệt và dễ nhận biết ngay lập tức.', 8, 10, 1270000, 1, '2021-11-17 00:00:00', 853),
(40, 'Áo thun Damier', 'Chiếc áo phông ngắn tay này được in toàn bộ với họa tiết Damier. Lấy cảm hứng từ một tấm thiệp chúc mừng năm 1914, họa tiết này có cảm giác được vẽ tay và kết hợp chữ ký \"Marque Louis Vuitton déposée\". Phần này được tạo kiểu vừa vặn thông thường từ áo bông tinh khiết.', 1, 1, 608000, 1, '2021-11-17 00:00:00', 607),
(41, 'Áo sơ mi cotton poplin Gucci', 'Một ý tưởng được Giám đốc Sáng tạo liên tục khám phá, các sản phẩm lấy cảm hứng từ thiết kế riêng kết hợp sự xuất sắc của nghệ thuật và tầm nhìn chiết trung. Chiếc áo sơ mi cotton poplin này có chi tiết đàn hồi bên trong ở mặt sau mang lại cảm giác vừa vặn hơn.', 2, 2, 392000, 1, '2021-11-17 00:00:00', 474),
(42, 'Áo khoác có mũ Hermes', 'Áo khoác có mũ có khóa kéo bằng vải canvas Prince de Galles Toilmac (65% len nguyên chất và 35% cotton)', 3, 3, 4074000, 1, '2021-11-17 00:00:00', 549),
(43, 'Váy sọc vải poplin', 'Sự tương phản về màu sắc và hình dáng quá khổ gặp nhau trong chiếc váy poplin này với sự quyến rũ của mùa hè tái hiện hình bóng áo khoác cổ điển với tay áo phồng và một lớp vải được tập hợp lại với tâm trạng cổ điển.', 4, 4, 3473000, 1, '2021-11-17 00:00:00', 322),
(44, 'Quần chữ O Future Icon', 'Đừng đánh giá một cuốn sách chỉ qua trang bìa. Hoặc một chiếc túi chỉ bằng kích cỡ. Nhỏ mà có võ, chiếc túi trống adidas này giúp bạn đựng giày và đồ tập với phong cách thể thao. Quai xách bằng dây cáp vải in logo thương hiệu mang phong cách adidas nổi bật đến cho thiết kế nhỏ gọn.Trận đấu kết thúc. Nhưng tinh thần quyết tâm vẫn không dừng lại. Đó là thứ luôn đồng hành cùng bạn, tiếp lửa cho bạn và đưa bạn đến trận đấu tiếp theo. Và tiếp theo nữa. Ngoài giờ thi đấu, chiếc quần adidas này cho bạn tận hưởng cảm giác thoải mái, cũng chính là phần thưởng xứng đáng cho mọi nỗ lực bạn đã bỏ ra. Dáng chữ O mang đến nét cá tính cho outfit của bạn, ôm sát cổ chân và hông nhưng rộng hơn ở phần đùi cho diện mạo thoải mái. Về cơ bản cũng tương ứng với cảm giác của bạn khi diện chiếc quần này. Cực chill.', 5, 5, 344000, 1, '2021-11-17 00:00:00', 963),
(45, 'Túi len Bellport có dây', 'Được tạo ra từ một hỗn hợp len trong một thiết kế đan dây cáp cổ điển, phiên bản này của túi xách Bellport được trang trí bằng da và hoàn thiện với phần cứng bằng đồng đặc trưng.', 6, 6, 241000, 1, '2021-11-17 00:00:00', 850),
(46, 'Giày Jordan Series 02 \"Dear Deloris\"', 'Series Jordan .02 \"Dear Deloris\" tiếp tục câu chuyện về cách Mike trở thành người vĩ đại nhất mọi thời đại với lời tri ân dành cho mẹ của anh ấy. Có thể đeo trong bất kỳ bối cảnh nào, giày có một số đoạn giãn, để phù hợp với bàn chân rộng hơn', 7, 7, 600000, 1, '2021-11-17 00:00:00', 362),
(47, 'Mũ xô Greca', 'Chiếc mũ xô đương đại tự hào với bản in Chữ ký Greca - được tưởng tượng như một mê cung 3D sống động và đắm chìm cho cảm giác như bạn có thể bước ngay vào đó', 8, 8, 4322000, 1, '2021-11-17 00:00:00', 261),
(48, 'Áo thun Fendi họa tiết chữ cách điệu', 'Áo phông ngắn tay cổ thuyền quá khổ. Được làm bằng áo bông trắng. Được trang trí bằng tranh in nhiều màu của nghệ sĩ Noel Fielding.', 1, 9, 996000, 1, '2021-11-17 00:00:00', 218),
(49, 'Áo sơ mi cotton sa tanh', 'Một món đồ đa năng mà vẫn thanh lịch trong sự đơn giản của nó. Chiếc áo sơ mi này có cổ kiểu Pháp với một logo nhỏ được thêu tương phản - một chi tiết đặc biệt, hiếm có nhưng lại có một sự quyến rũ độc quyền. Một chiếc ách sau và còng tròn hoàn thiện vẻ ngoài.', 2, 10, 4800000, 1, '2021-11-17 00:00:00', 308),
(50, 'Áo khoác Damier có đai', 'Tác phẩm tinh xảo này kết hợp các chi tiết Damier tinh tế. Mô-típ mang tính biểu tượng được thể hiện trên các nút cổ tay và khóa thắt lưng, trên một bộ quần áo thông thường được may từ vải len nguyên chất. Đai có thể tháo rời có hai túi vá; cửa trước đóng lại bằng các nút kim loại ẩn.', 3, 1, 231000, 1, '2021-11-17 00:00:00', 886),
(51, 'Váy len có tua rua Gucci', 'Chiếc váy len và len cashmere này được tạo nên bởi các chi tiết xếp nếp và hình thêu Double G ở mặt trước. Đường viền cổ trang trí là yếu tố chính trong câu chuyện của Gucci: trâm cài, nơ và tua rua thu hút sự chú ý vào cổ và thường được tương phản bởi các màu sắc, chất liệu và kết cấu khác nhau trên phần còn lại của hình bóng.', 4, 2, 2988000, 1, '2021-11-17 00:00:00', 507),
(52, 'Quần chạy bộ với họa tiết Run - H', 'Quần chạy bộ hai màu bằng cotton với chi tiết \"Run H\" (100% cotton)', 5, 3, 426000, 1, '2021-11-17 00:00:00', 876),
(53, 'Túi bằng da kim loại Prada', 'Chiếc túi nhỏ này được trang trí bằng biểu tượng tam giác tráng men và được xác định bởi thiết kế có cấu trúc của nó, bằng da kim loại có tay nghề cao', 6, 4, 3760000, 1, '2021-11-17 00:00:00', 860),
(54, 'Giày Adidas Forum Low', 'Dòng adidas Forum ra mắt là một mẫu giày bóng rổ thập niên 80, nhưng đã nhanh chóng lấn sân sang địa hạt thời trang. Phiên bản này bóc tách yếu tố đặc trưng nhất của phong cách ấy rồi tôn bật lên bằng sắc màu cực kỳ bắt mắt. Thân giày cổ thấp làm từ chất liệu da mịn và bên dưới là đế ngoài bằng cao su.', 7, 5, 1592000, 1, '2021-11-17 00:00:00', 670),
(55, 'Mũ lưỡi trai vải nỉ Ralph Lauren', 'Chiếc mũ bóng này được làm thủ công từ vải nỉ len tốt của Ý để mang lại nét cổ điển sang trọng. Dây da có khóa lấy cảm hứng từ cưỡi ngựa làm điểm nhấn ở mặt sau.', 8, 6, 4873000, 1, '2021-11-17 00:00:00', 772),
(56, 'Áo thun thể thao Nike Max 90', 'Được làm từ vải jersey cotton, Áo phông thể thao Nike có cảm giác mềm mại, cao cấp và vừa vặn rộng rãi để mặc hàng ngày.', 1, 7, 2760000, 1, '2021-11-17 00:00:00', 848),
(57, 'Áo sơ mi họa tiết động vật biển', 'Là một vật dụng cần thiết cho mùa hè, chiếc áo sơ mi vải lanh này tự hào có bản in Trésor de la Mer mang tính biểu tượng. Một thiết kế di sản, bản in có các họa tiết thủy sinh nhằm tôn vinh thiên nhiên và hòa hợp với các yếu tố.', 2, 8, 3963000, 1, '2021-11-17 00:00:00', 925),
(58, 'Áo khoác vải Fendi', 'Blazer hình hộp với ve áo rộng. Túi ngực có dây và túi có nắp. Hai nút thắt và rạch ở phía sau. Đã lót. Được làm bằng vải nâu với họa tiết FF jacquard toàn thân', 3, 9, 651000, 1, '2021-11-17 00:00:00', 82),
(59, 'Váy lụa dài, họa tiết cây bạch quả', 'Được làm từ lụa sang trọng có một trong những họa tiết in hoa toàn bộ bộ sưu tập, những chiếc áo dài và đường viền cổ sâu của mặt hàng này là biểu tượng của sự thanh lịch, tinh tế.', 4, 10, 5077000, 1, '2021-11-17 00:00:00', 633),
(60, 'Quần dài phong cách safari', 'Một chiếc quần cà rốt cổ điển được làm lại với các chi tiết sắc nét và thể thao theo mùa. Được may từ chất liệu cotton mềm mại, hiệu ứng màu hồng đào thoải mái với các nếp gấp rõ nét quanh eo và các túi vá ở bên hông gợi ý đến phong cách safari. Vạt nút trang phục của bộ sưu tập thêm một chi tiết hiện đại, trong khi một mấu da nổi kín đáo tạo dấu hiệu cho vẻ ngoài.', 5, 1, 3048000, 1, '2021-11-17 00:00:00', 919),
(61, 'Túi Gucci Diana Jumbo', 'Các biểu tượng thương hiệu, logo có thể nhận biết ngay lập tức làm phong phú thêm các thiết kế theo những cách mới và bất ngờ. Đằng sau mỗi logo là truyền thống và giá trị của Ngôi nhà, một phương tiện vĩnh cửu mà người ta có thể mặc đi mặc lại.', 6, 2, 131000, 1, '2021-11-17 00:00:00', 696),
(62, 'Giày sneaker duel Hermes', 'Giày thể thao bằng vải đan và da bê với đế cao su và chi tiết đường ống màu cam đặc trưng.', 7, 3, 404000, 1, '2021-11-17 00:00:00', 723),
(63, 'Mũ Denim Prada', 'Một loại vải đình đám dành cho thời trang dạo phố và trang phục bình thường, denim được Prada tái hiện trên các sản phẩm may mặc và phụ kiện mới mang tinh thần đương đại như chiếc mũ rộng vành có dây điều chỉnh dưới cằm này.', 8, 4, 2090000, 1, '2021-11-17 00:00:00', 529),
(64, 'Áo thun suông R.Y.V', 'Mỗi con người đều là độc nhất. Nhưng đôi khi cần phải can đảm mới có thể bộc lộ sự khác biệt trong bạn. Chiếc áo thun adidas suông rộng này cho bạn rất nhiều không gian để biểu đạt bản thân. Hà cớ gì phải bó buộc?', 1, 5, 4293000, 1, '2021-11-17 00:00:00', 476),
(65, 'Áo sơ mi Dobby Slim Fit Ralph Lauren', 'Được làm thủ công từ vải cotton có kết cấu, chiếc áo này được nhuộm để có vẻ ngoài độc đáo với sắc thái bóng mờ.', 2, 6, 505000, 1, '2021-11-17 00:00:00', 792),
(66, 'Áo khoác thể thao Nike', 'Áo khoác thể thao Nike là một sự hiện đại của áo khoác thể thao truyền thống. Loại vải gấp nếp có các lỗ cắt bằng laser giúp giữ cho bạn mát mẻ và thoải mái.Jordan Essentials Jacket có trọng lượng nhẹ, không thấm nước và được lót để tạo sự thoải mái. Một loạt màu sắc mới kết hợp với các đường nét thiết kế cổ điển để tạo ra một cái nhìn mới mẻ nhưng quen thuộc. Túi zip và mũ trùm có thể điều chỉnh được với tấm che mặt giúp nó hoạt động hiệu quả.', 3, 7, 1123000, 1, '2021-11-17 00:00:00', 531),
(67, 'Váy vải midi Versace', 'Được nhìn thấy trên đường băng, chiếc váy midi vừa vặn này được làm thủ công từ len natté nhẹ. Một hình bóng nổi bật, thiết kế tự hào có cổ và đường viền sau đồ họa. Phong cách với giày lười chunky và một chiếc túi La Greca để có một diện mạo lấy cảm hứng từ buổi biểu diễn thời trang', 4, 8, 3075000, 1, '2021-11-17 00:00:00', 282),
(68, 'Quần tất Fendi', 'Quần tất giữ nhiệt liền quần có cạp chun. Được làm bằng vật liệu đen chịu nhiệt, thoáng khí được làm thủ công từ sợi nylon tái chế với cấu trúc liền mạch và có các chi tiết tông màu FF trên đầu gối', 5, 9, 2718000, 1, '2021-11-17 00:00:00', 815),
(69, 'Túi nhỏ với dây đeo vai', 'Một phụ kiện nhỏ nhưng nổi bật có thể làm tăng thêm phong cách, giống như chiếc túi mini này, cũng có thể được sử dụng như một chiếc ví, nhờ có các khe cắm thẻ bên trong và ngăn đựng tiền giấy.', 6, 10, 2954000, 1, '2021-11-17 00:00:00', 230),
(70, 'Giày ống ngắn Oberkampf', 'Phiên bản giày bốt Oberkampf mang tính biểu tượng này là một phần trong lần hợp tác thứ hai của Louis Vuitton với nhà thiết kế Nhật Bản Nigo, bao gồm đồ da và phụ kiện may sẵn. Sự kết hợp theo bản năng của Nigo giữa nét hào hoa của Anh và văn hóa đường phố Nhật Bản đã khiến anh trở thành một nhân vật có ảnh hưởng độc nhất vô nhị, ở ngã tư của mỹ thuật và thời trang.', 7, 1, 2646000, 1, '2021-11-17 00:00:00', 704),
(71, 'Mũ xô Gucci', 'Các biểu tượng thương hiệu, logo có thể nhận biết ngay lập tức làm phong phú thêm các thiết kế theo những cách mới và bất ngờ. Đằng sau mỗi logo là truyền thống và giá trị của Ngôi nhà, một phương tiện vĩnh cửu mà người ta có thể mặc đi mặc lại. Đây là canvas Maxi GG xác định chiếc mũ xô bằng gỗ mun và lạc đà này. Một đường viền bằng da màu nâu hoàn thiện phong cách.', 8, 2, 2683000, 1, '2021-11-17 00:00:00', 829),
(72, 'Áo thun thêu chữ H', 'Áo thun ngắn tay cổ tròn thêu chữ H, cổ bẻ, túi trước ngực (100% cotton)', 1, 3, 973000, 1, '2021-11-17 00:00:00', 32),
(73, 'Áo sơ mi bowling cotton co giãn Prada', 'Những đường nét cổ điển và thiết kế ngoại cỡ là đặc điểm của chiếc áo sơ mi ngắn tay này. Một khóa kéo phía trước diễn giải lại cách đóng nút của trang phục nam cổ điển, mang lại nét hiện đại cho trang phục', 2, 4, 273000, 1, '2021-11-17 00:00:00', 676),
(74, 'Áo khoác chống mưa linh hoạt Adidas', 'Có những khi trời mưa rào làm bạn không kịp trở tay. Lại có những khi dự báo sắp mưa nhưng bạn vẫn ra sân. Luôn sẵn sàng cho thời tiết mưa ướt trên sân golf với chiếc áo khoác chống mưa adidas này. Cất gọn áo trong túi khi tiến tới khu tee đầu tiên, để bạn có thể lấy ra ngay khi cần thiết. Chẳng việc gì phải ngừng chơi chỉ vì trời mưa.', 3, 5, 4309000, 1, '2021-11-17 00:00:00', 284),
(75, 'Váy trơn cổ chữ V Ralph Lauren', 'Những sợi sequins lấp lánh toàn bộ trang trí cho chiếc váy lấy cảm hứng từ trượt này, được ôm sát qua vạt áo và loe ra viền đuôi cá.', 4, 6, 2971000, 1, '2021-11-17 00:00:00', 393),
(76, 'Quần Jordan Sport DNA', 'Được làm từ chất liệu vải nhẹ, giặt nhẹ, chúng có túi zip và đồ họa \"JORDAN\" được thêu bằng các chữ cái lấy cảm hứng từ biểu tượng Force mang tính biểu tượng — một đối thủ kinh điển từ trước đến nay.', 5, 7, 3846000, 1, '2021-11-17 00:00:00', 112),
(77, 'Túi La Medusa', 'Một thiết kế dạ hội tuyệt đẹp với hình dáng cong đương đại, chiếc túi nhỏ hobo được làm thủ công từ da bê sần nhẹ ở Ý.', 6, 8, 418000, 1, '2021-11-17 00:00:00', 383),
(78, 'Giày cao gót Fendi First', 'Bốt Fendi First có mũi tròn và khóa kéo bên trong bằng khóa kéo Fendi O’Lock. Làm bằng da nappa trắng. Phần gót chạm trổ hình chữ F chéo bằng kim loại màu vàng.', 7, 9, 2089000, 1, '2021-11-17 00:00:00', 576),
(79, 'Mũ len có biểu tượng gấu Manga Bear', 'Bộ sưu tập Manga Bear có nhân vật hoạt hình của Mr Armani, đã trở thành biểu tượng của thương hiệu nhờ thiết kế vui tươi và sắc sảo. Chiếc mũ len có gân, cổ điển này có đặc điểm là hình thêu đơn sắc đặc biệt.', 8, 10, 1983000, 1, '2021-11-17 00:00:00', 732),
(80, 'Áo thun cổ điển LV', 'Được may từ chất liệu vải cotton nhỏ gọn sang trọng, chiếc áo phông Cổ điển này được thiết kế với một chiếc túi có miếng dán hiệu ứng Damier trên ngực. Nó hiện có sẵn trong các màu Vàng, Xám và Nâu đặc trưng của mùa.', 1, 1, 590000, 1, '2021-11-17 00:00:00', 932),
(81, 'Áo sơ mi len với sticker mèo Gucci', 'Các hình minh họa lấy cảm hứng từ cuốn truyện tiếp tục được nhìn thấy trong các bộ sưu tập gần đây nhất của Gucci. Đối với Ouverture, chúng có hình dạng của động vật nông trại, trái cây và rau quả mời người mặc nhìn thế giới từ góc độ giàu trí tưởng tượng.', 2, 2, 4323000, 1, '2021-11-17 00:00:00', 466),
(82, 'Áo khoác biker cổ cao Hermes', 'Áo khoác biker cổ cao có khóa kéo bằng vải kỹ thuật chống thấm nước (72% polyamide và 28% cotton)', 3, 3, 3567000, 1, '2021-11-17 00:00:00', 532),
(83, 'Váy thêu Chiffon Prada', 'Những điểm nhấn lấp lánh tôn lên thiết kế của chiếc váy bồng bềnh với vẻ quyến rũ lãng mạn này', 4, 4, 2909000, 1, '2021-11-17 00:00:00', 262),
(84, 'Quần thể thao Adidas AEROREADY', 'Thế giới không bao giờ đứng yên. Vào những ngày bận rộn như thế, hãy lựa chọn chiếc quần adidas AEROREADY này. Chất vải thấm hút ẩm cho cảm giác mềm mại trên da giúp bạn luôn khô ráo và thoải mái khi di chuyển. Các vật dụng thiết yếu luôn an toàn trong các túi khóa kéo bên hông.', 5, 5, 5062000, 1, '2021-11-17 00:00:00', 714),
(85, 'Cặp vải Ralph Lauren', 'Được cung cấp với một loạt các màu sắc rực rỡ, chiếc ba lô vải này được tạo điểm nhấn ở túi trước với hình Pony thêu đặc trưng của Ralph Lauren. Túi bên trong có đệm giúp bảo vệ máy tính xách tay hoặc máy tính bảng của bạn.', 6, 6, 3435000, 1, '2021-11-17 00:00:00', 784),
(86, 'Giày Nike Aqua Rift', 'Pha trộn các tính năng từ 2 ảnh hưởng phong cách cổ điển của thập niên 90, Nike Aqua Rift mang phong cách bãi biển cổ điển vào hiện tại với hình bóng tương lai và dáng đứng phóng đại', 7, 7, 5043000, 1, '2021-11-17 00:00:00', 780),
(87, 'Mũ len mẫu Greca', 'Được làm thủ công bằng len nguyên chất, chiếc mũ len sang trọng này có họa tiết Greca mờ nhạt dọc theo nếp gấp. Thiết kế ấm áp kết hợp hoàn hảo với một chiếc khăn phù hợp', 8, 8, 3105000, 1, '2021-11-17 00:00:00', 546),
(88, 'Áo thun Fendi logo 2 chữ F', 'Áo thun cổ tròn tay ngắn. Được làm bằng vải bông mềm màu đen. Được trang trí với logo maxi FF màu thuốc lá được thêu Alcantara® ở mặt trước', 1, 9, 4453000, 1, '2021-11-17 00:00:00', 392),
(89, 'Áo sơ mi kẻ sọc logo Alpha', 'Chiếc áo sơ mi đã được cập nhật với một sự quyến rũ hiện đại, giản dị hơn. Mặt hàng này có biểu tượng jacquard alpha mang tính biểu tượng ở mặt trước, kết hợp hài hòa với cùng một họa tiết sọc trên toàn bộ. Ách lưng và còng tròn.', 2, 10, 1281000, 1, '2021-11-17 00:00:00', 321),
(90, 'Áo khoác dáng thể thao', 'Chiếc áo khoác dáng rộng này tái hiện lại hình dáng trang phục nam giới cổ điển. Được làm từ len có nguồn gốc đáng tin cậy, nó kết hợp các chi tiết cắt lượn sóng cho cấu trúc với một đường viền tinh xảo. Các chi tiết bao gồm thắt lưng đàn hồi và cổ tay áo có dây rút, cùng với các nút kim loại ton-sur-ton.', 3, 1, 2999000, 1, '2021-11-17 00:00:00', 428),
(91, 'Váy hoa tái bản 2015', 'Những vẻ ngoài mang tính biểu tượng từ bộ sưu tập đầu tiên của Alessandro Michele được giới thiệu một lần nữa cho bộ sưu tập Ouverture và tạo ra một liên kết với lịch sử phong phú của Gucci. Chiếc váy hoa này được hoàn thiện với nhãn đỏ \"Điều gì đó không bao giờ kết thúc\".', 4, 2, 4988000, 1, '2021-11-17 00:00:00', 177),
(92, 'Quần chạy bộ làm bằng da', 'Quần chạy bộ đặc trưng bằng cotton và cashmere (86% cotton và 14% cashmere)', 5, 3, 3489000, 1, '2021-11-17 00:00:00', 601),
(93, 'Túi da Prada tam giác', 'Một nghiên cứu về hình tam giác truyền cảm hứng cho các chi tiết hình học mới và cách giải thích độc đáo về biểu tượng lịch sử của Prada.', 6, 4, 1485000, 1, '2021-11-17 00:00:00', 475),
(94, 'Dép Adilette Shower', 'Xỏ dép và lên đường. Đôi dép nam này kết hợp phong cách 3 Sọc với đế dép nguyên khối cloudfoam thoải mái hợp nhất đế giữa và đế ngoài cho cảm giác êm ái vượt trội. Điểm nhấn đến từ logo táo bạo bên hông.', 7, 5, 2251000, 1, '2021-11-17 00:00:00', 573),
(95, 'Mũ lưỡi trai thêu chữ lồng Ralph Lauren', 'Với hình thêu chữ nổi \"RL\" lấy cảm hứng từ Art Deco ở phía trước, chiếc mũ len đan bằng vải bông có xuất xứ từ Ý này được hoàn thiện với dây đeo da có khóa ở phía sau.', 8, 6, 1280000, 1, '2021-11-17 00:00:00', 434),
(96, 'Áo thun Jordan Air Woodmark', 'Jordan Air Wordmark được làm từ chất liệu vải mềm mại cho bạn sự thoải mái cả ngày trong và ngoài sân đấu.', 1, 7, 294000, 1, '2021-11-17 00:00:00', 453),
(97, 'Áo sơ mi hình cúp của chúa', 'Mang đậm chất Versace, chiếc áo sơ mi ngắn tay này được làm thủ công từ lụa nguyên chất trong bản in La Coupe des Dieux. Kết hợp với quần short phù hợp để có một cái nhìn tổng thể', 2, 8, 3974000, 1, '2021-11-17 00:00:00', 965),
(98, 'Áo khoác sa tanh Fendi', 'Áo blazer đơn có túi ngực và túi vạt. Làm bằng sa tanh đen. Được cắt tỉa với đường ống tương phản trên ve áo và dây buộc phía trước.', 3, 9, 122000, 1, '2021-11-17 00:00:00', 467),
(99, 'Váy đan họa tiết ziczac', 'Mùa đông dường như không bao giờ kết thúc, nhưng mặc trang phục phù hợp sẽ khiến bạn bừng sáng ngay cả trong những ngày lạnh giá nhất với một phong cách riêng.', 4, 10, 3230000, 1, '2021-11-17 00:00:00', 437),
(100, 'Quần dài thể thao LV', 'Những chiếc quần kiểu bộ đồ thể thao rộng rãi này mang đến họa tiết hoa Monogram được chần bông trên một loại vải kỹ thuật tái chế.', 5, 1, 3103000, 1, '2021-11-17 00:00:00', 786),
(101, 'Túi Gucci GG Marmont', 'Là một thành viên của dòng sản phẩm Yêu quý của Nhà, GG Marmont được đặc trưng bởi phần cứng chữ lồng biểu tượng của thương hiệu và da matelassé.', 6, 2, 2322000, 1, '2021-11-17 00:00:00', 618),
(102, 'Giày loafer Irving Hermes', 'Lái xe moccasin bằng da bê với khóa \"Minidog XL\" màu đen, phần trên được khâu bằng tay, đế cao su đính đá và lớp lót màu cam\n', 7, 3, 2776000, 1, '2021-11-17 00:00:00', 733),
(103, 'Mũ len Prada', 'Chiếc mũ len hiện đại, thể thao này được chế tác từ len cashmere và len tốt. Phụ kiện có logo hình tam giác có họa tiết hình học jacquard gợi lên những thiết kế từ những năm sáu mươi.', 8, 4, 2418000, 1, '2021-11-17 00:00:00', 809),
(104, 'Áo thun Own the run', 'Tủ đồ của bạn đầy những chiếc áo thun chạy bộ không phù hợp lắm. Quá dày hoặc quá mỏng. Quá rộng hoặc quá chật. Nhưng nằm trên cùng đống đồ chất cao kia sẽ luôn là chiếc áo thun adidas Own The Run này. Với chất liệu tái chế thể hiện cam kết bền vững của chúng tôi, chiếc áo này giúp bạn luôn thoải mái trên đường chạy dài ngày Chủ Nhật hay cự ly 5K giờ nghỉ trưa thứ Hai. Đừng bao giờ hài lòng với những gì không phù hợp.', 1, 5, 1686000, 1, '2021-11-17 00:00:00', 847),
(105, 'Áo sơ mi Oxford sọc cổ điển Ralph Lauren', 'Là trụ cột của phong cách Polo kể từ khi nó lần đầu tiên được giới thiệu, áo sơ mi oxford là một thiết bị chủ lực linh hoạt. Phiên bản này được cắt cho vừa vặn rộng rãi và được hoàn thiện bằng chữ ký Pony nhiều màu của chúng tôi.', 2, 6, 1832000, 1, '2021-11-17 00:00:00', 810),
(106, 'Áo khoác Jordan Essentials', 'Jordan Essentials Jacket có trọng lượng nhẹ, không thấm nước và được lót để tạo sự thoải mái. Một loạt màu sắc mới kết hợp với các đường nét thiết kế cổ điển để tạo ra một cái nhìn mới mẻ nhưng quen thuộc. Túi zip và mũ trùm có thể điều chỉnh được với tấm che mặt giúp nó hoạt động hiệu quả.', 3, 7, 1243000, 1, '2021-11-17 00:00:00', 506),
(107, 'Váy lụa midi Versace', 'Là một thiết kế dạ hội thướt tha được nhìn thấy trên sàn diễn, chiếc váy midi thanh lịch này được làm thủ công từ lụa tơ tằm nguyên chất. Tự hào với hình bóng nổi bật, kiểu áo này có đường viền cổ bằng đồ họa, trong khi thắt lưng kiểu đế chế được nhấn mạnh bằng thắt lưng nạm pha lê.', 4, 8, 112000, 1, '2021-11-17 00:00:00', 100),
(108, 'Quần sa tanh Fendi', 'Quần vừa vặn. Túi ở hai bên và túi hai dây có nút ở phía sau. Vòng đai thắt lưng và ủi phẳng nếp nhăn xuống chân. Chốt khóa zip. Làm bằng sa tanh đen. Hoàn thiện với đường ống tương phản ở thắt lưng.', 5, 9, 1701000, 1, '2021-11-17 00:00:00', 982),
(109, 'Túi đi chợ với dây đeo vai Armani', 'Túi xách hai quai có dây đeo vai. Đại bàng chạm nổi trang trí.', 6, 10, 1812000, 1, '2021-11-17 00:00:00', 613),
(110, 'Giày Mule LV Easy', 'LV Easy mule là một phong cách trượt trên xu hướng trên vải Monogram mang tính biểu tượng của Louis Vuitton. Dây đeo ở phía trên được tô điểm bằng phụ kiện LV Initials, trong khi đường khâu huỳnh quang làm nổi bật dây đeo.', 7, 1, 185000, 1, '2021-11-17 00:00:00', 116),
(111, 'Mũ Gucci 100 sequin', 'Trong suốt 100 năm thành lập, Gucci đã khẳng định mình là một trong những hãng thời trang có ảnh hưởng nhất. Để kỷ niệm Centennial, chiếc mũ bóng chày đính sequin vàng lấp lánh này đã được làm phong phú thêm bằng cách thêu 100 sequin màu tím tương phản, gợi nhớ đến các phụ kiện cổ điển.', 8, 2, 4919000, 1, '2021-11-17 00:00:00', 741),
(112, 'Áo thun \"Twist & Poches\"', 'Áo thun cổ thuyền tay ngắn bằng cotton với chi tiết \"Twist & poches\" (100% cotton)', 1, 3, 3782000, 1, '2021-11-17 00:00:00', 358),
(113, 'Áo sơ mi bowling lụa Prada', 'Description no 113', 2, 4, 933000, 1, '2021-11-17 00:00:00', 568),
(114, 'Áo khoác lông vũ Adidas', 'Ít có chất liệu nào nhẹ và ấm áp như lông vũ. Hãy diện chiếc áo khoác lông vũ adidas Essentials và tự mình cảm nhận. Các mảng chần lông vũ giữ ấm cho cơ thể, cùng phong cách 3 Sọc kinh điển giúp bạn sẵn sàng xuống phố. Áo còn làm từ chất liệu tái chế, một bước tiến quan trọng của adidas hướng tới chấm dứt rác thải nhựa.', 3, 5, 3527000, 1, '2021-11-17 00:00:00', 765),
(115, 'Váy kẻ sọc cotton Ralph Lauren', 'Được cắt từ cotton với các sọc nhuộm bằng sợi, hình dáng chữ A của chiếc váy sơ mi được thiết kế riêng này được tăng cường với một chiếc thắt lưng mảnh mai để tạo nét ở eo. Pony thêu chữ ký của chúng tôi làm nổi bật ngực.', 4, 6, 1363000, 1, '2021-11-17 00:00:00', 122),
(116, 'Quần Jordan Jumpman', 'Chuẩn bị cho thời tiết lạnh giá trong Quần dài Jordan Jumpman Fleece. Được làm từ vải bông xù mềm mại của Pháp, chúng có còng co giãn kẹp quanh mắt cá chân của bạn. Đồ họa theo mùa mang đến một vài nét mới mẻ, vui tươi dựa trên thiết kế Jumpman mang tính biểu tượng', 5, 7, 2653000, 1, '2021-11-17 00:00:00', 313),
(117, 'Túi xô La Medusa', 'Tinh nghịch và sang trọng, chiếc túi xô có tay cầm hàng đầu này tự hào có một tấm bảng La Medusa tông vàng và một dây chuyền chunky tạo nên nét đặc trưng của Versace. Túi đa năng này có thể được tạo kiểu trên tay hoặc ngang thân và được kết thúc bằng dây rút', 6, 8, 1591000, 1, '2021-11-17 00:00:00', 199),
(118, 'Dép sandal Fendi', 'Dép có bản rộng. Được làm bằng nylon đen với họa tiết jacquard FF màu bạc. Được cắt tỉa với các dải màu đen và khóa logo.', 7, 9, 3503000, 1, '2021-11-17 00:00:00', 59),
(119, 'Mũ lưỡi trai có biểu tượng đại bàng', 'Phụ kiện thời trang dạo phố mang tính biểu tượng ở mức tốt nhất. Chiếc mũ lưỡi trai, thứ đã trở nên rất hợp thời trang gần đây, được kết hợp với những bộ trang phục rất khác nhau để hoàn thiện một diện mạo đầy mỉa mai.', 8, 10, 234000, 1, '2021-11-17 00:00:00', 695),
(120, 'Áo thun lộn trong LV', 'Tác phẩm này kết hợp nhiều loại chữ ký Louis Vuitton tinh tế. Được chế tạo với kiểu dáng hơi lỏng lẻo và có màu xanh ngọc và hồng theo mùa, nó có đường khâu hiệu ứng từ trong ra ngoài đặc biệt trên vai. Mặt sau được ký với nhãn hiệu ứng từ trong ra ngoài và nhãn Louis Vuitton Staples Edition có thể tháo rời, trong khi mặt trái có một kim bấm khắc.', 1, 1, 2187000, 1, '2021-11-17 00:00:00', 297),
(121, 'Áo Gucci họa tiết sặc sỡ có chữ GG', 'Chiếc áo bowling này có các họa tiết hình học tươi sáng và đầy màu sắc gợi nhớ đến đồng phục của những người cưỡi ngựa', 2, 2, 3390000, 1, '2021-11-17 00:00:00', 401),
(122, 'Áo khoác có thể mặc ngược Hermes', 'Áo khoác có thể đảo ngược bằng da cừu hoàn thiện nappa hạt mịn (100% da cừu)', 3, 3, 3214000, 1, '2021-11-17 00:00:00', 114),
(123, 'Váy Crepe de chine', 'Chủ nghĩa lãng mạn mới kết hợp với các yếu tố mới lạ với những nét thể thao đã truyền cảm hứng cho chiếc váy này bằng chất liệu crepe de chine mềm mại.', 4, 4, 2909000, 1, '2021-11-17 00:00:00', 366),
(124, 'Quần gió Adidas', 'Lên đồ cho diện mạo và cảm giác như vận động viên chuyên nghiệp với chiếc quần gió adidas này. Với thiết kế dành cho tập luyện bóng đá và bóng chày, chiếc quần này có kiểu dáng regular fit thông thường và các túi chìm hai bên. Khóa kéo ở mắt cá giúp bạn dễ dàng mặc vào và cởi ra khi thời tiết thay đổi.\n', 5, 5, 2729000, 1, '2021-11-17 00:00:00', 488),
(125, 'Túi cotton pink Pony', 'Hai mươi lăm phần trăm giá mua của chiếc túi tote cotton nhuộm cà vạt này giúp ích cho các chương trình tầm soát ung thư, điều trị sớm, nghiên cứu và điều hướng bệnh nhân', 6, 6, 4409000, 1, '2021-11-17 00:00:00', 341),
(126, 'Giày Nike Mercurial 14', 'Nike Mercurial Vapor 14 Academy FG / MG giúp bạn tăng tốc độ nhờ các đinh tán được thiết kế đặc biệt để cắt nhanh và dừng đột ngột.', 7, 7, 894000, 1, '2021-11-17 00:00:00', 241),
(127, 'Mũ họa tiết Baroque in hình logo Versace', 'Một phụ kiện mang tính biểu tượng của Versace, chiếc mũ lưỡi trai bình thường này có in hình Barocco. Phong cách được làm phong phú hơn với logo thêu chỉ. Nắp có một mấu phía sau có thể điều chỉnh để đảm bảo sự vừa vặn hoàn hảo', 8, 8, 4562000, 1, '2021-11-17 00:00:00', 183),
(128, 'Áo thun có chữ Fendi cách điệu', 'Áo thun vừa vặn với cổ thuyền và tay ngắn. Được làm bằng áo bông trắng. Được trang trí bằng một miếng vá và chữ nhiều màu do nghệ sĩ Noel Fielding thiết kế. Sản xuất tại Ý', 1, 9, 1942000, 1, '2021-11-17 00:00:00', 191),
(129, 'Áo sơ mi cotton co giãn mẫu đại bàng', 'Áo sơ mi này đã được cập nhật theo phong cách hiện đại. Được làm từ cotton co giãn, nó có cổ áo cổ điển và in logo đại bàng độc đáo, toàn thân, nghệ thuật', 2, 10, 138000, 1, '2021-11-17 00:00:00', 406),
(130, 'Áo hoodie LV', 'Chiếc áo hoodie thông minh này mang đến sự pha trộn dễ dàng giữa phong cách giản dị và trang trọng. Được thiết kế vừa vặn thông thường từ sợi lông cừu nguyên chất, nó kết hợp mũ trùm đầu có thể điều chỉnh của áo hoodie cổ điển và túi kangaroo với cổ tay áo cài cúc của áo khoác. Được ký hiệu bằng những đường cắt LV và chỉ thêu hoa Monogram, nó có lớp lót trơn và phần cứng màu xanh da trời.', 3, 1, 3034000, 1, '2021-11-17 00:00:00', 456),
(131, 'Váy Gucci in hình hoa tuylip ', 'Trang phục ban ngày được in hoa nhiều màu sắc, mang lại cảm giác tươi mới. Được làm thủ công từ hỗn hợp vải lanh cotton, chiếc váy xếp ly này được làm thủ công từ hỗn hợp vải lanh cotton màu xanh nhạt, đóng vai trò như một tấm vải cho họa tiết hoa tulip.', 4, 2, 2299000, 1, '2021-11-17 00:00:00', 61),
(132, 'Quần Saint Germain', 'Quần được may bằng vải bông co giãn (98% cotton và 2% elastane)', 5, 3, 957000, 1, '2021-11-17 00:00:00', 938),
(133, 'Túi satin có pha lê nhân tạo ', 'Túi hobo mini này, một phong cách mang tính biểu tượng của Prada, có phiên bản sa tanh sang trọng được đính pha lê và được trang trí bằng biểu tượng tam giác tráng men biểu tượng.', 6, 4, 4966000, 1, '2021-11-17 00:00:00', 509),
(134, 'Giày bóng đá Adidas sân cỏ tự nhiên', 'Quan sát, đọc tình huống rồi dứt điểm. Và lặp lại. Khi tinh thần nhạy bén hòa hợp cùng sự nhanh nhẹn của cơ thể, bạn sẽ trở thành phiên bản nhanh nhất của chính mình. Hãy kiếm tìm nhịp điệu của bạn và bỏ lại mọi thứ phía sau. Bất kể khái niệm \"tốc độ\" của bạn là gì, đôi giày đá bóng adidas X này sẽ giúp bạn luôn dẫn đầu.', 7, 5, 4021000, 1, '2021-11-17 00:00:00', 730),
(135, 'Mũ xô cotton Ralph Lauren', 'Chữ Pony được thêu đặc trưng của Ralph Lauren tạo điểm nhấn cho mặt trước của chiếc mũ xô đan bằng vải cotton đan chéo này.', 8, 6, 1478000, 1, '2021-11-17 00:00:00', 121),
(136, 'Áo thun thể thao Nike A.I.R.Machine', 'Được tạo ra cho Bộ sưu tập Artist In Residence, Áo thể thao A.I.R.T của Nike được tạo ra bởi Machine', 1, 7, 407000, 1, '2021-11-17 00:00:00', 417),
(137, 'Áo sơ mi La Greca', 'Được làm từ chất liệu cotton poplin, chiếc áo sơ mi đa năng này được tô điểm bằng họa tiết La Greca dọc bên hông với họa tiết kẻ sọc.', 2, 8, 1355000, 1, '2021-11-17 00:00:00', 720),
(138, 'Áo khoác 2 cúc dọc Fendi', 'Áo khoác đơn với ve áo và túi vạt cổ điển. Đóng hai nút. Làm bằng vải gai dầu tự nhiên. Họa tiết à jour FF thêu tay ở viền tay áo. Được trang trí bằng các nút ở trung tâm mặt sau.', 3, 9, 2060000, 1, '2021-11-17 00:00:00', 349),
(139, 'Váy sử dụng vải kỹ thuật', 'Mặt hàng này thể hiện sự tôn kính với phong cách giản dị sang trọng, bằng cách kết hợp một loại vải kỹ thuật thoải mái, thiết thực với sự vừa vặn rộng rãi, hoàn hảo cho trang phục hàng ngày.', 4, 10, 1453000, 1, '2021-11-17 00:00:00', 587),
(140, 'Quần cargo LV', 'Những chiếc quần này mang lại cảm giác mát mẻ, đương đại với hình dáng hàng hóa cổ điển. Được chế tạo theo kiểu hơi lỏng lẻo từ vải kỹ thuật cotton, chúng được ký kết bằng các nút kim loại Damier ở phía trước và phần cứng kim loại Damier. Các chi tiết bao gồm một túi có khóa kéo và một túi có nắp, và các chi tiết đường may giải phẫu trên đầu gối.', 5, 1, 3804000, 1, '2021-11-17 00:00:00', 886),
(141, 'Túi Gucci Hacker Project', 'Khám phá những ý tưởng về tính xác thực và sự chiếm đoạt trong ngành thời trang, Gucci Aria ra mắt Dự án Hacker.', 6, 2, 4630000, 1, '2021-11-17 00:00:00', 672),
(142, 'Giày cao gót Volver 60', 'Cổ chân chữ H đan với họa tiết \"Clic! C\'est Noue\", họa tiết \"Ex-Libris\" bằng da bê và gót hình móng ngựa. Để có một cái nhìn hiện đại và nữ tính.', 7, 3, 618000, 1, '2021-11-17 00:00:00', 699),
(143, 'Mũ lưỡi trai Prada', 'Chiếc mũ bóng chày được trang trí bằng biểu tượng tam giác tráng men đặc trưng của thương hiệu này được làm bằng Re-Nylon: sợi nylon tái sinh (ECONYL®) được sản xuất từ ​​rác nhựa tái chế, tinh khiết được thu gom trong đại dương, lưới đánh cá và sợi phế thải dệt.', 8, 4, 440000, 1, '2021-11-17 00:00:00', 479),
(144, 'Áo thun tennis club', 'Phong cách country club bứt phá cùng hơi thở đương đại. Với 3 Sọc ngang ở một bên tay áo, chiếc áo thun tennis adidas Club cho bạn cảm giác thoải mái. Các mảng phối lưới, chất vải thoáng khí và công nghệ AEROREADY kiểm soát ẩm giúp bạn luôn thấy mát mẻ và khô ráo trong những loạt bóng bền rực lửa.', 1, 5, 2752000, 1, '2021-11-17 00:00:00', 298),
(145, 'Áo sơ mi co giãn vải poplin cổ điển Ralph Lauren', 'Là trụ cột của phong cách Polo kể từ khi nó lần đầu tiên được giới thiệu, áo sơ mi oxford là một thiết bị chủ lực linh hoạt. Phiên bản này được cắt cho vừa vặn rộng rãi và được hoàn thiện bằng chữ ký Pony nhiều màu của chúng tôi.Lớp vải bố của chiếc áo sơ mi này được dệt từ bông mềm, thoáng khí và có thêm tính năng co giãn để tăng thêm sự thoải mái.', 2, 6, 2808000, 1, '2021-11-17 00:00:00', 52),
(146, 'Áo khoác Nike Repel Miler', 'Một phần thiết yếu cho trò chơi chạy của bạn là bản cập nhật cho Áo khoác Nike Repel Miler. Nó được chế tạo để chống chọi với thời tiết ẩm ướt với thiết kế chống thấm nước và mũ trùm đầu', 3, 7, 592000, 1, '2021-11-17 00:00:00', 367),
(147, 'Váy lụa đính pha lê Versace', 'Là một thiết kế thanh lịch, chiếc váy điêu khắc này được làm thủ công bằng lụa tơ tằm cao cấp. Bờ vai bồng bềnh cân đối với phần eo vừa vặn được trang trí bằng những điểm nhấn bằng pha lê đậm. Tạo kiểu với những chiếc máy bơm nạm pha lê để có một vẻ ngoài nổi bật vào buổi tối.', 4, 8, 1931000, 1, '2021-11-17 00:00:00', 680),
(148, 'Quần lửng cotton Fendi', 'Bermudas có thắt lưng co giãn, dây rút và có một túi zip nhỏ ở phía sau. Được làm từ chất liệu nỉ bông đen phối lông cừu. Các khóa kéo ở viền quần giấu lưới FF tech cho phép mặc quần với hai độ dài khác nhau.', 5, 9, 2618000, 1, '2021-11-17 00:00:00', 297),
(149, 'Túi đeo chéo MyEA nhỏ bằng nỉ có thêu logo', 'Emporio Armani đã tạo ra chiếc túi dành riêng cho bạn. MyEA Bag có thể được cá nhân hóa và tùy chỉnh theo bất kỳ cách nào bạn muốn. Chọn phong cách của bạn và tô điểm bằng các phụ kiện phản ánh con người của bạn.', 6, 10, 100000, 1, '2021-11-17 00:00:00', 448),
(150, 'Giày sneaker Beverly Hills LV', 'Giày thể thao Beverly Hills có chất liệu vải Monogram kim loại, phản ánh chủ đề chính của bộ sưu tập nam của mùa. Phần trên thanh lịch của mẫu này tương phản với đế ngoài thể thao bằng cao su trắng, siêu nhẹ.', 7, 1, 4727000, 1, '2021-11-17 00:00:00', 347),
(151, 'Mũ lưỡi trai Gucci', 'Các biểu tượng thương hiệu, logo có thể nhận biết ngay lập tức làm phong phú thêm các thiết kế theo những cách mới và bất ngờ. Đằng sau mỗi logo là truyền thống và giá trị của Ngôi nhà, một phương tiện vĩnh cửu mà người ta có thể mặc đi mặc lại. Đây là canvas Maxi GG xác định chiếc mũ bóng chày bằng gỗ mun và lạc đà này. Một đường viền bằng da màu nâu hoàn thiện phong cách.', 8, 2, 384000, 1, '2021-11-17 00:00:00', 391),
(152, 'Áo thun thêu hình chữ H 3D', 'Áo thun cổ thuyền tay ngắn bằng cotton thêu chữ \"H 3D\" (100% cotton)\n', 1, 3, 2687000, 1, '2021-11-17 00:00:00', 913),
(153, 'Áo sơ mi vải poplin Prada', 'Một trong những mẫu mang tính biểu tượng nhất của thương hiệu, trang trí một mặt của chiếc áo Double Match này được làm bằng bông co giãn và được xác định bằng đường cắt hình hộp giống như áo sơ mi ném bóng', 2, 4, 2748000, 1, '2021-11-17 00:00:00', 393),
(154, 'Áo gió Colorblock Adidas', 'Phòng gym, trận đấu hay tiệc after-party. Tùy bạn quyết định điểm đến. Để giúp bạn di chuyển tới nơi, chiếc áo gió adidas này chặn đứng gió lùa nhờ chất liệu ripstop siêu nhẹ. Đây sẽ là một lớp áo khoác ngoài tiện lợi bất kể dự báo thời tiết ra sao. Hãy gây ấn tượng mạnh mẽ với phong cách adidas đích thực.', 3, 5, 455000, 1, '2021-11-17 00:00:00', 228),
(155, 'Váy hoa Ralph Lauren', 'Với dáng chữ A và chân váy dài, chiếc váy lãng mạn này hứa hẹn chuyển động uyển chuyển theo từng bước chân. Nó có họa tiết in hoa mùa thu và được trang bị chi tiết với các nút ngọc trai chính hãng ở mỗi tay áo.', 4, 6, 3414000, 1, '2021-11-17 00:00:00', 958),
(156, 'Quần Nike Lil\'Penny', 'Chiếc quần bóng rổ cao cấp của Nike sử dụng chất liệu vải dày dặn và có độ bóng nhẹ.', 5, 7, 1051000, 1, '2021-11-17 00:00:00', 109),
(157, 'Túi Virtus Tote', 'Được thiết kế theo kiểu dáng hình chữ nhật linh hoạt, chiếc túi tote này là một người bạn đồng hành hoàn hảo cho nhiều dịp.', 6, 8, 4109000, 1, '2021-11-17 00:00:00', 670),
(158, 'Giày ống cao Fendi Force', 'Bốt kiểu trượt tuyết với dây rút và đế cao chịu lực. Làm bằng da đen. Phần chân được may bằng vải họa tiết jacquard FF màu đen xám.', 7, 9, 2704000, 1, '2021-11-17 00:00:00', 24),
(159, 'Mũ phớt Armani', 'Ngày nay, mũ phớt là một biểu tượng thực sự của sự quyến rũ, kết hợp chức năng thực dụng với một liều lượng mạnh mẽ của sự quyến rũ thanh lịch. Nó cũng thu hút sự chú ý vào khuôn mặt hoặc một mái tóc độc đáo', 8, 10, 3320000, 1, '2021-11-17 00:00:00', 110),
(160, 'Áo thun thêu hình động vật LV', 'Áo phông đồ họa này giới thiệu chủ đề Bãi biển của con nhộng. Ngực được trang trí bằng các mảng thêu hoàn toàn lấy cảm hứng từ động vật hoang dã biển, được tạo thành từ các hạt khâu trên áo. Được chế tác vừa vặn từ bông nhẹ, sản phẩm có họa tiết Monogram toàn thân, cổ áo dệt kim và nhãn hiệu Louis Vuitton từ trong ra ngoài ở mặt sau.', 1, 1, 118000, 1, '2021-11-17 00:00:00', 476),
(161, 'Áo sơ mi cotton kẻ dọc Gucci', 'Các hình dạng phản ánh phong cách từ những năm 70 được pha trộn và xếp lớp với các bóng bắt nguồn từ bây giờ. Được thiết kế với cổ áo nhọn lấy cảm hứng từ cổ điển và được làm phong phú bởi hình thêu Double G, chiếc áo sơ mi sọc trắng và xanh nhạt này có khuy măng sét.', 2, 2, 1615000, 1, '2021-11-17 00:00:00', 53),
(162, 'Áo khoác Denim', 'Áo khoác denim cotton (100% cotton)', 3, 3, 2124000, 1, '2021-11-17 00:00:00', 835),
(163, 'Váy vải Jacquard', 'Các họa tiết jacquard hình học gợi lại các thiết kế từ những năm sáu mươi tạo nên một dòng sản phẩm dệt kim mềm mại, thông thường mới, chơi với nhiều lớp và khám phá niềm vui của sự nhạy bén', 4, 4, 4294000, 1, '2021-11-17 00:00:00', 18),
(164, 'Quần Adidas Adventure', 'Di chuyển nhẹ nhàng, sẵn sàng ra sân. Chiếc túi gậy golf adidas này giúp bạn mang theo bộ gậy golf cần thiết tới sân tập hoặc sân đấu rộng lớn. Ngăn khóa kéo nhỏ đựng bóng và tee dự phòng. Quai đeo vai rời và quai xách giúp bạn mang vác dễ dàng.\nYêu thích hoạt động ngoài trời chính là tận hưởng cuộc sống. Đó cũng chính là nguồn cảm hứng đằng sau chiếc quần này. Thiết kế và họa tiết lấy cảm hứng từ kho di sản trang phục outdoor của adidas nhằm mang đến diện mạo vui mắt mà tiện dụng cho hành trình khám phá hàng ngày. Quanh khu nhà bạn hay dọc miền đất nước, sẽ luôn có những điều mới để bạn khám phá.', 5, 5, 2101000, 1, '2021-11-17 00:00:00', 586),
(165, 'Túi đeo chéo Wellington', 'Là một phần của bộ sưu tập Ralph Lauren Welington, chiếc túi đeo chéo này được các nghệ nhân bậc thầy ở Ý làm ​​thủ công tuyệt đẹp từ da bê và hoàn thiện với lớp lót bằng vải.', 6, 6, 465000, 1, '2021-11-17 00:00:00', 874),
(166, 'Giày Lebron 19', 'Các nhà vô địch trong tương lai có thể thống trị thời gian chơi như King James trong LeBron 19. Thêm vào đó, chúng tôi đã thêm vào thiết kế hỗ trợ mà những đứa trẻ nhỏ cần nó để chúng có thể chạy và đi bộ xung quanh với sự quyến rũ của LeBron.', 7, 7, 4374000, 1, '2021-11-17 00:00:00', 613),
(167, 'Mũ lưỡi trai họa tiết động vật biển Versace', 'Mũ bóng chày cổ điển in hình Trésor de la Mer đầy màu sắc tôn vinh thiên nhiên và hòa hợp với các yếu tố. Kiểu dáng này có một mấu phía sau có thể điều chỉnh để đảm bảo sự vừa vặn hoàn hảo.', 8, 8, 334000, 1, '2021-11-17 00:00:00', 443),
(168, 'Áo thun nhiều chữ F', 'Áo phông ngắn tay cổ thuyền quá khổ. Được làm bằng nhung đen với toàn bộ họa tiết FF chéo. Được tô điểm bằng tấm logo kim loại mạ vàng. Sản xuất tại Ý', 1, 9, 2825000, 1, '2021-11-17 00:00:00', 378),
(169, 'Áo sơ mi co giãn với logo trên cổ', 'Hãy thể hiện hay giữ nó một cách tinh tế, bạn sẽ không thể nhầm lẫn với biểu tượng chiến thắng của những sản phẩm thiết yếu của Emporio Armani. Ở đây, nó được đặt trên một miếng chèn jacquard tương phản giúp tăng cường cổ áo.', 2, 10, 4103000, 1, '2021-11-17 00:00:00', 558);
INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `brand_id`, `price`, `discount_id`, `createAt`, `sold`) VALUES
(170, 'Áo khoác Taverine 90\'s', 'Chiếc áo khoác mỏng này là tất cả về chủ đề Trompe l’Oeil của bộ sưu tập, với kiểu dệt jacquard có kết cấu tái tạo hiệu ứng của đá cẩm thạch travertine. Túi trước ngực có bút da màu vàng với chữ ký Louis Vuitton in nổi, trong khi nút trên cùng và nút cổ tay áo được ký hiệu bằng chỉ khâu LV. Các túi có nắp và một lớp lót lụa trơn hoàn thiện hiệu ứng.', 3, 1, 3653000, 1, '2021-11-17 00:00:00', 656),
(171, 'Váy len chữ G lồng nhau', 'Chữ G lồng vào nhau - một trong những mã dễ nhận biết nhất của Ngôi nhà - có hình dạng của một họa tiết jacquard. Được làm thủ công từ len, chiếc áo nịt này được xác định bởi cấu trúc có thể đảo ngược với một mặt màu đen thịnh hành và một mặt chủ yếu là màu trắng ngà.', 4, 2, 973000, 1, '2021-11-17 00:00:00', 606),
(172, 'Quần \"Piqures filantes\" Saint Germain', 'Quần được trang bị bằng vải cotton đan chéo không thấm nước với chi tiết \"Piqures filantes\" (100% cotton)', 5, 3, 812000, 1, '2021-11-17 00:00:00', 61),
(173, 'Túi lưới nhỏ Prada', 'Một linh hồn đương đại và những điểm nhấn quý giá là đặc điểm của chiếc túi tote nhỏ này được bao phủ hoàn toàn bằng sequins và tô điểm bằng logo chữ in ở mặt trước.', 6, 4, 756000, 1, '2021-11-17 00:00:00', 487),
(174, 'Giày Ultraboost21', 'Hàng loạt bản mẫu. Hàng loạt cải tiến. Hàng loạt thử nghiệm. Đồng hành cùng chúng tôi trên hành trình tìm kiếm sự hòa hợp đỉnh cao giữa trọng lượng, sự êm ái và độ đàn hồi. Ultraboost 21. Đón chào nguồn năng lượng hoàn trả phi thường.', 7, 5, 1536000, 1, '2021-11-17 00:00:00', 251),
(175, 'Mũ thể thao có logo cờ Mỹ Ralph Lauren', 'Logo lấy cảm hứng từ lá cờ Mỹ mang tính biểu tượng của Polo Sport làm điểm nhấn ở mặt trước của chiếc mũ chino bằng vải cotton này.', 8, 6, 627000, 1, '2021-11-17 00:00:00', 795),
(176, 'Áo thun Nike Dri-FIT', 'Áo phông Nike Dri-FIT giúp bạn luôn khô ráo và thoải mái ở bất cứ đâu khi tập luyện với chất liệu vải nhẹ thấm mồ hôi.', 1, 7, 2419000, 1, '2021-11-17 00:00:00', 223),
(177, 'Áo sơ mi Versace kẻ sọc', 'Theo một nét rất riêng của Versace về trang phục bảo hộ lao động, chiếc áo sơ mi poplin cotton xếp nếp này có phom dáng quá khổ, thoải mái. Nút lên được tô điểm bằng các điểm nhấn trong bản in thời Phục hưng Medusa.', 2, 8, 2881000, 1, '2021-11-17 00:00:00', 729),
(178, 'Áo khoác 4 cúc Fendi', 'Áo khoác đơn có túi ngực và túi vá. Đóng hai bên ngực có nút. Làm bằng vải gai dầu đen. Ve áo cổ điển được hoàn thiện bằng họa tiết thêu tay.', 3, 9, 4092000, 1, '2021-11-17 00:00:00', 975),
(179, 'Váy Milano có khóa', 'Món đồ cực kỳ nữ tính này sẽ làm nổi bật vóc dáng, tôn lên vẻ quyến rũ và tự tin trong mọi dịp. Chiếc váy bọc vải co giãn này phù hợp với hình dáng giống như một chiếc găng tay.', 4, 10, 3042000, 1, '2021-11-17 00:00:00', 690),
(180, 'Quần cổ điển LV', 'Một món đồ thanh lịch cho tủ quần áo nam tính, những chiếc quần cổ điển này được may đo vừa vặn từ len có nguồn gốc đáng tin cậy. Các chi tiết bao gồm một túi vải nỉ duy nhất ở phía sau.', 5, 1, 172000, 1, '2021-11-17 00:00:00', 525),
(181, 'Túi Gucci Bamboo', 'Các yếu tố di sản được tái hiện với một chút hiện đại xuyên suốt bộ sưu tập Aria. Là biểu tượng về nguồn gốc của Gucci, tre đã xuất hiện trong khắp các bộ sưu tập của Nhà từ những năm 40.', 6, 2, 1039000, 1, '2021-11-17 00:00:00', 556),
(182, 'Giày Donna 60 Pump', 'Pump trong vải kỹ thuật với lớp hoàn thiện bằng sa tanh và họa tiết rhinestone Chaine d\'Ancre. Để có một cái nhìn nữ tính táo bạo.', 7, 3, 899000, 1, '2021-11-17 00:00:00', 204),
(183, 'Mũ nylon tái chế có đính đá quý', 'Sự quyến rũ cổ điển đặc trưng cho chiếc mũ này được làm bằng Re-Nylon sáng tạo, một loại sợi nylon tái sinh được sản xuất từ ​​vật liệu nhựa tái chế, tinh khiết được thu thập trong đại dương, lưới đánh cá và sợi dệt.', 8, 4, 3000000, 1, '2021-11-17 00:00:00', 351),
(184, 'Áo thun chữ future icon', 'Kết nối với nguồn năng lượng thể thao toàn cầu với chiếc áo thun adidas này. Trên khắp thế giới, các vận động viên giống như bạn đang mang trên mình logo 3 Sọc như một biểu tượng của sự kiên trì, bền bỉ và tinh thần cộng đồng thông qua thể thao. Hãy tận hưởng cảm giác mềm mại của chất vải cotton và tự hào chia sẻ mối dây gắn kết ấy.', 1, 5, 3541000, 1, '2021-11-17 00:00:00', 142),
(185, 'Áo sơ mi Chambray cổ điển Ralph Lauren', 'Phiên bản này của chiếc áo sơ mi chambray mang tính biểu tượng của Ralph Lauren được cung cấp với nhiều màu sắc tươi mới.', 2, 6, 382000, 1, '2021-11-17 00:00:00', 658),
(186, 'Áo khoác Nike ESC', 'Được sản xuất tại Milan, Ý với sự kết hợp của các loại vải dệt kim và dệt thoi bền bỉ để tạo cảm giác cân bằng, chiếc áo khoác sơ mi chắc chắn này bổ sung một liều lượng tiện ích chu đáo cho thiết kế lấy cảm hứng từ quần áo bảo hộ lao động cổ điển.', 3, 7, 4682000, 1, '2021-11-17 00:00:00', 865),
(187, 'Váy có đai Versace', 'Thêm một chút màu sắc nổi bật cho chiếc váy đen nhỏ, thiết kế linh hoạt này được làm mới với đường ống in hình Phục hưng Medusa. Được chế tác từ viscose cady, kiểu dáng vừa vặn và rực rỡ được làm nổi bật với dây đai Medusa mảnh mai.', 4, 8, 416000, 1, '2021-11-17 00:00:00', 350),
(188, 'Quần lụa Fendi ', 'Bermudas được trang bị ở thắt lưng, với vòng thắt lưng và túi bên. Chốt zip che giấu. Được làm bằng lụa đỏ đan chéo với hình in micro Fendi Sky phù hợp với tông màu. Đệm nhẹ và chần bông với họa tiết kẻ chéo.', 5, 9, 1975000, 1, '2021-11-17 00:00:00', 157),
(189, 'Túi xô da thú đeo vai', 'Chiếc túi này có một vẻ ngoài trang nhã, hoàn hảo trong nhiều kiểu dáng. Thiết kế của nó được lấy cảm hứng từ các xu hướng từ những năm 1990, mà không làm mất đi phong cách tinh tế, phức tạp', 6, 10, 860000, 1, '2021-11-17 00:00:00', 733),
(190, 'Dép Mule LV mặt nước', 'Phiên bản theo mùa này của dép Waterfront có bằng cao su kim loại được chạm nổi với hoa văn Monogram.', 7, 1, 943000, 1, '2021-11-17 00:00:00', 194),
(191, 'Mũ Gucci có dây đeo và lông', 'Các tài liệu tham khảo về cưỡi ngựa, có từ những năm 1950, liên tục được xem lại theo những cách mới và bất ngờ. Tấm che mặt này được đặc trưng bởi một dây nịt bằng da màu đen, gợi nhớ đến những thứ được sử dụng trong cưỡi ngựa. Một sự thể hiện nổi bật của bờm ngựa hoàn thiện phong cách.', 8, 2, 4595000, 1, '2021-11-17 00:00:00', 770),
(192, 'Áo sơ mi có túi ', 'Áo sơ mi polo tay ngắn chất liệu cotton pique (100% cotton)', 2, 3, 3104000, 1, '2021-11-17 00:00:00', 267),
(193, 'Áo sơ mi Piqué', 'Chiếc áo sơ mi cổ điển piqué polo ngắn tay này nổi bật với thiết kế ôm vừa vặn và kiểu dáng đẹp. Biểu trưng tam giác có tông màu trang trí trên ngực.', 2, 4, 795000, 1, '2021-11-17 00:00:00', 26),
(194, 'Áo khoác đánh gôn Adidas', 'Khoác thêm một lớp áo nhẹ vào những ngày se lạnh trên sân golf. Chiếc áo khoác golf adidas này có cổ đứng cùng cổ tay và gấu áo bo viền cho cảm giác ôm vừa khít. Chất vải siêu co giãn cho phạm vi chuyển động tối đa. Thiết kế track jacket giúp bạn ghi điểm phong cách.', 3, 5, 867000, 1, '2021-11-17 00:00:00', 329),
(195, 'Váy len có cúc Ralph Lauren', 'Được thiết kế với một vạt áo ôm sát hình dáng và một chiếc gài cài cúc tinh tế, chiếc váy len merino này được cắt may để chuyển động uyển chuyển theo từng bước đi.', 4, 6, 4308000, 1, '2021-11-17 00:00:00', 569),
(196, 'Quần thể thao Nike', 'Một bộ quần áo rộng rãi, vừa vặn giúp bạn di chuyển mà không bị phân tâm và trông đẹp nhất.', 5, 7, 3044000, 1, '2021-11-17 00:00:00', 856),
(197, 'Túi Medusa Tote', 'Được làm từ vải bạt La Greca tráng phủ, chiếc túi tote cổ điển này được trang trí bằng Thẻ Medusa. Lấy cảm hứng từ graffiti, họa tiết tôn vinh sự hài hước và tinh thần nổi loạn của thương hiệu', 6, 8, 1910000, 1, '2021-11-17 00:00:00', 573),
(198, 'Ủng len Rockoko', 'Boots Rockoko với mũi giày tròn và phần chân boot cao đặc biệt bằng chất liệu vải co giãn. Làm bằng da đen. Chân dệt kim với họa tiết FF và sọc thể thao ở viền màu đen và nâu.', 7, 9, 4342000, 1, '2021-11-17 00:00:00', 298),
(199, 'Mũ len với logo Armani', 'Tất cả những gì bạn cần là một phụ kiện độc đáo để mang lại nét giản dị cho trang phục của bạn. Chiếc mũ len đan có gân nguyên chất này có một miếng dán logo đơn sắc, làm cho nó trở nên đặc biệt và dễ nhận biết ngay lập tức.', 8, 10, 1995000, 1, '2021-11-17 00:00:00', 772),
(200, 'Áo thun thêu họa tiết LV ', 'Chiếc áo phông thêu mặt dây chuyền LV này làm nổi bật lên một trong những chữ ký nổi bật của bộ sưu tập. Mặt dây chuyền được mô phỏng lại thành một họa tiết thêu trên nền áo phông cotton có độ dày vừa phải, hơi rộng. Ở mặt sau, một nhãn hiệu ứng từ trong ra ngoài cung cấp thêm một chữ ký. ', 1, 1, 814000, 1, '2021-11-17 00:00:00', 966),
(201, 'Áo sơ mi nam của mĩ', 'Được làm thủ công từ sợi tơ tằm hữu cơ, chiếc nắp sang trọng này có in hình Chữ ký Greca. Theo một nét rất riêng của Versace, thiết kế cũng có một Thẻ Medusa graffiti thể hiện tính hài hước và tính cách nổi loạn của thương hiệu', 2, 3, 1230000, 1, '2021-11-19 15:01:45', 514);

--
-- Bẫy `products`
--
DELIMITER $$
CREATE TRIGGER `after_product_insert` AFTER INSERT ON `products` FOR EACH ROW BEGIN
    IF (NEW.category_id = 6 OR NEW.category_id = 8) THEN
        INSERT INTO product_variant (id_product, color, size, quantity, price)
        VALUES
        (NEW.id, 'Default', 'Default', 100, NEW.price);
    ELSEIF NEW.category_id = 7 THEN
    	INSERT INTO product_variant (id_product, color, size, quantity, price)
        VALUES
    	(NEW.id, 'Default', '38', 100, NEW.price),
        (NEW.id, 'Default', '39', 100, NEW.price * 1.05),
        (NEW.id, 'Default', '40', 100, NEW.price * 1.1),
        (NEW.id, 'Default', '41', 100, NEW.price * 1.15),
        (NEW.id, 'Default', '42', 100, NEW.price * 1.2),
        (NEW.id, 'Default', '43', 100, NEW.price * 1.25);
    ELSE  
    INSERT INTO product_variant (id_product, color, size, quantity, price)
        VALUES
        (NEW.id, 'white', 'S', 100, NEW.price),
        (NEW.id, 'white', 'M', 100, NEW.price * 1.05),
        (NEW.id, 'white', 'L', 100, NEW.price * 1.1),
        (NEW.id, 'black', 'S', 100, NEW.price),
        (NEW.id, 'black', 'M', 100, NEW.price * 1.05),
        (NEW.id, 'black', 'L', 100, NEW.price * 1.1),
        (NEW.id, 'brown', 'S', 100, NEW.price),
        (NEW.id, 'brown', 'M', 100, NEW.price * 1.05),
        (NEW.id, 'brown', 'L', 100, NEW.price * 1.1);
    END IF;
    INSERT INTO image (id_product, description, url, type)
		VALUES 
		(NEW.id, 'Ảnh hiển thị', CONCAT('', NEW.id, '-1.jpg'), 'thumbnail'), 
        (NEW.id, 'Ảnh 1', CONCAT('', NEW.id, '-2.jpg'), null),
        (NEW.id, 'Ảnh 2', CONCAT('', NEW.id, '-3.jpg'), null);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_product_update` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
    IF (NEW.price <> OLD.price) THEN
    	IF (NEW.category_id = 6 OR NEW.category_id = 8) THEN
        UPDATE product_variant SET product_variant.price = NEW.price WHERE id_product = NEW.id;
    	ELSEIF NEW.category_id = 7 THEN
    	UPDATE product_variant SET product_variant.price = NEW.price WHERE id_product = NEW.id AND size = '38';
        UPDATE product_variant SET product_variant.price = NEW.price * 1.05 WHERE id_product = NEW.id AND size = '39';
        UPDATE product_variant SET product_variant.price = NEW.price * 1.1 WHERE id_product = NEW.id AND size = '40';
        UPDATE product_variant SET product_variant.price = NEW.price * 1.15 WHERE id_product = NEW.id AND size = '41';
        UPDATE product_variant SET product_variant.price = NEW.price * 1.2 WHERE id_product = NEW.id AND size = '42';
        UPDATE product_variant SET product_variant.price = NEW.price * 1.25 WHERE id_product = NEW.id AND size = '43';
    	ELSE  
    	UPDATE product_variant SET product_variant.price = NEW.price WHERE id_product = NEW.id AND size = 'S';
        UPDATE product_variant SET product_variant.price = NEW.price * 1.05 WHERE id_product = NEW.id AND size = 'M';
        UPDATE product_variant SET product_variant.price = NEW.price * 1.1 WHERE id_product = NEW.id AND size = 'L';
    	END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category`
--

CREATE TABLE `product_category` (
  `id_` int(11) NOT NULL,
  `name_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc_category` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_category`
--

INSERT INTO `product_category` (`id_`, `name_category`, `desc_category`, `image`) VALUES
(1, 'Áo thun', 'Description for T-shirt', '1.jpg'),
(2, 'Áo sơ mi', 'Description for Shirt', '2.jpg'),
(3, 'Áo khoác ', 'Description for Jacket', '3.jpg'),
(4, 'Váy', 'Description for Dress', '4.jpg'),
(5, 'Quần', 'Description for Trouser', '5.jpg'),
(6, 'Túi', 'Description for Bag', '6.jpg'),
(7, 'Giày dép', 'Description for Shoes', '7.jpg'),
(8, 'Mũ', 'Description for Hat', '8.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variant`
--

CREATE TABLE `product_variant` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variant`
--

INSERT INTO `product_variant` (`id`, `id_product`, `color`, `size`, `quantity`, `price`) VALUES
(1, 1, 'white', 'S', 100, 300000),
(2, 1, 'white', 'M', 100, 315000),
(3, 1, 'white', 'L', 100, 330000),
(4, 1, 'black', 'S', 100, 300000),
(5, 1, 'black', 'M', 100, 315000),
(6, 1, 'black', 'L', 100, 330000),
(7, 1, 'brown', 'S', 100, 300000),
(8, 1, 'brown', 'M', 100, 315000),
(9, 1, 'brown', 'L', 100, 330000),
(10, 2, 'white', 'S', 100, 2630000),
(11, 2, 'white', 'M', 100, 2761500),
(12, 2, 'white', 'L', 94, 2893000),
(13, 2, 'black', 'S', 100, 2630000),
(14, 2, 'black', 'M', 100, 2761500),
(15, 2, 'black', 'L', 100, 2893000),
(16, 2, 'brown', 'S', 100, 2630000),
(17, 2, 'brown', 'M', 100, 2761500),
(18, 2, 'brown', 'L', 100, 2893000),
(19, 3, 'white', 'S', 100, 2746000),
(20, 3, 'white', 'M', 100, 2883300),
(21, 3, 'white', 'L', 100, 3020600),
(22, 3, 'black', 'S', 100, 2746000),
(23, 3, 'black', 'M', 100, 2883300),
(24, 3, 'black', 'L', 100, 3020600),
(25, 3, 'brown', 'S', 100, 2746000),
(26, 3, 'brown', 'M', 100, 2883300),
(27, 3, 'brown', 'L', 100, 3020600),
(28, 4, 'white', 'S', 100, 2442000),
(29, 4, 'white', 'M', 100, 2564100),
(30, 4, 'white', 'L', 97, 2686200),
(31, 4, 'black', 'S', 100, 2442000),
(32, 4, 'black', 'M', 100, 2564100),
(33, 4, 'black', 'L', 100, 2686200),
(34, 4, 'brown', 'S', 100, 2442000),
(35, 4, 'brown', 'M', 100, 2564100),
(36, 4, 'brown', 'L', 100, 2686200),
(37, 5, 'Default', 'Default', 100, 4935000),
(38, 6, 'Default', '38', 100, 1967000),
(39, 6, 'Default', '39', 99, 2065350),
(40, 6, 'Default', '40', 100, 2163700),
(41, 6, 'Default', '41', 100, 2262050),
(42, 6, 'Default', '42', 100, 2360400),
(43, 6, 'Default', '43', 100, 2458750),
(44, 7, 'Default', 'Default', 98, 3495000),
(45, 8, 'white', 'S', 100, 5006000),
(46, 8, 'white', 'M', 100, 5256300),
(47, 8, 'white', 'L', 100, 5506600),
(48, 8, 'black', 'S', 100, 5006000),
(49, 8, 'black', 'M', 100, 5256300),
(50, 8, 'black', 'L', 100, 5506600),
(51, 8, 'brown', 'S', 100, 5006000),
(52, 8, 'brown', 'M', 100, 5256300),
(53, 8, 'brown', 'L', 100, 5506600),
(54, 9, 'white', 'S', 100, 1743000),
(55, 9, 'white', 'M', 100, 1830150),
(56, 9, 'white', 'L', 100, 1917300),
(57, 9, 'black', 'S', 100, 1743000),
(58, 9, 'black', 'M', 100, 1830150),
(59, 9, 'black', 'L', 100, 1917300),
(60, 9, 'brown', 'S', 100, 1743000),
(61, 9, 'brown', 'M', 100, 1830150),
(62, 9, 'brown', 'L', 100, 1917300),
(66, 10, 'black', 'S', 100, 557000),
(67, 10, 'black', 'M', 100, 584850),
(68, 10, 'black', 'L', 100, 612700),
(72, 11, 'white', 'S', 100, 4189000),
(73, 11, 'white', 'M', 100, 4398450),
(74, 11, 'white', 'L', 100, 4607900),
(75, 11, 'black', 'S', 100, 4189000),
(76, 11, 'black', 'M', 100, 4398450),
(77, 11, 'black', 'L', 100, 4607900),
(78, 11, 'brown', 'S', 100, 4189000),
(79, 11, 'brown', 'M', 100, 4398450),
(80, 11, 'brown', 'L', 100, 4607900),
(81, 12, 'white', 'S', 100, 4087000),
(82, 12, 'white', 'M', 100, 4291350),
(83, 12, 'white', 'L', 100, 4495700),
(84, 12, 'black', 'S', 100, 4087000),
(85, 12, 'black', 'M', 100, 4291350),
(86, 12, 'black', 'L', 100, 4495700),
(87, 12, 'brown', 'S', 100, 4087000),
(88, 12, 'brown', 'M', 100, 4291350),
(89, 12, 'brown', 'L', 100, 4495700),
(90, 13, 'Default', 'Default', 100, 4423000),
(91, 14, 'Default', '39', 100, 4147000),
(92, 14, 'Default', '38', 100, 4354350),
(93, 14, 'Default', '40', 100, 4561700),
(94, 14, 'Default', '41', 100, 4769050),
(95, 14, 'Default', '42', 100, 4976400),
(96, 14, 'Default', '43', 100, 5183750),
(97, 15, 'Default', 'Default', 100, 1766000),
(98, 16, 'white', 'S', 100, 274000),
(99, 16, 'white', 'M', 96, 287700),
(100, 16, 'white', 'L', 100, 301400),
(101, 16, 'black', 'S', 98, 274000),
(102, 16, 'black', 'M', 90, 287700),
(103, 16, 'black', 'L', 99, 301400),
(104, 16, 'brown', 'S', 100, 274000),
(105, 16, 'brown', 'M', 97, 287700),
(106, 16, 'brown', 'L', 100, 301400),
(107, 17, 'white', 'S', 100, 2578000),
(108, 17, 'white', 'M', 100, 2706900),
(109, 17, 'white', 'L', 100, 2835800),
(110, 17, 'black', 'S', 100, 2578000),
(111, 17, 'black', 'M', 100, 2706900),
(112, 17, 'black', 'L', 100, 2835800),
(113, 17, 'brown', 'S', 100, 2578000),
(114, 17, 'brown', 'M', 100, 2706900),
(115, 17, 'brown', 'L', 100, 2835800),
(116, 18, 'white', 'S', 100, 1064000),
(117, 18, 'white', 'M', 100, 1117200),
(118, 18, 'white', 'L', 100, 1170400),
(119, 18, 'black', 'S', 100, 1064000),
(120, 18, 'black', 'M', 100, 1117200),
(121, 18, 'black', 'L', 100, 1170400),
(122, 18, 'brown', 'S', 100, 1064000),
(123, 18, 'brown', 'M', 100, 1117200),
(124, 18, 'brown', 'L', 100, 1170400),
(125, 19, 'white', 'S', 100, 594000),
(126, 19, 'white', 'M', 100, 623700),
(127, 19, 'white', 'L', 100, 653400),
(128, 19, 'black', 'S', 98, 594000),
(129, 19, 'black', 'M', 100, 623700),
(130, 19, 'black', 'L', 100, 653400),
(131, 19, 'brown', 'S', 100, 594000),
(132, 19, 'brown', 'M', 100, 623700),
(133, 19, 'brown', 'L', 100, 653400),
(134, 20, 'white', 'S', 100, 402000),
(135, 20, 'white', 'M', 100, 422100),
(136, 20, 'white', 'L', 100, 442200),
(137, 20, 'black', 'S', 100, 402000),
(138, 20, 'black', 'M', 100, 422100),
(139, 20, 'black', 'L', 100, 442200),
(140, 20, 'brown', 'S', 100, 402000),
(141, 20, 'brown', 'M', 100, 422100),
(142, 20, 'brown', 'L', 100, 442200),
(143, 21, 'Default', 'Default', 100, 1821000),
(144, 22, 'Default', '38', 100, 3216000),
(145, 22, 'Default', '39', 100, 3376800),
(146, 22, 'Default', '40', 100, 3537600),
(147, 22, 'Default', '41', 100, 3698400),
(148, 22, 'Default', '42', 100, 3859200),
(149, 22, 'Default', '43', 100, 4020000),
(150, 23, 'Default', 'Default', 98, 2358000),
(151, 24, 'white', 'S', 100, 113000),
(152, 24, 'white', 'M', 100, 118650),
(153, 24, 'white', 'L', 100, 124300),
(154, 24, 'black', 'S', 100, 113000),
(155, 24, 'black', 'M', 100, 118650),
(156, 24, 'black', 'L', 100, 124300),
(157, 24, 'brown', 'S', 100, 113000),
(158, 24, 'brown', 'M', 100, 118650),
(159, 24, 'brown', 'L', 100, 124300),
(160, 25, 'white', 'S', 100, 579000),
(161, 25, 'white', 'M', 100, 607950),
(162, 25, 'white', 'L', 100, 636900),
(163, 25, 'black', 'S', 100, 579000),
(164, 25, 'black', 'M', 100, 607950),
(165, 25, 'black', 'L', 100, 636900),
(166, 25, 'brown', 'S', 100, 579000),
(167, 25, 'brown', 'M', 100, 607950),
(168, 25, 'brown', 'L', 100, 636900),
(169, 26, 'white', 'S', 100, 418000),
(170, 26, 'white', 'M', 100, 438900),
(171, 26, 'white', 'L', 100, 459800),
(172, 26, 'black', 'S', 100, 418000),
(173, 26, 'black', 'M', 100, 438900),
(174, 26, 'black', 'L', 100, 459800),
(175, 26, 'brown', 'S', 100, 418000),
(176, 26, 'brown', 'M', 100, 438900),
(177, 26, 'brown', 'L', 100, 459800),
(178, 27, 'white', 'S', 100, 368000),
(179, 27, 'white', 'M', 100, 386400),
(180, 27, 'white', 'L', 100, 404800),
(181, 27, 'black', 'S', 100, 368000),
(182, 27, 'black', 'M', 100, 386400),
(183, 27, 'black', 'L', 100, 404800),
(184, 27, 'brown', 'S', 100, 368000),
(185, 27, 'brown', 'M', 100, 386400),
(186, 27, 'brown', 'L', 100, 404800),
(187, 28, 'white', 'S', 100, 3945000),
(188, 28, 'white', 'M', 100, 4142250),
(189, 28, 'white', 'L', 100, 4339500),
(190, 28, 'black', 'S', 100, 3945000),
(191, 28, 'black', 'M', 100, 4142250),
(192, 28, 'black', 'L', 100, 4339500),
(193, 28, 'brown', 'S', 100, 3945000),
(194, 28, 'brown', 'M', 100, 4142250),
(195, 28, 'brown', 'L', 100, 4339500),
(196, 29, 'Default', 'Default', 100, 3692000),
(197, 30, 'Default', '38', 100, 534000),
(198, 30, 'Default', '39', 100, 560700),
(199, 30, 'Default', '40', 100, 587400),
(200, 30, 'Default', '41', 100, 614100),
(201, 30, 'Default', '42', 100, 640800),
(202, 30, 'Default', '43', 100, 667500),
(203, 31, 'Default', 'Default', 100, 5098000),
(204, 32, 'white', 'S', 100, 1341000),
(205, 32, 'white', 'M', 100, 1408050),
(206, 32, 'white', 'L', 100, 1475100),
(207, 32, 'black', 'S', 100, 1341000),
(208, 32, 'black', 'M', 100, 1408050),
(209, 32, 'black', 'L', 100, 1475100),
(210, 32, 'brown', 'S', 100, 1341000),
(211, 32, 'brown', 'M', 100, 1408050),
(212, 32, 'brown', 'L', 100, 1475100),
(213, 33, 'white', 'S', 100, 5044000),
(214, 33, 'white', 'M', 100, 5296200),
(215, 33, 'white', 'L', 100, 5548400),
(216, 33, 'black', 'S', 100, 5044000),
(217, 33, 'black', 'M', 100, 5296200),
(218, 33, 'black', 'L', 100, 5548400),
(219, 33, 'brown', 'S', 100, 5044000),
(220, 33, 'brown', 'M', 100, 5296200),
(221, 33, 'brown', 'L', 100, 5548400),
(222, 34, 'white', 'S', 100, 3465000),
(223, 34, 'white', 'M', 100, 3638250),
(224, 34, 'white', 'L', 100, 3811500),
(225, 34, 'black', 'S', 100, 3465000),
(226, 34, 'black', 'M', 100, 3638250),
(227, 34, 'black', 'L', 100, 3811500),
(228, 34, 'brown', 'S', 100, 3465000),
(229, 34, 'brown', 'M', 100, 3638250),
(230, 34, 'brown', 'L', 100, 3811500),
(231, 35, 'white', 'S', 100, 3785000),
(232, 35, 'white', 'M', 100, 3974250),
(233, 35, 'white', 'L', 100, 4163500),
(234, 35, 'black', 'S', 100, 3785000),
(235, 35, 'black', 'M', 100, 3974250),
(236, 35, 'black', 'L', 100, 4163500),
(237, 35, 'brown', 'S', 100, 3785000),
(238, 35, 'brown', 'M', 100, 3974250),
(239, 35, 'brown', 'L', 100, 4163500),
(240, 36, 'white', 'S', 97, 4230000),
(241, 36, 'white', 'M', 100, 4441500),
(242, 36, 'white', 'L', 100, 4653000),
(243, 36, 'black', 'S', 100, 4230000),
(244, 36, 'black', 'M', 100, 4441500),
(245, 36, 'black', 'L', 100, 4653000),
(246, 36, 'brown', 'S', 100, 4230000),
(247, 36, 'brown', 'M', 100, 4441500),
(248, 36, 'brown', 'L', 100, 4653000),
(249, 37, 'Default', 'Default', 100, 161000),
(250, 38, 'Default', '38', 100, 3065000),
(251, 38, 'Default', '39', 100, 3218250),
(252, 38, 'Default', '40', 100, 3371500),
(253, 38, 'Default', '41', 100, 3524750),
(254, 38, 'Default', '42', 100, 3678000),
(255, 38, 'Default', '43', 100, 3831250),
(256, 39, 'Default', 'Default', 100, 1270000),
(257, 40, 'white', 'S', 100, 608000),
(258, 40, 'white', 'M', 100, 638400),
(259, 40, 'white', 'L', 100, 668800),
(260, 40, 'black', 'S', 100, 608000),
(261, 40, 'black', 'M', 100, 638400),
(262, 40, 'black', 'L', 100, 668800),
(263, 40, 'brown', 'S', 100, 608000),
(264, 40, 'brown', 'M', 100, 638400),
(265, 40, 'brown', 'L', 100, 668800),
(266, 41, 'white', 'S', 100, 392000),
(267, 41, 'white', 'M', 100, 411600),
(268, 41, 'white', 'L', 100, 431200),
(269, 41, 'black', 'S', 100, 392000),
(270, 41, 'black', 'M', 100, 411600),
(271, 41, 'black', 'L', 100, 431200),
(272, 41, 'brown', 'S', 100, 392000),
(273, 41, 'brown', 'M', 100, 411600),
(274, 41, 'brown', 'L', 100, 431200),
(275, 42, 'white', 'S', 100, 4074000),
(276, 42, 'white', 'M', 100, 4277700),
(277, 42, 'white', 'L', 100, 4481400),
(278, 42, 'black', 'S', 100, 4074000),
(279, 42, 'black', 'M', 100, 4277700),
(280, 42, 'black', 'L', 100, 4481400),
(281, 42, 'brown', 'S', 99, 4074000),
(282, 42, 'brown', 'M', 100, 4277700),
(283, 42, 'brown', 'L', 100, 4481400),
(284, 43, 'white', 'S', 100, 3473000),
(285, 43, 'white', 'M', 100, 3646650),
(286, 43, 'white', 'L', 100, 3820300),
(287, 43, 'black', 'S', 100, 3473000),
(288, 43, 'black', 'M', 100, 3646650),
(289, 43, 'black', 'L', 100, 3820300),
(290, 43, 'brown', 'S', 100, 3473000),
(291, 43, 'brown', 'M', 100, 3646650),
(292, 43, 'brown', 'L', 100, 3820300),
(293, 44, 'white', 'S', 100, 344000),
(294, 44, 'white', 'M', 100, 361200),
(295, 44, 'white', 'L', 100, 378400),
(296, 44, 'black', 'S', 100, 344000),
(297, 44, 'black', 'M', 100, 361200),
(298, 44, 'black', 'L', 100, 378400),
(299, 44, 'brown', 'S', 100, 344000),
(300, 44, 'brown', 'M', 100, 361200),
(301, 44, 'brown', 'L', 100, 378400),
(302, 45, 'Default', 'Default', 100, 241000),
(303, 46, 'Default', '38', 100, 600000),
(304, 46, 'Default', '39', 100, 630000),
(305, 46, 'Default', '40', 100, 660000),
(306, 46, 'Default', '41', 100, 690000),
(307, 46, 'Default', '42', 100, 720000),
(308, 46, 'Default', '43', 100, 750000),
(309, 47, 'Default', 'Default', 100, 4322000),
(310, 48, 'white', 'S', 100, 996000),
(311, 48, 'white', 'M', 100, 1045800),
(312, 48, 'white', 'L', 100, 1095600),
(313, 48, 'black', 'S', 100, 996000),
(314, 48, 'black', 'M', 100, 1045800),
(315, 48, 'black', 'L', 100, 1095600),
(316, 48, 'brown', 'S', 100, 996000),
(317, 48, 'brown', 'M', 100, 1045800),
(318, 48, 'brown', 'L', 100, 1095600),
(319, 49, 'white', 'S', 100, 4800000),
(320, 49, 'white', 'M', 100, 5040000),
(321, 49, 'white', 'L', 100, 5280000),
(322, 49, 'black', 'S', 100, 4800000),
(323, 49, 'black', 'M', 100, 5040000),
(324, 49, 'black', 'L', 100, 5280000),
(325, 49, 'brown', 'S', 100, 4800000),
(326, 49, 'brown', 'M', 100, 5040000),
(327, 49, 'brown', 'L', 100, 5280000),
(328, 50, 'white', 'S', 100, 231000),
(329, 50, 'white', 'M', 100, 242550),
(330, 50, 'white', 'L', 100, 254100),
(331, 50, 'black', 'S', 100, 231000),
(332, 50, 'black', 'M', 100, 242550),
(333, 50, 'black', 'L', 100, 254100),
(334, 50, 'brown', 'S', 100, 231000),
(335, 50, 'brown', 'M', 100, 242550),
(336, 50, 'brown', 'L', 100, 254100),
(337, 51, 'white', 'S', 100, 2988000),
(338, 51, 'white', 'M', 100, 3137400),
(339, 51, 'white', 'L', 100, 3286800),
(340, 51, 'black', 'S', 100, 2988000),
(341, 51, 'black', 'M', 100, 3137400),
(342, 51, 'black', 'L', 100, 3286800),
(343, 51, 'brown', 'S', 100, 2988000),
(344, 51, 'brown', 'M', 100, 3137400),
(345, 51, 'brown', 'L', 100, 3286800),
(346, 52, 'white', 'S', 100, 426000),
(347, 52, 'white', 'M', 100, 447300),
(348, 52, 'white', 'L', 100, 468600),
(349, 52, 'black', 'S', 100, 426000),
(350, 52, 'black', 'M', 100, 447300),
(351, 52, 'black', 'L', 100, 468600),
(352, 52, 'brown', 'S', 100, 426000),
(353, 52, 'brown', 'M', 100, 447300),
(354, 52, 'brown', 'L', 100, 468600),
(355, 53, 'Default', 'Default', 100, 3760000),
(356, 54, 'Default', '38', 100, 1592000),
(357, 54, 'Default', '39', 100, 1671600),
(358, 54, 'Default', '40', 100, 1751200),
(359, 54, 'Default', '41', 100, 1830800),
(360, 54, 'Default', '42', 100, 1910400),
(361, 54, 'Default', '43', 100, 1990000),
(362, 55, 'Default', 'Default', 100, 4873000),
(363, 56, 'white', 'S', 100, 2760000),
(364, 56, 'white', 'M', 100, 2898000),
(365, 56, 'white', 'L', 100, 3036000),
(366, 56, 'black', 'S', 100, 2760000),
(367, 56, 'black', 'M', 100, 2898000),
(368, 56, 'black', 'L', 100, 3036000),
(369, 56, 'brown', 'S', 100, 2760000),
(370, 56, 'brown', 'M', 100, 2898000),
(371, 56, 'brown', 'L', 100, 3036000),
(372, 57, 'white', 'S', 100, 3963000),
(373, 57, 'white', 'M', 100, 4161150),
(374, 57, 'white', 'L', 100, 4359300),
(375, 57, 'black', 'S', 100, 3963000),
(376, 57, 'black', 'M', 100, 4161150),
(377, 57, 'black', 'L', 100, 4359300),
(378, 57, 'brown', 'S', 100, 3963000),
(379, 57, 'brown', 'M', 100, 4161150),
(380, 57, 'brown', 'L', 100, 4359300),
(381, 58, 'white', 'S', 100, 651000),
(382, 58, 'white', 'M', 100, 683550),
(383, 58, 'white', 'L', 100, 716100),
(384, 58, 'black', 'S', 100, 651000),
(385, 58, 'black', 'M', 100, 683550),
(386, 58, 'black', 'L', 100, 716100),
(387, 58, 'brown', 'S', 100, 651000),
(388, 58, 'brown', 'M', 99, 683550),
(389, 58, 'brown', 'L', 100, 716100),
(390, 59, 'white', 'S', 100, 5077000),
(391, 59, 'white', 'M', 100, 5330850),
(392, 59, 'white', 'L', 100, 5584700),
(393, 59, 'black', 'S', 100, 5077000),
(394, 59, 'black', 'M', 100, 5330850),
(395, 59, 'black', 'L', 100, 5584700),
(396, 59, 'brown', 'S', 100, 5077000),
(397, 59, 'brown', 'M', 100, 5330850),
(398, 59, 'brown', 'L', 100, 5584700),
(399, 60, 'white', 'S', 100, 3048000),
(400, 60, 'white', 'M', 100, 3200400),
(401, 60, 'white', 'L', 100, 3352800),
(402, 60, 'black', 'S', 100, 3048000),
(403, 60, 'black', 'M', 100, 3200400),
(404, 60, 'black', 'L', 100, 3352800),
(405, 60, 'brown', 'S', 100, 3048000),
(406, 60, 'brown', 'M', 100, 3200400),
(407, 60, 'brown', 'L', 100, 3352800),
(408, 61, 'Default', 'Default', 100, 131000),
(409, 62, 'Default', '38', 100, 404000),
(410, 62, 'Default', '39', 100, 424200),
(411, 62, 'Default', '40', 100, 444400),
(412, 62, 'Default', '41', 100, 464600),
(413, 62, 'Default', '42', 100, 484800),
(414, 62, 'Default', '43', 100, 505000),
(415, 63, 'Default', 'Default', 100, 2090000),
(416, 64, 'white', 'S', 100, 4293000),
(417, 64, 'white', 'M', 100, 4507650),
(418, 64, 'white', 'L', 100, 4722300),
(419, 64, 'black', 'S', 100, 4293000),
(420, 64, 'black', 'M', 100, 4507650),
(421, 64, 'black', 'L', 100, 4722300),
(422, 64, 'brown', 'S', 100, 4293000),
(423, 64, 'brown', 'M', 100, 4507650),
(424, 64, 'brown', 'L', 100, 4722300),
(425, 65, 'white', 'S', 100, 505000),
(426, 65, 'white', 'M', 100, 530250),
(427, 65, 'white', 'L', 100, 555500),
(428, 65, 'black', 'S', 100, 505000),
(429, 65, 'black', 'M', 100, 530250),
(430, 65, 'black', 'L', 100, 555500),
(431, 65, 'brown', 'S', 100, 505000),
(432, 65, 'brown', 'M', 100, 530250),
(433, 65, 'brown', 'L', 100, 555500),
(434, 66, 'white', 'S', 100, 1123000),
(435, 66, 'white', 'M', 100, 1179150),
(436, 66, 'white', 'L', 100, 1235300),
(437, 66, 'black', 'S', 100, 1123000),
(438, 66, 'black', 'M', 100, 1179150),
(439, 66, 'black', 'L', 100, 1235300),
(440, 66, 'brown', 'S', 100, 1123000),
(441, 66, 'brown', 'M', 100, 1179150),
(442, 66, 'brown', 'L', 100, 1235300),
(443, 67, 'white', 'S', 100, 3075000),
(444, 67, 'white', 'M', 100, 3228750),
(445, 67, 'white', 'L', 100, 3382500),
(446, 67, 'black', 'S', 100, 3075000),
(447, 67, 'black', 'M', 100, 3228750),
(448, 67, 'black', 'L', 100, 3382500),
(449, 67, 'brown', 'S', 100, 3075000),
(450, 67, 'brown', 'M', 100, 3228750),
(451, 67, 'brown', 'L', 100, 3382500),
(452, 68, 'white', 'S', 100, 2718000),
(453, 68, 'white', 'M', 100, 2853900),
(454, 68, 'white', 'L', 100, 2989800),
(455, 68, 'black', 'S', 100, 2718000),
(456, 68, 'black', 'M', 100, 2853900),
(457, 68, 'black', 'L', 100, 2989800),
(458, 68, 'brown', 'S', 100, 2718000),
(459, 68, 'brown', 'M', 100, 2853900),
(460, 68, 'brown', 'L', 100, 2989800),
(461, 69, 'Default', 'Default', 100, 2954000),
(462, 70, 'Default', '38', 100, 2646000),
(463, 70, 'Default', '39', 100, 2778300),
(464, 70, 'Default', '40', 100, 2910600),
(465, 70, 'Default', '41', 100, 3042900),
(466, 70, 'Default', '42', 100, 3175200),
(467, 70, 'Default', '43', 100, 3307500),
(468, 71, 'Default', 'Default', 100, 2683000),
(469, 72, 'white', 'S', 100, 973000),
(470, 72, 'white', 'M', 100, 1021650),
(471, 72, 'white', 'L', 100, 1070300),
(472, 72, 'black', 'S', 100, 973000),
(473, 72, 'black', 'M', 100, 1021650),
(474, 72, 'black', 'L', 100, 1070300),
(475, 72, 'brown', 'S', 100, 973000),
(476, 72, 'brown', 'M', 100, 1021650),
(477, 72, 'brown', 'L', 100, 1070300),
(478, 73, 'white', 'S', 100, 273000),
(479, 73, 'white', 'M', 100, 286650),
(480, 73, 'white', 'L', 100, 300300),
(481, 73, 'black', 'S', 100, 273000),
(482, 73, 'black', 'M', 100, 286650),
(483, 73, 'black', 'L', 100, 300300),
(484, 73, 'brown', 'S', 100, 273000),
(485, 73, 'brown', 'M', 100, 286650),
(486, 73, 'brown', 'L', 100, 300300),
(487, 74, 'white', 'S', 100, 4309000),
(488, 74, 'white', 'M', 100, 4524450),
(489, 74, 'white', 'L', 100, 4739900),
(490, 74, 'black', 'S', 100, 4309000),
(491, 74, 'black', 'M', 100, 4524450),
(492, 74, 'black', 'L', 100, 4739900),
(493, 74, 'brown', 'S', 100, 4309000),
(494, 74, 'brown', 'M', 100, 4524450),
(495, 74, 'brown', 'L', 100, 4739900),
(496, 75, 'white', 'S', 100, 2971000),
(497, 75, 'white', 'M', 100, 3119550),
(498, 75, 'white', 'L', 100, 3268100),
(499, 75, 'black', 'S', 100, 2971000),
(500, 75, 'black', 'M', 100, 3119550),
(501, 75, 'black', 'L', 100, 3268100),
(502, 75, 'brown', 'S', 97, 2971000),
(503, 75, 'brown', 'M', 100, 3119550),
(504, 75, 'brown', 'L', 100, 3268100),
(505, 76, 'white', 'S', 100, 3846000),
(506, 76, 'white', 'M', 100, 4038300),
(507, 76, 'white', 'L', 100, 4230600),
(508, 76, 'black', 'S', 100, 3846000),
(509, 76, 'black', 'M', 100, 4038300),
(510, 76, 'black', 'L', 100, 4230600),
(511, 76, 'brown', 'S', 100, 3846000),
(512, 76, 'brown', 'M', 100, 4038300),
(513, 76, 'brown', 'L', 100, 4230600),
(514, 77, 'Default', 'Default', 100, 418000),
(515, 78, 'Default', '38', 100, 2089000),
(516, 78, 'Default', '39', 100, 2193450),
(517, 78, 'Default', '40', 100, 2297900),
(518, 78, 'Default', '41', 100, 2402350),
(519, 78, 'Default', '42', 100, 2506800),
(520, 78, 'Default', '43', 100, 2611250),
(521, 79, 'Default', 'Default', 100, 1983000),
(522, 80, 'white', 'S', 100, 590000),
(523, 80, 'white', 'M', 100, 619500),
(524, 80, 'white', 'L', 100, 649000),
(525, 80, 'black', 'S', 100, 590000),
(526, 80, 'black', 'M', 98, 619500),
(527, 80, 'black', 'L', 100, 649000),
(528, 80, 'red', 'S', 100, 590000),
(529, 80, 'red', 'M', 100, 619500),
(530, 80, 'red', 'L', 100, 649000),
(531, 81, 'white', 'S', 100, 4323000),
(532, 81, 'white', 'M', 100, 4539150),
(533, 81, 'white', 'L', 100, 4755300),
(534, 81, 'black', 'S', 100, 4323000),
(535, 81, 'black', 'M', 100, 4539150),
(536, 81, 'black', 'L', 100, 4755300),
(537, 81, 'brown', 'S', 100, 4323000),
(538, 81, 'brown', 'M', 100, 4539150),
(539, 81, 'brown', 'L', 100, 4755300),
(540, 82, 'white', 'S', 100, 3567000),
(541, 82, 'white', 'M', 100, 3745350),
(542, 82, 'white', 'L', 100, 3923700),
(543, 82, 'black', 'S', 100, 3567000),
(544, 82, 'black', 'M', 100, 3745350),
(545, 82, 'black', 'L', 100, 3923700),
(546, 82, 'brown', 'S', 100, 3567000),
(547, 82, 'brown', 'M', 100, 3745350),
(548, 82, 'brown', 'L', 100, 3923700),
(549, 83, 'white', 'S', 100, 2909000),
(550, 83, 'white', 'M', 100, 3054450),
(551, 83, 'white', 'L', 100, 3199900),
(552, 83, 'black', 'S', 100, 2909000),
(553, 83, 'black', 'M', 100, 3054450),
(554, 83, 'black', 'L', 100, 3199900),
(555, 83, 'brown', 'S', 100, 2909000),
(556, 83, 'brown', 'M', 100, 3054450),
(557, 83, 'brown', 'L', 100, 3199900),
(558, 84, 'white', 'S', 100, 5062000),
(559, 84, 'white', 'M', 100, 5315100),
(560, 84, 'white', 'L', 100, 5568200),
(561, 84, 'black', 'S', 100, 5062000),
(562, 84, 'black', 'M', 100, 5315100),
(563, 84, 'black', 'L', 100, 5568200),
(564, 84, 'brown', 'S', 100, 5062000),
(565, 84, 'brown', 'M', 100, 5315100),
(566, 84, 'brown', 'L', 100, 5568200),
(567, 85, 'Default', 'Default', 100, 3435000),
(568, 86, 'Default', '38', 100, 5043000),
(569, 86, 'Default', '39', 100, 5295150),
(570, 86, 'Default', '40', 100, 5547300),
(571, 86, 'Default', '41', 100, 5799450),
(572, 86, 'Default', '42', 100, 6051600),
(573, 86, 'Default', '43', 100, 6303750),
(574, 87, 'Default', 'Default', 100, 3105000),
(575, 88, 'white', 'S', 100, 4453000),
(576, 88, 'white', 'M', 100, 4675650),
(577, 88, 'white', 'L', 100, 4898300),
(578, 88, 'black', 'S', 100, 4453000),
(579, 88, 'black', 'M', 100, 4675650),
(580, 88, 'black', 'L', 100, 4898300),
(581, 88, 'brown', 'S', 100, 4453000),
(582, 88, 'brown', 'M', 100, 4675650),
(583, 88, 'brown', 'L', 100, 4898300),
(584, 89, 'white', 'S', 100, 1281000),
(585, 89, 'white', 'M', 100, 1345050),
(586, 89, 'white', 'L', 100, 1409100),
(587, 89, 'black', 'S', 100, 1281000),
(588, 89, 'black', 'M', 100, 1345050),
(589, 89, 'black', 'L', 100, 1409100),
(590, 89, 'brown', 'S', 100, 1281000),
(591, 89, 'brown', 'M', 100, 1345050),
(592, 89, 'brown', 'L', 100, 1409100),
(593, 90, 'white', 'S', 100, 2999000),
(594, 90, 'white', 'M', 100, 3148950),
(595, 90, 'white', 'L', 100, 3298900),
(596, 90, 'black', 'S', 100, 2999000),
(597, 90, 'black', 'M', 100, 3148950),
(598, 90, 'black', 'L', 100, 3298900),
(599, 90, 'brown', 'S', 100, 2999000),
(600, 90, 'brown', 'M', 100, 3148950),
(601, 90, 'brown', 'L', 100, 3298900),
(602, 91, 'white', 'S', 100, 4988000),
(603, 91, 'white', 'M', 100, 5237400),
(604, 91, 'white', 'L', 100, 5486800),
(605, 91, 'black', 'S', 100, 4988000),
(606, 91, 'black', 'M', 100, 5237400),
(607, 91, 'black', 'L', 100, 5486800),
(608, 91, 'brown', 'S', 100, 4988000),
(609, 91, 'brown', 'M', 100, 5237400),
(610, 91, 'brown', 'L', 100, 5486800),
(611, 92, 'white', 'S', 100, 3489000),
(612, 92, 'white', 'M', 100, 3663450),
(613, 92, 'white', 'L', 100, 3837900),
(614, 92, 'black', 'S', 100, 3489000),
(615, 92, 'black', 'M', 100, 3663450),
(616, 92, 'black', 'L', 100, 3837900),
(617, 92, 'brown', 'S', 98, 3489000),
(618, 92, 'brown', 'M', 100, 3663450),
(619, 92, 'brown', 'L', 100, 3837900),
(620, 93, 'Default', 'Default', 100, 1485000),
(621, 94, 'Default', '38', 100, 2251000),
(622, 94, 'Default', '39', 99, 2363550),
(623, 94, 'Default', '40', 100, 2476100),
(624, 94, 'Default', '41', 100, 2588650),
(625, 94, 'Default', '42', 100, 2701200),
(626, 94, 'Default', '43', 100, 2813750),
(627, 95, 'Default', 'Default', 100, 1280000),
(628, 96, 'white', 'S', 100, 294000),
(629, 96, 'white', 'M', 100, 308700),
(630, 96, 'white', 'L', 100, 323400),
(631, 96, 'black', 'S', 100, 294000),
(632, 96, 'black', 'M', 100, 308700),
(633, 96, 'black', 'L', 100, 323400),
(634, 96, 'brown', 'S', 100, 294000),
(635, 96, 'brown', 'M', 100, 308700),
(636, 96, 'brown', 'L', 100, 323400),
(637, 97, 'white', 'S', 100, 3974000),
(638, 97, 'white', 'M', 100, 4172700),
(639, 97, 'white', 'L', 100, 4371400),
(640, 97, 'black', 'S', 100, 3974000),
(641, 97, 'black', 'M', 100, 4172700),
(642, 97, 'black', 'L', 100, 4371400),
(643, 97, 'brown', 'S', 100, 3974000),
(644, 97, 'brown', 'M', 100, 4172700),
(645, 97, 'brown', 'L', 100, 4371400),
(646, 98, 'white', 'S', 100, 122000),
(647, 98, 'white', 'M', 100, 128100),
(648, 98, 'white', 'L', 100, 134200),
(649, 98, 'black', 'S', 100, 122000),
(650, 98, 'black', 'M', 100, 128100),
(651, 98, 'black', 'L', 100, 134200),
(652, 98, 'brown', 'S', 100, 122000),
(653, 98, 'brown', 'M', 100, 128100),
(654, 98, 'brown', 'L', 100, 134200),
(655, 99, 'white', 'S', 100, 3230000),
(656, 99, 'white', 'M', 100, 3391500),
(657, 99, 'white', 'L', 100, 3553000),
(658, 99, 'black', 'S', 100, 3230000),
(659, 99, 'black', 'M', 100, 3391500),
(660, 99, 'black', 'L', 100, 3553000),
(661, 99, 'brown', 'S', 100, 3230000),
(662, 99, 'brown', 'M', 100, 3391500),
(663, 99, 'brown', 'L', 100, 3553000),
(664, 100, 'white', 'S', 100, 3103000),
(665, 100, 'white', 'M', 100, 3258150),
(666, 100, 'white', 'L', 100, 3413300),
(667, 100, 'black', 'S', 100, 3103000),
(668, 100, 'black', 'M', 100, 3258150),
(669, 100, 'black', 'L', 100, 3413300),
(670, 100, 'brown', 'S', 100, 3103000),
(671, 100, 'brown', 'M', 100, 3258150),
(672, 100, 'brown', 'L', 100, 3413300),
(673, 101, 'Default', 'Default', 100, 2322000),
(674, 102, 'Default', '38', 100, 2776000),
(675, 102, 'Default', '39', 100, 2914800),
(676, 102, 'Default', '40', 100, 3053600),
(677, 102, 'Default', '41', 100, 3192400),
(678, 102, 'Default', '42', 100, 3331200),
(679, 102, 'Default', '43', 100, 3470000),
(680, 103, 'Default', 'Default', 100, 2418000),
(681, 104, 'white', 'S', 100, 1686000),
(682, 104, 'white', 'M', 100, 1770300),
(683, 104, 'white', 'L', 100, 1854600),
(684, 104, 'black', 'S', 100, 1686000),
(685, 104, 'black', 'M', 100, 1770300),
(686, 104, 'black', 'L', 100, 1854600),
(687, 104, 'brown', 'S', 100, 1686000),
(688, 104, 'brown', 'M', 100, 1770300),
(689, 104, 'brown', 'L', 100, 1854600),
(690, 105, 'white', 'S', 100, 1832000),
(691, 105, 'white', 'M', 100, 1923600),
(692, 105, 'white', 'L', 100, 2015200),
(693, 105, 'black', 'S', 100, 1832000),
(694, 105, 'black', 'M', 100, 1923600),
(695, 105, 'black', 'L', 100, 2015200),
(696, 105, 'brown', 'S', 100, 1832000),
(697, 105, 'brown', 'M', 100, 1923600),
(698, 105, 'brown', 'L', 100, 2015200),
(699, 106, 'white', 'S', 100, 1243000),
(700, 106, 'white', 'M', 100, 1305150),
(701, 106, 'white', 'L', 100, 1367300),
(702, 106, 'black', 'S', 100, 1243000),
(703, 106, 'black', 'M', 100, 1305150),
(704, 106, 'black', 'L', 100, 1367300),
(705, 106, 'brown', 'S', 100, 1243000),
(706, 106, 'brown', 'M', 100, 1305150),
(707, 106, 'brown', 'L', 100, 1367300),
(708, 107, 'white', 'S', 100, 112000),
(709, 107, 'white', 'M', 100, 117600),
(710, 107, 'white', 'L', 100, 123200),
(711, 107, 'black', 'S', 100, 112000),
(712, 107, 'black', 'M', 100, 117600),
(713, 107, 'black', 'L', 100, 123200),
(714, 107, 'brown', 'S', 100, 112000),
(715, 107, 'brown', 'M', 100, 117600),
(716, 107, 'brown', 'L', 100, 123200),
(717, 108, 'white', 'S', 100, 1701000),
(718, 108, 'white', 'M', 100, 1786050),
(719, 108, 'white', 'L', 100, 1871100),
(720, 108, 'black', 'S', 100, 1701000),
(721, 108, 'black', 'M', 100, 1786050),
(722, 108, 'black', 'L', 100, 1871100),
(723, 108, 'brown', 'S', 100, 1701000),
(724, 108, 'brown', 'M', 100, 1786050),
(725, 108, 'brown', 'L', 100, 1871100),
(726, 109, 'Default', 'Default', 100, 1812000),
(727, 110, 'Default', '38', 100, 185000),
(728, 110, 'Default', '39', 100, 194250),
(729, 110, 'Default', '40', 100, 203500),
(730, 110, 'Default', '41', 100, 212750),
(731, 110, 'Default', '42', 100, 222000),
(732, 110, 'Default', '43', 100, 231250),
(733, 111, 'Default', 'Default', 100, 4919000),
(734, 112, 'white', 'S', 100, 3782000),
(735, 112, 'white', 'M', 100, 3971100),
(736, 112, 'white', 'L', 100, 4160200),
(737, 112, 'black', 'S', 100, 3782000),
(738, 112, 'black', 'M', 100, 3971100),
(739, 112, 'black', 'L', 100, 4160200),
(740, 112, 'brown', 'S', 100, 3782000),
(741, 112, 'brown', 'M', 100, 3971100),
(742, 112, 'brown', 'L', 100, 4160200),
(743, 113, 'white', 'S', 100, 933000),
(744, 113, 'white', 'M', 100, 979650),
(745, 113, 'white', 'L', 100, 1026300),
(746, 113, 'black', 'S', 100, 933000),
(747, 113, 'black', 'M', 100, 979650),
(748, 113, 'black', 'L', 100, 1026300),
(749, 113, 'brown', 'S', 100, 933000),
(750, 113, 'brown', 'M', 100, 979650),
(751, 113, 'brown', 'L', 100, 1026300),
(752, 114, 'white', 'S', 100, 3527000),
(753, 114, 'white', 'M', 100, 3703350),
(754, 114, 'white', 'L', 100, 3879700),
(755, 114, 'black', 'S', 100, 3527000),
(756, 114, 'black', 'M', 100, 3703350),
(757, 114, 'black', 'L', 100, 3879700),
(758, 114, 'brown', 'S', 100, 3527000),
(759, 114, 'brown', 'M', 100, 3703350),
(760, 114, 'brown', 'L', 100, 3879700),
(761, 115, 'white', 'S', 100, 1363000),
(762, 115, 'white', 'M', 100, 1431150),
(763, 115, 'white', 'L', 100, 1499300),
(764, 115, 'black', 'S', 100, 1363000),
(765, 115, 'black', 'M', 100, 1431150),
(766, 115, 'black', 'L', 100, 1499300),
(767, 115, 'brown', 'S', 100, 1363000),
(768, 115, 'brown', 'M', 100, 1431150),
(769, 115, 'brown', 'L', 100, 1499300),
(770, 116, 'white', 'S', 100, 2653000),
(771, 116, 'white', 'M', 100, 2785650),
(772, 116, 'white', 'L', 100, 2918300),
(773, 116, 'black', 'S', 100, 2653000),
(774, 116, 'black', 'M', 100, 2785650),
(775, 116, 'black', 'L', 100, 2918300),
(776, 116, 'brown', 'S', 100, 2653000),
(777, 116, 'brown', 'M', 100, 2785650),
(778, 116, 'brown', 'L', 100, 2918300),
(779, 117, 'Default', 'Default', 100, 1591000),
(780, 118, 'Default', '38', 100, 3503000),
(781, 118, 'Default', '39', 100, 3678150),
(782, 118, 'Default', '40', 100, 3853300),
(783, 118, 'Default', '41', 100, 4028450),
(784, 118, 'Default', '42', 100, 4203600),
(785, 118, 'Default', '43', 100, 4378750),
(786, 119, 'Default', 'Default', 100, 234000),
(787, 120, 'turquoise', 'S', 100, 2187000),
(788, 120, 'turquoise', 'M', 100, 2296350),
(789, 120, 'turquoise', 'L', 100, 2405700),
(790, 120, 'pink', 'S', 100, 2187000),
(791, 120, 'pink', 'M', 100, 2296350),
(792, 120, 'pink', 'L', 100, 2405700),
(796, 121, 'white', 'S', 100, 3390000),
(797, 121, 'white', 'M', 98, 3559500),
(798, 121, 'white', 'L', 100, 3729000),
(799, 121, 'black', 'S', 100, 3390000),
(800, 121, 'black', 'M', 100, 3559500),
(801, 121, 'black', 'L', 100, 3729000),
(802, 121, 'brown', 'S', 100, 3390000),
(803, 121, 'brown', 'M', 100, 3559500),
(804, 121, 'brown', 'L', 100, 3729000),
(805, 122, 'white', 'S', 100, 3214000),
(806, 122, 'white', 'M', 100, 3374700),
(807, 122, 'white', 'L', 100, 3535400),
(808, 122, 'black', 'S', 100, 3214000),
(809, 122, 'black', 'M', 100, 3374700),
(810, 122, 'black', 'L', 100, 3535400),
(811, 122, 'brown', 'S', 100, 3214000),
(812, 122, 'brown', 'M', 100, 3374700),
(813, 122, 'brown', 'L', 100, 3535400),
(814, 123, 'white', 'S', 100, 2909000),
(815, 123, 'white', 'M', 100, 3054450),
(816, 123, 'white', 'L', 100, 3199900),
(817, 123, 'black', 'S', 100, 2909000),
(818, 123, 'black', 'M', 100, 3054450),
(819, 123, 'black', 'L', 100, 3199900),
(820, 123, 'brown', 'S', 100, 2909000),
(821, 123, 'brown', 'M', 100, 3054450),
(822, 123, 'brown', 'L', 100, 3199900),
(823, 124, 'white', 'S', 100, 2729000),
(824, 124, 'white', 'M', 100, 2865450),
(825, 124, 'white', 'L', 100, 3001900),
(826, 124, 'black', 'S', 100, 2729000),
(827, 124, 'black', 'M', 100, 2865450),
(828, 124, 'black', 'L', 100, 3001900),
(829, 124, 'brown', 'S', 100, 2729000),
(830, 124, 'brown', 'M', 100, 2865450),
(831, 124, 'brown', 'L', 100, 3001900),
(832, 125, 'Default', 'Default', 100, 4409000),
(833, 126, 'Default', '38', 100, 894000),
(834, 126, 'Default', '39', 100, 938700),
(835, 126, 'Default', '40', 100, 983400),
(836, 126, 'Default', '41', 100, 1028100),
(837, 126, 'Default', '42', 100, 1072800),
(838, 126, 'Default', '43', 100, 1117500),
(839, 127, 'Default', 'Default', 100, 4562000),
(840, 128, 'white', 'S', 100, 1942000),
(841, 128, 'white', 'M', 100, 2039100),
(842, 128, 'white', 'L', 100, 2136200),
(843, 128, 'black', 'S', 100, 1942000),
(844, 128, 'black', 'M', 100, 2039100),
(845, 128, 'black', 'L', 100, 2136200),
(846, 128, 'brown', 'S', 100, 1942000),
(847, 128, 'brown', 'M', 100, 2039100),
(848, 128, 'brown', 'L', 100, 2136200),
(849, 129, 'white', 'S', 100, 138000),
(850, 129, 'white', 'M', 100, 144900),
(851, 129, 'white', 'L', 100, 151800),
(852, 129, 'black', 'S', 100, 138000),
(853, 129, 'black', 'M', 100, 144900),
(854, 129, 'black', 'L', 100, 151800),
(855, 129, 'brown', 'S', 100, 138000),
(856, 129, 'brown', 'M', 100, 144900),
(857, 129, 'brown', 'L', 100, 151800),
(858, 130, 'white', 'S', 100, 3034000),
(859, 130, 'white', 'M', 100, 3185700),
(860, 130, 'white', 'L', 100, 3337400),
(861, 130, 'black', 'S', 100, 3034000),
(862, 130, 'black', 'M', 100, 3185700),
(863, 130, 'black', 'L', 100, 3337400),
(864, 130, 'brown', 'S', 100, 3034000),
(865, 130, 'brown', 'M', 100, 3185700),
(866, 130, 'brown', 'L', 100, 3337400),
(867, 131, 'white', 'S', 100, 2299000),
(868, 131, 'white', 'M', 100, 2413950),
(869, 131, 'white', 'L', 100, 2528900),
(870, 131, 'black', 'S', 100, 2299000),
(871, 131, 'black', 'M', 100, 2413950),
(872, 131, 'black', 'L', 100, 2528900),
(873, 131, 'brown', 'S', 100, 2299000),
(874, 131, 'brown', 'M', 100, 2413950),
(875, 131, 'brown', 'L', 100, 2528900),
(876, 132, 'white', 'S', 100, 957000),
(877, 132, 'white', 'M', 100, 1004850),
(878, 132, 'white', 'L', 100, 1052700),
(879, 132, 'black', 'S', 100, 957000),
(880, 132, 'black', 'M', 100, 1004850),
(881, 132, 'black', 'L', 100, 1052700),
(882, 132, 'brown', 'S', 100, 957000),
(883, 132, 'brown', 'M', 100, 1004850),
(884, 132, 'brown', 'L', 100, 1052700),
(885, 133, 'Default', 'Default', 100, 4966000),
(886, 134, 'Default', '38', 100, 4021000),
(887, 134, 'Default', '39', 100, 4222050),
(888, 134, 'Default', '40', 100, 4423100),
(889, 134, 'Default', '41', 100, 4624150),
(890, 134, 'Default', '42', 100, 4825200),
(891, 134, 'Default', '43', 100, 5026250),
(892, 135, 'Default', 'Default', 100, 1478000),
(893, 136, 'white', 'S', 100, 407000),
(894, 136, 'white', 'M', 100, 427350),
(895, 136, 'white', 'L', 100, 447700),
(896, 136, 'black', 'S', 100, 407000),
(897, 136, 'black', 'M', 100, 427350),
(898, 136, 'black', 'L', 100, 447700),
(899, 136, 'brown', 'S', 100, 407000),
(900, 136, 'brown', 'M', 100, 427350),
(901, 136, 'brown', 'L', 100, 447700),
(902, 137, 'white', 'S', 100, 1355000),
(903, 137, 'white', 'M', 100, 1422750),
(904, 137, 'white', 'L', 100, 1490500),
(905, 137, 'black', 'S', 100, 1355000),
(906, 137, 'black', 'M', 100, 1422750),
(907, 137, 'black', 'L', 100, 1490500),
(908, 137, 'brown', 'S', 100, 1355000),
(909, 137, 'brown', 'M', 100, 1422750),
(910, 137, 'brown', 'L', 100, 1490500),
(911, 138, 'white', 'S', 100, 2060000),
(912, 138, 'white', 'M', 100, 2163000),
(913, 138, 'white', 'L', 100, 2266000),
(914, 138, 'black', 'S', 100, 2060000),
(915, 138, 'black', 'M', 100, 2163000),
(916, 138, 'black', 'L', 100, 2266000),
(917, 138, 'brown', 'S', 100, 2060000),
(918, 138, 'brown', 'M', 100, 2163000),
(919, 138, 'brown', 'L', 100, 2266000),
(920, 139, 'white', 'S', 100, 1453000),
(921, 139, 'white', 'M', 100, 1525650),
(922, 139, 'white', 'L', 100, 1598300),
(923, 139, 'black', 'S', 100, 1453000),
(924, 139, 'black', 'M', 100, 1525650),
(925, 139, 'black', 'L', 100, 1598300),
(926, 139, 'brown', 'S', 100, 1453000),
(927, 139, 'brown', 'M', 100, 1525650),
(928, 139, 'brown', 'L', 100, 1598300),
(929, 140, 'white', 'S', 100, 3804000),
(930, 140, 'white', 'M', 100, 3994200),
(931, 140, 'white', 'L', 100, 4184400),
(932, 140, 'black', 'S', 100, 3804000),
(933, 140, 'black', 'M', 100, 3994200),
(934, 140, 'black', 'L', 100, 4184400),
(935, 140, 'brown', 'S', 100, 3804000),
(936, 140, 'brown', 'M', 100, 3994200),
(937, 140, 'brown', 'L', 100, 4184400),
(938, 141, 'Default', 'Default', 100, 4630000),
(939, 142, 'Default', '38', 100, 618000),
(940, 142, 'Default', '39', 100, 648900),
(941, 142, 'Default', '40', 100, 679800),
(942, 142, 'Default', '41', 100, 710700),
(943, 142, 'Default', '42', 100, 741600),
(944, 142, 'Default', '43', 100, 772500),
(945, 143, 'Default', 'Default', 100, 440000),
(946, 144, 'white', 'S', 100, 2752000),
(947, 144, 'white', 'M', 100, 2889600),
(948, 144, 'white', 'L', 100, 3027200),
(949, 144, 'black', 'S', 100, 2752000),
(950, 144, 'black', 'M', 100, 2889600),
(951, 144, 'black', 'L', 100, 3027200),
(952, 144, 'brown', 'S', 100, 2752000),
(953, 144, 'brown', 'M', 100, 2889600),
(954, 144, 'brown', 'L', 100, 3027200),
(955, 145, 'white', 'S', 100, 2808000),
(956, 145, 'white', 'M', 100, 2948400),
(957, 145, 'white', 'L', 100, 3088800),
(958, 145, 'black', 'S', 100, 2808000),
(959, 145, 'black', 'M', 100, 2948400),
(960, 145, 'black', 'L', 100, 3088800),
(961, 145, 'brown', 'S', 100, 2808000),
(962, 145, 'brown', 'M', 100, 2948400),
(963, 145, 'brown', 'L', 100, 3088800),
(964, 146, 'white', 'S', 100, 592000),
(965, 146, 'white', 'M', 100, 621600),
(966, 146, 'white', 'L', 100, 651200),
(967, 146, 'black', 'S', 100, 592000),
(968, 146, 'black', 'M', 100, 621600),
(969, 146, 'black', 'L', 100, 651200),
(970, 146, 'brown', 'S', 100, 592000),
(971, 146, 'brown', 'M', 100, 621600),
(972, 146, 'brown', 'L', 100, 651200),
(973, 147, 'white', 'S', 100, 1931000),
(974, 147, 'white', 'M', 100, 2027550),
(975, 147, 'white', 'L', 100, 2124100),
(976, 147, 'black', 'S', 100, 1931000),
(977, 147, 'black', 'M', 100, 2027550),
(978, 147, 'black', 'L', 100, 2124100),
(979, 147, 'brown', 'S', 100, 1931000),
(980, 147, 'brown', 'M', 100, 2027550),
(981, 147, 'brown', 'L', 100, 2124100),
(982, 148, 'white', 'S', 100, 2618000),
(983, 148, 'white', 'M', 100, 2748900),
(984, 148, 'white', 'L', 100, 2879800),
(985, 148, 'black', 'S', 100, 2618000),
(986, 148, 'black', 'M', 100, 2748900),
(987, 148, 'black', 'L', 100, 2879800),
(988, 148, 'brown', 'S', 100, 2618000),
(989, 148, 'brown', 'M', 100, 2748900),
(990, 148, 'brown', 'L', 100, 2879800),
(991, 149, 'Default', 'Default', 100, 100000),
(992, 150, 'Default', '38', 100, 4727000),
(993, 150, 'Default', '39', 100, 4963350),
(994, 150, 'Default', '40', 100, 5199700),
(995, 150, 'Default', '41', 100, 5436050),
(996, 150, 'Default', '42', 100, 5672400),
(997, 150, 'Default', '43', 100, 5908750),
(998, 151, 'Default', 'Default', 100, 384000),
(999, 152, 'white', 'S', 100, 2687000),
(1000, 152, 'white', 'M', 100, 2821350),
(1001, 152, 'white', 'L', 100, 2955700),
(1002, 152, 'black', 'S', 100, 2687000),
(1003, 152, 'black', 'M', 100, 2821350),
(1004, 152, 'black', 'L', 100, 2955700),
(1005, 152, 'brown', 'S', 100, 2687000),
(1006, 152, 'brown', 'M', 100, 2821350),
(1007, 152, 'brown', 'L', 100, 2955700),
(1008, 153, 'white', 'S', 100, 2748000),
(1009, 153, 'white', 'M', 100, 2885400),
(1010, 153, 'white', 'L', 100, 3022800),
(1011, 153, 'black', 'S', 100, 2748000),
(1012, 153, 'black', 'M', 100, 2885400),
(1013, 153, 'black', 'L', 100, 3022800),
(1014, 153, 'brown', 'S', 100, 2748000),
(1015, 153, 'brown', 'M', 100, 2885400),
(1016, 153, 'brown', 'L', 100, 3022800),
(1017, 154, 'white', 'S', 100, 455000),
(1018, 154, 'white', 'M', 100, 477750),
(1019, 154, 'white', 'L', 100, 500500),
(1020, 154, 'black', 'S', 100, 455000),
(1021, 154, 'black', 'M', 100, 477750),
(1022, 154, 'black', 'L', 100, 500500),
(1023, 154, 'brown', 'S', 100, 455000),
(1024, 154, 'brown', 'M', 100, 477750),
(1025, 154, 'brown', 'L', 100, 500500),
(1026, 155, 'white', 'S', 100, 3414000),
(1027, 155, 'white', 'M', 100, 3584700),
(1028, 155, 'white', 'L', 100, 3755400),
(1029, 155, 'black', 'S', 100, 3414000),
(1030, 155, 'black', 'M', 100, 3584700),
(1031, 155, 'black', 'L', 100, 3755400),
(1032, 155, 'brown', 'S', 100, 3414000),
(1033, 155, 'brown', 'M', 100, 3584700),
(1034, 155, 'brown', 'L', 100, 3755400),
(1035, 156, 'white', 'S', 100, 1051000),
(1036, 156, 'white', 'M', 100, 1103550),
(1037, 156, 'white', 'L', 100, 1156100),
(1038, 156, 'black', 'S', 100, 1051000),
(1039, 156, 'black', 'M', 100, 1103550),
(1040, 156, 'black', 'L', 100, 1156100),
(1041, 156, 'brown', 'S', 100, 1051000),
(1042, 156, 'brown', 'M', 100, 1103550),
(1043, 156, 'brown', 'L', 100, 1156100),
(1044, 157, 'Default', 'Default', 100, 4109000),
(1045, 158, 'Default', '38', 100, 2704000),
(1046, 158, 'Default', '39', 100, 2839200),
(1047, 158, 'Default', '40', 100, 2974400),
(1048, 158, 'Default', '41', 100, 3109600),
(1049, 158, 'Default', '42', 100, 3244800),
(1050, 158, 'Default', '43', 100, 3380000),
(1051, 159, 'Default', 'Default', 100, 3320000),
(1052, 160, 'white', 'S', 100, 118000),
(1053, 160, 'white', 'M', 100, 123900),
(1054, 160, 'white', 'L', 100, 129800),
(1061, 161, 'white', 'S', 100, 1615000),
(1062, 161, 'white', 'M', 100, 1695750),
(1063, 161, 'white', 'L', 100, 1776500),
(1064, 161, 'black', 'S', 100, 1615000),
(1065, 161, 'black', 'M', 100, 1695750),
(1066, 161, 'black', 'L', 100, 1776500),
(1067, 161, 'brown', 'S', 100, 1615000),
(1068, 161, 'brown', 'M', 100, 1695750),
(1069, 161, 'brown', 'L', 100, 1776500),
(1070, 162, 'white', 'S', 100, 2124000),
(1071, 162, 'white', 'M', 100, 2230200),
(1072, 162, 'white', 'L', 100, 2336400),
(1073, 162, 'black', 'S', 100, 2124000),
(1074, 162, 'black', 'M', 100, 2230200),
(1075, 162, 'black', 'L', 100, 2336400),
(1076, 162, 'brown', 'S', 100, 2124000),
(1077, 162, 'brown', 'M', 100, 2230200),
(1078, 162, 'brown', 'L', 100, 2336400),
(1079, 163, 'white', 'S', 100, 4294000),
(1080, 163, 'white', 'M', 100, 4508700),
(1081, 163, 'white', 'L', 100, 4723400),
(1082, 163, 'black', 'S', 100, 4294000),
(1083, 163, 'black', 'M', 100, 4508700),
(1084, 163, 'black', 'L', 100, 4723400),
(1085, 163, 'brown', 'S', 100, 4294000),
(1086, 163, 'brown', 'M', 100, 4508700),
(1087, 163, 'brown', 'L', 100, 4723400),
(1088, 164, 'white', 'S', 100, 2101000),
(1089, 164, 'white', 'M', 100, 2206050),
(1090, 164, 'white', 'L', 100, 2311100),
(1091, 164, 'black', 'S', 100, 2101000),
(1092, 164, 'black', 'M', 100, 2206050),
(1093, 164, 'black', 'L', 100, 2311100),
(1094, 164, 'brown', 'S', 100, 2101000),
(1095, 164, 'brown', 'M', 100, 2206050),
(1096, 164, 'brown', 'L', 100, 2311100),
(1097, 165, 'Default', 'Default', 100, 465000),
(1098, 166, 'Default', '38', 100, 4374000),
(1099, 166, 'Default', '39', 100, 4592700),
(1100, 166, 'Default', '40', 100, 4811400),
(1101, 166, 'Default', '41', 100, 5030100),
(1102, 166, 'Default', '42', 100, 5248800),
(1103, 166, 'Default', '43', 100, 5467500),
(1104, 167, 'Default', 'Default', 100, 334000),
(1105, 168, 'white', 'S', 100, 2825000),
(1106, 168, 'white', 'M', 100, 2966250),
(1107, 168, 'white', 'L', 100, 3107500),
(1108, 168, 'black', 'S', 100, 2825000),
(1109, 168, 'black', 'M', 100, 2966250),
(1110, 168, 'black', 'L', 100, 3107500),
(1111, 168, 'brown', 'S', 100, 2825000),
(1112, 168, 'brown', 'M', 100, 2966250),
(1113, 168, 'brown', 'L', 100, 3107500),
(1114, 169, 'white', 'S', 100, 4103000),
(1115, 169, 'white', 'M', 100, 4308150),
(1116, 169, 'white', 'L', 100, 4513300),
(1117, 169, 'black', 'S', 100, 4103000),
(1118, 169, 'black', 'M', 100, 4308150),
(1119, 169, 'black', 'L', 100, 4513300),
(1120, 169, 'brown', 'S', 100, 4103000),
(1121, 169, 'brown', 'M', 100, 4308150),
(1122, 169, 'brown', 'L', 100, 4513300),
(1123, 170, 'white', 'S', 100, 3653000),
(1124, 170, 'white', 'M', 100, 3835650),
(1125, 170, 'white', 'L', 100, 4018300),
(1126, 170, 'black', 'S', 100, 3653000),
(1127, 170, 'black', 'M', 100, 3835650),
(1128, 170, 'black', 'L', 100, 4018300),
(1129, 170, 'brown', 'S', 100, 3653000),
(1130, 170, 'brown', 'M', 100, 3835650),
(1131, 170, 'brown', 'L', 100, 4018300),
(1132, 171, 'white', 'S', 100, 973000),
(1133, 171, 'white', 'M', 100, 1021650),
(1134, 171, 'white', 'L', 100, 1070300),
(1135, 171, 'black', 'S', 100, 973000),
(1136, 171, 'black', 'M', 100, 1021650),
(1137, 171, 'black', 'L', 100, 1070300),
(1138, 171, 'brown', 'S', 100, 973000),
(1139, 171, 'brown', 'M', 100, 1021650),
(1140, 171, 'brown', 'L', 100, 1070300),
(1141, 172, 'white', 'S', 100, 812000),
(1142, 172, 'white', 'M', 100, 852600),
(1143, 172, 'white', 'L', 100, 893200),
(1144, 172, 'black', 'S', 100, 812000),
(1145, 172, 'black', 'M', 100, 852600),
(1146, 172, 'black', 'L', 100, 893200),
(1147, 172, 'brown', 'S', 100, 812000),
(1148, 172, 'brown', 'M', 100, 852600),
(1149, 172, 'brown', 'L', 100, 893200),
(1150, 173, 'Default', 'Default', 100, 756000),
(1151, 174, 'Default', '38', 100, 1536000),
(1152, 174, 'Default', '39', 100, 1612800),
(1153, 174, 'Default', '40', 100, 1689600),
(1154, 174, 'Default', '41', 100, 1766400),
(1155, 174, 'Default', '42', 100, 1843200),
(1156, 174, 'Default', '43', 100, 1920000),
(1157, 175, 'Default', 'Default', 100, 627000),
(1158, 176, 'white', 'S', 100, 2419000),
(1159, 176, 'white', 'M', 100, 2539950),
(1160, 176, 'white', 'L', 100, 2660900),
(1161, 176, 'black', 'S', 100, 2419000),
(1162, 176, 'black', 'M', 100, 2539950),
(1163, 176, 'black', 'L', 100, 2660900),
(1164, 176, 'brown', 'S', 100, 2419000),
(1165, 176, 'brown', 'M', 100, 2539950),
(1166, 176, 'brown', 'L', 100, 2660900),
(1167, 177, 'white', 'S', 100, 2881000),
(1168, 177, 'white', 'M', 100, 3025050),
(1169, 177, 'white', 'L', 100, 3169100),
(1170, 177, 'black', 'S', 100, 2881000),
(1171, 177, 'black', 'M', 100, 3025050),
(1172, 177, 'black', 'L', 100, 3169100),
(1173, 177, 'brown', 'S', 100, 2881000),
(1174, 177, 'brown', 'M', 100, 3025050),
(1175, 177, 'brown', 'L', 100, 3169100),
(1176, 178, 'white', 'S', 100, 4092000),
(1177, 178, 'white', 'M', 100, 4296600),
(1178, 178, 'white', 'L', 100, 4501200),
(1179, 178, 'black', 'S', 100, 4092000),
(1180, 178, 'black', 'M', 100, 4296600),
(1181, 178, 'black', 'L', 100, 4501200),
(1182, 178, 'brown', 'S', 100, 4092000),
(1183, 178, 'brown', 'M', 100, 4296600),
(1184, 178, 'brown', 'L', 100, 4501200),
(1185, 179, 'white', 'S', 100, 3042000),
(1186, 179, 'white', 'M', 100, 3194100),
(1187, 179, 'white', 'L', 100, 3346200),
(1188, 179, 'black', 'S', 100, 3042000),
(1189, 179, 'black', 'M', 100, 3194100),
(1190, 179, 'black', 'L', 100, 3346200),
(1191, 179, 'brown', 'S', 100, 3042000),
(1192, 179, 'brown', 'M', 100, 3194100),
(1193, 179, 'brown', 'L', 100, 3346200),
(1194, 180, 'white', 'S', 100, 172000),
(1195, 180, 'white', 'M', 100, 180600),
(1196, 180, 'white', 'L', 100, 189200),
(1197, 180, 'black', 'S', 100, 172000),
(1198, 180, 'black', 'M', 100, 180600),
(1199, 180, 'black', 'L', 100, 189200),
(1200, 180, 'brown', 'S', 100, 172000),
(1201, 180, 'brown', 'M', 100, 180600),
(1202, 180, 'brown', 'L', 100, 189200),
(1203, 181, 'Default', 'Default', 100, 1039000),
(1204, 182, 'Default', '38', 100, 899000),
(1205, 182, 'Default', '39', 100, 943950),
(1206, 182, 'Default', '40', 100, 988900),
(1207, 182, 'Default', '41', 100, 1033850),
(1208, 182, 'Default', '42', 100, 1078800),
(1209, 182, 'Default', '43', 100, 1123750),
(1210, 183, 'Default', 'Default', 100, 3000000),
(1211, 184, 'white', 'S', 100, 3541000),
(1212, 184, 'white', 'M', 100, 3718050),
(1213, 184, 'white', 'L', 100, 3895100),
(1214, 184, 'black', 'S', 100, 3541000),
(1215, 184, 'black', 'M', 100, 3718050),
(1216, 184, 'black', 'L', 100, 3895100),
(1217, 184, 'brown', 'S', 100, 3541000),
(1218, 184, 'brown', 'M', 100, 3718050),
(1219, 184, 'brown', 'L', 100, 3895100),
(1220, 185, 'white', 'S', 100, 382000),
(1221, 185, 'white', 'M', 100, 401100),
(1222, 185, 'white', 'L', 100, 420200),
(1223, 185, 'black', 'S', 100, 382000),
(1224, 185, 'black', 'M', 100, 401100),
(1225, 185, 'black', 'L', 100, 420200),
(1226, 185, 'brown', 'S', 100, 382000),
(1227, 185, 'brown', 'M', 100, 401100),
(1228, 185, 'brown', 'L', 100, 420200),
(1229, 186, 'white', 'S', 100, 4682000),
(1230, 186, 'white', 'M', 100, 4916100),
(1231, 186, 'white', 'L', 100, 5150200),
(1232, 186, 'black', 'S', 100, 4682000),
(1233, 186, 'black', 'M', 100, 4916100),
(1234, 186, 'black', 'L', 100, 5150200),
(1235, 186, 'brown', 'S', 100, 4682000),
(1236, 186, 'brown', 'M', 100, 4916100),
(1237, 186, 'brown', 'L', 100, 5150200),
(1238, 187, 'white', 'S', 100, 416000),
(1239, 187, 'white', 'M', 100, 436800),
(1240, 187, 'white', 'L', 100, 457600),
(1241, 187, 'black', 'S', 100, 416000),
(1242, 187, 'black', 'M', 100, 436800),
(1243, 187, 'black', 'L', 100, 457600),
(1244, 187, 'brown', 'S', 100, 416000),
(1245, 187, 'brown', 'M', 100, 436800),
(1246, 187, 'brown', 'L', 100, 457600),
(1247, 188, 'white', 'S', 100, 1975000),
(1248, 188, 'white', 'M', 100, 2073750),
(1249, 188, 'white', 'L', 100, 2172500),
(1250, 188, 'black', 'S', 100, 1975000),
(1251, 188, 'black', 'M', 100, 2073750),
(1252, 188, 'black', 'L', 100, 2172500),
(1253, 188, 'brown', 'S', 100, 1975000),
(1254, 188, 'brown', 'M', 100, 2073750),
(1255, 188, 'brown', 'L', 100, 2172500),
(1256, 189, 'Default', 'Default', 100, 860000),
(1257, 190, 'Default', '38', 100, 943000),
(1258, 190, 'Default', '39', 100, 990150),
(1259, 190, 'Default', '40', 100, 1037300),
(1260, 190, 'Default', '41', 100, 1084450),
(1261, 190, 'Default', '42', 100, 1131600),
(1262, 190, 'Default', '43', 100, 1178750),
(1263, 191, 'Default', 'Default', 100, 4595000),
(1264, 192, 'white', 'S', 100, 3104000),
(1265, 192, 'white', 'M', 100, 3259200),
(1266, 192, 'white', 'L', 100, 3414400),
(1267, 192, 'black', 'S', 100, 3104000),
(1268, 192, 'black', 'M', 100, 3259200),
(1269, 192, 'black', 'L', 100, 3414400),
(1270, 192, 'brown', 'S', 100, 3104000),
(1271, 192, 'brown', 'M', 97, 3259200),
(1272, 192, 'brown', 'L', 100, 3414400),
(1273, 193, 'white', 'S', 100, 795000),
(1274, 193, 'white', 'M', 100, 834750),
(1275, 193, 'white', 'L', 100, 874500),
(1276, 193, 'black', 'S', 100, 795000),
(1277, 193, 'black', 'M', 100, 834750),
(1278, 193, 'black', 'L', 100, 874500),
(1279, 193, 'brown', 'S', 100, 795000),
(1280, 193, 'brown', 'M', 100, 834750),
(1281, 193, 'brown', 'L', 100, 874500),
(1282, 194, 'white', 'S', 100, 867000),
(1283, 194, 'white', 'M', 100, 910350),
(1284, 194, 'white', 'L', 100, 953700),
(1285, 194, 'black', 'S', 100, 867000),
(1286, 194, 'black', 'M', 100, 910350),
(1287, 194, 'black', 'L', 100, 953700),
(1288, 194, 'brown', 'S', 100, 867000),
(1289, 194, 'brown', 'M', 100, 910350),
(1290, 194, 'brown', 'L', 100, 953700),
(1291, 195, 'white', 'S', 100, 4308000),
(1292, 195, 'white', 'M', 100, 4523400),
(1293, 195, 'white', 'L', 100, 4738800),
(1294, 195, 'black', 'S', 100, 4308000),
(1295, 195, 'black', 'M', 100, 4523400),
(1296, 195, 'black', 'L', 100, 4738800),
(1297, 195, 'brown', 'S', 100, 4308000),
(1298, 195, 'brown', 'M', 100, 4523400),
(1299, 195, 'brown', 'L', 100, 4738800),
(1300, 196, 'white', 'S', 100, 3044000),
(1301, 196, 'white', 'M', 100, 3196200),
(1302, 196, 'white', 'L', 100, 3348400),
(1303, 196, 'black', 'S', 100, 3044000),
(1304, 196, 'black', 'M', 100, 3196200),
(1305, 196, 'black', 'L', 100, 3348400),
(1306, 196, 'brown', 'S', 100, 3044000),
(1307, 196, 'brown', 'M', 100, 3196200),
(1308, 196, 'brown', 'L', 100, 3348400),
(1309, 197, 'Default', 'Default', 100, 1910000),
(1310, 198, 'Default', '38', 100, 4342000),
(1311, 198, 'Default', '39', 100, 4559100),
(1312, 198, 'Default', '40', 100, 4776200),
(1313, 198, 'Default', '41', 100, 4993300),
(1314, 198, 'Default', '42', 100, 5210400),
(1315, 198, 'Default', '43', 100, 5427500),
(1316, 199, 'Default', 'Default', 100, 1995000),
(1317, 200, 'white', 'S', 100, 814000),
(1318, 200, 'white', 'M', 100, 854700),
(1319, 200, 'white', 'L', 100, 895400),
(1320, 200, 'black', 'S', 100, 814000),
(1321, 200, 'black', 'M', 100, 854700),
(1322, 200, 'black', 'L', 100, 895400),
(1323, 200, 'brown', 'S', 100, 814000),
(1324, 200, 'brown', 'M', 100, 854700),
(1325, 200, 'brown', 'L', 100, 895400),
(1335, 201, 'white', 'S', 100, 1230000),
(1336, 201, 'white', 'M', 100, 1291500),
(1337, 201, 'white', 'L', 100, 1353000);
INSERT INTO `product_variant` (`id`, `id_product`, `color`, `size`, `quantity`, `price`) VALUES
(1338, 201, 'black', 'S', 100, 1230000),
(1339, 201, 'black', 'M', 100, 1291500),
(1340, 201, 'black', 'L', 100, 1353000),
(1341, 201, 'brown', 'S', 100, 1230000),
(1342, 201, 'brown', 'M', 100, 1291500),
(1343, 201, 'brown', 'L', 100, 1353000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `test`
--

INSERT INTO `test` (`id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `date`, `email`, `phone`, `url`) VALUES
(1, 'user1', 'l', 'Nguyen Dinh', 'Hai', '2001-01-01', 'abc@gmail.com', '032654285', 'binhthuan.jpg'),
(2, 'bach', '12345678', 'Nguyen Cao ', 'Bach', '2000-01-12', 'abc123@gmail.com', '0346251322', 'user1.jpg'),
(3, 'bichlien', 'password', 'Bích', 'Liên', '2020-02-01', 'abc456@gmail.com', '15121212', 'user2.jpg'),
(4, 'admin', 'adminadmin', 'Nguyen Dinh', 'Hai', '2001-01-01', 'abcdef@gmail.com', '0123456789', 'user2.jpg'),
(5, 'hoaPham', '12345678', 'Phạm Thị', 'Hoa', '1985-01-12', 'hoapham@gmail.com', '0325642856', 'hoapham.jpg'),
(6, 'nguyenvan', 'van020202', 'Nguyễn Tài', 'Văn', '1986-05-11', 'vanvo@gmail.com', '032466585', 'vanvo.jpg'),
(7, 'congan', 'danhcong', 'Lê Công', 'Danh', '2000-05-30', 'danhcong@gmail.com', '0368426534', 'hati.jpg'),
(8, 'camtra', 'trapham05', 'Nguyễn Cẩm', 'Trà', '1968-03-12', 'trango@gmail.com', '032635378', 'binhthuan.jpg'),
(9, 'lavancap', 'captain1', 'Lê Văn', 'Cáp', '2010-11-11', 'levancap@gmail.com', '0367854263', 'cap.jpg'),
(10, 'tranlinh', 'linh0666', 'Trần Thị', 'Kiều Linh', '2000-12-05', 'linhtran@gmail.com', '0346532897', 'linh.jpg'),
(11, 'thanhvienmoi', '12345678', 'Nguyen Dinh', 'Hai', '2000-01-01', 'abc@gmail.com', '0123456789', 'ba.jpg'),
(12, 'demo', '12345678', 'Nguyen Dinh', 'Hai', '2000-01-03', 'abc@gmail.com', '032654285', 'binhthuan.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_address`
--

CREATE TABLE `user_address` (
  `id_user` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_address`
--

INSERT INTO `user_address` (`id_user`, `address`, `city`, `postal_code`, `country`) VALUES
(1, 'Can Loc', 'Ha Tinh', 480000, 'Viet Nam'),
(2, 'Kim Giang', 'Ha Noi', 100000, 'Viet Nam'),
(4, 'Dong Da', 'Ha Noi', 100000, 'Viet Nam'),
(5, 'Dong Hung', 'Thai Binh', 6000, 'Viet Nam'),
(6, 'Ha Dong', 'Ha Noi', 100000, 'Viet Nam'),
(7, 'Quan 1', 'TP. HCM', 710000, 'Viet Nam'),
(8, 'Hai Chau', 'Da Nang', 550000, 'Viet Nam'),
(9, 'Quynh Luu', 'Nghe An', 460000, 'Viet Nam'),
(10, 'Ba Dinh', 'Ha Noi', 100000, 'Viet Nam'),
(11, 'Ha Noi', 'Ha Noi', 30000, 'Viet Nam'),
(12, 'Xoms Kien Thanh , Can Loc', 'Ha TInh', 300000, 'Viet Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_payment`
--

CREATE TABLE `user_payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_no` bigint(20) NOT NULL,
  `provider` text COLLATE utf8_unicode_ci NOT NULL,
  `expiry` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_payment`
--

INSERT INTO `user_payment` (`id`, `user_id`, `card_type`, `account_no`, `provider`, `expiry`) VALUES
(1, 1, 'Cash On Delivery', 0, '0', '0000-00-00'),
(2, 1, 'Paypal', 21111111, 'ABC', '2025-03-08'),
(3, 2, 'Cash On Delivery', 0, '0', '0000-00-00'),
(4, 1, 'Visa', 111111111, 'ABC', '2025-03-07'),
(5, 1, 'Paypal', 3333333333, 'AGRIBANK', '2025-03-07'),
(6, 2, 'Visa', 111111111, 'AGRIBANK', '2025-03-06'),
(7, 5, 'Cash On Delivery', 0, '0', '0000-00-00'),
(8, 5, 'Visa', 156235423, 'ACB', '2030-04-11'),
(9, 12, 'Cash On Delivery', 0, '0', '0000-00-00'),
(10, 12, 'Paypal', 1111111111, 'AGRIBANK', '2025-04-05');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_`),
  ADD UNIQUE KEY `name_brand` (`name_brand`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_fk_ff` (`id_variant`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`id_product`),
  ADD KEY `user` (`id_user`);

--
-- Chỉ mục cho bảng `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_fk` (`id_product`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `order_user_fk` (`id_user`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `product_detail_fk` (`id_variant`),
  ADD KEY `order_detail` (`id_order`);

--
-- Chỉ mục cho bảng `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD KEY `ptvxcvxv` (`id`),
  ADD KEY `fk_user_payment` (`card_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `Id` (`id`),
  ADD KEY `products_ibfk_1` (`category_id`),
  ADD KEY `discount_fk` (`discount_id`),
  ADD KEY `products_ibfk_2` (`brand_id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name_2` (`name`);

--
-- Chỉ mục cho bảng `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id_`),
  ADD UNIQUE KEY `name_category` (`name_category`);

--
-- Chỉ mục cho bảng `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_product_fk` (`id_product`);

--
-- Chỉ mục cho bảng `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id_user`);

--
-- Chỉ mục cho bảng `user_payment`
--
ALTER TABLE `user_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_payment_fk` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id_` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=610;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT cho bảng `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id_` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1353;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `user_payment`
--
ALTER TABLE `user_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_variant_fk` FOREIGN KEY (`id_variant`) REFERENCES `product_variant` (`id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `product_fk` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fdsfdsfs` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `variant_detail_fk` FOREIGN KEY (`id_variant`) REFERENCES `product_variant` (`id`);

--
-- Các ràng buộc cho bảng `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_user_payment` FOREIGN KEY (`card_id`) REFERENCES `user_payment` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `discount_fk` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id_`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id_`);

--
-- Các ràng buộc cho bảng `product_variant`
--
ALTER TABLE `product_variant`
  ADD CONSTRAINT `variant_product_fk` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_fk_` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `user_payment`
--
ALTER TABLE `user_payment`
  ADD CONSTRAINT `user_payment_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
