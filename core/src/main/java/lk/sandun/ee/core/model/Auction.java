package lk.sandun.ee.core.model;

import java.io.Serializable;

public class Auction implements Serializable {
    private Long id;
    private String title;
    private String description;
    private double currentBid;
    private String lastBidder;

    private static Long counter = 1L;

    public Auction(String title, String description) {
        this.id = counter++;
        this.title = title;
        this.description = description;
        this.currentBid = 0.0;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public double getCurrentBid() {
        return currentBid;
    }

    public void setCurrentBid(double currentBid) {
        this.currentBid = currentBid;
    }

    @Override
    public String toString() {
        return "Auction{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", currentBid=" + currentBid +
                '}';
    }

    public String getLastBidder() {
        return lastBidder;
    }

    public void setLastBidder(String lastBidder) {
        this.lastBidder = lastBidder;
    }
}
