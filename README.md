# nginx-s3-proxy

deploy

```bash
cp .env.example .env
# edit `.env` file to set up environments.

docker-compose up -d
```

test with custom script

```bash
export AWS_ACCESS_KEY_ID="<your_access_key_id>"
export AWS_SECRET_ACCESS_KEY="<your_secret_access_key>"
./s3-get.sh <bucket> <region> <object-path> <outfile>
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

# request modified presigned url with curl
curl -vv $(aws s3 presign <bucket>/<object-path> --region <region> | perl -pe 's,https://.*?amazonaws\.com,http://localhost:8040,g') -o <outfile>

```
