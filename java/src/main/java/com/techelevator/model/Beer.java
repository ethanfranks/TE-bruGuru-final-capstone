package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Beer {
    private long id;
    private long breweryId;
    private String name;
    private String description;
    private double abv;
    private String imageURL;
    private String style;
    private String profile;
    private boolean isAvailable;
    private double averageRating;
    private List<BeerReview> reviews = new ArrayList<>();

    public String getDescription() {
        return description;
    }

    public void setAverageRating() {
        double sum = 0;
        for(BeerReview index : reviews){
            sum += index.getBeerRating();
        }
        this.averageRating= sum / reviews.size();
    }

    public double getAverageRating() {
      return this.averageRating;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getAbv() {
        return abv;
    }

    public void setAbv(double abv) {
        this.abv = abv;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public Beer() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(long breweryId) {
        this.breweryId = breweryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public List<BeerReview> getReviews() {
        return reviews;
    }

    public void setReviews(List<BeerReview> reviews) {
        this.reviews = reviews;
    }
}
