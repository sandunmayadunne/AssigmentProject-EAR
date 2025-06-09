<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 6/9/2025
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create Auction</title>
</head>
<body>
<h2>Create a New Auction</h2>
<form action="create-auction" method="post">
  <label for="title">Title:</label>
  <input type="text" name="title" id="title" required /><br/><br/>

  <label for="description">Description:</label><br/>
  <textarea name="description" id="description" rows="4" cols="40" required></textarea><br/><br/>

  <input type="submit" value="Create Auction" />
</form>
<a href="auction.jsp">Back to Auction List</a>
</body>
</html>
