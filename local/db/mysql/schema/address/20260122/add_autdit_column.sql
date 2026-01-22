-- 2026.01.22 주소 테이블 audit 컬럼 추가
-- 작성자 : bbyuk

ALTER TABLE road_name_address ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시';
ALTER TABLE road_name_address ADD COLUMN updated_at TIMESTAMP NULL COMMENT '수정일시';

ALTER TABLE land_lot_address ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시';
ALTER TABLE land_lot_address ADD COLUMN updated_at TIMESTAMP NULL COMMENT '수정일시';