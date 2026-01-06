EODI Infrastructure Repository

이 레포지토리는 EODI 서비스의 인프라 구성을 관리합니다.
Docker Compose 기반으로 로컬(Local) 과 운영(Prod) 환경을 디렉터리 단위로 분리하여 관리합니다.

브랜치 전략: main 단일 브랜치

환경 구분: 디렉터리(local / prod)

배포 방식: Docker Compose (수동 또는 Git 기반 반자동)

```
eodi-infra
├─ local/                         # 로컬 개발 환경
│  ├─ app/
│  │  ├─ nginx/
│  │  │  └─ nginx.conf            # 로컬용 Nginx 설정
│  │  ├─ app.env                  # 애플리케이션 환경변수 (로컬)
│  │  ├─ web.env                  # 웹(frontend) 환경변수
│  │  └─ docker-compose.yml       # App/Web/Nginx compose
│  │
│  ├─ db/
│  │  ├─ compose/
│  │  │  └─ docker-compose.yml    # MySQL compose
│  │  ├─ mysql/
│  │  │  └─ init-scripts/
│  │  │     └─ init.sql           # 초기 DB 생성 스크립트
│  │  └─ schema/
│  │     ├─ address/
│  │     │  ├─ land_lot_address.sql
│  │     │  ├─ road_name_address.sql
│  │     │  └─ unmapped.sql
│  │     ├─ deal/
│  │     │  ├─ real_estate_lease.sql
│  │     │  └─ real_estate_sell.sql
│  │     ├─ legal_dong/
│  │     │  ├─ legal_dong.sql
│  │     │  └─ legal_dong_adjacency.sql
│  │     ├─ spring_batch/
│  │     └─ schema-mysql.sql
│  │
│  ├─ .env                        # 로컬 공통 환경변수 (gitignore)
│  └─ resource/
│     ├─ init-network-mac.sh      # 로컬 Docker 네트워크 초기화 (mac)
│     └─ init-volume-mac.sh       # 로컬 Docker 볼륨 초기화 (mac)
│
├─ prod/                          # 운영(PROD) 환경
│  ├─ app/
│  │  ├─ docker/
│  │  ├─ nginx/
│  │  │  └─ nginx.conf            # 운영용 Nginx 설정
│  │  ├─ init-scripts/
│  │  ├─ docker-compose.yml       # 운영 App/Web compose
│  │
│  ├─ db/
│  │  ├─ compose/
│  │  │  └─ docker-compose.yml    # 운영 DB compose
│  │  ├─ mysql/
│  │  │  └─ init-scripts/
│  │  │     ├─ 00-init.sql        # DB/계정 초기화
│  │  │     └─ 10-schema.sql      # 기본 스키마
│  │  ├─ init-db.sh               # DB 초기화 스크립트
│  │  └─ schema/
│  │     ├─ address/
│  │     │  ├─ land_lot_address.sql
│  │     │  ├─ road_name_address.sql
│  │     │  └─ unmapped.sql
│  │     ├─ deal/
│  │     │  ├─ real_estate_lease.sql
│  │     │  └─ real_estate_sell.sql
│  │     ├─ legal_dong/
│  │     │  ├─ legal_dong.sql
│  │     │  └─ legal_dong_adjacency.sql
│  │     ├─ spring_batch/
│  │     └─ schema-mysql.sql
│
├─ resource/
│  └─ init-network.sh             # 운영 Docker 네트워크 초기화
│
├─ .gitignore
└─ README.md
```

Notes

DB 스키마 및 대용량 초기 데이터는 schema/ 디렉터리에서 관리

로컬과 운영의 구조는 최대한 동일하게 유지

운영 환경은 EBS 기반 볼륨 마운트를 전제로 설계됨