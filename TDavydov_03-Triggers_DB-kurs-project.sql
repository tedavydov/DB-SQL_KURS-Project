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
 *  Задача 5
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Создать функцию выводящую комментарии  
 * по заданому названию таблицы и номеру строки 
 *  
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- 5.1) реализация с использованием курсора :

DELIMITER //
DROP FUNCTION IF EXISTS comment_from//
CREATE FUNCTION comment_from(tab_name VARCHAR(25), row_num BIGINT UNSIGNED)
RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE comment_result, comment_cur TEXT;
	DECLARE if_end TINYINT DEFAULT 0;
	DECLARE c_comment CURSOR FOR SELECT c.comment_text
					FROM comment_links cl
					JOIN comments c  ON c.id = cl.comment_id
					WHERE (cl.table_name = tab_name) AND (cl.tab_row_id = row_num);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET if_end = 1;
	OPEN c_comment;
	SET comment_result = CONCAT(tab_name, ' (', row_num, ') Comment:');
	cycle : LOOP
		FETCH c_comment INTO comment_cur;
	IF if_end THEN LEAVE cycle;
		END IF;
		SET comment_result = CONCAT_WS(' ', comment_result, comment_cur);
	END LOOP cycle;
	CLOSE c_comment;
RETURN comment_result;
END//
DELIMITER ;

-- проверим работу функции
SELECT comment_from('modules', '15');

-- для проверки :
SELECT c.comment_text
	FROM comment_links cl
	JOIN comments c  ON c.id = cl.comment_id
	WHERE (cl.table_name = 'modules') AND (cl.tab_row_id = '15');



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Задача 6
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Реализовать процедуры создания нового проекта 
 * по передаваемым в них идентификатору владельца
 * и названию, номеру проекта по документации.
 * 
 * Реализовать процедуру для добавления оборудования 
 * в проект по идентификаторам проекта и оборудования
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


-- 6.1)  процедура создания нового проекта 
/* ПРИМЕЧАНИЕ : 
 * При передаче несуществующего user_id = 0
 * или идентификатора из запретного диапазона
 * (администраторы, или пользователи другого подразделения)
 * - будет выдана пользовательская ошибка
 * */
DELIMITER //
DROP PROCEDURE IF EXISTS project_init//
CREATE PROCEDURE project_init(IN x_user BIGINT UNSIGNED, IN prj_name VARCHAR(255), IN prj_num VARCHAR(100))
BEGIN
	DECLARE comment_error VARCHAR(100);
	SET comment_error = CONCAT('PROJECT INIT canseled : ERROR user_id = ', x_user, ' !!!');
	 IF	(x_user = 0) OR (x_user < 11) OR (x_user > 55) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = comment_error;
	 ELSE
	 	INSERT INTO projects (`user_id`, `projnum`, `fullname`) VALUES (x_user, prj_name, prj_num);
	 END IF;
END//
DELIMITER ;

-- проверка работы процедуры 

-- проверим существующие проекты  
SELECT pr.id Proj_id, CONCAT_WS(' ', pr.projnum, '/', pr.fullname) Proj_Name 
    FROM projects pr 
    ORDER BY Proj_id DESC;

-- должно выдавать ошибку

-- ERROR user_id = 0 !!! не может быть такого id в БД
CALL project_init(0,'RFCxxxx0','Test Project 0');

-- ERROR user_id = 1 !!! запретный диапазон - администраторы
CALL project_init(1,'RFCxxxx1','Test Project 1');

-- ERROR user_id = 56 !!! пользователи другого подразделения 
CALL project_init(56,'RFCxxxx56','Test Project 56');

-- должно работать правильно
CALL project_init(11,'RFCxxxx11','Test Project 11');

-- проверим что добавлен новый проект с id = 39  
SELECT pr.id Proj_id, CONCAT_WS(' ', pr.projnum, '/', pr.fullname) Proj_Name 
    FROM projects pr 
    ORDER BY Proj_id DESC;


