-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 31, 2020 lúc 11:59 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vnpost_chat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `lever` int(4) DEFAULT NULL,
  `link_avatar` varchar(255) DEFAULT NULL,
  `time_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `lever`, `link_avatar`, `time_date`) VALUES
(1, 'admin', '123456', 1, '123', '2020-03-31 17:00:00'),
(9, 'linh', '123', 2, NULL, '2020-04-10 21:21:02'),
(10, 'minh', '456', 2, NULL, '2020-04-10 21:21:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `notification_icon_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link_gif_comment` varchar(255) DEFAULT NULL,
  `image_comment` varchar(255) DEFAULT NULL,
  `user_comment` varchar(1000) DEFAULT NULL COMMENT '([])(array id_user)(lươt thich)',
  `reaction_quantity` int(11) DEFAULT NULL,
  `datetime_comment` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `datetime_contacts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `username`, `phone`, `image`, `datetime_contacts`) VALUES
(1, 1, '1231', '123', '1111', '2020-04-01 09:54:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name_department` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `department`
--

INSERT INTO `department` (`id`, `name_department`) VALUES
(43, '{\"id\":2, \"mat\":444, \"aset\":\"asss\"}'),
(44, '{\"id\":3, \"mat\":555, \"aset\":\"dddd\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `mesage_personal_id` int(11) DEFAULT NULL,
  `message_group_id` int(11) DEFAULT NULL,
  `message_icon_id` int(11) DEFAULT NULL,
  `call_id` int(11) DEFAULT NULL,
  `moat` text DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '1: ẩn, 2: hiện ',
  `pinned` varchar(255) DEFAULT NULL,
  `date_notification` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `message`
--

INSERT INTO `message` (`id`, `mesage_personal_id`, `message_group_id`, `message_icon_id`, `call_id`, `moat`, `content`, `status`, `pinned`, `date_notification`) VALUES
(1, NULL, NULL, 1, 1, '{\"id\":1,\"contenmt\":\"ctat\",\"dit\":\"met\"}', 'chao em haf', 1, NULL, '2020-05-28 05:18:49'),
(23, NULL, NULL, NULL, 1, NULL, 'chao em haf', NULL, NULL, '2020-05-28 05:34:52'),
(24, NULL, NULL, NULL, 1, '[object Object]', 'chao em haf', NULL, NULL, '2020-05-27 22:18:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message_group`
--

CREATE TABLE `message_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link_group` varchar(255) DEFAULT NULL,
  `group_user_id` varchar(1000) DEFAULT NULL COMMENT '([])',
  `status` tinyint(4) DEFAULT NULL COMMENT '(1: an ,2: hien)',
  `date_group` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message_icon`
--

CREATE TABLE `message_icon` (
  `id` int(11) NOT NULL,
  `category_icon` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `link_notifi_icon` varchar(255) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `message_icon`
--

INSERT INTO `message_icon` (`id`, `category_icon`, `name`, `link_notifi_icon`, `datetime`) VALUES
(1, 1, '2', '3', '2020-04-01 09:14:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message_personal`
--

CREATE TABLE `message_personal` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `conten` varchar(250) DEFAULT NULL,
  `status_personal` tinyint(4) DEFAULT NULL COMMENT '1: ban be, 2: huy ban be ,3 nhan loi moi kb , 4,chan ban be',
  `datetime_per` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message_queue`
--

CREATE TABLE `message_queue` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mycall`
--

CREATE TABLE `mycall` (
  `id` int(11) NOT NULL,
  `name_call` varchar(255) DEFAULT NULL,
  `video_call` varchar(255) DEFAULT NULL,
  `receiving_time` timestamp NULL DEFAULT current_timestamp(),
  `status` tinyint(4) DEFAULT NULL COMMENT '0: đang kết nối; 1: đã kết nối, 2: đã kết thúc',
  `datetime_call` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mycall`
--

INSERT INTO `mycall` (`id`, `name_call`, `video_call`, `receiving_time`, `status`, `datetime_call`) VALUES
(1, 'ád', 'ád', '2020-04-01 11:29:26', 1, '2020-04-01 11:29:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `new_post`
--

CREATE TABLE `new_post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT 0 COMMENT '0: là bản tin hệ thống',
  `privacy` int(11) DEFAULT NULL COMMENT '1: cá nhân , 2 : bạn bè , 3 công khai,4:cs nhom',
  `content` varchar(255) DEFAULT NULL,
  `notification_icon_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '1: ẩn 2 : hiện, trên app',
  `user_react` varchar(1000) DEFAULT NULL COMMENT 'array id_user',
  `react` int(11) DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 : thương 1 : ưu tiên',
  `album` varchar(45) DEFAULT NULL,
  `name_album` varchar(255) DEFAULT NULL,
  `image_album` varchar(255) DEFAULT NULL,
  `video_alum` varchar(255) DEFAULT NULL,
  `datetime_news` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `new_post`
--

INSERT INTO `new_post` (`id`, `user_id`, `privacy`, `content`, `notification_icon_id`, `status`, `user_react`, `react`, `priority`, `album`, `name_album`, `image_album`, `video_alum`, `datetime_news`) VALUES
(1, 1, 2, '12', 1, 1, '12', 2, 0, '12', '12', '12', '12', '2020-04-10 19:06:23'),
(2, 2, 3, '2', 1, 1, '12', 12, 0, '2', '1', '1', '2', '2020-04-10 19:35:21'),
(7, 0, 3, '2', 1, 3, '2', 22, 0, '22', '11', '2222222', '11', '2020-04-10 19:25:41'),
(12, 0, 3, 'qqqq', NULL, NULL, NULL, NULL, 0, NULL, NULL, '1111111', '2222222', '2020-04-10 19:27:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `title_name` varchar(1000) DEFAULT NULL,
  `name` varchar(10000) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `level` varchar(200) DEFAULT NULL,
  `mnv` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `link_avatar` varchar(255) DEFAULT NULL,
  `link_cover` varchar(255) DEFAULT NULL,
  `fcm_token` varchar(500) DEFAULT NULL,
  `fcm_otp` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'status(1: active, 2: lock account)',
  `birthday` date DEFAULT NULL COMMENT 'ngay sinh',
  `time_update` timestamp NULL DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `phone`, `password`, `username`, `department_id`, `level`, `mnv`, `address`, `email`, `link_avatar`, `link_cover`, `fcm_token`, `fcm_otp`, `status`, `birthday`, `time_update`, `created_time`) VALUES
(1, '0123456789', '123456', 'binh', NULL, '1', '12', '12', '12', '12', '12', '12', '12', 1, '2020-04-09', '2020-04-28 17:00:00', '2020-03-19 02:34:04');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `notification_icon_id` (`notification_icon_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_department` (`name_department`) USING HASH;

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `call_id` (`call_id`),
  ADD KEY `notification_group_id` (`message_group_id`),
  ADD KEY `notification_icon_id` (`message_icon_id`),
  ADD KEY `notification_personal_id` (`mesage_personal_id`);

--
-- Chỉ mục cho bảng `message_group`
--
ALTER TABLE `message_group`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `message_icon`
--
ALTER TABLE `message_icon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `message_personal`
--
ALTER TABLE `message_personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `message_queue`
--
ALTER TABLE `message_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_id` (`message_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `mycall`
--
ALTER TABLE `mycall`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `new_post`
--
ALTER TABLE `new_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_icon_id` (`notification_icon_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `message_group`
--
ALTER TABLE `message_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `message_icon`
--
ALTER TABLE `message_icon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `message_personal`
--
ALTER TABLE `message_personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `message_queue`
--
ALTER TABLE `message_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `mycall`
--
ALTER TABLE `mycall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `new_post`
--
ALTER TABLE `new_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `new_post` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`notification_icon_id`) REFERENCES `message_icon` (`id`);

--
-- Các ràng buộc cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`call_id`) REFERENCES `mycall` (`id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`message_group_id`) REFERENCES `message_group` (`id`),
  ADD CONSTRAINT `message_ibfk_3` FOREIGN KEY (`message_icon_id`) REFERENCES `message_icon` (`id`),
  ADD CONSTRAINT `message_ibfk_4` FOREIGN KEY (`mesage_personal_id`) REFERENCES `message_personal` (`id`);

--
-- Các ràng buộc cho bảng `message_personal`
--
ALTER TABLE `message_personal`
  ADD CONSTRAINT `message_personal_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `message_queue`
--
ALTER TABLE `message_queue`
  ADD CONSTRAINT `message_queue_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`),
  ADD CONSTRAINT `message_queue_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `new_post`
--
ALTER TABLE `new_post`
  ADD CONSTRAINT `new_post_ibfk_1` FOREIGN KEY (`notification_icon_id`) REFERENCES `message_icon` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
