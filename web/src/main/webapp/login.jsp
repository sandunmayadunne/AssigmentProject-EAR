<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 6/9/2025
  Time: 12:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Auction System</title>
</head>
<body>
<h2>Login</h2>
<form method="post" action="login">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required /><br/><br/>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required /><br/><br/>

    <input type="submit" value="Login" />
</form>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
</body>
</html>
