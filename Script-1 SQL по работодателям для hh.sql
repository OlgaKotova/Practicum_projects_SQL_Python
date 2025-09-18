--Определите диапазон заработных плат в общем, а именно средние значения, минимумы и максимумы нижних и верхних порогов зарплаты.

SELECT min(salary_from) AS minfrom, 
max(salary_from) AS maxfrom, 
round (avg(salary_from),2) AS AVGfrom, 
min(salary_to) AS minto, 
max(salary_to) AS maxto, 
round (avg(salary_to),2) AS AVGto
FROM public.parcing_table;
--minfrom|maxfrom |avgfrom  |minto  |maxto   |avgto    |
-------+--------+---------+-------+--------+---------+
   50.0|398000.0|109525.09|25000.0|497500.0|153846.71|
   
  -- Вывод: Средняя зарплата начинающего - свыше 109 000, начинается с 50 - похоже на ошибку данных, и достигает 389 тыс.

   
   --Количество вакансий по регионам
SELECT area, 
count(name) AS COUNT_NAME
FROM public.parcing_table
GROUP BY area 
ORDER BY COUNT_NAME DESC; 
--area                         |count_name|
-----------------------------+----------+
Москва                       |      1247|
Санкт-Петербург              |       181|
Екатеринбург                 |        51|
Нижний Новгород              |        33|
Новосибирск                  |        33|
Владивосток                  |        31|
Казань                       |        29|
Краснодар                    |        22|
Самара                       |        11|
Пермь                        |        10|
Ростов-на-Дону               |        10|
Челябинск                    |        10|
Воронеж                      |         8|
Томск                        |         8|
Тюмень                       |         8|
Владимир                     |         7|
Красноярск                   |         6|
Адыгейск                     |         6|
Иваново (Ивановская область) |         5|
Ижевск                       |         4|
Уфа                          |         4|
Горно-Алтайск                |         3|
Саратов                      |         3|
Ступино                      |         3|
Смоленск                     |         3|
Химки                        |         3|
Тверь                        |         3|
Майкоп                       |         3|
Чебоксары                    |         3|
Рязань                       |         2|
Липецк                       |         2|
Королев                      |         2|
Верхняя Пышма                |         2|
Ульяновск                    |         2|
Кемерово                     |         2|
Омск                         |         2|
Балашиха                     |         2|
Щербинка                     |         2|
Калининград                  |         2|
Киров (Кировская область)    |         2|
Златоуст                     |         2|
Турочак                      |         1|
Мытищи                       |         1|
Одинцово                     |         1|
Великие Луки                 |         1|
Якутск                       |         1|
Пушкино (Московская область) |         1|
Подольск (Московская область)|         1|
Симферополь                  |         1|
Вельск                       |         1|
Байбек                       |         1|
Тольятти                     |         1|
Нефтекамск                   |         1|
Дмитров                      |         1|
Луховицы                     |         1|
Дзержинский                  |         1|
Набережные Челны             |         1|
Белгород                     |         1|
Сочи                         |         1|
Артем                        |         1|
Вейделевка                   |         1|
Алтайское                    |         1|
Оренбург                     |         1|
Тула                         |         1|
Магнитогорск                 |         1|
Псков                        |         1|
Иркутск                      |         1|
Волгоград                    |         1|
Северск (Томская область)    |         1|
Курган                       |         1|
--Самое большое количество вакансий в Москве и Санкт-Петербурге

--Количество вакансий по компаниям
SELECT employer, 
count(name) AS COUNT_NAME
FROM public.parcing_table
GROUP BY employer 
ORDER BY COUNT_NAME DESC;

