# Import Base Image
FROM ghcr.io/hubuptr/hubuctf-2024/php:alpine-7.4

LABEL Organization="HUMARS-CTF" Author="St4rry"

COPY files /tmp/files/
COPY files/reset_script.sh /usr/local/bin/reset_script.sh

# 拷贝源码到相应目录下。
COPY src /var/www/html/

# 执行命令，设置权限，安装依赖等。
RUN chown -R root:root /var/www/html/ && \
    chmod 755 /var/www/html && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 777 {} \; && \
    mv /tmp/files/start.sh / && \
    chmod +x /start.sh && \
    chmod +x /usr/local/bin/reset_script.sh

RUN apk update && \
    apk add iputils && \
    apk add vim && \
    rm -rf /tmp/files

# 指定启动命令。
CMD /start.sh

ENV GZCTF_FLAG HUBUMARS{test}

# 暴露端口。
EXPOSE 80