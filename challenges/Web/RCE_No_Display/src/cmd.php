<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ping Test</title>
</head>
<body>
    <h1>Ping Test</h1>
    <form method="post" action="">
        <label for="address">Enter Domain or IP Address:</label>
        <input type="text" id="address" name="address" required>
        <input type="submit" value="Ping">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $address = $_POST["address"];
        echo "<h2>Ping Results for $address:</h2>";
        // Execute the ping command and check the return status
        $output = shell_exec("ping -c 2 $address");
        if (preg_match("/bash|sh|python|nc|php|perl/i", $address)) {
            die("休想反弹shell");
        }
        
        if ($output) {
            echo "<p>执行成功</p>";
        } else {
            echo "<p>执行失败</p>";
        }
    }
    ?>
</body>
</html>