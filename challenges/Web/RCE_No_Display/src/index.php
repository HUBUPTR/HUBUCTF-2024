<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="./static/styles.css">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form id="loginForm">
            <input type="text" id="username" placeholder="Username" required>
            <input type="password" id="password" placeholder="Password" required>
            <button type="submit" class="animated-button">Login</button>
        </form>
        <p id="errorMessage" style="color: red; display: none;">Invalid username or password</p>
    </div>

    <!-- 引入 CryptoJS 库 -->
    <script src="./static/crypto-js.min.js"></script>
    <script src="./static/script.js"></script>
</body>
</html>