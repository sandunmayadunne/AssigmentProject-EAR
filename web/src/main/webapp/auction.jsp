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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auction Dashboard</title>
    <style>
        :root {
            --primary: #1a2a6c;
            --secondary: #b21f1f;
            --accent: #ffd700;
            --dark: #121212;
            --light: #f8f9fa;
            --success: #28a745;
            --danger: #dc3545;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, var(--primary), var(--secondary), var(--primary));
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            min-height: 100vh;
            color: white;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .welcome {
            font-size: 1.8rem;
            color: var(--accent);
            text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
        }

        .logout-btn {
            padding: 10px 25px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid var(--accent);
            border-radius: 50px;
            color: var(--accent);
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background: var(--accent);
            color: var(--dark);
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.5);
        }

        .card {
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2, h3 {
            color: var(--accent);
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        h2::after, h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 3px;
            background: linear-gradient(90deg, var(--accent), transparent);
            border-radius: 3px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.8);
        }

        input[type="text"],
        textarea,
        input[type="number"] {
            width: 100%;
            padding: 15px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            color: white;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        textarea:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
            background: rgba(255, 255, 255, 0.15);
        }

        textarea {
            min-height: 120px;
            resize: vertical;
        }

        .btn {
            padding: 14px 30px;
            background: linear-gradient(45deg, #ff8c00, var(--accent));
            border: none;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            color: var(--dark);
            display: inline-block;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
        }

        .auction-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .auction-card {
            background: rgba(0, 0, 0, 0.6);
            border-radius: 15px;
            padding: 25px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .auction-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--accent), var(--secondary));
        }

        .auction-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
            border-color: rgba(255, 215, 0, 0.3);
        }

        .auction-title {
            font-size: 1.3rem;
            margin-bottom: 10px;
            color: var(--accent);
        }

        .auction-meta {
            display: flex;
            justify-content: space-between;
            margin: 15px 0;
            padding: 15px 0;
            border-top: 1px dashed rgba(255, 255, 255, 0.1);
            border-bottom: 1px dashed rgba(255, 255, 255, 0.1);
        }

        .meta-item {
            text-align: center;
        }

        .meta-label {
            font-size: 0.8rem;
            color: rgba(255, 255, 255, 0.6);
            display: block;
        }

        .meta-value {
            font-weight: 600;
            color: white;
        }

        .current-bid {
            color: var(--accent);
            font-size: 1.2rem;
        }

        .bid-form {
            margin-top: 20px;
        }

        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .form-row input {
            flex: 1;
        }

        .message {
            padding: 12px;
            border-radius: 8px;
            margin: 15px 0;
            font-weight: 500;
            text-align: center;
            animation: fadeIn 0.5s ease-out;
        }

        .success {
            background: rgba(40, 167, 69, 0.2);
            border-left: 4px solid var(--success);
            color: #b2ffc3;
        }

        .error {
            background: rgba(220, 53, 69, 0.2);
            border-left: 4px solid var(--danger);
            color: #ffb2b2;
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 1.1rem;
            grid-column: 1 / -1;
        }

        @media (max-width: 768px) {
            .auction-grid {
                grid-template-columns: 1fr;
            }

            .form-row {
                flex-direction: column;
                gap: 10px;
            }

            header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1 class="welcome">Welcome, ${sessionScope.user.username}</h1>
        <a href="logout" class="logout-btn">Logout</a>
    </header>

    <!-- Create Auction Section -->
    <div class="card">
        <h2>Create New Auction</h2>
        <form action="create-auction" method="post">
            <div class="form-group">
                <label for="title">Auction Title</label>
                <input type="text" name="title" id="title" required placeholder="Enter auction title">
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea name="description" id="description" required placeholder="Describe the item being auctioned"></textarea>
            </div>

            <button type="submit" class="btn">Create Auction</button>
        </form>
    </div>

    <!-- Available Auctions Section -->
    <div class="card">
        <h2>Available Auctions</h2>

        <% if (auctions.isEmpty()) { %>
        <div class="empty-state">
            <p>No auctions available right now. Create one to get started!</p>
        </div>
        <% } else { %>
        <div class="auction-grid">
            <% for (Auction auction : auctions) {
                String idStr = String.valueOf(auction.getId());
            %>
            <div class="auction-card">
                <h3 class="auction-title"><%= auction.getTitle() %></h3>
                <p><%= auction.getDescription() %></p>

                <div class="auction-meta">
                    <div class="meta-item">
                        <span class="meta-label">Current Bid</span>
                        <span class="meta-value current-bid">$<%= auction.getCurrentBid() %></span>
                    </div>
                    <div class="meta-item">
                        <span class="meta-label">Last Bidder</span>
                        <span class="meta-value"><%= (auction.getLastBidder() == null || auction.getLastBidder().trim().isEmpty()) ? "None" : auction.getLastBidder() %></span>
                    </div>
                </div>

                <form class="bid-form" action="bid" method="post">
                    <input type="hidden" name="auctionId" value="<%= auction.getId() %>">

                    <div class="form-row">
                        <input type="text" name="bidderName" placeholder="Your name" required>
                        <input type="number" name="bidAmount" placeholder="Bid amount" min="<%= auction.getCurrentBid() + 1 %>" step="0.01" required>
                    </div>

                    <button type="submit" class="btn">Place Bid</button>
                </form>

                <% if (msgAuctionId != null && msgAuctionId.equals(idStr)) { %>
                <% if (success != null) { %>
                <div class="message success"><%= success %></div>
                <% } else if (error != null) { %>
                <div class="message error"><%= error %></div>
                <% } %>
                <% } %>
            </div>
            <% } %>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>