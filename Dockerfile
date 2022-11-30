# syntax=docker/dockerfile:1.4
FROM nginx:1.23-alpine

# Copy our configuration files
COPY ./etc/nginx /etc/nginx/
COPY ./docker-entrypoint.d /docker-entrypoint.d/