-- 6.2) процедура для добавления оборудования в проект
/* ПРИМЕЧАНИЕ : 
 * При передаче user_id не совпадающего с идентификатором владельца проекта
 * или идентификатора из запретного диапазона
 * (администраторы, или пользователи другого подразделения)
 * - будет выдана пользовательская ошибка
 * */

DELIMITER //
DROP PROCEDURE IF EXISTS project_add_equipment//
CREATE PROCEDURE project_add_equipment(IN x_user BIGINT UNSIGNED, IN prj_num VARCHAR(100), IN eq_id_or_serial VARCHAR(100))
BEGIN
	DECLARE comment_error VARCHAR(100);
	DECLARE us_owner BIGINT UNSIGNED DEFAULT 0;
	DECLARE prj_id, prj_temp BIGINT UNSIGNED DEFAULT 0;
	DECLARE eq_id, eq_temp BIGINT UNSIGNED DEFAULT 0;
	SET prj_temp = (SELECT p.id FROM projects p WHERE p.projnum = prj_num);
	IF prj_temp is NULL THEN
		SET prj_id = (SELECT p.id FROM projects p WHERE p.id = prj_num);
	ELSE
		SET prj_id = prj_temp;
	END IF;
	IF prj_id is NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PROJECT ADD equipment canseled : ERROR ! project_id NOT FOUND !!!';
	ELSE
		SET us_owner = (SELECT p.user_id FROM projects p WHERE p.id = prj_id);
	END IF;
	SET eq_temp = (SELECT eq.id FROM equipments eq WHERE eq.serialnum = eq_id_or_serial);
	IF eq_temp is NULL THEN
		SET eq_id = (SELECT eq.id FROM equipments eq WHERE eq.id = eq_id_or_serial);
	ELSE
		SET eq_id = eq_temp;
	END IF;
	SET comment_error = CONCAT('PROJECT ADD equipment canseled : ERROR user_id = ', x_user, ' !!!');
	IF	(x_user = 0) OR (x_user < 11) OR (x_user > 55) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = comment_error;
	ELSE
		IF (x_user = us_owner) THEN
			IF (eq_id is NULL) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PROJECT ADD equipment canseled : ERROR ! equipment_id NOT FOUND !!!';
			ELSE
				INSERT INTO proj_links (`proj_id`, `equipment_id`) VALUES (prj_id, eq_id); 	
			END IF;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PROJECT ADD equipment canseled : ERROR ! user not is project owner !!!';
		END IF;
	END IF;
END//
DELIMITER ;



-- проверка работы процедуры : 

-- должно выдавать ошибку
CALL project_add_equipment(0,'RFCxxxx11','23');
CALL project_add_equipment(23,'RFCxxxx11','23');
CALL project_add_equipment(233,'RFCxxxx11','23');

-- должно работать правильно
CALL project_add_equipment(11,'RFCxxxx11','25');
CALL project_add_equipment(24,'35','26');
CALL project_add_equipment(14,'27','ALM3986W95C');


-- для проверки можно воспользоваться немного доработанным запросом из предыдущей задачи
-- 3.1) список проектов и серийных номеров оборудования

SELECT pr.id Proj_id, CONCAT(pr.projnum, ' / ', pr.fullname) Proj_Name,
		CONCAT(SUBSTRING_INDEX(et.partnumber, ' ', 2), ' (SN: ', eq.serialnum, ' / id: ', eq.id, ')') Equipment
	FROM projects pr 
	JOIN proj_links pl ON pl.proj_id = pr.id 
	JOIN equipments eq ON pl.equipment_id = eq.id 
	JOIN eq_types et ON et.id = eq.type_id
	ORDER BY Proj_id DESC;




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Задача 7
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Добавить триггеры для контроля целостности БД
 * при удалении, добавлении полей в таблицах, 
 * с которыми связаны комментарии.
 * 
 * ПРИМЕЧАНИЕ : 
 * Удалять только связи с записями
 * сами комментарии можно чистить отдельной процедурой,
 * если они не ссылаются ни на какие записи.
 * 
 * Для примера достаточно создать триггеры на 2 таблицы
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


