#!/usr/bin/env sh
set -eu

echo "S3 bucket : ${S3_BUCKET}" 
envsubst '${S3_BUCKET}' < /etc/nginx/conf.d/s3_proxy.conf.template > /etc/nginx/conf.d/s3_proxy.conf
