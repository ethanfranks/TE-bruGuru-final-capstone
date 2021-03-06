package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonSetter;
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
    private Location gpsLocation;
    @JsonProperty("googleplaceid")
    private String googlePlaceId;
    @JsonProperty("food_available")
    private boolean food;
    @JsonProperty("sunday_hours")
    private String sundayHours;
    @JsonProperty("monday_hours")
    private String mondayHours;
    @JsonProperty("tuesday_hours")
    private String tuesdayHours;
    @JsonProperty("wednesday_hours")
    private String wednesdayHours;
    @JsonProperty("thursday_hours")
    private String thursdayHours;
    @JsonProperty("friday_hours")
    private String fridayHours;
    @JsonProperty("saturday_hours")
    private String saturdayHours;

    // Constructor for Creating Breweries
    public BreweryDTO() {
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

    public void setBrewer_id(String brewer_id) {
        this.brewer_id = Long.parseLong(brewer_id);
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

    public void setBrewer_id(long brewer_id) {
        this.brewer_id = brewer_id;
    }

    public String getSundayHours() {
        return sundayHours;
    }

    public void setSundayHours(String sundayHours) {
        this.sundayHours = sundayHours;
    }

    public String getMondayHours() {
        return mondayHours;
    }

    public void setMondayHours(String mondayHours) {
        this.mondayHours = mondayHours;
    }

    public String getTuesdayHours() {
        return tuesdayHours;
    }

    public void setTuesdayHours(String tuesdayHours) {
        this.tuesdayHours = tuesdayHours;
    }

    public String getWednesdayHours() {
        return wednesdayHours;
    }

    public void setWednesdayHours(String wednesdayHours) {
        this.wednesdayHours = wednesdayHours;
    }

    public String getThursdayHours() {
        return thursdayHours;
    }

    public void setThursdayHours(String thursdayHours) {
        this.thursdayHours = thursdayHours;
    }

    public String getFridayHours() {
        return fridayHours;
    }

    public void setFridayHours(String fridayHours) {
        this.fridayHours = fridayHours;
    }

    public String getSaturdayHours() {
        return saturdayHours;
    }

    public void setSaturdayHours(String saturdayHours) {
        this.saturdayHours = saturdayHours;
    }

    @Override
    public String toString() {
        return "BreweryDTO{" +
                "breweryDao=" + breweryDao +
                ", principal=" + principal +
                ", id=" + id +
                ", brewer_id=" + brewer_id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", igLink='" + igLink + '\'' +
                ", fbLink='" + fbLink + '\'' +
                ", aboutUs='" + aboutUs + '\'' +
                ", address='" + address + '\'' +
                ", imageURL='" + imageURL + '\'' +
                ", gpsLocation=" + gpsLocation +
                ", googlePlaceId='" + googlePlaceId + '\'' +
                ", food=" + food +
                ", sundayHours='" + sundayHours + '\'' +
                ", mondayHours='" + mondayHours + '\'' +
                ", tuesdayHours='" + tuesdayHours + '\'' +
                ", wednesdayHours='" + wednesdayHours + '\'' +
                ", thursdayHours='" + thursdayHours + '\'' +
                ", fridayHours='" + fridayHours + '\'' +
                ", saturdayHours='" + saturdayHours + '\'' +
        '}';
    }
}