/* 7.1)   Создадим два триггера на удаление
*      из двух таблиц eq_types и equipments (код идентичен),
*      и один триггер на обновление таблицы equipments для примера
*/

-- для контроля работы триггеров, создадим временную таблицу
DROP TABLE  IF EXISTS temp_comment_links;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_comment_links(
    action_name VARCHAR(50),
	table_name VARCHAR(50),
    tab_row_id BIGINT UNSIGNED,
    comment_id BIGINT UNSIGNED
) COMMENT = 'временная таблица связей комментариев с записями';


-- создадим триггеры : 
DELIMITER //

DROP TRIGGER IF EXISTS tg_eq_types_comments_delete// 
CREATE TRIGGER tg_eq_types_comments_delete BEFORE DELETE ON dc_journal.eq_types
FOR EACH ROW 
BEGIN 
	DECLARE t_name, act_name VARCHAR(50);
	DECLARE if_end TINYINT DEFAULT 0;
	DECLARE old_tab_row_id, old_comment_id BIGINT UNSIGNED;
	DECLARE del_comment_links CURSOR FOR SELECT cl.tab_row_id, cl.comment_id 
			FROM comment_links cl
			WHERE (cl.table_name = t_name) AND (cl.tab_row_id = OLD.id);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET if_end = 1;
	SET t_name = 'eq_types';
	SET act_name = 'delete';
	OPEN del_comment_links;
	cycle : LOOP
		FETCH del_comment_links INTO old_tab_row_id, old_comment_id;
	IF if_end THEN LEAVE cycle;
		END IF;
		INSERT INTO temp_comment_links (`action_name`,`table_name`,`tab_row_id`, `comment_id`) VALUES
		 (act_name, t_name, old_tab_row_id, old_comment_id);
		DELETE FROM comment_links
			WHERE (comment_links.table_name = t_name)
			AND (comment_links.tab_row_id = old_tab_row_id);
	END LOOP cycle;
	CLOSE del_comment_links;
END//

DROP TRIGGER IF EXISTS tg_equipments_comments_update// 
CREATE TRIGGER tg_equipments_comments_update BEFORE UPDATE ON dc_journal.equipments 
FOR EACH ROW 
BEGIN 
	DECLARE t_name, act_name VARCHAR(50);
	DECLARE if_end TINYINT DEFAULT 0;
	DECLARE old_tab_row_id, new_tab_row_id, old_comment_id BIGINT UNSIGNED;
	DECLARE upd_comment_links CURSOR FOR SELECT cl.tab_row_id, cl.comment_id 
			FROM comment_links cl
			WHERE (cl.table_name = t_name) AND (cl.tab_row_id = OLD.id);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET if_end = 1;
	SET new_tab_row_id = NEW.id;
	SET t_name = 'equipments';
	SET act_name = 'update';
	OPEN upd_comment_links;
	cycle : LOOP
		FETCH upd_comment_links INTO old_tab_row_id, old_comment_id;
	IF if_end THEN LEAVE cycle;
		END IF;
		INSERT INTO temp_comment_links (`action_name`,`table_name`,`tab_row_id`, `comment_id`) VALUES
		 (CONCAT_WS(' ', act_name, 'OLD:', old_tab_row_id, 'NEW:', new_tab_row_id), t_name, old_tab_row_id, old_comment_id);
		UPDATE comment_links
			SET comment_links.tab_row_id = new_tab_row_id 
			WHERE (comment_links.table_name = t_name) 
			AND (comment_links.tab_row_id = old_tab_row_id);
	END LOOP cycle;
	CLOSE upd_comment_links;
