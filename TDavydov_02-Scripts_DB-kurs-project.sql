/* Факультет Geek University Data Engineering
 *  Давыдов Теймураз
 * 
 *  Базы данных
 *  Курсовой Проект
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *  База Данных ДатаЦентра
 * ( упрощенный вариант для ознакомления )
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

USE dc_journal;


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Задача 1
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Было инсталлировано оборудование - Блейд корзина BLSc7000 
 * с серийным номером 'CZ2874G42I'
 *  
 * Получить список слотов и модулей установленных в слоты (если есть)
 * для этого оборудования
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


-- 1.2) наглядный вывод :
SELECT e2.id BL_id, e2.serialnum BL_SN, SUBSTRING_INDEX(et2.fullname, ' ', 2) BL_Name, s.slot_name BL_SLOT, m.serialnum Mod_SN
	FROM slots s 
	JOIN modules m ON s.mod_id = m.id 
	JOIN equipments e2 ON s.eq_id = e2.id 
	JOIN eq_types et2 ON e2.type_id = et2.id
	WHERE e2.id = (SELECT e.id FROM equipments e JOIN eq_types et ON e.type_id = et.id WHERE serialnum = 'CZ2874G42I');


-- включая запрос поиска id для серийника корзины 
SELECT s.slot_name, m.serialnum Mod_SN 
	FROM slots s 
	JOIN modules m ON s.mod_id = m.id 
	JOIN equipments e2 ON s.eq_id = e2.id 
	WHERE e2.id = (SELECT e.id FROM equipments e JOIN eq_types et ON e.type_id = et.id WHERE serialnum = 'CZ2874G42I');


-- по быстрому  
SELECT s.slot_name, m.serialnum Mod_SN 
	FROM slots s 
	JOIN modules m ON s.mod_id = m.id 
	JOIN equipments e2 ON s.eq_id = e2.id 
	WHERE e2.id = '75';


-- 1.1а) более наглядно так 
SELECT e.id, e.serialnum, et.fullname FROM equipments e JOIN eq_types et ON e.type_id = et.id WHERE serialnum = 'CZ2874G42I';

-- 1.1) для простоты построения и скорости выполнения получим id корзины
SELECT id, serialnum FROM equipments WHERE serialnum='CZ2874G42I';



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Задача 2
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Для Блейд-корзины BLSc7000 id='75'
 * получить список коммутаций
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* ПРИМЕЧАНИЕ : 
 * 
 * не успел доработать алгоритм генерации данных (наполнение БД)
 * и корректно вычистить все коммутации,
 * чтобы соответствовали реальному оборудованию !!! 
 * 
 * В данных могут остаться запараллеливания (линки на один общий порт) 
 * и петли (коммутации на то же оборудование, в другие порты)
 * 
 * .. вычистил что заметил вручную
 * 
 * .. петли оставил как допустимый случай 
 * (бывает что применяется в реальном оборудовании, но конечно не так грубо)
 * */



-- 2.2) список коммутаций корзины до кросс-таблицы
SELECT e2.id BL_id, SUBSTRING_INDEX(et2.partnumber, ' ', 1) BL_Name,
		s.slot_name BL_SLOT, CONCAT(p2.port_name,p2.port_num) BL_PORT,
		p2.id FROM_PORT, IF(p2.id = pl.port1_id, pl.port2_id, pl.port1_id) TO_PORT
	FROM slots s 
	JOIN equipments e2 ON s.eq_id = e2.id 
	JOIN eq_types et2 ON e2.type_id = et2.id
	JOIN ports p2 ON p2.slot_id = s.id 
	JOIN port_links pl ON p2.id IN (pl.port1_id , pl.port2_id)
	WHERE e2.id = '75'
	ORDER BY FROM_PORT;





-- 2.1) список слотов и портов корзины 
SELECT e2.id BL_id, SUBSTRING_INDEX(et2.partnumber, ' ', 1) BL_Name,
		s.slot_name BL_SLOT, CONCAT(p2.port_name,p2.port_num) BL_PORT
	FROM slots s 
	JOIN equipments e2 ON s.eq_id = e2.id 
	JOIN eq_types et2 ON e2.type_id = et2.id
	JOIN ports p2 ON p2.slot_id = s.id 
	WHERE e2.id = '75';






/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Задача 3
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Вывести список проектов и серийных номеров оборудования
 *  занятого под эти проекты.
 * 
 * Сгруппировать вывод по проектам,
 *  вывести количество оборудования в проекте.
 *  (Отсортировать по количеству задействованного оборудования)
 * 
 * Вывести все комментарии по установленным модулям
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



