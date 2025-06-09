package lk.sandun.ee.servlets;

import jakarta.ejb.EJB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.sandun.ee.core.model.Auction;
import lk.sandun.ee.ejb.AuctionManager;

import java.io.IOException;

@WebServlet("/create-auction")
public class AuctionServlet extends HttpServlet {
    @EJB
    private AuctionManager auctionManager;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");

        Auction auction = new Auction();
        auction.setTitle(title);
        auction.setDescription(description);
        auction.setCurrentBid(0.0);

        auctionManager.createAuction(auction);
        resp.sendRedirect("auction.jsp");
    }
}
