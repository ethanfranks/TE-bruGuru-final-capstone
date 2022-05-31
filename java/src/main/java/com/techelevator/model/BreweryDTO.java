package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.techelevator.dao.BreweryDao;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

public class BreweryDTO {

    // Added all variables from the brewery object
    // Required brewer_id and name at minimum w/ @NotNull and @NotEmpty
    // Changes made by Ethan and Chris 5/30 @2:08PM CT
    private BreweryDao breweryDao;
    private Principal principal;

    @JsonProperty("brewery_id")
    private long id;
    @JsonProperty("user_id")
    @NotNull
    private long brewer_id;
    @JsonProperty("brewery_name")
    @NotEmpty
    private String name;
    private String email;
    @JsonProperty("phone")
    private String phoneNumber;
    @JsonProperty("ig_link")
    private String igLink;
    @JsonProperty("fb_link")
    private String fbLink;
    @JsonProperty("about_us")
    private String aboutUs;
    @JsonProperty("street_address")
    private String address;
    @JsonProperty("img_url")
    private String imageURL;
    // QUESTION: The database has a column for latitude and for longitude.
    // Do we need to change this in our brewery object?
    private Location gpsLocation;
    @JsonProperty("googleplaceid")
    private String googlePlaceId;
    @JsonProperty("food_available")
    private boolean food;
    private List<Beer> offerings = new ArrayList<>();
    private List<BreweryReview> reviews = new ArrayList<>();

    // Constructor for Creating Breweries
    public BreweryDTO(long brewer_id, String name) {
        this.brewer_id = brewer_id;
        this.name = name;
    }

   // Getters & Setters
    public BreweryDao getBreweryDao() {
        return breweryDao;
    }

    public void setBreweryDao(BreweryDao breweryDao) {
        this.breweryDao = breweryDao;
    }

    public Principal getPrincipal() {
        return principal;
    }

    public void setPrincipal(Principal principal) {
        this.principal = principal;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getBrewer_id() {
        return brewer_id;
    }

    public void setBrewer_id(long brewer_id) {
        this.brewer_id = brewer_id;
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

    public Location getGpsLocation() {
        return gpsLocation;
    }

    public void setGpsLocation(Location gpsLocation) {
        this.gpsLocation = gpsLocation;
    }

    public String getGooglePlaceId() {
        return googlePlaceId;
    }

    public void setGooglePlaceId(String googlePlaceId) {
        this.googlePlaceId = googlePlaceId;
    }

    public boolean isFood() {
        return food;
    }

    public void setFood(boolean food) {
        this.food = food;
    }

    public List<Beer> getOfferings() {
        return offerings;
    }

    public void setOfferings(List<Beer> offerings) {
        this.offerings = offerings;
    }

    public List<BreweryReview> getReviews() {
        return reviews;
    }

    public void setReviews(List<BreweryReview> reviews) {
        this.reviews = reviews;
    }
}
