# 导入基础镜像
FROM ghcr.io/hubuptr/hubuctf-2024/python:alpine

# 信息
LABEL Organization="HUMARS-CTF" Author="St4rry"


RUN mkdir -p /app && \
    adduser -D -G www-data -s /bin/ash -h /app www-data

# Copy 源码到相应目录下。
COPY --chmod=500 --chown=www-data:www-data app.py /app/
COPY --chmod=500 --chown=www-data:www-data init.sh /init.sh

WORKDIR /app
USER www-data
# 暴露端口
# EXPOSE 8080


# 指定启动命令。
CMD ["/init.sh"]
