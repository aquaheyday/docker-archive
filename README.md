# 🐳 Docker Archive

`docker-archive`는 **Docker 환경 구성 예제**와 **학습 정리**, 그리고 **템플릿**을 아카이브하는 공간입니다.  
Redis, Laravel, MySQL 등 다양한 서비스 구성 사례를 Docker Compose 기반으로 정리하고,  
학습하면서 배운 개념 및 트러블슈팅 경험도 함께 기록합니다.

---

## 📂 디렉토리 구성

| 폴더명 | 설명 |
|---|---|
| [services](./services) | 서비스별 Docker 구성 예제 (redis, laravel 등) |
| [notes](./notes) | Docker 학습 정리 및 트러블슈팅 노트 |
| [templates](./templates) | 공통 템플릿 모음 (Dockerfile, Compose 등) |

---

## 📦 services 구성 목록

| 서비스명 | 설명 | 바로가기 |
|---|---|---|
| Redis | Redis 단독 구성 예제 | [redis](./services/redis) |
| Laravel | Laravel + Nginx + PHP + MySQL 구성 | [laravel](./services/laravel) |
| MySQL | MySQL 단독 구성 예제 | [mysql](./services/mysql) |
| Monitoring | Prometheus + Grafana 구성 예제 | [monitoring](./services/monitoring) |

---

## 📖 notes 학습 정리 목록

| 주제 | 설명 | 링크 |
|---|---|---|
| Dockerfile Best Practices | 효율적 Dockerfile 작성법 | [Dockerfile-Best-Practices.md](./notes/Dockerfile-Best-Practices.md) |
| Compose vs Swarm | Compose와 Swarm의 차이점 정리 | [compose-vs-swarm.md](./notes/compose-vs-swarm.md) |
| Docker Networking | 브릿지/호스트 네트워크 정리 | [docker-networking.md](./notes/docker-networking.md) |
| Volume vs Bind Mount | 데이터 볼륨 관리 방식 비교 | [volume-vs-bind-mount.md](./notes/volume-vs-bind-mount.md) |
| Buildkit Optimization | BuildKit을 활용한 빌드 최적화 | [buildkit-optimization.md](./notes/buildkit-optimization.md) |
| 트러블슈팅 모음 | 실제 경험한 문제와 해결 과정 | [트러블슈팅.md](./notes/트러블슈팅.md) |

---

## ✨ 활용 방법

1️⃣ 필요한 서비스 구성은 `services`에서 복사해 환경 맞춤 구성  
2️⃣ 공통 환경 변수 설정은 `.env`에서 관리  
3️⃣ 서비스 실행은 `docker-compose up -d`  
4️⃣ 학습 기록은 `notes`에 정리  
5️⃣ 새 서비스 추가 시 `templates` 참고해 빠르게 구성

---

## 📚 참고 자료

| 출처 | 링크 |
|---|---|
| Docker 공식 문서 | [https://docs.docker.com/](https://docs.docker.com/) |
| Awesome Docker | [https://github.com/veggiemonk/awesome-docker](https://github.com/veggiemonk/awesome-docker) |
| Dive (이미지 분석 도구) | [https://github.com/wagoodman/dive](https://github.com/wagoodman/dive) |


