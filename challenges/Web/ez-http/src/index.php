<?php
# 初始化设置一个Cookie，HUBUMARS=False
setcookie("HUBUMARS", "False");
include_once("fl4g.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>湖北大学网络空间安全协会招新</title>
</head>
<body>
<?php

if (isset($_GET['name'])) {
    echo "你的名字是：" . $_GET['name']."<br>";
} else {
    die("使用GET方法传递参数name，值为你的名字");
    // echo "<br>";
}

if (isset($_POST['age'])) {
    echo "你的年龄是：" . $_POST['age']."<br>";
} else {
    die("使用POST方法传递参数age，值为你的年龄");
    // echo "<br>";
}

if (isset($_SERVER['HTTP_USER_AGENT']) && $_SERVER['HTTP_USER_AGENT'] == "HUBUMARS") {
    echo "你的浏览器是：" . $_SERVER['HTTP_USER_AGENT']."<br>";
    // echo $flag;
} else {
    die("需要你使用HUBUMARS专属的浏览器进行访问</br>你现在使用的浏览器是：" . $_SERVER['HTTP_USER_AGENT']);
}

if (isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER'] == "http://hubumars.com/") {
    echo "你的来源是：" . $_SERVER['HTTP_REFERER']."<br>";
    // echo $flag;
} else {
    die("需要你从http://hubumars.com/访问</br>你现在的来源是：" . $_SERVER['HTTP_REFERER']);
}

if (isset($_COOKIE['HUBUMARS']) && $_COOKIE['HUBUMARS'] == "True") {
    echo "欢迎协会成员<br>";
    // echo $flag;
} else {
    die("接下来的内容只有HUBUMARS成员才能访问，你需要先加入湖北大学网络空间安全协会</br>");
}


if (isset($_SERVER['HTTP_CLIENT_IP']) && $_SERVER['HTTP_CLIENT_IP'] == "11.45.1.4"){
    echo "你的IP地址符合条件</br>";
}
else {
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
        die("你不会只知道X-Forwarded-For吧？<br>");
    } 
    die("请通过IP （11.45.1.4）访问");
}

// 重定向
echo "<script>window.location.href = './n3wp493.php';</script>";
?>



</body>
</html>