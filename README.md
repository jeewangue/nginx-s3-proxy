# nginx-s3-proxy

deploy

```bash
docker-compose up -d
```

test

```bash
./s3-get.sh <bucket> <region> <object-path> <output-path>
```

test with `aws-cli`

```bash
aws s3 presign <bucket>/<object-path> --region <region>

# output: https://<bucket>.s3.<region>.amazonaws.com/<object-path>?
#           X-Amz-Algorithm=AWS4-HMAC-SHA256&
#           X-Amz-Credential=xxxxxxxx&
#           X-Amz-Date=20221201T112841Z&
#           X-Amz-Expires=3600&
#           X-Amz-SignedHeaders=host&
#           X-Amz-Signature=xxxxxxxx

# replace the host with proxy address
aws s3 presign <bucket>/<object-path> --region <region> | perl -pe 's,https://.*?amazonaws\.com,http://localhost:8040,g'

# output: http://localhost:8040/<object-path>?
#           X-Amz-Algorithm=AWS4-HMAC-SHA256&
#           X-Amz-Credential=xxxxxxxx&
#           X-Amz-Date=20221201T112841Z&
#           X-Amz-Expires=3600&
#           X-Amz-SignedHeaders=host&
#           X-Amz-Signature=xxxxxxxx

# request with curl
curl -vv $(aws s3 presign <bucket>/<object-path> --region <region> | perl -pe 's,https://.*?amazonaws\.com,http://localhost:8040,g') -o <outfile>

```
