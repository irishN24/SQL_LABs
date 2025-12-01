CREATE TABLE Location(
  ID INT,
  Name_region VARCHAR(100) NOT NULL,
  Region VARCHAR(100) NOT NULL,
  constraint LOCATION_ID_pk primary key (id)
  --CONSTRAINT location_name_region_uk UNIQUE(name_region)
);
INSERT INTO Location VALUES (1, 'Риф Маска', 'Мондштадт');
INSERT INTO Location VALUES (2, 'Яшмовый лес', 'Ли Юэ');
INSERT INTO Location VALUES (3, 'Петрикор', 'Фонтейн');
INSERT INTO Location VALUES (4, 'Каннадзука', 'Инадзума');
INSERT INTO location VALUES (5, 'Порт-Ормос', 'Сумеру');

CREATE TABLE Elements
(
  ID INT,
  Name VARCHAR(100) NOT NULL,
  constraint Elements_ID_pk primary key (id), 
  constraint elements_name_uk unique(NAME)
);
INSERT INTO Elements VALUES (1, 'Pyro');
INSERT INTO Elements VALUES (2, 'Cryo');
INSERT INTO Elements VALUES (3, 'Electro');
INSERT INTO Elements VALUES (4, 'Anemo');
INSERT INTO Elements VALUES (5, 'Dendro');
INSERT INTO Elements VALUES (6, 'Gydro');
INSERT INTO Elements VALUES (7, 'Geo');

CREATE TABLE Weapon_info
(
  ID INT,
  Name VARCHAR(100) NOT NULL,
  Type VARCHAR(100) NOT NULL,
  Rarity INT NOT NULL,
  Main_characteristic VARCHAR(100) NOT NULL,
  Main_value REAL NOT NULL,
  Level INT NOT NULL,
  CONSTRAINT Weapon_info_id_pk PRIMARY KEY (ID)
);
INSERT INTO Weapon_info VALUES(1, 'Тупой меч', 'меч', 1, 'базовая атака', 185, 1);
INSERT INTO Weapon_info VALUES(2, 'Лук опытного охотника', 'стрелковое', 2, 'базовая атака', 243, 1);
INSERT INTO Weapon_info VALUES(3, 'Меч из белого железа', 'двуручный меч', 3, 'Процент от защиты', 43.9, 86);
INSERT INTO Weapon_info VALUES(4, 'Песнь необъятной лазури', 'катализатор', 4, 'Восст. энергии в %', 19.9, 38);
INSERT INTO Weapon_info VALUES(5, 'Посох Хомы', 'копьё', 5, 'Крит. урон в %', 42.9, 45);
INSERT INTO Weapon_info VALUES(6, 'Шкатулка истин', 'катализатор', 5, 'Крит. урон в %', 33.9, 20);
INSERT INTO Weapon_info VALUES(7, 'Фонарь чёрной сердцевины', 'катализатор', 4, 'мастерство стихий', 221, 90);
INSERT INTO Weapon_info VALUES(8, 'Мастер-ключ', 'двуручный меч', 4, 'Восст. энергии в %', 39.7, 55);
INSERT INTO Weapon_info VALUES(9, 'Разбивающий цепи', 'стрелковое', 4, 'Сила атаки в %', 22.7, 73);
INSERT INTO Weapon_info VALUES(10, 'Обряд вечного течения', 'катализатор', 5, 'Крит. урон в %', 33.9, 26);

CREATE TABLE artifact_set(
  ID INT,
  NAME_SET VARCHAR(100),
  bonus_2 INT,
  bonus_4 INT,
  CONSTRAINT art_set_id_pk PRIMARY KEY(ID)
);
INSERT INTO artifact_set VALUES (1, 'Искатель приключений', 1000, 30),
(2, 'Берсерк', 12 , 24),
(3, 'Конец Гладиатора', 18, 35),
(4, 'Странствующий ансамбль', 80, 35),
(5, 'Церемония древней знати', 20, 20),
(6, 'Громогласный рёв ярости', 15, 40),
(7, 'Стойскость миллелита', 20, 30),
(8, 'Цветок потерянного рая', 80, 65),
(9, 'Ночь открытия неба', 80, 55);

