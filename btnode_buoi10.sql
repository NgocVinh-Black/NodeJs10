/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `binh_luan` (
  `binh_luan_id` int NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` int DEFAULT NULL,
  `hinh_id` int DEFAULT NULL,
  `ngay_binh_luan` date DEFAULT NULL,
  `noi_dung` varchar(255) NOT NULL,
  PRIMARY KEY (`binh_luan_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hinh_anh` (
  `hinh_id` int NOT NULL AUTO_INCREMENT,
  `ten_hinh` varchar(255) NOT NULL,
  `duong_dan` varchar(255) NOT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  PRIMARY KEY (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `luu_anh` (
  `nguoi_dung_id` int NOT NULL,
  `hinh_id` int NOT NULL,
  `ngay_luu` date DEFAULT NULL,
  PRIMARY KEY (`nguoi_dung_id`,`hinh_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoi_dung` (
  `nguoi_dung_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `tuoi` int DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(1, 1, 1, '2024-04-01', 'Bức ảnh đẹp quá!');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(2, 2, 2, '2024-04-02', 'Hình này chụp ở đâu vậy?');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(3, 3, 3, '2024-04-03', 'Cảm xúc rất tốt khi nhìn thấy hình này!');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(4, 4, 4, '2024-04-04', 'Tuyệt vời!'),
(5, 5, 5, '2024-04-05', 'Cảm ơn bạn đã chia sẻ.'),
(6, 6, 6, '2024-04-06', 'Chúc mừng!'),
(7, 7, 7, '2024-04-07', 'Hình đẹp quá.'),
(8, 8, 8, '2024-04-08', 'Tôi thích cách bạn chụp.'),
(9, 9, 9, '2024-04-09', 'Mong muốn xem nhiều hơn từ bạn.'),
(10, 10, 10, '2024-04-10', 'Bức ảnh này thực sự nổi bật.'),
(11, 11, 11, '2024-04-11', 'Wow! Đẹp quá.'),
(12, 12, 12, '2024-04-12', 'Chụp ảnh tuyệt vời!'),
(13, 13, 13, '2024-04-13', 'Đáng yêu!'),
(14, 14, 14, '2024-04-14', 'Tuyệt vời.'),
(15, 15, 15, '2024-04-15', 'Ảnh này làm tôi cười.'),
(16, 16, 16, '2024-04-16', 'Tuyệt vời!'),
(17, 17, 17, '2024-04-17', 'Chụp ảnh chuyên nghiệp.'),
(18, 18, 18, '2024-04-18', 'Cảm ơn bạn đã chia sẻ.'),
(20, 20, 20, '2024-04-20', 'Hãy tiếp tục chia sẻ hình ảnh!'),
(21, 1, 2, '2024-04-21', 'Hình này đẹp quá!'),
(22, 2, 3, '2024-04-22', 'Thật tuyệt vời!'),
(23, 3, 4, '2024-04-23', 'Mình muốn đến đó!'),
(24, 4, 5, '2024-04-24', 'Cảm ơn bạn.'),
(25, 5, 6, '2024-04-25', 'Chúc mừng!'),
(26, 6, 7, '2024-04-26', 'Hình đẹp quá.'),
(27, 7, 8, '2024-04-27', 'Tôi thích cách bạn chụp.'),
(28, 8, 9, '2024-04-28', 'Mong muốn thấy nhiều hơn từ bạn.'),
(29, 9, 10, '2024-04-29', 'Tuyệt vời.'),
(30, 10, 11, '2024-04-30', 'Cảm ơn bạn đã chia sẻ.'),
(31, 23, 15, '2024-05-08', 'Hình Ok'),
(32, 23, 15, '2024-05-08', 'Hình Ok'),
(33, 23, 16, '2024-05-08', 'Hình Ok'),
(34, 23, 16, '2024-05-10', 'Hình Ok'),
(35, 23, 16, '2024-05-10', 'Hình Ok'),
(36, 22, 15, '2024-05-11', 'Hình Ok'),
(37, 22, 15, '2024-05-11', 'Hình Ok');

INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(1, 'Hình 1', 'images/image1.jpg', 'Mô tả cho hình 1', 1);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(2, 'Hình 2', 'images/image2.jpg', 'Mô tả cho hình 2', 2);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(3, 'Hình 3', 'images/image3.jpg', 'Mô tả cho hình 3', 3);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(4, 'Hình 4', 'images/image4.jpg', 'Mô tả cho hình 4', 4),
(5, 'Hình 5', 'images/image5.jpg', 'Mô tả cho hình 5', 5),
(6, 'Hình 6', 'images/image6.jpg', 'Mô tả cho hình 6', 6),
(7, 'Hình 7', 'images/image7.jpg', 'Mô tả cho hình 7', 7),
(8, 'Hình 8', 'images/image8.jpg', 'Mô tả cho hình 8', 8),
(9, 'Hình 9', 'images/image9.jpg', 'Mô tả cho hình 9', 9),
(10, 'Hình 10', 'images/image10.jpg', 'Mô tả cho hình 10', 10),
(11, 'Hình 11', 'images/image11.jpg', 'Mô tả cho hình 11', 11),
(12, 'Hình 12', 'images/image12.jpg', 'Mô tả cho hình 12', 12),
(13, 'Hình 13', 'images/image13.jpg', 'Mô tả cho hình 13', 13),
(14, 'Hình 14', 'images/image14.jpg', 'Mô tả cho hình 14', 14),
(15, 'Hình 15', 'images/image15.jpg', 'Mô tả cho hình 15', 15),
(16, 'Hình 16', 'images/image16.jpg', 'Mô tả cho hình 16', 16),
(17, 'Hình 17', 'images/image17.jpg', 'Mô tả cho hình 17', 17),
(18, 'Hình 18', 'images/image18.jpg', 'Mô tả cho hình 18', 18),
(20, 'Hình 20', 'images/image20.jpg', 'Mô tả cho hình 20', 20),
(22, 'img2.jpg', '1715350447589_img2.jpg', '', 23),
(23, 'img2.jpg', '1715351079163_img2.jpg', 'abc', 23),
(24, 'img2.jpg', '1715351102210_img2.jpg', '', 22),
(25, 'img1.jpg', '1715351556446_img1.jpg', '', 20),
(26, 'images.jfif', '1715400234265_images.jfif', 'HÌnh 123', 21),
(27, 'img1.jpg', '1715400272639_img1.jpg', 'HÌnh 123', 21),
(28, 'images.jfif', '1715414093559_images.jfif', 'Thêm hình test', 25);

INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(1, 1, '2024-04-01');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(1, 2, '2024-04-21');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(2, 2, '2024-04-02');
INSERT INTO `luu_anh` (`nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(2, 3, '2024-04-22'),
(3, 3, '2024-04-03'),
(3, 4, '2024-04-23'),
(4, 4, '2024-04-04'),
(4, 5, '2024-04-24'),
(5, 5, '2024-04-05'),
(5, 6, '2024-04-25'),
(6, 6, '2024-04-06'),
(6, 7, '2024-04-26'),
(7, 7, '2024-04-07'),
(7, 8, '2024-04-27'),
(8, 8, '2024-04-08'),
(8, 9, '2024-04-28'),
(9, 9, '2024-04-09'),
(9, 10, '2024-04-29'),
(10, 10, '2024-04-10'),
(10, 11, '2024-04-30'),
(11, 11, '2024-04-11'),
(12, 12, '2024-04-12'),
(13, 13, '2024-04-13'),
(14, 14, '2024-04-14'),
(15, 15, '2024-04-15'),
(16, 16, '2024-04-16'),
(17, 17, '2024-04-17'),
(18, 18, '2024-04-18'),
(20, 20, '2024-04-20'),
(23, 9, '2024-05-28'),
(23, 10, '2024-05-29'),
(23, 11, '2024-05-30');

INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(1, 'user1@example.com', 'password1', 'Nguyễn Văn A', 25, 'avatar1.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(2, 'user2@example.com', 'password2', 'Trần Thị B', 30, 'avatar2.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(3, 'user3@example.com', 'password3', 'Lê Minh C', 22, 'avatar3.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(4, 'user4@example.com', 'password4', 'Phạm Thị D', 28, 'avatar4.jpg'),
(5, 'user5@example.com', 'password5', 'Hoàng Văn E', 35, 'avatar5.jpg'),
(6, 'user6@example.com', 'password6', 'Trần Văn F', 29, 'avatar6.jpg'),
(7, 'user7@example.com', 'password7', 'Lê Thị G', 31, 'avatar7.jpg'),
(8, 'user8@example.com', 'password8', 'Nguyễn Văn H', 27, 'avatar8.jpg'),
(9, 'user9@example.com', 'password9', 'Phạm Thị I', 24, 'avatar9.jpg'),
(10, 'user10@example.com', 'password10', 'Hoàng Minh K', 26, 'avatar10.jpg'),
(11, 'user11@example.com', 'password11', 'Nguyễn Thị L', 33, 'avatar11.jpg'),
(12, 'user12@example.com', 'password12', 'Trần Văn M', 40, 'avatar12.jpg'),
(13, 'user13@example.com', 'password13', 'Lê Văn N', 23, 'avatar13.jpg'),
(14, 'user14@example.com', 'password14', 'Hoàng Thị O', 36, 'avatar14.jpg'),
(15, 'user15@example.com', 'password15', 'Phạm Văn P', 29, 'avatar15.jpg'),
(16, 'user16@example.com', 'password16', 'Trần Minh Q', 32, 'avatar16.jpg'),
(17, 'user17@example.com', 'password17', 'Lê Thị R', 27, 'avatar17.jpg'),
(18, 'user18@example.com', 'password18', 'Nguyễn Văn S', 31, 'avatar18.jpg'),
(19, 'user19@example.com', 'password19', 'Hoàng Thị T', 28, 'avatar19.jpg'),
(20, 'user20@example.com', '$2b$10$ctRe8GtGx6oRDZywg0enLusYNSP3jIB1n82tlhmR7GAqCq.zZZxV6', 'Phạm Minh Un', 23, '1715400420531_images.jfif'),
(21, 'test123@gmail.com', '$2b$10$tUSdN5e0VyvQHISWcBgne./edyoD8cWyF.0tHw1S5UvPiCjLErJQy', 'Lê Ngọc Dừa', 23, '1715352322885_img1.jpg'),
(22, 'test1234@gmail.com', '$2b$10$8aOAkV1W7hyQkNhESfSetOTCbuo22a7XiWPJYuvaHQjQt3eSvulr2', 'Lê Ngọc Vinh', 25, '1715309745908_img1.jpg'),
(23, 'test12345@gmail.com', '$2b$10$F4uGU3l5FqgaBBbOSCLmTel/aPjAFY.GK40DsPtt0WBDdzjfrYtUC', 'Lê Ngọc Vinh', 25, '1715260327058_img2.jpg'),
(24, 'user2000@example.com', '$2b$10$yY4VXr16hCA0FXwUtQVNDOx2MqN6M3jo2vBaJq9DENPSleki9XrI6', 'Phamj Vawn A', 30, NULL),
(25, 'userTest2000@gmail.com', '$2b$10$OHLv3RUbG7IXnRjp64jOy..fy568f00Aehdv.KlBCBXMJ/xLflFja', 'Phạm Văn Biển', 23, '1715414169609_img2.jpg');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;