--СБЕР	243
WILDBERRIES	43
Ozon	34
Банк ВТБ (ПАО)	28
Т1	26
МАГНИТ, Розничная сеть	24
МТС	22
Okko	19
Центральный банк Российской Федерации	16
Ростелеком	15
Правительство Москвы	15
Яндекс	15
Райффайзен Банк	14
Московская Биржа	13
ГКУ Центр занятости населения города Москвы	12
Деловые Линии	12
Марс	11
ANCOR	11
Спортмастер	10
ПСБ (ПАО «Промсвязьбанк»)	10
Самокат (ООО Умный ритейл)	10
Леруа Мерлен	10
Центр финансовых технологий	9
INGURU.RU	9
Медиапоинт	9
Газпром нефть	9
Контур	9
USETECH	8
СИБУР, Группа компаний	8
Московский Кредитный Банк	8
МегаФон	8
Maxim technology	8
Комус	8
ГКУ Инфогород	8
DNS Технологии	8
билайн	8
DNS Головной офис	8
РТЛабс	7
Гринатом	7
«UZUM TECHNOLOGIES».	7
Tele2	7
Северсталь	7
Мегамаркет	6
Совкомбанк	6
KONNEKTU	6
Лента, федеральная розничная сеть	6
Согласие, страховая компания	6
Альфа-Банк	6
Ай-Пласт	6
РУСАЛ, Центр подбора персонала	6
Звук	5
CloudPayments	5
X5 Tech	5
Innovative People	5
Axenix (ранее Accenture)	5
Finstar Financial Group	5
Займиго МФК	5
RUTUBE	5
Национальный исследовательский университет Высшая школа экономики	5
Газпромбанк	5
Лига Цифровой Экономики	5
АДВ	5
Россельхозбанк	5
Recruitment Boutique S.M.Art	4
Банк Санкт-Петербург	4
Автомакон	4
ТЕЛЕКОНТАКТ	4
ВкусВилл	4
ЭР-Телеком	4
БалтТрансСервис	4
IBS	4
Ак Барс Банк	4
ПартКом	4
Ventra	4
VK	4
Группа страховых компаний Югория	4
Rambler&Co	4
Сравни	4
Парфюмерно-косметический супермаркет Золотое Яблоко	4
StudyWorld	4
Первый Бит	4
СК Сбербанк страхование жизни	3
Эстилаб Рус	3
Группа Компаний КАН АВТО	3
Сеть Партнерств	3
Тануки, японский ресторан	3
BestDoctor	3
ЦРТ | Группа компаний	3
Полюс	3
Marfatech	3
Бристоль, сеть магазинов	3
Skillfactory	3
Х5 IMPORT	3
Ингосстрах	3
Солар	3
Юникон АП	3
Судоходная компания Волжское пароходство	3
ГБУЗ ЦЛО ДЗМ	3
ДОМ.РФ	3
FESCO (ПАО Дальневосточное морское пароходство)	3
Evercode Lab	3
УГМК-Телеком	3
EMCD Tech LTD	3
Транспортная Компания Технология Движения	3
Промэкспертиза	3
BRANDPOL	3
Carely	3
Сеть магазинов цифровой и бытовой техники DNS	3
РСХБ-Интех	3
AVO.UZ	3
Mr.Food	3
ФЛАУВАУ	3
МФТИ	3
ТехноГрупп	3
ГБУ МО МОМИАЦ	3
АНО Центр развития Среда возможностей	3
Bell Integrator	3
Дром	3
ОКБ	3
Софт Компани	3
Samokat.tech	3
ГБУЗ Владимирской области Медицинский информационно-аналитический центр	3
LEGAT CONSULT	3
KAMAZ DIGITAL	2
Триколор	2
РЕСО-Гарантия, САО	2
MPSTATS	2
Reinvent Baltics	2
Компания CADesign	2
БиАйЭй-Технолоджиз	2
Деко Системс	2
Организация Агат	2
МедиаСофт	2
YADRO	2
Between Exchange	2
Диджитал Лайн	2
Федеральная сеть книжных магазинов Читай-город	2
Авто-Траст	2
АстраЗенека	2
GrowFood	2
Сэлвим	2
Bonduelle	2
ЦРПТ (Центр развития перспективных технологий)	2
Группа компаний АГРОЭКО	2
RALF RINGER	2
Метран, Промышленная группа	2
LADA Цифра	2
Mayflower	2
TradingView	2
HuntIT	2
D Innovate Group	2
SberAutoTech	2
Норникель	2
Health & Nutrition	2
Автодор-Платные Дороги	2
LoyaltyPlant	2
Аэрофлот	2
Двигус	2
Kept (Кэпт)	2
КГКУ Информационно-технологический центр Приморского края	2
Спортмарафон	2
ДИКАРТ завод гипсовой лепнины	2
Кадровый Центр Департамента здравоохранения города Москвы	2
Интерлизинг	2
Х5 Group	2
X5 Digital	2
АктивПромКапитал	2
Финтех Айкью	2
Уралбиофарм	2
НОВАТЭК	2
Coleman Group	2
Яндекс Практикум	2
Ренессанс cтрахование, Группа	2
Дартс рекрутинг сервисез	2
ФГБОУ ВО Самарский государственный медицинский университет МЗ РФ	2
ГБУ Мособлмедсервис	2
Ростелеком - Центры обработки данных	2
Ренессанс Банк	2
АВИТО ТЕХ	2
ГКУЗ ЛО МЕДИЦИНСКИЙ ИНФОРМАЦИОННО-АНАЛИТИЧЕСКИЙ ЦЕНТР	2
Carcade Leasing	2
Fundraise Up	2
Трубная Металлургическая Компания	2
Ситидрайв	2
НАО ИРМАСТ-ХОЛДИНГ	2
Первый канал	2
КБ Уральский банк реконструкции и развития (УБРиР)	2
Федеральная налоговая служба (ФНС России)	2
КНОПКАДЕНЬГИ	2
Группа компаний HAYAT	2
Данные – центр обработки и автоматизации	2
Mayak	2
Газэнергобанк	2
Автономная Некоммерческая организация Агентство Креативных Индустрий	2
РН-Транс	2
СимургФарм	2
Почта Банк	2
ЛАЙФСТРИМ	2
Национальная система платежных карт	2
Гоудрон	2