CREATE TABLE type_arifact(
  ID INT,
  Name_type VARCHAR(100),
  CONSTRAINT type_art_id_pk PRIMARY KEY(ID)
);
INSERT INTO type_arifact VALUES(1, 'Цветок жизни'); 
INSERT INTO type_arifact VALUES(2, 'Перо смерти'); 
INSERT INTO type_arifact VALUES(3, 'Пески времени'); 
INSERT INTO type_arifact VALUES(4, 'Кубок пространства'); 
INSERT INTO type_arifact VALUES(5, 'Корона разума');

CREATE TABLE Character_info
(
  ID INT,
  Name VARCHAR(100) NOT NULL,
  Rarity INT NOT NULL,
  ID_last_location INT NOT NULL,
  ID_element INT NOT NULL,
  ID_weapon INT,
  CONSTRAINT character_info_id_pk PRIMARY KEY (ID), 
  CONSTRAINT character_info_name_uk UNIQUE(Name),
  CONSTRAINT ch_inf_last_loc_fk FOREIGN KEY (ID_last_location) REFERENCES Location(ID),
  CONSTRAINT ch_inf_elem_fk FOREIGN KEY (ID_element) REFERENCES Elements(ID),
  CONSTRAINT ch_inf_weapon_fk FOREIGN KEY (ID_weapon) REFERENCES Weapon_info(ID)
);
INSERT INTO Character_info VALUES (1, 'Дэхья', 5, 1, 1, 8);
INSERT INTO Character_info VALUES (2, 'Флинс', 5, 3, 2, 5);
INSERT INTO Character_info VALUES (3, 'Син Цю', 4, 2, 1);
INSERT INTO Character_info VALUES (4, 'Чжун Ли', 5, 4, 7, 5);
INSERT INTO Character_info VALUES (5, 'Сахароза', 4, 3, 4, 4);
INSERT INTO Character_info VALUES (6, 'Барбара', 4, 5, 6, 4);
INSERT INTO Character_info VALUES (7, 'Нефер', 5, 3, 5, 6);
INSERT INTO Character_info VALUES (8, 'Тиори', 5, 4, 7, 1);
INSERT INTO Character_info VALUES (9, 'Лайла', 4, 2, 2, 1);
INSERT INTO Character_info VALUES (10, 'Беннет', 4, 2, 1, 1);
INSERT INTO Character_info VALUES (11, 'Синобу', 4, 1, 3, 1);

CREATE TABLE Artifact(
  ID INT,
  Name VARCHAR(100) NOT NULL,
  main_characteristic VARCHAR(100) NOT NULL,
  main_value INT NOT NULL,
  id_type int NOT NULL,
  ID_set int NOT NULL,
  CONSTRAINT Artifact_id_pk PRIMARY KEY(ID),
  CONSTRAINT artifact_id_type_fk FOREIGN KEY(id_type) REFERENCES type_arifact(id),
  CONSTRAINT artifact_id_set_fk FOREIGN KEY(ID_set) REFERENCES artifact_set(id)
);
INSERT INTO artifact VALUES (1, 'Обрезанное перо', 'сила атаки', 25, 2, 1);
INSERT INTO artifact VALUES (2, 'Цветок почестей', 'HP', 4780, 1, 7);
INSERT INTO artifact VALUES (3, 'Боевое перо командира', 'Сила атаки', 311, 2, 7);
INSERT INTO artifact VALUES (4, 'Золотые часы', 'HP %', 46.6, 3, 7); 
INSERT INTO artifact VALUES (5, 'Древний шлем генерала', 'HP %', 46.6, 5, 7); 
INSERT INTO artifact VALUES (6, 'Золотой кубок клятвы', 'Бонус Гео урона %', 46.6, 4, 7);

