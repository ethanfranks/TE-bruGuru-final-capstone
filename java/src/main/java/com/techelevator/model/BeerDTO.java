package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.techelevator.dao.BeerDao;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.security.Principal;

public class BeerDTO {

    private BeerDao beerDao;
    private Principal principal;

    @JsonProperty("beer_id")
    private long id;
    @NotNull
    @JsonProperty("brewery_id")
    private long breweryId;
    @NotEmpty
    @JsonProperty("beer_name")
    private String name;
    @JsonProperty("beer_description")
    private String description;
    @JsonProperty("beer_abv")
    private double abv;
    @JsonProperty("image_url")
    private String imageURL;
    @JsonProperty("beer_style")
    private String style;
    @JsonProperty("flavor_profile")
    private String profile;
    @JsonProperty("beer_available")
    private boolean isAvailable;

    public BeerDTO() {
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

    public String getDescription() {
        return description;
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
}
