-- 2026.01.22 실거래가 테이블 버전 컬럼 추가
-- 작성자 : bbyuk

ALTER TABLE real_estate_sell ADD COLUMN version DATE NULL COMMENT '버전';
ALTER TABLE real_estate_lease ADD COLUMN version DATE NULL COMMENT '버전';