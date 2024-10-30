# RCE - Level 2

**分类:** Web | HTTP协议

**难度:** ⭐

**Author:** St4rry

> 一些简单的http协议的请求你知道吗？

> flag 格式为`HUBUMARS{flag}`

## 知识点

命令执行,无回显

## WriteUp

GET请求: `?name=YourName`

Post 请求: `age=YourAge`

浏览器: `User-Agent:HUBUMARS`

来自: `Referer:https://hubumars.com/`

Cookie: `Cookie:HUBUMARS=True`

伪造IP： `X-Forwarded-For`行不通，试试其他的, `Client-IP:11.45.1.4`
