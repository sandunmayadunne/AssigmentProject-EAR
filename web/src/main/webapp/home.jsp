<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 6/9/2025
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Home</title></head>
<body>
<h2>Welcome, ${sessionScope.user.username}</h2>
<a href="logout">Logout</a>
</body>
</html>
