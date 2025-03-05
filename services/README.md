# 🐳 Services

이 디렉토리는 다양한 서비스의 **Docker Compose 구성 예제**를 모아둔 공간입니다.  
각 서비스는 독립적인 폴더로 구성되며, `docker-compose.yml`, `.env`, 필요 설정파일과 각 서비스 설명을 담은 `README.md`로 구성됩니다.

---

## 📂 서비스 목록

| 서비스명 | 설명 | 구성 요소 | 바로가기 |
|---|---|---|---|
| Redis | 인메모리 데이터스토어 구성 | Redis 컨테이너 | [redis](./redis) |
| Laravel | 풀스택 웹 서비스 구성 | Nginx, PHP, MySQL, Redis | [laravel](./laravel) |
| MySQL | 데이터베이스 단독 구성 | MySQL 컨테이너 | [mysql](./mysql) |
| Monitoring | 모니터링 스택 구성 | Prometheus, Grafana | [monitoring](./monitoring) |

---

## 📦 서비스 구성 원칙
- 각 서비스는 **독립적인 폴더**로 관리
- 구성 파일은 기본적으로:
    - `docker-compose.yml`
    - `.env`
    - 필요 시 `Dockerfile`, 설정파일(예: `redis.conf`, `nginx.conf` 등)
    - 서비스 설명용 `README.md`
- 서비스 구성은 `services/` 아래에서만 관리하며, 실제 운영 환경과의 분리 명확히

---

## 📖 각 서비스 폴더 구성 예시 (redis 기준)

| 파일명 | 설명 |
|---|---|
| docker-compose.yml | 서비스 정의 파일 |
| .env | 환경변수 파일 |
| redis.conf | Redis 커스텀 설정 |
| README.md | 서비스 구성 설명 및 실행 가이드 |

---

## 📚 참고 자료
- [Docker 공식 문서](https://docs.docker.com/)
- [Compose 공식 문서](https://docs.docker.com/compose/)
- [Awesome Docker](https://github.com/veggiemonk/awesome-docker)

