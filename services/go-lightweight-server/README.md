# Docker Compose 설정 파일

```yaml
version: '3.8' # Docker Compose 파일의 3.8 버전을 지정합니다.

services: # Docker Compose 의 service 를 정의합니다.
  golang-api: # golang-api service 를 정의합니다.
    build: # Docker Compose에서 컨테이너 이미지를 빌드하기 위한 설정을 정의하는 영역
      context: . # 현재 디렉토리 (.) 의 Docker 빌드 컨텍스트로 사용합니다.
      dockerfile: Dockerfile # Dockerfile 을 사용하여 이미지를 빌드합니다.
    ports:
      - "8080:8080" # 호스트의 8080 포트를 컨테이너의 8080 포트에 매핑합니다.
    environment: # 컨테이너 내부에서 사용할 환경 변수를 설정합니다.
      - GIN_MODE=release # Golang의 GIN 프레임워크를 release 로 설정합니다.
    restart: unless-stopped # 컨테이너가 비정상 종료되면 다시 시작됩니다. 수동으로 중지하지 않는 한 항상 재시작됩니다.
    container_name: golang-api-production # 컨테이너의 이름을 golang-api-production으로 지정합니다.
    networks: # 특정 서비스가 어떤 네트워크에 연결되어야 하는지를 정의합니다.
      - production-network # 정의된 네트워크(production-network)에 연결합니다.

networks: # 서비스 간 통신을 위한 네트워크를 정의합니다.
  production-network: # production-network 네트워크를 정의합니다.
    driver: bridge # 기본 브릿지 네트워크 드라이버를 사용합니다.
```

# Dockerfile
