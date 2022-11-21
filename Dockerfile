FROM nginx

# Copy our configuration files
COPY ./etc/nginx /etc/nginx/
COPY ./docker-entrypoint.d /docker-entrypoint.d/

VOLUME ["/etc/nginx", "/var/cache/nginx"]
EXPOSE 80

