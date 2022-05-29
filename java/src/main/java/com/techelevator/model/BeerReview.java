package com.techelevator.model;

public class BeerReview {
    private long userId;
    private String reviewerUsername;
    private long beerId;
    private int beerRating;
    private int breweryId;

    public BeerReview() {
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getReviewerUsername() {
        return reviewerUsername;
    }

    public void setReviewerUsername(String reviewerUsername) {
        this.reviewerUsername = reviewerUsername;
    }

    public long getBeerId() {
        return beerId;
    }

    public void setBeerId(long beerId) {
        this.beerId = beerId;
    }

    public int getBeerRating() {
        return beerRating;
    }

    public void setBeerRating(int beerRating) {
        this.beerRating = beerRating;
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }
}