-- 3.3) Комментарии по установленным модулям 

SELECT e2.id Equipment_id,
	CONCAT(SUBSTRING_INDEX(et2.partnumber, ' ', 1), ' (SN: ', e2.serialnum, ')') Eq_Data,
	CONCAT(s.slot_name, ' (Module SN: ', m.serialnum, ')') Eq_Modules
	, c2.comment_text 
	-- , m.id 
	FROM slots s 
	JOIN modules m ON s.mod_id = m.id 
	JOIN equipments e2 ON s.eq_id = e2.id 
	JOIN eq_types et2 ON e2.type_id = et2.id
	JOIN comment_links cl ON (cl.table_name = 'modules') AND (cl.tab_row_id = m.id)
	JOIN comments c2 ON c2.id = cl.comment_id;



-- 3.2) Группировка списка проектов по количеству использованного оборудования

SELECT CONCAT_WS(' ', 'id:(', pr.id , ')',pr.projnum, '/', pr.fullname) Proj_Name,
        COUNT(*) Equipment_COUNT
    FROM projects pr 
    JOIN proj_links pl ON pl.proj_id = pr.id 
    JOIN equipments eq ON pl.equipment_id = eq.id 
    GROUP BY Proj_Name
    ORDER BY Equipment_COUNT DESC;



-- 3.1) список проектов и серийных номеров оборудования

SELECT pr.id Proj_id, CONCAT(pr.projnum, ' / ', pr.fullname) Proj_Name,
		CONCAT(SUBSTRING_INDEX(et.partnumber, ' ', 2), ' (SN: ', eq.serialnum, ')') Equipment
	FROM projects pr 
	JOIN proj_links pl ON pl.proj_id = pr.id 
	JOIN equipments eq ON pl.equipment_id = eq.id 
	JOIN eq_types et ON et.id = eq.type_id
	ORDER BY Proj_id;




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Задача 4
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Создать представления для запросов из предыдущих задач.
 * 
 * Вывести наглядные для пользователей данные.
 * По возможности отсортировать вывод.
 * 
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


-- 4.1) Перечень слотов оборудования с установленными модулями :

-- если нужно будет удалить представление : 
-- DROP VIEW IF EXISTS equipment_slots;

CREATE OR REPLACE VIEW equipment_slots AS 
SELECT e2.id Equipment_id,
	CONCAT(SUBSTRING_INDEX(et2.partnumber, ' ', 1), ' (SN: ', e2.serialnum, ')') Eq_Data,
	CONCAT(s.slot_name, ' (Module SN: ', m.serialnum, ')') Eq_Modules
	FROM slots s 
	JOIN modules m ON s.mod_id = m.id 
	JOIN equipments e2 ON s.eq_id = e2.id 
	JOIN eq_types et2 ON e2.type_id = et2.id
	ORDER BY Equipment_id, Eq_Modules;



-- 4.2) Список доступных портов оборудования : 

-- если нужно будет удалить представление : 
-- DROP VIEW IF EXISTS equipment_ports;

CREATE OR REPLACE VIEW equipment_ports AS 
SELECT e2.id Equipment_id, 
		CONCAT(SUBSTRING_INDEX(et2.partnumber, ' ', 1), ' (SN: ', e2.serialnum, ')') Eq_Data,
		s.slot_name Eq_SLOT, CONCAT(p2.port_name,p2.port_num) Eq_PORT
	FROM slots s 
	JOIN equipments e2 ON s.eq_id = e2.id 
	JOIN eq_types et2 ON e2.type_id = et2.id
	JOIN ports p2 ON p2.slot_id = s.id 
	ORDER BY Equipment_id, Eq_SLOT, Eq_PORT;


-- 4.3) Список проектов и использованного в них оборудования :

-- если нужно будет удалить представление : 
-- DROP VIEW IF EXISTS project_equipments;

CREATE OR REPLACE VIEW project_equipments AS 
SELECT pr.id Proj_id, CONCAT(pr.projnum, ' / ', pr.fullname) Proj_Name,
		CONCAT(SUBSTRING_INDEX(et.partnumber, ' ', 2), ' (SN: ', eq.serialnum, ')') Equipment
	FROM projects pr 
	JOIN proj_links pl ON pl.proj_id = pr.id 
	JOIN equipments eq ON pl.equipment_id = eq.id 
	JOIN eq_types et ON et.id = eq.type_id
	ORDER BY Proj_id;







/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