INSERT INTO artifact VALUES (7, 'Рассвет ансабля', 'HP', 4780, 1, 4);
INSERT INTO artifact VALUES (8, 'Угасающий пир', 'Сила атаки', 311, 2, 4);
INSERT INTO artifact VALUES (9, 'Фляжка странника', 'HP %', 46.6, 4, 4);
INSERT INTO artifact VALUES (10, 'Триумф гладиатора', 'Мастерство стихий', 187, 5, 4);
INSERT INTO artifact VALUES (11, 'Застывшее мгновение', 'Мастерство стихий', 187, 3, 4);

INSERT INTO artifact VALUES (12, 'Королевский цветок', 'HP', 2342, 1, 3);
INSERT INTO artifact VALUES (13, 'Превосходная чаша', 'Сила атаки %', 7.0, 2, 3);
INSERT INTO artifact VALUES (14, 'Триумф гладиатора', 'Сила атаки %', 7.0, 3, 3);
INSERT INTO artifact VALUES (15, 'Королевское перо', 'Сила атаки', 311, 3, 5);

INSERT INTO artifact VALUES (16, 'Цветок жажды познания', 'HP', 717, 1, 9); 
INSERT INTO artifact VALUES (17, 'Перо несмываемого греха', 'Сила атаки', 47, 2, 9);
INSERT INTO artifact VALUES (18, 'Священная корона верующей', 'Шанс крит.попадания %', 4.7, 5, 9);


CREATE TABLE Character_artifact(
  ID_artifact INT,
  ID_character INT,
  level_artifact INT, 
  CONSTRAINT character_art_id_art_fk FOREIGN KEY (ID_artifact) REFERENCES Artifact(ID),
  CONSTRAINT character_art_id_ch_fk FOREIGN KEY (ID_character) REFERENCES character_info(id),
  CONSTRAINT ch_art_level CHECK ((level_artifact >= 0) AND (level_artifact <= 20))
);
INSERT INTO character_artifact VALUES(2, 4, 20);
INSERT INTO character_artifact VALUES(3, 4, 20);
INSERT INTO character_artifact VALUES(4, 4, 20);
INSERT INTO character_artifact VALUES(5, 4, 20);
INSERT INTO character_artifact VALUES(6, 4, 20);
INSERT INTO character_artifact VALUES(7, 11, 20);
INSERT INTO character_artifact VALUES(8, 11, 20);
INSERT INTO character_artifact VALUES(9, 11, 20);
INSERT INTO character_artifact VALUES(10, 11, 20);
INSERT INTO character_artifact VALUES(11, 11, 20);
INSERT INTO character_artifact VALUES(12, 10, 8);
INSERT INTO character_artifact VALUES(13, 10, 0);
INSERT INTO character_artifact VALUES(14, 10, 0);
INSERT INTO character_artifact VALUES(15, 10, 20);
INSERT INTO character_artifact VALUES(16, 2, 0);
INSERT INTO character_artifact VALUES(17, 2, 0);
INSERT INTO character_artifact VALUES(18, 2, 0);

CREATE UNIQUE INDEX location_region_uk ON Location(Name_region);
CREATE INDEX weapon_type_rarity_idx ON Weapon_info(Type, Rarity);
CREATE INDEX character_rarity_idx ON Character_info(Rarity);
CREATE INDEX character_artifact_character_id_idx ON Character_artifact(ID_character);


CREATE OR REPLACE FUNCTION character_info_id_func()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.ID IS NULL THEN
        SELECT nextval('character_info_seq') INTO NEW.ID;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER character_info_before_insert
    BEFORE INSERT ON Character_info
    FOR EACH ROW
    EXECUTE FUNCTION character_info_id_func();
CREATE SEQUENCE character_info_seq START WITH 12;

CREATE OR REPLACE FUNCTION character_info_logs_user_changes()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO character_info_logs(log_id, operation_type, character_id, character_name, changed_by, changed_time, old_data, new_data)
    VALUES ('users', TG_OP, TO_JSONB(OLD), TO_JSONB(NEW));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER character_info_logs_user_changes
    AFTER INSERT OR UPDATE OR DELETE ON Character_info
    FOR EACH ROW
    EXECUTE FUNCTION character_info_logs_user_changes();
