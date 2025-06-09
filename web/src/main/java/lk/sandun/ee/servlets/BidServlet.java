package lk.sandun.ee.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sandun.ee.core.model.Auction;

import java.io.IOException;
import java.util.List;

@WebServlet("/bid")
public class BidServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int auctionId;
        double bidAmount;
        String bidderName = request.getParameter("bidderName");

        try {
            auctionId = Integer.parseInt(request.getParameter("auctionId"));
            bidAmount = Double.parseDouble(request.getParameter("bidAmount"));
        } catch (NumberFormatException e) {
            response.sendRedirect("auction.jsp?auctionId=" + request.getParameter("auctionId") + "&error=Invalid input");
            return;
        }

        ServletContext context = getServletContext();
        List<Auction> auctions = (List<Auction>) context.getAttribute("auctions");

        if (auctions != null) {
            for (Auction auction : auctions) {
                if (auction.getId() == auctionId) {
                    if (bidAmount > auction.getCurrentBid()) {
                        auction.setCurrentBid(bidAmount);
                        auction.setLastBidder(bidderName);
                        context.setAttribute("auctions", auctions);
                        response.sendRedirect("auction.jsp?success=Bid placed&auctionId=" + auctionId);
                    } else {
                        response.sendRedirect("auction.jsp?error=Bid must be higher&auctionId=" + auctionId);
                    }
                    return;
                }
            }
        }

        response.sendRedirect("auction.jsp?auctionId=" + auctionId + "&error=Auction not found");
    }
}