END//

DROP TRIGGER IF EXISTS tg_equipments_comments_delete// 
CREATE TRIGGER tg_equipments_comments_delete BEFORE DELETE ON dc_journal.equipments 
FOR EACH ROW 
BEGIN 
	DECLARE t_name, act_name VARCHAR(50);
	DECLARE if_end TINYINT DEFAULT 0;
	DECLARE old_tab_row_id, old_comment_id BIGINT UNSIGNED;
	DECLARE del_comment_links CURSOR FOR SELECT cl.tab_row_id, cl.comment_id 
			FROM comment_links cl
			WHERE (cl.table_name = t_name) AND (cl.tab_row_id = OLD.id);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET if_end = 1;
	SET t_name = 'equipments';
	SET act_name = 'delete';
	OPEN del_comment_links;
	cycle : LOOP
		FETCH del_comment_links INTO old_tab_row_id, old_comment_id;
	IF if_end THEN LEAVE cycle;
		END IF;
		INSERT INTO temp_comment_links (`action_name`,`table_name`,`tab_row_id`, `comment_id`) VALUES
		 (act_name, t_name, old_tab_row_id, old_comment_id);
		DELETE FROM comment_links
			WHERE (comment_links.table_name = t_name)
			AND (comment_links.tab_row_id = old_tab_row_id);
	END LOOP cycle;
	CLOSE del_comment_links;
END//

DELIMITER ;



-- проверим работу триггеров

-- 1) триггер для eq_types 
-- проверим таблицу связей
SELECT * FROM comment_links  WHERE tab_row_id = 24 ORDER BY table_name, tab_row_id, comment_id;

-- проверим таблицу типов оборудования
SELECT * FROM eq_types et WHERE et.id = 24;

-- удалим запись
DELETE FROM eq_types WHERE id = 24;

-- проверим временную таблицу 
SELECT * FROM temp_comment_links;

-- проверим таблицу связей
SELECT * FROM comment_links  WHERE tab_row_id = 24 ORDER BY table_name, tab_row_id, comment_id;




-- 2a) триггеры для equipments 
-- проверим таблицу связей
SELECT * FROM comment_links  WHERE tab_row_id = 10 ORDER BY table_name, tab_row_id, comment_id;

-- проверим таблицу типов оборудования
SELECT * FROM equipments e WHERE e.id = 10;

-- удалим запись
DELETE FROM equipments WHERE id = 10;

-- проверим временную таблицу 
SELECT * FROM temp_comment_links;

-- проверим таблицу типов оборудования
SELECT * FROM equipments e WHERE e.id = 56;


-- 2b) триггеры для equipments 

-- проверим таблицу связей (комментарии 15 и 27 связаны с оборудованием id = 56)
SELECT * FROM comment_links  WHERE tab_row_id = 10 ORDER BY table_name, tab_row_id, comment_id;

-- изменим id записи (на место освободившейся)
UPDATE equipments SET id = 10 WHERE id = 56;

-- проверим таблицу типов оборудования
SELECT * FROM equipments e WHERE e.id = 56;

-- проверим временную таблицу 
SELECT * FROM temp_comment_links;

-- проверим таблицу связей (теперь в ней комментарии 15 и 27 связаны с оборудованием id = 10)
SELECT * FROM comment_links  WHERE tab_row_id = 10 ORDER BY table_name, tab_row_id, comment_id;








/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Задача 8
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Создать транзакцию по переносу ошибочно добавленного оборудования
 * из таблицы equipments в таблицу modules 
 * 
 * Предусмотреть обратную процедуру.
 * 
 * Учитывать что при переносе :
 * из таблицы equipments в таблицу modules - теряется hostname
 * из таблицы modules в таблицу equipments - нужно добавить hostname
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- 8.1) Оформим транзакции в виде процедур :

DELIMITER //

