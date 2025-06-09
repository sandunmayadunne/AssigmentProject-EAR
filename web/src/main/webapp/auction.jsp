<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sandun.ee.core.model.Auction" %>
<%
    List<Auction> auctions = (List<Auction>) application.getAttribute("auctions");
    if (auctions == null) {
        auctions = new java.util.ArrayList<>();
    }

    String success = request.getParameter("success");
    String error = request.getParameter("error");
    String msgAuctionId = request.getParameter("auctionId");
%>
<html>
<head>
    <title>Auction System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .auction-box {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .form-section {
            margin-bottom: 40px;
        }
        .message {
            font-weight: bold;
            padding: 6px;
            border-radius: 4px;
            margin-top: 10px;
        }
        .success { color: green; }
        .error { color: red; }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h2>Welcome, ${sessionScope.user.username}</h2>
<a href="logout">Logout</a>

<!-- Create Auction -->
<div class="form-section">
    <h3>Create New Auction</h3>
    <form action="create-auction" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" required />

        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4" required></textarea>

        <input type="submit" value="Create Auction" />
    </form>
</div>

<!-- Available Auctions -->
<h3>Available Auctions</h3>
<% if (auctions.isEmpty()) { %>
<p>No auctions available right now.</p>
<% } else {
    for (Auction auction : auctions) {
        String idStr = String.valueOf(auction.getId());
%>
<div class="auction-box">
    <strong>Title:</strong> <%= auction.getTitle() %><br/>
    <strong>Description:</strong> <%= auction.getDescription() %><br/>
    <strong>Current Bid:</strong> $<%= auction.getCurrentBid() %><br/>
    <strong>Last Bidder:</strong> <%= (auction.getLastBidder() == null || auction.getLastBidder().trim().isEmpty()) ? "None" : auction.getLastBidder() %><br/>

    <form action="bid" method="post">
        <input type="hidden" name="auctionId" value="<%= auction.getId() %>" />
        <input type="text" name="bidderName" placeholder="Your name" required />
        <input type="text" name="bidAmount" placeholder="Enter your bid" required />
        <input type="submit" value="Place Bid" />
    </form>

    <% if (msgAuctionId != null && msgAuctionId.equals(idStr)) { %>
    <% if (success != null) { %>
    <div class="message success"><%= success %></div>
    <% } else if (error != null) { %>
    <div class="message error"><%= error %></div>
    <% } %>
    <% } %>
</div>
<% } } %>

</body>
</html>
