/* Факультет Geek University Data Engineering
 *  Давыдов Теймураз
 * 
 *  Базы данных
 *  Курсовой Проект
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *  База Данных ДатаЦентра
 * ( упрощенный вариант для ознакомления )
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

DROP DATABASE IF EXISTS dc_journal;
CREATE DATABASE dc_journal;
USE dc_journal;

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Общее текстовое описание БД и решаемых ею задач
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * База Данных содержит сведения 
 * об оборудовании установленном в ДатаЦентре
 * и его общих параметрах.
 * Сведения о проектах под которые задействовано оборудование.
 * А также сведения о коммутации оборудования. 
 * 
 * Задачи решаемые БД :
 * - учет оборудования и его модулей в рамках ДатаЦентра ;
 * - учет оборудования в рамках проектов ;
 * - учет связей (коммутаций) оборудования в рамках ДатаЦентра ;
 * 
 * ПРИМЕЧАНИЯ : 
 * 
 * Не учтены права доступа пользователей и ролевая модель
 * реальной БД - для упрощения структуры данной БД.
 * 
 * В производственной базе авторизуется практически любая запись
 * в каждой таблице (в разных базах разные способы, в основном :
 * - либо запись отдельным полем со штампом авторизации в самой таблице
 * - либо ведется отдельная таблица с логами действий в БД ).
 * Здесь эта часть опущена для упрощения БД.
 * 
 * Ниже приведены описания каждой таблицы, 
 * сгруппированные по тематике таблиц.
 * 
 * Все данные условны и не имеют привязки к реальному оборудованию !
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- таблица пользователей нужна почти в любой базе данных
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия',
    email VARCHAR(100) UNIQUE,
    password_hash varchar(100),
    phone BIGINT,
    is_banned bit default 0,
    INDEX users_firstname_lastname_idx(firstname, lastname)
);


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * Таблицы основных данных об оборудовании и проектах :
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 
 * Eq_Types - каталог типов и параметров используемого оборудования
 * 
 * Equipments - основная таблица - перечень оборудования.
 * 
 * Modules - список установленных модулей оборудования 
 *        ( модули для расширения функционала, коммутации и т.п.)
 * 		В реальности модули учтены в общей таблице оборудования,
 * 		 но помечены как устройства не занимающие
 * 		 дополнительного места в стойке. Кроме того должны быть 
 * 		 таблицы описывающие функционал модулей. Но здесь для простоты
 * 		 эти таблицы не приводятся, поэтому для реализации сложных запросов
 * 		 модули выделены в отдельную таблицу. Их функционал не учитывается.
 * 
 * Projects - каталог проектов под которые используется оборудование
 * 
 * Proj_Links - таблица связей проектов с перечнем оборудования : 
 *          Некоторые виды оборудования могут использоваться
 *          во многих проектах (напр.: корзины с Блейд-серверами)
 *          Также практически любой проект использует 
 *          несколько единиц оборудования разных типов.
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


DROP TABLE IF EXISTS eq_types;
CREATE TABLE eq_types (
  id SERIAL PRIMARY KEY,
  partnumber VARCHAR(100) COMMENT 'номер партии оборудования',
  fullname VARCHAR(255) COMMENT 'краткое описание марки оборудования',
  -- Монтажная единица - высота заполнения стандартной 19-дюймовой стойки (U = юнит)
  -- 1 юнит = 44,45 мм (или 1,75 дюйма) для стойки и 43,7 для оборудования (зазор для гарантированного размещения)
  -- ПРИМЕЧАНИЕ : для модулей высота = 0 (они чаще всего не занимают доп.места в стойке, но бывают исключения)
  units TINYINT UNSIGNED DEFAULT NULL COMMENT 'высота заполнения стойки (юнит)',
  -- immanent - базовая характеристика - напр. емкость, число слотов, портов и т.п.
  -- используется в ПО при установке модулей в слоты, коммутации в порты и т.д. 
  immanent INT UNSIGNED DEFAULT NULL COMMENT 'базовая характеристика',
  `power` INT UNSIGNED COMMENT 'мощность потребляемая оборудованием (Вт)',
  weight INT UNSIGNED COMMENT 'вес оборудованием (кг)',
  UNIQUE unique_partnum(partnumber(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = 'каталог разновидностей оборудования';


DROP TABLE IF EXISTS equipments;
CREATE TABLE equipments (
  id SERIAL PRIMARY KEY,
  serialnum VARCHAR(100) COMMENT 'серийный номер оборудования',
  hostname VARCHAR(255) COMMENT 'сетевое имя оборудования',
  type_id BIGINT UNSIGNED COMMENT 'позиция в каталоге типов оборудования',
  UNIQUE unique_serial(serialnum(20)), -- защита от повтора серийных номеров
  FOREIGN KEY (type_id) REFERENCES eq_types(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'Перечень оборудования';


DROP TABLE IF EXISTS modules;
CREATE TABLE modules (
  id SERIAL PRIMARY KEY,
  serialnum VARCHAR(100) DEFAULT NULL COMMENT 'серийный номер модуля если есть',
  type_id BIGINT UNSIGNED COMMENT 'позиция в каталоге типов оборудования',
  -- убрал, тут лишняя информация (модуль включен в слот привязанный к оборудованию)
  -- eq_id BIGINT UNSIGNED DEFAULT NULL COMMENT 'оборудование, в которое установлен модуль',
  FOREIGN KEY (type_id) REFERENCES eq_types(id) ON UPDATE CASCADE ON DELETE CASCADE 
  -- FOREIGN KEY (eq_id) REFERENCES equipments(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'перечень модулей установленных в оборудовании';


DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL COMMENT 'владелец проекта',
  projnum VARCHAR(100) COMMENT 'номер проекта по документации',
  fullname VARCHAR(255) COMMENT 'тема и краткое описание проекта',
  UNIQUE unique_projnum(projnum(10)),
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = 'список проектов';


DROP TABLE IF EXISTS proj_links;
CREATE TABLE proj_links(
    proj_id BIGINT UNSIGNED NOT NULL,
    equipment_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (proj_id, equipment_id),
    FOREIGN KEY (proj_id) REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (equipment_id) REFERENCES equipments(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'таблица связей проектов с оборудованием';



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * Таблицы данных о коммутации оборудования :
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 
 * Slots - перечень используемых слотов в оборудовании.
 *      В каждый слот должен быть установлен модуль конкретного типа !
 *      В производственной базе имя слота берется из типовой конфигурации, 
 *      а также проверяется соответствие модулей
 *      заданному типу оборудования (не все модули универсальны).
 *      В данной БД эта часть опущена для упрощения.
 * 		Также,
 * 		здесь не учитываестя различие модулей по видам коммутации
 * 		Ethernet, FiberChannel и т.п.
 * 		Кроме того здесь (как и в реальной базе) могут присутствовать
 *		пустые слоты - если в них не установлены модули .. 
 * 
 * Ports - перечень портов оборудования.
 *      Уникальной является комбинация слота и номера порта.
 *      Учитывая что слот привязан к конкретному оборудованию,
 *      и число слотов в каждом типе оборудования заранее определено.
 * 		Для упрощения также не введены различия портов по видам коммутации
 * 		Ethernet, FiberChannel и т.п.
 * 		Условно применяется один тип портов для всех коммутаций !
 * 
 * Port_Links - таблица коммутаций оборудования.
 *      Действующие связи портов оборудования.
 *      Дополнительные проверки на закольцовывание портов оборудования, и т.п.
 *      - в данной БД опущены для упрощения.
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

DROP TABLE IF EXISTS slots;
CREATE TABLE slots (
  id SERIAL PRIMARY KEY, -- для дальнейшей привязки портов
  slot_name VARCHAR(50) COMMENT 'типовое имя слота оборудования',
  eq_id BIGINT UNSIGNED NOT NULL COMMENT 'оборудование, к которому привязан слот',
  mod_id BIGINT UNSIGNED DEFAULT NULL COMMENT 'модуль, установленный в данный слот оборудования',
  UNIQUE (mod_id), -- защита от дублирования
  FOREIGN KEY (eq_id) REFERENCES equipments(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (mod_id) REFERENCES modules(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'перечень используемых слотов в оборудовании';


DROP TABLE IF EXISTS ports;
CREATE TABLE ports (
  id SERIAL PRIMARY KEY, -- для дальнейшей привязки коммутации
  port_name VARCHAR(50) COMMENT 'типовое имя порта оборудования',
  slot_id BIGINT UNSIGNED NOT NULL COMMENT 'слот оборудования, к которому привязан порт',
  port_num INT UNSIGNED NOT NULL COMMENT 'номер порта в в данном слоту',
  UNIQUE (slot_id, port_num), -- защита от дублирования
  FOREIGN KEY (slot_id) REFERENCES slots(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'перечень портов оборудования';


DROP TABLE IF EXISTS port_links;
CREATE TABLE port_links(
    port1_id BIGINT UNSIGNED NOT NULL,
    port2_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (port1_id, port2_id),
    FOREIGN KEY (port1_id) REFERENCES ports(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (port2_id) REFERENCES ports(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'таблица коммутаций';
-- не забыть уточнить, как исключить дублирование вида А-Б/Б-А средствами БД
-- уточнил : 
-- в реальной БД (до этого) решал на стороне приложения,
-- здесь - буду решать при помощи триггера

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * Дополнительные информационные таблицы
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 
 * Comments - таблица комментариев,
 *      выделена отдельно чтобы исключить дублирование информации 
 *      в разных таблицах.
 * 
 * Comment_Links - таблица привязок комментариев к конкретным записям.
 *      Комментарий может быть привязан к нескольким записям как в одной так и в разных таблицах.
 *      При редактировании этих записей, в специальном ПО, 
 *      - этот комментарий выводится в отдельном поле, 
 *      и т.о. пользователь видит актуальную информацию.
 *      При необходимости он может дополнить запись, либо 
 *      (при наличии прав) удалить комментарий.
 * ПРИМЕЧАНИЕ : 
 *  В реальной БД реализована более сложная логика ведения комментариев.
 *  Сама схема управления комментариями - реализована на стороне приложения.
 *  Поэтому здесь приведена упрощенная модель комментариев, примерно соответствующая реальной БД.
 * 
 *  Условно комментарий это независимый текст,
 *  который можно привязать 
 *  к одной или нескольким записям, в любой таблице БД ..
 * 
 *  Т.о. достигается универсальность и компактность хранения комментариев,
 *  а также минимизируется возможность ситуации когда комментарии противоречат друг-другу !
 *  Ведь каждый пользователь, при редактировании информации, - видит уже созданные комментарии,
 *  и дополняет или исправляет их по мере необходимости. 
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment_text TEXT COMMENT 'комментарии'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = 'таблица комментариев';


DROP TABLE IF EXISTS comment_links;
CREATE TABLE comment_links(
    table_name VARCHAR(50) COMMENT 'таблица, к которой привязывается коментарий',
    tab_row_id BIGINT UNSIGNED NOT NULL COMMENT 'запись, к которой привязывается коментарий',
    comment_id BIGINT UNSIGNED NOT NULL COMMENT 'идентификатор коментария',
    PRIMARY KEY (table_name(15), tab_row_id, comment_id),
    FOREIGN KEY (comment_id) REFERENCES comments(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'таблица связей комментариев с записями';

















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


