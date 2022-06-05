package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryDTO;

import java.util.List;

public interface BreweryDao {

    List<Brewery> getAllBreweries();

    Brewery getBreweryByID(long id);

    int getBreweryIdByUserName(String name);

    boolean createBrewery(long brewer_id, String name);

    Brewery updateBreweryDetails (BreweryDTO updatedBrewery);

    long getBreweryByBeerId(long beerId);
}
