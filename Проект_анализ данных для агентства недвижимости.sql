/* Проект первого модуля: анализ данных для агентства недвижимости
 * Часть 2. Решаем ad hoc задачи
 * 
 * Автор:Котова Ольга Сергеевна
 * Дата:23/12/2024
*/

-- Определим аномальные значения (выбросы) по значению перцентилей:
WITH limits AS (
    SELECT  
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY total_area) AS total_area_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY rooms) AS rooms_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY balcony) AS balcony_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_h,
        PERCENTILE_DISC(0.01) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_l
    FROM real_estate.flats     
),
-- Найдём id объявлений, которые не содержат выбросы:
filtered_id AS(
    SELECT id
    FROM real_estate.flats  
    WHERE 
        total_area < (SELECT total_area_limit FROM limits)
        AND (rooms < (SELECT rooms_limit FROM limits) OR rooms IS NULL)
        AND (balcony < (SELECT balcony_limit FROM limits) OR balcony IS NULL)
        AND ((ceiling_height < (SELECT ceiling_height_limit_h FROM limits)
            AND ceiling_height > (SELECT ceiling_height_limit_l FROM limits)) OR ceiling_height IS NULL)
    )
-- Выведем объявления без выбросов:
SELECT *
FROM real_estate.flats
WHERE id IN (SELECT * FROM filtered_id);


-- Задача 1: Время активности объявлений
-- Результат запроса должен ответить на такие вопросы:
-- 1. Какие сегменты рынка недвижимости Санкт-Петербурга и городов Ленинградской области 
--    имеют наиболее короткие или длинные сроки активности объявлений?
-- 2. Какие характеристики недвижимости, включая площадь недвижимости, среднюю стоимость квадратного метра, 
--    количество комнат и балконов и другие параметры, влияют на время активности объявлений? 
--    Как эти зависимости варьируют между регионами?
-- 3. Есть ли различия между недвижимостью Санкт-Петербурга и Ленинградской области по полученным результатам?
WITH limits AS (
    SELECT  
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY total_area) AS total_area_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY rooms) AS rooms_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY balcony) AS balcony_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_h,
        PERCENTILE_DISC(0.01) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_l
    FROM real_estate.flats     
),
-- Найдём id объявлений, которые не содержат выбросы:
filtered_id AS(
    SELECT id
    FROM real_estate.flats  
    WHERE 
        total_area < (SELECT total_area_limit FROM limits)
        AND (rooms < (SELECT rooms_limit FROM limits) OR rooms IS NULL)
        AND (balcony < (SELECT balcony_limit FROM limits) OR balcony IS NULL)
        AND ((ceiling_height < (SELECT ceiling_height_limit_h FROM limits)
            AND ceiling_height > (SELECT ceiling_height_limit_l FROM limits)) OR ceiling_height IS NULL)
    ),
    --Построим итоговую таблицу, где будут все данные по всем таблицам: 
    --c нужными id без выбросов, 
    --только по городам, 
    --с учетом полных годов - 2015,2016,2017,2018
     --c регионом,
     --c категорией по длительности размещения объявления
    itog_flats AS (
    SELECT *,
    CASE WHEN c.city='Санкт-Петербург' THEN 'Санкт-Петербург'
    ELSE 'Ленобласть'
    END AS region,
    case --категории по времени размещения объявления
	    when a2.days_exposition>=1 and a2.days_exposition<=30 then '1_месяц'
when a2.days_exposition>30 and a2.days_exposition<=90 then '2_квартал'
when a2.days_exposition>90 and a2.days_exposition<=180 then '3_полгода'
when a2.days_exposition>180 then '4_более полугода'
else 'не закрыто'
end as period_to
FROM real_estate.flats f
LEFT JOIN real_estate.advertisement a2 USING (id)
LEFT JOIN real_estate.city c USING (city_id)
LEFT JOIN real_estate.type t USING (type_id)
WHERE id IN (SELECT * FROM filtered_id) AND t.TYPE='город' 
AND a2.first_day_exposition BETWEEN '2015-01-01' AND'2018-12-31'
)
SELECT region,
period_to,
count (id) as count_id,
COUNT(id)::FLOAT / SUM(COUNT(id)) OVER(PARTITION BY region) AS share_count_id_region,
avg (last_price/total_area) as avg_price_for_meter,
avg (total_area) as avg_total_area,
percentile_cont(0.5) within group (order by rooms) as mediana_rooms,
percentile_cont(0.5) within group (order by balcony) as mediana_balcony,
percentile_cont(0.5) within group (order by floors_total) as mediana_floors_total,
percentile_cont(0.5) within group (order by floor) as mediana_floor,
sum (is_apartment) as count_apartment,
avg (airports_nearest) AS airport,
avg (parks_around3000) AS park,
avg (ponds_around3000) as ponds
    FROM itog_flats
   group by region,
period_to
order by region,
period_to;

