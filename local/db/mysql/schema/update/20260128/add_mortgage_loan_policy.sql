-- 2026.01.28 주택담보대출정책 테이블 ddl 추가
-- 작성자 : bbyuk

DROP TABLE IF EXISTS mortgage_loan_policy;

-- -----------------------------------------------------------------------------------------
-- create
CREATE TABLE mortgage_loan_policy
(
    id                      BIGINT  NOT NULL AUTO_INCREMENT         COMMENT '주택담보대출정책 ID',
    region_id               BIGINT                                  COMMENT '대상지역법정동 ID',
    effective_start_date    DATE    NOT NULL                        COMMENT '정책시작일자',
    effective_end_date      DATE    NOT NULL                        COMMENT '정책종료일자',
    ltv_max_ratio           INT                                     COMMENT 'LTV 한도',
    dsr_max_ratio           INT                                     COMMENT 'DSR 한도',
    dti_max_ratio           INT                                     COMMENT 'DTI 한도',
    created_at              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP   COMMENT '생성일시',
    updated_at              TIMESTAMP                               COMMENT '수정일시',
    PRIMARY KEY (id)
) COMMENT = '주택담보대출 정책';

-- -----------------------------------------------------------------------------------------
-- index

---

DROP TABLE IF EXISTS mortgage_loan_policy_region;

-- -----------------------------------------------------------------------------------------
-- create
CREATE TABLE mortgage_loan_policy_region (
    id                      BIGINT      NOT NULL AUTO_INCREMENT     COMMENT '주택담보대출정책 지역 매핑 ID',
    mortgage_loan_policy_id BIGINT      NOT NULL                    COMMENT '주택담보대출정책 ID',
    region_id               BIGINT      NOT NULL                    COMMENT '대상지역법정동 ID',
    created_at              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP   COMMENT '생성일시',
    updated_at              TIMESTAMP                               COMMENT '수정일시',
    PRIMARY KEY (id)
) COMMENT = '주택담보대출정책 지역 매핑';