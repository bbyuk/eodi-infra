-- 2026.01.27 컬럼 comment 한글 깨짐 수정
-- 작성자 : bbyuk

-- land_lot_address
ALTER TABLE land_lot_address
    MODIFY id BIGINT AUTO_INCREMENT
    COMMENT '지번주소ID',

    MODIFY manage_no VARCHAR(26) NOT NULL
    COMMENT '관리번호',

    MODIFY legal_dong_code VARCHAR(10) NOT NULL
    COMMENT '법정동코드',

    MODIFY sido_name VARCHAR(40)
    COMMENT '시도명',

    MODIFY sigungu_name VARCHAR(40)
    COMMENT '시군구명',

    MODIFY umd_name VARCHAR(40)
    COMMENT '법정읍면동명',

    MODIFY ri_name VARCHAR(40)
    COMMENT '법정리명',

    MODIFY is_mountain VARCHAR(1) NOT NULL
    COMMENT '산여부',

    MODIFY land_lot_main_no INT NOT NULL
    COMMENT '지번본번(번지)',

    MODIFY land_lot_sub_no INT NOT NULL
    COMMENT '지번부번(호)',

    MODIFY road_name_code VARCHAR(12) NOT NULL
    COMMENT '도로명코드',

    MODIFY is_underground VARCHAR(1)
    COMMENT '지하여부',

    MODIFY building_main_no INT
    COMMENT '건물본번',

    MODIFY building_sub_no INT
    COMMENT '건물부번',

    MODIFY update_reason_code VARCHAR(10)
    COMMENT '이동사유코드';

-- road_name_address
ALTER TABLE road_name_address
    MODIFY id BIGINT AUTO_INCREMENT
    COMMENT '도로명주소 ID',

    MODIFY manage_no VARCHAR(26) NOT NULL
    COMMENT '관리번호',

    MODIFY legal_dong_code VARCHAR(10)
    COMMENT '법정동코드',

    MODIFY sido_name VARCHAR(40)
    COMMENT '시도명',

    MODIFY sigungu_name VARCHAR(40)
    COMMENT '시군구명',

    MODIFY umd_name VARCHAR(40)
    COMMENT '법정읍면동명',

    MODIFY ri_name VARCHAR(40)
    COMMENT '법정리명',

    MODIFY is_mountain VARCHAR(1)
    COMMENT '산여부',

    MODIFY land_lot_main_no INT
    COMMENT '지번본번',

    MODIFY land_lot_sub_no INT
    COMMENT '지번부번',

    MODIFY road_name_code VARCHAR(12) NOT NULL
    COMMENT '도로명코드',

    MODIFY road_name VARCHAR(80)
    COMMENT '도로명',

    MODIFY is_underground VARCHAR(1) NOT NULL
    COMMENT '지하여부',

    MODIFY building_main_no INT NOT NULL
    COMMENT '건물본번',

    MODIFY building_sub_no INT NOT NULL
    COMMENT '건물부번',

    MODIFY adm_dong_code VARCHAR(60)
    COMMENT '행정동코드',

    MODIFY adm_dong_name VARCHAR(60)
    COMMENT '행정동명',

    MODIFY basic_district_no VARCHAR(5)
    COMMENT '기초구역번호',

    MODIFY before_road_name_address VARCHAR(400)
    COMMENT '이전도로명주소',

    MODIFY effect_start_date VARCHAR(8)
    COMMENT '효력발생일',

    MODIFY is_multi VARCHAR(1)
    COMMENT '공동주택구분',

    MODIFY update_reason_code VARCHAR(2)
    COMMENT '이동사유코드',

    MODIFY building_name VARCHAR(400)
    COMMENT '건축물대장 건물명',

    MODIFY sigungu_building_name VARCHAR(400)
    COMMENT '시군구용 건물명',

    MODIFY remark VARCHAR(200)
    COMMENT '비고',

    MODIFY x_pos DECIMAL(15,6)
    COMMENT 'X좌표',

    MODIFY y_pos DECIMAL(15,6)
    COMMENT 'Y좌표';

-- real_estate_lease
ALTER TABLE real_estate_lease
    MODIFY id BIGINT NOT NULL AUTO_INCREMENT
    COMMENT '임대차 실거래가 ID',

    MODIFY region_id BIGINT NOT NULL
    COMMENT '대상지역 법정동 ID',

    MODIFY land_lot_value VARCHAR(30)
    COMMENT '지번 값',

    MODIFY land_lot_main_no INT
    COMMENT '지번본번',

    MODIFY land_lot_sub_no INT
    COMMENT '지번부번',

    MODIFY is_mountain TINYINT(1)
    COMMENT '산 여부',

    MODIFY legal_dong_name VARCHAR(50)
    COMMENT '법정동 명',

    MODIFY contract_date DATE
    COMMENT '계약일',

    MODIFY contract_start_month INT
    COMMENT '계약시작 월',

    MODIFY contract_end_month INT
    COMMENT '계약종료 월',

    MODIFY deposit INT
    COMMENT '보증금',

    MODIFY monthly_rent INT
    COMMENT '월세',

    MODIFY previous_deposit INT
    COMMENT '이전 계약 보증금',

    MODIFY previous_monthly_rent INT
    COMMENT '이전 계약 월세',

    MODIFY total_floor_area DECIMAL(10,4)
    COMMENT '연면적',

    MODIFY build_year INTEGER
    COMMENT '건축년도',

    MODIFY net_leasable_area DECIMAL(10,4)
    COMMENT '전용면적',

    MODIFY housing_type ENUM('AP','MH','DT','MU','OF','O')
    NOT NULL DEFAULT 'O'
    COMMENT '주택유형',

    MODIFY target_name VARCHAR(100)
    COMMENT '대상명',

    MODIFY floor INTEGER
    COMMENT '층',

    MODIFY use_rr_right TINYINT(1)
    NOT NULL DEFAULT 0
    COMMENT '갱신계약 청구권 사용여부',

    MODIFY x_pos DECIMAL(15,6)
    COMMENT 'X좌표',

    MODIFY y_pos DECIMAL(15,6)
    COMMENT 'Y좌표',

    MODIFY created_at TIMESTAMP
    NOT NULL DEFAULT CURRENT_TIMESTAMP
    COMMENT '생성일시',

    MODIFY updated_at TIMESTAMP
    NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
    COMMENT '수정일시';

-- real_estate_sell
