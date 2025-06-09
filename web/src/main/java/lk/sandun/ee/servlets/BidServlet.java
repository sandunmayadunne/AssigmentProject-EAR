package lk.sandun.ee.servlets;

import jakarta.ejb.EJB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sandun.ee.core.model.Auction;
import lk.sandun.ee.ejb.AuctionManager;
import lk.sandun.ee.services.BidManager;

import java.io.IOException;

@WebServlet("/bid")
public class BidServlet extends HttpServlet {
    @EJB
    private AuctionManager auctionManager;

    @EJB
    private BidManager bidManager;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long auctionId = Long.parseLong(req.getParameter("auctionId"));
        double bidAmount = Double.parseDouble(req.getParameter("bidAmount"));

        Auction auction = auctionManager.findAuctionById(auctionId);
        if (auction != null) {
            bidManager.placeBid(auction, bidAmount);
        }

        resp.sendRedirect("auction.jsp");
    }
}