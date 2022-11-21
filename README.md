# nginx-s3-proxy

deploy

```bash
docker-compose up -d
```

test

```bash
aws --endpoint-url http://127.0.0.1:8040 s3 ls
./s3-get.sh <bucket> <region> <object-key> <output-path>
```

