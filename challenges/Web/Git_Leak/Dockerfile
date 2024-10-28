FROM ghcr.io/hubuptr/hubuctf-2024/python:alpine


LABEL Organization="HUMARS-CTF" Author="St4rry"

COPY files /tmp/files/

RUN mkdir -p /app && \ 
    pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple flask && \
    adduser -D -G www-data -s /bin/ash -h /app www-data && \
    apk update && \
    apk add git && \
    mv /tmp/files/init.sh / && \
    chmod +x /init.sh

COPY --chmod=500 --chown=www-data:www-data src/app.py /app/


WORKDIR /app
USER www-data

EXPOSE 5000
# 指定启动命令。
CMD ["/init.sh"]