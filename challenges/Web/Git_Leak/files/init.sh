#!/bin/sh

# export FLAG=HUBUMAR{4a956bb8-946c-11ef-8cf5-00155d84e62e}
export FLAG=$GZCTF_FLAG
# 在/app目录下创建一个名为.git的文件夹
cd /app
# 初始化git仓库
git init

# 创建一个名为flags的文件夹
mkdir flags
# 在flags文件夹下创建一个名为flag的文件
echo "flag{this_is_a_fake_flag}" >flags/fake_flag

# 配置git仓库的用户名和邮箱
git config --global user.email "jzcheng3@gmail.com"
git config --global user.name "k-0-i"
# 将flags文件夹添加到git仓库中
git add .
# 提交git仓库
git commit -m "init"
# 删除flags文件夹
rm -rf flags
# 将/app目录下的所有文件添加到git仓库中
git add .
# 提交git仓库
git commit -m "Remove Flag（X)"
# 第一部分flag 和 第二部分flag
flag_part1=$(echo $FLAG | cut -c 1-16)
flag_part2=$(echo $FLAG | cut -c 17-)
echo "part1:" "$flag_part1" >flag1
# 添加
git add .
# 提交
git commit -m "Add flag part 1"
# 删除
rm -f flag1
# flag is where
echo "Where is the flag?" >where_is_the_flag
# 添加
git add .
# 提交
git commit -m "Can u help me?!"
# 删除
rm -f where_is_the_flag
# 添加
git add .
# 提交
git commit -m "^_^   ^_^"
echo "flag is where" >where_is_the_flag.txt
# 添加
git add .
# 提交
git commit -m "Please help me!"
# 删除
rm -f where_is_the_flag.txt
# 添加
git add .
# 提交
git commit -m "^_^   ^_^ ~_~ ~_~"
# 使用git stash 隐藏第二部分flag
echo "part2:" "$flag_part2" >.flag.exe
echo "fake_flag{fake_flag}" >flag.txt
# 添加
git add .
# git stash
git stash save "Hide flag part 2"

echo "This_is_a_test" >test.txt
git add .
git stash save "Test  ^_^"

echo "OKay~ Enjoy it!" >game.txt
git add .
git commit -m "Game Start!"
rm -f game.txt
git add .
git commit -m "Game Over!"

rm -rf /tmp/files

unset FLAG
unset GZCTF_FLAG
python app.py
