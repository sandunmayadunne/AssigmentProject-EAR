package lk.sandun.ee.core.dto;

import java.io.Serializable;

public class BidUpdate implements Serializable {
    private Long auctionId;
    private Double newBidAmount;

    public BidUpdate() {
    }

    public BidUpdate(Long auctionId, Double newBidAmount) {
        this.auctionId = auctionId;
        this.newBidAmount = newBidAmount;
    }

    public Long getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(Long auctionId) {
        this.auctionId = auctionId;
    }

    public Double getNewBidAmount() {
        return newBidAmount;
    }

    public void setNewBidAmount(Double newBidAmount) {
        this.newBidAmount = newBidAmount;
    }
}
