#!/usr/bin/env sh
set -eu

echo "S3 bucket : ${S3_BUCKET}" 
echo "S3 region : ${S3_REGION}" 

envsubst '${S3_BUCKET},${S3_REGION}' < /etc/nginx/conf.d/s3_proxy.conf.template > /etc/nginx/conf.d/s3_proxy.conf
