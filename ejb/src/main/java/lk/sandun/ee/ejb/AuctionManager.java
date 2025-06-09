package lk.sandun.ee.ejb;

import jakarta.ejb.Stateless;
import lk.sandun.ee.core.model.Auction;

import java.util.ArrayList;
import java.util.List;

@Stateless
public class AuctionManager {

    private final List<Auction> auctions = new ArrayList<>();

    public void createAuction(Auction auction) {
        auctions.add(auction);
    }

    public List<Auction> getAllAuctions() {
        return auctions;
    }

    public Auction findAuctionById(Long id) {
        return auctions.stream()
                .filter(a -> a.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

}
