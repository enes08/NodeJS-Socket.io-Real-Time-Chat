-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 May 2019, 22:26:14
-- Sunucu sürümü: 10.1.26-MariaDB
-- PHP Sürümü: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `chat`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `conversation`
--

CREATE TABLE `conversation` (
  `c_id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) NOT NULL,
  `ip` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `conversation`
--

INSERT INTO `conversation` (`c_id`, `user_one`, `user_two`, `ip`, `time`) VALUES
(1, 1, 2, '122.3.3.7', '0000-00-00 00:00:00'),
(2, 1, 3, '122.3.3.7', '0000-00-00 00:00:00'),
(3, 1, 4, '122.3.3.7', '0000-00-00 00:00:00'),
(4, 2, 3, '122.3.3.7', '0000-00-00 00:00:00'),
(5, 2, 4, '122.3.3.7', '0000-00-00 00:00:00'),
(6, 3, 4, '122.3.3.7', '0000-00-00 00:00:00'),
(10, 5, 1, '', '0000-00-00 00:00:00'),
(11, 4, 5, '', '0000-00-00 00:00:00'),
(12, 3, 5, '', '0000-00-00 00:00:00'),
(13, 2, 5, '', '0000-00-00 00:00:00'),
(14, 1, 13, '', '0000-00-00 00:00:00'),
(15, 2, 13, '', '0000-00-00 00:00:00'),
(16, 5, 15, '', '0000-00-00 00:00:00'),
(17, 2, 15, '', '0000-00-00 00:00:00'),
(18, 3, 15, '', '0000-00-00 00:00:00'),
(19, 19, 1, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `conversation_reply`
--

CREATE TABLE `conversation_reply` (
  `cr_id` int(11) NOT NULL,
  `reply` text COLLATE utf8_turkish_ci NOT NULL,
  `user_id_fk` int(11) NOT NULL,
  `ip` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `c_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `conversation_reply`
--

INSERT INTO `conversation_reply` (`cr_id`, `reply`, `user_id_fk`, `ip`, `time`, `status`, `c_id_fk`) VALUES
(1, 'Nasılsın Murat', 1, '122.3.3.7', '0000-00-00 00:00:00', 0, 1),
(2, 'iyiyim Enes Sen Nasılsın ', 2, '122.3.3.7', '0000-00-00 00:00:00', 0, 1),
(3, ' Enes Hafta sonu maç var  ', 2, '122.3.3.7', '0000-00-00 00:00:00', 0, 1),
(4, ' Tamam Murat gelicem  ', 1, '122.3.3.7', '0000-00-00 00:00:00', 0, 1),
(5, 'Selam Şeref', 3, '122.3.3.7', '0000-00-00 00:00:00', 0, 6),
(6, 'Selam Umut', 4, '122.3.3.7', '0000-00-00 00:00:00', 0, 6),
(7, ' Şeref Maç var', 3, '122.3.3.7', '0000-00-00 00:00:00', 0, 6),
(8, 'tamam umut', 4, '122.3.3.7', '0000-00-00 00:00:00', 0, 6),
(9, ' Şeref Hafta sonu maç var  ', 1, '122.3.3.7', '0000-00-00 00:00:00', 0, 3),
(13, 'slm umut', 1, '', '0000-00-00 00:00:00', 0, 2),
(14, 'nasılsın?', 1, '', '0000-00-00 00:00:00', 0, 2),
(15, 'loo', 1, '', '0000-00-00 00:00:00', 0, 2),
(16, 'sana diyom', 1, '', '0000-00-00 00:00:00', 0, 2),
(17, ':)', 1, '', '0000-00-00 00:00:00', 0, 2),
(18, 'slm enes pampa :)', 3, '', '0000-00-00 00:00:00', 0, 2),
(19, 'iyiyim sen nasılsın :)', 3, '', '0000-00-00 00:00:00', 0, 2),
(20, 'bende iyi işte nasıl olsun:)', 1, '', '0000-00-00 00:00:00', 0, 2),
(21, 'slm', 1, '', '0000-00-00 00:00:00', 0, 1),
(22, 'naber kankaa :)', 2, '', '0000-00-00 00:00:00', 0, 1),
(23, 'slm', 1, '', '0000-00-00 00:00:00', 0, 2),
(24, 'looo', 1, '', '0000-00-00 00:00:00', 0, 2),
(25, 'slm şeref', 2, '', '0000-00-00 00:00:00', 0, 5),
(26, 'slm umut', 2, '', '0000-00-00 00:00:00', 0, 4),
(27, 'slm', 1, '', '0000-00-00 00:00:00', 0, 2),
(28, 'hahahahhhhhh hhhhhhhhhhhhhh hhhhhhh hhhhhhhhhhh hhhhhhhhhhhhhhhhhh hhhhhh hhhhhhhhhhhhhhhh hhhhhhh hhhhhhhhhhhhhh hhhhhhhhhhhhhhhhhh', 1, '', '0000-00-00 00:00:00', 0, 1),
(29, 'slm pampaa naber nasılsın :)', 4, '', '0000-00-00 00:00:00', 0, 5),
(30, 'tamam kanka gelicem :)', 4, '', '0000-00-00 00:00:00', 0, 3),
(31, 'iyi sen nasılsın :)', 2, '', '0000-00-00 00:00:00', 0, 5),
(32, 'slm pampa', 1, '', '0000-00-00 00:00:00', 0, 2),
(33, 'nasılslın', 3, '', '0000-00-00 00:00:00', 0, 2),
(34, 'iyi sen ', 3, '', '0000-00-00 00:00:00', 0, 2),
(35, 'loooo', 1, '', '0000-00-00 00:00:00', 0, 2),
(36, 'nasılsın', 3, '', '0000-00-00 00:00:00', 0, 2),
(37, 'şi', 1, '', '0000-00-00 00:00:00', 0, 2),
(38, 'slm', 1, '', '0000-00-00 00:00:00', 0, 2),
(39, 'looo', 1, '', '0000-00-00 00:00:00', 0, 2),
(40, 'selamun alleyküm pampa :)', 1, '', '0000-00-00 00:00:00', 0, 2),
(41, 'naer', 3, '', '0000-00-00 00:00:00', 0, 2),
(42, 'loooooooooooo', 3, '', '0000-00-00 00:00:00', 0, 2),
(43, 'slm', 1, '', '0000-00-00 00:00:00', 0, 1),
(44, 'naber pampa', 2, '', '0000-00-00 00:00:00', 0, 1),
(45, 'slm', 1, '', '0000-00-00 00:00:00', 0, 2),
(46, 'loo', 1, '', '0000-00-00 00:00:00', 0, 2),
(47, 'slm', 1, '', '0000-00-00 00:00:00', 0, 1),
(48, 'll', 1, '', '0000-00-00 00:00:00', 0, 1),
(49, 'slm pampa :)', 2, '', '0000-00-00 00:00:00', 0, 1),
(50, 'nasılsın', 2, '', '0000-00-00 00:00:00', 0, 1),
(51, 'looo', 1, '', '0000-00-00 00:00:00', 0, 2),
(52, 'slm', 3, '', '0000-00-00 00:00:00', 0, 2),
(53, 'slm', 1, '', '0000-00-00 00:00:00', 0, 2),
(54, 'nasılsın', 3, '', '0000-00-00 00:00:00', 0, 2),
(55, 'iyi sen nasılsın', 1, '', '0000-00-00 00:00:00', 0, 2),
(56, 'bende iyi işte nasıl olsun', 3, '', '0000-00-00 00:00:00', 0, 2),
(57, 'dersler nasıl gidiyo :)', 3, '', '0000-00-00 00:00:00', 0, 2),
(58, 'aynı değişen bişe yok çalışmaya çalışıyoz :)', 1, '', '0000-00-00 00:00:00', 0, 2),
(59, 'nasılsın :)', 3, '', '0000-00-00 00:00:00', 0, 2),
(60, 'loooo', 3, '', '0000-00-00 00:00:00', 0, 2),
(61, 'iyi misisn pampa :)', 3, '', '0000-00-00 00:00:00', 0, 2),
(62, 'loooo', 3, '', '0000-00-00 00:00:00', 0, 2),
(63, 'sana diyom', 3, '', '0000-00-00 00:00:00', 0, 2),
(64, 'looo enes pampa :)', 2, '', '0000-00-00 00:00:00', 0, 1),
(65, 'efendim pampa :)', 1, '', '0000-00-00 00:00:00', 0, 1),
(66, 'nasılsın kanka aaaaaaaaaaa:)', 2, '', '0000-00-00 00:00:00', 0, 1),
(67, 'iyiyim sen nasılsın :)', 1, '', '0000-00-00 00:00:00', 0, 1),
(68, 'bende iyi işte socket proramlama çalışıyoruım :)', 2, '', '0000-00-00 00:00:00', 0, 1),
(69, 'slm enes pampa :)', 4, '', '0000-00-00 00:00:00', 0, 3),
(70, 'as pampa nasılsın :)', 1, '', '0000-00-00 00:00:00', 0, 3),
(71, 'as pampa nasılsın :)', 3, '', '0000-00-00 00:00:00', 0, 2),
(72, 'looo', 3, '', '0000-00-00 00:00:00', 0, 2),
(73, 'şiiiiiiiiiiii', 1, '', '0000-00-00 00:00:00', 0, 2),
(74, 'looo', 1, '', '0000-00-00 00:00:00', 0, 3),
(75, 'naber pampa :)', 4, '', '0000-00-00 00:00:00', 0, 3),
(76, 'iyi pampa senden naber :)', 1, '', '0000-00-00 00:00:00', 0, 3),
(77, 'bende iyi işte nasıl olsun :)', 4, '', '0000-00-00 00:00:00', 0, 3),
(78, 'takılıyom boş boş :)', 4, '', '0000-00-00 00:00:00', 0, 3),
(79, 'sen ne yapıyon  ', 1, '', '0000-00-00 00:00:00', 0, 3),
(80, 'looo', 1, '', '0000-00-00 00:00:00', 0, 3),
(81, 'şiiiiiiiiiiiiiiiiii', 1, '', '0000-00-00 00:00:00', 0, 3),
(82, 'ordamısın :)', 1, '', '0000-00-00 00:00:00', 0, 3),
(83, 'ordasmısnn leee :)', 3, '', '0000-00-00 00:00:00', 0, 2),
(84, 'mesjlar geliyo mu', 3, '', '0000-00-00 00:00:00', 0, 2),
(85, 'geliyo pampa :)', 1, '', '0000-00-00 00:00:00', 0, 2),
(86, 'hoşgeldin pampaa:)', 2, '', '0000-00-00 00:00:00', 0, 1),
(87, 'slm', 2, '', '0000-00-00 00:00:00', 0, 1),
(88, 'loooo', 2, '', '0000-00-00 00:00:00', 0, 1),
(89, 'geliyoooooooooooooooooooo', 1, '', '0000-00-00 00:00:00', 0, 1),
(90, 'as pampa naber nasılsın :)', 1, '', '0000-00-00 00:00:00', 0, 1),
(91, 'loo', 2, '', '0000-00-00 00:00:00', 0, 1),
(92, 'looo', 2, '', '0000-00-00 00:00:00', 0, 1),
(93, 'şiii', 1, '', '0000-00-00 00:00:00', 0, 1),
(94, 'as pampa naber ', 1, '', '0000-00-00 00:00:00', 0, 1),
(95, 'as pampa', 1, '', '0000-00-00 00:00:00', 0, 1),
(96, 'loooooooooooooooooooooooooooooooooo', 1, '', '0000-00-00 00:00:00', 0, 1),
(97, 'naber pampa', 2, '', '0000-00-00 00:00:00', 0, 1),
(98, 'şiii', 2, '', '0000-00-00 00:00:00', 0, 1),
(99, 'mesajlar gelimyo:(', 2, '', '0000-00-00 00:00:00', 0, 1),
(100, 'loooooooooooooo', 1, '', '0000-00-00 00:00:00', 0, 1),
(101, 'ilk mesaj gitmiyo', 1, '', '0000-00-00 00:00:00', 0, 1),
(102, 'neden acaba :(', 2, '', '0000-00-00 00:00:00', 0, 1),
(103, ':(', 1, '', '0000-00-00 00:00:00', 0, 1),
(104, 'sorun halloldu mu pampa:)', 1, '', '0000-00-00 00:00:00', 0, 1),
(105, 'oldu sanırım leeeeeeeeeeeee', 2, '', '0000-00-00 00:00:00', 0, 1),
(106, 'şiii', 1, '', '0000-00-00 00:00:00', 0, 1),
(107, ':)', 2, '', '0000-00-00 00:00:00', 0, 1),
(108, 'slm', 1, '', '0000-00-00 00:00:00', 0, 1),
(109, 'mesajlar lood more', 1, '', '0000-00-00 00:00:00', 0, 1),
(110, 'yapmaya çalışıyoruım :)', 1, '', '0000-00-00 00:00:00', 0, 1),
(111, 'leeeeeeeeeeeeee', 1, '', '0000-00-00 00:00:00', 0, 1),
(112, 'hadi kolay gelsin pampa:)', 2, '', '0000-00-00 00:00:00', 0, 1),
(113, 'şimdi biter inş', 2, '', '0000-00-00 00:00:00', 0, 1),
(114, 'az kaldı sayılır', 2, '', '0000-00-00 00:00:00', 0, 1),
(115, 'verileri çekmem laızm', 2, '', '0000-00-00 00:00:00', 0, 1),
(116, 'diğeriniy yaptım zaten', 2, '', '0000-00-00 00:00:00', 0, 1),
(117, 'hee iyi', 1, '', '0000-00-00 00:00:00', 0, 1),
(118, 'bitmiş ozman pampa', 1, '', '0000-00-00 00:00:00', 0, 1),
(119, 'az kalmış', 1, '', '0000-00-00 00:00:00', 0, 1),
(120, 'slm', 1, '', '0000-00-00 00:00:00', 0, 2),
(121, 'loo', 1, '', '0000-00-00 00:00:00', 0, 2),
(122, 'şiii', 1, '', '0000-00-00 00:00:00', 0, 1),
(123, 'looo', 2, '', '0000-00-00 00:00:00', 0, 1),
(124, 'şii', 2, '', '0000-00-00 00:00:00', 0, 1),
(125, 'edendim pampa :)', 1, '', '0000-00-00 00:00:00', 0, 1),
(126, 'slm pampa :)', 5, '', '0000-00-00 00:00:00', 0, 10),
(127, 'slmm', 2, '', '0000-00-00 00:00:00', 0, 1),
(128, 'as pampa :)', 1, '', '0000-00-00 00:00:00', 0, 3),
(129, 'loo', 2, '', '0000-00-00 00:00:00', 0, 1),
(130, 'nasılsın', 2, '', '0000-00-00 00:00:00', 0, 1),
(131, 'looooooooo', 2, '', '0000-00-00 00:00:00', 0, 1),
(132, 'şiiiiiiiiiiiiii', 1, '', '0000-00-00 00:00:00', 0, 1),
(133, 'sana diyom', 1, '', '0000-00-00 00:00:00', 0, 1),
(134, 'slm', 1, '', '0000-00-00 00:00:00', 0, 19),
(135, 'slm', 1, '', '0000-00-00 00:00:00', 0, 1),
(136, 'as pampa', 2, '', '0000-00-00 00:00:00', 0, 1),
(137, 'naber pampa', 1, '', '0000-00-00 00:00:00', 0, 1),
(138, 'iyi pampa senden naber', 2, '', '0000-00-00 00:00:00', 0, 1),
(139, 'slm', 3, '', '0000-00-00 00:00:00', 0, 2),
(140, 'as pampa', 1, '', '0000-00-00 00:00:00', 0, 2),
(141, 'nasılsın', 3, '', '0000-00-00 00:00:00', 0, 2),
(142, 'iyi le sen', 1, '', '0000-00-00 00:00:00', 0, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_turkish_ci NOT NULL,
  `pwd` varchar(250) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `pwd`) VALUES
(1, 'enes_08', 'enes_08@gmail.com', '123456'),
(2, 'murat_08', 'murat_08@gmail.com', '123456'),
(3, 'umut_08', 'umut_08@gmail.com', '123456'),
(4, 'seref_08', 'seref_08@gmail.com', '123456'),
(5, 'enes', 'enes@gmail.com', '123'),
(13, 'serkan', 'serkan_08@gmail.com', '123456'),
(15, 'adnan', 'andan_08@gmail.com', '123456'),
(16, 'seref_08', 'seref_08_1@gmail.com', '123456'),
(17, 'enes', 'enes_1@gmail.com', '123'),
(18, 'serkan', 'serkan_08_1@gmail.com', '123456'),
(19, 'adnan', 'andan_08_1@gmail.com', '123456');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`c_id`);

--
-- Tablo için indeksler `conversation_reply`
--
ALTER TABLE `conversation_reply`
  ADD PRIMARY KEY (`cr_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `conversation`
--
ALTER TABLE `conversation`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `conversation_reply`
--
ALTER TABLE `conversation_reply`
  MODIFY `cr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
