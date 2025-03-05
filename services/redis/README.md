## Redis CLI 로 접속

```sh
docker exec -it event_redis redis-cli
```
Redis 컨테이너 내부에서 redis-cli를 실행하여 접속할 수 있습니다

```sh
auth pwd
```
비밀번호를 설정했으므로, Redis CLI에 접속한 후 인증을 해야 합니다.  
성공하면 OK가 출력됩니다.
