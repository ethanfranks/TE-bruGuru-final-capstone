package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Brewery {
    private long id;
    private String name;
    private String email;
    private String phoneNumber;
    private String igLink;
    private String fbLink;
    private String aboutUs;
    private String address;
    private String imageURL;
    private String gpsLocation;
    private boolean food;
    private List<Beer> offerings = new ArrayList<>();
    private List<BreweryReview> reviews = new ArrayList<>();

    public Brewery() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public boolean isFood() {
        return food;
    }

    public void setFood(boolean food) {
        this.food = food;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getIgLink() {
        return igLink;
    }

    public void setIgLink(String igLink) {
        this.igLink = igLink;
    }

    public String getFbLink() {
        return fbLink;
    }

    public void setFbLink(String fbLink) {
        this.fbLink = fbLink;
    }

    public String getAboutUs() {
        return aboutUs;
    }

    public void setAboutUs(String aboutUs) {
        this.aboutUs = aboutUs;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getGpsLocation() {
        return gpsLocation;
    }

    public void setGpsLocation(String gpsLocation) {
        this.gpsLocation = gpsLocation;
    }

    public List<Beer> getOfferings() {
        return offerings;
    }

    public void setOfferings(List<Beer> offeringList) {
        this.offerings = offeringList;
    }

    public List<BreweryReview> getReviews() {
        return reviews;
    }

    public void setReviews(List <BreweryReview> reviews) {
        this.reviews = reviews;
    }
}
