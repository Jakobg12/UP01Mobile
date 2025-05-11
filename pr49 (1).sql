-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 192.168.50.249:3306
-- Время создания: Май 08 2025 г., 12:11
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pr49`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Category`
--

CREATE TABLE `Category` (
  `Id` int NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Category`
--

INSERT INTO `Category` (`Id`, `Name`) VALUES
(1, 'Soups'),
(2, 'Woters'),
(3, 'Meats');

-- --------------------------------------------------------

--
-- Структура таблицы `Dishes`
--

CREATE TABLE `Dishes` (
  `Id` int NOT NULL,
  `Category` int NOT NULL,
  `NameDish` varchar(255) NOT NULL,
  `Price` varchar(50) NOT NULL,
  `Icon` varchar(255) NOT NULL,
  `Version` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Dishes`
--

INSERT INTO `Dishes` (`Id`, `Category`, `NameDish`, `Price`, `Icon`, `Version`) VALUES
(1, 1, 'Гороховый суп', '499', 'https://avatars.mds.yandex.net/i?id=46f54c36c0999a861e3588aac2bd81a1_l-8132087-images-thumbs', 1),
(2, 2, 'Вода негазированная ', '60', 'https://avatars.mds.yandex.net/i?id=650cafb472629b56b2210ca2503faf4a_sr-5734572-images-thumbs', 3),
(3, 3, 'Стейк из баранины', '1290', 'https://avatars.mds.yandex.net/i?id=65ec778e4f0db08427ab3b1d26127cfd_l-10339933-images-thumbs', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Order`
--

CREATE TABLE `Order` (
  `Id` int NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `DishId` int NOT NULL,
  `Count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `Id` int NOT NULL,
  `Login` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Telephone` varchar(100) NOT NULL,
  `Token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`Id`, `Login`, `Email`, `Password`, `Telephone`, `Token`) VALUES
(17, 'Opp Opp Oppp', 'r@r.ru', 'r', '79194843373', NULL),
(18, 'Alex Alex Alex', 'a@a.ru', 'aaa', '79994742626', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Versions`
--

CREATE TABLE `Versions` (
  `Id` int NOT NULL,
  `Version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Versions`
--

INSERT INTO `Versions` (`Id`, `Version`) VALUES
(1, 'версия 1'),
(2, 'версия 2'),
(3, 'версия 3'),
(4, 'версия 4');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Dishes`
--
ALTER TABLE `Dishes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_idx` (`Category`);

--
-- Индексы таблицы `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Versions`
--
ALTER TABLE `Versions`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Category`
--
ALTER TABLE `Category`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Dishes`
--
ALTER TABLE `Dishes`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Order`
--
ALTER TABLE `Order`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `Versions`
--
ALTER TABLE `Versions`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Dishes`
--
ALTER TABLE `Dishes`
  ADD CONSTRAINT `fk` FOREIGN KEY (`Category`) REFERENCES `Category` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