--Сбер предлагает 243 вакансии и является крупнейшим работодателем для аналитиков (ориентирован на технологические решения), также аналитики нужны на маркетплейсах 

-- Преобладающие типы занятости
SELECT employment, 
count(*) AS COUNT_employment
FROM public.parcing_table
GROUP BY employment 
ORDER BY COUNT_employment DESC;

--employment         |count_employment|
-------------------+----------------+
Полная занятость   |            1764|
Частичная занятость|              16|
Стажировка         |              16|
Проектная работа   |               5|
-Подавляющее большинство работадателей - 1764- нанимают на работу на полный рабочий день, что связано скорее вчего с необходимостью полного погружения в проекты.

-- Виды графиков работы

SELECT schedule, 
count(*) AS COUNT_schedule
FROM public.parcing_table
GROUP BY schedule 
ORDER BY COUNT_schedule DESC; 

--schedule        |count_schedule|
----------------+--------------+
Полный день     |          1441|
Удаленная работа|           310|
Гибкий график   |            41|
Сменный график  |             9|
--Большинство работодателей хотят видеть работников на полном рабочем дне, но есть значительное количество 310-которые готовы предоставить удаленную работу, что отвечает требованиям современного времени.

-- Разбивка по грейдам
SELECT experience, 
count(*) AS COUNT_vacancies
FROM public.parcing_table
GROUP BY experience 
ORDER BY COUNT_vacancies DESC;

experience           |count_vacancies|
---------------------+---------------+
Junior+ (1-3 years)  |           1091|
Middle (3-6 years)   |            555|
Junior (no experince)|            142|
Senior (6+ years)    |             13|

-- больше всего требуются сотрудники с опытом от года до 3, меньше всего самые опытные, последнее может быть связано с другими каналами поиска.

--Разбивка по аналитикам и системным аналитикам в процентах по грейдам
SELECT count(*)
FROM public.parcing_table
WHERE name LIKE '%налитик данных%' OR name LIKE '%истемный аналитик данных%'; --находим общее число вакансий


count|
-----+
 1326|-- это число для использования подсчетов в процентах

SELECT experience, 
count(*) AS COUNT_vacancies,
round(count(*)*100.0/1326,2) AS percent_vac
FROM public.parcing_table
WHERE name LIKE '%налитик данных%' 
OR name LIKE '%истемный аналитик данных%'
GROUP by experience 
ORDER BY percent_vac DESC;


