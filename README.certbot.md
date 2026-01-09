## Certbot - Let's Encrypt SSL 인증서 적용

본 문서는 Docker Compose 기반 Nginx 환경에서
Certbot을 사용해 Let’s Encrypt SSL 인증서를 발급·적용·자동 갱신하는 방법을 정리한다.

---

대상 도메인

> NOTE: 예시 도메인입니다.

- domain.net 
- api.domain.net

인증 방식: HTTP-01 (webroot)

운영 환경: EC2 + Docker Compose

인증서 자동갱신: crontab

---
### yml 및 conf 디렉터리 구조

```
/opt/${PROJECT_NAME}/infra/prod/app
├─ nginx
│  ├─ nginx.conf
│  └─ conf.d
│     ├─ 00-acme.conf
│     ├─ 10-web.conf
│     └─ 20-api.conf
└─ compose
   ├─ docker-compose.nginx.yml
   └─ docker-compose.certbot.yml
```

---

### 서버 디렉터리 구조

```
/opt/${PROJECT_NAME}
├─ data
│  ├─ certbot
│  │  └─ www
│  └─ letsencrypt
│     ├─ live
│     ├─ archive
│     └─ renewal
├─ infra
...
```

---

### Docker Compose 설정

docker-compose.nginx.yml

```
version: "3.9"

services:
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /opt/${PROJECT_NAME}/infra/prod/app/nginx/nginx.conf:/etc/nginx/nginx.conf:ro
      - /opt/${PROJECT_NAME}/infra/prod/app/nginx/conf.d:/etc/nginx/conf.d:ro
      - /opt/${PROJECT_NAME}/data/certbot/www:/var/www/certbot
      - /opt/${PROJECT_NAME}/data/letsencrypt:/etc/letsencrypt
    restart: always
```

docker-compose.certbot.yml
```
version: "3.9"

services:
  certbot:
    image: certbot/certbot
    volumes:
      - /opt/${PROJECT_NAME}/data/certbot/www:/var/www/certbot
      - /opt/${PROJECT_NAME}/data/letsencrypt:/etc/letsencrypt
```

---

### Nginx 설정 - include 방식

nginx.conf (고정 파일)

```
events {}

http {
  include /etc/nginx/conf.d/*.conf;
}
```

00-acme.conf (항상 유지)

- 인증서 발급 / 갱신 시 ACME challenge 처리
- 삭제하지 않음

```
server {
  listen 80;
  server_name domain.net api.domain.net;

  location /.well-known/acme-challenge/ {
    root /var/www/certbot;
    try_files $uri =404;
  }

  location / {
    return 301 https://$host$request_uri;
  }
}
```

10-web.conf (WEB)
```
server {
  listen 443 ssl;
  server_name domain.net;

  ssl_certificate     /etc/letsencrypt/live/eodi.net/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/eodi.net/privkey.pem;

  location / {
    proxy_pass http://web:3000;
  }
}
```

20-api.conf (API)
```
server {
  listen 443 ssl;
  server_name api.domain.net;

  ssl_certificate     /etc/letsencrypt/live/eodi.net/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/eodi.net/privkey.pem;

  location / {
    proxy_pass http://api:8080;
  }
}
```

---

### 최초 인증서 발급

#### 0. 운영용 conf 제외
10-web.conf와 20-api.conf는 최초 인증서 발급시 인증서 파일이 존재하지 않아 오류가 발생한다.

mv로 운영용 conf는 제외한 후 nginx를 실행한다.
```
mv 10-web.conf 10-web.conf.disabled
mv 20-api.conf 20-api.conf.disabled
```

#### 1. nginx 실행
```
docker compose -f docker-compose.nginx.yml up -d
```

#### 2. ACME 경로 접근 확인
```
curl http://domain.net/.well-known/acme-challenge/test
curl http://domain.eodi.net/.well-known/acme-challenge/test
```

#### 3. certbot 실행

```
docker compose -f docker-compose.certbot.yml run --rm certbot certonly \
  --webroot \
  -w /var/www/certbot \
  -d domain.net \
  -d api.domain.net \
  --email ${email} \
  --agree-tos \
  --no-eff-email
```

#### 4. 운영 conf 추가 후 nginx 재실행
```
mv 10-web.conf.disabled 10-web.conf
mv 20-api.conf.disabled 20-api.conf

docker compose -f docker-compose.nginx.yml down
docker compose -f docker-compose.nginx.yml up -d
```

### 인증서 자동 갱신

- **매일 새벽 3시 1회 실행**
- 인증서 갱신 시에만 nginx reload 수행
- 로그는 /var/log/certbot-renew.log에 기록

```
crontab -e

0 3 * * * /usr/bin/docker compose -f /opt/${PROJECT_NAME}/infra/prod/app/compose/docker-compose.certbot.yml run --rm certbot renew --quiet --deploy-hook "/usr/bin/docker exec eodi-nginx nginx -s reload" >> /var/log/certbot-renew.log 2>&1
```