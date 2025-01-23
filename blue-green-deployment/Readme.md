# Blue-Green 무중단 배포

## 소개

이 프로젝트는 **Blue-Green 배포** 전략을 Docker와 Docker Compose를 활용해 구현한 예제입니다.  
Blue-Green 배포는 무중단 배포(Zero-Downtime Deployment)를 가능하게 하는 기술로,  
현재 활성화된 Blue 환경과 대기 중인 Green 환경을 유지하며 안전하게 소프트웨어 업데이트를 적용할 수 있습니다.  
(이 프로젝트는 Go로 작성된 애플리케이션과 Apache HTTP Server를 리버스 프록시로 사용하여 트래픽을 Blue와 Green 환경 간에 동적으로 라우팅을 가정합니다.)

## 디렉토리 구조

```plaintext
.
├── Dockerfile         # Blue와 Green 서비스용 Docker 빌드 설정
├── docker-compose.yml # Blue와 Green 컨테이너 관리
├── deploy.sh          # 배포 자동화 쉘 스크립트, 파일에 실행 권한이 부여되어야 합니다.(chmod +x deploy.sh)
├── httpd-vhost.conf   # /etc/httpd/conf.d/httpd-vhost.conf 에 추가할 내용(경로는 프로젝트마다 상이 할 수 있으니 확인이 필요합니다.)
├── ssl.conf           # /etc/httpd/conf.d/ssl.conf 에 추가할 내용(경로는 프로젝트마다 상이 할 수 있으니 확인이 필요합니다.)
├── app/
│   ├── main.go        # Go로 작성된 HTTP 애플리케이션
│   └── go.mod         # Go 모듈 설정 파일
```

## 운영 환경 적용 예시

해당 프로젝트를 기반하여, 실제 Go API 운영서버(linux apache 환경)에 CI/CD(TeamCity), GitHub를 활용하여  
GitHub main branch 에 push 가 있을때 Teamcity 에서 git pull 작업 후 deploy.sh 을 실행시켜 무중단 배포 환경을 구성하였습니다.
