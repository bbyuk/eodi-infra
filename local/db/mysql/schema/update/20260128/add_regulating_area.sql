DROP TABLE IF EXISTS regulating_area;

-- -----------------------------------------------------------------------------------------
-- create
CREATE TABLE regulating_area
(
    id                      BIGINT  NOT NULL AUTO_INCREMENT PRIMARY KEY  COMMENT '규제지역 ID',
    legal_dong_id           BIGINT  NOT NULL                             COMMENT '규제지역 법정동 ID',
    effective_start_date    DATE                                         COMMENT '적용시작일자',
    effective_end_date      DATE                                         COMMENT '적용종료일자',
    created_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updated_at              TIMESTAMP                                    COMMENT '수정일시'
) COMMENT = '규제지역';

-- -----------------------------------------------------------------------------------------
-- index
CREATE INDEX idx_regulating_area
    ON regulating_area (legal_dong_id, effective_start_date, effective_end_date);
