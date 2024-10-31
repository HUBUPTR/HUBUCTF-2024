FROM ghcr.io/hubuptr/hubuctf-2024/php:alpine-7.4


# 信息
LABEL Organization="HUMARS-CTF" Author="St4rry"

# 复制文件
COPY files /tmp/files/

# 复制源码
COPY src /var/www/html/

# 运行命令
RUN chown -R root:root /var/www/html/ && \
    chmod 755 /var/www/html && \
    mv /tmp/files/init.sh / && \
    chmod +x /init.sh && \
    rm -rf /tmp/files

# 暴露端口
EXPOSE 80

# 环境变量
ENV FLAG=flag{test}

# 启动命令
CMD [ "/init.sh" ]
