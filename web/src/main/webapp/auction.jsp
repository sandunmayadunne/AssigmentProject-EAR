<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 6/9/2025
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sandun.ee.core.model.Auction" %>
<%
  List<Auction> auctions = (List<Auction>) application.getAttribute("auctions");
  if (auctions == null) {
    auctions = new java.util.ArrayList<>();
  }
%>
<html>
<head>
  <title>Auctions</title>
</head>
<body>
<h2>Welcome, ${sessionScope.user.username}</h2>
<a href="logout">Logout</a>
<hr/>

<h3>Available Auctions</h3>
<% for (Auction auction : auctions) { %>
<div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
  <strong><%= auction.getTitle() %></strong><br/>
  <%= auction.getDescription() %><br/>
  Current Bid: <%= auction.getCurrentBid() %><br/>
  <form action="bid" method="post">
    <input type="hidden" name="auctionId" value="<%= auction.getId() %>" />
    <input type="text" name="bidAmount" placeholder="Enter your bid" required />
    <input type="submit" value="Place Bid" />
  </form>
</div>
<% } %>
</body>
</html>

