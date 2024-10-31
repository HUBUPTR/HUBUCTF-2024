#!/bin/sh

random=$((RANDOM % 100 + 1))

target=$random

str0="PCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KPGhlYWQ+CiAgICA8bWV0YSBjaGFyc2V0PSJ1dGYtOCI+CiAgICA8dGl0bGU+NTAyIEJhZCBHYXRld2F5PC90aXRsZT4KPC9oZWFkPgo8Ym9keT4KICAgIDxoMT41MDIgQmFkIEdhdGV3YXk8L2gxPgogICAgPHA+VGhlIHNlcnZlciByZWNlaXZlZCBhbiBpbnZhbGlkIHJlc3BvbnNlIGZyb20gdGhlIHVwc3RyZWFtIHNlcnZlci48L3A+CjwvYm9keT4KPC9odG1sPg=="

str1="PCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KPGhlYWQ+CiAgICA8bWV0YSBjaGFyc2V0PSJ1dGYtOCI+CiAgICA8dGl0bGU+NTAzIFNlcnZpY2UgVW5hdmFpbGFibGU8L3RpdGxlPgo8L2hlYWQ+Cjxib2R5PgogICAgPGgxPjUwMyBTZXJ2aWNlIFVuYXZhaWxhYmxlPC9oMT4KICAgIDxwPlRoZSBzZXJ2ZXIgaXMgY3VycmVudGx5IHVuYWJsZSB0byBoYW5kbGUgdGhlIHJlcXVlc3QgZHVlIHRvIHRlbXBvcmFyeSBvdmVybG9hZCBvciBtYWludGVuYW5jZS48L3A+CjwvYm9keT4KPC9odG1sPg=="

str2="PCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KPGhlYWQ+CiAgICA8bWV0YSBjaGFyc2V0PSJ1dGYtOCI+CiAgICA8dGl0bGU+NDAyIFBheW1lbnQgUmVxdWlyZWQ8L3RpdGxlPgo8L2hlYWQ+Cjxib2R5PgogICAgPGgxPjQwMiBQYXltZW50IFJlcXVpcmVkPC9oMT4KICAgIDxwPlBheW1lbnQgaXMgcmVxdWlyZWQgdG8gYWNjZXNzIHRoaXMgcmVzb3VyY2UuPC9wPgo8L2JvZHk+CjwvaHRtbD4="

str3="PCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KPGhlYWQ+CiAgICA8bWV0YSBjaGFyc2V0PSJ1dGYtOCI+CiAgICA8dGl0bGU+NDAxIFVuYXV0aG9yaXplZDwvdGl0bGU+CjwvaGVhZD4KPGJvZHk+CiAgICA8aDE+NDAxIFVuYXV0aG9yaXplZDwvaDE+CiAgICA8cD5BdXRoZW50aWNhdGlvbiBpcyByZXF1aXJlZCB0byBhY2Nlc3MgdGhpcyByZXNvdXJjZS48L3A+CjwvYm9keT4KPC9odG1sPg=="

for i in $(seq 0 99); do
    if [ $(($i % 4)) -eq 0 ]; then
        echo $str0 | base64 -d >flag$i.php
    elif [ $(($i % 4)) -eq 1 ]; then
        echo $str1 | base64 -d >flag$i.php
    elif [ $(($i % 4)) -eq 2 ]; then
        echo $str2 | base64 -d >flag$i.php
    else
        echo $str3 | base64 -d >flag$i.php
    fi
done

# 第一个题目
echo "PD9waHAKCmVjaG8gImZpbGU/IOS9oOiDveaDs+WIsOS7gOS5iD8iOwppZiAoaXNzZXQoJF9HRVRbJ2ZpbGUnXSkpIHsKICAgIGlmIChwcmVnX21hdGNoKCcvZmlsdGVyLycsICRfR0VUWydmaWxlJ1
0pKSB7CiAgICAgICAgaW5jbHVkZSgkX0dFVFsnZmlsZSddKTsKICAgIH0gZWxzZSB7CiAgICAgICAgZWNobyAi5aSa6K+V6K+V5ZCn5oCd6Lev5piv5a+555qEIjsKICAgIH0KfSBlbHNlIHsKICAgIGVjaG8gImZpbGUg6ZyA6K
aB5Lyg6YCSIjsKfQoKPz4=" | base64 -d >flag$target.php

random=$((RANDOM % 100 + 1))

target=$random

# 第二个题目

echo "PD9waHAKCmhpZ2hsaWdodF9maWxlKF9fRklMRV9fKTsKZXJyb3JfcmVwb3J0aW5nKDApOwppZiAocHJlZ19tYXRjaCgnL2Jhc2U2NHxodHRwLycsICRfR0VUWydmaWxlJ10pKSB7CiAgICBkaWUoJ2Jhc2U2NCB8IGh0dHAgaXMgbm90IGFsbG93ZWQnKTsKfSBlbHNlIHsKICAgIGVjaG8gImZsYWcgaW4gZmxhZy5waHAiOwp9CgppbmNsdWRlICRfR0VUWydmaWxlJ107Cj8+" | base64 -d >flag$target.php

# FLAG
echo '<?php $flag=' "\"$FLAG\"" ';?>' >flag.php

unset FLAG

# 启动服务
php-fpm -D
nginx -g 'daemon off;'
