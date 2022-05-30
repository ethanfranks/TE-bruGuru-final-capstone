package com.techelevator.controller;


import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(path = "/breweries")
public class BreweryController {

    @Autowired
    //Google API service. Handles Geolocation of new Breweries
    GeoLocationServiceImpl geoLocationService = new GeoLocationServiceImpl("${gmaps.api.key}");

    @Autowired
    BreweryDao breweryDao;

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public List<Brewery> getAllBreweries() {
        return breweryDao.getAllBreweries();
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Brewery getBreweryById(@PathVariable long id){
        return breweryDao.getBreweryByID(id);
    }

    @PostMapping(path="/breweries")
    public Brewery addNewBrewery(@RequestBody BreweryDTO breweryDTO){
        Brewery newBrewery = new Brewery();
        return newBrewery;
    }

}
