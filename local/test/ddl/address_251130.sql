DROP TABLE IF EXISTS land_lot_address_251130;

CREATE TABLE land_lot_address_251130
    LIKE land_lot_address;

ALTER TABLE land_lot_address_251130
    COMMENT = '지번주소 스냅샷 (251130)';

DROP TABLE IF EXISTS road_name_address_251130;

CREATE TABLE road_name_address_251130
    LIKE road_name_address;

ALTER TABLE road_name_address_251130
    COMMENT = '도로명주소 스냅샷 (251130)';