END;


CREATE OR REPLACE FUNCTION calculate_character_power_func()
RETURNS TRIGGER AS
$$
DECLARE
    weapon_power_value REAL;
    artifact_power_value REAL;
    total_power_value REAL;
BEGIN
    SELECT wi.main_value INTO weapon_power_value
    FROM Weapon_info wi
    WHERE wi.ID = NEW.ID_weapon;
    SELECT COALESCE(SUM(
        CASE 
            WHEN LOWER(a.main_characteristic) = LOWER('HP') THEN a.main_value * 0.01
            WHEN LOWER(a.main_characteristic) = LOWER('сила атаки') THEN a.main_value * 1.0
            WHEN LOWER(a.main_characteristic) = LOWER('Сила атаки %') THEN a.main_value * 10
            WHEN LOWER(a.main_characteristic) = LOWER('HP %') THEN a.main_value * 50
            WHEN LOWER(a.main_characteristic) = LOWER('Крит. урон в %') THEN a.main_value * 2
            WHEN LOWER(a.main_characteristic) = LOWER('Шанс крит.попадания %') THEN a.main_value * 3
            WHEN LOWER(a.main_characteristic) = LOWER('мастерство стихий') THEN a.main_value * 0.5
            WHEN LOWER(a.main_characteristic) = LOWER('Восст. энергии в %') THEN a.main_value * 4
            ELSE a.main_value * 0.1
        END), 0)
    INTO artifact_power_value
    FROM Character_artifact ca
    JOIN Artifact a ON ca.ID_artifact = a.ID
    WHERE ca.ID_character = NEW.ID;
    total_power_value := (weapon_power_value + artifact_power_value);   
    INSERT INTO character_total_power 
        (character_id, character_name, weapon_power, artifact_power, total_power, last_calculated)
    VALUES 
        (NEW.ID, NEW.Name, weapon_power_value, artifact_power_value, total_power_value, CURRENT_TIMESTAMP)
    ON CONFLICT (character_id) 
    DO UPDATE SET 
        character_name = EXCLUDED.character_name,
        weapon_power = EXCLUDED.weapon_power,
        artifact_power = EXCLUDED.artifact_power,
        total_power = EXCLUDED.total_power,
        last_calculated = CURRENT_TIMESTAMP;    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER character_power_calculation_trigger
    AFTER INSERT OR UPDATE OF ID_weapon ON Character_info
    FOR EACH ROW
    EXECUTE FUNCTION calculate_character_power_func();
CREATE OR REPLACE FUNCTION update_character_power_on_artifact_change()
RETURNS TRIGGER AS
$$
BEGIN
    PERFORM calculate_character_power_func() FROM Character_info 
    WHERE ID = COALESCE(NEW.ID_character, OLD.ID_character);
    
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER artifact_change_power_trigger
    AFTER INSERT OR UPDATE OR DELETE ON Character_artifact
    FOR EACH ROW
    EXECUTE FUNCTION update_character_power_on_artifact_change();


--транзакции
BEGIN;

UPDATE Character_info 
SET ID_last_location = 5 
WHERE Name = 'Дэхья';

SELECT * FROM Character_info WHERE Name = 'Дэхья';

ROLLBACK;

SELECT * FROM Character_info WHERE Name = 'Дэхья';

-- Начало транзакции
BEGIN;

UPDATE Weapon_info 
SET Level = 90 
WHERE Name = 'Тупой меч';

SELECT * FROM Weapon_info WHERE Name = 'Тупой меч';

COMMIT;

SELECT * FROM Weapon_info WHERE Name = 'Тупой меч';

-- Начало транзакции
BEGIN;

UPDATE Location 
SET Name_region = 'Нод-Край' 
WHERE ID = 1;

SAVEPOINT my_savepoint;

UPDATE Elements 
SET Name = 'Chaos' 
WHERE ID = 1;

ROLLBACK TO my_savepoint;

SELECT * FROM Location WHERE ID = 1;
SELECT * FROM Elements WHERE ID = 1;

COMMIT; 


