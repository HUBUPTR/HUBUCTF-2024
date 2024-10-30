# 基础镜像
FROM ghcr.io/hubuptr/hubuctf-2024/php:alpine-7.4

# 信息
LABEL Organization="HUMARS-CTF" Author="St4rry"

# 复制文件到临时目录
COPY files/ /tmp/files/

# 复制源码到web目录下
COPY src/ /var/www/html/

# 运行命令，设置权限
RUN chown -R root:root /var/www/html/ && \
    chmod 755 /var/www/html && \
    mv /tmp/files/init.sh / && \
    chmod +x /init.sh && \
    rm -rf /tmp/files

# 启动命令
CMD ["/init.sh"]

# 暴露端口
EXPOSE 80
