package lk.sandun.ee.ejb;

import jakarta.ejb.Stateless;
import lk.sandun.ee.core.dto.BidUpdate;

@Stateless
public class AuctionUpdateReceiver {
    public void receiveUpdate(BidUpdate update) {
        System.out.println("Received update for Auction ID " + update.getAuctionId()
                + ": New Bid Amount = " + update.getNewBidAmount());
    }
}
