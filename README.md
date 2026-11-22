## Шаблон для третьего ДЗ по ИПР

Условие дз доступно по [ссылке](https://github.com/Nikfilk2030/missing_semester_hse_cs/blob/main/2026/amcs/year_1/hw_3/README.md)

# 4 балла
```
2026-11-22 16:39:00,555 listening port=8000 storage=sqlite
2026-11-22T16:39:11.340151467Z 2026-11-22 16:39:11,339 http 192.168.65.1 "GET / HTTP/1.1" 200 -
2026-11-22T16:39:11.355028550Z 2026-11-22 16:39:11,354 http 192.168.65.1 "POST /increment HTTP/1.1" 200 -
2026-11-22T16:39:11.366556550Z 2026-11-22 16:39:11,366 http 192.168.65.1 "GET /readyz HTTP/1.1" 200 -
2026-11-22T16:39:12.584626509Z 2026-11-22 16:39:12,584 http 192.168.65.1 "GET / HTTP/1.1" 200 -
2026-11-22T16:39:12.599559134Z 2026-11-22 16:39:12,599 http 192.168.65.1 "POST /increment HTTP/1.1" 200 -
2026-11-22T16:39:12.610885468Z 2026-11-22 16:39:12,610 http 192.168.65.1 "GET /readyz HTTP/1.1" 200 -
```

# 6 баллов
```
hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, bro!", "count": 10, "hostname": "c1f69c0a06a4", "storage": "sqlite"}%                                                                                         hw_3_template ❯ docker compose stop
[+] stop 1/1
 ✔ Container app Stopped                                                                                                                                                      10.2s
hw_3_template ❯ docker compose up                                
Attaching to app
app  | 2026-11-22 17:05:53,980 listening port=8000 storage=sqlite
hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, bro!", "count": 11, "hostname": "c1f69c0a06a4", "storage": "sqlite"}%                                                                                         hw_3_template ❯ 
```

## 8 баллов
``` 
hw_3_template ❯ docker compose up -d
[+] up 5/5
 ✔ Network hw_3_template_default   Created                                                                                                                                     0.0s
 ✔ Volume hw_3_template_volume     Created                                                                                                                                     0.0s
 ✔ Volume hw_3_template_redis_data Created                                                                                                                                     0.0s
 ✔ Container redis                 Started                                                                                                                                     0.1s
 ✔ Container app                   Started                                                                                                                                     0.1s
hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, bro!", "count": 1, "hostname": "bb0cb325b636", "storage": "redis"}%                                                                                           hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, bro!", "count": 2, "hostname": "bb0cb325b636", "storage": "redis"}%                                                                                           hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, bro!", "count": 3, "hostname": "bb0cb325b636", "storage": "redis"}%                                                                                           hw_3_template ❯ docker compose down
[+] down 1/2
[+] down 3/3 redis Removed                                                                                                                                                     0.2s
 ✔ Container redis               Removed                                                                                                                                       0.2s
 ✔ Container app                 Removed                                                                                                                                      10.2s
 ✔ Network hw_3_template_default Removed                                                                                                                                       0.2s
hw_3_template ❯ docker compose down
hw_3_template ❯ docker compose up -d                             
[+] up 3/3
 ✔ Network hw_3_template_default Created                                                                                                                                       0.0s
 ✔ Container redis               Started                                                                                                                                       0.1s
 ✔ Container app                 Started                                                                                                                                       0.1s
hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/         
curl: (22) The requested URL returned error: 404
hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080/
{"greeting": "Hello, bro!", "count": 3, "hostname": "8746f4c2f4f6", "storage": "redis"}%                                                                                           hw_3_template ❯ docker compose stop redis
[+] stop 1/1
 ✔ Container redis Stopped                                                                                                                                                     0.2s
hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080/
curl: (22) The requested URL returned error: 503
hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080/heathz
curl: (22) The requested URL returned error: 404
hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080 /healthz
curl: (22) The requested URL returned error: 503
curl: (3) URL rejected: No host part in the URL
hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080/healthz 
{"status": "alive"}%                                                                                                                                                               hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080/healthz
{"status": "alive"}%                                                                                                                                                               hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080/readyz 
curl: (22) The requested URL returned error: 503
hw_3_template ❯ docker compose start redis
[+] start 1/1
 ✔ Container redis Started                                                                                                                                                     0.1s
hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080/readyz 
{"status": "ready", "storage": "redis"}%                                                                                                                                           hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080         
{"greeting": "Hello, bro!", "count": 3, "hostname": "8746f4c2f4f6", "storage": "redis"}%                                                                                           hw_3_template ❯ curl -fsS -X GET http://127.0.0.1:8080
{"greeting": "Hello, bro!", "count": 3, "hostname": "8746f4c2f4f6", "storage": "redis"}%                                                                                           hw_3_template ❯ 
hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, bro!", "count": 4, "hostname": "0739eacbda34", "storage": "redis"}%     
hw_3_template ❯ docker compose down redis                        
[+] down 2/2
 ✔ Container redis               Removed                                                                                                        0.2s
 ! Network hw_3_template_default Resource is still in use                                                                                       0.0s
hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/increment
curl: (22) The requested URL returned error: 503
hw_3_template ❯ 
hw_3_template ❯ docker compose up -d redis
[+] up 1/1
 ✔ Container redis Started                                                                                                                      0.1s
hw_3_template ❯ curl -fsS -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, bro!", "count": 5, "hostname": "0739eacbda34", "storage": "redis"}%                                                            hw_3_template ❯ 
```
