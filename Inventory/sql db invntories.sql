CREATE TABLE offices (
  id SERIAL PRIMARY KEY,
  office VARCHAR,
  building VARCHAR
);
INSERT INTO offices (office, building)
VALUES ('10', 'ЗДАНИЕ-1'),
  ('14', 'ЗДАНИЕ-1'),
  ('32', 'ЗДАНИЕ-1'),
  ('101', 'ЗДАНИЕ-2'),
  ('104', 'ЗДАНИЕ-2'),
  ('204', 'ЗДАНИЕ-2'),
  ('203', 'ЗДАНИЕ-2'),
  ('201', 'ЗДАНИЕ-2'),
  ('303', 'ЗДАНИЕ-2'),
  ('3', 'ЗДАНИЕ-1'),
  ('15', 'ЗДАНИЕ-1'),
  ('33', 'ЗДАНИЕ-1'),
  ('205', 'ЗДАНИЕ-2'),
  ('206', 'ЗДАНИЕ-2'),
  ('305', 'ЗДАНИЕ-2'),
  ('306', 'ЗДАНИЕ-2'),
  ('407', 'ЗДАНИЕ-2'),
  ('408', 'ЗДАНИЕ-2'),
  ('409', 'ЗДАНИЕ-2'),
  ('410', 'ЗДАНИЕ-2'),
  ('304', 'ЗДАНИЕ-2'),
  ('4', 'ЗДАНИЕ-1'),
  ('18', 'ЗДАНИЕ-1'),
  ('23', 'ЗДАНИЕ-1'),
  ('27', 'ЗДАНИЕ-1'),
  ('31', 'ЗДАНИЕ-1'),
  ('34', 'ЗДАНИЕ-1'),
  ('202', 'ЗДАНИЕ-2'),
  ('302', 'ЗДАНИЕ-2');
CREATE TABLE devices (
  id SERIAL PRIMARY KEY,
  device VARCHAR,
  title VARCHAR
);
INSERT INTO devices (device, title)
VALUES ('Atc', 'Panasonic kx-tda100ru'),
  ('Видеокамера белая', NULL),
  ('Интерактиная доска с короткофокусным проектором', 'Promethean activeboard i78 mount dlp'),
  ('Колонки', 'Sven sps-605'),
  ('Компьютер', 'Nuc'),
  ('Программно-аапаратный комплекс', 'Vipnet coordinator hw 1000'),
  ('Сетевой фильтр', 'Sven platinum'),
  ('Маршрутизатор', 'Mikrotik'),
  ('Сетевой фильтр', 'Makel с заземлением mpg 137'),
  ('Роутер', 'Mikrotik browder rb9516'),
  ('Dvd-плеер', 'Pioner dv-310-k'),
  ('Акустическая система', 'Electrovoice'),
  ('Коммутатор', 'Kramer'),
  ('Масштабатор видео и графики', 'Kramer'),
  ('Микрофон делегата настольный', NULL),
  ('Микрофонная стойка', 'Quik lok a300'),
  ('Мультимедийный проектор', 'Epson eb-965h'),
  ('Пульт микшерский', 'Soundcraft epm8'),
  ('Система вентилляции и кондиционирования', NULL),
  ('Эран моторизированный', 'Projecta compact electrol'),
  ('Ноутбук', 'Acer aspire as5560g-4333g32mn'),
  ('Видеокамера серая', NULL),
  ('Микрофон', 'Shure sh58'),
  ('Акустическая система', 'Mackie sr1530z'),
  ('Сетевой фильтр', 'Sven optima'),
  ('Сетевой фильтр', 'Surge protector'),
  ('Мультимедийный проектор', 'Optima ex612'),
  ('Экран настенный', 'Screenmedia economy-p'),
  ('Колонки', 'Logitech s120'),
  ('Компьютер', 'Nuc mini pc kit'),
  ('Сетевой фильтр', 'Pc pet'),
  ('Интерактиная доска', '80'),
  ('Короткофокусный проектор', 'Benq'),
  ('Колонки', 'Microlab solo 1'),
  ('Акустическая система', 'Eurosound eg-26w 2*6'),
  ('Микшерный пульт', 'Eurosound compact-802'),
  ('Планшет графический', 'Wacom pl-1600'),
  ('Телевизор плазменный', 'Lg 50pa6500'),
  ('Усилитель мощности', 'Eurosound xz-400'),
  ('8 port video splitter', NULL),
  ('Калькулятор', 'Skainer 486'),
  ('Сетевой фильтр', 'Power cube'),
  ('Принтер', 'Hp laserjet pro p1102'),
  ('Мультимедийный проектор', 'Acer'),
  ('Компьютер', 'Lenovo S20'),
  ('Монитор', 'Tft 17 lg l1717ss'),
  ('Ноутбук', 'Lenovo 15.6 ideal pad g500'),
  ('Компьютер с монитором', 'Альфа intel core'),
  ('Телефон', 'Panasonic kx-ts2350ru'),
  ('Колонки', 'Sven 607'),
  ('Калькулятор', 'Sitizen 8360'),
  ('Коммутатор', 'D-link dgs-1008a'),
  ('Компьютер', 'Lenovo V530'),
  ('Мфу', 'Epson workforce pro wf-m5690dqwf+'),
  ('Сетевой фильтр 3 розетки', NULL),
  ('Сетевой фильтр', 'Sven classic'),
  ('Принтер', 'Hp laserjet m1120'),
  ('Инструмент для обжима rj45', 'Ht-568r'),
  ('Вебкамера', 'Logitech webcam c510'),
  ('Кроссировочный инструмент', '110 krone trendnet tc-pdt'),
  ('Ноутбук', 'Samsung np300e7zs02ru'),
  ('Компьютер', 'Hp 20-c029ur 19.5'),
  ('Сетевой фильтр', 'Defender'),
  ('Мфу', 'Kyocera fs-1035 mfp'),
  ('Калькулятор', 'Sitizen sdc-810 bn'),
  ('Калькулятор', 'Sitizen sdc-888t-11'),
  ('Принтер', 'Hp laserjet p1505'),
  ('Коммутатор', 'D-link dgs-1024'),
  ('Сетевой фильтр', 'Buro 508h-5-b'),
  ('Калькулятор', 'Sitizen sdc-435'),
  ('Коммутатор', 'D-link dgs-1016/b1a'),
  ('Компьютер', 'Asus'),
  ('Калькулятор', 'Sitizen electronic calculator'),
  ('Телевизор', 'iffalcon'),
  ('Калькулятор', 'Skainer 512'),
  ('Видеокамера', NULL),
  ('Пульт микшерский', 'Soundcraft spirit e12 mixer'),
  ('Интерактивный лазерный тир вместе с проектором', 'Рубин илт110 кадет-3'),
  ('Ударная установка барабаны', 'Sonor force 507'),
  ('Коммутатор', 'D-link dgs-1008d'),
  ('Экран', 'Draper luma 120'),
  ('Коммутатор', 'D-link dgs-1052x/a1a'),
  ('Коммутатор', 'D-link dgs-1210-52');