DROP PROCEDURE IF EXISTS equipment_to_modules//
CREATE PROCEDURE equipment_to_modules(IN eq_id_or_sn VARCHAR(100)) 
BEGIN 
	DECLARE eq_serial VARCHAR(100);
	DECLARE eq_temp, eq_id, eq_type BIGINT UNSIGNED;
	START TRANSACTION;
		-- временная переменная 
		SET eq_temp = (SELECT equipments.id FROM equipments WHERE equipments.id = eq_id_or_sn);
		-- найдем id нужной записи по оборудованию 
		IF eq_temp is NULL THEN
			SET eq_id = (SELECT equipments.id FROM equipments WHERE equipments.serialnum = eq_id_or_sn);
		ELSE
			SET eq_id = eq_temp;
		END IF;
		-- проверим что запись найдена, если нет, то откатим транзакцию 
		IF eq_id is NULL THEN
			ROLLBACK;
		ELSE
			-- поля для переноса в другую таблицу 
			SET eq_serial = (SELECT serialnum FROM equipments WHERE equipments.id = eq_id);
			SET eq_type = (SELECT type_id FROM equipments WHERE equipments.id = eq_id);
		END IF;
		-- основная часть транзакции  
		INSERT INTO modules (`serialnum`,`type_id`) VALUES
							(eq_serial, eq_type);
		DELETE FROM equipments WHERE equipments.id = eq_id;
	COMMIT;
END//

DROP PROCEDURE IF EXISTS module_to_equipments//
CREATE PROCEDURE module_to_equipments(IN eq_id_or_sn VARCHAR(100), IN eq_host VARCHAR(255)) 
BEGIN 
	DECLARE eq_serial VARCHAR(100);
	DECLARE eq_temp, eq_id, eq_type BIGINT UNSIGNED;
	START TRANSACTION;
		-- временная переменная 
		SET eq_temp = (SELECT modules.id FROM modules WHERE modules.id = eq_id_or_sn);
		-- найдем id нужной записи по оборудованию 
		IF eq_temp is NULL THEN
			SET eq_id = (SELECT modules.id FROM modules WHERE modules.serialnum = eq_id_or_sn);
		ELSE
			SET eq_id = eq_temp;
		END IF;
		-- проверим что запись найдена, если нет, то откатим транзакцию 
		IF eq_id is NULL THEN
			ROLLBACK;
		ELSE
			-- поля для переноса в другую таблицу 
			SET eq_serial = (SELECT serialnum FROM modules WHERE modules.id = eq_id);
			SET eq_type = (SELECT type_id FROM modules WHERE modules.id = eq_id);
		END IF;
		-- основная часть транзакции  
		INSERT INTO equipments (`serialnum`, `hostname`, `type_id`) VALUES
							(eq_serial, eq_host, eq_type);
		DELETE FROM modules WHERE modules.id = eq_id;
	COMMIT;
END//

DELIMITER ;


-- проверка работы процедур : 

-- проверим наличие оборудования в таблице equipments
SELECT eq.id, eq.serialnum, eq.hostname FROM equipments eq WHERE eq.serialnum = 'ALM3463K04E';

-- перенесем запись в таблицу modules
CALL equipment_to_modules('ALM3463K04E');

-- проверим отсутствие оборудования в таблице equipments
SELECT eq.id, eq.serialnum FROM equipments eq WHERE eq.serialnum = 'ALM3463K04E';

-- проверим наличие оборудования в таблице modules
SELECT m.id, m.serialnum FROM modules m WHERE m.serialnum = 'ALM3463K04E';

-- перенесем запись обратно в таблицу equipments
CALL module_to_equipments('ALM3463K04E', 'hostuID123390708a8CEu2Lod9');

-- проверим наличие оборудования в таблице equipments
SELECT eq.id, eq.serialnum, eq.hostname FROM equipments eq WHERE eq.serialnum = 'ALM3463K04E';




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * Презентация Базы Данных для ДатаЦентра завершена
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


