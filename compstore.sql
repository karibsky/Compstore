-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Ноя 11 2019 г., 18:14
-- Версия сервера: 5.7.24
-- Версия PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `compstore`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(6, 'SSD'),
(3, 'Блок питания'),
(4, 'Видеокарта'),
(5, 'Материнская плата'),
(2, 'Оперативная память'),
(1, 'Процессор');

-- --------------------------------------------------------

--
-- Структура таблицы `developers`
--

CREATE TABLE `developers` (
  `id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(25) NOT NULL,
  `contacts` varchar(50) NOT NULL,
  `image` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `developers`
--

INSERT INTO `developers` (`id`, `name`, `country`, `contacts`, `image`) VALUES
(1, 'Intel', 'Москва', 'https://www.intel.ru/content/', '../img/intel.png'),
(2, 'Kingston', 'Калифорния', 'https://www.kingston.com/ru', '../img/kingston.png'),
(3, 'Gigabyte', 'Тайвань', 'http://www.gigabyte.ru/', '../img/gigabyte.png'),
(4, 'Asus', 'Тайвань', 'https://www.asus.com/ru/', '../img/asus.png'),
(5, 'Amd', 'Калифорния', 'https://www.amd.com/ru', '../img/amd.png'),
(6, 'MSI', 'Тайвань', 'https://ru.msi.com/', '../img/msi.png');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(5) NOT NULL,
  `characteristics` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `image` varchar(25) NOT NULL,
  `developer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `characteristics`, `type`, `image`, `developer`) VALUES