-- Задача 2: Сезонность объявлений
-- Результат запроса должен ответить на такие вопросы:
-- 1. В какие месяцы наблюдается наибольшая активность в публикации объявлений о продаже недвижимости? 
--    А в какие — по снятию? Это показывает динамику активности покупателей.
-- 2. Совпадают ли периоды активной публикации объявлений и периоды, 
--    когда происходит повышенная продажа недвижимости (по месяцам снятия объявлений)?
-- 3. Как сезонные колебания влияют на среднюю стоимость квадратного метра и среднюю площадь квартир? 
--    Что можно сказать о зависимости этих параметров от месяца?
WITH limits AS (
    SELECT  
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY total_area) AS total_area_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY rooms) AS rooms_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY balcony) AS balcony_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_h,
        PERCENTILE_DISC(0.01) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_l
    FROM real_estate.flats     
),
-- Найдём id объявлений, которые не содержат выбросы:
filtered_id AS(
    SELECT id
    FROM real_estate.flats  
    WHERE 
        total_area < (SELECT total_area_limit FROM limits)
        AND (rooms < (SELECT rooms_limit FROM limits) OR rooms IS NULL)
        AND (balcony < (SELECT balcony_limit FROM limits) OR balcony IS NULL)
        AND ((ceiling_height < (SELECT ceiling_height_limit_h FROM limits)
            AND ceiling_height > (SELECT ceiling_height_limit_l FROM limits)) OR ceiling_height IS NULL)
    ),
    --Построим итоговую таблицу, где будут все данные по всем таблицам: 
    --c нужными id без выбросов, 
    --только по городам, 
    --с учетом полных годов - 2015,2016,2017,2018
    itog_flats AS (
    SELECT *
FROM real_estate.flats f
LEFT JOIN real_estate.advertisement a2 USING (id)
LEFT JOIN real_estate.city c USING (city_id)
LEFT JOIN real_estate.type t USING (type_id)
WHERE id IN (SELECT * FROM filtered_id) AND t.TYPE='город' 
AND a2.first_day_exposition BETWEEN '2015-01-01' AND'2018-12-31'
),
     -- Найдем, в какие месяцы наблюдается наибольшая активность в публикации объявлений о продаже недвижимости
pub as (
SELECT EXTRACT (MONTH FROM first_day_exposition) AS month_exposition,
    count(id) as count_pub,
    count(id)::float/sum (count(id)) OVER () AS share_pub,
    ROW_NUMBER() OVER(ORDER BY count(id) DESC) as rank_pub,
    avg (last_price/total_area) as avg_price_for_meter_p,
    avg (total_area) as avg_total_area_p
    FROM itog_flats
   GROUP BY month_exposition 
 ),
  -- Найдем, в какие месяцы наблюдается наибольшая активность в СНЯТИИ объявлений 
  closed AS(
    select extract (month from (first_day_exposition+days_exposition*interval'1 day')) AS month_exposition,
    count(id) as count_closed,
    count(id)::float/sum (count(id)) OVER () AS share_closed,
    ROW_NUMBER() OVER(ORDER BY count(id) DESC) as rank_closed,
    avg (last_price/total_area) as avg_price_for_meter_c,
    avg (total_area) as avg_total_area_c
    FROM itog_flats
    WHERE days_exposition IS NOT NULL 
   GROUP BY month_exposition
   )
     select *
  from pub
  full join closed using (month_exposition);

-- Задача 3: Анализ рынка недвижимости Ленобласти
-- Результат запроса должен ответить на такие вопросы:
-- 1. В каких населённые пунктах Ленинградской области наиболее активно публикуют объявления о продаже недвижимости?
-- 2. В каких населённых пунктах Ленинградской области — самая высокая доля снятых с публикации объявлений? 
--    Это может указывать на высокую долю продажи недвижимости.
-- 3. Какова средняя стоимость одного квадратного метра и средняя площадь продаваемых квартир в различных населённых пунктах? 
--    Есть ли вариация значений по этим метрикам?
-- 4. Среди выделенных населённых пунктов какие пункты выделяются по продолжительности публикации объявлений? 
--    То есть где недвижимость продаётся быстрее, а где — медленнее.
WITH limits AS (
    SELECT  
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY total_area) AS total_area_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY rooms) AS rooms_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY balcony) AS balcony_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_h,
        PERCENTILE_DISC(0.01) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_l
    FROM real_estate.flats     
),
-- Найдём id объявлений, которые не содержат выбросы:
filtered_id AS(
    SELECT id
    FROM real_estate.flats  
    WHERE 
        total_area < (SELECT total_area_limit FROM limits)
        AND (rooms < (SELECT rooms_limit FROM limits) OR rooms IS NULL)
        AND (balcony < (SELECT balcony_limit FROM limits) OR balcony IS NULL)
        AND ((ceiling_height < (SELECT ceiling_height_limit_h FROM limits)
            AND ceiling_height > (SELECT ceiling_height_limit_l FROM limits)) OR ceiling_height IS NULL)
    ),
    --Построим итоговую таблицу, где будут все данные по всем таблицам: 
    --c нужными id без выбросов, 
    --только по населенным пунктам Ленобласти, 
        itog_flats AS (
    SELECT *
FROM real_estate.flats f
LEFT JOIN real_estate.advertisement a2 USING (id)
LEFT JOIN real_estate.city c USING (city_id)
LEFT JOIN real_estate.type t USING (type_id)
WHERE id IN (SELECT * FROM filtered_id) AND c.city!='Санкт-Петербург'
)
SELECT city, 
count(id) AS count_pub,
count (days_exposition)/count(id)::numeric AS share_closed,
avg (last_price/total_area) AS avg_price_for_meter,
avg (total_area) AS avg_total_area,
avg (days_exposition) avg_days_exposition
   FROM itog_flats
   GROUP BY city
   HAVING count(id)>100--топ 15 населенных пунктов по количеству объявлений
   ORDER BY count(id) DESC;

-- АНАЛИТИЧЕСКАЯ ЗАПИСКА ПРИЛАГАЕТСЯ В ОТДЕЛЬНОМ ФАЙЛЕ






