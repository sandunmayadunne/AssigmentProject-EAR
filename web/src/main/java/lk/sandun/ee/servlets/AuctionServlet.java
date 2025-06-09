package lk.sandun.ee.servlets;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.sandun.ee.core.model.Auction;
import lk.sandun.ee.ejb.AuctionManager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/create-auction")
public class AuctionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Auction auction = new Auction(title, description); // adjust constructor as needed

        ServletContext context = getServletContext();
        List<Auction> auctions = (List<Auction>) context.getAttribute("auctions");
        if (auctions == null) {
            auctions = new ArrayList<>();
        }
        auctions.add(auction);
        context.setAttribute("auctions", auctions);

        response.sendRedirect("auction.jsp");
    }
}