experience           |count_vacancies|percent_vac|
---------------------+---------------+-----------+
Junior+ (1-3 years)  |            854|      64.40|
Middle (3-6 years)   |            345|      26.02|
Junior (no experince)|            121|       9.13|
Senior (6+ years)    |              6|       0.45|
-- Больше всего требуются сотрудники с опытом от года до 6 (1-3 – 64 процента, 3-6 26 процентов, меньше всего самые опытные, хотя и процент сотрудников без опыта не велик – 9%.

--Зарплаты и условия труда у основных работодателей (в примере – топ.20)

SELECT employer, 
count(*) AS COUNT_vac,
round (avg(salary_from),2) AS AVGfrom, 
round (avg(salary_to),2) AS AVGto,
employment,
schedule
FROM public.parcing_table
WHERE name LIKE '%налитик данных%' 
OR name LIKE '%истемный аналитик данных%'
GROUP BY employer, employment, schedule 
ORDER BY COUNT_vac DESC
LIMIT 20;

employer                                   |count_vac|avgfrom  |avgto    |employment      |schedule        |
-------------------------------------------+---------+---------+---------+----------------+----------------+
СБЕР                                       |      117|110583.33| 73333.33|Полная занятость|Полный день     |
Банк ВТБ (ПАО)                             |       27|         |         |Полная занятость|Полный день     |
Ozon                                       |       23|         |         |Полная занятость|Полный день     |
Т1                                         |       17|         |         |Полная занятость|Полный день     |
Центральный банк Российской Федерации      |       15|         |         |Полная занятость|Полный день     |
Правительство Москвы                       |       15|         |         |Полная занятость|Полный день     |
Яндекс                                     |       14|         |         |Полная занятость|Полный день     |
Райффайзен Банк                            |       13|         |         |Полная занятость|Полный день     |
WILDBERRIES                                |       12|         |         |Полная занятость|Полный день     |
ГКУ Центр занятости населения города Москвы|       12|101666.67|108000.00|Полная занятость|Полный день     |
Ростелеком                                 |       11|         |100000.00|Полная занятость|Удаленная работа|
Деловые Линии                              |       10|118200.00|136000.00|Полная занятость|Полный день     |
Марс                                       |       10|         |         |Полная занятость|Полный день     |
Московская Биржа                           |       10|         |         |Полная занятость|Полный день     |
МТС                                        |        9| 67500.00|         |Полная занятость|Полный день     |
INGURU.RU                                  |        9|200000.00|300000.00|Полная занятость|Удаленная работа|
Ozon                                       |        8|         |         |Полная занятость|Удаленная работа|
Московский Кредитный Банк                  |        8|         |         |Полная занятость|Полный день     |
DNS Головной офис                          |        8| 73750.00| 92000.00|Полная занятость|Полный день     |
Maxim technology                           |        8|         |         |Полная занятость|Полный день     |

--Основной работодатель – СБЕР, средняя зп ДО меньше (73 тыс), чем ОТ (110 тыс), скорее всего в связи с тем, что не заполненной поле ДО в некоторых вакансиях. Еще 2 лидера по количеству вакансий ВТБ и ОЗОН.
В основном это полная занятость и полный рабочий день.
Удаленную работу предлагает Ростелеком (11 вакансий), INGURU.RU и Ozon по 8 вакансий опять же на полной занятости.   

--Мягкие и жесткие навыки по грейдам аналитиков
SELECT experience, 
count(*) AS COUNT_vacancies,
key_skills_1,
count(key_skills_1) AS COUNT_key_skills_1,
FROM public.parcing_table
GROUP BY experience, key_skills_1 
ORDER BY COUNT_key_skills_1 DESC;
experience           |count_vacancies|key_skills_1                                                    |count_key_skills_1|
---------------------+---------------+----------------------------------------------------------------+------------------+
Junior+ (1-3 years)  |            229|                                                                |               229|
Junior+ (1-3 years)  |            196|Анализ данных                                                   |               196|
Middle (3-6 years)   |            117|                                                                |               117|
Junior+ (1-3 years)  |            100|SQL                                                             |               100|
Middle (3-6 years)   |             89|Анализ данных                                                   |                89|
Junior+ (1-3 years)  |             60|Pandas                                                          |                60|
Junior+ (1-3 years)  |             55|Аналитическое мышление                                          |                55|
Middle (3-6 years)   |             51|SQL                                                             |                51|
Junior+ (1-3 years)  |             49|Документация                                                    |                49|
Junior+ (1-3 years)  |             49|MS SQL                                                          |                49|
Junior+ (1-3 years)  |             44|Коммуникация                                                    |                44|
Junior+ (1-3 years)  |             37|confluence                                                      |                37|
Middle (3-6 years)   |             37|Документация                                                    |                37|
Junior (no experince)|             36|                                                                |                36|
Middle (3-6 years)   |             34|MS SQL                                                          |                34|
Middle (3-6 years)   |             31|Python                                                          |                31|
Junior (no experince)|             27|Анализ данных                                                   |                27|
Junior+ (1-3 years)  |             27|Python                                                          |                27|
Junior+ (1-3 years)  |             23|Английский язык                                                 |                23|
Middle (3-6 years)   |             22|Pandas                                                          |                22|
Junior+ (1-3 years)  |             21|Power BI                                                        |                21|
Junior+ (1-3 years)  |             18|MS PowerPoint                                                   |                18|
Middle (3-6 years)   |             17|Коммуникация                                                    |                17|
Junior+ (1-3 years)  |             15|Проактивность                                                   |                15|
Middle (3-6 years)   |             14|Аналитическое мышление                                          |                14|
Middle (3-6 years)   |             13|A/B тесты                                                       |                13|
Middle (3-6 years)   |             11|Machine Learning                                                |                11|
Junior (no experince)|             11|Аналитическое мышление                                          |                11|
Middle (3-6 years)   |             10|Numpy                                                           |                10|
Middle (3-6 years)   |             10|confluence                                                      |                10|
Junior (no experince)|              9|Python                                                          |                 9|
Middle (3-6 years)   |              9|Английский язык                                                 |                 9|
Middle (3-6 years)   |              8|Проактивность                                                   |                 8|
Junior (no experince)|              8|Коммуникация                                                    |                 8|
Junior+ (1-3 years)  |              8|Numpy                                                           |                 8|
Middle (3-6 years)   |              8|Power BI                                                        |                 8|
Junior+ (1-3 years)  |              7|Грамотная речь                                                  |                 7|
Junior+ (1-3 years)  |              6|A/B тесты                                                       |                 6|
Middle (3-6 years)   |              6|Способность к саморазвитию                                      |                 6|
Junior+ (1-3 years)  |              6|Linux                                                           |                 6|
Junior (no experince)|              5|Проактивность                                                   |                 5|
Junior+ (1-3 years)  |              5|Excel                                                           |                 5|
Junior (no experince)|              5|Английский язык                                                 |                 5|
Junior+ (1-3 years)  |              5|1С: Предприятие 8                                               |                 5|
Senior (6+ years)    |              5|SQL                                                             |                 5|
Junior (no experince)|              5|MS PowerPoint                                                   |                 5|
Junior+ (1-3 years)  |              5|Knime                                                           |                 5|
Junior (no experince)|              5|SQL                                                             |                 5|
Junior (no experince)|              4|Pandas                                                          |                 4|
Junior (no experince)|              4|MS SQL                                                          |                 4|
Junior (no experince)|              4|MS Excel                                                        |                 4|
Middle (3-6 years)   |              4|Переговоры                                                      |                 4|
Middle (3-6 years)   |              4|Kafka                                                           |                 4|
Junior+ (1-3 years)  |              4|FineBI                                                          |                 4|
Junior+ (1-3 years)  |              4|Юнит-экономика                                                  |                 4|
Junior+ (1-3 years)  |              3|Работа с большим объемом информации                             |                 3|
Senior (6+ years)    |              3|Проактивность                                                   |                 3|
Junior+ (1-3 years)  |              3|Визуализация данных                                             |                 3|
Middle (3-6 years)   |              3|MS PowerPoint                                                   |                 3|
Junior+ (1-3 years)  |              3|Портфельные риски                                               |                 3|
Junior+ (1-3 years)  |              3|Sas                                                             |                 3|
Junior (no experince)|              3|Документация                                                    |                 3|
Middle (3-6 years)   |              3|Teradata                                                        |                 3|
Junior+ (1-3 years)  |              3|Аналитика продаж                                                |                 3|
Junior+ (1-3 years)  |              3|Hadoop                                                          |                 3|
Junior+ (1-3 years)  |              3|Креативность                                                    |                 3|
Middle (3-6 years)   |              2|ETL                                                             |                 2|
Middle (3-6 years)   |              2|MongoDB                                                         |                 2|
Middle (3-6 years)   |              2|Решение проблем                                                 |                 2|
Junior+ (1-3 years)  |              2|Математическая статистика                                       |                 2|
Junior+ (1-3 years)  |              2|Аудит                                                           |                 2|
Middle (3-6 years)   |              2|FineBI                                                          |                 2|
Junior+ (1-3 years)  |              2|База данных: Oracle                                             |                 2|
Junior+ (1-3 years)  |              2|Machine Learning                                                |                 2|
Middle (3-6 years)   |              2|Расчет заработной платы                                         |                 2|
Junior+ (1-3 years)  |              2|DataLens                                                        |                 2|
Junior+ (1-3 years)  |              2|Логистика                                                       |                 2|
Middle (3-6 years)   |              2|Автоматизация процессов                                         |                 2|
Junior+ (1-3 years)  |              2|Teradata                                                        |                 2|
Junior+ (1-3 years)  |              2|Принятие решений                                                |                 2|
Middle (3-6 years)   |              2|MDM                                                             |                 2|
Middle (3-6 years)   |              2|Работа в команде                                                |                 2|
Middle (3-6 years)   |              2|Юнит-экономика                                                  |                 2|
Middle (3-6 years)   |              2|Apache SuperSet                                                 |                 2|
Junior+ (1-3 years)  |              2|SQL-запросы                                                     |                 2|
Junior+ (1-3 years)  |              2|Deep Learning                                                   |                 2|
Junior+ (1-3 years)  |              2|Работа в команде                                                |                 2|
Junior+ (1-3 years)  |              2|SQLite                                                          |                 2|
Junior+ (1-3 years)  |              2|AB-test                                                         |                 2|
Middle (3-6 years)   |              2|Airflow                                                         |                 2|
Junior+ (1-3 years)  |              2|R                                                               |                 2|
Middle (3-6 years)   |              2|Внутренний контроль                                             |                 2|
Junior+ (1-3 years)  |              2|сводные таблицы                                                 |                 2|
Junior+ (1-3 years)  |              2|Торговая площадка                                               |                 2|
Junior+ (1-3 years)  |              2|Kafka                                                           |                 2|
Junior+ (1-3 years)  |              2|База данных: Olap                                               |                 2|
Junior+ (1-3 years)  |              2|Автоматизация процессов                                         |                 2|
Junior+ (1-3 years)  |              2|Tableau                                                         |                 2|
Junior (no experince)|              2|Power BI                                                        |                 2|
Junior+ (1-3 years)  |              2|BI                                                              |                 2|
Junior (no experince)|              2|Деловая переписка                                               |                 2|
Middle (3-6 years)   |              2|DWH Lead                                                        |                 2|
Junior+ (1-3 years)  |              2|Сбор и анализ информации                                        |                 2|
Middle (3-6 years)   |              1|PySpark                                                         |                 1|
Junior+ (1-3 years)  |              1|Tensorflow                                                      |                 1|
Junior+ (1-3 years)  |              1|ORM                                                             |                 1|
Junior+ (1-3 years)  |              1|Apache Spark                                                    |                 1|
Junior+ (1-3 years)  |              1|Поиск информации в интернет                                     |                 1|
Junior+ (1-3 years)  |              1|A/B/n                                                           |                 1|
Junior+ (1-3 years)  |              1|MS Outlook                                                      |                 1|
Junior+ (1-3 years)  |              1|nltk                                                            |                 1|
Junior+ (1-3 years)  |              1|Аудиторские проверки                                            |                 1|
Junior+ (1-3 years)  |              1|Ответственность, внимательность                                 |                 1|
Middle (3-6 years)   |              1|Визуализация данных                                             |                 1|
Junior+ (1-3 years)  |              1|Деловая коммуникация                                            |                 1|
Junior+ (1-3 years)  |              1|Консультирование клиентов                                       |                 1|
Middle (3-6 years)   |              1|MS Project                                                      |                 1|
Junior+ (1-3 years)  |              1|Аналитика по клиентам                                           |                 1|
Junior+ (1-3 years)  |              1|1С: Торговля                                                    |                 1|
Junior+ (1-3 years)  |              1|Бизнес-анализ                                                   |                 1|
Middle (3-6 years)   |              1|Работа с базами данных                                          |                 1|
Middle (3-6 years)   |              1|Математическая статистика                                       |                 1|
Junior+ (1-3 years)  |              1|Внутренний контроль                                             |                 1|
Junior+ (1-3 years)  |              1|Atlassian Jira                                                  |                 1|
Middle (3-6 years)   |              1|pyspark                                                         |                 1|
Middle (3-6 years)   |              1|Корпоративные финансы                                           |                 1|
Middle (3-6 years)   |              1|Apache Spark                                                    |                 1|
Junior+ (1-3 years)  |              1|runtime CRM                                                     |                 1|
Junior+ (1-3 years)  |              1|Cистемы управления базами данных                                |                 1|
Junior+ (1-3 years)  |              1|Грамотность                                                     |                 1|
Junior+ (1-3 years)  |              1|Qlik Sense                                                      |                 1|
Junior+ (1-3 years)  |              1|1С:                                                             |                 1|
Junior+ (1-3 years)  |              1|Данных                                                          |                 1|
Junior (no experince)|              1|стажер                                                          |                 1|
Junior (no experince)|              1|Excel                                                           |                 1|
Junior+ (1-3 years)  |              1|Амплитуда                                                       |                 1|
Junior+ (1-3 years)  |              1|data science                                                    |                 1|
Middle (3-6 years)   |              1|Аналитика продаж                                                |                 1|
Middle (3-6 years)   |              1|Ключевые навыки BI, DataLens, SQL, Python, Excel                |                 1|
Middle (3-6 years)   |              1|Tableau                                                         |                 1|
Middle (3-6 years)   |              1|аналитика данных                                                |                 1|
Junior+ (1-3 years)  |              1|ERP-системы на базе 1С                                          |                 1|
Junior+ (1-3 years)  |              1|Business Intelligence Systems                                   |                 1|
Junior+ (1-3 years)  |              1|Miner                                                           |                 1|
Middle (3-6 years)   |              1|StreamLit                                                       |                 1|
Middle (3-6 years)   |              1|Archimate                                                       |                 1|
Junior+ (1-3 years)  |              1|Экономический анализ                                            |                 1|
Middle (3-6 years)   |              1|ArcGIS QGIS Git/Gitlab Python пространственные базы данных Agile|                 1|
Junior+ (1-3 years)  |              1|Инструменты BI                                                  |                 1|
Middle (3-6 years)   |              1|Пусконаладочные работы                                          |                 1|
Middle (3-6 years)   |              1|Ad Hoc Analysis                                                 |                 1|
Senior (6+ years)    |              1|                                                                |                 1|
Junior (no experince)|              1|сводные таблицы                                                 |                 1|
Middle (3-6 years)   |              1|Дашборд                                                         |                 1|
Middle (3-6 years)   |              1|WoE                                                             |                 1|
Junior+ (1-3 years)  |              1|Appsflyer                                                       |                 1|
Junior+ (1-3 years)  |              1|Продуктовая аналитика                                           |                 1|
Middle (3-6 years)   |              1|1С: Предприятие 8                                               |                 1|
Junior+ (1-3 years)  |              1|HR                                                              |                 1|
Middle (3-6 years)   |              1|PowerBL                                                         |                 1|
Junior (no experince)|              1|REST                                                            |                 1|
Junior (no experince)|              1|Грамотная речь                                                  |                 1|
Middle (3-6 years)   |              1|Системный анализ                                                |                 1|
Junior+ (1-3 years)  |              1|MS Excel (VBA, Power Query), Python                             |                 1|
Junior+ (1-3 years)  |              1|Аналитические способности                                       |                 1|
Junior+ (1-3 years)  |              1|ClickHouse                                                      |                 1|
Junior (no experince)|              1|DataLens                                                        |                 1|
Junior+ (1-3 years)  |              1|Debezium                                                        |                 1|
Middle (3-6 years)   |              1|Linux                                                           |                 1|
Junior+ (1-3 years)  |              1|power bi                                                        |                 1|
Middle (3-6 years)   |              1|XML                                                             |                 1|
Junior+ (1-3 years)  |              1|Финансовый контроль                                             |                 1|
Junior+ (1-3 years)  |              1|аналитик данных                                                 |                 1|
Senior (6+ years)    |              1|Системный анализ                                                |                 1|
Middle (3-6 years)   |              1|Computer Vision                                                 |                 1|
Junior+ (1-3 years)  |              1|Развитые коммуникативные навыки                                 |                 1|
Junior+ (1-3 years)  |              1|ООП                                                             |                 1|
Junior (no experince)|              1|Cистемы управления базами данных                                |                 1|
Senior (6+ years)    |              1|Power BI                                                        |                 1|
Junior+ (1-3 years)  |              1|Разработка                                                      |                 1|
Middle (3-6 years)   |              1|Deep Learning                                                   |                 1|
Junior (no experince)|              1|Знание MS Office                                                |                 1|
Junior+ (1-3 years)  |              1|ADODB                                                           |                 1|
Senior (6+ years)    |              1|Numpy                                                           |                 1|
Middle (3-6 years)   |              1|PowerBI                                                         |                 1|
Junior+ (1-3 years)  |              1|CJM                                                             |                 1|
Junior+ (1-3 years)  |              1|IBM Unica                                                       |                 1|
Senior (6+ years)    |              1|Английский язык                                                 |                 1|
Junior+ (1-3 years)  |              1|репутационный маркетинг                                         |                 1|
Junior+ (1-3 years)  |              1|Подготовка презентаций                                          |                 1|
Junior+ (1-3 years)  |              1|Работа с системами аналитики                                    |                 1|
Junior+ (1-3 years)  |              1|дашборд                                                         |                 1|
Junior (no experince)|              1|Работа с базами данных                                          |                 1|
Junior (no experince)|              1|Работа в условиях многозадачности                               |                 1|
Junior (no experince)|              1|Деловая коммуникация                                            |                 1|
Junior+ (1-3 years)  |              1|Работа с базами данных                                          |                 1|
Middle (3-6 years)   |              1|аналитик данных                                                 |                 1|
Junior+ (1-3 years)  |              1|Усидчивость                                                     |                 1|
Junior (no experince)|              1|Numpy                                                           |                 1|
Junior+ (1-3 years)  |              1|Закупки                                                         |                 1|
Junior+ (1-3 years)  |              1|Qlickview                                                       |                 1|                              



SELECT experience, 
count(*) AS COUNT_vacancies,
soft_skills_1,
count(soft_skills_1) AS COUNT_soft_skills_1
FROM public.parcing_table
GROUP BY experience, soft_skills_1 
ORDER BY COUNT_soft_skills_1 DESC;

experience           |count_vacancies|soft_skills_1         |count_soft_skills_1|
---------------------+---------------+----------------------+-------------------+
Junior+ (1-3 years)  |            123|Документация          |                123|
Junior+ (1-3 years)  |            105|Коммуникация          |                105|
Middle (3-6 years)   |             93|Документация          |                 93|
Junior+ (1-3 years)  |             89|Аналитическое мышление|                 89|
Middle (3-6 years)   |             56|Коммуникация          |                 56|
Junior+ (1-3 years)  |             20|Проактивность         |                 20|
Junior (no experince)|             17|Коммуникация          |                 17|
Junior (no experince)|             15|Документация          |                 15|
Middle (3-6 years)   |             11|Аналитическое мышление|                 11|
Middle (3-6 years)   |             10|Проактивность         |                 10|
Junior (no experince)|              9|Аналитическое мышление|                  9|
Junior+ (1-3 years)  |              7|Креативность          |                  7|
Junior+ (1-3 years)  |              4|Принятие решений      |                  4|
Junior (no experince)|              4|Проактивность         |                  4|
Middle (3-6 years)   |              4|Креативность          |                  4|
Junior+ (1-3 years)  |              4|Адаптивность          |                  4|
Junior+ (1-3 years)  |              3|Переговоры            |                  3|
Senior (6+ years)    |              3|Коммуникация          |                  3|
Senior (6+ years)    |              3|Проактивность         |                  3|
Senior (6+ years)    |              3|Документация          |                  3|
Junior+ (1-3 years)  |              2|Тайм-менеджмент       |                  2|
Middle (3-6 years)   |              1|Решение проблем       |                  1|
Junior+ (1-3 years)  |              1|Решение проблем       |                  1|
Junior+ (1-3 years)  |              1|Эмпатия               |                  1|
Junior+ (1-3 years)  |            732|                      |                  0|
Middle (3-6 years)   |            380|                      |                  0|
Senior (6+ years)    |              4|                      |                  0|
Junior (no experince)|             97|                      |                  0|    

--среди ключевых навыков можно выделить Анализ данных, SQL, Документация и еще более редко Pandas и Python, а среди мягких навыков лидеры для всех групп: Документация, Коммуникация, Аналитическое мышление и Проактивность. 

Если сделать выборку без грейдов  - результат выдаст тот же: три главных навыка Анализ данных, SQL, Документация.
SELECT key_skills_1,
count(key_skills_1) AS COUNT_key_skills_1,
FROM public.parcing_table
GROUP BY key_skills_1 
ORDER BY COUNT_key_skills_1 DESC;




