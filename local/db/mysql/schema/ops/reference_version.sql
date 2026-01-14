DROP TABLE IF EXISTS reference_version;
-- -----------------------------------------------------------------------------------------
-- create
CREATE TABLE reference_version
(
    id              BIGINT AUTO_INCREMENT PRIMARY KEY   COMMENT '기준정보버전 ID',
    target_name     VARCHAR(50) NOT NULL UNIQUE         COMMENT '기준대상명',
    effective_date  DATE    NOT NULL                    COMMENT '기준정보 반영일자',
    updated_at      TIMESTAMP                           COMMENT '수정일시',
    updated_by      VARCHAR(50)                         COMMENT '수정자'
) COMMENT = '기준정보버전';
