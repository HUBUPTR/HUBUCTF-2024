#!/bin/sh

# 有自定义 FLAG 脚本则需要执行它，这里是从环境变量获取 FLAG，则需要 source 来执行这个脚本从而改写环境变量，避免费预期解

export FLAG=$GZCTF_FLAG
echo $FLAG >/f1ag_1s_h3r3

unset FLAG
unset GZCTF_FLAG

echo '*       *       *       *       *       sh /usr/local/bin/reset_script.sh' >>/var/spool/cron/crontabs/root
crond

php-fpm -D
nginx -g 'daemon off;'
