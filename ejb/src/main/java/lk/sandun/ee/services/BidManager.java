package lk.sandun.ee.services;

import jakarta.ejb.Stateless;
import lk.sandun.ee.core.model.Auction;

@Stateless
public class BidManager {
    public void placeBid(Auction auction, double amount) {
        if (amount > auction.getCurrentBid()) {
            auction.setCurrentBid(amount);
        }
    }
}
