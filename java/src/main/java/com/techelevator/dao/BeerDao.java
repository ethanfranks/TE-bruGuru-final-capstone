package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDao {

    List<Beer> getBeersByBreweryId(long id);

    boolean addBeer(String name, String description, double abv, String style,
                    String imgURL, String profile, long breweryId, boolean isAvailable);

    boolean updateBeer(String name, String description, double abv, String style,
                       String imgURL, String profile, long breweryId, boolean isAvailable, long beerId);

}
