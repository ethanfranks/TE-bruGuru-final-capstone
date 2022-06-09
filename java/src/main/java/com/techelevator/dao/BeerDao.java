package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDao {

    List<Beer> getBeersByBreweryId(long id);

    boolean addBeer(long brewerId, String name, String description, double abv, String style,
                    String imgURL, String profile, boolean isAvailable);

    boolean updateBeer(String name, String description, double abv, String style,
                       String imgURL, String profile, long breweryId, boolean isAvailable, long beerId);

    List<Beer> getBeersBySearchParameters(String filter, String profile);

    List<Beer> getBeersBySearchParameters(String filter);

<<<<<<< HEAD
    Beer getBeerByBeerId(long id);
=======
    void deleteBeer(long id);
>>>>>>> 10cb37e35318adc1a3cc9c136b18a6072a65be61
}