(1, 'KINGSTON VALUERAM KVR13N9S8/4', 2400, '240-pin; частота: 1333; латентность: CL9; форм-фактор: DIMM; тип поставки: Ret', 'Оперативная память', 'img/valueram.png', 'Kingston'),
(2, 'GIGABYTE GP-G750H', 7040, 'ATX12V v2.31; размер вентилятора 140мм; мощность: 750Вт; активный PFC; стандарт 80 PLUS GOLD; питание MB и CPU: 24+4+4 pin; питание видеокарты: 4х(6+2) pin; разъемы Molex: 3шт; разъемы SATA: 7шт; отсоединяющиеся кабели; цвет: черный; тип поставки Ret', 'Блок питания', 'img/g750h.png', 'Gigabyte'),
(3, 'GIGABYTE nVidia GeForce GTX 1060', 25190, 'частота процессора: 1506 МГц (1860 МГц, в режиме Boost); частота памяти: 8008МГц; объём видеопамяти: 6Гб; тип видеопамяти: GDDR5; OverClock Edition; DirectX 12/OpenGL 4.5; доп. питание: 8 pin; блок питания не менее: 400Вт; тип поставки: Ret', 'Видеокарта', 'img/gtx1060.png', 'Gigabyte'),
(4, 'INTEL Core i5 7640X', 15950, 'сокет LGA 2066, ядро Kaby Lake-X, ядер — 4, потоков — 4, L3 кэш 6Мб, частота 4 ГГц и 4.2 ГГц в режиме Turbo, техпроцесс 14нм, поддержка памяти DDR4 до 64 ГБ, каналов памяти — 2, множитель не заблокирован, контроллер PCI Express 3.0, поставка BOX', 'Процессор', 'img/i5.png', 'Intel'),
(5, 'ASUS PRIME Z370-P', 8580, 'гнездо процессора: LGA 1151v2; чипсет Intel Z370; память DDR4 — 4слота; частотой до 2666МГц; поддержка: CrossFire; SATA RAID, тип поставки: Ret; ATX', 'Материнская плата', 'img/z370p.png', 'Asus'),
(6, 'KINGSTON A400 SA400S37', 2690, 'скорость чтения, до: 500Мб/с; скорость записи, до: 320Мб/с; толщина — 7мм; интерфейс: SATA III; тип памяти: TLC; форм-фактор: 2.5\"; TBW: 40 ТБ', 'SSD', 'img/ssd.png', 'Kingston'),
(7, 'KINGSTON HyperX FURY White Series ', 5990, '288-pin; частота: 2400; латентность: CL15; форм-фактор: DIMM; оснащается радиатором для эффективного охлаждения, тип поставки: Ret', 'Оперативная память', 'img/hyperx.png', 'Kingston'),
(8, 'INTEL Celeron G4900', 3390, 'сокет LGA 1151v2, ядро Coffee Lake, ядер — 2, потоков — 2, L3 кэш 2Мб, частота 3.1 ГГц, техпроцесс 14нм, поддержка памяти DDR4 до 64 ГБ, каналов памяти — 2, контроллер PCI Express 3.0, графическое ядро Intel UHD Graphics 610, поставка OEM', 'Процессор', 'img/g4900.png', 'Intel'),
(9, 'ASUS ROG MAXIMUS X HERO', 17640, 'гнездо процессора: LGA 1151v2; чипсет Intel Z370; память DDR4 — 4слота; частотой до 2666МГц; поддержка: SLI/CrossFire; SATA RAID, тип поставки: Ret; ATX', 'Материнская плата', 'img/asusrog.png', 'Asus'),
(10, 'GIGABYTE nVidia GeForce GTX 1080', 44990, 'частота процессора: 1607 МГц (1771 МГц, в режиме Boost); частота памяти: 10010МГц; объём видеопамяти: 8Гб; тип видеопамяти: GDDR5X; OverClock Edition; поддержка: SLI; DirectX 12/OpenGL 4.5; доп. питание: 8 pin; тип поставки: Ret', 'Видеокарта', 'img/gtx1080.png', 'Gigabyte'),
(11, 'GIGABYTE GZ-EBS60N-C3', 2640, 'ATX; размер вентилятора 120мм; мощность: 600Вт; питание MB и CPU: 24+4+4 pin; питание видеокарты: 6+2 pin; разъемы Molex: 3шт; разъемы SATA: 6шт; цвет: черный; тип поставки OEM', 'Блок питания', 'img/gzc3.png', 'Gigabyte'),
(12, 'KINGSTON HyperX Savage ', 7690, 'скорость чтения, до: 520Мб/с; скорость записи, до: 510Мб/с; толщина — 7мм; адаптер 2.5\" — 3.5\" в комплекте; интерфейс: SATA III; форм-фактор: 2.5\"; TBW: 306 ТБ', 'SSD', 'img/ssdhyperx.png', 'Kingston'),
(13, 'AMD Ryzen 5 1600', 12480, 'сокет SocketAM4, ядро Summit Ridge, ядер — 6, потоков — 12, L3 кэш 16Мб, частота 3.2 ГГц и 3.6 ГГц в режиме Turbo, техпроцесс 14нм, поддержка памяти DDR4 каналов памяти — 2, множитель не заблокирован, кулер в комплекте, поставка BOX', 'Процессор', 'img/r5.png', 'Amd'),
(14, 'AMD Radeon R5', 3090, 'скорость чтения, до: 544Мб/с; скорость записи, до: 349Мб/с; толщина — 7мм; интерфейс: SATA III; тип памяти: 3D TLC; форм-фактор: 2.5\"', 'SSD', 'img/ssdr5.png', 'Amd'),
(15, 'AMD FX 8300', 6950, 'сокет SocketAM3+, ядро Piledriver Volan Vishera, ядер — 8, потоков — 8, L3 кэш 8Мб, частота 3.3 ГГц и 4.2 ГГц в режиме Turbo, техпроцесс 32нм, поддержка памяти DDR3 каналов памяти — 2, множитель не заблокирован, кулер в комплекте, поставка BOX', 'Процессор', 'img/fx8300.png', 'Amd'),
(16, 'AMD Ryzen 7 1700', 18490, 'сокет SocketAM4, ядро Summit Ridge, ядер — 8, потоков — 16, L3 кэш 16Мб, частота 3.0 ГГц и 3.7 ГГц в режиме Turbo, техпроцесс 14нм, поддержка памяти DDR4 каналов памяти — 2, множитель не заблокирован, поставка OEM', 'Процессор', 'img/r7.png', 'Amd'),
(17, 'INTEL Core i7 7700', 19490, 'сокет LGA 1151, ядро Kaby Lake, ядер — 4, потоков — 8, L3 кэш 8Мб, частота 3.6 ГГц и 4.2 ГГц в режиме Turbo, техпроцесс 14нм, поддержка памяти DDR4/ DDR3L до 64 ГБ, каналов памяти — 2, PCI Express 3.0, графическое ядро Intel HD Graphics 630, поставка OEM', 'Процессор', 'img/i7.png', 'Intel'),
(18, 'ASUS ROG STRIX Z370-H', 11980, 'гнездо процессора: LGA 1151v2; чипсет Intel Z370; память DDR4 — 4слота; частотой до 2133МГц; поддержка: SLI/CrossFire; SATA RAID, тип поставки: Ret; ATX', 'Материнская плата', 'img/z370h.png', 'Asus'),
(19, 'ASUS TUF B350M-PLUS', 6190, 'гнездо процессора: SocketAM4; чипсет AMD B350; память DDR4 — 4слота; частотой до 2666МГц; поддержка: CrossFire; SATA RAID, тип поставки: Ret; mATX', 'Материнская плата', 'img/b350m.png', 'Asus'),
(20, 'GIGABYTE GP-P650B', 4650, 'ATX12V v2.31; размер вентилятора 120мм; мощность: 650Вт; активный PFC; стандарт 80 PLUS BRONZE; питание MB и CPU: 24+4+4 pin; питание видеокарты: 6+2 pin; разъемы Molex: 3шт; разъемы SATA: 6шт; цвет: серебристый; тип поставки Ret', 'Блок питания', 'img/p650b.png', 'Gigabyte'),
(21, 'MSI B350 TOMAHAWK PLUS', 6700, 'гнездо процессора: SocketAM4; чипсет AMD B350; память DDR4 — 4слота; частотой до 2400МГц; поддержка: CrossFire; SATA RAID, тип поставки: Ret; ATX', 'Материнская плата', 'img/b350.png', 'MSI'),
(22, 'MSI A320M PRO-VH PLUS', 3579, 'гнездо процессора: SocketAM4; чипсет AMD A320; память DDR4 — 2слота; частотой до 2667МГц; SATA RAID, тип поставки: Ret; mATX', 'Материнская плата', 'img/a320m.png', 'MSI'),
(23, 'MSI AMD Radeon RX 580', 28290, 'частота процессора: 1366 МГц; частота памяти: 8000МГц; объём видеопамяти: 8Гб; тип видеопамяти: GDDR5; OverClock Edition; поддержка: CrossFireX; DirectX 12/OpenGL 4.5; доп. питание: 8 pin; блок питания не менее: 500Вт; тип поставки: Ret', 'Видеокарта', 'img/rx580.png', 'MSI'),
(24, 'MSI GTX 1070Ti', 44190, 'частота процессора: 1607 МГц (1683 МГц, в режиме Boost); частота памяти: 8008МГц; объём видеопамяти: 8Гб; тип видеопамяти: GDDR5; поддержка: SLI; DirectX 12/OpenGL 4.5; доп. питание: 6+8 pin; блок питания не менее: 500Вт; тип поставки: Ret', 'Видеокарта', 'img/1070ti.png', 'MSI');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Индексы таблицы `developers`
--
ALTER TABLE `developers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `developer` (`developer`),
  ADD KEY `type_2` (`type`),
  ADD KEY `developer_2` (`developer`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `developers`
--
ALTER TABLE `developers`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`type`) REFERENCES `category` (`name`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`developer`) REFERENCES `developers` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