CREATE TABLE inventories (
  id SERIAL PRIMARY KEY,
  inventory VARCHAR,
  device_id INT REFERENCES devices(id),
  office_id INT REFERENCES offices(id),                                               
  quantity INT,                                                   
  date TIMESTAMP
);
INSERT INTO inventories (inventory, device_id, office_id, quantity, date)
VALUES ('Инв2457', '1', '1', '1', '2017-12-12 12:12:12'),
  (NULL, '2', '1', '1', '2017-12-12 12:12:12'),
  ('Инв109', '3', '1', '1', '2017-12-12 12:12:12'),
  ('Инв200008', '4', '1', '1', '2017-12-12 12:12:12'),
  ('Инв2649', '5', '1', '1', '2017-12-12 12:12:12'),
  ('Инв34400', '6', '1', '1', '2017-12-12 12:12:12'),
  (NULL, '7', '1', '2', '2017-12-12 12:12:12'),
  ('Инв2663', '8', '1', '1', '2017-12-12 12:12:12'),
  (NULL, '9', '1', '1', '2017-12-12 12:12:12'),
  (NULL, '10', '1', '1', '2017-12-12 12:12:12'),
  ('Инв2420', '11', '2', '1', '2017-12-12 12:12:12'),
  ('Инв2415', '12', '2', '4', '2017-12-12 12:12:12'),
  ('Инв2418', '13', '2', '1', '2017-12-12 12:12:12'),
  ('Инв2417', '14', '2', '1', '2017-12-12 12:12:12'),
  ('Инв2354', '16', '2', '2', '2017-12-12 12:12:12'),
  ('Инв2424', '15', '2', '1', '2017-12-12 12:12:12'),
  ('Инв2708', '17', '2', '1', '2018-05-12 12:12:12'),
  ('Инв2416', '18', '2', '1', '2017-12-12 12:12:12'),
  ('Инв2408', '19', '2', '1', '2017-12-12 12:12:12'),
  ('Инв2413', '20', '2', '1', '2017-12-12 12:12:12'),
  ('Инв2485', '21', '2', '1', '2020-03-12 12:12:12'),
  (NULL, '22', '2', '1', '2021-09-12 12:12:12'),
  (NULL, '23', '2', '4', '2017-12-12 12:12:12'),
  ('Инв2350', '24', '2', '1', '2021-12-12 12:12:12'),
  ('Инв2351', '24', '2', '1', '2021-12-12 12:12:12'),
  (NULL, '25', '2', '2', '2021-09-12 12:12:12'),
  (NULL, '26', '2', '1', '2021-09-12 12:12:12'),
  ('Инв2652', '5', '3', '1', '2017-12-12 12:12:12'),
  ('Инв2477', '27', '3', '1', '2017-12-12 12:12:12'),
  ('Инв2480', '28', '3', '1', '2017-12-12 12:12:12'),
  ('204', '29', '3', '1', '2017-12-12 12:12:12'),
  (NULL, '26', '3', '1', '2017-12-12 12:12:12'),
  ('Инв2749', '30', '5', '1', '2022-02-12 12:12:12'),
  ('Инв6410', '3', '5', '1', '2017-12-12 12:12:12'),
  (NULL, '26', '5', '1', '2017-12-12 12:12:12'),
  ('Инв200008', '4', '5', '1', '2020-12-12 12:12:12'),
  ('Инв2496/1', '35', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2496/2', '35', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2496/3', '35', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2496/4', '35', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2496/5', '35', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2496/6', '35', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2423', '15', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2495', '36', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2502', '37', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2498', '38', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2499', '38', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2748', '30', '4', '1', '2022-02-12 12:12:12'),
  ('Инв2497', '39', '4', '1', '2017-12-12 12:12:12'),
  (NULL, '26', '4', '1', '2017-12-12 12:12:12'),
  (NULL, '40', '4', '1', '2017-12-12 12:12:12'),
  (NULL, '9', '4', '1', '2017-12-12 12:12:12'),
  ('Инв2654', '5', '8', '1', '2017-12-12 12:12:12'),
  ('Инв2558', '33', '8', '1', '2017-12-12 12:12:12'),
  ('Инв2478', '28', '8', '1', '2017-12-12 12:12:12'),
  ('Инв200008', '4', '8', '1', '2017-12-12 12:12:12'),
  (NULL, '31', '8', '1', '2017-12-12 12:12:12'),
  ('Инв200008', '4', '7', '1', '2022-02-12 12:12:12'),
  (NULL, '31', '7', '2', '2017-12-12 12:12:12'),
  ('Инв2653', '5', '7', '1', '2017-12-12 12:12:12'),
  ('Инв6411', '3', '7', '1', '2017-12-12 12:12:12'),
  ('Инв2750', '30', '6', '1', '2021-09-12 12:12:12'),
  ('Инв2707', '17', '6', '1', '2020-05-12 12:12:12'),
  ('Инв200010', '34', '9', '1', '2017-12-12 12:12:12'),
  ('Инв2650', '5', '9', '1', '2017-12-12 12:12:12'),
  ('Инв2556', '33', '9', '1', '2017-12-12 12:12:12'),
  ('Инв6426', '32', '9', '1', '2017-12-12 12:12:12'),
  ('Инв4000000000002', '41', '11', '1', '2017-12-12 12:12:12'),
  (NULL, '42', '11', '1', '2017-12-12 12:12:12'),
  ('Инв2671', '45', '11', '1', '2017-12-12 12:12:12'),
  ('Инв2685', '43', '11', '1', '2017-12-12 12:12:12'),
  ('Инв2737', '44', '11', '1', '2022-09-12 12:12:12'),
  ('Инв2662', '8', '11', '1', '2017-12-12 12:12:12'),
  ('Инв2312', '46', '11', '1', '2017-12-12 12:12:12'),
  ('Инв2643', '47', '11', '1', '2017-12-12 12:12:12'),
  (NULL, '25', '11', '2', '2017-12-12 12:12:12'),
  ('Инв2572', '48', '11', '1', '2017-12-12 12:12:12'),
  ('108', '49', '11', '1', '2017-12-12 12:12:12'),
  ('Инв2651', '5', '20', '1', '2017-12-12 12:12:12'),
  ('Инв200009', '50', '20', '1', '2021-12-12 12:12:12'),
  ('196', '51', '12', '1', '2017-12-12 12:12:12'),
  ('Инв4000002', '41', '12', '1', '2017-12-12 12:12:12'),
  ('230', '52', '12', '1', '2017-12-12 12:12:12'),
  ('Инв2674', '45', '12', '1', '2017-12-12 12:12:12'),
  ('Инв2638', '47', '12', '1', '2017-12-12 12:12:12'),
  ('Инв2688', '43', '20', '1', '2022-02-12 12:12:12'),
  (NULL, '7', '12', '2', '2017-12-12 12:12:12'),
  (NULL, '25', '12', '1', '2017-12-12 12:12:12'),
  (NULL, '26', '12', '1', '2017-12-12 12:12:12'),
  ('Инв2727', '53', '12', '1', '2020-02-12 12:12:12'),
  ('Инв2715', '54', '12', '1', '2022-09-12 12:12:12'),
  ('Инв200005', '49', '12', '1', '2017-12-12 12:12:12'),
  ('Инв2569', '48', '20', '1', '2022-02-12 12:12:12'),
  ('230', '52', '13', '1', '2017-12-12 12:12:12'),
  ('Инв2673', '45', '14', '1', '2022-09-12 12:12:12'),
  (NULL, '26', '14', '1', '2017-12-12 12:12:12'),
  (NULL, '55', '20', '1', '2022-09-12 12:12:12'),
  ('Инв2687', '43', '13', '1', '2017-12-12 12:12:12'),
  (NULL, '55', '20', '1', '2022-09-12 12:12:12'),
  (NULL, '56', '20', '1', '2022-09-12 12:12:12'),
  ('Инв200005', '49', '14', '1', '2022-09-12 12:12:12'),
  ('196', '51', '14', '1', '2022-09-12 12:12:12'),
  ('Инв2574', '48', '14', '1', '2022-09-12 12:12:12'),
  ('Инв2471', '57', '14', '1', '2018-09-12 12:12:12'),
  ('132', '58', '20', '1', '2022-02-12 12:12:12'),
  ('Инв2656', '45', '19', '1', '2022-04-12 12:12:12'),
  (NULL, '59', '20', '1', '2021-11-12 12:12:12'),
  ('Инв2644', '47', '19', '1', '2022-04-12 12:12:12'),
  ('Инв2646', '47', '20', '1', '2022-04-12 12:12:12'),
  ('133', '60', '20', '1', '2022-02-12 12:12:12'),
  ('Инв2536', '61', '20', '1', '2022-02-12 12:12:12'),
  ('Инв2640', '47', '20', '1', '2022-09-12 12:12:12'),
  ('Инв2701', '62', '15', '1', '2018-05-12 12:12:12'),
  ('Инв2327', '46', '15', '1', '2018-05-12 12:12:12'),
  ('Инв2639', '47', '15', '1', '2017-12-12 12:12:12'),
  ('Инв2570', '48', '15', '1', '2017-12-12 12:12:12'),
  (NULL, '49', '15', '1', '2017-12-12 12:12:12'),
  (NULL, '25', '15', '1', '2017-12-12 12:12:12'),
  (NULL, '63', '15', '1', '2017-12-12 12:12:12'),
  ('Инв2550', '64', '15', '1', '2019-12-12 12:12:12'),
  (NULL, '65', '16', '1', '2017-12-12 12:12:12'),
  (NULL, '66', '16', '1', '2017-12-12 12:12:12'),
  (NULL, '42', '16', '1', '2017-12-12 12:12:12'),
  (NULL, '31', '16', '1', '2017-12-12 12:12:12'),
  ('Инв200005', '49', '16', '1', '2017-12-12 12:12:12'),
  ('Инв2450', '67', '16', '1', '2017-12-12 12:12:12'),
  ('Инв2678', '45', '16', '1', '2017-12-12 12:12:12'),
  ('Инв2672', '45', '16', '1', '2017-12-12 12:12:12'),
  ('230', '52', '16', '1', '2017-12-12 12:12:12'),
  (NULL, '69', '20', '1', '2022-09-12 12:12:12'),
  (NULL, '68', '20', '1', '2022-09-12 12:12:12'),
  (NULL, '52', '20', '1', '2022-09-12 12:12:12'),
  ('Инв2697', '62', '17', '1', '2018-05-12 12:12:12'),
  ('Инв2703', '62', '17', '1', '2018-05-12 12:12:12'),
  ('Инв2729', '53', '17', '1', '2019-12-12 12:12:12'),
  ('Инв2690', '43', '17', '1', '2017-12-12 12:12:12'),
  ('Инв200005', '49', '17', '1', '2017-12-12 12:12:12'),
  (NULL, '56', '17', '1', '2017-12-12 12:12:12'),
  (NULL, '31', '17', '1', '2017-12-12 12:12:12'),
  (NULL, '25', '17', '1', '2017-12-12 12:12:12'),
  ('Инв2657', '45', '17', '1', '2017-12-12 12:12:12'),
  (NULL, '70', '17', '1', '2017-12-12 12:12:12'),
  (NULL, '26', '17', '1', '2017-12-12 12:12:12'),
  (NULL, '71', '18', '2', '2019-12-12 12:12:12'),
  ('Инв2696', '62', '18', '1', '2018-05-12 12:12:12'),
  ('Инв2675', '45', '18', '1', '2017-12-12 12:12:12'),
  ('Инв2670', '45', '18', '1', '2017-12-12 12:12:12'),
  ('Инв2539', '72', '18', '1', '2019-02-12 12:12:12'),
  ('Инв2547', '72', '18', '1', '2019-02-12 12:12:12'),
  ('127', '49', '18', '1', '2017-12-12 12:12:12'),
  (NULL, '42', '18', '1', '2017-12-12 12:12:12'),
  (NULL, '63', '18', '1', '2017-12-12 12:12:12'),
  (NULL, '73', '18', '1', '2017-12-12 12:12:12'),
  ('Инв2714', '54', '18', '1', '2020-12-12 12:12:12'),
  ('Инв2728', '53', '18', '1', '2019-12-12 12:12:12'),
  ('?', '74', '21', '1', '2022-07-12 12:12:12'),
  (NULL, '76', '10', '1', '2017-12-12 12:12:12'),
  (NULL, '2', '22', '1', '2017-12-12 12:12:12'),
  (NULL, '26', '22', '1', '2017-12-12 12:12:12'),
  ('Инв5397', '78', '22', '1', '2017-12-12 12:12:12'),
  ('Инв2473', '79', '10', '1', '2021-12-12 12:12:12'),
  ('Инв2479', '28', '24', '1', '2017-12-12 12:12:12'),
  ('Инв2122', '80', '25', '1', '2017-12-12 12:12:12'),
  ('Инв2155', '81', '26', '1', '2017-12-12 12:12:12'),
  ('Инв2158', '81', '27', '1', '2017-12-12 12:12:12'),
  ('Инв2738', '82', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2706', '17', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2598', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2599', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2600', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2597', '47', '20', '1', '2021-09-12 12:12:12'),
  ('Инв2601', '47', '13', '1', '2022-09-12 12:12:12'),
  ('Инв2602', '47', '13', '1', '2022-09-12 12:12:12'),
  ('Инв2603', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2604', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2605', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2606', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2607', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2608', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2609', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2610', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2611', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2612', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2613', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2614', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2615', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2616', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2617', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2618', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2619', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2620', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2621', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2622', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2623', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2624', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2625', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2626', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2627', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2628', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2629', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2630', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2631', '47', '28', '1', '2017-12-12 12:12:12'),
  ('Инв2632', '47', '28', '1', '2017-12-12 12:12:12'),
  (NULL, '22', '29', '1', '2017-12-12 12:12:12'),
  ('Инв6427', '32', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2501', '83', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2500', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2501', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2502', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2503', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2504', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2505', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2506', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2507', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2508', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2512', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2513', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2514', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2515', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2516', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2517', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2518', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2519', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2520', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2521', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2522', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2523', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2524', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2527', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2528', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2529', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2530', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2531', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2532', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2533', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2534', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2535', '61', '29', '1', '2017-12-12 12:12:12'),
  ('Инв2509', '61', '20', '1', '2020-09-12 12:12:12'),
  ('Инв2510', '61', '20', '1', '2020-09-12 12:12:12'),
  ('Инв2511', '61', '20', '1', '2020-09-12 12:12:12'),
  ('Инв2525', '61', '20', '1', '2020-09-12 12:12:12'),
  ('Инв2691', '43', '12', '1', '2022-09-12 12:12:12'),
  ('Инв2526', '61', '20', '1', '2020-09-12 12:12:12');
SELECT inventory, device, title, office, quantity, date
  FROM inventories 
  INNER JOIN devices
  ON inventories.device_id = devices.id
  INNER JOIN offices
  ON inventories.office_id = offices.id
  WHERE office='410'
  ORDER BY device;
SELECT * FROM offices
ORDER BY office;