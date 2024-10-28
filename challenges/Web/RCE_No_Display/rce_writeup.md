# RCE - Level 2

**分类:** Web | RCE

**难度:** ⭐⭐⭐

**Author:** St4rry

> 小 S 发现这个网站存在命令执行漏洞,但是似乎没有回显,你能帮助小 S 找到 flag 吗?

> flag 格式为`HUBUMARS{flag}`

## 知识点

命令执行,无回显

## WriteUp

无回显命令执行
方法一:
可以把运行的结果写入可读的文件中,然后访问这个文件进行读取

方法二:
利用 curl 访问自己的 web 服务器,将结果发送到自己的 web 服务器上
或者使用 dnslog 平台,进行数据外带

在源码找到文件 script.js,里面包含用户名和密码 hash 值
用户名: `aHVidW1hcnM=`, base64 解码得到 hubumars

密码: `ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f`,密码的 sha256,使用[cmd5](https://cmd5.com/)解密得到密码 password123

登陆后跳转到 cmd.php, 尝试命令拼接

可以把运行结果重定向到 static/script.js 中,然后访问这个文件进行读取

```
127.0.0.1;ls >> /static/script.js
```
