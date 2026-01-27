-- 2026.01.27 테이블 comment 한글 깨짐 수정
-- 작성자 : bbyuk

ALTER TABLE land_lot_address COMMENT = '지번주소';
ALTER TABLE legal_dong COMMENT = '법정동';
ALTER TABLE legal_dong_adjacency COMMENT = '법정동 인접 정보';
ALTER TABLE real_estate_sell COMMENT = '부동산 매매 실거래가';
ALTER TABLE real_estate_lease COMMENT = '부동산 임대차 실거래가';
ALTER TABLE road_name_address COMMENT = '도로명주소';