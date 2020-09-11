# Using a compact OS
FROM nginx:latest

MAINTAINER Wenqiang Feng <wenqiang.feng@cstack.io>

# Add 2048 stuff into Nginx server
COPY . /usr/share/nginx/html

RUN cd /usr/share/nginx/html && chmod -R 755

EXPOSE 80

# Start Nginx and keep it running background and start php
CMD sed -i "s/ContainerID: /ContainerID: "$(hostname)"/g" /usr/share/nginx/html/index.html && nginx -g "daemon off;"
